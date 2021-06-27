import express from 'express';
import cors from 'cors';
import pg from 'pg';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

const app = express();
app.use(cors());
app.use(express.json());

const {Pool} = pg;

const connection = new Pool({
    user: 'postgres',
    password: '12345',
    host: 'localhost',
    port: 5432,
    database: 'mywallet'
});

app.post('/sign-in', async (req,res) => {
    const {email, password} = req.body;
    const user = await connection.query(`SELECT * FROM users WHERE email = $1`,[email]);
    
    if(!!user.rows[0] && bcrypt.compareSync(password, user.rows[0].password)){
        const onlineUser = await connection.query(`UPDATE users SET active = $1 WHERE id = $2`,[true, user.rows[0].id]);
        const token = uuid();
        const newToken = await connection.query(`INSERT INTO sessions("userId", token) VALUES ($1,$2)`,[user.rows[0].id, token]);
        const userInformation = {token, user: user.rows[0]}
        res.send(userInformation);
    } else {
        res.sendStatus(404);
    }

})

app.post('/sign-up', async (req,res) => {
    try {
        const {email, password, name} = req.body;
        const hashPassword = bcrypt.hashSync(password, 10);
        const checkUser = await connection.query(`SELECT * FROM users WHERE email = $1`, [email]);
        if(!checkUser.rows[0]){
            const newUser = await connection.query(`INSERT INTO users(name,email,password,active) VALUES ($1,$2,$3,$4)`,[name, email, hashPassword, false]);
            res.sendStatus(201);
        } else {
            res.sendStatus(400);
        }

    } catch {
        res.sendStatus(400);
    }
})


app.listen(4000, () => console.log(`server listening on port 4000`));