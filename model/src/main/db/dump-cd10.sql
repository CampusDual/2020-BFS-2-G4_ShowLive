--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-02-03 12:42:17

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

DROP DATABASE cd10;
--
-- TOC entry 3100 (class 1262 OID 16403)
-- Name: cd10; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE cd10 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect cd10

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 197 (class 1259 OID 37319)
-- Name: artist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist (
    artist_id integer NOT NULL,
    artist_name character varying NOT NULL,
    twitter_link character varying,
    instagram_link character varying,
    twitch_link character varying,
    youtube_link character varying,
    spotify_link character varying
);


--
-- TOC entry 196 (class 1259 OID 37317)
-- Name: artist_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 196
-- Name: artist_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_artist_id_seq OWNED BY public.artist.artist_id;


--
-- TOC entry 199 (class 1259 OID 37344)
-- Name: artist_concert; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_concert (
    artist_concert_id integer NOT NULL,
    concert_id integer NOT NULL,
    artist_id integer NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 37342)
-- Name: artist_concert_artist_concert_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_concert_artist_concert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 198
-- Name: artist_concert_artist_concert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_concert_artist_concert_id_seq OWNED BY public.artist_concert.artist_concert_id;


--
-- TOC entry 201 (class 1259 OID 37354)
-- Name: artist_genre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_genre (
    artist_genre_id integer NOT NULL,
    artist_id integer NOT NULL,
    genre_id integer NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 37352)
-- Name: artist_genre_artist_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_genre_artist_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 200
-- Name: artist_genre_artist_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_genre_artist_genre_id_seq OWNED BY public.artist_genre.artist_genre_id;


--
-- TOC entry 203 (class 1259 OID 37364)
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    comments_id integer NOT NULL,
    concert_id integer NOT NULL,
    name_comment character varying NOT NULL,
    date_comment date,
    content text
);


--
-- TOC entry 202 (class 1259 OID 37362)
-- Name: comments_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 202
-- Name: comments_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_comments_id_seq OWNED BY public.comments.comments_id;


--
-- TOC entry 205 (class 1259 OID 37375)
-- Name: concert; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.concert (
    concert_id integer NOT NULL,
    location_id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    duration integer NOT NULL,
    description text NOT NULL,
    add_date date NOT NULL,
    views_count integer,
    is_streaming boolean,
    concert_name character varying(255),
    ticketea_link character varying(255)
);


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN concert.add_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.concert.add_date IS 'fecha de añadición del concierto';


--
-- TOC entry 204 (class 1259 OID 37373)
-- Name: concert_concert_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.concert_concert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 204
-- Name: concert_concert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.concert_concert_id_seq OWNED BY public.concert.concert_id;


--
-- TOC entry 207 (class 1259 OID 37390)
-- Name: config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.config (
    config_id integer NOT NULL,
    facebook_link character varying,
    twitter_link character varying,
    instagram_link character varying,
    path_artist_images character varying,
    path_concerts_images character varying
);


--
-- TOC entry 206 (class 1259 OID 37388)
-- Name: config_config_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.config_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 206
-- Name: config_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.config_config_id_seq OWNED BY public.config.config_id;


--
-- TOC entry 209 (class 1259 OID 37401)
-- Name: genre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    genre_name character varying NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 37399)
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 208
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;


--
-- TOC entry 211 (class 1259 OID 37414)
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    location_name character varying,
    addres character varying,
    city character varying,
    province character varying,
    zip_code integer,
    capacity integer,
    streaming_concert_url character varying
);


--
-- TOC entry 210 (class 1259 OID 37412)
-- Name: location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.location_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 210
-- Name: location_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.location_location_id_seq OWNED BY public.location.location_id;


--
-- TOC entry 219 (class 1259 OID 69826)
-- Name: ti18n; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n (
    id_i18n integer NOT NULL,
    class_name character varying(150),
    i18n_description character varying(250)
);


--
-- TOC entry 220 (class 1259 OID 69831)
-- Name: ti18n_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n_value (
    id_i18n_value integer NOT NULL,
    id_i18n integer NOT NULL,
    "KEY" character varying(250),
    es_es character varying(255),
    en_us character varying(255),
    gl_es character varying(255)
);


--
-- TOC entry 216 (class 1259 OID 69802)
-- Name: trequest_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trequest_statistics (
    id_request_statistics integer NOT NULL,
    service_name character varying(255),
    method_name character varying(50),
    user_name character varying(50),
    execution_date date,
    execution_time integer,
    method_params character varying(5000),
    service_exception character varying(5000)
);


