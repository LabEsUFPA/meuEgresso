CREATE TABLE public.plano_trabalho (
    id_plano_trabalho integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_plano_trabalho oid NOT NULL,
    titulo_plano_trabalho character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer,
    lider integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 80905)
-- Name: plano_trabalho_id_plano_trabalho_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plano_trabalho_id_plano_trabalho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 214
-- Name: plano_trabalho_id_plano_trabalho_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plano_trabalho_id_plano_trabalho_seq OWNED BY public.plano_trabalho.id_plano_trabalho;


--
-- TOC entry 217 (class 1259 OID 80915)
-- Name: processo_seletivo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.processo_seletivo (
    id_processo_seletivo integer NOT NULL,
    area_interesse_processo_seletivo character varying(255) NOT NULL,
    fim_processo_seletivo date NOT NULL,
    inicio_processo_seletivo date NOT NULL,
    requisitos_processo_seletivo oid NOT NULL,
    plano_trabalho integer NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 80914)
-- Name: processo_seletivo_id_processo_seletivo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.processo_seletivo_id_processo_seletivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 216
-- Name: processo_seletivo_id_processo_seletivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.processo_seletivo_id_processo_seletivo_seq OWNED BY public.processo_seletivo.id_processo_seletivo;


--
-- TOC entry 219 (class 1259 OID 80922)
-- Name: quadro; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quadro (
    id_plano_trabalho integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    quantidade_tarefas integer DEFAULT 0 NOT NULL,
    tarefas_com_atraso integer DEFAULT 0 NOT NULL,
    tarefas_no_prazo integer DEFAULT 0 NOT NULL,
    created_by integer,
    last_modified_by integer,
    plano_trabalho integer NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 80921)
-- Name: quadro_id_plano_trabalho_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quadro_id_plano_trabalho_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 218
-- Name: quadro_id_plano_trabalho_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quadro_id_plano_trabalho_seq OWNED BY public.quadro.id_plano_trabalho;


--
-- TOC entry 221 (class 1259 OID 80934)
-- Name: recurso_material; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recurso_material (
    id_recurso_material integer NOT NULL,
    descricao_recurso_material character varying(255) NOT NULL,
    plano_trabalho_recurso_material integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 80933)
-- Name: recurso_material_id_recurso_material_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recurso_material_id_recurso_material_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 220
-- Name: recurso_material_id_recurso_material_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recurso_material_id_recurso_material_seq OWNED BY public.recurso_material.id_recurso_material;


--
-- TOC entry 223 (class 1259 OID 80941)
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    email character varying(50) NOT NULL,
    imagem_usuario character varying(255),
    lattes_usuario character varying(255),
    nome_usuario character varying(100) NOT NULL,
    senha_usuario character varying(80),
    provider_usuario character varying(10) NOT NULL,
    provider_id_usuario character varying(100),
    created_by integer,
    last_modified_by integer,
    CONSTRAINT usuario_provider_usuario_check CHECK (((provider_usuario)::text = ANY ((ARRAY['LOCAL'::character varying, 'FACEBOOK'::character varying, 'GOOGLE'::character varying, 'GITHUB'::character varying])::text[])))
);


--
-- TOC entry 224 (class 1259 OID 80952)
-- Name: usuario_grupos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_grupos (
    id_usuario integer NOT NULL,
    grupos character varying(255),
    CONSTRAINT usuario_grupos_grupos_check CHECK (((grupos)::text = ANY ((ARRAY['ADMIN'::character varying, 'PESQUISADOR'::character varying, 'CANDIDATO'::character varying, 'USER'::character varying])::text[])))
);


--
-- TOC entry 222 (class 1259 OID 80940)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 222
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 225 (class 1259 OID 80956)
-- Name: usuario_plano_trabalho; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_plano_trabalho (
    carga_horaria_usuario_plano integer NOT NULL,
    usuario_id_usuario integer NOT NULL,
    planotrabalho_id_plano_trabalho integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 80961)
-- Name: usuario_processo_seletivo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_processo_seletivo (
    aprovado_usuario_processo boolean NOT NULL,
    curriculo_usuario_processo character varying(255) NOT NULL,
    inscricao_usuario_processo date NOT NULL,
    processoseletivo_id_processo_seletivo integer NOT NULL,
    usuario_id_usuario integer NOT NULL
);


