--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-30 22:25:58 -03

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 237 (class 1259 OID 35192)
-- Name: anuncio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.anuncio (
    id_anuncio integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    descricao_anuncio oid NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 214 (class 1259 OID 33634)
-- Name: anuncio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.anuncio_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 238 (class 1259 OID 35198)
-- Name: area_atuacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.area_atuacao (
    id_area_atuacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_area_atuacao character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 215 (class 1259 OID 33635)
-- Name: area_atuacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.area_atuacao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 239 (class 1259 OID 35204)
-- Name: comentario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comentario (
    id_comentario integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    descricao_comentario character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer,
    anuncio_id integer NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 33636)
-- Name: comentario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comentario_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 240 (class 1259 OID 35210)
-- Name: contribuicao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contribuicao (
    id_contribuicao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    descricao_contribuicao oid NOT NULL,
    created_by integer,
    last_modified_by integer,
    egresso_id integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 33637)
-- Name: contribuicao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contribuicao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 241 (class 1259 OID 35216)
-- Name: cota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cota (
    id_cota integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_cota character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 218 (class 1259 OID 33638)
-- Name: cota_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cota_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 242 (class 1259 OID 35222)
-- Name: curso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curso (
    id_curso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_curso character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 219 (class 1259 OID 33639)
-- Name: curso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.curso_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 243 (class 1259 OID 35228)
-- Name: depoimento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.depoimento (
    id_depoimento integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    descricao_depoimento oid NOT NULL,
    created_by integer,
    last_modified_by integer,
    egresso_id integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 33640)
-- Name: depoimento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.depoimento_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 244 (class 1259 OID 35234)
-- Name: egresso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso (
    id_egresso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    bolsista_egresso boolean NOT NULL,
    cotista_egresso boolean NOT NULL,
    interesse_em_pos_egresso boolean NOT NULL,
    lattes_egresso character varying(255),
    linkedin_egresso character varying(255),
    matricula_egresso character varying(12),
    nascimento_egresso date NOT NULL,
    pcd_egresso boolean,
    pos_graducao_egresso boolean,
    remuneracao_bolsa_egresso double precision,
    created_by integer,
    last_modified_by integer,
    tipo_bolsa_id integer,
    genero_id integer NOT NULL,
    usuario_id integer
);


--
-- TOC entry 245 (class 1259 OID 35242)
-- Name: egresso_area_atuacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_area_atuacao (
    id_area_atuacao integer NOT NULL,
    id_egresso integer NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 35247)
-- Name: egresso_cota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_cota (
    id_egresso integer NOT NULL,
    id_cota integer NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 35252)
-- Name: egresso_empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_empresa (
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    empresa_id_empresa integer NOT NULL,
    egresso_id_egresso integer NOT NULL,
    created_by integer,
    last_modified_by integer,
    faixa_salarial_id integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 33641)
-- Name: egresso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.egresso_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 248 (class 1259 OID 35258)
-- Name: egresso_titulacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_titulacao (
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    egresso_id_egresso integer NOT NULL,
    titulacao_id_titulacao integer NOT NULL,
    created_by integer,
    last_modified_by integer,
    curso_id integer NOT NULL,
    empresa_id integer NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 35264)
-- Name: egresso_valido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_valido (
    id_egresso_valido integer NOT NULL,
    email_egresso_valido character varying(255),
    matricula_egresso_valido character varying(12),
    nome_egresso_valido character varying(100) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33642)
-- Name: egresso_valido_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.egresso_valido_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 250 (class 1259 OID 35269)
-- Name: empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.empresa (
    id_empresa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_empresa character varying(130) NOT NULL,
    created_by integer,
    last_modified_by integer,
    endereco_empresa integer
);


--
-- TOC entry 223 (class 1259 OID 33643)
-- Name: empresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.empresa_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 251 (class 1259 OID 35275)
-- Name: endereco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.endereco (
    id_endereco integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    cidade_endereco character varying(255) NOT NULL,
    estado_endereco character varying(255) NOT NULL,
    pais_endereco character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 224 (class 1259 OID 33644)
-- Name: endereco_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.endereco_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 232 (class 1259 OID 34013)
-- Name: etnia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.etnia_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 252 (class 1259 OID 35283)
-- Name: faixa_salarial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.faixa_salarial (
    id_faixa_salarial integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    faixa_faixa_salarial character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 225 (class 1259 OID 33645)
-- Name: faixa_salarial_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.faixa_salarial_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 253 (class 1259 OID 35289)
-- Name: genero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genero (
    id_genero integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_genero character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 226 (class 1259 OID 33646)
-- Name: genero_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genero_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 254 (class 1259 OID 35295)
-- Name: grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grupo (
    id_grupo integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_grupo character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 227 (class 1259 OID 33647)
-- Name: grupo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grupo_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 255 (class 1259 OID 35301)
-- Name: palestra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.palestra (
    id_palestra integer NOT NULL,
    nome_palestra oid NOT NULL,
    egresso_id integer NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 34093)
-- Name: palestra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.palestra_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 233 (class 1259 OID 34014)
-- Name: palestras_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.palestras_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 234 (class 1259 OID 34015)
-- Name: pesquisa_cientifica_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pesquisa_cientifica_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 256 (class 1259 OID 35306)
-- Name: setor_atuacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.setor_atuacao (
    id_setor_atuacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_setor_atuacao character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 257 (class 1259 OID 35312)
-- Name: setor_atuacao_empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.setor_atuacao_empresa (
    id_setor_atuacao integer NOT NULL,
    id_empresa integer NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 33648)
-- Name: setor_atuacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.setor_atuacao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 258 (class 1259 OID 35317)
-- Name: tipo_bolsa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_bolsa (
    id_tipo_bolsa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_tipo_bolsa character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 229 (class 1259 OID 33649)
-- Name: tipo_bolsa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_bolsa_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 259 (class 1259 OID 35323)
-- Name: titulacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.titulacao (
    id_titulacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_titulacao character varying(30) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 230 (class 1259 OID 33650)
-- Name: titulacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.titulacao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 235 (class 1259 OID 34016)
-- Name: trabalho_publicado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trabalho_publicado_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 260 (class 1259 OID 35329)
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    email character varying(50) NOT NULL,
    nome_usuario character varying(30) NOT NULL,
    senha_usuario character varying(80) NOT NULL,
    login_usuario character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 261 (class 1259 OID 35335)
-- Name: usuario_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_grupo (
    id_usuario integer NOT NULL,
    id_grupo integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 33651)
-- Name: usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3656 (class 0 OID 35192)
-- Dependencies: 237
-- Data for Name: anuncio; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3657 (class 0 OID 35198)
-- Dependencies: 238
-- Data for Name: area_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3658 (class 0 OID 35204)
-- Dependencies: 239
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3659 (class 0 OID 35210)
-- Dependencies: 240
-- Data for Name: contribuicao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3660 (class 0 OID 35216)
-- Dependencies: 241
-- Data for Name: cota; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3661 (class 0 OID 35222)
-- Dependencies: 242
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3662 (class 0 OID 35228)
-- Dependencies: 243
-- Data for Name: depoimento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3663 (class 0 OID 35234)
-- Dependencies: 244
-- Data for Name: egresso; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3664 (class 0 OID 35242)
-- Dependencies: 245
-- Data for Name: egresso_area_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3665 (class 0 OID 35247)
-- Dependencies: 246
-- Data for Name: egresso_cota; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3666 (class 0 OID 35252)
-- Dependencies: 247
-- Data for Name: egresso_empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3667 (class 0 OID 35258)
-- Dependencies: 248
-- Data for Name: egresso_titulacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3668 (class 0 OID 35264)
-- Dependencies: 249
-- Data for Name: egresso_valido; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3669 (class 0 OID 35269)
-- Dependencies: 250
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3670 (class 0 OID 35275)
-- Dependencies: 251
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3671 (class 0 OID 35283)
-- Dependencies: 252
-- Data for Name: faixa_salarial; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3672 (class 0 OID 35289)
-- Dependencies: 253
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3673 (class 0 OID 35295)
-- Dependencies: 254
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3674 (class 0 OID 35301)
-- Dependencies: 255
-- Data for Name: palestra; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3675 (class 0 OID 35306)
-- Dependencies: 256
-- Data for Name: setor_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3676 (class 0 OID 35312)
-- Dependencies: 257
-- Data for Name: setor_atuacao_empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3677 (class 0 OID 35317)
-- Dependencies: 258
-- Data for Name: tipo_bolsa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3678 (class 0 OID 35323)
-- Dependencies: 259
-- Data for Name: titulacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3679 (class 0 OID 35329)
-- Dependencies: 260
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3680 (class 0 OID 35335)
-- Dependencies: 261
-- Data for Name: usuario_grupo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 214
-- Name: anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.anuncio_seq', 1, false);


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 215
-- Name: area_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.area_atuacao_seq', 1, false);


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 216
-- Name: comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comentario_seq', 1, false);


--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 217
-- Name: contribuicao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribuicao_seq', 151, true);


--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 218
-- Name: cota_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cota_seq', 1, false);


--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 219
-- Name: curso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.curso_seq', 1, false);


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 220
-- Name: depoimento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.depoimento_seq', 51, true);


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 221
-- Name: egresso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_seq', 301, true);


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 222
-- Name: egresso_valido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_valido_seq', 1, false);


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 223
-- Name: empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.empresa_seq', 1, false);


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 224
-- Name: endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.endereco_seq', 1, false);


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 232
-- Name: etnia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.etnia_seq', 1, false);


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 225
-- Name: faixa_salarial_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faixa_salarial_seq', 1, false);


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 226
-- Name: genero_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genero_seq', 51, true);


--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 227
-- Name: grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grupo_seq', 1, false);


--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 236
-- Name: palestra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.palestra_seq', 1, false);


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 233
-- Name: palestras_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.palestras_seq', 151, true);


--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 234
-- Name: pesquisa_cientifica_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pesquisa_cientifica_seq', 1, false);


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 228
-- Name: setor_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.setor_atuacao_seq', 1, false);


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 229
-- Name: tipo_bolsa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_bolsa_seq', 1, false);


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 230
-- Name: titulacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.titulacao_seq', 1, false);


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 235
-- Name: trabalho_publicado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trabalho_publicado_seq', 1, false);


--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 231
-- Name: usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_seq', 1, false);


--
-- TOC entry 3339 (class 2606 OID 35197)
-- Name: anuncio anuncio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT anuncio_pkey PRIMARY KEY (id_anuncio);


--
-- TOC entry 3341 (class 2606 OID 35203)
-- Name: area_atuacao area_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT area_atuacao_pkey PRIMARY KEY (id_area_atuacao);


--
-- TOC entry 3345 (class 2606 OID 35209)
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id_comentario);


--
-- TOC entry 3347 (class 2606 OID 35215)
-- Name: contribuicao contribuicao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT contribuicao_pkey PRIMARY KEY (id_contribuicao);


--
-- TOC entry 3351 (class 2606 OID 35221)
-- Name: cota cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT cota_pkey PRIMARY KEY (id_cota);


--
-- TOC entry 3355 (class 2606 OID 35227)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 3359 (class 2606 OID 35233)
-- Name: depoimento depoimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT depoimento_pkey PRIMARY KEY (id_depoimento);


--
-- TOC entry 3375 (class 2606 OID 35246)
-- Name: egresso_area_atuacao egresso_area_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT egresso_area_atuacao_pkey PRIMARY KEY (id_area_atuacao, id_egresso);


--
-- TOC entry 3377 (class 2606 OID 35251)
-- Name: egresso_cota egresso_cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT egresso_cota_pkey PRIMARY KEY (id_egresso, id_cota);


--
-- TOC entry 3379 (class 2606 OID 35257)
-- Name: egresso_empresa egresso_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT egresso_empresa_pkey PRIMARY KEY (egresso_id_egresso, empresa_id_empresa);


--
-- TOC entry 3363 (class 2606 OID 35241)
-- Name: egresso egresso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT egresso_pkey PRIMARY KEY (id_egresso);


--
-- TOC entry 3381 (class 2606 OID 35263)
-- Name: egresso_titulacao egresso_titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT egresso_titulacao_pkey PRIMARY KEY (egresso_id_egresso, titulacao_id_titulacao);


--
-- TOC entry 3383 (class 2606 OID 35268)
-- Name: egresso_valido egresso_valido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT egresso_valido_pkey PRIMARY KEY (id_egresso_valido);


--
-- TOC entry 3389 (class 2606 OID 35274)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 3391 (class 2606 OID 35282)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 3393 (class 2606 OID 35288)
-- Name: faixa_salarial faixa_salarial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT faixa_salarial_pkey PRIMARY KEY (id_faixa_salarial);


--
-- TOC entry 3397 (class 2606 OID 35294)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3401 (class 2606 OID 35300)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 3405 (class 2606 OID 35305)
-- Name: palestra palestra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT palestra_pkey PRIMARY KEY (id_palestra);


--
-- TOC entry 3415 (class 2606 OID 35316)
-- Name: setor_atuacao_empresa setor_atuacao_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT setor_atuacao_empresa_pkey PRIMARY KEY (id_setor_atuacao, id_empresa);


--
-- TOC entry 3411 (class 2606 OID 35311)
-- Name: setor_atuacao setor_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT setor_atuacao_pkey PRIMARY KEY (id_setor_atuacao);


--
-- TOC entry 3417 (class 2606 OID 35322)
-- Name: tipo_bolsa tipo_bolsa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT tipo_bolsa_pkey PRIMARY KEY (id_tipo_bolsa);


--
-- TOC entry 3421 (class 2606 OID 35328)
-- Name: titulacao titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT titulacao_pkey PRIMARY KEY (id_titulacao);


--
-- TOC entry 3395 (class 2606 OID 35365)
-- Name: faixa_salarial uk_2bn1lsqed44xqtrtq17s7tjue; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT uk_2bn1lsqed44xqtrtq17s7tjue UNIQUE (faixa_faixa_salarial);


--
-- TOC entry 3407 (class 2606 OID 35373)
-- Name: palestra uk_2h2mxjetrwvc8sg1wx5ttyq07; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT uk_2h2mxjetrwvc8sg1wx5ttyq07 UNIQUE (egresso_id);


--
-- TOC entry 3385 (class 2606 OID 35363)
-- Name: egresso_valido uk_2jwojv1fccodf62r2wa6st1i1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_2jwojv1fccodf62r2wa6st1i1 UNIQUE (matricula_egresso_valido);


--
-- TOC entry 3365 (class 2606 OID 35359)
-- Name: egresso uk_3tmslc9ltmjdyy2mbstgpf1un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_3tmslc9ltmjdyy2mbstgpf1un UNIQUE (usuario_id);


--
-- TOC entry 3367 (class 2606 OID 35355)
-- Name: egresso uk_4datilmpr40t15bnmxyve5t0y; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_4datilmpr40t15bnmxyve5t0y UNIQUE (matricula_egresso);


--
-- TOC entry 3399 (class 2606 OID 35367)
-- Name: genero uk_6xfypuejpx9h55hdouj112ocw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT uk_6xfypuejpx9h55hdouj112ocw UNIQUE (nome_genero);


--
-- TOC entry 3369 (class 2606 OID 35353)
-- Name: egresso uk_7wtwbdgn55nu31nx24ib5revf; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_7wtwbdgn55nu31nx24ib5revf UNIQUE (linkedin_egresso);


--
-- TOC entry 3425 (class 2606 OID 35381)
-- Name: usuario uk_8efax56av7vfdquauh0gyl9cx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_8efax56av7vfdquauh0gyl9cx UNIQUE (login_usuario);


--
-- TOC entry 3371 (class 2606 OID 35351)
-- Name: egresso uk_919oulldbx88ntvtrq5r6sdkt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_919oulldbx88ntvtrq5r6sdkt UNIQUE (lattes_egresso);


--
-- TOC entry 3353 (class 2606 OID 35345)
-- Name: cota uk_9k3kf2b9f2mjv11ksekdha97k; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT uk_9k3kf2b9f2mjv11ksekdha97k UNIQUE (nome_cota);


--
-- TOC entry 3357 (class 2606 OID 35347)
-- Name: curso uk_i35k8uavr3s5cxr12aefe00e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT uk_i35k8uavr3s5cxr12aefe00e UNIQUE (nome_curso);


--
-- TOC entry 3403 (class 2606 OID 35369)
-- Name: grupo uk_is0kvc71ivi2o1nhe7h19m47p; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT uk_is0kvc71ivi2o1nhe7h19m47p UNIQUE (nome_grupo);


--
-- TOC entry 3413 (class 2606 OID 35375)
-- Name: setor_atuacao uk_j59f23omfkincud4bx0f8x3vp; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT uk_j59f23omfkincud4bx0f8x3vp UNIQUE (nome_setor_atuacao);


--
-- TOC entry 3419 (class 2606 OID 35377)
-- Name: tipo_bolsa uk_j6yqoqsrpie5ipmlh6c5jbrx1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT uk_j6yqoqsrpie5ipmlh6c5jbrx1 UNIQUE (nome_tipo_bolsa);


--
-- TOC entry 3343 (class 2606 OID 35341)
-- Name: area_atuacao uk_mu4kvuf03rl6w7vpqgvtt78pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT uk_mu4kvuf03rl6w7vpqgvtt78pk UNIQUE (nome_area_atuacao);


--
-- TOC entry 3409 (class 2606 OID 35371)
-- Name: palestra uk_nhn2buqnf290o7umjxd7b1av7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT uk_nhn2buqnf290o7umjxd7b1av7 UNIQUE (nome_palestra);


--
-- TOC entry 3361 (class 2606 OID 35349)
-- Name: depoimento uk_rpha5d7rfphcjvj0nbjb1nvxs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT uk_rpha5d7rfphcjvj0nbjb1nvxs UNIQUE (egresso_id);


--
-- TOC entry 3349 (class 2606 OID 35343)
-- Name: contribuicao uk_rpvny7ejlpmi3fk8mbwva6qjy; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT uk_rpvny7ejlpmi3fk8mbwva6qjy UNIQUE (egresso_id);


--
-- TOC entry 3423 (class 2606 OID 35379)
-- Name: titulacao uk_rvnwm2n5juoh0aj3qnssh52nm; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT uk_rvnwm2n5juoh0aj3qnssh52nm UNIQUE (nome_titulacao);


--
-- TOC entry 3387 (class 2606 OID 35361)
-- Name: egresso_valido uk_snrp717wd5d36lg78t56wefwt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_snrp717wd5d36lg78t56wefwt UNIQUE (email_egresso_valido);


--
-- TOC entry 3373 (class 2606 OID 35357)
-- Name: egresso uk_tlc46fdlkmcqyqi95xif18idc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_tlc46fdlkmcqyqi95xif18idc UNIQUE (pos_graducao_egresso);


--
-- TOC entry 3429 (class 2606 OID 35339)
-- Name: usuario_grupo usuario_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT usuario_grupo_pkey PRIMARY KEY (id_usuario, id_grupo);


--
-- TOC entry 3427 (class 2606 OID 35334)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3467 (class 2606 OID 35567)
-- Name: empresa fk1252u5xj526ufsf5c3c9fcic2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk1252u5xj526ufsf5c3c9fcic2 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3472 (class 2606 OID 35597)
-- Name: faixa_salarial fk12fuee7y4kjstxd7xwk3fageo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT fk12fuee7y4kjstxd7xwk3fageo FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3461 (class 2606 OID 35547)
-- Name: egresso_titulacao fk1bu3y46jwvfc24y707b8hr57s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk1bu3y46jwvfc24y707b8hr57s FOREIGN KEY (curso_id) REFERENCES public.curso(id_curso);


--
-- TOC entry 3440 (class 2606 OID 35437)
-- Name: cota fk1lve8o0jw4i8ksl2dxp0lm8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT fk1lve8o0jw4i8ksl2dxp0lm8 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3437 (class 2606 OID 35427)
-- Name: contribuicao fk2ccawuj4bpvj1vk6mhrb6b0op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk2ccawuj4bpvj1vk6mhrb6b0op FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3462 (class 2606 OID 35552)
-- Name: egresso_titulacao fk2pj0kns83aqiewk5pf2wxj1n9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk2pj0kns83aqiewk5pf2wxj1n9 FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3454 (class 2606 OID 35507)
-- Name: egresso_cota fk2rs3m3oq3ujpj3nvgbyaqwata; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fk2rs3m3oq3ujpj3nvgbyaqwata FOREIGN KEY (id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3483 (class 2606 OID 35652)
-- Name: tipo_bolsa fk3c5grr0qggvj0dw2fada2xhyv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT fk3c5grr0qggvj0dw2fada2xhyv FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3447 (class 2606 OID 35487)
-- Name: egresso fk3lb1ai4t6bvvsu9jc9qm0fisi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fk3lb1ai4t6bvvsu9jc9qm0fisi FOREIGN KEY (usuario_id) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3442 (class 2606 OID 35442)
-- Name: curso fk3tu6gxj4fe3b8vgyhhr17p5d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk3tu6gxj4fe3b8vgyhhr17p5d1 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3444 (class 2606 OID 35457)
-- Name: depoimento fk4282xxihuiq8nqknlkrlmn6k7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fk4282xxihuiq8nqknlkrlmn6k7 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3474 (class 2606 OID 35602)
-- Name: genero fk4hmk8te4ct41ket6gewknyld3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT fk4hmk8te4ct41ket6gewknyld3 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3479 (class 2606 OID 35627)
-- Name: setor_atuacao fk4qba75lalso4wg21v2lldr81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT fk4qba75lalso4wg21v2lldr81c FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3476 (class 2606 OID 35617)
-- Name: grupo fk4x87bpegbq5yd4awx0jpyl7rf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fk4x87bpegbq5yd4awx0jpyl7rf FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3434 (class 2606 OID 35407)
-- Name: comentario fk5k6dqdx9kn983dj5jx5orhss0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fk5k6dqdx9kn983dj5jx5orhss0 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3432 (class 2606 OID 35397)
-- Name: area_atuacao fk5oqxk24ttn7xfiqojcd3hrxqp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT fk5oqxk24ttn7xfiqojcd3hrxqp FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3438 (class 2606 OID 35417)
-- Name: contribuicao fk7x5ccymo3mvys7sdoar4w27jy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk7x5ccymo3mvys7sdoar4w27jy FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3481 (class 2606 OID 35642)
-- Name: setor_atuacao_empresa fk86mqotohj7rghjrby21y54sr7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT fk86mqotohj7rghjrby21y54sr7 FOREIGN KEY (id_setor_atuacao) REFERENCES public.setor_atuacao(id_setor_atuacao);


--
-- TOC entry 3473 (class 2606 OID 35592)
-- Name: faixa_salarial fk96o103aeo1xeuhgnn0hhs6bl0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT fk96o103aeo1xeuhgnn0hhs6bl0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3484 (class 2606 OID 35647)
-- Name: tipo_bolsa fk9brd9pf3m513c4qwotx7j5l5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT fk9brd9pf3m513c4qwotx7j5l5f FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3489 (class 2606 OID 35682)
-- Name: usuario_grupo fk9huj1upwjyabwkwnpnhnernnu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fk9huj1upwjyabwkwnpnhnernnu FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3468 (class 2606 OID 35572)
-- Name: empresa fka0nk763e7luto0itr7it6y5gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fka0nk763e7luto0itr7it6y5gr FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3455 (class 2606 OID 35502)
-- Name: egresso_cota fka58rgwpq37hoof2640cw7j2l1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fka58rgwpq37hoof2640cw7j2l1 FOREIGN KEY (id_cota) REFERENCES public.cota(id_cota);


--
-- TOC entry 3435 (class 2606 OID 35402)
-- Name: comentario fkac7bpbirc6r6vcplb0fptftnx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fkac7bpbirc6r6vcplb0fptftnx FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3445 (class 2606 OID 35452)
-- Name: depoimento fkadydhxggbqc2ahkodd8du6s2t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkadydhxggbqc2ahkodd8du6s2t FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3463 (class 2606 OID 35562)
-- Name: egresso_titulacao fkb7ankaa93u5fr4nmbmyw46kmc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkb7ankaa93u5fr4nmbmyw46kmc FOREIGN KEY (titulacao_id_titulacao) REFERENCES public.titulacao(id_titulacao);


--
-- TOC entry 3480 (class 2606 OID 35632)
-- Name: setor_atuacao fkb7luqi69van4vdyylsmgv32hn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT fkb7luqi69van4vdyylsmgv32hn FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3464 (class 2606 OID 35557)
-- Name: egresso_titulacao fkbympkqdq4ugh9r707xwyxmx0i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkbympkqdq4ugh9r707xwyxmx0i FOREIGN KEY (empresa_id) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3465 (class 2606 OID 35542)
-- Name: egresso_titulacao fkc2t7d851vn3eko0rgmg8uonqj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkc2t7d851vn3eko0rgmg8uonqj FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3441 (class 2606 OID 35432)
-- Name: cota fkcqjq3oy1bo82gon5venmvjw98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT fkcqjq3oy1bo82gon5venmvjw98 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3448 (class 2606 OID 35477)
-- Name: egresso fkcqqxhbp7hpudbb1dcyouyaq79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkcqqxhbp7hpudbb1dcyouyaq79 FOREIGN KEY (tipo_bolsa_id) REFERENCES public.tipo_bolsa(id_tipo_bolsa);


--
-- TOC entry 3490 (class 2606 OID 35677)
-- Name: usuario_grupo fkcu6om65mvqr6ct95ijgqgx7ww; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fkcu6om65mvqr6ct95ijgqgx7ww FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo);


--
-- TOC entry 3452 (class 2606 OID 35497)
-- Name: egresso_area_atuacao fkd4e7n9hayio2dibmad734t0ra; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT fkd4e7n9hayio2dibmad734t0ra FOREIGN KEY (id_area_atuacao) REFERENCES public.area_atuacao(id_area_atuacao);


--
-- TOC entry 3456 (class 2606 OID 35532)
-- Name: egresso_empresa fkdut9kbfj1c87myf42xmao3aja; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkdut9kbfj1c87myf42xmao3aja FOREIGN KEY (faixa_salarial_id) REFERENCES public.faixa_salarial(id_faixa_salarial);


--
-- TOC entry 3430 (class 2606 OID 35387)
-- Name: anuncio fkf2afyb5u9a2g5kv1wce78ur8t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkf2afyb5u9a2g5kv1wce78ur8t FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3449 (class 2606 OID 35467)
-- Name: egresso fkf322p240i2h2i9sgcn5wjfaot; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkf322p240i2h2i9sgcn5wjfaot FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3433 (class 2606 OID 35392)
-- Name: area_atuacao fkfhdbeqpt6ruvdwof7m4acwoup; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT fkfhdbeqpt6ruvdwof7m4acwoup FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3482 (class 2606 OID 35637)
-- Name: setor_atuacao_empresa fkfjvgsmkx1gif8glw7y6uxjxos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT fkfjvgsmkx1gif8glw7y6uxjxos FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3457 (class 2606 OID 35512)
-- Name: egresso_empresa fkhytqndbt06s83doal9nmgcksj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkhytqndbt06s83doal9nmgcksj FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3470 (class 2606 OID 35587)
-- Name: endereco fki98kyuu68rp4942s3r9vkko6x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fki98kyuu68rp4942s3r9vkko6x FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3443 (class 2606 OID 35447)
-- Name: curso fkiiafe2qpikwi45ggt4p8a5mik; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fkiiafe2qpikwi45ggt4p8a5mik FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3453 (class 2606 OID 35492)
-- Name: egresso_area_atuacao fkivuyjh4ny3uxkawybgpgxq96a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT fkivuyjh4ny3uxkawybgpgxq96a FOREIGN KEY (id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3431 (class 2606 OID 35382)
-- Name: anuncio fkjw0029cxurvkx45044e65h64x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkjw0029cxurvkx45044e65h64x FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3450 (class 2606 OID 35482)
-- Name: egresso fkk0wr6p5gu54r773ttv5iira6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkk0wr6p5gu54r773ttv5iira6f FOREIGN KEY (genero_id) REFERENCES public.genero(id_genero);


--
-- TOC entry 3487 (class 2606 OID 35667)
-- Name: usuario fkkkymwf8xy047tl0035rhlfpq5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkkkymwf8xy047tl0035rhlfpq5 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3478 (class 2606 OID 35622)
-- Name: palestra fkku18fu56mnqdkfwbukwah002; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT fkku18fu56mnqdkfwbukwah002 FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3488 (class 2606 OID 35672)
-- Name: usuario fkl4ghr4b3u1vycv960y09ss9a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkl4ghr4b3u1vycv960y09ss9a4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3436 (class 2606 OID 35412)
-- Name: comentario fkm8q6r8t4jmqia3plcao1pih8r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fkm8q6r8t4jmqia3plcao1pih8r FOREIGN KEY (anuncio_id) REFERENCES public.anuncio(id_anuncio);


--
-- TOC entry 3477 (class 2606 OID 35612)
-- Name: grupo fkmabbfeklclq6kit2wnnkgfak0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fkmabbfeklclq6kit2wnnkgfak0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3446 (class 2606 OID 35462)
-- Name: depoimento fkmh11nyrmuejhtnlbo1tdxp88v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkmh11nyrmuejhtnlbo1tdxp88v FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3451 (class 2606 OID 35472)
-- Name: egresso fkn1xoojso0x5qw602exgvv7v84; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkn1xoojso0x5qw602exgvv7v84 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3485 (class 2606 OID 35662)
-- Name: titulacao fko1m66fdoqs86cucbvl928kes4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT fko1m66fdoqs86cucbvl928kes4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3466 (class 2606 OID 35537)
-- Name: egresso_titulacao fkp74iffsl9ivplq4gkuhyuvsh8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkp74iffsl9ivplq4gkuhyuvsh8 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3439 (class 2606 OID 35422)
-- Name: contribuicao fkpm3k93anx938a8ab7bnw2ct0u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fkpm3k93anx938a8ab7bnw2ct0u FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3458 (class 2606 OID 35517)
-- Name: egresso_empresa fkqdv2ixbxjn0jihxwra9tadgkb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkqdv2ixbxjn0jihxwra9tadgkb FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3475 (class 2606 OID 35607)
-- Name: genero fkqpmjfeicduajada8ttfr6fvbn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT fkqpmjfeicduajada8ttfr6fvbn FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3459 (class 2606 OID 35522)
-- Name: egresso_empresa fkrrdwo5y0sss2aq6r989sngy0g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkrrdwo5y0sss2aq6r989sngy0g FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3460 (class 2606 OID 35527)
-- Name: egresso_empresa fks0wngwsneahqe1p80rh1olamu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fks0wngwsneahqe1p80rh1olamu FOREIGN KEY (empresa_id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3469 (class 2606 OID 35577)
-- Name: empresa fks5bj6jkkca1s0d3jgw4wioi9g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fks5bj6jkkca1s0d3jgw4wioi9g FOREIGN KEY (endereco_empresa) REFERENCES public.endereco(id_endereco);


--
-- TOC entry 3471 (class 2606 OID 35582)
-- Name: endereco fkse5padocuj89r79jwdeif1l5i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fkse5padocuj89r79jwdeif1l5i FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3486 (class 2606 OID 35657)
-- Name: titulacao fkt7h0tods16trs2x26gd6fkmca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT fkt7h0tods16trs2x26gd6fkmca FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


-- Completed on 2023-04-30 22:25:58 -03

--
-- PostgreSQL database dump complete
--