--
-- TOC entry 213 (class 1259 OID 69774)
-- Name: trole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole (
    id_rolename integer NOT NULL,
    rolename character varying(255),
    xmlclientpermission character varying(255)
);


--
-- TOC entry 221 (class 1259 OID 69839)
-- Name: trole_server_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole_server_permission (
    id_role_server_permission integer NOT NULL,
    id_rolename integer,
    id_server_permission integer
);


--
-- TOC entry 215 (class 1259 OID 69797)
-- Name: tserver_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tserver_permission (
    id_server_permission integer NOT NULL,
    permission_name character varying(255)
);


--
-- TOC entry 217 (class 1259 OID 69810)
-- Name: tsetting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tsetting (
    id_setting integer NOT NULL,
    setting_key character varying(255),
    setting_value character varying(255),
    setting_comment character varying(255)
);


--
-- TOC entry 212 (class 1259 OID 69767)
-- Name: tuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser (
    user_ character varying(50) NOT NULL,
    password character varying(50),
    name character varying(50),
    surname character varying(50),
    email character varying(50),
    nif character varying(50),
    userblocked timestamp without time zone,
    lastpasswordupdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    firstlogin boolean DEFAULT true
);


--
-- TOC entry 218 (class 1259 OID 69818)
-- Name: tuser_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_preference (
    id_user_preference integer NOT NULL,
    preference_name character varying(150),
    user_login character varying(150),
    preference_value character varying(255)
);


--
-- TOC entry 214 (class 1259 OID 69782)
-- Name: tuser_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_role (
    id_user_role integer NOT NULL,
    id_rolename integer,
    user_ character varying(50)
);


