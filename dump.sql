--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extracts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.extracts (
    id integer NOT NULL,
    value integer,
    description text,
    date date,
    "isDeposit" boolean,
    "userId" integer
);


--
-- Name: extracts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.extracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: extracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.extracts_id_seq OWNED BY public.extracts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token uuid
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    email text,
    password text,
    active boolean
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: extracts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.extracts ALTER COLUMN id SET DEFAULT nextval('public.extracts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: extracts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.extracts VALUES (1, 150, 'salgado', '2021-06-27', false, 1);
INSERT INTO public.extracts VALUES (2, 15000, 'aluguel', '2021-06-28', true, 1);
INSERT INTO public.extracts VALUES (3, 1600, 'escola', '2021-06-27', false, 1);
INSERT INTO public.extracts VALUES (4, 170000, 'feira', '2021-06-27', false, 1);
INSERT INTO public.extracts VALUES (5, 150000, 'salário', '2021-06-27', true, 1);
INSERT INTO public.extracts VALUES (8, 10000000, 'viagens', '2021-06-28', true, 7);
INSERT INTO public.extracts VALUES (9, 2000000, 'salário', '2021-06-28', true, 7);
INSERT INTO public.extracts VALUES (10, 1293793, 'festas', '2021-06-28', false, 7);
INSERT INTO public.extracts VALUES (21, 159978, 'salário', '2021-06-28', true, 3);
INSERT INTO public.extracts VALUES (22, 1, 'café', '2021-06-28', false, 3);
INSERT INTO public.extracts VALUES (23, 1, 'min', '2021-06-28', true, 3);
INSERT INTO public.extracts VALUES (24, 100000, 'bonûs', '2021-06-28', true, 3);
INSERT INTO public.extracts VALUES (25, 300000, 'pimba', '2021-06-28', false, 3);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (13, 1, '18053c1a-7cdf-4bfd-b649-f86d4320cb2c');
INSERT INTO public.sessions VALUES (14, 1, '6e7b01ec-4a79-42e4-a960-bf944d3e70a7');
INSERT INTO public.sessions VALUES (15, 1, '7c8520d9-9e97-4fee-ba96-0bd66aa6a8fc');
INSERT INTO public.sessions VALUES (16, 1, '42164ba7-9cc6-4da4-917b-bb23a3e6ec14');
INSERT INTO public.sessions VALUES (17, 1, '42d206cc-2f85-4d12-93c6-ad542efdb95e');
INSERT INTO public.sessions VALUES (18, 1, 'becce40d-aab0-41e7-a9c4-05d3330c8f4b');
INSERT INTO public.sessions VALUES (19, 1, '25594913-058f-4e83-92b3-3efe25b58d14');
INSERT INTO public.sessions VALUES (20, 1, 'f528969b-2829-4d28-8d77-322d14b2a14d');
INSERT INTO public.sessions VALUES (21, 1, '9fc85a34-0c14-4573-b3dd-65e868f96e20');
INSERT INTO public.sessions VALUES (22, 1, '52a67972-9ca9-430c-a37b-2d6396705bef');
INSERT INTO public.sessions VALUES (23, 1, 'eacd9ad4-dc46-4044-ad7d-5cef8b9db113');
INSERT INTO public.sessions VALUES (24, 1, 'f21a04e3-164f-47ad-849b-b02bcd6ce5de');
INSERT INTO public.sessions VALUES (25, 1, 'ffea2d5e-d821-4351-9455-18ab1f15daa2');
INSERT INTO public.sessions VALUES (26, 1, '849c27a8-ece5-4bb6-9989-18ce66f02d6b');
INSERT INTO public.sessions VALUES (27, 1, '8fbe286c-84b2-43ca-aab2-94b5bc9c7079');
INSERT INTO public.sessions VALUES (28, 1, 'ca05ff0a-7da5-4a16-ba91-ace909549a81');
INSERT INTO public.sessions VALUES (29, 1, '81b552ad-2479-4eea-92e5-83fbb3c17490');
INSERT INTO public.sessions VALUES (30, 1, 'c2a4b7e6-0465-41ce-9879-8813d5b8dad3');
INSERT INTO public.sessions VALUES (31, 1, '632cade1-49aa-4efd-a8d8-20b10812cc60');
INSERT INTO public.sessions VALUES (32, 1, 'cd0a6379-b64e-4f29-b512-adf8858b3939');
INSERT INTO public.sessions VALUES (33, 1, '8229bb60-9d63-4eb6-aede-3f9187757962');
INSERT INTO public.sessions VALUES (34, 1, 'd0721403-dd58-4f9b-825a-0dd15ee4e4ab');
INSERT INTO public.sessions VALUES (35, 1, '6f68c557-487c-4e6b-98a4-29f402f270b0');
INSERT INTO public.sessions VALUES (36, 1, '2b6347c2-c154-4b94-9e48-127dc97e6eda');
INSERT INTO public.sessions VALUES (37, 1, '6100b7ad-a928-4a73-82ca-527205f4c0cc');
INSERT INTO public.sessions VALUES (39, 1, 'e1560c43-a1b5-4c40-9612-d6212b608719');
INSERT INTO public.sessions VALUES (40, 1, 'ce509175-a563-4e68-867e-8560a5622b0c');
INSERT INTO public.sessions VALUES (41, 1, '20c3c075-46c5-4237-adf9-c7993b71c778');
INSERT INTO public.sessions VALUES (42, 2, 'd8e6a42d-2dbd-4c2c-89cc-ba5329fac5ce');
INSERT INTO public.sessions VALUES (43, 1, 'b5a4a351-8905-4b4f-91f5-9687aa0925f7');
INSERT INTO public.sessions VALUES (44, 2, '8c03b468-c726-4a07-b4fb-7b50c03d4b59');
INSERT INTO public.sessions VALUES (45, 1, 'e480acfa-41c0-421a-837e-3f1d5fdd022a');
INSERT INTO public.sessions VALUES (46, 2, '86098017-6da3-4157-b74b-5a66107eb090');
INSERT INTO public.sessions VALUES (47, 1, '06021875-bf9e-4893-9917-78f5418bebd8');
INSERT INTO public.sessions VALUES (48, 2, 'e3dd24d3-037a-41ef-958e-3fb92e1e2fb6');
INSERT INTO public.sessions VALUES (49, 1, 'd795763a-78bd-4442-aeb3-a0665392c80d');
INSERT INTO public.sessions VALUES (50, 2, 'cb69257a-0569-4db4-9b4b-9890212e3593');
INSERT INTO public.sessions VALUES (52, 3, '36054377-4140-4799-bd21-34479eb7c06a');
INSERT INTO public.sessions VALUES (53, 3, 'e2fe47d2-7c0a-44ee-ace6-7111e200fa2f');
INSERT INTO public.sessions VALUES (54, 3, 'e53ebee2-0f7b-42a4-9d8b-feddd9b87ce6');
INSERT INTO public.sessions VALUES (55, 3, 'f738c8a6-7eb8-4c06-8797-bf2d32cb486c');
INSERT INTO public.sessions VALUES (56, 3, '99442644-abbb-46d4-8049-4598302fbe28');
INSERT INTO public.sessions VALUES (57, 3, 'f7d18b67-4225-4e6a-9253-5ffbcf862a58');
INSERT INTO public.sessions VALUES (58, 7, '1ae24cbe-b99f-441b-aa80-b83e302e7a48');
INSERT INTO public.sessions VALUES (60, 3, '48bf2712-fb72-4a99-b58b-2e3029b06ed2');
INSERT INTO public.sessions VALUES (62, 7, '759fb88e-a566-4308-a0f1-7cff470743ef');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (3, 'Gabriel', 'gabriel@email.com', '$2b$10$hde9B8u1ZDrqunFStLJMDOV9TZawHqxOKxQ0i96nC84JxKFe1MOOK', false);
INSERT INTO public.users VALUES (7, 'ronaldinho', 'ronaldinho@email.com', '$2b$10$Ge94gs58TkZCg/sm/flHtuu06bdwzc9rYSRItP3scRpOcpz1s4lKe', true);


--
-- Name: extracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.extracts_id_seq', 25, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 62, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- PostgreSQL database dump complete
--

