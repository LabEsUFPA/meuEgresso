CREATE TABLE public.anuncio (
    id_anuncio integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_anuncio oid NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.anuncio OWNER TO username;

--
-- TOC entry 215 (class 1259 OID 16390)
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.anuncio_id_anuncio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anuncio_id_anuncio_seq OWNER TO username;

--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 215
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.anuncio_id_anuncio_seq OWNED BY public.anuncio.id_anuncio;


--
-- TOC entry 216 (class 1259 OID 16391)
-- Name: area_atuacao; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.area_atuacao (
    id_area_atuacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_area_atuacao character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.area_atuacao OWNER TO username;

--
-- TOC entry 217 (class 1259 OID 16396)
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.area_atuacao_id_area_atuacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_atuacao_id_area_atuacao_seq OWNER TO username;

--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.area_atuacao_id_area_atuacao_seq OWNED BY public.area_atuacao.id_area_atuacao;


--
-- TOC entry 218 (class 1259 OID 16397)
-- Name: comentario; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.comentario (
    id_comentario integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_comentario character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer,
    anuncio_id integer NOT NULL
);


ALTER TABLE public.comentario OWNER TO username;

--
-- TOC entry 219 (class 1259 OID 16402)
-- Name: comentario_id_comentario_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.comentario_id_comentario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_id_comentario_seq OWNER TO username;

--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 219
-- Name: comentario_id_comentario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.comentario_id_comentario_seq OWNED BY public.comentario.id_comentario;


--
-- TOC entry 220 (class 1259 OID 16403)
-- Name: contribuicao; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.contribuicao (
    id_contribuicao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_contribuicao oid NOT NULL,
    created_by integer,
    last_modified_by integer,
    egresso_id integer NOT NULL
);


ALTER TABLE public.contribuicao OWNER TO username;

--
-- TOC entry 221 (class 1259 OID 16408)
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.contribuicao_id_contribuicao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contribuicao_id_contribuicao_seq OWNER TO username;

--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 221
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.contribuicao_id_contribuicao_seq OWNED BY public.contribuicao.id_contribuicao;


--
-- TOC entry 222 (class 1259 OID 16409)
-- Name: cota; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.cota (
    id_cota integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_cota character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.cota OWNER TO username;

--
-- TOC entry 223 (class 1259 OID 16414)
-- Name: cota_id_cota_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.cota_id_cota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cota_id_cota_seq OWNER TO username;

--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 223
-- Name: cota_id_cota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.cota_id_cota_seq OWNED BY public.cota.id_cota;


--
-- TOC entry 224 (class 1259 OID 16415)
-- Name: curso; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.curso (
    id_curso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_curso character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.curso OWNER TO username;

--
-- TOC entry 225 (class 1259 OID 16420)
-- Name: curso_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.curso_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_id_curso_seq OWNER TO username;

--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 225
-- Name: curso_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.curso_id_curso_seq OWNED BY public.curso.id_curso;


--
-- TOC entry 226 (class 1259 OID 16421)
-- Name: depoimento; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.depoimento (
    id_depoimento integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_depoimento oid NOT NULL,
    created_by integer,
    last_modified_by integer,
    egresso_id integer NOT NULL
);


ALTER TABLE public.depoimento OWNER TO username;

--
-- TOC entry 227 (class 1259 OID 16426)
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.depoimento_id_depoimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.depoimento_id_depoimento_seq OWNER TO username;

--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 227
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.depoimento_id_depoimento_seq OWNED BY public.depoimento.id_depoimento;


--
-- TOC entry 228 (class 1259 OID 16427)
-- Name: egresso; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.egresso (
    id_egresso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    bolsista_egresso boolean NOT NULL,
    cotista_egresso boolean NOT NULL,
    interesse_em_pos_egresso boolean NOT NULL,
    lattes_egresso character varying(255),
    linkedin_egresso character varying(255),
    matricula_egresso character varying(12),
    nascimento_egresso date NOT NULL,
    pos_graducao_egresso boolean,
    remuneracao_bolsa_egresso double precision,
    created_by integer,
    last_modified_by integer,
    tipo_bolsa_id integer,
    genero_id integer NOT NULL,
    usuario_id integer
);


ALTER TABLE public.egresso OWNER TO username;

--
-- TOC entry 229 (class 1259 OID 16434)
-- Name: egresso_area_atuacao; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.egresso_area_atuacao (
    id_area_atuacao integer NOT NULL,
    id_egresso integer NOT NULL
);


ALTER TABLE public.egresso_area_atuacao OWNER TO username;

--
-- TOC entry 230 (class 1259 OID 16437)
-- Name: egresso_cota; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.egresso_cota (
    id_egresso integer NOT NULL,
    id_cota integer NOT NULL
);


ALTER TABLE public.egresso_cota OWNER TO username;

--
-- TOC entry 231 (class 1259 OID 16440)
-- Name: egresso_empresa; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.egresso_empresa (
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    empresa_id_empresa integer NOT NULL,
    egresso_id_egresso integer NOT NULL,
    created_by integer,
    last_modified_by integer,
    area_atuacao_id integer,
    faixa_salarial_id integer NOT NULL
);


ALTER TABLE public.egresso_empresa OWNER TO username;

--
-- TOC entry 232 (class 1259 OID 16445)
-- Name: egresso_id_egresso_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.egresso_id_egresso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.egresso_id_egresso_seq OWNER TO username;

--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 232
-- Name: egresso_id_egresso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.egresso_id_egresso_seq OWNED BY public.egresso.id_egresso;


--
-- TOC entry 233 (class 1259 OID 16446)
-- Name: egresso_titulacao; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.egresso_titulacao (
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    egresso_id_egresso integer NOT NULL,
    titulacao_id_titulacao integer NOT NULL,
    created_by integer,
    last_modified_by integer,
    curso_id integer NOT NULL,
    empresa_id integer NOT NULL
);


ALTER TABLE public.egresso_titulacao OWNER TO username;

--
-- TOC entry 234 (class 1259 OID 16451)
-- Name: egresso_valido; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.egresso_valido (
    id_egresso_valido integer NOT NULL,
    email_egresso_valido character varying(255),
    matricula_egresso_valido character varying(12),
    nome_egresso_valido character varying(100) NOT NULL
);


ALTER TABLE public.egresso_valido OWNER TO username;

--
-- TOC entry 235 (class 1259 OID 16454)
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.egresso_valido_id_egresso_valido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.egresso_valido_id_egresso_valido_seq OWNER TO username;

--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 235
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.egresso_valido_id_egresso_valido_seq OWNED BY public.egresso_valido.id_egresso_valido;


--
-- TOC entry 236 (class 1259 OID 16455)
-- Name: empresa; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.empresa (
    id_empresa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_empresa character varying(130) NOT NULL,
    created_by integer,
    last_modified_by integer,
    endereco_empresa integer
);


ALTER TABLE public.empresa OWNER TO username;

--
-- TOC entry 237 (class 1259 OID 16460)
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_id_empresa_seq OWNER TO username;

--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 237
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;


--
-- TOC entry 238 (class 1259 OID 16461)
-- Name: endereco; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.endereco (
    id_endereco integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    cidade_endereco character varying(255) NOT NULL,
    estado_endereco character varying(255) NOT NULL,
    pais_endereco character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.endereco OWNER TO username;

--
-- TOC entry 239 (class 1259 OID 16468)
-- Name: endereco_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.endereco_id_endereco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_id_endereco_seq OWNER TO username;

--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 239
-- Name: endereco_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.endereco_id_endereco_seq OWNED BY public.endereco.id_endereco;


--
-- TOC entry 240 (class 1259 OID 16469)
-- Name: faixa_salarial; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.faixa_salarial (
    id_faixa_salarial integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    faixa_faixa_salarial character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.faixa_salarial OWNER TO username;

--
-- TOC entry 241 (class 1259 OID 16474)
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.faixa_salarial_id_faixa_salarial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faixa_salarial_id_faixa_salarial_seq OWNER TO username;

--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 241
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.faixa_salarial_id_faixa_salarial_seq OWNED BY public.faixa_salarial.id_faixa_salarial;


--
-- TOC entry 242 (class 1259 OID 16475)
-- Name: genero; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.genero (
    id_genero integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_genero character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.genero OWNER TO username;

--
-- TOC entry 243 (class 1259 OID 16480)
-- Name: genero_id_genero_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.genero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genero_id_genero_seq OWNER TO username;

--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 243
-- Name: genero_id_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.genero_id_genero_seq OWNED BY public.genero.id_genero;


--
-- TOC entry 244 (class 1259 OID 16481)
-- Name: grupo; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.grupo (
    id_grupo integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_grupo character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.grupo OWNER TO username;

--
-- TOC entry 245 (class 1259 OID 16486)
-- Name: grupo_id_grupo_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.grupo_id_grupo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_id_grupo_seq OWNER TO username;

--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 245
-- Name: grupo_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.grupo_id_grupo_seq OWNED BY public.grupo.id_grupo;


--
-- TOC entry 246 (class 1259 OID 16487)
-- Name: palestra; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.palestra (
    id_palestra integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_palestra oid NOT NULL,
    created_by integer,
    last_modified_by integer,
    egresso_id integer NOT NULL
);


ALTER TABLE public.palestra OWNER TO username;

--
-- TOC entry 247 (class 1259 OID 16492)
-- Name: palestra_id_palestra_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.palestra_id_palestra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.palestra_id_palestra_seq OWNER TO username;

--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 247
-- Name: palestra_id_palestra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.palestra_id_palestra_seq OWNED BY public.palestra.id_palestra;


--
-- TOC entry 248 (class 1259 OID 16493)
-- Name: setor_atuacao; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.setor_atuacao (
    id_setor_atuacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_setor_atuacao character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.setor_atuacao OWNER TO username;

--
-- TOC entry 249 (class 1259 OID 16498)
-- Name: setor_atuacao_empresa; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.setor_atuacao_empresa (
    id_setor_atuacao integer NOT NULL,
    id_empresa integer NOT NULL
);


ALTER TABLE public.setor_atuacao_empresa OWNER TO username;

--
-- TOC entry 250 (class 1259 OID 16501)
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.setor_atuacao_id_setor_atuacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setor_atuacao_id_setor_atuacao_seq OWNER TO username;

--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 250
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.setor_atuacao_id_setor_atuacao_seq OWNED BY public.setor_atuacao.id_setor_atuacao;


--
-- TOC entry 251 (class 1259 OID 16502)
-- Name: tipo_bolsa; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.tipo_bolsa (
    id_tipo_bolsa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_tipo_bolsa character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.tipo_bolsa OWNER TO username;

--
-- TOC entry 252 (class 1259 OID 16507)
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.tipo_bolsa_id_tipo_bolsa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_bolsa_id_tipo_bolsa_seq OWNER TO username;

--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 252
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.tipo_bolsa_id_tipo_bolsa_seq OWNED BY public.tipo_bolsa.id_tipo_bolsa;


--
-- TOC entry 253 (class 1259 OID 16508)
-- Name: titulacao; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.titulacao (
    id_titulacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_titulacao character varying(30) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.titulacao OWNER TO username;

--
-- TOC entry 254 (class 1259 OID 16513)
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.titulacao_id_titulacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.titulacao_id_titulacao_seq OWNER TO username;

--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 254
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.titulacao_id_titulacao_seq OWNED BY public.titulacao.id_titulacao;


--
-- TOC entry 255 (class 1259 OID 16514)
-- Name: usuario; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    email character varying(50) NOT NULL,
    nome_usuario character varying(100) NOT NULL,
    senha_usuario character varying(80) NOT NULL,
    login_usuario character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


ALTER TABLE public.usuario OWNER TO username;

--
-- TOC entry 256 (class 1259 OID 16519)
-- Name: usuario_grupo; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.usuario_grupo (
    id_usuario integer NOT NULL,
    id_grupo integer NOT NULL
);


ALTER TABLE public.usuario_grupo OWNER TO username;

--
-- TOC entry 257 (class 1259 OID 16522)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO username;

--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 257
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 3290 (class 2604 OID 16523)
-- Name: anuncio id_anuncio; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.anuncio ALTER COLUMN id_anuncio SET DEFAULT nextval('public.anuncio_id_anuncio_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 16524)
-- Name: area_atuacao id_area_atuacao; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.area_atuacao ALTER COLUMN id_area_atuacao SET DEFAULT nextval('public.area_atuacao_id_area_atuacao_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 16525)
-- Name: comentario id_comentario; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comentario ALTER COLUMN id_comentario SET DEFAULT nextval('public.comentario_id_comentario_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 16526)
-- Name: contribuicao id_contribuicao; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.contribuicao ALTER COLUMN id_contribuicao SET DEFAULT nextval('public.contribuicao_id_contribuicao_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 16527)
-- Name: cota id_cota; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cota ALTER COLUMN id_cota SET DEFAULT nextval('public.cota_id_cota_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 16528)
-- Name: curso id_curso; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.curso ALTER COLUMN id_curso SET DEFAULT nextval('public.curso_id_curso_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 16529)
-- Name: depoimento id_depoimento; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.depoimento ALTER COLUMN id_depoimento SET DEFAULT nextval('public.depoimento_id_depoimento_seq'::regclass);


--
-- TOC entry 3311 (class 2604 OID 16530)
-- Name: egresso id_egresso; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso ALTER COLUMN id_egresso SET DEFAULT nextval('public.egresso_id_egresso_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 16531)
-- Name: egresso_valido id_egresso_valido; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_valido ALTER COLUMN id_egresso_valido SET DEFAULT nextval('public.egresso_valido_id_egresso_valido_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 16532)
-- Name: empresa id_empresa; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 16533)
-- Name: endereco id_endereco; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id_endereco SET DEFAULT nextval('public.endereco_id_endereco_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 16534)
-- Name: faixa_salarial id_faixa_salarial; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.faixa_salarial ALTER COLUMN id_faixa_salarial SET DEFAULT nextval('public.faixa_salarial_id_faixa_salarial_seq'::regclass);


--
-- TOC entry 3328 (class 2604 OID 16535)
-- Name: genero id_genero; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.genero ALTER COLUMN id_genero SET DEFAULT nextval('public.genero_id_genero_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 16536)
-- Name: grupo id_grupo; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id_grupo SET DEFAULT nextval('public.grupo_id_grupo_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 16537)
-- Name: palestra id_palestra; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.palestra ALTER COLUMN id_palestra SET DEFAULT nextval('public.palestra_id_palestra_seq'::regclass);


--
-- TOC entry 3337 (class 2604 OID 16538)
-- Name: setor_atuacao id_setor_atuacao; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.setor_atuacao ALTER COLUMN id_setor_atuacao SET DEFAULT nextval('public.setor_atuacao_id_setor_atuacao_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 16539)
-- Name: tipo_bolsa id_tipo_bolsa; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.tipo_bolsa ALTER COLUMN id_tipo_bolsa SET DEFAULT nextval('public.tipo_bolsa_id_tipo_bolsa_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 16540)
-- Name: titulacao id_titulacao; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.titulacao ALTER COLUMN id_titulacao SET DEFAULT nextval('public.titulacao_id_titulacao_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 16541)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3649 (class 0 OID 16385)
-- Dependencies: 214
-- Data for Name: anuncio; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.anuncio (id_anuncio, ativo, created_date, last_modified_date, descricao_anuncio, created_by, last_modified_by) FROM stdin;
\.


--
-- TOC entry 3651 (class 0 OID 16391)
-- Dependencies: 216
-- Data for Name: area_atuacao; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.area_atuacao (id_area_atuacao, ativo, created_date, last_modified_date, nome_area_atuacao, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:19.255334	\N	DESENVOLVIMENTO	1	\N
\.


--
-- TOC entry 3653 (class 0 OID 16397)
-- Dependencies: 218
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.comentario (id_comentario, ativo, created_date, last_modified_date, descricao_comentario, created_by, last_modified_by, anuncio_id) FROM stdin;
\.


--
-- TOC entry 3655 (class 0 OID 16403)
-- Dependencies: 220
-- Data for Name: contribuicao; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.contribuicao (id_contribuicao, ativo, created_date, last_modified_date, descricao_contribuicao, created_by, last_modified_by, egresso_id) FROM stdin;
\.


--
-- TOC entry 3657 (class 0 OID 16409)
-- Dependencies: 222
-- Data for Name: cota; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.cota (id_cota, ativo, created_date, last_modified_date, nome_cota, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:19.255334	\N	ESCOLA	1	\N
2	t	2023-05-15 01:10:19.255334	\N	RENDA	1	\N
3	t	2023-05-15 01:10:19.255334	\N	AUTODECLARAÇÃO DE RAÇA	1	\N
4	t	2023-05-15 01:10:19.255334	\N	QUILOMBOLAS/INDÍGENAS	1	\N
\.


--
-- TOC entry 3659 (class 0 OID 16415)
-- Dependencies: 224
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.curso (id_curso, ativo, created_date, last_modified_date, nome_curso, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:19.255334	\N	CIÊNCIA DA COMPUTAÇÃO	1	\N
\.


--
-- TOC entry 3661 (class 0 OID 16421)
-- Dependencies: 226
-- Data for Name: depoimento; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.depoimento (id_depoimento, ativo, created_date, last_modified_date, descricao_depoimento, created_by, last_modified_by, egresso_id) FROM stdin;
\.


--
-- TOC entry 3663 (class 0 OID 16427)
-- Dependencies: 228
-- Data for Name: egresso; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.egresso (id_egresso, ativo, created_date, last_modified_date, bolsista_egresso, cotista_egresso, interesse_em_pos_egresso, lattes_egresso, linkedin_egresso, matricula_egresso, nascimento_egresso, pos_graducao_egresso, remuneracao_bolsa_egresso, created_by, last_modified_by, tipo_bolsa_id, genero_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 3664 (class 0 OID 16434)
-- Dependencies: 229
-- Data for Name: egresso_area_atuacao; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.egresso_area_atuacao (id_area_atuacao, id_egresso) FROM stdin;
\.


--
-- TOC entry 3665 (class 0 OID 16437)
-- Dependencies: 230
-- Data for Name: egresso_cota; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.egresso_cota (id_egresso, id_cota) FROM stdin;
\.


--
-- TOC entry 3666 (class 0 OID 16440)
-- Dependencies: 231
-- Data for Name: egresso_empresa; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.egresso_empresa (ativo, created_date, last_modified_date, empresa_id_empresa, egresso_id_egresso, created_by, last_modified_by, area_atuacao_id, faixa_salarial_id) FROM stdin;
\.


--
-- TOC entry 3668 (class 0 OID 16446)
-- Dependencies: 233
-- Data for Name: egresso_titulacao; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.egresso_titulacao (ativo, created_date, last_modified_date, egresso_id_egresso, titulacao_id_titulacao, created_by, last_modified_by, curso_id, empresa_id) FROM stdin;
\.


--
-- TOC entry 3669 (class 0 OID 16451)
-- Dependencies: 234
-- Data for Name: egresso_valido; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.egresso_valido (id_egresso_valido, email_egresso_valido, matricula_egresso_valido, nome_egresso_valido) FROM stdin;
1	\N	200411140009	ADALBERTO DOS REMEDIOS SILVA JUNIOR
2	quase_4ever@yahoo.com.br	200511140025	ADONIAS PINHEIRO PIRES
3	\N	200311140030	ADRIANA MENDONCA GARCES
4	adrianocbsi05@gmail.com	200511140017	ADRIANO ANDRADE SILVA
5	\N	200311140009	ALAYR MAUES MELO SOBRINHO
6	\N	200411140017	ALBERTO WILLIAMS CORREA FERREIRA
7	alessandrocunha1@gmail.com	200711140025	ALESSANDRO PEDRO DA CUNHA
8	alexandrecjr@ufpa.br	200611140006	ALEXANDRE BRITO CARDIAS JUNIOR
9	alexandretelesbastos@gmail.com	200811140014	ALEXANDRE TELES BASTOS
10	\N	200411140008	ALEXSANDER HAGE DE MELO
11	alisoncosta@globo.com	200811140007	ALISON COSTA DA CONCEICAO
12	apbelem@bol.com.br	200511140033	ALISSON PAULO SOUSA SIQUEIRA
13	allan.pa.br@gmail.com	201311140010	ALLAN DA SILVA ALCANTARA
14	jardim-do-heden@hotmail.com	200811140040	ALLE HEDEN TRINDADE DE SOUZA
15	altisouza@gmail.com	200311140004	ALTIERE COSTA DE SOUZA
16	anovaes27@gmail.com	201111140034	ANDERSON COSTA NOVAES DE OLIVEIRA
17	andufpa@gmail.com	201111140018	ANDERSON JORGE SANTOS FERREIRA
18	andsilvapara@bol.com.br	200311140029	ANDERSON JUNIOR PARAENSE DA SILVA
19	andervilo@hotmail.com	201111140007	ANDERSON NAZARENO ALCANTARA DE OLIVEIRA
20	andre.n.los@gmail.com	201211140004	ANDRÉ AVELINO DA SILVA NETO
21	andre.def93@gmail.com	201311140016	ANDRE DEFREMONT
22	acgrafic@gmail.com	200711140013	ANDRE LUIZ COELHO PINHEIRO
23	andredgusmao@gmail.com	200811140002	ANDRE LUIZ DE GUSMAO
24	andressa.myrtys@gmail.com	200911140012	ANDRESSA MYRTYS PEREIRA NOWACZYK
25	\N	200211140003	ANDRE THIAGO SANTANA FERNANDES
26	antonilsonalcantara@gmail.com	201211140014	ANTONILSON DA SILVA ALCANTARA
27	alan.menezes@yahoo.com.br	200911140029	ANTONIO ALAN MENEZES DA SILVA
28	\N	200211140020	ANTONIO NICOLAU MAIA JUNIOR
29	\N	200411140016	ARLEM ANTONIO PEREIRA LEMOS
30	berton28@hotmail.com	200211140032	BELARDIM BERTON LOPES ARAUJO
31	\N	200711140015	BERNARDO JOSE DA SILVA ESTACIO
32	brenobcampos@gmail.com	200711140017	BRENO BRUNO VIEIRA DE CAMPOS
33	bjullynn@gmail.com	200911140031	BRUNA JULLY NEVES NUNES
34	botabotelho@hotmail.com	200311140035	BRUNO BOTELHO CARDOSO
35	brunolmartins@gmail.com	201011140026	BRUNO LIMA MARTINS
36	csp@ufpa.br	200611140025	CARLOS DOS SANTOS PORTELA
37	\N	200511140024	CARMEN LUCIA MARTINS DO NASCIMENTO
38	\N	200311140024	CECIL CORDEIRO DA SILVA
39	crsg.si.2012@gmail.com	201211140034	CLEBER ROBSON DA SILVA GOMES
40	\N	200411140023	DACIO PANTOJA SILVA
41	dangelomendes10@gmail.com	201011140021	DANGELO WESLEY OLIVEIRA MENDES
42	\N	200511140036	DANIEL BERG SOUZA DE OLIVEIRA
43	\N	200211140015	DANIELLE GONCALVES BARROS
44	danilopinto@museu-goeldi.br	200411140019	DANILO ANDERSON PALHANO PINTO
45	\N	200411140005	DANILO HENRIQUE SOUSA MARTINS
46	danilomatosdasilva@gmail.com	200811140023	DANILO MATOS DA SILVA
47	danilosduarte5@gmail.com	201611140020	DANILO SOUZA DUARTE
48	david.barros.j@gmail.com	201111140037	DAVID BARROS DE OLIVEIRA JUNIOR
49	cuentrosilva@gmail.com	201011140007	DEBORA DA SILVA CUENTRO
50	deboraelima58@gmail.com	201111140005	DEBORA EMERIQUE DE LIMA
51	denermaues@gmail.com	201511140004	DENER MAUES NEGRAO
52	denisson_roney@hotmail.com	201111140039	DENISSON RONEY ALVES REIS
53	diegolisboa@ufpa.br	200711140027	DIEGO ASSIS DA SILVA LISBOA
54	diego.souza@icen.ufpa.br	200911140008	DIEGO RODRIGUES DE SOUZA
55	diegofuture@yahoo.com.br	200711140022	DIEGO SAMPAIO PANTOJA
56	diellefranco@yahoo.com.br	200211140004	DIELLE DA SILVA CORREA FRANCO
57	cetlho@gmail.com	201011140022	DIOGO ADRIEL LIMA FERREIRA
58	diogo.marinho@gmail.com	200411140002	DIOGO MARINHO ALMEIDA
59	diorgino@gmail.com	201011140023	DIORGINO RIGLES ALVES REIS
60	diovanini@gmail.com	200611140021	DIOVANNI MORAES DE ARAUJO
61	edgar.eguchi@gmail.com	200611140033	EDGAR EGUCHI ALVES
62	\N	200411140015	EDILSON ALVARO CUSTODIO JUNIOR
63	ednssousa@yahoo.com.br	200511140020	EDNELSON SILVA DE SOUSA
64	\N	200411140027	EDSON GOMES DE AGUIAR SILVA
65	\N	200311140008	EDUARDO SOUSA DE ARAUJO
66	edwinchagas@ufpa.br	201511140005	EDWIN VIANA CHAGAS
67	ebec2012@gmail.com	201211140035	ELDER BRUNO EVARISTO CORREA
68	thiagom@ufpa.br	201111140031	ELDER THIAGO COSTA MOREIRA
69	elielsbentes@hotmail.com	201111140019	ELIEL DOS SANTOS BENTES
70	elienenb@yahoo.com.br	200411140012	ELIENE DE NAZARE NASCIMENTO PAIXAO
71	eliwelton.g.p@gmail.com	201311140007	ELIWELTON GOMES PAES
72	eltonsarmanho@gmail.com	200611140008	ELTON SARMANHO SIQUEIRA
73	elvisthermo@hotmail.com	201611140041	ELVIS THERMO CARVALHO MIRANDA
74	e.syadetbo@gmail.com	201311140005	ERICK CARDOSO SYADE
75	erikasoueu@gmail.com	200611140019	ERIKA MAIA LIMA
76	\N	200411140035	EUDO NEVES PRIMO
77	evandroofox@gmail.com	201211140005	EVANDRO DE SOUZA MONTEIRO
78	ewertom.moraes@gmail.com	201311140004	EWERTOM MOZART MORAES DE MIRANDA
79	expeditonobrefilho@gmail.com	201311140031	EXPEDITO AUGUSTO CARDOSO NOBRE FILHO
80	\N	200411140034	FABIO LUIZ CORDEIRO REZENDE
81	araujopa@gmail.com	200711140024	FABRICIO ALMEIDA ARAUJO
82	\N	200611140013	FABRICIO BRAGA DE SOUZA
83	\N	200711140019	FAUSTINO FIRMINO DE CARVALHO JUNIOR
84	felipe.leite.nazareth@gmail.com	200811140009	FELIPE LEITE DE NAZARETH
85	fernandoaj@ufpa.br	201411140003	FERNANDO CESAR CHAVES ALVES JUNIOR
86	f.fabiogama88@gmail.com	201011140028	FERNANDO FABIO DIAS GAMA DA MATA
87	fernandols.cardoso@gmail.com	200811140010	FERNANDO LUIZ DE SIQUEIRA CARDOSO
88	flash104@gmail.com	200811140024	FERNANDO WAGNER ASSUNCAO TEIXEIRA
89	flavio.oliveira@ica.ufpa.br	200511140018	FLAVIO AUGUSTO SANTOS DE OLIVEIRA
90	franccy.b@gmail.com	201211140015	FRANCIELLEM MAYARA PONTES BEZERRA
91	assuncao.francielma@gmail.com	201611140010	FRANCIELMA DOS SANTOS ASSUNCAO
92	\N	200711140010	FRANCISCO BANDEIRA BRITO JUNIOR
93	jramlen@gmail.com	200911140027	FRANCISCO CARLOS GUALBERTO DOS SANTOS JUNIOR
94	\N	200311140033	FRANCISCO PAULO BRITO BORGES
95	\N	200211140031	FRANKNALDO TORRES GOMES
96	ggomes873@gmail.com	201611140012	GABRIEL CRUZ SOARES GOMES
97	gabrielmedsilva@hotmail.com	201111140025	GABRIEL MEDEIROS DA SILVA
98	gedean.carvalho@hotmail.com	201011140002	GEDEAN GONCALVES CARVALHO
99	\N	200311140001	GENE SHUCHIN WEN
100	\N	200511140008	GEORGE GILSON OLIVEIRA DOS REIS
101	geovanipaz7@gmail.com	201211140009	GEOVANI OLIVEIRA CABRAL DA PAZ
102	gersonsouza2@gmail.com	201111140012	GERSON SOUZA DA SILVA
103	gilbertojr@ufpa.br	200611140023	GILBERTO NERINO DE SOUZA JUNIOR
104	assumpcaogiovanni@yahoo.com.br	200711140033	GIOVANNI ASSUMPCAO MAGNO
105	g3oaugusto@gmail.com	200611140005	GIOVANNI AUGUSTO MELO PINHEIRO
106	\N	200711140035	GLEIDSON FELIPE PEREIRA DA SILVA
107	gleisebaldez@gmail.com	200711140001	GLEISE PINHEIRO BALDEZ
108	\N	200311140010	GLEYDSON DA COSTA FERREIRA
109	\N	200311140011	GLEYSON MIRANDA MELO
110	gustavomaues@ufpa.br	200311140005	GUSTAVO MAUES DE OLIVEIRA LOBATO
111	hanagabrielle@outlook.com	201711140009	HANA GABRIELLE DOS SANTOS BARATA
112	hans.w.santos@gmail.com	201011140010	HANS WILLIAM DOS SANTOS SILVA
113	hegoncbsi@yahoo.com.br	200511140022	HEGON HENRIQUE CORREA DA SILVA
114	herberthalmeida@hotmail.com	200811140031	HERBERTH MENDES DE ALMEIDA
115	hieda@ufpa.br	200211140009	HIEDA ADRIANA NASCIMENTO SILVA
116	hbsnhugo@gmail.com	200711140011	HUGO BISPO SANTOS DO NASCIMENTO
117	\N	200311140032	HUGO RONALDO GONZALEZ NOGUEIRA
118	ideraldo_carlos@hotmail.com	200611140010	IDERALDO CARLOS PAVESI
119	\N	200811140041	IGOR BARBOSA DE CARVALHO
120	i.moreiragt@gmail.com	201511140003	INGRID MOREIRA MIRANDA DA SILVA
121	isaacelgrably@hotmail.com	201111140020	ISAAC SOUZA ELGRABLY
122	iuriraiol@gmail.com	200911140006	IURI IGONEZ SILVA RAIOL
123	jacksonpscruz@outlook.com	200411140011	JACKSON PEREIRA DA SILVA CRUZ
124	jadirjunior@ufpa.br	200911140023	JADIR HORACIO SARMENTO PINTO JUNIOR
125	jailsontolosa@gmail.com	201111140014	JAILSON MARTINS TOLOSA
126	junior.jairo1@gmail.com	200811140039	JAIRO DE JESUS NASCIMENTO DA SILVA JUNIOR
127	jamysonmatoso@yahoo.com.br	200911140011	JAMYSON DA SILVA MATOSO
128	\N	200211140010	JANDER DE SOUZA E SILVA
129	jeffklister@gmail.com	201311140001	JEFFERSON KLISTER DUARTE DA SILVA JUNIOR
130	jesserocha2012@gmail.com	201111140001	JESSÉ DA COSTA ROCHA
131	jessicadepaula.stm@gmail.com	201411140036	JESSICA DE PAULA FIGUEIRA RIBEIRO
132	j0g4d0r1@hotmail.com	200611140012	JHONATHAS SOUSA DOS SANTOS
133	\N	200211140028	JHOVAN OBEDE TERRA DA SILVA
134	joaoamil@hotmail.com	200911140002	JOAO LUIS DOS REIS LIMA
135	jvpaternostroc2@gmail.com	201211140003	JOAO VICTOR PATERNOSTRO CORREA
136	jq.quaresma12@gmail.com	201111140011	JOSE AUGUSTO DE SENA QUARESMA
137	\N	200711140020	JOSE BRICIO MACHADO CARDOSO NETO
138	deivisonvx@gmail.com	201311140026	JOSE DEIVISON VIEIRA XAVIER
139	\N	200211140012	JOSE HIRVALDO LOBO MONTEIRO
140	jose.monteiro@icen.ufpa.br	201411140019	JOSE RAMON DA CONCEIÇAO MONTEIRO
141	joycesinfo03@yahoo.com.br	200311140015	JOYCE ANNE PINTO RODRIGUES
142	julio.menezesi2013@gmail.com	201311140036	JULIO DE PADUA LOPES MENEZES
143	julioebs20@hotmail.com	200711140014	JULIO EDUARDO BITTENCOURT DA SILVA
144	juliusufpa2010@gmail.com	201011140033	JULIO FRANCISCO COUTO DE CARVALHO
145	julioramonufpa@gmail.com	200811140025	JULIO RAMON NOGUEIRA LISBOA
146	\N	200711140004	KAIO SERGIO DA MOTTA VALENTE
147	kalill.lameira@gmail.com	201411140013	KALILL CORDEIRO LAMEIRA
148	\N	200611140029	KAMILA BALTAZAR CORREIA
149	katyakeila@gmail.com	200511140031	KATYA KEILA COSTA ASSIS
150	kelvintvieira@hotmail.com	201111140016	KELVIN TEIXEIRA VIEIRA
151	brunocorrea@ufpa.br	200811140013	KLEOSON BRUNO CORREA DOS SANTOS
152	laerte-gm@hotmail.com	200911140001	LAERTE GUEDES MONTEIRO
153	laertthpotter@hotmail.com	201011140034	LAERTH LASERINO PINTO MONTEIRO
154	laissribeiro@gmail.com	200811140019	LAIS CONCEICAO RIBEIRO
155	\N	200511140027	LARISSA DE SOUZA CARNEIRO
156	leandro.goms.moura@gmail.com	200911140033	LEANDRO GOMES DE MOURA
157	\N	200411140004	LEANDRO HERNANDEZ ALMEIDA
158	leidiel@ufpa.br	200611140003	LEIDIEL ARAUJO DE OLIVEIRA
159	leonardoandre27@gmail.com	201111140010	LEONARDO ANDRE SILVA DOS SANTOS
160	barbosleonardo@gmail.com	201011140001	LEONARDO BARBOSA DA COSTA
161	leonardofig88@gmail.com	201411140011	LEONARDO DA COSTA FIGUEIREDO
162	leo_dm@live.it	201111140008	LEONARDO DIAS MARTINS
163	\N	200911140015	LEONARDO FERREIRA E SILVA
164	leofozzy@yahoo.com.br	200411140020	LEONARDO HERNANDEZ ALMEIDA
165	leo-sdl@hotmail.br	200511140002	LEO SANTOS DE LIMA
166	\N	200511140015	LEYRILANE DE SOUZA
167	lourdilene.souza@gmail.com	201011140031	LOURDILENE SILVA DE SOUZA
168	\N	200311140013	LOURIVAL DA CONCEICAO PEREIRA JUNIOR
169	luanoliveira35@hotmail.com	201411140029	LUAN DOS SANTOS OLIVEIRA
170	akaluan.la@gmail.com	201611140015	LUAN FELIPE BRITTO ALVES
171	\N	200611140031	LUCIANA NEVES BENTES
172	\N	200411140025	LUCIANE FARIAS SOARES
173	alelibbra@hotmail.com	200511140009	LUIZ ALESSANDRO LOPES FEITOSA
174	luizdsousa@gmail.com	201311140013	LUIZ ANTONIO ANDRADE DE SOUSA
175	eduardo@alcantara.net.br	201111140006	LUIZ EDUARDO ALVES DE ALCANTARA
176	luizfelipph@gmail.com	201211140006	LUIZ FELIPPH CALADO SOSINHO
177	otaviodanin@gmail.com	200911140021	LUIZ OTAVIO DANIN DE LIMA
178	\N	200311140026	LUZIANA BRAGA CORREA
179	\N	200411140003	LYNDON JOHNSON BRITO SOUSA
180	mpillar@yahoo.com.br	200211140013	MABEL PILAR NASCIMENTO DUARTE
181	victor.ufpaa@gmail.com	201211140022	MANOEL VICTOR RODRIGUES LEITE
182	manuely.guedes@icen.ufpa.br	201011140020	MANUELY BARBOSA GUEDES
183	\N	200211140007	MARCELA SANTIAGO DOS SANTOS
184	marcelo@ufpa.br	200411140029	MARCELO DA SILVA MORAES
185	marcelosarraf@gmail.com	200211140006	MARCELO SARRAF PINHO
186	marcio.ponte@ufopa.edu.br	200211140014	MARCIO JOSE MOUTINHO DA PONTE
187	marciogomes@mpf.mp.br	200311140016	MARCIO NUNES GOMES
188	macapela@ufpa.br	200411140032	MARCO AURELIO CAPELA
189	almeidmar@gmail.com	201511140034	MARCOS ALMEIDA DA COSTA
190	\N	200411140030	MARCOS AUGUSTO BARATA DA SILVA
191	marcsi2320@gmail.com	201311140034	MARCOS PAULO FERREIRA COSTA
192	\N	200411140024	MARCOS PAULO NASCIMENTO SILVA
193	\N	200611140020	MARCOS VALERIO DA SILVA RENDEIRO
194	marianojefferson@hotmail.com	200711140021	MARIANO JEFFERSON BATISTA GOMES JUNIOR
195	mario_oliveira10@yahoo.com.br	201011140039	MARIO ANTONIO PEREIRA DE OLIVEIRA
196	\N	200211140017	MARIO BASTOS DE BRITO JUNIOR
197	marlonufpasi@gmail.com	201211140028	MARLON SILVA PIMENTEL CRUZ
198	marlon.santos.santos@icen.ufpa.br	201511140006	MARLON WILSON SANTOS DOS SANTOS
199	jodye_st@hotmail.com	200511140019	MARTA JODYE BORDO DA CONCEICAO
200	matheusvieiracoelho@gmail.com	201311140021	MATHEUS SEABRA DE CARVALHO VIEIRA COELHO
201	mauricio.si.ufpa@gmail.com	201811140014	MAURICIO MARTINS RIBEIRO
202	mauroabferreira@yahoo.com.br	201111140048	MAURO AUGUSTO BARROS FERREIRA
203	\N	200411140026	MAXIMIANO DAVES DA COSTA VIEIRA
204	\N	200511140010	MAX WANDERSON DE ARAUJO FAVACHO
205	maykonaraujo23@gmail.com	201311140018	MAYKON ARAUJO DE SOUZA
206	michelgondim@yahoo.com.br	200511140034	MICHEL FEU CASTRO GONDIM
207	\N	200711140008	MICHEL PEREIRA MARQUES
208	NILJUNIOR@GMAIL.COM                                                             	200611140028	NILTON RODRIGUES DE ASSIS JUNIOR
209	odirley007@yahoo.com.br	201211140008	ODIRLEY PINHEIRO DE MATOS
210	ontf.filho@gmail.com	200811140026	ORLANDO DO NASCIMENTO TAVARES FILHO
211	\N	200211140022	OTAVIO DUTRA LEITE
212	patricia.diniz@tucurui.ufpa.br	200411140010	PATRICIA PINTO DINIZ
213	psn_leandro@hotmail.com	200811140030	PAULEANDRO SILVA NUNES
214	paulo_alp19@hotmail.com	200611140026	PAULO ALBERTO LIMA PRADO
215	\N	200211140008	PAULO ANDRE MOREIRA CARVALHO
216	paulohenriq10@gmail.com	201211140025	PAULO HENRIQUE AMORIM PEREIRA
217	pv.lima05@gmail.com	201111140024	PAULO VITOR CHAVES DE LIMA
218	paulocardoso.dev@gmail.com	200811140008	PAULO VITOR RODRIGUES CARDOSO
219	weskleyalmeida.si@gmail.com	201011140032	PAULO WESKLEY DE ALMEIDA FERREIRA
220	pedro_cabeludow@hotmail.com	200611140002	PEDRO ESTEVAO DA CONCEICAO MOUTINHO JUNIOR
221	rafmout@yahoo.com.br	200511140012	RAFAELA CARDOSO MOUTINHO
222	peccatiello@ig.com.br	200511140007	RAFAEL BRUNO PECCATIELLO
223	\N	200711140031	RAFAEL DANTAS CARVALHO
224	rafcavalheiro@gmail.com	201211140030	RAFAEL DE SOUZA CAVALHEIRO
225	desouza.timao@gmail.com	201011140005	RAFAEL FERREIRA DE SOUZA
226	rafael.sousa@ifpa.edu.br	200711140032	RAFAEL GOMES SOUSA
227	raimundonorberto@yahoo.com.br	200211140021	RAIMUNDO NORBERTO LAMEIRA JUNIOR
228	razeved@yahoo.com.br	200511140011	RAPHAEL DA SILVA AZEVEDO
229	\N	200911140025	RAPHAEL ROGERIO MOUTA
230	fa15698@yahoo.com.br	200811140018	RAUL CESAR MONTEIRO DA SILVA
231	renaneduardorodrigues@gmail.com	201011140016	RENAN EDUARDO SOARES RODRIGUES
232	\N	200511140032	RENATA RODRIGUES DE CARVALHO
233	ricardosarmanho@hotmail.com	201411140007	RICARDO ANDERSON MUNIZ SARMANHO
234	rafeio@bol.com.br	200611140018	RICARDO ARAUJO FEIO
235	\N	200411140007	RICARDO PAES ALMEIDA
236	roberto.almeida@icen.ufpa.br	201311140002	ROBERTO BARBOSA DE ALMEIDA JUNIOR
237	rbxjunior@gmail.com	201211140019	ROBERTO BRITO XAVIER JUNIOR
238	bob.felix89@gmail.com	201011140014	ROBERTO FELIX
239	rsantsil@gmail.com	201011140015	ROBSON DOS SANTOS SILVA
240	rodrigobbrasil@gmail.com	200711140002	RODRIGO BEZERRA BRASIL
241	rodrigoviana@ufpa.br	201011140030	RODRIGO DO CARMO VIANA
242	rvidalth@yahoo.com.br	200811140027	RODRIGO VIDAL MIRANDA
243	rlimac@gmail.com	200211140019	ROGERIO LIMA CARNEIRO
244	rjsilva@ufpa.br	200411140022	ROMAO SOUZA SILVA
245	\N	200311140025	ROSANE DA SILVA SIQUEIRA
246	zanraiol@gmail.com	200211140026	ROSANGELA SOUSA RAIOL
247	rfgomesjr@gmail.com	200911140020	ROSIVALDO FONSECA GOMES JUNIOR
248	\N	200811140032	ROUSEVELT RODRIGUES DE ALMEIDA
249	\N	200211140018	RUMENIGG NOGUEIRA VIEIRA
250	samwallflowergirl@gmail.com	201511140002	SAMARA FERNANDES PIMENTEL
251	ifpa.santana@gmail.com	200911140014	SAMUEL LINHARES SANTANA
252	\N	200711140006	SANDRO ALAN DE SOUZA MONTEIRO
253	\N	200511140035	SEBASTIAO GILBERTO LOPES VAZ
254	sergio_ewr17@hotmail.com	201111140030	SERGIO EWERTON MACIEL RODES
255	sbpaco@gmail.com	200511140014	SILVIO BRUNO PAIVA COSTA
256	simondelarocha@yahoo.com.br	200511140004	SIMON AFONSO CORREA LOBATO
257	\N	200711140007	SIVALDO DE OLIVEIRA BARBOSA
258	talitatravassos.tt@gmail.com	201411140025	TALITA DE CACIA SOUSA TRAVASSOS
259	\N	200211140016	TAMARA CUNHA MENDES
260	tatianejbm@yahoo.com.br	200811140015	TATIANE BOTELHO BORGES
261	thiagobm01@hotmail.com	201611140002	THIAGO BENICIO MACEDO
262	tsilva0891@gmail.com	201211140010	THIAGO CORDEIRO COSTA DA SILVA
263	\N	200211140001	THIAGO DA SILVA GILLA
264	\N	200311140020	THIAGO DE LIMA ARAUJO
265	thiagomatos99@hotmail.com	200911140017	THIAGO DE MATOS BEZERRA
266	\N	200711140023	THIAGO MODESTO DIAS
267	ioritss@hotmail.com	200711140034	THIAGO SALES SANTOS
268	jvantero@gmail.com	201011140012	TIAGO ANTERO DE SOUSA ALVES
269	\N	200311140003	TIAGO PORTO SANTOS DO NASCIMENTO
270	VCPSINFO@YAHOO.COM.BR	200311140017	VERONICA COSTA PANTOJA
271	\N	200511140016	VICTOR GUSTAVO DE MELLO GONCALVES
272	victorhugo543af@gmail.com	201711140002	VICTOR HUGO AZEVEDO FERREIRA
273	viniciusqquei@gmail.com	201611140031	VINICIUS FAVACHO QUEIROZ
274	vitor.cirilo3@gmail.com	201011140003	VITOR CIRILO ARAUJO SANTOS
275	vitor@ufpa.br	200711140003	VITOR DE SOUZA CASTRO
276	walbert.monteiro@ifpa.edu.br	200511140021	WALBERT CUNHA MONTEIRO
277	walbertsilva5@gmail.com	201011140009	WALBERT EMANUEL DA SILVA NASCIMENTO
278	walderwolf.tm@gmail.com	201111140038	WALDER LOBO MARQUES
279	waleriamoura@gmail.com	200511140028	WALERIA PAULA DA LUZ MOURA SOUZA
280	\N	200311140034	WANDERSON AUGUSTO DE SOUZA PEREIRA
281	\N	200311140007	WELLINGTON CARDOSO COSTA
282	engwillsm@yahoo.com.br	200811140003	WELLINGTON SOUZA MORAES
283	wesleyandmelo@gmail.com	200911140032	WESLEY ANDERSON OLIVEIRA DE MELO
284	wesley.tadsi@yahoo.com.br	201011140013	WESLEY DE OLIVEIRA BARBOSA
285	\N	200511140029	WILLIAM CAPELA CARDOSO
286	williamsawaki@gmail.com	201011140006	WILLIAM SAWAKI DE MELO E SILVA
287	\N	200411140033	WILLY CLEYBER ALMEIDA SILVA
288	wilton.cns@gmail.com	200511140037	WILTON CESAR NASCIMENTO DA SILVA
289	\N	200311140018	YASMIN VIEIRA DE MELO KOURY
290	yurimelo89@gmail.com	201611140027	YURI MELO E SILVA DO ESPIRITO SANTO
291	abelbruno@hotmail.com	200804940012	ABEL BRUNO NASCIMENTO SILVA
292	\N	199904940002	ABNATAL PEREIRA CORDOVIL JUNIOR
293	abner.cardo@gmail.com	201604940029	ABNER CARDOSO DA SILVA
294	abnergillet16@gmail.com	201304940017	ABNER GILLET FARIAS
295	\N	199504940031	ABRAHAM LINCOLN RABELO DE SOUSA
296	acza.silva@icen.ufpa.br	201704940024	ACZA LIRA SILVA
297	adailton@ufpa.br	200204940003	ADAILTON MAGALHAES LIMA
298	\N	200304940019	ADEILSON NAZARENO ARAUJO PINHEIRO
299	\N	199104940049	ADELMO FREIRES GOMES
300	adcorecha@gmail.com	200904940039	ADENILTON CORECHA DE SOUZA
301	\N	199104940090	ADERBAL MOURA SANTOS
302	\N	200104940034	ADEVALDO QUEIROZ DA SILVA
303	adieltab16@gmail.com	201504940002	ADIEL DOS SANTOS NASCIMENTO
304	adilson.sousa@icen.ufpa.br	200904940009	ADILSON FRANCISCO FERREIRA SOUSA
305	\N	199304940001	ADRIANA LEITE DE ALCANTARA
306	\N	199904940016	ADRIANA NUNES TELES
307	ribeiroadrianno@ig.com.br	200204940036	ADRIANO DE AGUIAR RIBEIRO
308	\N	200004940020	ADRIANO DE OLIVEIRA MARTINS
309	\N	199404940002	ADRIANO LUIZ PINTO SOBRAL
310	adriano.sbarreto@hotmail.com	201304940025	ADRIANO SILVA BARRETO
311	aianshay@gmail.com	201704940041	AIAN SHAY BENTES DAMASCENO CARDOSO
312	\N	200004940046	AILTO LORASCHI
313	airton@ufpa.br	200604940031	AIRTON NOBUMASA ISHIMORI
314	aveloso@ufpa.br	201504940009	ALAN TONY SOUZA VELOSO
315	aclsobrinho@gmail.com	201704940019	ALBERTO DA CRUZ LIMA SOBRINHO
316	\N	199104940107	ALBERTO SHINTA KURODA
317	almeida.alcyr@gmail.com	201204940025	ALCYR DA COSTA ALMEIDA JUNIOR
318	\N	199104940108	ALEKSANDRA DO SOCORRO DA SILVA
319	\N	200404940026	ALESSANDRA CAROLINE DOS SANTOS NASCIMENTO
320	\N	200104940011	ALESSANDRA DA SILVA GOMES
321	\N	199104940050	ALESSANDRA FONTEL POMPEU
322	alessandra.araujo@icen.ufpa.br	201204940027	ALESSANDRA PANTOJA DE ARAUJO
323	alessandrapriscila.alves@gmail.com	201004940012	ALESSANDRA PRISCILA ALVES DE OLIVEIRA
324	\N	199304940002	ALETEIA PATRICIA FAVACHO DE ARAUJO
325	\N	200004940013	ALEXANDER RICHARD VINSON
326	alexandre.freytas@gmail.com	201104940039	ALEXANDRE ABREU DE FREITAS
327	\N	199504940001	ALEXANDRE ALVAREZ MARTINI SANTOS
328	\N	199304940004	ALEXANDRE CARLOS BEZERRA MACEDO
329	\N	199204940001	ALEXANDRE MELO BRAGA
330	alexandre.monassa@gmail.com	200504940011	ALEXANDRE MONASSA MOREIRA
331	gomes.bcc@gmail.com	201004940020	ALEXANDRE RODRIGUES GOMES
332	\N	200004940016	ALEX YUICHI YOKOKURA
333	jrcdz01@gmail.com	201104940033	ALFREDO LIMA DA COSTA JUNIOR
334	\N	199704940017	ALINE CLAIREFONT TAVARES MELO
335	\N	200304940005	ALINE DE OLIVEIRA SILVA
336	apssig@ig.com.br	200204940047	ALINE PATRICIA DA SILVA PIMENTEL
337	\N	199404940045	ALINE REGINA DE OLIVEIRA MIRANDA
338	alisonricss@yahoo.com.br	200304940003	ALISON RICARDO SANTOS DA SILVA
339	allinelemos@gmail.com	200204940007	ALLINE DE MELO LEMOS
340	alline_peixoto@yahoo.com.br	200104940049	ALLINE DE OLIVEIRA PEIXOTO
341	allisknarf@gmail.com	200904940031	ALLISFRANK DOS SANTOS
342	aluizio.ramos.adv@gmail.com	201004940028	ALUIZIO RAMOS PEREIRA NETO
343	\N	200204940060	AMANDA NOBRE COSTA
344	acms@ufpa.br	199104940001	ANA CARLA MACEDO DA SILVA
345	carolufpa@gmail.com	200204940055	ANA CAROLINA DE ARAUJO BARBOSA
346	idabiap@yahoo.com.br	200204940046	ANA IDALINA TENORIO PIEDADE
347	aisabelamr@gmail.com	201404940021	ANA ISABELA MANITO RAMOS
348	\N	199204940044	ANA KARLA MIRANDA DE OLIVEIRA
349	av503vitoria@gmail.com	201704940008	ANA VITORIA DE BACELAR MACHADO E SILVA
350	\N	199804940029	ANDERSON BAIA MAIA
351	\N	200504940036	ANDERSON DE OLIVEIRA BANDEIRA
352	anderson.fn88@gmail.com	200904940015	ANDERSON FURTADO DE NAZARE
353	\N	199704940007	ANDERSON JONES SILVA DE JESUS
354	andersonjsc@gmail.com	200204940052	ANDERSON JORGE SERRA DA COSTA
355	andersonoanjo18@gmail.com	200904940016	ANDERSON MARQUES MORAIS
356	arr@ufpa.br	199504940002	ANDERSON RAIOL RODRIGUES
357	agoes@ufpa.br	200304940016	ANDERSON SILVA DE OLIVEIRA GÓES
358	andre.cbcc@gmail.com	200804940001	ANDRE LUIS MACHADO DE VASCONCELOS
359	andrebahia.cbcc@gmail.com	200804940022	ANDRE MIGUEL PENA BAHIA
360	andremirandap93@gmail.com	201604940032	ANDRE MIRANDA PINHEIRO
361	\N	199504940032	ANDRE RICARDO FARIA GOMES
362	andreymacedo06@hotmail.com	200904940014	ANDREY DE MACEDO SOUSA
363	\N	199104940052	ANE MARGARETH MONTE VERDE SILVA
364	\N	199104940053	ANETE HIROMI HASHIMOTO
365	\N	199304940006	ANGELA CRISTINA SOUZA DE AQUINO
366	angelaamador@ufpa.br	201104940028	ANGELA MARIA TRINDADE AMADOR
367	3390955@gmail.com	200104940031	ANGELO DE BARROS BRAGA
368	angeloluizz@gmail.com	201004940045	ANGELO LUIZ DA CRUZ OLIVEIRA
369	aandrecunhas@gmail.com	201004940031	ANTONIO ANDRE CUNHA DA SILVA
370	\N	199604940015	ANTONIO FABIO RODRIGUES DOS SANTOS
371	antonio.almeida.negocios@gamial.com	199104940110	ANTONIO JOSE CASTRO DE ALMEIDA JUNIOR
372	amsouzapa2@gmail.com	200204940048	ANTONIO MARCOS FERREIRA DE SOUZA
373	\N	199904940023	ANTONIO SOARES LOBATO
374	aeng.garcia@gmail.com	201204940030	ARIANE ELIZABETH NUNES GARCIA
375	\N	199604940006	AROLDO CRISTIANO GUERREIRO LEAL
376	ivson.ma@gmail.com	201204940014	ARTHUR IVSON XAVIER DE MORAES BATISTA
377	arthur_masahiro@hotmail.com	201104940003	ARTHUR MASAHIRO YOSHINO
378	arthur.yoshikawa@icen.ufpa.br	201704940039	ARTHUR TAKESHI NORONHA YOSHIKAWA
379	aruandasimoes@gmail.com	199404940005	ARUANDA SIMOES GONCALVES  MEIGUINS
380	augusto.f.cravo@gmail.com	201404940003	AUGUSTO FARIAS CRAVO
381	\N	199104940111	BARBARA CONCEICAO DE OLIVEIRA BARBOSA
382	\N	200304940021	BERNARDO LOBATO DOS SANTOS NETO
383	haquiticos@gmail.com	200204940054	BILLY ANDERSON PINHEIRO
384	blenofvale@gmail.com	201204940035	BLENO WILSON FRANKLIN VALE DA SILVA
385	brenofranca@yahoo.com.br	200204940005	BRENO BERNARD NICOLAU DE FRANCA
386	\N	200004940043	BRENO CRISTOVAO RODRIGUES PINTO
387	brunelli.miranda@gmail.com	201104940015	BRUNELLI PINTO MIRANDA
388	murakami.bruno@gmail.com	201204940005	BRUNO AKIRA FUKUSHIMA MURAKAMI
389	\N	199504940004	BRUNO BITAR MORHY
390	\N	200104940029	BRUNO DA COSTA BARROSO
391	bnmonteiro2@gmail.com	200704940029	BRUNO DO NASCIMENTO MONTEIRO
392	caiomfrodrigues@gmail.com	201204940010	CAIO MARCOS FLEXA RODRIGUES
393	caiocarvalho1996@hotmail.com	201304940006	CAIO PINHEIRO DE CARVALHO
394	xcaiosr@gmail.com	201604940020	CAIO SHIMADA RABELLO
395	\N	199104940048	CALADO PEREIRA FIJAMO
396	\N	200004940039	CAMILA MARINHO ALMEIDA
397	\N	199104940054	CARLA ALESSANDRA GOMES DE LIMA
398	alrac.cruz@gmail.com	200804940032	CARLA CRISTINA DA CRUZ ARAUJO
399	\N	199904940035	CARLA MARINA COSTA PAXIUBA
400	\N	199104940112	CARLOS ALBERTO LEITE MENDES
401	\N	199904940060	CARLOS ALEXANDRE LOURINHO GOMES
402	\N	200004940058	CARLOS ANDRE NEVES DO VALE
403	carlos.damasceno@icen.ufpa.br	200804940017	CARLOS DIEGO NASCIMENTO DAMASCENO
404	\N	200104940017	CARLOS EDUARDO COSTEIRA CALDAS
405	kadu-marinho@hotmail.com	200804940014	CARLOS EDUARDO MARINHO GOMES
406	\N	199304940007	CARLOS EDUARDO RIBEIRO BASTOS
407	gustavoresqueufpa@gmail.com	201004940024	CARLOS GUSTAVO RESQUE DOS SANTOS
408	carlos.h.cardoso140@gmail.com	201604940014	CARLOS HENRIQUE RIBEIRO CARDOSO
409	\N	199604940034	CARLOS MARCIO JORGE SARAIVA
410	\N	199104940004	CARLOS RENATO LISBOA FRANCES
411	\N	200004940026	CASSIO ALEXANDRE TEIXEIRA MENEZES
412	\N	199804940001	CIDIANE ARACATY LOBATO
413	\N	200104940023	CINTIA KELLI CABRAL RODRIGUES
414	\N	199104940005	CIRNEY RICARDO J B CARNEIRO
415	claricemoraesf@gmail.com	200904940035	CLARICE MORAES FERREIRA
416	\N	199104940114	CLARK DA CUNHA SA
417	\N	199904940031	CLAUDIA MYLENE DA SILVA PINHEIRO
418	\N	199904940057	CLAUDIO ANTONIO DA SILVA CAVALCANTI
419	diegodisouzza@gmail.com	201004940007	CLAUDIO DIEGO TEIXEIRA DE SOUZA
420	\N	199704940025	CLAUDIO KENJI KAWAMURA DA SILVA
421	\N	199604940018	CLEBER ROBERTO PAES DA ROCHA
422	cmguerreiro2@gmail.com	200204940032	CLEBERSON MALCHER GUERREIRO
423	\N	199104940008	CLEIDSON RONALD BOTELHO DE SOUZA
424	cleidyr.system@gmail.com	201004940049	CLEIDYR DA SILVA LIMA
425	\N	200304940018	CLODOALDO ESTUMANO DA SILVA
426	\N	199104940105	CLOVIS DA PAZ TAVARES JUNIOR
427	\N	200104940019	CRISTIANE DO SOCORRO PIRES ALMEIDA
428	\N	200104940024	CRISTIANE MARQUES DA SILVA
429	\N	200304940007	CRYS SAYURI GOTO
430	\N	199104940009	CYNTHIA MARA FONSECA DE OLIVEIRA
431	donk14@gmail.com	200904940022	DANIELA KARINE MARAVALHO AVELAR
432	\N	199104940093	DANIELA NAZARE MAIA DA CONCEICAO
433	djtavaresieq@gmail.com	200704940023	DANIEL DE JESUS TAVARES
434	danieldiascv@gmail.com	200304940035	DANIEL DIAS DE CARVALHO
435	daniqueiroz.bt@gmail.com	200504940034	DANIELE MOURA DE QUEIROZ
436	\N	200104940001	DANIEL HENRIQUES MOREIRA
437	danicostas@yahoo.com.br	200304940029	DANIELLE DA SILVA COSTA NUNES
438	\N	200204940053	DANIELLE DE MICHELI PALHANO PINTO
439	\N	200004940025	DANIELLE FURTADO DOS SANTOS
440	\N	199904940010	DANIEL LIMA BRASIL
441	daniellcavalcanti@bol.com.br	201204940018	DANIELL SOARES CAVALCANTI VIEIRA
442	dosdasilva@hotmail.com	199204940004	DANIEL ORLANDO SERPA DA SILVA
443	\N	199504940005	DANIEL SANTOS RODRIGUES
444	cabraldanilo@yahoo.com.br	200104940046	DANILO DO CARMO QUADROS CABRAL
445	danjsteixeira@gmail.com	201204940020	DAN JHONATAN DA SILVA TEIXEIRA
446	\N	199104940056	DARLENE DOS REIS SOARES GONCALVES
447	\N	199504940006	DAUCIKELEM BRAGA DOS SANTOS
448	\N	200404940017	DAVID LEONARDO MIRANDA BENTOLILA
449	\N	200004940057	DAVID SAMUEL BELICHA ISRAEL
450	\N	199604940031	DAVI MITSUO DA SILVA SHIBAYAMA
451	davisonph@ufpa.br	200704940024	DAVISON HOLANDA PACHECO
452	\N	200204940061	DEDIER GOMES MERCES LIMA
453	detilufpa@yahoo.com.br	200304940034	DEIVID TINOCO LEMOS
454	\N	199204940006	DELCIO NONATO ARAUJO DA SILVA
455	\N	199904940042	DELIANE DE JESUS ALVES DE ANDRADE
456	\N	199804940019	DENIS TAVARES SILVA
457	derickedu@gmail.com	201004940001	DERICK EDUARDO DIAS ROSA
458	\N	200004940032	DEUZINEI PINHEIRO MIRANDA
459	\N	200104940021	DIEGO JOSE CUNHA QUEIROZ
460	diegooabreu@gmail.com	201204940013	DIEGO OLIVEIRA ABREU
461	\N	199104940010	DILMA FARIAS VIANA
462	\N	199504940007	DOGEVAL AUGUSTO SACHETT
463	ddamalio@yahoo.com.br	200304940032	DOUGLAS BRITO DAMALIO
464	\N	200204940069	DOUGLAS CARDOSO PINHEIRO
465	\N	199604940014	DURVAL CASTRO DE BASTOS JUNIOR
466	ponto_flutuante@yahoo.com.br	200304940012	EDER CRUZ BARBOSA
467	\N	200504940038	EDER TAVEIRA DOS SANTOS
468	\N	200204940043	EDGAR ALMEIDA MANESCHY
469	\N	199604940025	EDGARD ASSUNCAO ARAUJO
470	\N	199204940007	EDILA MARTA MIRANDA LOBO
471	\N	199104940095	EDMAR LUIZ DA COSTA BENTES
472	ale-remo@hotmail.com	201404940001	EDSON ALESSANDRO FAGUNDES COSTA
473	ecdias@ufpa.br	200304940015	EDSON COSTA DIAS
474	\N	199404940006	EDSON EUSTACHIO OLIVEIRA DE AZEVEDO
475	\N	199304940009	EDSON PRESTES E SILVA JUNIOR
476	\N	199204940008	EDSON SILVA DOS SANTOS
477	duducostacarvalho@gmail.com	200704940030	EDUARDO COSTA DE CARVALHO
478	\N	199704940014	EDUARDO DE CARVALHO LEITE
479	\N	199804940003	EDUARDO LEAL GUERRA
480	\N	199204940009	EDVIRGES MARIA DA SILVA NASCIMENTO
481	ekcy00@gmail.com	201104940006	EHILTON KAZUO CHIBA YOSHIDOME
482	\N	199204940010	ELAINE DO SOCORRO FURRIEL AMANAJAS
483	elderferreirass@gmail.com	201004940006	ELDER DE JESUS FERREIRA DA SILVA
484	\N	200004940055	ELENILTON ALEX SANTOS DA COSTA
485	eliassm.ufpa@gmail.com	201304940023	ELIAS SENA MORAES
486	\N	199104940057	ELINETE NUNES FREITAS
487	eaguiar@ufpa.br	199504940009	ELISANGELA SANTANA AGUIAR
488	\N	200304940033	ELIZEL PINHEIRO LEAL
489	elltonsalesbarros@gmail.com	201004940026	ELLTON SALES BARROS
490	elton.private@gmail.com	200704940032	ELTON JHON DIAS GONCALVES
491	eltonpeniche14@gmail.com	201504940035	ELTON PENICHE QUARESMA
492	emanuel.estumano@gmail.com	200104940042	EMANUEL ESTUMANO SANTOS
493	\N	200304940017	EMANUEL NUNES REIS
494	\N	199104940058	EMERSON JOSE SILVEIRA DA COSTA
495	\N	199204940011	EMILIO JUN NAGAHAMA
496	eric.cbcc@gmail.com	201104940012	ERIC FELIPE DE OLIVEIRA PEREIRA
497	erlon.fpinheiro@gmail.com	201604940045	ERLON FONSECA PINHEIRO
498	ernani@ufpa.br	200204940006	ERNANI DE OLIVEIRA SALES
499	esther.cardoso.silva@gmail.com	201404940009	ESTHER CARDOSO DA SILVA
500	\N	199104940115	EURICO OLIVEIRA DA ROCHA
501	\N	200404940008	EVANDRO KOUJI DA SILVA TORII
502	\N	199904940050	EVERTON MEIRELES COSTA
503	ewelton.yoshio@gmail.com	200504940019	EWELTON YOSHIO CHIBA YOSHIDOME
504	\N	200504940004	EWERTON ALMEIDA SILVA
505	\N	199304940010	EWERTON DA COSTA VAZ
506	\N	199404940009	EWERTON DAVID MARTINS LEITE
507	\N	199304940011	EZEQUIAS CARLOS FERREIRA DA SILVA
508	fabil.goes@gmail.com	200904940024	FABIANA RODRIGUES DE GÓES
509	fa.vasconc@gmail.com	201504940030	FABIO ALEX MENDES CAMPOS VASCONCELOS
510	\N	199304940012	FABIO AUGUSTO DAS DORES SILVA
511	\N	200004940001	FABIO AUGUSTO GUIMARAES TEIXEIRA
512	fbragas@ufpa.br	200304940026	FABIO BRAGA DOS SANTOS
513	\N	199104940012	FABIO CARVALHO DA COSTA
514	\N	199604940009	FABIO DE LIMA BEZERRA
515	\N	199704940005	FABIO DE OLIVEIRA FERREIRA
516	fabiosouza21777@gmail.com	201704940029	FABIO DE SOUZA MIRANDA
517	\N	199304940013	FABIOLA PANTOJA OLIVEIRA
518	miranda.fmm@gmail.com	201104940008	FABIO MALCHER MIRANDA
519	\N	199904940030	FABIO MENDES MONTEIRO
520	fabiosizo@yahoo.com.br	200304940027	FABIO REIS SIZO NASCIMENTO
521	nagahama@yahoo.com	199704940012	FABIO YU NAGAHAMA
522	\N	199504940011	FABRICIO JOSE UCHOA CORREA
523	\N	199804940011	FABRICIO SILVA DE MAGALHAES
524	fagnerleal@ufpa.br	200904940002	FAGNER LEAL PANTOJA
525	sem.ideias.na.hora@gmail.com	201704940017	FELIPE DE MELO RODRIGUES E OLIVEIRA
526	felipe.quevici@gmail.com	201304940003	FELIPE ELIASQUEVICI
527	shinakuma3000@hotmail.com	201604940033	FELIPE GUSMAO ARAUJO
528	felipe.leite3@gmail.com	200804940010	FELIPE LEITE DA SILVA
529	\N	199104940059	FERNANDO CESAR SILVA DE MENEZES
530	\N	199604940012	FERNANDO MENEZES MATOS
531	fernando.vilanova@gmail.com	200104940058	FERNANDO SILVA VILA NOVA
532	filipecoelho@ufpa.br	201304940029	FILIPE DAMASCENO COELHO
533	\N	200204940051	FLAVIA COELHO PINHEIRO
534	flavio.dias@yahoo.com.br	200504940003	FLAVIO DIAS DE ASSUNCAO
535	\N	199204940012	FLAVIO JOSE FERRO BARROS
536	francisco_nascimento@outlook.com.br	201304940028	FRANCISCO CARRERA NASCIMENTO JUNIOR
537	\N	199904940033	FRANCISCO CESAR DE JESUS SILVA
538	\N	199504940012	FRANCISCO COSTA COELHO JUNIOR
539	junior.demarimm@gmail.com	201004940027	FRANCISCO DEMARIM DE AGUIAR JUNIOR
540	wertherjr@gmail.com	200704940025	FRANCISCO WERTHER SILVA DE SANTANA JUNIOR
541	\N	199804940028	FRANCIS JAMES VIANA RIBEIRO
542	\N	200104940008	FRANK DA SILVA MALCHER
543	\N	200204940027	FRANKLIM HARRISON MOREIRA DOS SANTOS
544	\N	199904940020	FREDERICO NOBRE REIS
545	andrade.f.gabriela@gmail.com	200304940011	GABRIELA FONSECA ANDRADE
546	\N	199104940060	GABRIELA NUNES CAMPOS
547	gab.abreu23@gmail.com	201404940017	GABRIEL BELTRAO DE ABREU
548	gabrielescudeiro1@gmail.com	201304940019	GABRIEL DE MAGALHAES ESCUDEIRO
549	\N	200404940014	GABRIEL DE SOUSA ARAUJO
550	gabriel.crispino@hotmail.com	201304940010	GABRIEL NUNES CRISPINO
551	\N	199104940015	GARDENIA VIEIRA DE ALBUQUERQUE
552	george.melo7@gmail.com	201304940008	GEORGE TASSIANO MELO PEREIRA
553	gesspinhero@gmail.com	201204940022	GESSICA PINHEIRO DE MORAES BATISTA
554	\N	199104940016	GHISLENE BRITO DE FREITAS
555	\N	199204940041	GILBERT ASDRUBAL HERNANDEZ LOURENCO
556	\N	199704940015	GILMARA SANTOS DA SILVA
557	\N	199704940022	GILSON TAVARES QUEIROZ
558	gior.grs@gmail.com	201304940009	GIORDANNA DE GREGORIIS
559	\N	199104940062	GIOVANI FONTENELLE COSTA
560	\N	200004940038	GISSELEN RENEE DE OLIVEIRA SOUZA
561	\N	200004940005	GLAUCO ESTACIO GONCALVES
562	\N	200304940030	GLEFSON FRANCO CARNEIRO
563	glenonmateus@gmail.com	200704940017	GLENON MATEUS BARBOSA ARAUJO
564	gleysongama@gmail.com.br	200604940035	GLEYSON DO NASCIMENTO GAMA
565	\N	199304940015	GUILHERME AUGUSTO BARROS CONDE
566	guilhermef.bcc@gmail.com	201004940036	GUILHERME FARIAS LIMA
567	guitrompa1@gmail.com	201604940009	GUILHERME SMETHURST ALBUQUERQUE
568	\N	199404940010	GUSTAVO HENRIQUE SAMPAIO COUTO
569	hamiltoncavalcante@gmail.com	200704940015	HAMILTON DA SILVA CAVALCANTE
570	\N	200104940027	HAMILTON JOSE MORAES DE ALBUQUERQUE
571	\N	199604940024	HAMILTON LUIZ RODRIGUES DE OLIVEIRA
572	heitorom9@gmail.com	201004940013	HEITOR DE OLIVEIRA MACEDO
573	\N	200104940004	HELDER KLEMP CORREA DA SILVA
574	\N	199104940096	HELDER LUIZ BEZERRA DE OLIVEIRA GARCIA
575	\N	199304940016	HELIO CARVALHO OLIVEIRA
576	\N	199904940048	HELIO MARCOS PAZ DE ALMEIDA
577	\N	199204940014	HENLY KOUICHI TSUCHIYA
578	heresson@gmail.com	200504940006	HERESSON JOÃO PAMPOLHA DE SIQUEIRA MENDES
579	\N	199604940011	HERIVELTON BARBOSA LIMA
580	hugo141592@gmail.com	201104940023	HUGO BRITO LIMA
581	\N	200104940052	HUGO CEZAR DO NASCIMENTO GOES
582	hugo@unifesspa.edu.br	200204940022	HUGO PEREIRA KURIBAYASHI
583	hogotoda@gmail.com	200104940012	HUGO SAWADA TODA
584	hyagogow@gmail.com	201004940015	HYAGO PINHEIRO COSTA OLIVEIRA
585	iancamposcc@gmail.com	201604940043	IAN CAMPOS BEZERRA REGO
586	\N	200104940013	IGOR DE SOUZA ALMEIDA
587	igfuca@gmail.com	200604940011	IGOR FURTADO CARVALHO
588	imatheus.sm@gmail.com	201704940007	IGOR MATHEUS SOUZA MOREIRA
589	ivoquimico@gmail.com	200404940024	IGOR SAMUEL MOREIRA DE MELO
590	ingrid.frcomp@gmail.com	201504940028	INGRID FURTADO RAIOL
591	iraquitanfilho@gmail.com	200804940006	IRAQUITAN CORDEIRO FILHO
592	\N	199104940116	IROMAR GOMES DA SILVA
593	maues.isa@gmail.com	201704940005	ISABELA LOPES MAUES BATISTA
594	hisara3@gmail.com	201504940001	ISRAEL SEWANOU HOUNSOU
595	italo.campos@icen.ufpa.br	201504940012	ITALO RAMON DA COSTA CAMPOS
596	\N	199804940017	IVANDILSON DE SOUZA DUARTE
597	\N	199104940017	IVAN DOS SANTOS MELLO
598	\N	199304940017	JAIME DE MELO SABAT NETO
599	\N	199104940019	JAIME NAZARENO DA SILVA SOARES JUNIOR
600	\N	199504940013	JAIR DA SILVA FERREIRA JUNIOR
601	jairofilho79@gmail.com	201604940016	JAIRO NASCIMENTO DE SOUSA FILHO
602	\N	199404940013	JANAINA DE FATIMA ROLLA FERREIRA
603	\N	199104940117	JANAINA DJENANE SOUZA CATETE
604	\N	199204940016	JANNE YUKIKO YOSHIKAWA OEIRAS
605	janynnepalheta@gmail.com	201104940030	JANYNNE STEPHANIE DE OLIVEIRA PALHETA
606	jaymejunior@yahoo.com.br	201504940005	JAYME DA COSTA CABRAL JUNIOR
607	jeancnasc@hotmail.com	201004940008	JEAN CARNEIRO DO NASCIMENTO
608	\N	200404940002	JEAN MARCEL DOS REIS COSTA
609	jeanneop22@gmail.com	201304940002	JEANNE DE OLIVEIRA PEREIRA
610	\N	200004940031	JEFERSON MARCELO DE OLIVEIRA CAMARA
611	jefjr2504@gmail.com	201004940014	JEFFERSON FERREIRA DE FIGUEIREDO JUNIOR
612	\N	199704940023	JEFFERSON MIGUEL GONCALVES FERREIRA
613	jeffson.celeiro@gmail.com	201504940027	JEFFSON CELEIRO SOUSA
614	\N	200004940002	JESSE DE SOUZA SOARES
615	jnane@ufpa.br	200004940022	JNANE DE SOUSA NEIVA
616	\N	199104940063	JOAO CALDAS JUNIOR
617	lubien1996@gmail.com	201504940020	JOAO DE DEUS FERREIRA FILHO
618	jjcf_cc_ufpa@hotmail.com	201004940018	JOAO JOSE CORSI FILHO
619	salvatti@ufpa.br	200104940050	JOÃO JÚLIO SALVATTI NETO
620	jmfda00@gmail.com	201704940004	JOAO MARCELO FREITAS DE ALMEIDA
621	\N	200004940047	JOAO MAURICIO SILVA DE CARVALHO
622	\N	199904940043	JOAO PAULO SOUZA ALVES DE SOUZA
623	joaopedromoraes@outlook.com	201504940006	JOAO PEDRO MOREIRA MORAES
624	\N	199104940064	JOAO ROBERTO PINHEIRO DA CRUZ
625	jvcanavarro@gmail.com	201704940015	JOAO VICTOR DA SILVA DIAS CANAVARRO
626	jmcpa1982@gmail.com	199904940019	JOAQUIM MAGNO CUNHA
627	\N	199504940014	JOEL COSTA DE OLIVEIRA
628	\N	199404940014	JOERCIO DE SENA RODRIGUES
629	\N	199304940018	JOGINETE PEREIRA ACRIAO
630	\N	200004940017	JONATHAN TRINDADE DO NASCIMENTO
631	\N	199604940030	JONATHAS REIS DA SILVA
632	\N	200104940045	JONE KAZUKI YAMAGUCHI
633	\N	199104940065	JORGE LUIS MORAES VALENTE
634	jorgedelima911@gmail.com	200904940023	JORGE LUIZ VASCONCELOS DE LIMA
635	ailtonvaladares@yahoo.com.br	200404940023	JOSÉ AILTON SOARES VALADARES JÚNIOR
636	zeavila@gmail.com	200504940028	JOSE ALBERTO DE ANDRADE AVILA
637	\N	199604940010	JOSE ALEX AIRES DOS SANTOS
638	\N	200204940037	JOSEANE DE CASSIA DA SILVA VIANA
639	josesarmanho@ufpa.br	199304940019	JOSE ANTONIO SARMANHO DOS SANTOS FREIRE
640	correasjunior@gmail.com	200904940028	JOSE CORREA DA SILVA JUNIOR
641	\N	200104940041	JOSE ENDERSON FERREIRA RODRIGUES
642	contato@joseflavio.com	200404940035	JOSÉ FLÁVIO DE SOUZA DIAS JÚNIOR
643	\N	200604940037	JOSE MARIA DE OLIVEIRA JUNIOR
644	\N	199604940037	JOSE RAIMUNDO FREITAS DE MENESES
645	\N	199204940018	JOSE RICARDO SIQUEIRA DE MIRANDA
646	\N	199104940069	JOSUE PEREIRA DE CASTRO
647	\N	199204940017	JO UEYAMA
648	joyce.csb@gmail.com	200604940023	JOYCE CRISTINA SOUZA BASTOS
649	\N	199204940019	JOZENILDO SOARES DE SOUZA
650	\N	199804940004	JULIANO KAZUKI MATSUZAKI OYA
651	\N	199304940021	JULIO VALENTE DA COSTA JUNIOR
652	\N	200004940014	JUSSARA ALEIXO SILVA SOUSA
653	kaeuchoa@hotmail.com	201304940012	KAE UCHOA SARMANHO
654	\N	199804940021	KARLA NAZARE FERREIRA DAMASCENO
655	karla.santoli@gmail.com	200104940055	KARLA SANTOS DE OLIVEIRA
656	braga.paoola@gmail.com	201004940029	KARLYANNE PAOOLA SILVA BRAGA
657	\N	199204940020	KAZUSHIGE BATISTA MATSUMOTO
658	\N	199704940003	KEISE BARBOSA PEIXOTO
659	kellydosocorro@gmail.com	201604940040	KELLY DO SOCORRO SILVA DA COSTA
660	\N	200104940032	KELLY ROBERTA TORRES GUIMARAES
661	\N	199104940021	KELVIN LOPES DIAS
662	\N	199304940022	KIWAKO BATISTA MATSUMOTO
663	\N	199704940024	KIZZY BEZERRA THE
664	kleber.mendonca@hotmail.com	200904940036	KLEBER MENDONCA DE MELO
665	\N	199504940034	KLEBER PALHETA SILVA
666	\N	199804940023	KLEDER MIRANDA GONCALVES
667	\N	199804940025	KLESSIS LOPES DIAS
668	kleverton.macedo@gmail.com	200704940021	KLEVERTON CARLOS MACEDO DE OLIVEIRA
669	\N	199504940016	KLISSIOMARA LOPES DIAS
670	\N	199704940029	KYLME IKEGAMI SAKIYAMA
671	lanapsf@gmail.com	201204940009	LANA PRISCILA DA SILVA FERREIRA
672	\N	199404940017	LANA RAQUEL SOUZA DE SOUZA
673	alilari@uol.com.br	200504940030	LARISSA FERNANDES CHAGAS
674	laudafarias@yahoo.com.br	200204940033	LAUDEMIRA PACHECO FARIAS
675	\N	200704940034	LEANDRO BEZERRA COUTINHO
676	hscleandro@gmail.com	200804940008	LEANDRO HENRIQUE SANTOS CORREA
677	\N	199904940012	LEANDRO LAGES DE CARVALHO FARIA
678	le-an-dro95@hotmail.com	201404940031	LEANDRO ORLANDO SOUSA DA SILVA
679	\N	200204940039	LEANDRO PANTOJA PEREIRA
680	ledaoliveiramonteiro@gmail.com	199104940121	LEDA MARA SOUZA DE OLIVEIRA MONTEIRO
681	\N	199804940012	LENON JOSE COSTA RAIOL
682	leomarioguitarr@yahoo.com.br	200604940025	LEOMARIO SILVA MACHADO
683	leohenryster@gmail.com	200904940033	LEONAM GAMA DA SILVA
684	\N	199804940026	LEONARDO ATHANAZIO DE CERQUEIRA GATTI
685	nardoasafonso@gmail.com	201204940026	LEONARDO AUGUSTO SOUZA AFONSO
686	srleonardofurtado@gmail.com	201604940024	LEONARDO BARBOSA FURTADO
687	leonardo.chfc@gmail.com	201504940019	LEONARDO CHRISTIAN FERREIRA DA COSTA
688	\N	200104940009	LEONARDO CORREA BAIMA
689	leosr89@gmail.com	200904940007	LEONARDO DE SOUSA RAMOS
690	\N	199704940008	LEONARDO HIROKAZU DE SOUZA HAMADA
691	leonardovalente@gmail.com	200104940048	LEONARDO JUNQUEIRA DA SILVA VALENTE
692	leonardopfb@gmail.com	200304940004	LEONARDO PATRICIO FERREIRA BARBOSA
693	leonardo.santos.formento@gmail.com	201104940007	LEONARDO SANTOS FORMENTO
694	leonardosarraff@gmail.com	200704940005	LEONARDO SARRAFF NUNES DE MORAES
695	\N	200104940014	LEONARDO YOICHI FEIO OKADA
696	\N	199404940041	LICIA CRISTINA BRITO DE CARVALHO
697	\N	200004940007	LIDIANE PARENTE ANDRADE
698	\N	199404940018	LIGEIA DE ALMEIDA ALENCAR
699	liken_iu@yahoo.com.br	200404940025	LIKEN IU MATSUMOTO CORREIA LIMA
700	lilianferreira@ufpa.br	200904940017	LILIAN SANTOS FERREIRA DA SILVA
701	\N	199104940023	LINDALVO GONZAGA DE ALCANTARA NETO
702	\N	200304940001	LIS WEIJI KANASHIRO PEREIRA
703	\N	199804940006	LIVIA RENATA VALE FRANCO DE SA
704	louisebarros@yahoo.com.br	200404940012	LOUISE GONCALVES DE BARROS
705	lucasmelo@ufpa.br	200804940007	LUCAS DE MELO SILVA
706	luks.ferraro@gmail.com	201604940042	LUCAS FELIPE FERRARO CARDOSO
707	lucassouzaufpa@gmail.com	201604940039	LUCAS GABRIEL DE SOUZA
708	lucasrodriguesgui@hotmail.com	201404940005	LUCAS RODRIGUES GUIMARAES
709	tavares.lucas1996@gmail.com	201404940026	LUCAS TAVARES MONTEIRO
710	luceliapgoncalves@gmail.com	200304940006	LUCELIA PEREIRA GONCALVES
711	\N	199304940023	LUCIANA CRISTINA MARTINS
712	paiva@ufpa.br	199604940013	LUCIANA DE NAZARE PAIVA NUNES
713	lucianabrito@openmailbox.org	201204940031	LUCIANA LIMA BRITO
714	luma@ufpa.br	199904940026	LUCIANA MARIA AZEVEDO NASCIMENTO
715	\N	199104940024	LUCIANA TOUREIRO HAGE
716	\N	199404940020	LUCIENE PEREIRA COSTA
717	\N	199104940071	LUCIO EDUARDO SOLANO REIS
718	\N	199504940030	LUIS MIGUEL FONSECA DE MORAIS
719	\N	199904940029	LUIZ ACACIO CENTENO CORDEIRO JUNIOR
720	\N	199404940021	LUIZ ALANO ALEXANDRE LOPES
721	lasf_bel@yahoo.com.br	200204940017	LUIZ ALBERTO DA SILVA FILHO
722	\N	199604940022	LUIZ ALBUQUERQUE LEAO
723	luizdanin@gmail.com	201104940004	LUIZ AUGUSTO MONTEIRO ROSO DANIN
724	\N	200104940005	LUIZ DANIEL CREAO AUGUSTO
725	ldourado1980@globo.com	199904940015	LUIZ DOURADO DIAS JUNIOR
726	\N	200004940037	LUIZ GUSTAVO COSTA CARVALHO
727	\N	200104940030	LUIZ OTAVIO DA SILVA BARATA
728	\N	200004940035	LUIZ TOME VILHENA DANTAS NETO
729	\N	199104940072	LUIZ WALDOMIRO MONTEIRO NETO
730	filholuzio@gmail.com	200204940042	LUZIO SANTANA DA SILVA FILHO
731	\N	199204940021	LUZONILDO LEAO DA SILVA
732	manoel.afonsoo@gmail.com	201004940009	MANOEL AFONSO PEREIRA DE LIMA FILHO
733	\N	199504940018	MANOEL FREDERICO BELTRAO ROSAS JUNIOR
734	\N	199704940010	MANUELA DE JESUS SEMBLANO BITTENCOURT
735	\N	200004940050	MARCEL ABREU DA MOTA
736	\N	199104940026	MARCELA PIEDADE DO AMARAL
737	\N	200004940029	MARCELIO D OLIVEIRA LEAL
738	\N	200004940008	MARCELLA LETICIA DE SOUZA COSTA
739	mpmota@ufpa.br	200304940014	MARCELLE PEREIRA MOTA
740	\N	199504940035	MARCELLO ADOLFO VELOSO DA SILVA
741	mas@ufpa.br	200204940013	MARCELO ALMEIDA DA SILVA
742	\N	200004940028	MARCELO ANDRADE DA GAMA MALCHER
743	\N	200204940019	MARCELO ANDRADE PEREIRA
744	marceloalves@ufpa.br	201404940014	MARCELO ANTONIO ALVES ALENCAR
745	\N	199704940004	MARCELO DE BRITO GARCIA
746	mmaia.cc@gmail.com	200904940027	MARCELO MAIA DA SILVA
747	\N	199404940022	MARCELO NASCIMENTO COSTA
748	\N	200204940050	MARCELO RIBEIRO ALBERNAZ
749	\N	199504940019	MARCELO SAMUEL DA COSTA MAGALHAES
750	\N	199204940022	MARCIA ANDREA DE CARVALHO FREITAS
751	\N	199804940002	MARCIA CRISTINA MONTEIRO DE MORAES
752	\N	199504940020	MARCIA MARIA DA SILVA AMARAL
753	\N	199104940123	MARCIO AMAZON KOHLER DA C KURIBAYASHI
754	\N	199104940098	MARCIO AUGUSTO PEREIRA BAILOSA
755	\N	200204940035	MARCIO BRAGA DOS SANTOS
756	\N	199604940003	MARCIO FREITAS CABRAL DA LUZ
757	\N	200204940031	MARCIO KUROKI GONCALVES
758	\N	199204940023	MARCO ANTONIO FAGUNDES DE MORAES
759	\N	199104940027	MARCOS AURELIO TRAJANO DE ASSIS
760	\N	199904940005	MARCOS ROMERO GONZAGA DE ALMEIDA
761	marcosbenaion@gmail.com	201204940019	MARCOS SENNA BENAION LEAL
762	\N	199104940106	MARCUS DE BARROS BRAGA
763	\N	199204940024	MARIA ADALZIRA SEIXAS LOPES
764	mariaandreia@ufpa.br	199504940021	MARIA ANDRÉIA RODRIGUES DOS SANTOS
765	\N	200004940011	MARIANA DE NAZARE DOS ANJOS LIMA
766	\N	200104940007	MARINA ATSUMI OIKAWA
767	\N	199404940025	MARINA NERY BRACCHI
768	\N	200004940030	MARIO DO SOCORRO JARDIM MONTEIRO
769	marissabc@ufpa.br	201104940005	MARISSA BRASIL DE CARVALHO
770	marjoriepmarques@gmail.com	201004940010	MARJORIE PEREIRA MARQUES
771	marlos_ferreira@yahoo.com.br	200204940026	MARLOS BATISTA FERREIRA
772	marlos1415@gmail.com	200604940027	MARLOS DE MORAES TAVARES
773	\N	199104940124	MARTHA CASTELLO BRANCO DE MELLO
774	\N	200304940031	MARYANNE PACHECO SOEIRO DE BARROS
775	\N	199704940021	MASAO IIDA
776	mprodrigues@openmailbox.org	201204940006	MATEUS PINTO RODRIGUES
777	matheusfreire.cbcc@gmail.com	201104940020	MATHEUS FERREIRA FREIRE
778	sa.matheus.leite@gmail.com	201504940018	MATHEUS OLIVEIRA LEITE DE SA
779	\N	199904940025	MAURICIO PIO DE LACERDA
780	mauricio.ronny@ufla.br	200504940015	MAURICIO RONNY DE ALMEIDA SOUZA
781	\N	199304940028	MAX HIDEYUKI MATSUZAKI
782	maxwelmdias@gmail.com	200404940028	MAXWEL MACEDO DIAS
783	mcfigueiredo@ufpa.br	200404940001	MAYARA COSTA FIGUEIREDO
784	\N	199804940022	MELINA DE VASCONCELOS ALBERIO
785	\N	199304940029	MELISSA SA OTERO
786	michellkruz@gmail.com	201104940035	MICHELL COSTA OLIVEIRA DA CRUZ
787	\N	200004940049	MICHEL PENA DOS SANTOS NERY
788	migsiq2@gmail.com	199904940047	MIGUEL FORMIGOSA SIQUEIRA
789	mp_godan@hotmail.com	200504940016	MIGUEL JOSE DE ALMEIDA PERNAMBUCO FILHO
790	\N	199404940026	MIGUEL PEREIRA MARQUES
791	\N	199604940027	MILENA HELLEM BEZERRA DA SILVA
792	milenarayane@ufpa.br	200904940030	MILENA RAYANE DOS SANTOS GALVAO
793	mizaelm2@yahoo.com.br	200604940020	MIZAEL PANTOJA MONTEIRO
794	\N	199604940016	MOISES BEN HUR SOUSA SEIFFERT SIMOES
795	moises.silva@icen.ufpa.br	201204940021	MOISES FELIPE MELLO DA SILVA
796	\N	199304940030	MONICA DE NAZARE TAVARES DE PAULA GOYANA
797	\N	199604940004	MONICA FERNANDES DA SILVA
798	mosheribeiro@yahoo.com.br	200504940008	MOSHE DAYAN SOUSA RIBEIRO
799	murilosalles@yahoo.com.br	200204940045	MURILO FARIAS SALES
800	\N	200104940056	NATALIA COUTO DIAS
801	\N	199104940036	NAYME CRISTHINA GOMES DE ALMEIDA
802	\N	199304940031	NELSON BRAZAO MACIEL JUNIOR
803	nickspsouza@gmail.com	201104940037	NICOLI DA SILVA PEREIRA DE SOUZA
804	nikolas.carneiro@gmail.com	201104940009	NIKOLAS JORGE SANTIAGO CARNEIRO
805	\N	199904940040	NILSON JOSE MENDES DA COSTA FILHO
806	\N	199404940027	NOEL BASTOS GONZAGA
807	\N	200004940009	ODNALRO CRUZ VIDEIRA JUNIOR
808	\N	199104940028	OLINDA MIOKA CHUBACHI
809	\N	199704940011	OSIEL MARLON NEGRAO DA SILVA
810	onoura@gmail.com	199504940023	OTÁVIO NOURA TEIXEIRA
811	orvoltz@gmail.com	200004940053	OTAVIO RODRIGUES JUNIOR
812	patriciaufpa@gmail.com	200404940011	PATRICIA MATIAS LOPES
813	pdanni@gmail.com	200204940021	PAULA DANIELE DE OLIVEIRA MOREIRA
814	\N	199104940100	PAULA JOSIANE DE SA SANTOS
815	\N	199304940032	PAULO ANDRE EVANGELISTA DA SILVA
816	paulocleiton@ufpa.br	200304940036	PAULO CLEITON VIEIRA DA SILVA
817	pjpaulor@gmail.com	200504940031	PAULO FERNANDO SOUZA RODRIGUES JUNIOR
818	\N	199704940019	PAULO GLEIDSON RISUENHO PEINADO
819	\N	199104940087	PAULO GUILHERME DOS SANTOS NASCIMENTO
820	\N	199104940101	PAULO JORGE OLIVEIRA BRAGA
821	\N	199104940128	PAULO NAZARENO MAIA SAMPAIO
822	paulo.robertojr100@gmail.com	201104940001	PAULO ROBERTO SILVA CHAGAS JUNIOR
823	prcmalcher@gmail.com	200804940027	PAULO ROBSON CAMPELO MALCHER
824	paulorudolph07@gmail.com	200504940009	PAULO RUDOLPH DA SILVA NASCIMENTO
825	paulosena99@gmail.com	201404940044	PAULO SENA FERREIRA FILHO
826	\N	199104940029	PAULO SERGIO DOS SANTOS COSTA
827	\N	199104940075	PAULO SERGIO LAMEIRA SANTOS
828	\N	199304940033	PAULO SERGIO SILVA RODRIGUES
829	\N	199404940029	PAULO TAKASHI SAWAKI FILHO
830	pvsfair@gmail.com	201304940021	PAULO VICTOR DE LIMA SFAIR ALVARES
831	paulusanglada@hotmail.com	200204940010	PAULUS ROBERTO GUEIROS ANGLADA
832	\N	200804940021	PEDRO AFONSO NASCIMENTO DE AVIZ
833	\N	200104940060	PEDRO NOLASCO FERREIRA NETO
834	ppvitorr@gmail.com	201704940003	PEDRO VICTOR AROUCK MELO
835	\N	199904940007	PRISCILA CORREA SABOIA
836	\N	200204940009	PRISCILA GOES BURLE
837	\N	199404940042	PRISCILLA LANNE CORDEIRO DE LEAO
838	\N	200104940040	RAFAELA DA SILVA LOBO
839	\N	200304940009	RAFAEL DA SILVA TAKASHIMA
840	\N	200304940028	RAFAEL FREITAS DE MORAIS
841	rafaellgom@gmail.com	200504940018	RAFAEL LOPES GOMES
842	rafaelmf@ufpa.br	200404940007	RAFAEL MARTINS FEITOSA
843	rafamesquita89@gmail.com	200804940029	RAFAEL MESQUITA DO MAR
844	rafaelsousa2187@gmail.com	201604940041	RAFAEL NASCIMENTO DE SOUSA
845	nascimento.rsouza@gmail.com	200904940012	RAFAEL NASCIMENTO DE SOUZA
846	\N	200204940001	RAFAEL PEREIRA ESTEVES
847	rafaveguim@gmail.com	200604940002	RAFAEL VERAS GUIMARAES
848	rfbcj@hotmail.com	201504940004	RAIMUNDO FERNANDO BENTES DAS CHAGAS JUNIOR
849	r.lorenna@gmail.com	201104940013	RAISSA LORENA SILVA DA SILVA
850	ramiroserge@gmail.com	201004940040	RAMIRO LUZ VERGOLINO ZAHLOUTH
851	ramonestii@gmail.com	201304940013	RAMON DA GAMA CORDEIRO
852	ramonfalsoni@hotmail.com	200704940011	RAMON FALSONI
853	ramontcruz@gmail.com	200604940009	RAMON TORRES CRUZ
854	ranieri@ufpa.br	200604940024	RANIERI BARROS TEIXEIRA
855	\N	200504940033	RAPHAEL BRITO DE PAIVA
856	\N	199904940003	REGIANE ANDRADE BRITO
857	\N	199804940024	REGIANE LIMA DE SOUSA
858	\N	199104940032	REGIANE YUMIKO DA SILVA KAWASAKI
859	regicsf2010@gmail.com	201004940002	REGINALDO CORDEIRO DOS SANTOS FILHO
860	\N	199204940031	REGINALDO TERUYOSHI HAMAGUCHI
861	\N	199204940029	REGINA NAOMI TANAKA
862	reinaldoc@gmail.com	200104940057	REINALDO GIL LIMA DE CARVALHO
863	Renanf016@gmail.com	201304940011	RENAN FILIP COSTA BALIEIRO
864	renancunhafonseca@hotmail.com	201704940034	RENAN FONSECA CUNHA
865	renan.leviathan@gmail.com	201504940029	RENAN LOBO DUARTE
866	renan3mf@hotmail.com	200604940010	RENAN SALES BARROS
867	renannojosa@gmail.com	201304940032	RENAN THIAGO DA SILVA ROSA
868	\N	200304940002	RENATA PEREIRA BAENA
869	\N	199704940006	RENATO FIGUEIRO MAIA
870	Rjlmota@gmail.com	201704940001	RENATO JOSE LIMA MOTA
871	pennafort22@gmail.com	200604940007	RENATO PENNAFORT ROCHA
872	renato.renison@gmail.com	201004940011	RENATO RENISON MOREIRA OLIVEIRA
873	\N	199704940035	RENATO WILSON SOUZA DE OLIVEIRA
874	\N	199304940034	RICARDO ANDRE CAVALCANTE DE SOUZA
875	ricardo@vfatec.com.br	201304940001	RICARDO BASTOS ARRAES
876	\N	200004940015	RICARDO CARVALHO DE SOUZA
877	\N	199904940011	RICARDO CESAR FREITAS DE SOUZA
878	\N	199304940035	RICARDO DE FARIAS SANTOS
879	\N	199804940020	RICARDO IUNES COSTA
880	\N	199304940036	RICHARD DIAS DA COSTA
881	\N	199404940031	RITA DE CASSIA DAVID DAS NEVES
882	\N	199304940037	ROBERTA DE OLIVEIRA CAVALCANTE
883	robertaba@gmail.com	199404940032	ROBERTA MACHADO BRASIL DE LIMA ARAUJO
884	\N	199104940076	ROBERTA VILHENA VIEIRA
885	\N	199704940002	ROBERTO DE ARAUJO MOURA
886	\N	200404940030	ROBERTO FRANKLIN MOREIRA CARDOSO
887	\N	199104940102	ROBERTO NOGUEIRA LIMA
888	roberto.pinheiro@hotmail.com.br	200804940033	ROBERTO PINHEIRO DA FONSECA
889	\N	200104940037	ROBERTSON DIOGO DE MORAES BANDEIRA
890	robsonaguiar@ufpa.br	200404940018	ROBSON DA SILVA AGUIAR
891	rodolfo_fiel@yahoo.com.br	200304940023	RODOLFO FIEL DE SOUSA
892	\N	199604940029	RODOLFO MOACIR SEABRA JUNIOR
893	rodbarbalho@gmail.com	200604940044	RODRIGO ARAUJO BARBALHO
894	\N	199504940026	RODRIGO CUNHA MENDES
895	rodrigopara@gmail.com	200904940003	RODRIGO DE BRITTO PONTES RODRIGUES PARA
896	\N	199404940033	RODRIGO DE FREITAS VALE
897	rodrigo99monteiro@gmail.com	201404940012	RODRIGO HENRIQUE BARBOSA MONTEIRO
898	\N	199904940014	RODRIGO PINTO CARDOSO
899	\N	199104940077	RODRIGO QUITES REIS
900	\N	199904940058	RODRIGO SILVA PINTO
901	\N	199104940078	ROGERIO FIGUEIREDO DE BRITO
902	albuquerque@ufpa.br	200504940022	ROMULO PINTO DE ALBUQUERQUE
903	ronaldsouza16@hotmail.com	201104940029	RONALD ASSUNCAO SOUZA
904	RONALDPPINHO@GMAIL.COM	201704940035	RONALDD PATRIK SILVA PINHO
905	\N	200504940047	RONALDO CUNHA GOMES
906	ronaldsilva852@gmail.com	200904940019	RONALD RIBEIRO SILVA
907	\N	200104940036	ROSANA CERES EVANGELISTA KALIL
908	\N	199104940079	ROSANA DE NAZARE MENEZES MATOS
909	\N	199104940046	ROSARINA MARIA PINHEIRO RODRIGUES
910	\N	199804940010	ROSSANA DA CUNHA SILVA
911	profrubensfr@ig.com.br	200504940045	RUBENS FERNANDES ROCHA
912	\N	199704940026	RUBIA CRISTIANE BORGES CASTRO
913	\N	199104940080	RUI DE ALMEIDA MACOLA
914	\N	199204940033	SALOMAO FERNANDES DE FREITAS JUNIOR
915	\N	199204940034	SAMIRA MARIA LUZ CARMO
916	sfelixjr@gmail.com	200504940007	SAMUEL FELIX DE SOUSA JUNIOR
917	samcampos81@gmail.com	200004940042	SAMUEL MARQUES CAMPOS
918	\N	199204940035	SANDRO MARCELO ATI TADAIESKY
919	sandyfaro0@gmail.com	201604940027	SANDY ANDRADE FARO
920	\N	200004940034	SANDY EVELON CUNHA DAS NEVES
921	saul.berardo@gmail.com	200404940005	SAUL CAMPOS BERARDO
922	\N	200104940003	SAVANA CECILIA PARGA CARNEIRO
923	\N	199604940021	SCHUBERT RIBEIRO DE CARVALHO
924	\N	199204940036	SEBASTIAO ALESSANDRO LINHARES DOS SANTOS
925	\N	199904940038	SEBASTIAO ANTONIO V DE FARIAS JUNIOR
926	sababorges@gmail.com	199904940004	SEBASTIAO BORGES FONSECA
927	\N	199404940034	SEBASTIAO DE SOUSA MESQUITA
928	\N	199104940081	SERGIO ANGELO CAMPOS ALVES
929	\N	199204940038	SERGIO RICARDO LIMA DA SILVA
930	\N	199104940047	SHIRLEY DOS SANTOS SALES BAIMA PINTO
931	\N	200104940025	SIDNEY MASAHARU MATSUNAGA
932	\N	199104940132	SILVANA ROSSY DE BRITO
933	\N	200704940018	SILVIA CRISTINA NUNES DAS DORES
934	\N	199104940133	SILVIA DAS DORES RISSINO
935	\N	199504940033	SILVIO CARLOS AZEVEDO ANDRADE
936	\N	199404940035	SIMEAO SANTOS DAS DORES
937	\N	200104940002	SIMONE BACELLAR LOPES
938	simonefonseca@yahoo.com.br	200304940013	SIMONE FONSECA FERREIRA
939	simone.nara@gmail.com	200604940014	SIMONE NAYARA COSTA CARNEIRO
940	suelenbbrabo@gmail.com	200804940036	SUELEN BRAGA BRABO
941	SUELLENPSR@UFPA.BR	200404940021	SUELLEN PATRICIA SILVESTRE RIBEIRO ALBERNAZ
942	tacio@ufpa.br	200204940014	TACIO VINICIUS BERNARDES RIBEIRO
943	taina.inaie@gmail.com	201504940007	TAINA INAIE DOS SANTOS DA SILVA
944	tales.miranda84@gmail.com	200704940008	TALES CHENE DE MIRANDA
945	\N	200704940004	TALITA VIEIRA RIBEIRO
946	talvane.glauber@gmail.com	201104940031	TALVANE GLAUBER LOPES DE LIMA
947	\N	199104940035	TAYANA UCHOA CONTE
948	teo@ufpa.br	200804940002	TEOFILO AUGUSTO BORDALO DE SOUZA VIEIRA
949	\N	199104940103	TEREZA CONCEICAO AKI BARROS KANZAKI
950	thales_cross@hotmail.com	201304940014	THALES SILVA DE SOUSA
951	dhandarah1996@gmail.com	201404940010	THAYS DHANDARAH RODRIGUES SA
952	\N	200304940025	THIAGO FONSECA DE ANDRADE
953	thiago.tjas@gmail.com	200704940006	THIAGO JORGE ALMEIDA DOS SANTOS
954	\N	200104940054	THIAGO RUBENI ALVES DA SILVA
955	tsylasac@gmail.com	201004940022	THIAGO SYLAS ANTUNES DA COSTA
956	tiagodavi70@gmail.com	201104940024	TIAGO DAVI OLIVEIRA DE ARAUJO
957	netotuby@gmail.com	201704940006	TUBY D OLIVEIRA NETO
958	\N	200004940004	ULISSES MARTINS DIAS
959	urielfcampos95@gmail.com	201504940023	URIEL FERREIRA CAMPOS
960	vagner.nogueira@gmail.com	200404940013	VAGNER NOGUEIRA SILVA
961	\N	199904940049	VALERIA FREITAS SOUSA
962	valeria@ufpa.br	199104940104	VALERIA GOMES DA CAMARA CORECHA BASTOS
963	\N	199104940082	VANA DO CARMO CARVALHO PEREIRA
964	\N	200004940019	VANDERLENE COVRE ROCHA
965	\N	199104940083	VICTOR AMARANTE DE BARROS
966	ccvem@yahoo.com.br	200404940004	VICTOR ESPINDOLA MARTINS
967	\N	200104940044	VICTOR LOURENCO GARCIA DA CUNHA
968	victorlsn@gmail.com	200904940006	VICTOR LUIZ SANTOS NEGRAO
969	\N	199804940009	VINICIUS LIMA DA SILVA
970	vitorlimac2@gmail.com	200804940004	VITOR LIMA COELHO
971	vitornovaes.cantao@gmail.com	201704940018	VITOR NOVAES CANTAO
972	vfeitosa86@hotmail.com	200504940001	VITOR PINHEIRO FEITOSA
973	\N	200104940018	VIVIANE SOARES GRIECO
974	wagnerfelidre@gmail.com	201704940043	WAGNER FELIDRE NEGRAO DA SILVA
975	walissoncardosogomes@gmail.com	201204940001	WALISSON CARDOSO GOMES
976	\N	200504940005	WALLACE MICHEL PINTO LIRA
977	wallacecovic@yahoo.com.br	201404940028	WALLACE PACHECO PEREIRA
978	walmir.psj@gmail.com	200704940031	WALMIR PORTAL DOS SANTOS JUNIOR
979	wnessms@hotmail.com	200604940029	WANESSA MELO DA SILVA
980	\N	199304940040	WANILSON MIRANDA DE FIGUEIREDO
981	\N	199504940028	WANJA DANIELLE DA SILVA MOTA
982	\N	199504940029	WASHINGTON NEVES DE ALMEIDA
983	\N	199404940038	WEILA SHEYLA DE MELO BRITO
984	fmwellson@yahoo.com.br	200804940009	WELLSON SERGIO BITENCOURT DOS SANTOS
985	wendelrenann@gmail.com	201104940017	WENDEL RENAN MACEDO DOS SANTOS
986	wescley.fontes@gmail.com	199804940008	WESCLEY PIMENTEL FONTES
987	wesleyhanani@yahoo.com.br	200104940061	WESLEY HANANI PINTO DO CARMO
988	wevertoncordeiro@gmail.com	200204940016	WEVERTON LUIS DA COSTA CORDEIRO
989	\N	199104940084	WILLIS DO SOCORRO A DE CAMPOS
990	yann.fabricio@hotmail.com	201704940026	YANN FABRICIO CARDOSO DE FIGUEIREDO
991	paz.yasminl@gmail.com	201304940005	YASMIN LUANA SALES DA PAZ
992	castelo@ufpa.br	200504940035	YOSSEF GABRIEL OLIVEIRA CASTELO
993	yvanbrito96@gmail.com	201304940016	YVAN PEREIRA DOS SANTOS BRITO
994	rabelo.lincoln@gmail.com	\N	Abraham Lincoln Rabelo De Sousa
995	adailtulima@gmail.com	\N	ADAILTON MAGALHAES LIMA
996	adalbertocmelo@gmail.com	\N	Adalberto Cavalcante de Melo
997	adrianne.veras@outlook.com	\N	Adrianne Veras de Almeida
998	alencv@gmail.com	\N	Alen Costa Vieira
999	allandoug@gmail.com	\N	Allan Douglas Bento da Costa
1000	larissa.engcomp@gmail.com	\N	Ana Larissa da Silva Dias
1001	andersonsoares@ufra.edu.br	\N	Anderson Gregório Marques Soares
1002	anderson.gmarques@gmail.com	\N	Anderson Gregório Marques Soares
1003	anderson_detran@hotmail.com	\N	Anderson Trindade Maia
1004	andre.rammos7@gmail.com	\N	André de Jesus Araújo Ramos
1005	andre.riker@gmail.com	\N	André Figueira Riker
1006	ditoneto@gmail.com	\N	Benedito de Souza Ribeiro Neto
1007	bfranca@unicamp.br	\N	Breno Bernard Nicolau de França
1008	upbrunogc@gmail.com	\N	Bruno Garcia da Costa
1009	britodi@gmail.com	\N	Bruno Pereira Brito
1010	gustavo.cbcc@gmail.com	\N	Carlos Gustavo Resque dos Santos
1011	takeshiyasojima@gmail.com	\N	Carlos Takeshi Kudo Yasojima
1012	cassio.batista.13@gmail.com	\N	Cassio Trindade Batista
1013	avcesar@gmail.com	\N	Cesar Siqueira de Oliveira
1014	claudomir.junior@ifma.edu.br	\N	Claudomir Cardoso de Carvalho Junior
1015	dom.clay@yahoo.com.br	\N	Clay Palmeira da Silva
1016	cleytondim@ufpa.br	\N	Cleyton Aparecido Dim
1017	cynthya.telles@gmail.com	\N	Cynthya Letícia Teles De Oliveira
1018	daniel.leal.souza@gmail.com	\N	Daniel Leal Souza
1019	lenomeireles@gmail.com	\N	Danileno Meireles do Rosario
1020	diegoaires@gmail.com	\N	Diego Bento Aires Teixeira
1021	hortencio1983@gmail.com	\N	Diego Hortêncio dos Santos
1022	diegoabreuengcomp@gmail.com	\N	Diego Oliveira Abreu
1023	eddasjbertrand@gmail.com	\N	Eddas Josue Bertrand Martinez
1024	edianfranklin@gmail.com	\N	Edian Franklin Franco De Los Santos
1025	edinaldo.laroque@gmail.com	\N	Edinaldo João Costa de La-roque
1026	koitiyasojima@gmail.com	\N	Edson Koiti Kudo Yasojima
1027	eduardolima.ufpa@gmail.com	\N	Eduardo Gabriel Lima da Silva
1028	marquesraiol@gmail.com	\N	Eduardo Paulo Marques Raiol
1029	ejrueda95g@gmail.com	\N	Edwin Jahir Rueda Rojas
1030	elismclean@gmail.com	\N	Elisiane Monteiro Soares
1031	msoares.elziane@gmail.com	\N	Elziane Monteiro Soares
1032	emanuel.montero.e@gmail.com	\N	Emanuel Montero Espaillat
1033	erick.c.modesto@gmail.com	\N	Erick Modesto Campos
1034	ericsonsarmento+ppgcc@gmail.com	\N	Ericson Sarmento Costa
1035	estevaosantos265@gmail.com	\N	Estêvão Damasceno Santos
1036	fabiomm@ufmg.br	\N	Fabio Malcher Miranda
1037	fabioaraujo289@gmail.com	\N	Fabio Rocha de Araujo
1038	fabriciogarcia@ufpa.br	\N	Fabricio wickey da silva garcia
1039	fabriciowsgarcia@gmail.com	\N	Fabricio Wickey da Silva Garcia
1040	felipearaujo289@gmail.com	\N	Felipe Rocha de Araújo
1041	fernnf@gmail.com	\N	Fernando Nazareno Nascimento Farias
1042	gilsonrocha@gmail.com	\N	Gilson Rocha Silva
1043	hernan.laguado@gmail.com	\N	Hernan Dario Carreño Laguado
1044	hilton.castro@ifap.edu.br	\N	Hilton Prado de Castro Junior
1045	hugoblim@gmail.com	\N	Hugo Brito Lima
1046	iagolmedeiros@gmail.com	\N	Iago Lins de Medeiros
1047	igorpnatal@gmail.com	\N	Igor da Penha Natal
1048	IGGOR16@GMAIL.COM	\N	Igor Ernesto Ferreira Costa
1049	isadoramsantos@gmail.com	\N	Isadora Mendes dos Santos
1050	ivoabreu94@gmail.com	\N	Ivo de Abreu Araújo
1051	jadielly.oliveira@gmail.com	\N	Jadielly Fernandes Oliveira Treccani
1052	jwagner28@gmail.com	\N	Jailton Wagner Rodrigues Tavares
1053	jair.jr.j2@gmail.com	\N	Jair da Silva Ferreira Junior
1054	jeanarouche@gmail.com	\N	Jean Carlos Arouche Freire
1055	jeffersonmorais@gmail.com	\N	Jefferson Magalhães de Morais
1056	joahannes@gmail.com	\N	Joahannes Bruno Dias da Costa
1057	salvatti@gmail.com	\N	João Júlio Salvatti Neto
1058	jonathasp6@gmail.com	\N	Jonathas Pinheiro Trindade
1059	jose.sousa.filho@gmail.com	\N	José de Sousa Ribeiro Filho
1060	joseflaviojr@gmail.com	\N	José Flávio de Souza Dias Júnior
1061	furtado@unifap.br	\N	Julio Cezar Costa Furtado
1062	k_info_04@yahoo.com.br	\N	Karla Suely Diniz da Costa
1063	larissamonteiropimentel@gmail.com	\N	Larissa Monteiro Pimentel
1064	patricia.souza@ufra.edu.br	\N	Lena Patrícia Souza Rodrigues
1065	lennonsfurtado@gmail.com	\N	Lennon Sales Furtado
1066	hamadaleonardo@gmail.com	\N	Leonardo Hirokazu de Souza Hamada
1067	matakura@gmail.com	\N	Leonardo Sarraff Nunes de Moraes
1068	lucas.melo04@gmail.com	\N	Lucas de Melo Silva
1069	lucelia.matsumoto@serpro.gov.br	\N	Lucelia Pereira Goncalves
1070	lu.abdon.si@gmail.com	\N	Luciana Abdon Almeida
1071	duartelucianoribeiro@gmail.com	\N	LUCIANO RIBEIRO DUARTE
1072	cellemota@gmail.com	\N	Marcelle Pereira Mota
1073	marciapantoja13@gmail.com	\N	Marcia Priscila Furtado Pantoja
1074	goes.nascimento@gmail.com	\N	Marcio Goes do Nascimento
1075	mjmponte@gmail.com	\N	Márcio José Moutinho da Ponte
1076	ma.balieiro@gmail.com	\N	Marco Antonio Balieiro Da Silva
1077	marcos.seruffo@gmail.com	\N	Marcos César da Rocha Seruffo
1078	carvalhonazario@yahoo.com.br	\N	Marcos Felipe Carvalho Nazario
1079	mm.marisamoreno@gmail.com	\N	Marisa Cristina Moreno Alves de Andrade
1080	mauricio.ronny@gmail.com	\N	Mauricio Ronny de Almeida Souza
1081	maurolarrat@ufpa.br	\N	Mauro Rodrigo Larrat Frota e Silva
1082	mayfigueiredo@gmail.com	\N	Mayara Costa Figueiredo
1083	mireillepm@gmail.com	\N	Mireille Pinheiro Moreira Balieiro
1084	mulgsm@gmail.com	\N	Müller Gabriel Da Silva Miranda
1085	nagila.ufpa@gmail.com	\N	Nágila Natália Torres Vale
1086	engenilk@gmail.com	\N	Nielsen Alves Gonçalves
1087	olavo.nylander@gmail.com	\N	Olavo Nylander Brito Neto
1088	piagodinho@gmail.com	\N	Paulo Igor Alves Godinho
1089	paulo.cardoso12@gmail.com	\N	Paulo Vitor Rodrigues Cardoso
1090	pedroabg@gmail.com	\N	Pedro Alberto Bento Gomes
1091	pedro.cumino@gmail.com	\N	Pedro Luiz Magalhães Cumino
1092	pedro.montibeler@gmail.com	\N	Pedro Montibeler Salvador
1093	phelipefeio09@gmail.com	\N	Phelipe Luiz Dias Feio
1094	rafael.feito@gmail.com	\N	Rafael Martins Feitosa
1095	rafesteves@gmail.com	\N	Rafael Pereira Esteves
1096	rafaelstnoliveira@gmail.com	\N	Rafael Santana Oliveira
1097	reinald28@gmail.com	\N	Reinaldo Junior Lopes Cardoso
1098	renatadcascaes@gmail.com	\N	Renata Kelly Dantas Cascaes
1099	renpina@gmail.com	\N	Renato de Pina Ferreira
1100	renatohidaka@gmail.com	\N	Renato Hidaka Torres
1101	rennanmaia@gmail.com	\N	Rennan Jose Maia da Silva
1102	ricardorodrigomm@gmail.com	\N	Ricardo Rodrigo Marinho Melo
1103	roberto.yuri.franco@gmail.com	\N	Roberto Yuri da Silva Franco
1104	rodrigo.sad.lima@gmail.com	\N	Rodrigo Santos do Amor Divino Lima
1105	romulo.s.pinheiro@gmail.com	\N	Romulo Silva Pinheiro
1106	sandrodpm@gmail.com	\N	Sandro de Paula Mendonça 
1107	maru.merces18@gmail.com	\N	Sara das Merces Silva
1108	saulberardo@gmail.com	\N	Saul Campos Berardo
1109	s.rodriguescn@gmail.com	\N	sebastião rodrigues da costa neto
1110	silverio@ufpa.br	\N	Silvério Sirotheau Corrêa Neto
1111	ssirotheau@gmail.com	\N	Silvério Sirotheau Corrêa Neto
1112	suelene.correa@ifpa.edu.br	\N	Suelene de Jesus do Carmo Corrêa 
1113	tcoqueiro@hotmail.com	\N	Thiago Antônio Sidônio Coqueiro
1114	vagner@ufpa.br	\N	Vagner de Brito Nascimento
1115	vitor@unifesspa.edu.br	\N	Vitor de Souza Castro
1116	walbertcm@gmail.com	\N	Walbert Cunha Monteiro
1117	wendymgaleno@gmail.com	\N	Wendy Mendes Galeno
1118	wilsonluiz.dsf@gmail.com	\N	Wilson Luiz da Silva Farias
1119	yurilimacavalcante@gmail.com	\N	Yuri Lima Cavalcante
1120	yuri.nassar@gmail.com	\N	Yuri Santa Rosa Nassar dos Santos
\.


--
-- TOC entry 3671 (class 0 OID 16455)
-- Dependencies: 236
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.empresa (id_empresa, ativo, created_date, last_modified_date, nome_empresa, created_by, last_modified_by, endereco_empresa) FROM stdin;
5	t	2023-05-15 01:10:19.255334	\N	UNIVERSIDADE FEDERAL DO PARA	1	\N	\N
\.


--
-- TOC entry 3673 (class 0 OID 16461)
-- Dependencies: 238
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.endereco (id_endereco, ativo, created_date, last_modified_date, cidade_endereco, estado_endereco, pais_endereco, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:19.255334	\N	BARCARENA	PARÁ	BRASIL	1	\N
2	t	2023-05-15 01:10:19.255334	\N	BELÉM	PARÁ	BRASIL	1	\N
3	t	2023-05-15 01:10:19.255334	\N	CAPANEMA	PARÁ	BRASIL	1	\N
4	t	2023-05-15 01:10:19.255334	\N	BRAGANÇA	PARÁ	BRASIL	1	\N
5	t	2023-05-15 01:10:19.255334	\N	SÃO MIGUEL DO GUAMÁ	PARÁ	BRASIL	1	\N
\.


--
-- TOC entry 3675 (class 0 OID 16469)
-- Dependencies: 240
-- Data for Name: faixa_salarial; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.faixa_salarial (id_faixa_salarial, ativo, created_date, last_modified_date, faixa_faixa_salarial, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:19.255334	\N	1 salário mínimo	1	\N
2	t	2023-05-15 01:10:19.255334	\N	1 a 2 salários mínimo	1	\N
3	t	2023-05-15 01:10:19.255334	\N	3 a 5 salários mínimo	1	\N
4	t	2023-05-15 01:10:19.255334	\N	6 ou mais salários mínimo	1	\N
\.


--
-- TOC entry 3677 (class 0 OID 16475)
-- Dependencies: 242
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.genero (id_genero, ativo, created_date, last_modified_date, nome_genero, created_by, last_modified_by) FROM stdin;
25	t	2023-05-15 01:10:19.255334	\N	MASCULINO	1	\N
26	t	2023-05-15 01:10:19.255334	\N	FEMININO	1	\N
27	t	2023-05-15 01:10:19.255334	\N	NÃO BINÁRIO	1	\N
28	t	2023-05-15 01:10:19.255334	\N	TRANSSEXUAL	1	\N
29	t	2023-05-15 01:10:19.255334	\N	NÃO QUERO DECLARAR	1	\N
30	t	2023-05-15 01:10:19.255334	\N	OUTROS	1	\N
\.


--
-- TOC entry 3679 (class 0 OID 16481)
-- Dependencies: 244
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.grupo (id_grupo, ativo, created_date, last_modified_date, nome_grupo, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:09.69333	\N	ADMIN	1	\N
2	t	2023-05-15 01:10:09.69333	\N	SECRETARIO	1	\N
3	t	2023-05-15 01:10:09.69333	\N	EGRESSO	1	\N
\.


--
-- TOC entry 3681 (class 0 OID 16487)
-- Dependencies: 246
-- Data for Name: palestra; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.palestra (id_palestra, ativo, created_date, last_modified_date, descricao_palestra, created_by, last_modified_by, egresso_id) FROM stdin;
\.


--
-- TOC entry 3683 (class 0 OID 16493)
-- Dependencies: 248
-- Data for Name: setor_atuacao; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.setor_atuacao (id_setor_atuacao, ativo, created_date, last_modified_date, nome_setor_atuacao, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:19.255334	\N	DESENVOLVIMENTO	1	\N
\.


--
-- TOC entry 3684 (class 0 OID 16498)
-- Dependencies: 249
-- Data for Name: setor_atuacao_empresa; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.setor_atuacao_empresa (id_setor_atuacao, id_empresa) FROM stdin;
\.


--
-- TOC entry 3686 (class 0 OID 16502)
-- Dependencies: 251
-- Data for Name: tipo_bolsa; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.tipo_bolsa (id_tipo_bolsa, ativo, created_date, last_modified_date, nome_tipo_bolsa, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:19.255334	\N	PIBIC	1	\N
2	t	2023-05-15 01:10:19.255334	\N	PROAD	1	\N
3	t	2023-05-15 01:10:19.255334	\N	PROEX	1	\N
4	t	2023-05-15 01:10:19.255334	\N	PERMANENCIA	1	\N
5	t	2023-05-15 01:10:19.255334	\N	OUTROS	1	\N
\.


--
-- TOC entry 3688 (class 0 OID 16508)
-- Dependencies: 253
-- Data for Name: titulacao; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.titulacao (id_titulacao, ativo, created_date, last_modified_date, nome_titulacao, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:19.255334	\N	GRADUAÇÃO	1	\N
2	t	2023-05-15 01:10:19.255334	\N	PÓS-GRADUAÇÃO	1	\N
\.


--
-- TOC entry 3690 (class 0 OID 16514)
-- Dependencies: 255
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.usuario (id_usuario, ativo, created_date, last_modified_date, email, nome_usuario, senha_usuario, login_usuario, created_by, last_modified_by) FROM stdin;
1	t	2023-05-15 01:10:01.057566	\N	admin@admin.com	ADMIN ADMIN	{bcrypt}$2a$10$vh9/MkL4XQyd.fqkQdnWSelTUxPBpDb6qL5W2uWLxLUN0JR9vwRZm	ADMIN	\N	\N
2	t	2023-05-15 01:10:01.057566	\N	secretario@secretario.com	SECRETARIO SECRETARIO	{bcrypt}$2a$10$biZwxymZqQDevuqWzB/wCe0jfC6Idr.SJRYO9oXBFPuusp9oA9hAy	SECRETARIO	\N	\N
3	t	2023-05-15 01:10:01.057566	\N	egresso@egresso.com	EGRESSO EGRESSO	{bcrypt}$2a$10$Tas4Xjqxogotz3bSL08nHOZRUNF9WJZuPthj2qn3maJMjwI2/uHtO	EGRESSO	\N	\N
\.


--
-- TOC entry 3691 (class 0 OID 16519)
-- Dependencies: 256
-- Data for Name: usuario_grupo; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.usuario_grupo (id_usuario, id_grupo) FROM stdin;
1	1
2	2
3	3
\.


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 215
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.anuncio_id_anuncio_seq', 1, false);


--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.area_atuacao_id_area_atuacao_seq', 1, true);


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 219
-- Name: comentario_id_comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.comentario_id_comentario_seq', 1, false);


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 221
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.contribuicao_id_contribuicao_seq', 1, false);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 223
-- Name: cota_id_cota_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.cota_id_cota_seq', 4, true);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 225
-- Name: curso_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.curso_id_curso_seq', 1, true);


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 227
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.depoimento_id_depoimento_seq', 1, false);


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 232
-- Name: egresso_id_egresso_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.egresso_id_egresso_seq', 1, false);


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 235
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.egresso_valido_id_egresso_valido_seq', 1120, true);


--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 237
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.empresa_id_empresa_seq', 5, true);


--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 239
-- Name: endereco_id_endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.endereco_id_endereco_seq', 5, true);


--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 241
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.faixa_salarial_id_faixa_salarial_seq', 4, true);


--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 243
-- Name: genero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.genero_id_genero_seq', 30, true);


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 245
-- Name: grupo_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.grupo_id_grupo_seq', 3, true);


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 247
-- Name: palestra_id_palestra_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.palestra_id_palestra_seq', 1, false);


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 250
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.setor_atuacao_id_setor_atuacao_seq', 1, true);


--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 252
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.tipo_bolsa_id_tipo_bolsa_seq', 5, true);


--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 254
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.titulacao_id_titulacao_seq', 2, true);


--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 257
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 3, true);


--
-- TOC entry 3350 (class 2606 OID 16543)
-- Name: anuncio anuncio_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT anuncio_pkey PRIMARY KEY (id_anuncio);


--
-- TOC entry 3352 (class 2606 OID 16545)
-- Name: area_atuacao area_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT area_atuacao_pkey PRIMARY KEY (id_area_atuacao);


--
-- TOC entry 3356 (class 2606 OID 16547)
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id_comentario);


--
-- TOC entry 3358 (class 2606 OID 16549)
-- Name: contribuicao contribuicao_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT contribuicao_pkey PRIMARY KEY (id_contribuicao);


--
-- TOC entry 3362 (class 2606 OID 16551)
-- Name: cota cota_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT cota_pkey PRIMARY KEY (id_cota);


--
-- TOC entry 3366 (class 2606 OID 16553)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 3370 (class 2606 OID 16555)
-- Name: depoimento depoimento_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT depoimento_pkey PRIMARY KEY (id_depoimento);


--
-- TOC entry 3384 (class 2606 OID 16557)
-- Name: egresso_area_atuacao egresso_area_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT egresso_area_atuacao_pkey PRIMARY KEY (id_area_atuacao, id_egresso);


--
-- TOC entry 3386 (class 2606 OID 16559)
-- Name: egresso_cota egresso_cota_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT egresso_cota_pkey PRIMARY KEY (id_egresso, id_cota);


--
-- TOC entry 3388 (class 2606 OID 16561)
-- Name: egresso_empresa egresso_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT egresso_empresa_pkey PRIMARY KEY (egresso_id_egresso, empresa_id_empresa);


--
-- TOC entry 3374 (class 2606 OID 16563)
-- Name: egresso egresso_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT egresso_pkey PRIMARY KEY (id_egresso);


--
-- TOC entry 3392 (class 2606 OID 16565)
-- Name: egresso_titulacao egresso_titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT egresso_titulacao_pkey PRIMARY KEY (egresso_id_egresso, titulacao_id_titulacao);


--
-- TOC entry 3396 (class 2606 OID 16567)
-- Name: egresso_valido egresso_valido_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT egresso_valido_pkey PRIMARY KEY (id_egresso_valido);


--
-- TOC entry 3402 (class 2606 OID 16569)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 3404 (class 2606 OID 16571)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 3406 (class 2606 OID 16573)
-- Name: faixa_salarial faixa_salarial_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT faixa_salarial_pkey PRIMARY KEY (id_faixa_salarial);


--
-- TOC entry 3410 (class 2606 OID 16575)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3414 (class 2606 OID 16577)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 3418 (class 2606 OID 16579)
-- Name: palestra palestra_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT palestra_pkey PRIMARY KEY (id_palestra);


--
-- TOC entry 3428 (class 2606 OID 16581)
-- Name: setor_atuacao_empresa setor_atuacao_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT setor_atuacao_empresa_pkey PRIMARY KEY (id_setor_atuacao, id_empresa);


--
-- TOC entry 3424 (class 2606 OID 16583)
-- Name: setor_atuacao setor_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT setor_atuacao_pkey PRIMARY KEY (id_setor_atuacao);


--
-- TOC entry 3430 (class 2606 OID 16585)
-- Name: tipo_bolsa tipo_bolsa_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT tipo_bolsa_pkey PRIMARY KEY (id_tipo_bolsa);


--
-- TOC entry 3434 (class 2606 OID 16587)
-- Name: titulacao titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT titulacao_pkey PRIMARY KEY (id_titulacao);


--
-- TOC entry 3408 (class 2606 OID 16589)
-- Name: faixa_salarial uk_2bn1lsqed44xqtrtq17s7tjue; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT uk_2bn1lsqed44xqtrtq17s7tjue UNIQUE (faixa_faixa_salarial);


--
-- TOC entry 3420 (class 2606 OID 16591)
-- Name: palestra uk_2h2mxjetrwvc8sg1wx5ttyq07; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT uk_2h2mxjetrwvc8sg1wx5ttyq07 UNIQUE (egresso_id);


--
-- TOC entry 3398 (class 2606 OID 16593)
-- Name: egresso_valido uk_2jwojv1fccodf62r2wa6st1i1; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_2jwojv1fccodf62r2wa6st1i1 UNIQUE (matricula_egresso_valido);


--
-- TOC entry 3376 (class 2606 OID 16595)
-- Name: egresso uk_3tmslc9ltmjdyy2mbstgpf1un; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_3tmslc9ltmjdyy2mbstgpf1un UNIQUE (usuario_id);


--
-- TOC entry 3378 (class 2606 OID 16597)
-- Name: egresso uk_4datilmpr40t15bnmxyve5t0y; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_4datilmpr40t15bnmxyve5t0y UNIQUE (matricula_egresso);


--
-- TOC entry 3422 (class 2606 OID 16599)
-- Name: palestra uk_4lfkfj85wed6qku07shtc2bic; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT uk_4lfkfj85wed6qku07shtc2bic UNIQUE (descricao_palestra);


--
-- TOC entry 3412 (class 2606 OID 16601)
-- Name: genero uk_6xfypuejpx9h55hdouj112ocw; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT uk_6xfypuejpx9h55hdouj112ocw UNIQUE (nome_genero);


--
-- TOC entry 3380 (class 2606 OID 16603)
-- Name: egresso uk_7wtwbdgn55nu31nx24ib5revf; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_7wtwbdgn55nu31nx24ib5revf UNIQUE (linkedin_egresso);


--
-- TOC entry 3438 (class 2606 OID 16605)
-- Name: usuario uk_8efax56av7vfdquauh0gyl9cx; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_8efax56av7vfdquauh0gyl9cx UNIQUE (login_usuario);


--
-- TOC entry 3382 (class 2606 OID 16607)
-- Name: egresso uk_919oulldbx88ntvtrq5r6sdkt; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_919oulldbx88ntvtrq5r6sdkt UNIQUE (lattes_egresso);


--
-- TOC entry 3364 (class 2606 OID 16609)
-- Name: cota uk_9k3kf2b9f2mjv11ksekdha97k; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT uk_9k3kf2b9f2mjv11ksekdha97k UNIQUE (nome_cota);


--
-- TOC entry 3394 (class 2606 OID 16611)
-- Name: egresso_titulacao uk_du19rk6x1k7pg5tmh7k2xphgd; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT uk_du19rk6x1k7pg5tmh7k2xphgd UNIQUE (egresso_id_egresso);


--
-- TOC entry 3368 (class 2606 OID 16613)
-- Name: curso uk_i35k8uavr3s5cxr12aefe00e; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT uk_i35k8uavr3s5cxr12aefe00e UNIQUE (nome_curso);


--
-- TOC entry 3416 (class 2606 OID 16615)
-- Name: grupo uk_is0kvc71ivi2o1nhe7h19m47p; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT uk_is0kvc71ivi2o1nhe7h19m47p UNIQUE (nome_grupo);


--
-- TOC entry 3426 (class 2606 OID 16617)
-- Name: setor_atuacao uk_j59f23omfkincud4bx0f8x3vp; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT uk_j59f23omfkincud4bx0f8x3vp UNIQUE (nome_setor_atuacao);


--
-- TOC entry 3432 (class 2606 OID 16619)
-- Name: tipo_bolsa uk_j6yqoqsrpie5ipmlh6c5jbrx1; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT uk_j6yqoqsrpie5ipmlh6c5jbrx1 UNIQUE (nome_tipo_bolsa);


--
-- TOC entry 3354 (class 2606 OID 16621)
-- Name: area_atuacao uk_mu4kvuf03rl6w7vpqgvtt78pk; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT uk_mu4kvuf03rl6w7vpqgvtt78pk UNIQUE (nome_area_atuacao);


--
-- TOC entry 3390 (class 2606 OID 16623)
-- Name: egresso_empresa uk_r0sm8hpv921bqw3nrmnnjt99x; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT uk_r0sm8hpv921bqw3nrmnnjt99x UNIQUE (egresso_id_egresso);


--
-- TOC entry 3372 (class 2606 OID 16625)
-- Name: depoimento uk_rpha5d7rfphcjvj0nbjb1nvxs; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT uk_rpha5d7rfphcjvj0nbjb1nvxs UNIQUE (egresso_id);


--
-- TOC entry 3360 (class 2606 OID 16627)
-- Name: contribuicao uk_rpvny7ejlpmi3fk8mbwva6qjy; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT uk_rpvny7ejlpmi3fk8mbwva6qjy UNIQUE (egresso_id);


--
-- TOC entry 3436 (class 2606 OID 16629)
-- Name: titulacao uk_rvnwm2n5juoh0aj3qnssh52nm; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT uk_rvnwm2n5juoh0aj3qnssh52nm UNIQUE (nome_titulacao);


--
-- TOC entry 3400 (class 2606 OID 16631)
-- Name: egresso_valido uk_snrp717wd5d36lg78t56wefwt; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_snrp717wd5d36lg78t56wefwt UNIQUE (email_egresso_valido);


--
-- TOC entry 3442 (class 2606 OID 16633)
-- Name: usuario_grupo usuario_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT usuario_grupo_pkey PRIMARY KEY (id_usuario, id_grupo);


--
-- TOC entry 3440 (class 2606 OID 16635)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3481 (class 2606 OID 16636)
-- Name: empresa fk1252u5xj526ufsf5c3c9fcic2; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk1252u5xj526ufsf5c3c9fcic2 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3486 (class 2606 OID 16641)
-- Name: faixa_salarial fk12fuee7y4kjstxd7xwk3fageo; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT fk12fuee7y4kjstxd7xwk3fageo FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3475 (class 2606 OID 16646)
-- Name: egresso_titulacao fk1bu3y46jwvfc24y707b8hr57s; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk1bu3y46jwvfc24y707b8hr57s FOREIGN KEY (curso_id) REFERENCES public.curso(id_curso);


--
-- TOC entry 3453 (class 2606 OID 16651)
-- Name: cota fk1lve8o0jw4i8ksl2dxp0lm8; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT fk1lve8o0jw4i8ksl2dxp0lm8 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3450 (class 2606 OID 16656)
-- Name: contribuicao fk2ccawuj4bpvj1vk6mhrb6b0op; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk2ccawuj4bpvj1vk6mhrb6b0op FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3476 (class 2606 OID 16661)
-- Name: egresso_titulacao fk2pj0kns83aqiewk5pf2wxj1n9; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk2pj0kns83aqiewk5pf2wxj1n9 FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3467 (class 2606 OID 16666)
-- Name: egresso_cota fk2rs3m3oq3ujpj3nvgbyaqwata; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fk2rs3m3oq3ujpj3nvgbyaqwata FOREIGN KEY (id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3499 (class 2606 OID 16671)
-- Name: tipo_bolsa fk3c5grr0qggvj0dw2fada2xhyv; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT fk3c5grr0qggvj0dw2fada2xhyv FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3460 (class 2606 OID 16676)
-- Name: egresso fk3lb1ai4t6bvvsu9jc9qm0fisi; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fk3lb1ai4t6bvvsu9jc9qm0fisi FOREIGN KEY (usuario_id) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3455 (class 2606 OID 16681)
-- Name: curso fk3tu6gxj4fe3b8vgyhhr17p5d1; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk3tu6gxj4fe3b8vgyhhr17p5d1 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3457 (class 2606 OID 16686)
-- Name: depoimento fk4282xxihuiq8nqknlkrlmn6k7; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fk4282xxihuiq8nqknlkrlmn6k7 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3488 (class 2606 OID 16691)
-- Name: genero fk4hmk8te4ct41ket6gewknyld3; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT fk4hmk8te4ct41ket6gewknyld3 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3495 (class 2606 OID 16696)
-- Name: setor_atuacao fk4qba75lalso4wg21v2lldr81c; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT fk4qba75lalso4wg21v2lldr81c FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3490 (class 2606 OID 16701)
-- Name: grupo fk4x87bpegbq5yd4awx0jpyl7rf; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fk4x87bpegbq5yd4awx0jpyl7rf FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3447 (class 2606 OID 16706)
-- Name: comentario fk5k6dqdx9kn983dj5jx5orhss0; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fk5k6dqdx9kn983dj5jx5orhss0 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3445 (class 2606 OID 16711)
-- Name: area_atuacao fk5oqxk24ttn7xfiqojcd3hrxqp; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT fk5oqxk24ttn7xfiqojcd3hrxqp FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3451 (class 2606 OID 16716)
-- Name: contribuicao fk7x5ccymo3mvys7sdoar4w27jy; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk7x5ccymo3mvys7sdoar4w27jy FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3497 (class 2606 OID 16721)
-- Name: setor_atuacao_empresa fk86mqotohj7rghjrby21y54sr7; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT fk86mqotohj7rghjrby21y54sr7 FOREIGN KEY (id_setor_atuacao) REFERENCES public.setor_atuacao(id_setor_atuacao);


--
-- TOC entry 3487 (class 2606 OID 16726)
-- Name: faixa_salarial fk96o103aeo1xeuhgnn0hhs6bl0; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT fk96o103aeo1xeuhgnn0hhs6bl0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3492 (class 2606 OID 16731)
-- Name: palestra fk9anu4iufajm45jv11goj4swmd; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT fk9anu4iufajm45jv11goj4swmd FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3500 (class 2606 OID 16736)
-- Name: tipo_bolsa fk9brd9pf3m513c4qwotx7j5l5f; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT fk9brd9pf3m513c4qwotx7j5l5f FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3505 (class 2606 OID 16741)
-- Name: usuario_grupo fk9huj1upwjyabwkwnpnhnernnu; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fk9huj1upwjyabwkwnpnhnernnu FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3482 (class 2606 OID 16746)
-- Name: empresa fka0nk763e7luto0itr7it6y5gr; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fka0nk763e7luto0itr7it6y5gr FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3468 (class 2606 OID 16751)
-- Name: egresso_cota fka58rgwpq37hoof2640cw7j2l1; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fka58rgwpq37hoof2640cw7j2l1 FOREIGN KEY (id_cota) REFERENCES public.cota(id_cota);


--
-- TOC entry 3448 (class 2606 OID 16756)
-- Name: comentario fkac7bpbirc6r6vcplb0fptftnx; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fkac7bpbirc6r6vcplb0fptftnx FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3458 (class 2606 OID 16761)
-- Name: depoimento fkadydhxggbqc2ahkodd8du6s2t; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkadydhxggbqc2ahkodd8du6s2t FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3477 (class 2606 OID 16766)
-- Name: egresso_titulacao fkb7ankaa93u5fr4nmbmyw46kmc; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkb7ankaa93u5fr4nmbmyw46kmc FOREIGN KEY (titulacao_id_titulacao) REFERENCES public.titulacao(id_titulacao);


--
-- TOC entry 3496 (class 2606 OID 16771)
-- Name: setor_atuacao fkb7luqi69van4vdyylsmgv32hn; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT fkb7luqi69van4vdyylsmgv32hn FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3478 (class 2606 OID 16776)
-- Name: egresso_titulacao fkbympkqdq4ugh9r707xwyxmx0i; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkbympkqdq4ugh9r707xwyxmx0i FOREIGN KEY (empresa_id) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3479 (class 2606 OID 16781)
-- Name: egresso_titulacao fkc2t7d851vn3eko0rgmg8uonqj; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkc2t7d851vn3eko0rgmg8uonqj FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3454 (class 2606 OID 16786)
-- Name: cota fkcqjq3oy1bo82gon5venmvjw98; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT fkcqjq3oy1bo82gon5venmvjw98 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3461 (class 2606 OID 16791)
-- Name: egresso fkcqqxhbp7hpudbb1dcyouyaq79; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkcqqxhbp7hpudbb1dcyouyaq79 FOREIGN KEY (tipo_bolsa_id) REFERENCES public.tipo_bolsa(id_tipo_bolsa);


--
-- TOC entry 3506 (class 2606 OID 16796)
-- Name: usuario_grupo fkcu6om65mvqr6ct95ijgqgx7ww; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fkcu6om65mvqr6ct95ijgqgx7ww FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo);


--
-- TOC entry 3465 (class 2606 OID 16801)
-- Name: egresso_area_atuacao fkd4e7n9hayio2dibmad734t0ra; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT fkd4e7n9hayio2dibmad734t0ra FOREIGN KEY (id_area_atuacao) REFERENCES public.area_atuacao(id_area_atuacao);


--
-- TOC entry 3469 (class 2606 OID 16806)
-- Name: egresso_empresa fkdut9kbfj1c87myf42xmao3aja; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkdut9kbfj1c87myf42xmao3aja FOREIGN KEY (faixa_salarial_id) REFERENCES public.faixa_salarial(id_faixa_salarial);


--
-- TOC entry 3493 (class 2606 OID 16811)
-- Name: palestra fkenp70xvpnwmjo0k83k7g49xnq; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT fkenp70xvpnwmjo0k83k7g49xnq FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3443 (class 2606 OID 16816)
-- Name: anuncio fkf2afyb5u9a2g5kv1wce78ur8t; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkf2afyb5u9a2g5kv1wce78ur8t FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3462 (class 2606 OID 16821)
-- Name: egresso fkf322p240i2h2i9sgcn5wjfaot; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkf322p240i2h2i9sgcn5wjfaot FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3446 (class 2606 OID 16826)
-- Name: area_atuacao fkfhdbeqpt6ruvdwof7m4acwoup; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT fkfhdbeqpt6ruvdwof7m4acwoup FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3498 (class 2606 OID 16831)
-- Name: setor_atuacao_empresa fkfjvgsmkx1gif8glw7y6uxjxos; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT fkfjvgsmkx1gif8glw7y6uxjxos FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3470 (class 2606 OID 16836)
-- Name: egresso_empresa fkhytqndbt06s83doal9nmgcksj; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkhytqndbt06s83doal9nmgcksj FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3484 (class 2606 OID 16841)
-- Name: endereco fki98kyuu68rp4942s3r9vkko6x; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fki98kyuu68rp4942s3r9vkko6x FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3456 (class 2606 OID 16846)
-- Name: curso fkiiafe2qpikwi45ggt4p8a5mik; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fkiiafe2qpikwi45ggt4p8a5mik FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3466 (class 2606 OID 16851)
-- Name: egresso_area_atuacao fkivuyjh4ny3uxkawybgpgxq96a; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT fkivuyjh4ny3uxkawybgpgxq96a FOREIGN KEY (id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3471 (class 2606 OID 16856)
-- Name: egresso_empresa fkjj09rwrjadvvdmkdo1ugyprxg; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkjj09rwrjadvvdmkdo1ugyprxg FOREIGN KEY (area_atuacao_id) REFERENCES public.area_atuacao(id_area_atuacao);


--
-- TOC entry 3444 (class 2606 OID 16861)
-- Name: anuncio fkjw0029cxurvkx45044e65h64x; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkjw0029cxurvkx45044e65h64x FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3463 (class 2606 OID 16866)
-- Name: egresso fkk0wr6p5gu54r773ttv5iira6f; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkk0wr6p5gu54r773ttv5iira6f FOREIGN KEY (genero_id) REFERENCES public.genero(id_genero);


--
-- TOC entry 3503 (class 2606 OID 16871)
-- Name: usuario fkkkymwf8xy047tl0035rhlfpq5; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkkkymwf8xy047tl0035rhlfpq5 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3494 (class 2606 OID 16876)
-- Name: palestra fkku18fu56mnqdkfwbukwah002; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT fkku18fu56mnqdkfwbukwah002 FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3504 (class 2606 OID 16881)
-- Name: usuario fkl4ghr4b3u1vycv960y09ss9a4; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkl4ghr4b3u1vycv960y09ss9a4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3449 (class 2606 OID 16886)
-- Name: comentario fkm8q6r8t4jmqia3plcao1pih8r; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fkm8q6r8t4jmqia3plcao1pih8r FOREIGN KEY (anuncio_id) REFERENCES public.anuncio(id_anuncio);


--
-- TOC entry 3491 (class 2606 OID 16891)
-- Name: grupo fkmabbfeklclq6kit2wnnkgfak0; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fkmabbfeklclq6kit2wnnkgfak0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3459 (class 2606 OID 16896)
-- Name: depoimento fkmh11nyrmuejhtnlbo1tdxp88v; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkmh11nyrmuejhtnlbo1tdxp88v FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3464 (class 2606 OID 16901)
-- Name: egresso fkn1xoojso0x5qw602exgvv7v84; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkn1xoojso0x5qw602exgvv7v84 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3501 (class 2606 OID 16906)
-- Name: titulacao fko1m66fdoqs86cucbvl928kes4; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT fko1m66fdoqs86cucbvl928kes4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3480 (class 2606 OID 16911)
-- Name: egresso_titulacao fkp74iffsl9ivplq4gkuhyuvsh8; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkp74iffsl9ivplq4gkuhyuvsh8 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3452 (class 2606 OID 16916)
-- Name: contribuicao fkpm3k93anx938a8ab7bnw2ct0u; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fkpm3k93anx938a8ab7bnw2ct0u FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3472 (class 2606 OID 16921)
-- Name: egresso_empresa fkqdv2ixbxjn0jihxwra9tadgkb; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkqdv2ixbxjn0jihxwra9tadgkb FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3489 (class 2606 OID 16926)
-- Name: genero fkqpmjfeicduajada8ttfr6fvbn; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT fkqpmjfeicduajada8ttfr6fvbn FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3473 (class 2606 OID 16931)
-- Name: egresso_empresa fkrrdwo5y0sss2aq6r989sngy0g; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkrrdwo5y0sss2aq6r989sngy0g FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3474 (class 2606 OID 16936)
-- Name: egresso_empresa fks0wngwsneahqe1p80rh1olamu; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fks0wngwsneahqe1p80rh1olamu FOREIGN KEY (empresa_id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3483 (class 2606 OID 16941)
-- Name: empresa fks5bj6jkkca1s0d3jgw4wioi9g; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fks5bj6jkkca1s0d3jgw4wioi9g FOREIGN KEY (endereco_empresa) REFERENCES public.endereco(id_endereco);


--
-- TOC entry 3485 (class 2606 OID 16946)
-- Name: endereco fkse5padocuj89r79jwdeif1l5i; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fkse5padocuj89r79jwdeif1l5i FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3502 (class 2606 OID 16951)
-- Name: titulacao fkt7h0tods16trs2x26gd6fkmca; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT fkt7h0tods16trs2x26gd6fkmca FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


-- Completed on 2023-05-15 01:17:56 -03

--
-- PostgreSQL database dump complete
--

