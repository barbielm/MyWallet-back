import supertest from 'supertest';
import app from '../src/app.js';
import pg from 'pg';

const {Pool} = pg;

const connection = new Pool({
    user: 'postgres',
    password: '12345',
    host: 'localhost',
    port: 5432,
    database: 'mywallet'
});

describe('POST /sign-in', () => {
    it("returns 200 for valid params", async () => {
        const body = {email: "gabriel@email.com", password:"1234"};
        const result = await supertest(app).post('/sign-in').send(body);
        const deactivateUser = await connection.query(`UPDATE users SET active = $1 WHERE email = $2`,[false, body.email]);
        const deleteToken = await connection.query(`DELETE FROM sessions USING users WHERE sessions."userId" = users.id AND users.email = $1`,[body.email]);
        expect(result.status).toEqual(200);
    })
    it("returns 404 for unvalid params", async () => {
        const body = {email: "fulano@email", password:"1234"};
        const result = await supertest(app).post('/sign-in').send(body);
        expect(result.status).toEqual(404);
    })
})

describe('POST /sign-up', () => {
    it("returns 201 for valid params", async () => {
        const body = {name:"fulano", email: "fulano@email.com", password:"1234", confirmPassword: "1234"};
        const result = await supertest(app).post('/sign-up').send(body);
        const deleteTestUser = await connection.query(`DELETE FROM users WHERE email = $1`,[body.email]);
        expect(result.status).toEqual(201);
    })
    it("returns 400 for unvalid params", async () => {
        const body = {name: "gabriel", email: "gabriel@email.com", password:"1234", confirmPassword:"1234"};
        const result = await supertest(app).post('/sign-up').send(body);
        expect(result.status).toEqual(400);
    })
})

