CREATE TABLE IF NOT EXISTS public.anuncio (
    id_anuncio integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    descricao_anuncio character varying(600) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 214 (class 1259 OID 17929)
-- Name: anuncio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.anuncio_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 233 (class 1259 OID 18407)
-- Name: comentario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.comentario (
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
-- TOC entry 215 (class 1259 OID 17930)
-- Name: comentario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.comentario_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 234 (class 1259 OID 18413)
-- Name: contribuicao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.contribuicao (
    id_contribuicao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    descricao_contribuicao character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 216 (class 1259 OID 17931)
-- Name: contribuicao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.contribuicao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 235 (class 1259 OID 18419)
-- Name: cota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.cota (
    id_cota integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_cota character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 217 (class 1259 OID 17932)
-- Name: cota_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.cota_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 236 (class 1259 OID 18425)
-- Name: curso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.curso (
    id_curso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_curso character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 218 (class 1259 OID 17933)
-- Name: curso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.curso_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 237 (class 1259 OID 18431)
-- Name: depoimento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.depoimento (
    id_depoimento integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    descricao_depoimento character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer,
    egresso_id integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 17934)
-- Name: depoimento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.depoimento_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 238 (class 1259 OID 18437)
-- Name: egresso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso (
    id_egresso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    interesse_em_pos_egresso boolean NOT NULL,
    lattes_egresso character varying(255) NOT NULL,
    linkedin_egresso character varying(255) NOT NULL,
    nascimento_usuario date NOT NULL,
    pcd_egresso boolean NOT NULL,
    created_by integer,
    last_modified_by integer,
    cota_id integer NOT NULL,
    endereco_id integer NOT NULL,
    etnia_id integer NOT NULL,
    genero_id integer NOT NULL,
    usuario_id integer NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 18445)
-- Name: egresso_colacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_colacao (
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    data_conclusao date,
    data_ingresso date NOT NULL,
    egresso_id_egresso integer NOT NULL,
    colacao_id_titulacao integer NOT NULL,
    created_by integer,
    last_modified_by integer,
    curso_id integer NOT NULL,
    empresa_id integer NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 18451)
-- Name: egresso_contribuicao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_contribuicao (
    id_contribuicao integer NOT NULL,
    egresso_id integer NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 18456)
-- Name: egresso_empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_empresa (
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    area_atuacao character varying(50) NOT NULL,
    empresa_id_empresa integer NOT NULL,
    egresso_id_egresso integer NOT NULL,
    created_by integer,
    last_modified_by integer,
    faixa_salarial_id integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 17935)
-- Name: egresso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.egresso_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 242 (class 1259 OID 18462)
-- Name: egresso_tabalho_publicado; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_tabalho_publicado (
    id_trabalho_publicado integer NOT NULL,
    id_usuario integer NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 18467)
-- Name: empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.empresa (
    id_empresa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_empresa character varying(130) NOT NULL,
    setor_atuacao_empresa character varying(130) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 221 (class 1259 OID 17936)
-- Name: empresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.empresa_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 244 (class 1259 OID 18473)
-- Name: endereco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.endereco (
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
-- TOC entry 222 (class 1259 OID 17937)
-- Name: endereco_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.endereco_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 245 (class 1259 OID 18481)
-- Name: etnia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.etnia (
    id_etnia integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_etnia character varying(30),
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 223 (class 1259 OID 17938)
-- Name: etnia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.etnia_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 246 (class 1259 OID 18487)
-- Name: faixa_salarial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.faixa_salarial (
    id_faixa_salarial integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    faixa_faixa_salarial character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 224 (class 1259 OID 17939)
-- Name: faixa_salarial_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.faixa_salarial_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 247 (class 1259 OID 18493)
-- Name: genero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.genero (
    id_genero integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_genero character varying(100),
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 225 (class 1259 OID 17940)
-- Name: genero_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.genero_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 248 (class 1259 OID 18499)
-- Name: grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.grupo (
    id_grupo integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_grupo character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 226 (class 1259 OID 17941)
-- Name: grupo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.grupo_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 249 (class 1259 OID 18505)
-- Name: pesquisa_cientifica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.pesquisa_cientifica (
    id_pesquisa_cientifica integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    fim date NOT NULL,
    inicio date NOT NULL,
    nome_pesquisa_cientifica character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer,
    empresa_id integer NOT NULL,
    tipo_bolsa_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 17942)
-- Name: pesquisa_cientifica_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.pesquisa_cientifica_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 250 (class 1259 OID 18511)
-- Name: tipo_bolsa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.tipo_bolsa (
    id_tipo_bolsa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_tipo_bolsa character varying(100) NOT NULL,
    remuneracao_tipo_bolsa double precision NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 228 (class 1259 OID 17943)
-- Name: tipo_bolsa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.tipo_bolsa_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 251 (class 1259 OID 18517)
-- Name: titulacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.titulacao (
    id_titulacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    nome_titulacao character varying(30) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 229 (class 1259 OID 17944)
-- Name: titulacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.titulacao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 252 (class 1259 OID 18523)
-- Name: trabalho_publicado; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.trabalho_publicado (
    id_trabalho_publicado integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    link_trabalho_publico character varying(255) NOT NULL,
    nome_trabalho_publicado character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 230 (class 1259 OID 17945)
-- Name: trabalho_publicado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.trabalho_publicado_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 253 (class 1259 OID 18531)
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.usuario (
    id_usuario integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone,
    last_modified_date timestamp(6) without time zone,
    email character varying(50) NOT NULL,
    matricula_usuario character varying(12) NOT NULL,
    nome_usuario character varying(30) NOT NULL,
    senha_usuario character varying(80) NOT NULL,
    login_usuario character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 254 (class 1259 OID 18894)
-- Name: usuario_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.usuario_grupo (
    id_usuario integer NOT NULL,
    id_grupo integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 17946)
-- Name: usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.usuario_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3626 (class 0 OID 18399)
-- Dependencies: 232
-- Data for Name: anuncio; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3627 (class 0 OID 18407)
-- Dependencies: 233
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3628 (class 0 OID 18413)
-- Dependencies: 234
-- Data for Name: contribuicao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3629 (class 0 OID 18419)
-- Dependencies: 235
-- Data for Name: cota; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cota VALUES (1, true, '2023-04-23 20:20:46.237', '2023-04-23 20:20:46.237', 'BAIXA RENDA', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.cota VALUES (2, true, '2023-04-23 20:20:56.222', '2023-04-23 20:20:56.222', 'PRETO PARDO INDIGENA', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.cota VALUES (3, true, '2023-04-23 20:21:02.559', '2023-04-23 20:21:02.559', 'PRETO PARDO INDIGENA E BAIXA RENDA', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.cota VALUES (4, true, '2023-04-23 20:21:08.142', '2023-04-23 20:21:08.142', 'ESCOLA', 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3630 (class 0 OID 18425)
-- Dependencies: 236
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.curso VALUES (1, true, '2023-04-23 20:20:28.327', '2023-04-23 20:20:28.327', 'CIÊNCIA DA COMPUTAÇÃO', 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3631 (class 0 OID 18431)
-- Dependencies: 237
-- Data for Name: depoimento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3632 (class 0 OID 18437)
-- Dependencies: 238
-- Data for Name: egresso; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3633 (class 0 OID 18445)
-- Dependencies: 239
-- Data for Name: egresso_colacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3634 (class 0 OID 18451)
-- Dependencies: 240
-- Data for Name: egresso_contribuicao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3635 (class 0 OID 18456)
-- Dependencies: 241
-- Data for Name: egresso_empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3636 (class 0 OID 18462)
-- Dependencies: 242
-- Data for Name: egresso_tabalho_publicado; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3637 (class 0 OID 18467)
-- Dependencies: 243
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.empresa VALUES (1, true, '2023-04-23 20:19:41.579', '2023-04-23 20:19:41.579', 'UNIVERSIDADE FEDERAL DO PARA', 'EDUCAÇÃO', 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3638 (class 0 OID 18473)
-- Dependencies: 244
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.endereco VALUES (1, true, '2023-04-23 20:19:14.43', '2023-04-23 20:19:14.43', 'BARCARENA', 'PARÁ', 'BRASIL', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco VALUES (2, true, '2023-04-23 20:19:15.903', '2023-04-23 20:19:15.903', 'BARCARENA', 'PARÁ', 'BRASIL', 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3639 (class 0 OID 18481)
-- Dependencies: 245
-- Data for Name: etnia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.etnia VALUES (1, true, '2023-04-23 20:18:34.115', '2023-04-23 20:18:34.115', 'BRANCO', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.etnia VALUES (2, true, '2023-04-23 20:18:44.645', '2023-04-23 20:18:44.645', 'PARDO', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.etnia VALUES (3, true, '2023-04-23 20:18:48.579', '2023-04-23 20:18:48.579', 'PRETO', 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3640 (class 0 OID 18487)
-- Dependencies: 246
-- Data for Name: faixa_salarial; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.faixa_salarial VALUES (1, true, '2023-04-23 20:17:21.199', '2023-04-23 20:17:21.199', '1 salário mínimo', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.faixa_salarial VALUES (2, true, '2023-04-23 20:17:33.688', '2023-04-23 20:17:33.688', '1 a 2 salários mínimo', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.faixa_salarial VALUES (3, true, '2023-04-23 20:17:40.664', '2023-04-23 20:17:40.664', '3 a 5 salários mínimo', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.faixa_salarial VALUES (4, true, '2023-04-23 20:17:57.34', '2023-04-23 20:17:57.34', '6 ou mais salários mínimo', 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3641 (class 0 OID 18493)
-- Dependencies: 247
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genero VALUES (1, true, '2023-04-23 20:16:27.119', '2023-04-23 20:16:27.119', 'Masculino', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.genero VALUES (2, true, '2023-04-23 20:16:33.481', '2023-04-23 20:16:33.481', 'Feminino', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.genero VALUES (3, true, '2023-04-23 20:16:37.465', '2023-04-23 20:16:37.465', 'Outros', 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3642 (class 0 OID 18499)
-- Dependencies: 248
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.grupo VALUES (1, true, '2023-04-22 01:38:25.666', '2023-04-22 01:38:25.666', 'ADMIN', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.grupo VALUES (2, true, '2023-04-22 01:38:25.666', '2023-04-22 01:38:25.666', 'SECRETARIO', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.grupo VALUES (3, true, '2023-04-22 01:38:25.666', '2023-04-22 01:38:25.666', 'EGRESSO', NULL, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3643 (class 0 OID 18505)
-- Dependencies: 249
-- Data for Name: pesquisa_cientifica; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3644 (class 0 OID 18511)
-- Dependencies: 250
-- Data for Name: tipo_bolsa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipo_bolsa VALUES (1, true, '2023-04-23 20:15:48.237', '2023-04-23 20:15:48.237', 'PIBIC', 700, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.tipo_bolsa VALUES (2, true, '2023-04-23 20:15:56.48', '2023-04-23 20:15:56.48', 'PIBIX', 1400, 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3645 (class 0 OID 18517)
-- Dependencies: 251
-- Data for Name: titulacao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.titulacao VALUES (1, true, '2023-04-23 20:21:28.472', '2023-04-23 20:21:28.472', 'GRADUAÇÃO', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.titulacao VALUES (3, true, '2023-04-23 20:21:42.103', '2023-04-23 20:21:42.103', 'MESTRADO', 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.titulacao VALUES (4, true, '2023-04-23 20:21:48.189', '2023-04-23 20:21:48.189', 'DOUTORADO', 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3646 (class 0 OID 18523)
-- Dependencies: 252
-- Data for Name: trabalho_publicado; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3647 (class 0 OID 18531)
-- Dependencies: 253
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario VALUES (1, true, '2023-04-22 14:34:40.702', '2023-04-22 14:34:40.702', 'admin@admin.com', '123456789', 'ADMIN ADMIN', '{bcrypt}$2a$10$vh9/MkL4XQyd.fqkQdnWSelTUxPBpDb6qL5W2uWLxLUN0JR9vwRZm', 'ADMIN', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.usuario VALUES (2, true, '2023-04-22 14:35:09.149', '2023-04-22 14:35:09.149', 'secretario@secretario.com', '3131313', 'SECRETARIO SECRETARIO', '{bcrypt}$2a$10$biZwxymZqQDevuqWzB/wCe0jfC6Idr.SJRYO9oXBFPuusp9oA9hAy', 'SECRETARIO', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.usuario VALUES (3, true, '2023-04-22 14:35:30.354', '2023-04-22 14:35:30.354', 'egresso@egresso.com', '9466165', 'EGRESSO EGRESSO', '{bcrypt}$2a$10$Tas4Xjqxogotz3bSL08nHOZRUNF9WJZuPthj2qn3maJMjwI2/uHtO', 'EGRESSO', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.usuario VALUES (102, true, '2023-04-23 19:57:41.838', '2023-04-23 19:57:41.838', 'ssss@egresso.com', 'teste', 'teste EGRESSO', '{bcrypt}$2a$10$Ual6FYgLOGVcntrBBdbb0Of8J7X4QMTS5sFm8NSEY2DWDCx0P4vAO', 'teste', NULL, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3648 (class 0 OID 18894)
-- Dependencies: 254
-- Data for Name: usuario_grupo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario_grupo VALUES (1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.usuario_grupo VALUES (2, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.usuario_grupo VALUES (3, 3) ON CONFLICT DO NOTHING;


--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 214
-- Name: anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.anuncio_seq', 1, false);


--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 215
-- Name: comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comentario_seq', 1, false);


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 216
-- Name: contribuicao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribuicao_seq', 1, false);


--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 217
-- Name: cota_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cota_seq', 51, true);


--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 218
-- Name: curso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.curso_seq', 1, true);


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 219
-- Name: depoimento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.depoimento_seq', 1, false);


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 220
-- Name: egresso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_seq', 1, false);


--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 221
-- Name: empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.empresa_seq', 1, true);


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 222
-- Name: endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.endereco_seq', 51, true);


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 223
-- Name: etnia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.etnia_seq', 51, true);


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 224
-- Name: faixa_salarial_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faixa_salarial_seq', 51, true);


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 225
-- Name: genero_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genero_seq', 51, true);


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 226
-- Name: grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grupo_seq', 1, false);


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 227
-- Name: pesquisa_cientifica_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pesquisa_cientifica_seq', 1, false);


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 228
-- Name: tipo_bolsa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_bolsa_seq', 51, true);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 229
-- Name: titulacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.titulacao_seq', 51, true);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 230
-- Name: trabalho_publicado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trabalho_publicado_seq', 1, false);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 231
-- Name: usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_seq', 151, true);


--
-- TOC entry 3327 (class 2606 OID 18406)
-- Name: anuncio anuncio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT anuncio_pkey PRIMARY KEY (id_anuncio);


--
-- TOC entry 3329 (class 2606 OID 18412)
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id_comentario);


--
-- TOC entry 3331 (class 2606 OID 18418)
-- Name: contribuicao contribuicao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT contribuicao_pkey PRIMARY KEY (id_contribuicao);


--
-- TOC entry 3333 (class 2606 OID 18424)
-- Name: cota cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT cota_pkey PRIMARY KEY (id_cota);


--
-- TOC entry 3337 (class 2606 OID 18430)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 3341 (class 2606 OID 18436)
-- Name: depoimento depoimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT depoimento_pkey PRIMARY KEY (id_depoimento);


--
-- TOC entry 3349 (class 2606 OID 18450)
-- Name: egresso_colacao egresso_colacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_colacao
    ADD CONSTRAINT egresso_colacao_pkey PRIMARY KEY (colacao_id_titulacao, egresso_id_egresso);


--
-- TOC entry 3351 (class 2606 OID 18455)
-- Name: egresso_contribuicao egresso_contribuicao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_contribuicao
    ADD CONSTRAINT egresso_contribuicao_pkey PRIMARY KEY (id_contribuicao, egresso_id);


--
-- TOC entry 3353 (class 2606 OID 18461)
-- Name: egresso_empresa egresso_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT egresso_empresa_pkey PRIMARY KEY (egresso_id_egresso, empresa_id_empresa);


--
-- TOC entry 3345 (class 2606 OID 18444)
-- Name: egresso egresso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT egresso_pkey PRIMARY KEY (id_egresso);


--
-- TOC entry 3355 (class 2606 OID 18466)
-- Name: egresso_tabalho_publicado egresso_tabalho_publicado_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_tabalho_publicado
    ADD CONSTRAINT egresso_tabalho_publicado_pkey PRIMARY KEY (id_trabalho_publicado, id_usuario);


--
-- TOC entry 3357 (class 2606 OID 18472)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 3359 (class 2606 OID 18480)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 3361 (class 2606 OID 18486)
-- Name: etnia etnia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.etnia
    ADD CONSTRAINT etnia_pkey PRIMARY KEY (id_etnia);


--
-- TOC entry 3363 (class 2606 OID 18492)
-- Name: faixa_salarial faixa_salarial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT faixa_salarial_pkey PRIMARY KEY (id_faixa_salarial);


--
-- TOC entry 3367 (class 2606 OID 18498)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3369 (class 2606 OID 18504)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 3373 (class 2606 OID 18510)
-- Name: pesquisa_cientifica pesquisa_cientifica_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT pesquisa_cientifica_pkey PRIMARY KEY (id_pesquisa_cientifica);


--
-- TOC entry 3385 (class 2606 OID 18516)
-- Name: tipo_bolsa tipo_bolsa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT tipo_bolsa_pkey PRIMARY KEY (id_tipo_bolsa);


--
-- TOC entry 3389 (class 2606 OID 18522)
-- Name: titulacao titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT titulacao_pkey PRIMARY KEY (id_titulacao);


--
-- TOC entry 3393 (class 2606 OID 18530)
-- Name: trabalho_publicado trabalho_publicado_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trabalho_publicado
    ADD CONSTRAINT trabalho_publicado_pkey PRIMARY KEY (id_trabalho_publicado);


--
-- TOC entry 3403 (class 2606 OID 18898)
-- Name: usuario_grupo uk344o72atx8e0qj0fkrrjo4pvw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT uk344o72atx8e0qj0fkrrjo4pvw UNIQUE (id_usuario, id_grupo);


--
-- TOC entry 3397 (class 2606 OID 18569)
-- Name: usuario uk_1j9q7kkp12suxliwuyopqovnd; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_1j9q7kkp12suxliwuyopqovnd UNIQUE (matricula_usuario);


--
-- TOC entry 3365 (class 2606 OID 18549)
-- Name: faixa_salarial uk_2bn1lsqed44xqtrtq17s7tjue; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT uk_2bn1lsqed44xqtrtq17s7tjue UNIQUE (faixa_faixa_salarial);


--
-- TOC entry 3375 (class 2606 OID 18561)
-- Name: pesquisa_cientifica uk_3rka6fa74y70gole2j84l4se6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT uk_3rka6fa74y70gole2j84l4se6 UNIQUE (tipo_bolsa_id);


--
-- TOC entry 3347 (class 2606 OID 18547)
-- Name: egresso uk_3tmslc9ltmjdyy2mbstgpf1un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_3tmslc9ltmjdyy2mbstgpf1un UNIQUE (usuario_id);


--
-- TOC entry 3377 (class 2606 OID 18555)
-- Name: pesquisa_cientifica uk_4p8pb1j2o2cb350tekkdcmfxi; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT uk_4p8pb1j2o2cb350tekkdcmfxi UNIQUE (inicio);


--
-- TOC entry 3399 (class 2606 OID 18571)
-- Name: usuario uk_8efax56av7vfdquauh0gyl9cx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_8efax56av7vfdquauh0gyl9cx UNIQUE (login_usuario);


--
-- TOC entry 3335 (class 2606 OID 18541)
-- Name: cota uk_9k3kf2b9f2mjv11ksekdha97k; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT uk_9k3kf2b9f2mjv11ksekdha97k UNIQUE (nome_cota);


--
-- TOC entry 3395 (class 2606 OID 18567)
-- Name: trabalho_publicado uk_auqx5ujp3bqhc5gla7lmmhmc5; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trabalho_publicado
    ADD CONSTRAINT uk_auqx5ujp3bqhc5gla7lmmhmc5 UNIQUE (nome_trabalho_publicado);


--
-- TOC entry 3379 (class 2606 OID 18557)
-- Name: pesquisa_cientifica uk_c59t92u7dloaowxaxyoou9n3; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT uk_c59t92u7dloaowxaxyoou9n3 UNIQUE (nome_pesquisa_cientifica);


--
-- TOC entry 3381 (class 2606 OID 18559)
-- Name: pesquisa_cientifica uk_cl6mu5f6c7u8201hyvmj50yl6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT uk_cl6mu5f6c7u8201hyvmj50yl6 UNIQUE (empresa_id);


--
-- TOC entry 3383 (class 2606 OID 18553)
-- Name: pesquisa_cientifica uk_g78g7we6eclwcec6f6yflh9jw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT uk_g78g7we6eclwcec6f6yflh9jw UNIQUE (fim);


--
-- TOC entry 3339 (class 2606 OID 18543)
-- Name: curso uk_i35k8uavr3s5cxr12aefe00e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT uk_i35k8uavr3s5cxr12aefe00e UNIQUE (nome_curso);


--
-- TOC entry 3371 (class 2606 OID 18551)
-- Name: grupo uk_is0kvc71ivi2o1nhe7h19m47p; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT uk_is0kvc71ivi2o1nhe7h19m47p UNIQUE (nome_grupo);


--
-- TOC entry 3387 (class 2606 OID 18563)
-- Name: tipo_bolsa uk_j6yqoqsrpie5ipmlh6c5jbrx1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT uk_j6yqoqsrpie5ipmlh6c5jbrx1 UNIQUE (nome_tipo_bolsa);


--
-- TOC entry 3343 (class 2606 OID 18545)
-- Name: depoimento uk_rpha5d7rfphcjvj0nbjb1nvxs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT uk_rpha5d7rfphcjvj0nbjb1nvxs UNIQUE (egresso_id);


--
-- TOC entry 3391 (class 2606 OID 18565)
-- Name: titulacao uk_rvnwm2n5juoh0aj3qnssh52nm; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT uk_rvnwm2n5juoh0aj3qnssh52nm UNIQUE (nome_titulacao);


--
-- TOC entry 3401 (class 2606 OID 18536)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3440 (class 2606 OID 18752)
-- Name: empresa fk1252u5xj526ufsf5c3c9fcic2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk1252u5xj526ufsf5c3c9fcic2 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3446 (class 2606 OID 18787)
-- Name: faixa_salarial fk12fuee7y4kjstxd7xwk3fageo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT fk12fuee7y4kjstxd7xwk3fageo FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3411 (class 2606 OID 18612)
-- Name: cota fk1lve8o0jw4i8ksl2dxp0lm8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT fk1lve8o0jw4i8ksl2dxp0lm8 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3444 (class 2606 OID 18772)
-- Name: etnia fk2gady9tv8ecy50ushe4dahyll; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.etnia
    ADD CONSTRAINT fk2gady9tv8ecy50ushe4dahyll FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3456 (class 2606 OID 18837)
-- Name: tipo_bolsa fk3c5grr0qggvj0dw2fada2xhyv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT fk3c5grr0qggvj0dw2fada2xhyv FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3418 (class 2606 OID 18672)
-- Name: egresso fk3lb1ai4t6bvvsu9jc9qm0fisi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fk3lb1ai4t6bvvsu9jc9qm0fisi FOREIGN KEY (usuario_id) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3438 (class 2606 OID 18742)
-- Name: egresso_tabalho_publicado fk3sf576u4g9plod0u1p97rte3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_tabalho_publicado
    ADD CONSTRAINT fk3sf576u4g9plod0u1p97rte3 FOREIGN KEY (id_usuario) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3413 (class 2606 OID 18617)
-- Name: curso fk3tu6gxj4fe3b8vgyhhr17p5d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk3tu6gxj4fe3b8vgyhhr17p5d1 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3415 (class 2606 OID 18632)
-- Name: depoimento fk4282xxihuiq8nqknlkrlmn6k7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fk4282xxihuiq8nqknlkrlmn6k7 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3431 (class 2606 OID 18707)
-- Name: egresso_contribuicao fk4gvopbnet1mmho04h7co01nac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_contribuicao
    ADD CONSTRAINT fk4gvopbnet1mmho04h7co01nac FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3448 (class 2606 OID 18792)
-- Name: genero fk4hmk8te4ct41ket6gewknyld3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT fk4hmk8te4ct41ket6gewknyld3 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3450 (class 2606 OID 18807)
-- Name: grupo fk4x87bpegbq5yd4awx0jpyl7rf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fk4x87bpegbq5yd4awx0jpyl7rf FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3406 (class 2606 OID 18587)
-- Name: comentario fk5k6dqdx9kn983dj5jx5orhss0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fk5k6dqdx9kn983dj5jx5orhss0 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3425 (class 2606 OID 18697)
-- Name: egresso_colacao fk5s4jvmhaxcxqf9ns9emjxsfcl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_colacao
    ADD CONSTRAINT fk5s4jvmhaxcxqf9ns9emjxsfcl FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3445 (class 2606 OID 18777)
-- Name: etnia fk61v53y0v0kn5dqm3lk01nmyla; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.etnia
    ADD CONSTRAINT fk61v53y0v0kn5dqm3lk01nmyla FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3409 (class 2606 OID 18597)
-- Name: contribuicao fk7x5ccymo3mvys7sdoar4w27jy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk7x5ccymo3mvys7sdoar4w27jy FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3419 (class 2606 OID 18657)
-- Name: egresso fk8fxxf75hx1hh70l37mgssxq7x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fk8fxxf75hx1hh70l37mgssxq7x FOREIGN KEY (endereco_id) REFERENCES public.endereco(id_endereco);


--
-- TOC entry 3447 (class 2606 OID 18782)
-- Name: faixa_salarial fk96o103aeo1xeuhgnn0hhs6bl0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT fk96o103aeo1xeuhgnn0hhs6bl0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3457 (class 2606 OID 18832)
-- Name: tipo_bolsa fk9brd9pf3m513c4qwotx7j5l5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT fk9brd9pf3m513c4qwotx7j5l5f FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3464 (class 2606 OID 18904)
-- Name: usuario_grupo fk9huj1upwjyabwkwnpnhnernnu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fk9huj1upwjyabwkwnpnhnernnu FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3441 (class 2606 OID 18757)
-- Name: empresa fka0nk763e7luto0itr7it6y5gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fka0nk763e7luto0itr7it6y5gr FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3407 (class 2606 OID 18582)
-- Name: comentario fkac7bpbirc6r6vcplb0fptftnx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fkac7bpbirc6r6vcplb0fptftnx FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3426 (class 2606 OID 18677)
-- Name: egresso_colacao fkad0lc8uoy6j5vi41gtjxwjmbx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_colacao
    ADD CONSTRAINT fkad0lc8uoy6j5vi41gtjxwjmbx FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3416 (class 2606 OID 18627)
-- Name: depoimento fkadydhxggbqc2ahkodd8du6s2t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkadydhxggbqc2ahkodd8du6s2t FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3420 (class 2606 OID 18662)
-- Name: egresso fkais2tyr121r8riq5shnxis9a5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkais2tyr121r8riq5shnxis9a5 FOREIGN KEY (etnia_id) REFERENCES public.etnia(id_etnia);


--
-- TOC entry 3452 (class 2606 OID 18822)
-- Name: pesquisa_cientifica fkb1v55t12ysomaf0pjgmbm0ol4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT fkb1v55t12ysomaf0pjgmbm0ol4 FOREIGN KEY (empresa_id) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3427 (class 2606 OID 18702)
-- Name: egresso_colacao fkcbfx8yqfdky3xvvpa2ueglokf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_colacao
    ADD CONSTRAINT fkcbfx8yqfdky3xvvpa2ueglokf FOREIGN KEY (empresa_id) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3412 (class 2606 OID 18607)
-- Name: cota fkcqjq3oy1bo82gon5venmvjw98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT fkcqjq3oy1bo82gon5venmvjw98 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3465 (class 2606 OID 18899)
-- Name: usuario_grupo fkcu6om65mvqr6ct95ijgqgx7ww; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fkcu6om65mvqr6ct95ijgqgx7ww FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo);


--
-- TOC entry 3433 (class 2606 OID 18737)
-- Name: egresso_empresa fkdut9kbfj1c87myf42xmao3aja; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkdut9kbfj1c87myf42xmao3aja FOREIGN KEY (faixa_salarial_id) REFERENCES public.faixa_salarial(id_faixa_salarial);


--
-- TOC entry 3460 (class 2606 OID 18857)
-- Name: trabalho_publicado fkejj6gibgk52smjgtgls1ghvcw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trabalho_publicado
    ADD CONSTRAINT fkejj6gibgk52smjgtgls1ghvcw FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3453 (class 2606 OID 18827)
-- Name: pesquisa_cientifica fkewerpa5ejhivluvp6biw6ml10; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT fkewerpa5ejhivluvp6biw6ml10 FOREIGN KEY (tipo_bolsa_id) REFERENCES public.tipo_bolsa(id_tipo_bolsa);


--
-- TOC entry 3421 (class 2606 OID 18652)
-- Name: egresso fkexkpbpskvab604sytj2vwkbbi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkexkpbpskvab604sytj2vwkbbi FOREIGN KEY (cota_id) REFERENCES public.cota(id_cota);


--
-- TOC entry 3404 (class 2606 OID 18577)
-- Name: anuncio fkf2afyb5u9a2g5kv1wce78ur8t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkf2afyb5u9a2g5kv1wce78ur8t FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3422 (class 2606 OID 18642)
-- Name: egresso fkf322p240i2h2i9sgcn5wjfaot; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkf322p240i2h2i9sgcn5wjfaot FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3461 (class 2606 OID 18852)
-- Name: trabalho_publicado fkh9i8ep2j6ifsmtl46j8pakcfo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trabalho_publicado
    ADD CONSTRAINT fkh9i8ep2j6ifsmtl46j8pakcfo FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3434 (class 2606 OID 18717)
-- Name: egresso_empresa fkhytqndbt06s83doal9nmgcksj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkhytqndbt06s83doal9nmgcksj FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3442 (class 2606 OID 18767)
-- Name: endereco fki98kyuu68rp4942s3r9vkko6x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fki98kyuu68rp4942s3r9vkko6x FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3414 (class 2606 OID 18622)
-- Name: curso fkiiafe2qpikwi45ggt4p8a5mik; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fkiiafe2qpikwi45ggt4p8a5mik FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3405 (class 2606 OID 18572)
-- Name: anuncio fkjw0029cxurvkx45044e65h64x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkjw0029cxurvkx45044e65h64x FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3423 (class 2606 OID 18667)
-- Name: egresso fkk0wr6p5gu54r773ttv5iira6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkk0wr6p5gu54r773ttv5iira6f FOREIGN KEY (genero_id) REFERENCES public.genero(id_genero);


--
-- TOC entry 3462 (class 2606 OID 18862)
-- Name: usuario fkkkymwf8xy047tl0035rhlfpq5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkkkymwf8xy047tl0035rhlfpq5 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3463 (class 2606 OID 18867)
-- Name: usuario fkl4ghr4b3u1vycv960y09ss9a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkl4ghr4b3u1vycv960y09ss9a4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3428 (class 2606 OID 18692)
-- Name: egresso_colacao fklv0r9bo87w7g07k5sxdq528n6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_colacao
    ADD CONSTRAINT fklv0r9bo87w7g07k5sxdq528n6 FOREIGN KEY (curso_id) REFERENCES public.curso(id_curso);


--
-- TOC entry 3408 (class 2606 OID 18592)
-- Name: comentario fkm8q6r8t4jmqia3plcao1pih8r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fkm8q6r8t4jmqia3plcao1pih8r FOREIGN KEY (anuncio_id) REFERENCES public.anuncio(id_anuncio);


--
-- TOC entry 3451 (class 2606 OID 18802)
-- Name: grupo fkmabbfeklclq6kit2wnnkgfak0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fkmabbfeklclq6kit2wnnkgfak0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3417 (class 2606 OID 18637)
-- Name: depoimento fkmh11nyrmuejhtnlbo1tdxp88v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkmh11nyrmuejhtnlbo1tdxp88v FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3439 (class 2606 OID 18747)
-- Name: egresso_tabalho_publicado fkms1rd8cb5i9kwchng3bn8xx72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_tabalho_publicado
    ADD CONSTRAINT fkms1rd8cb5i9kwchng3bn8xx72 FOREIGN KEY (id_trabalho_publicado) REFERENCES public.trabalho_publicado(id_trabalho_publicado);


--
-- TOC entry 3424 (class 2606 OID 18647)
-- Name: egresso fkn1xoojso0x5qw602exgvv7v84; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkn1xoojso0x5qw602exgvv7v84 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3454 (class 2606 OID 18817)
-- Name: pesquisa_cientifica fknykoy5ti3sn6kqj400se34h1k; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT fknykoy5ti3sn6kqj400se34h1k FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3458 (class 2606 OID 18847)
-- Name: titulacao fko1m66fdoqs86cucbvl928kes4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT fko1m66fdoqs86cucbvl928kes4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3429 (class 2606 OID 18687)
-- Name: egresso_colacao fkoa0s7u5ldhsvj60d9k8me0pm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_colacao
    ADD CONSTRAINT fkoa0s7u5ldhsvj60d9k8me0pm FOREIGN KEY (colacao_id_titulacao) REFERENCES public.titulacao(id_titulacao);


--
-- TOC entry 3410 (class 2606 OID 18602)
-- Name: contribuicao fkpm3k93anx938a8ab7bnw2ct0u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fkpm3k93anx938a8ab7bnw2ct0u FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3455 (class 2606 OID 18812)
-- Name: pesquisa_cientifica fkpy956mebthp6xe40htvdiij85; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesquisa_cientifica
    ADD CONSTRAINT fkpy956mebthp6xe40htvdiij85 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3432 (class 2606 OID 18712)
-- Name: egresso_contribuicao fkq9mn4tfe8aa2ja8eqyqkh2bmi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_contribuicao
    ADD CONSTRAINT fkq9mn4tfe8aa2ja8eqyqkh2bmi FOREIGN KEY (id_contribuicao) REFERENCES public.contribuicao(id_contribuicao);


--
-- TOC entry 3435 (class 2606 OID 18722)
-- Name: egresso_empresa fkqdv2ixbxjn0jihxwra9tadgkb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkqdv2ixbxjn0jihxwra9tadgkb FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3430 (class 2606 OID 18682)
-- Name: egresso_colacao fkqo0363yfvw2wtwmhpmcstw5se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_colacao
    ADD CONSTRAINT fkqo0363yfvw2wtwmhpmcstw5se FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3449 (class 2606 OID 18797)
-- Name: genero fkqpmjfeicduajada8ttfr6fvbn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT fkqpmjfeicduajada8ttfr6fvbn FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3436 (class 2606 OID 18727)
-- Name: egresso_empresa fkrrdwo5y0sss2aq6r989sngy0g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkrrdwo5y0sss2aq6r989sngy0g FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3437 (class 2606 OID 18732)
-- Name: egresso_empresa fks0wngwsneahqe1p80rh1olamu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fks0wngwsneahqe1p80rh1olamu FOREIGN KEY (empresa_id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3443 (class 2606 OID 18762)
-- Name: endereco fkse5padocuj89r79jwdeif1l5i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fkse5padocuj89r79jwdeif1l5i FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3459 (class 2606 OID 18842)
-- Name: titulacao fkt7h0tods16trs2x26gd6fkmca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT fkt7h0tods16trs2x26gd6fkmca FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


-- Completed on 2023-04-23 20:46:49 -03

--
-- PostgreSQL database dump complete
--

