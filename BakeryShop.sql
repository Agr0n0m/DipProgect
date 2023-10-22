--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-10-22 19:20:34

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
-- TOC entry 215 (class 1259 OID 82070)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 82069)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 217 (class 1259 OID 82077)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 82076)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 219 (class 1259 OID 82084)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 82083)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 221 (class 1259 OID 82091)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 82090)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 223 (class 1259 OID 82100)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    title text NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 82110)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 82109)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 222 (class 1259 OID 82099)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3198 (class 2604 OID 82073)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 82080)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 82087)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 82094)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 82103)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 82113)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 82070)
-- Dependencies: 215
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Хлеб');
INSERT INTO public.category (id, name) VALUES (2, 'Пироги');
INSERT INTO public.category (id, name) VALUES (3, 'Торты');


--
-- TOC entry 3370 (class 0 OID 82077)
-- Dependencies: 217
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, '4f967458-2e0d-40cd-bac7-a90e5587062b.tort-brusnichnyj-s-belym-shokoladom-kopiya-1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, 'e953ab2d-7054-4c75-9b7e-6571885f52f3.tort-brusnichnyj-s-belym-shokoladom-kopiya-3.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '73191d6d-d813-4c5e-b47a-390c9eefd0cc.tort-brusnichnyj-s-belym-shokoladom-kopiya-2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, 'c7017b6f-855e-4bec-b754-cfc61a53d847.tort-brusnichnyj-s-belym-shokoladom-kopiya-0.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, '8b95d547-bf99-4a63-9248-6d7ea4f58344.tort-brusnichnyj-s-belym-shokoladom-kopiya-4.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, 'a947ec78-c6d7-4e83-8ba1-9182911d5b59.tort-mandarinovyj-s-merengoj-2-1.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '7e28888c-7c80-4fae-9fba-c68c88a4a384.tort-mandarinovyj-s-merengoj-2-3.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, 'b7eb4785-a9b5-4d44-a4f5-b152e309fd51.tort-mandarinovyj-s-merengoj-2-4.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, 'bb477b0b-c894-4cb7-910a-2ecd33782ce8.tort-mandarinovyj-s-merengoj-2-0 (1).jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, 'aa503951-d5c9-4419-9c30-f4f3bdb2032e.tort-mandarinovyj-s-merengoj-2-2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, 'f8bcc485-35f3-4121-ad00-d988b342ce9a.vishnevyj-pirog-1.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '0002f8c5-e5f3-4c04-a8ee-debd9dac96b7.vishnevyj-pirog-2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '308d4959-0830-495d-a45f-fed9d244680e.vishnevyj-pirog-4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, 'f6e56c3f-fe3c-46a7-a155-8e84729a2866.vishnevyj-pirog-3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '1cc3bf32-3d10-448b-ad9d-8a422bf525d2.vishnevyj-pirog-2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '6254b62c-0f47-46cb-9d19-baf42a5c50b1.hleb-chiabatta-2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, '69418d54-acae-44df-adf5-c93baef36961.hleb-chiabatta-0.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, 'a4726d8e-cbd1-45ed-b4a2-2ceb0a7dce67.hleb-chiabatta-1.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, 'c67a2be1-0905-4b6d-97f0-e2e7ecfa3c63.hleb-chiabatta-3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '63940e37-6c15-49ae-b1ae-9ecb521712d4.chiabatta-220-g-0.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'ceddc92b-5d3c-4a76-8b8f-418301170499.baget-s-chesnochnoj-nachinkoj-2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'b581a882-d346-417d-855c-470b0eb9a5d2.baget-s-chesnochnoj-nachinkoj-0.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '73927032-524a-442b-89d8-d01d6fcf42b0.baget-s-chesnochnoj-nachinkoj-1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '6c4707e0-ac9c-416f-bf3a-be1de94a44e8.baget-s-chesnochnoj-nachinkoj-2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '0043c44a-fdad-479c-998e-98d1087af655.baget-s-chesnochnoj-nachinkoj-0.jpg', 5);


--
-- TOC entry 3372 (class 0 OID 82084)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2023-10-20 11:38:31.103913', '345d3a3c-b00c-47f8-a7ef-657c736876ff', 150, 1, 2, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-10-20 11:38:31.14381', '345d3a3c-b00c-47f8-a7ef-657c736876ff', 1250, 1, 2, 1);


--
-- TOC entry 3374 (class 0 OID 82091)
-- Dependencies: 221
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$Y3Skgro10aRyw0myDr2t1OabpvPmXb4twCWGRjqOrRn.j0AaYxA7q', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$S4bcP0RKnTwZA4TyESbJoukRbX/NSkA8SZyifY/4Rd2iScyxL57/a', 'ROLE_USER');


--
-- TOC entry 3376 (class 0 OID 82100)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, title, category_id) VALUES (1, '2023-10-19 15:21:37.360883', 'Пирог с брусничной начинкой и начинкой из белого шоколада, брусникой, взбитыми сливками, украшенный белом шоколадом и клюквой.', 1250, 'Торт брусничный с белым шоколадом', 3);
INSERT INTO public.product (id, date_time, description, price, title, category_id) VALUES (2, '2023-10-19 15:24:27.830087', 'Песочный корж, конфитюр из марокканских мандаринов с цедрой, нежный заварной крем с бурбонской ванилью и воздушная меренга.', 990, 'Торт мандариновый с меренгой', 3);
INSERT INTO public.product (id, date_time, description, price, title, category_id) VALUES (3, '2023-10-19 15:41:39.398378', 'Брюссельский вишневый пирог с начинкой из свежих вишен.', 1540, 'Вишневый пирог', 2);
INSERT INTO public.product (id, date_time, description, price, title, category_id) VALUES (4, '2023-10-19 19:40:54.829212', 'Классический пористый хлеб из пшеничной муки высшего сорта', 150, 'Хлеб Чиабатта', 1);
INSERT INTO public.product (id, date_time, description, price, title, category_id) VALUES (5, '2023-10-19 19:42:08.291833', 'Французский багет с начинкой из чесночного масла.', 99, 'Багет с чесночной начинкой', 1);


--
-- TOC entry 3378 (class 0 OID 82110)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 25, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 2, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 4, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 5, true);


--
-- TOC entry 3206 (class 2606 OID 82075)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 82082)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 82089)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 82098)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 82115)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 82108)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 82117)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3220 (class 2606 OID 82123)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3222 (class 2606 OID 82133)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3221 (class 2606 OID 82128)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3219 (class 2606 OID 82118)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3223 (class 2606 OID 82143)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3224 (class 2606 OID 82138)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-10-22 19:20:34

--
-- PostgreSQL database dump complete
--