--
-- TOC entry 2868 (class 2604 OID 37322)
-- Name: artist artist_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist ALTER COLUMN artist_id SET DEFAULT nextval('public.artist_artist_id_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 37347)
-- Name: artist_concert artist_concert_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_concert ALTER COLUMN artist_concert_id SET DEFAULT nextval('public.artist_concert_artist_concert_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 37357)
-- Name: artist_genre artist_genre_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_genre ALTER COLUMN artist_genre_id SET DEFAULT nextval('public.artist_genre_artist_genre_id_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 37367)
-- Name: comments comments_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN comments_id SET DEFAULT nextval('public.comments_comments_id_seq'::regclass);


--
-- TOC entry 2872 (class 2604 OID 37378)
-- Name: concert concert_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.concert ALTER COLUMN concert_id SET DEFAULT nextval('public.concert_concert_id_seq'::regclass);


--
-- TOC entry 2873 (class 2604 OID 37393)
-- Name: config config_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config ALTER COLUMN config_id SET DEFAULT nextval('public.config_config_id_seq'::regclass);


--
-- TOC entry 2874 (class 2604 OID 37404)
-- Name: genre genre_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);


--
-- TOC entry 2875 (class 2604 OID 37417)
-- Name: location location_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location ALTER COLUMN location_id SET DEFAULT nextval('public.location_location_id_seq'::regclass);


--
-- TOC entry 3070 (class 0 OID 37319)
-- Dependencies: 197
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.artist VALUES (1, 'Camela', 'https://twitter.com/camelaoficial', 'https://www.instagram.com/camelaoficial_/', NULL, 'https://www.youtube.com/user/CamelaVEVO/', 'https://open.spotify.com/artist/6flBUmmOMLNhD4EJhGwgpG');
INSERT INTO public.artist VALUES (2, 'David Bisbal', 'https://twitter.com/davidbisbal', 'https://www.instagram.com/davidbisbal/', 'https://www.twitch.tv/davidbisbal', 'https://www.youtube.com/channel/UCDYWzPdgUz5tK8SkEz_lHfg', 'https://open.spotify.com/artist/5gOJTI4TusSENizxhcG7jB?autoplay=true&v=A');
INSERT INTO public.artist VALUES (3, 'Joaquín Sabina', 'https://twitter.com/jsabinaoficial', NULL, NULL, 'https://www.youtube.com/channel/UCAVgrQkzMkYPp5M4QVifmaA', 'https://open.spotify.com/artist/4aeIWo5CMF1uRmqgJdwkZW?autoplay=true&v=A');
INSERT INTO public.artist VALUES (5, 'Julio Iglesias', NULL, NULL, NULL, 'https://www.youtube.com/channel/UCRZPKE-1WmcljvmOGFOGgYA', 'https://open.spotify.com/artist/4etuCZVdP8yiNPn4xf0ie5');
INSERT INTO public.artist VALUES (6, 'Dani Martín', 'https://twitter.com/_danielmartin_', NULL, NULL, 'https://www.youtube.com/channel/UCmOXmdVosWU4q6On-X4duZA', 'https://open.spotify.com/artist/3AIPhNgeF9S1Kyg9Yy3UQW');
INSERT INTO public.artist VALUES (7, 'David Otero', 'https://twitter.com/davidotero', NULL, NULL, 'https://www.youtube.com/user/DavidOteroVEVO', 'https://open.spotify.com/artist/4cA5JN7tiNZ8afYeuSQj5h');
INSERT INTO public.artist VALUES (8, 'Bad Gyal', NULL, 'https://www.instagram.com/akabadgyal', NULL, 'https://www.youtube.com/channel/UC2ypBaYnDvnlbzyAH8w2jsw', 'https://open.spotify.com/artist/4F4pp8NUW08JuXwnoxglpN');
INSERT INTO public.artist VALUES (9, 'Sergio Dalma', NULL, 'https://www.instagram.com/sergiodalmaoficial', NULL, 'https://www.youtube.com/channel/UC0v3JOP7uVDANNQbM3O4s2g', 'https://open.spotify.com/artist/7x6XYw3yCC67Pizi4o0wvZ');


--
-- TOC entry 3072 (class 0 OID 37344)
-- Dependencies: 199
-- Data for Name: artist_concert; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.artist_concert VALUES (8, 3, 1);
INSERT INTO public.artist_concert VALUES (15, 4, 2);
INSERT INTO public.artist_concert VALUES (18, 7, 6);
INSERT INTO public.artist_concert VALUES (19, 8, 7);
INSERT INTO public.artist_concert VALUES (22, 9, 5);
INSERT INTO public.artist_concert VALUES (23, 10, 8);
INSERT INTO public.artist_concert VALUES (24, 11, 9);
INSERT INTO public.artist_concert VALUES (17, 6, 5);
INSERT INTO public.artist_concert VALUES (16, 5, 3);


--
-- TOC entry 3074 (class 0 OID 37354)
-- Dependencies: 201
-- Data for Name: artist_genre; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.artist_genre VALUES (1, 1, 1);
INSERT INTO public.artist_genre VALUES (2, 2, 3);
INSERT INTO public.artist_genre VALUES (3, 3, 1);
INSERT INTO public.artist_genre VALUES (4, 5, 10);
INSERT INTO public.artist_genre VALUES (5, 6, 7);
INSERT INTO public.artist_genre VALUES (6, 7, 9);
INSERT INTO public.artist_genre VALUES (7, 8, 10);
INSERT INTO public.artist_genre VALUES (8, 9, 1);


--
-- TOC entry 3076 (class 0 OID 37364)
-- Dependencies: 203
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comments VALUES (2, 3, 'Pepe', '2020-06-01', 'Estoy impaciente por que llegue el dia y verlo en directo!!!');
INSERT INTO public.comments VALUES (3, 3, 'Paula', '2020-06-01', 'Soy su mayor fan!!! Que ganas de verlo!');
INSERT INTO public.comments VALUES (4, 7, 'Maria', '2020-06-01', 'El mejor cantante de la historia');
INSERT INTO public.comments VALUES (5, 8, 'Antonio', '2020-06-01', 'Me paso el dia escuchando su música, es realmente bueno.');
INSERT INTO public.comments VALUES (6, 10, 'Daniel', '2020-07-22', 'Me encanta su música, es la mejor!');
INSERT INTO public.comments VALUES (20, 11, 'Brais ', '2020-07-23', 'Gran cantante, espero el concierto con muchas ganas!');
INSERT INTO public.comments VALUES (21, 4, 'Miguel', '2020-07-23', 'Tengo muchas ganas de ver este concierto!');
INSERT INTO public.comments VALUES (22, 6, 'Miguel', '2020-07-23', 'Hola soy bobito');


--
-- TOC entry 3078 (class 0 OID 37375)
-- Dependencies: 205
-- Data for Name: concert; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.concert VALUES (11, 7, '2021-02-19 00:00:00', 50, 'Gran concierto de su Gira 30... y tanto. ¡No te lo pierdas!', '2020-07-20', 7, false, 'Concierto de la Gira 30... y tanto de Sergio Dalma ', 'https://www.eventbrite.es/e/entradas-sergio-dalma-gira-30-y-tanto-en-vigo-84149937729');
INSERT INTO public.concert VALUES (8, 5, '2020-12-02 00:00:00', 120, '¡El evento del año!', '2020-06-01', 4, false, '¡Increible concierto de David Otero en Ourense!', 'https://www.eventbrite.es/');
INSERT INTO public.concert VALUES (7, 5, '2020-08-04 00:00:00', 80, 'Gran concierto que forma parte de su gira mundial, ¡entradas ya a la venta!', '2020-06-01', 0, false, '¡Parada de la gira mundial de Dani Martin en Galicia!', 'https://www.eventbrite.es/');
INSERT INTO public.concert VALUES (6, 4, '2020-10-19 00:00:00', 30, 'Primer concierto en Galicia de su gira mundial. ¡No te quedes sin tus entradas!', '2020-06-01', 5, false, '¡Primera parada de la gira mundial de Julio Iglesias en Vigo!', 'https://www.eventbrite.es/');
INSERT INTO public.concert VALUES (3, 1, '2020-10-12 00:00:00', 60, 'Primer concierto en Galicia de su gira mundial. ¡No te lo pierdas!', '2020-06-01', 9, false, '¡Tercera parada de la gira mundial de Camela en Galicia!', 'https://www.eventbrite.es/');
INSERT INTO public.concert VALUES (4, 2, '2020-09-02 00:00:00', 40, '¡No te pierdas el próximo concierto que hará David Bisbal en Twitch!', '2020-06-01', 10, true, '¡Presentación del nuevo album de David Bisbal Via Online!', NULL);
INSERT INTO public.concert VALUES (5, 3, '2020-11-30 00:00:00', 70, '¡No te pierdas el próximo concierto que hará Joaquin Sabina en Youtube!', '2020-06-01', 2, true, '¡Increible concierto de Joaquin Sabina en Galicia!', NULL);
INSERT INTO public.concert VALUES (9, 6, '2021-01-23 00:00:00', 60, 'Primer concierto en Galicia de su gira mundial. ¡No te quedes sin tus entradas!', '2020-06-01', 2, false, 'Última parada de la gran gira mundial de Julio Iglesias', 'https://www.eventbrite.es/');
INSERT INTO public.concert VALUES (10, 1, '2020-10-03 00:00:00', 50, 'Primer concierto de Bad Gyal en Galicia. ¡No te lo pierdas!', '2020-07-20', 21, false, 'Gran concierto de Bad Gyal en Coruña presentando su nuevo tema', 'https://www.eventbrite.es/e/entradas-bad-gyal-en-a-coruna-76083665291');


--
-- TOC entry 3080 (class 0 OID 37390)
-- Dependencies: 207
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.config VALUES (1, 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.instagram.com/', '.\artists_images\', '.\concerts_images\');


--
-- TOC entry 3082 (class 0 OID 37401)
-- Dependencies: 209
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genre VALUES (1, 'pop');
INSERT INTO public.genre VALUES (2, 'rock');
INSERT INTO public.genre VALUES (3, 'electronica');
INSERT INTO public.genre VALUES (4, 'jazz');
INSERT INTO public.genre VALUES (5, 'Dubstep');
INSERT INTO public.genre VALUES (6, 'R&B');
INSERT INTO public.genre VALUES (7, 'rap');
INSERT INTO public.genre VALUES (8, 'HipHop');
INSERT INTO public.genre VALUES (9, 'heavy metal');
INSERT INTO public.genre VALUES (10, 'trap');


--
-- TOC entry 3084 (class 0 OID 37414)
-- Dependencies: 211
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.location VALUES (2, 'Twitch', NULL, NULL, NULL, NULL, NULL, 'https://www.twitch.tv/');
INSERT INTO public.location VALUES (3, 'YouTube', NULL, NULL, NULL, NULL, NULL, 'https://www.youtube.com/');
INSERT INTO public.location VALUES (4, 'Sala Rouge', 'Rúa de Pontevedra, 4', 'Vigo', 'Pontevedra', 36201, 2000, NULL);
INSERT INTO public.location VALUES (5, 'Discoteca Luxus', 'Rúa Arturo Pérez Serantes, 3', 'Ourense', 'Ourense', 32005, 4500, NULL);
INSERT INTO public.location VALUES (6, 'Sala Tebras', 'Praza Viana do Castelo, 3', 'Lugo', 'Lugo', 27297, 1500, NULL);
INSERT INTO public.location VALUES (7, 'Auditorio Mar de Vigo', '59 Avenida da Beiramar', 'Vigo', 'Pontevedra', 36202, 2500, NULL);
INSERT INTO public.location VALUES (1, 'Sala Pelícano', 'Los Cantones, Avenida Do Porto, Nº3', 'La Coruña', 'La Coruña', 15003, 10000, NULL);


--
-- TOC entry 3092 (class 0 OID 69826)
-- Dependencies: 219
-- Data for Name: ti18n; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3093 (class 0 OID 69831)
-- Dependencies: 220
-- Data for Name: ti18n_value; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3089 (class 0 OID 69802)
-- Dependencies: 216
-- Data for Name: trequest_statistics; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3086 (class 0 OID 69774)
-- Dependencies: 213
-- Data for Name: trole; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3094 (class 0 OID 69839)
-- Dependencies: 221
-- Data for Name: trole_server_permission; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3088 (class 0 OID 69797)
-- Dependencies: 215
-- Data for Name: tserver_permission; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3090 (class 0 OID 69810)
-- Dependencies: 217
-- Data for Name: tsetting; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3085 (class 0 OID 69767)
-- Dependencies: 212
-- Data for Name: tuser; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser VALUES ('demo', 'demouser', 'demo', 'demo', NULL, '44460713B', NULL, NULL, NULL);


--
-- TOC entry 3091 (class 0 OID 69818)
-- Dependencies: 218
-- Data for Name: tuser_preference; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3087 (class 0 OID 69782)
-- Dependencies: 214
-- Data for Name: tuser_role; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 196
-- Name: artist_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_artist_id_seq', 9, true);


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 198
-- Name: artist_concert_artist_concert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_concert_artist_concert_id_seq', 24, true);


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 200
-- Name: artist_genre_artist_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artist_genre_artist_genre_id_seq', 8, true);


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 202
-- Name: comments_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_comments_id_seq', 22, true);


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 204
-- Name: concert_concert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.concert_concert_id_seq', 11, true);


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 206
-- Name: config_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.config_config_id_seq', 1, true);


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 208
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genre_genre_id_seq', 10, true);


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 210
-- Name: location_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.location_location_id_seq', 7, true);


--
-- TOC entry 2879 (class 2606 OID 37341)
-- Name: artist artist_artist_id_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_artist_id_name_key UNIQUE (artist_id, artist_name);


--
-- TOC entry 2895 (class 2606 OID 37349)
-- Name: artist_concert artist_concert_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_concert
    ADD CONSTRAINT artist_concert_pkey PRIMARY KEY (artist_concert_id);


--
-- TOC entry 2899 (class 2606 OID 37359)
-- Name: artist_genre artist_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_genre
    ADD CONSTRAINT artist_genre_pkey PRIMARY KEY (artist_genre_id);


--
-- TOC entry 2897 (class 2606 OID 55112)
-- Name: artist_concert artist_id_concert_id_uk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_concert
    ADD CONSTRAINT artist_id_concert_id_uk UNIQUE (concert_id, artist_id);


--
-- TOC entry 2901 (class 2606 OID 55128)
-- Name: artist_genre artist_id_genre_id_uk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_genre
    ADD CONSTRAINT artist_id_genre_id_uk UNIQUE (artist_id, genre_id);


--
-- TOC entry 2881 (class 2606 OID 37333)
-- Name: artist artist_instagram_link_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_instagram_link_key UNIQUE (instagram_link);


--
-- TOC entry 2883 (class 2606 OID 37329)
-- Name: artist artist_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_name_key UNIQUE (artist_name);


--
-- TOC entry 2885 (class 2606 OID 37327)
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artist_id);


--
-- TOC entry 2887 (class 2606 OID 37339)
-- Name: artist artist_spotify_link_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_spotify_link_key UNIQUE (spotify_link);


--
-- TOC entry 2889 (class 2606 OID 37335)
-- Name: artist artist_twitch_link_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_twitch_link_key UNIQUE (twitch_link);


--
-- TOC entry 2891 (class 2606 OID 37331)
-- Name: artist artist_twitter_link_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_twitter_link_key UNIQUE (twitter_link);


--
-- TOC entry 2893 (class 2606 OID 37337)
-- Name: artist artist_youtube_link_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_youtube_link_key UNIQUE (youtube_link);


--
-- TOC entry 2903 (class 2606 OID 37372)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comments_id);


--
-- TOC entry 2905 (class 2606 OID 37387)
-- Name: concert concert_concert_id_location_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT concert_concert_id_location_id_key UNIQUE (concert_id, location_id);


--
-- TOC entry 2907 (class 2606 OID 37385)
-- Name: concert concert_date_location_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT concert_date_location_id_key UNIQUE (date, location_id);


--
-- TOC entry 2909 (class 2606 OID 37383)
-- Name: concert concert_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT concert_pkey PRIMARY KEY (concert_id);


--
-- TOC entry 2911 (class 2606 OID 37398)
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (config_id);


--
-- TOC entry 2913 (class 2606 OID 37411)
-- Name: genre genre_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_name_key UNIQUE (genre_name);


--
-- TOC entry 2915 (class 2606 OID 37409)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 2917 (class 2606 OID 37422)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- TOC entry 2933 (class 2606 OID 69830)
-- Name: ti18n ti18n_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n
    ADD CONSTRAINT ti18n_pkey PRIMARY KEY (id_i18n);


--
-- TOC entry 2935 (class 2606 OID 69838)
-- Name: ti18n_value ti18n_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n_value
    ADD CONSTRAINT ti18n_value_pkey PRIMARY KEY (id_i18n_value);


--
-- TOC entry 2927 (class 2606 OID 69809)
-- Name: trequest_statistics trequest_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequest_statistics
    ADD CONSTRAINT trequest_statistics_pkey PRIMARY KEY (id_request_statistics);


--
-- TOC entry 2921 (class 2606 OID 69781)
-- Name: trole trole_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole
    ADD CONSTRAINT trole_pkey PRIMARY KEY (id_rolename);


--
-- TOC entry 2937 (class 2606 OID 69843)
-- Name: trole_server_permission trole_server_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT trole_server_permission_pkey PRIMARY KEY (id_role_server_permission);


--
-- TOC entry 2925 (class 2606 OID 69801)
-- Name: tserver_permission tserver_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission
    ADD CONSTRAINT tserver_permission_pkey PRIMARY KEY (id_server_permission);


--
-- TOC entry 2929 (class 2606 OID 69817)
-- Name: tsetting tsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting
    ADD CONSTRAINT tsetting_pkey PRIMARY KEY (id_setting);


--
-- TOC entry 2919 (class 2606 OID 69773)
-- Name: tuser tuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT tuser_pkey PRIMARY KEY (user_);


--
-- TOC entry 2931 (class 2606 OID 69825)
-- Name: tuser_preference tuser_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference
    ADD CONSTRAINT tuser_preference_pkey PRIMARY KEY (id_user_preference);


--
-- TOC entry 2923 (class 2606 OID 69786)
-- Name: tuser_role tuser_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT tuser_role_pkey PRIMARY KEY (id_user_role);


--
-- TOC entry 2938 (class 2606 OID 37423)
-- Name: artist_concert artist_concert_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_concert
    ADD CONSTRAINT artist_concert_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(artist_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2939 (class 2606 OID 37433)
-- Name: artist_concert artist_concert_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_concert
    ADD CONSTRAINT artist_concert_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concert(concert_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2940 (class 2606 OID 37428)
-- Name: artist_genre artist_genre_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_genre
    ADD CONSTRAINT artist_genre_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(artist_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2941 (class 2606 OID 37443)
-- Name: artist_genre artist_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_genre
    ADD CONSTRAINT artist_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2942 (class 2606 OID 37438)
-- Name: comments comments_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concert(concert_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2943 (class 2606 OID 37448)
-- Name: concert concert_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT concert_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2945 (class 2606 OID 69792)
-- Name: tuser_role fk_trole; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_trole FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2946 (class 2606 OID 69844)
-- Name: trole_server_permission fk_trole_server_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_trole_server_permission FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2947 (class 2606 OID 69849)
-- Name: trole_server_permission fk_tserver_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_tserver_permission FOREIGN KEY (id_server_permission) REFERENCES public.tserver_permission(id_server_permission);


--
-- TOC entry 2944 (class 2606 OID 69787)
-- Name: tuser_role fk_tuser; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_tuser FOREIGN KEY (user_) REFERENCES public.tuser(user_);


-- Completed on 2023-02-03 12:42:21

--
-- PostgreSQL database dump complete
--

