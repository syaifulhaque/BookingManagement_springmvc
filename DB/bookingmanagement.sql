--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.10
-- Dumped by pg_dump version 9.4.10
-- Started on 2017-07-29 00:28:25 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 176 (class 1259 OID 33962)
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE booking (
    book_id integer NOT NULL,
    customer_name character varying,
    book_timestamp timestamp without time zone,
    total_passenger integer,
    flight_id integer
);


ALTER TABLE booking OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 33965)
-- Name: booking_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE booking_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE booking_book_id_seq OWNER TO postgres;

--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 177
-- Name: booking_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE booking_book_id_seq OWNED BY booking.book_id;


--
-- TOC entry 179 (class 1259 OID 33978)
-- Name: flight; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE flight (
    flight_id integer NOT NULL,
    flight_name character varying,
    source character varying,
    destination character varying,
    flight_class character varying,
    flight_charges numeric(14,2),
    seats integer,
    departure_time timestamp without time zone,
    arrival_time timestamp without time zone
);


ALTER TABLE flight OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 33976)
-- Name: flight_flight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE flight_flight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flight_flight_id_seq OWNER TO postgres;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 178
-- Name: flight_flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE flight_flight_id_seq OWNED BY flight.flight_id;


--
-- TOC entry 180 (class 1259 OID 33992)
-- Name: seq_booking_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_booking_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_booking_id OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 33937)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying,
    password character varying,
    image character varying
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 33935)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 174
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2166 (class 2604 OID 33967)
-- Name: book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY booking ALTER COLUMN book_id SET DEFAULT nextval('booking_book_id_seq'::regclass);


--
-- TOC entry 2167 (class 2604 OID 33981)
-- Name: flight_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flight ALTER COLUMN flight_id SET DEFAULT nextval('flight_flight_id_seq'::regclass);


--
-- TOC entry 2165 (class 2604 OID 33940)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2286 (class 0 OID 33962)
-- Dependencies: 176
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (1, 'Egi', '2017-09-09 00:00:00', 1, 1);
INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (12, 'arif', '2017-07-28 16:09:14.7', 5, 1);
INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (13, 'asep', '2017-07-28 16:57:26.508', 2, 1);
INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (14, 'PLASW', '2017-07-28 23:43:31.308', 2, 2);
INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (15, 'A', '2017-07-28 23:45:31.886', 1, 2);
INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (16, 'GERRY', '2017-07-28 23:52:31.486', 1, 1);
INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (17, 'gii', '2017-07-28 23:59:37.853', 3, 2);
INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (18, 'swe', '2017-07-29 00:07:16.584', 1, 1);
INSERT INTO booking (book_id, customer_name, book_timestamp, total_passenger, flight_id) VALUES (19, 'j', '2017-07-29 00:10:39.385', 1, 2);


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 177
-- Name: booking_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('booking_book_id_seq', 19, true);


--
-- TOC entry 2289 (class 0 OID 33978)
-- Dependencies: 179
-- Data for Name: flight; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO flight (flight_id, flight_name, source, destination, flight_class, flight_charges, seats, departure_time, arrival_time) VALUES (1, 'Egi Air', 'MJL', 'JKT', 'ECO', 100000.00, 30, '2017-09-09 00:00:00', '2017-09-09 01:00:00');
INSERT INTO flight (flight_id, flight_name, source, destination, flight_class, flight_charges, seats, departure_time, arrival_time) VALUES (2, 'Cargo GA', 'JKT', 'SBY', 'CAR', 1000000.00, 16, '2017-08-10 12:00:00', '2017-08-10 15:00:00');


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 178
-- Name: flight_flight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('flight_flight_id_seq', 3, true);


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 180
-- Name: seq_booking_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_booking_id', 1, false);


--
-- TOC entry 2285 (class 0 OID 33937)
-- Dependencies: 175
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, username, password, image) VALUES (1, 'Egi', 'LqNVZM6V/LzmF2kl4bd+yg==', 'assets/resources/images/icons/user.png');


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 174
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 2171 (class 2606 OID 33975)
-- Name: booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (book_id);


--
-- TOC entry 2173 (class 2606 OID 33986)
-- Name: flight_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY flight
    ADD CONSTRAINT flight_pkey PRIMARY KEY (flight_id);


--
-- TOC entry 2169 (class 2606 OID 33945)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 33987)
-- Name: booking_flight_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY booking
    ADD CONSTRAINT booking_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES flight(flight_id);


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-07-29 00:28:25 WIB

--
-- PostgreSQL database dump complete
--