--
-- TOC entry 3231 (class 2604 OID 80909)
-- Name: plano_trabalho id_plano_trabalho; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_trabalho ALTER COLUMN id_plano_trabalho SET DEFAULT nextval('public.plano_trabalho_id_plano_trabalho_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 80918)
-- Name: processo_seletivo id_processo_seletivo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processo_seletivo ALTER COLUMN id_processo_seletivo SET DEFAULT nextval('public.processo_seletivo_id_processo_seletivo_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 80925)
-- Name: quadro id_plano_trabalho; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quadro ALTER COLUMN id_plano_trabalho SET DEFAULT nextval('public.quadro_id_plano_trabalho_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 80937)
-- Name: recurso_material id_recurso_material; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurso_material ALTER COLUMN id_recurso_material SET DEFAULT nextval('public.recurso_material_id_recurso_material_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 80944)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3433 (class 0 OID 80906)
-- Dependencies: 215
-- Data for Name: plano_trabalho; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.plano_trabalho VALUES (1, true, '2023-06-19 02:59:45.7472', '2023-06-19 02:59:45.7472', 81056, 'asdsadsad', NULL, NULL, 1);
INSERT INTO public.plano_trabalho VALUES (3, true, '2023-06-19 03:00:09.369874', '2023-06-19 03:00:09.369874', 81058, 'asdsadsadasdasd', NULL, NULL, 1);


--
-- TOC entry 3435 (class 0 OID 80915)
-- Dependencies: 217
-- Data for Name: processo_seletivo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3437 (class 0 OID 80922)
-- Dependencies: 219
-- Data for Name: quadro; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3439 (class 0 OID 80934)
-- Dependencies: 221
-- Data for Name: recurso_material; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3441 (class 0 OID 80941)
-- Dependencies: 223
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario VALUES (1, true, '2023-06-19 02:59:30.143834', '2023-06-19 02:59:30.143834', 'amgabriel1@hotmail.com', 'https://avatars.githubusercontent.com/u/65864188?v=4', NULL, 'Alfredo Gabriel', NULL, 'GITHUB', '65864188', NULL, NULL);


--
-- TOC entry 3442 (class 0 OID 80952)
-- Dependencies: 224
-- Data for Name: usuario_grupos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario_grupos VALUES (1, 'USER');


--
-- TOC entry 3443 (class 0 OID 80956)
-- Dependencies: 225
-- Data for Name: usuario_plano_trabalho; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3444 (class 0 OID 80961)
-- Dependencies: 226
-- Data for Name: usuario_processo_seletivo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 214
-- Name: plano_trabalho_id_plano_trabalho_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plano_trabalho_id_plano_trabalho_seq', 3, true);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 216
-- Name: processo_seletivo_id_processo_seletivo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.processo_seletivo_id_processo_seletivo_seq', 1, false);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 218
-- Name: quadro_id_plano_trabalho_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quadro_id_plano_trabalho_seq', 1, false);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 220
-- Name: recurso_material_id_recurso_material_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recurso_material_id_recurso_material_seq', 1, false);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 222
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, true);


--
-- TOC entry 3248 (class 2606 OID 80913)
-- Name: plano_trabalho plano_trabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_trabalho
    ADD CONSTRAINT plano_trabalho_pkey PRIMARY KEY (id_plano_trabalho);


--
-- TOC entry 3254 (class 2606 OID 80920)
-- Name: processo_seletivo processo_seletivo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processo_seletivo
    ADD CONSTRAINT processo_seletivo_pkey PRIMARY KEY (id_processo_seletivo);


--
-- TOC entry 3256 (class 2606 OID 80932)
-- Name: quadro quadro_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quadro
    ADD CONSTRAINT quadro_pkey PRIMARY KEY (id_plano_trabalho);


--
-- TOC entry 3260 (class 2606 OID 80939)
-- Name: recurso_material recurso_material_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurso_material
    ADD CONSTRAINT recurso_material_pkey PRIMARY KEY (id_recurso_material);


--
-- TOC entry 3264 (class 2606 OID 80975)
-- Name: usuario uk_5171l57faosmj8myawaucatdw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email);


--
-- TOC entry 3262 (class 2606 OID 80973)
-- Name: recurso_material uk_8nlh5xwmyfwi6608orxfle98g; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurso_material
    ADD CONSTRAINT uk_8nlh5xwmyfwi6608orxfle98g UNIQUE (plano_trabalho_recurso_material);


--
-- TOC entry 3250 (class 2606 OID 80969)
-- Name: plano_trabalho uk_e1u86skxcylclplo79xlh8fe8; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_trabalho
    ADD CONSTRAINT uk_e1u86skxcylclplo79xlh8fe8 UNIQUE (titulo_plano_trabalho);


--
-- TOC entry 3252 (class 2606 OID 81101)
-- Name: plano_trabalho uk_l55gxbh5yannonoey8bnfj1yy; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_trabalho
    ADD CONSTRAINT uk_l55gxbh5yannonoey8bnfj1yy UNIQUE (descricao_plano_trabalho);


--
-- TOC entry 3272 (class 2606 OID 80979)
-- Name: usuario_processo_seletivo uk_n9ft9xu3wgb4reopop8q7g1nq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_processo_seletivo
    ADD CONSTRAINT uk_n9ft9xu3wgb4reopop8q7g1nq UNIQUE (curriculo_usuario_processo);


--
-- TOC entry 3258 (class 2606 OID 80971)
-- Name: quadro uk_pmdxr3l1albpr1w0a81o56bsu; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quadro
    ADD CONSTRAINT uk_pmdxr3l1albpr1w0a81o56bsu UNIQUE (plano_trabalho);


--
-- TOC entry 3268 (class 2606 OID 80977)
-- Name: usuario_grupos ukei7j7mi0snx6udnjdi7oc7ste; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupos
    ADD CONSTRAINT ukei7j7mi0snx6udnjdi7oc7ste UNIQUE (id_usuario, grupos);


--
-- TOC entry 3266 (class 2606 OID 80951)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3270 (class 2606 OID 80960)
-- Name: usuario_plano_trabalho usuario_plano_trabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_plano_trabalho
    ADD CONSTRAINT usuario_plano_trabalho_pkey PRIMARY KEY (planotrabalho_id_plano_trabalho, usuario_id_usuario);


--
-- TOC entry 3274 (class 2606 OID 80965)
-- Name: usuario_processo_seletivo usuario_processo_seletivo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_processo_seletivo
    ADD CONSTRAINT usuario_processo_seletivo_pkey PRIMARY KEY (processoseletivo_id_processo_seletivo, usuario_id_usuario);


--
-- TOC entry 3279 (class 2606 OID 81000)
-- Name: quadro fk6jsxkjr2awwepccpee69os6c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quadro
    ADD CONSTRAINT fk6jsxkjr2awwepccpee69os6c3 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3288 (class 2606 OID 81050)
-- Name: usuario_processo_seletivo fk7tf32d6wcs2gxchnb7tbw5cin; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_processo_seletivo
    ADD CONSTRAINT fk7tf32d6wcs2gxchnb7tbw5cin FOREIGN KEY (usuario_id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3282 (class 2606 OID 81015)
-- Name: recurso_material fk9syy4xg3soaelh43snt84aoil; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recurso_material
    ADD CONSTRAINT fk9syy4xg3soaelh43snt84aoil FOREIGN KEY (plano_trabalho_recurso_material) REFERENCES public.plano_trabalho(id_plano_trabalho);


--
-- TOC entry 3285 (class 2606 OID 81030)
-- Name: usuario_grupos fkahi0f6575qt2neai9brd77beo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupos
    ADD CONSTRAINT fkahi0f6575qt2neai9brd77beo FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3275 (class 2606 OID 80980)
-- Name: plano_trabalho fkc72j9x4b9a4p2jd74c75jqtu0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_trabalho
    ADD CONSTRAINT fkc72j9x4b9a4p2jd74c75jqtu0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3276 (class 2606 OID 80990)
-- Name: plano_trabalho fkftw5artqp0yq3htke3yjfm7r5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_trabalho
    ADD CONSTRAINT fkftw5artqp0yq3htke3yjfm7r5 FOREIGN KEY (lider) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3286 (class 2606 OID 81040)
-- Name: usuario_plano_trabalho fkh7h2j3wqd8udt2876wr61aj88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_plano_trabalho
    ADD CONSTRAINT fkh7h2j3wqd8udt2876wr61aj88 FOREIGN KEY (usuario_id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3280 (class 2606 OID 81010)
-- Name: quadro fkjt4hs9sjt8fdxs8w44d8gkksd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quadro
    ADD CONSTRAINT fkjt4hs9sjt8fdxs8w44d8gkksd FOREIGN KEY (plano_trabalho) REFERENCES public.plano_trabalho(id_plano_trabalho);


--
-- TOC entry 3278 (class 2606 OID 80995)
-- Name: processo_seletivo fkjxa533ax8nvbperblfpa2nodd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processo_seletivo
    ADD CONSTRAINT fkjxa533ax8nvbperblfpa2nodd FOREIGN KEY (plano_trabalho) REFERENCES public.plano_trabalho(id_plano_trabalho);


--
-- TOC entry 3277 (class 2606 OID 80985)
-- Name: plano_trabalho fkk633uth9yol5ijgp3eklbb4mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_trabalho
    ADD CONSTRAINT fkk633uth9yol5ijgp3eklbb4mo FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3281 (class 2606 OID 81005)
-- Name: quadro fkkcpkng79piflc2cnaipgosou1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quadro
    ADD CONSTRAINT fkkcpkng79piflc2cnaipgosou1 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3283 (class 2606 OID 81020)
-- Name: usuario fkkkymwf8xy047tl0035rhlfpq5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkkkymwf8xy047tl0035rhlfpq5 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3284 (class 2606 OID 81025)
-- Name: usuario fkl4ghr4b3u1vycv960y09ss9a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkl4ghr4b3u1vycv960y09ss9a4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3289 (class 2606 OID 81045)
-- Name: usuario_processo_seletivo fkn229qtu7v92iyudf90sskwf0g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_processo_seletivo
    ADD CONSTRAINT fkn229qtu7v92iyudf90sskwf0g FOREIGN KEY (processoseletivo_id_processo_seletivo) REFERENCES public.processo_seletivo(id_processo_seletivo);


--
-- TOC entry 3287 (class 2606 OID 81035)
-- Name: usuario_plano_trabalho fktfogfx5cio5s9hsv54dlvlgb7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_plano_trabalho
    ADD CONSTRAINT fktfogfx5cio5s9hsv54dlvlgb7 FOREIGN KEY (planotrabalho_id_plano_trabalho) REFERENCES public.plano_trabalho(id_plano_trabalho);


-- Completed on 2023-06-24 16:22:37 -03

--
-- PostgreSQL database dump complete
--
