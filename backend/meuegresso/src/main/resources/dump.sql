CREATE TABLE public.anuncio (
    id_anuncio integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    data_expiracao_anuncio date NOT NULL,
    descricao_anuncio oid NOT NULL,
    link_anuncio character varying(255) NOT NULL,
    salario_anuncio character varying(255),
    titulo_anuncio character varying(255) NOT NULL,
    area_emprego_anuncio_id integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 142303)
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.anuncio_id_anuncio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3759 (class 0 OID 0)
-- Dependencies: 215
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.anuncio_id_anuncio_seq OWNED BY public.anuncio.id_anuncio;


--
-- TOC entry 218 (class 1259 OID 142315)
-- Name: area_atuacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.area_atuacao (
    id_area_atuacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_area_atuacao character varying(60) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 142314)
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.area_atuacao_id_area_atuacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3760 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.area_atuacao_id_area_atuacao_seq OWNED BY public.area_atuacao.id_area_atuacao;


--
-- TOC entry 220 (class 1259 OID 142324)
-- Name: area_emprego; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.area_emprego (
    id_area_emprego integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_area_emprego character varying(60) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 142323)
-- Name: area_emprego_id_area_emprego_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.area_emprego_id_area_emprego_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 219
-- Name: area_emprego_id_area_emprego_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.area_emprego_id_area_emprego_seq OWNED BY public.area_emprego.id_area_emprego;


--
-- TOC entry 222 (class 1259 OID 142333)
-- Name: contribuicao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contribuicao (
    id_contribuicao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    descricao_contribuicao oid NOT NULL,
    egresso_id integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 142332)
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contribuicao_id_contribuicao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 221
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contribuicao_id_contribuicao_seq OWNED BY public.contribuicao.id_contribuicao;


--
-- TOC entry 224 (class 1259 OID 142342)
-- Name: cota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cota (
    id_cota integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_cota character varying(50) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 142350)
-- Name: cota_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cota_aud (
    id_cota integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    ativo boolean,
    created_by integer,
    created_date timestamp(6) without time zone,
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_cota character varying(50)
);


--
-- TOC entry 223 (class 1259 OID 142341)
-- Name: cota_id_cota_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cota_id_cota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 223
-- Name: cota_id_cota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cota_id_cota_seq OWNED BY public.cota.id_cota;


--
-- TOC entry 227 (class 1259 OID 142356)
-- Name: curso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.curso (
    id_curso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_curso character varying(100) NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 142355)
-- Name: curso_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.curso_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 226
-- Name: curso_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.curso_id_curso_seq OWNED BY public.curso.id_curso;


--
-- TOC entry 229 (class 1259 OID 142365)
-- Name: depoimento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.depoimento (
    id_depoimento integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    descricao_depoimento oid NOT NULL,
    egresso_id integer NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 142364)
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.depoimento_id_depoimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 228
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.depoimento_id_depoimento_seq OWNED BY public.depoimento.id_depoimento;


--
-- TOC entry 231 (class 1259 OID 142374)
-- Name: egresso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso (
    id_egresso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    bolsista_egresso boolean NOT NULL,
    cotista_egresso boolean NOT NULL,
    foto_egresso character varying(255),
    interesse_em_pos_egresso boolean NOT NULL,
    lattes_egresso character varying(255),
    linkedin_egresso character varying(255),
    matricula_egresso character varying(12),
    nascimento_egresso date NOT NULL,
    pos_graduacao_egresso boolean,
    remuneracao_bolsa_egresso double precision,
    tipo_bolsa_id integer,
    genero_id integer NOT NULL,
    usuario_id integer,
    CONSTRAINT egresso_remuneracao_bolsa_egresso_check CHECK ((remuneracao_bolsa_egresso >= (0)::double precision))
);


--
-- TOC entry 232 (class 1259 OID 142385)
-- Name: egresso_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_aud (
    id_egresso integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    ativo boolean,
    created_by integer,
    created_date timestamp(6) without time zone,
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    bolsista_egresso boolean,
    cotista_egresso boolean,
    foto_egresso character varying(255),
    interesse_em_pos_egresso boolean,
    lattes_egresso character varying(255),
    linkedin_egresso character varying(255),
    matricula_egresso character varying(12),
    nascimento_egresso date,
    pos_graduacao_egresso boolean,
    remuneracao_bolsa_egresso double precision,
    tipo_bolsa_id integer,
    genero_id integer,
    usuario_id integer
);


--
-- TOC entry 233 (class 1259 OID 142392)
-- Name: egresso_cota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_cota (
    id_cota integer NOT NULL,
    id_egresso integer NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 142397)
-- Name: egresso_cota_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_cota_aud (
    rev integer NOT NULL,
    id_egresso integer NOT NULL,
    id_cota integer NOT NULL,
    revtype smallint
);


--
-- TOC entry 235 (class 1259 OID 142402)
-- Name: egresso_empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_empresa (
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    empresa_id_empresa integer NOT NULL,
    endereco_id_endereco integer NOT NULL,
    egresso_id_egresso integer NOT NULL,
    area_atuacao_id integer NOT NULL,
    faixa_salarial_id integer NOT NULL,
    setor_atuacao_id integer NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 142373)
-- Name: egresso_id_egresso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.egresso_id_egresso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 230
-- Name: egresso_id_egresso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.egresso_id_egresso_seq OWNED BY public.egresso.id_egresso;


--
-- TOC entry 236 (class 1259 OID 142409)
-- Name: egresso_titulacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_titulacao (
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    egresso_id_egresso integer NOT NULL,
    titulacao_id_titulacao integer NOT NULL,
    curso_id integer NOT NULL,
    empresa_id integer NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 142417)
-- Name: egresso_valido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_valido (
    id_egresso_valido integer NOT NULL,
    email_egresso_valido character varying(255),
    matricula_egresso_valido character varying(12),
    nome_egresso_valido character varying(100) NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 142416)
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.egresso_valido_id_egresso_valido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 237
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.egresso_valido_id_egresso_valido_seq OWNED BY public.egresso_valido.id_egresso_valido;


--
-- TOC entry 240 (class 1259 OID 142424)
-- Name: empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.empresa (
    id_empresa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    empresa_is_emprego boolean NOT NULL,
    nome_empresa character varying(130) NOT NULL,
    endereco_empresa integer
);


--
-- TOC entry 239 (class 1259 OID 142423)
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 239
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;


--
-- TOC entry 242 (class 1259 OID 142433)
-- Name: endereco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.endereco (
    id_endereco integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    cidade_endereco character varying(255) NOT NULL,
    cidade_id_endereco integer,
    estado_endereco character varying(255) NOT NULL,
    pais_endereco character varying(255) NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 142432)
-- Name: endereco_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.endereco_id_endereco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 241
-- Name: endereco_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.endereco_id_endereco_seq OWNED BY public.endereco.id_endereco;


--
-- TOC entry 244 (class 1259 OID 142444)
-- Name: faixa_salarial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.faixa_salarial (
    id_faixa_salarial integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    faixa_faixa_salarial character varying(60) NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 142443)
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.faixa_salarial_id_faixa_salarial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 243
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.faixa_salarial_id_faixa_salarial_seq OWNED BY public.faixa_salarial.id_faixa_salarial;


--
-- TOC entry 246 (class 1259 OID 142453)
-- Name: genero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genero (
    id_genero integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_genero character varying(60) NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 142461)
-- Name: genero_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genero_aud (
    id_genero integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    ativo boolean,
    created_by integer,
    created_date timestamp(6) without time zone,
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_genero character varying(60)
);


--
-- TOC entry 245 (class 1259 OID 142452)
-- Name: genero_id_genero_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 245
-- Name: genero_id_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genero_id_genero_seq OWNED BY public.genero.id_genero;


--
-- TOC entry 249 (class 1259 OID 142467)
-- Name: mensagem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mensagem (
    id_mensagem integer NOT NULL,
    anual_mensagem boolean,
    corpo_mensagem character varying(5000) NOT NULL,
    data_enviada_mensagem timestamp(6) without time zone,
    data_mensagem timestamp(6) without time zone NOT NULL,
    email_mensagem character varying(50),
    escopo_mensagem character varying(255) NOT NULL,
    frequente_mensagem boolean
);


--
-- TOC entry 248 (class 1259 OID 142466)
-- Name: mensagem_id_mensagem_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mensagem_id_mensagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 248
-- Name: mensagem_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mensagem_id_mensagem_seq OWNED BY public.mensagem.id_mensagem;


--
-- TOC entry 251 (class 1259 OID 142476)
-- Name: palestra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.palestra (
    id_palestra integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    descricao_palestra oid NOT NULL,
    egresso_id integer NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 142475)
-- Name: palestra_id_palestra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.palestra_id_palestra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 250
-- Name: palestra_id_palestra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.palestra_id_palestra_seq OWNED BY public.palestra.id_palestra;


--
-- TOC entry 253 (class 1259 OID 142485)
-- Name: recuperacao_senha; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recuperacao_senha (
    id_recuperacao_senha integer NOT NULL,
    password_change_recuperacao_senha boolean DEFAULT true NOT NULL,
    prazo_final_recuperacao_senha timestamp(6) without time zone NOT NULL,
    token_recuperacao_senha uuid NOT NULL,
    usuario integer NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 142484)
-- Name: recuperacao_senha_id_recuperacao_senha_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recuperacao_senha_id_recuperacao_senha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 252
-- Name: recuperacao_senha_id_recuperacao_senha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recuperacao_senha_id_recuperacao_senha_seq OWNED BY public.recuperacao_senha.id_recuperacao_senha;


--
-- TOC entry 254 (class 1259 OID 142492)
-- Name: revinfo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


--
-- TOC entry 214 (class 1259 OID 142302)
-- Name: revinfo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.revinfo_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 256 (class 1259 OID 142498)
-- Name: setor_atuacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.setor_atuacao (
    id_setor_atuacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_setor_atuacao character varying(60) NOT NULL
);


--
-- TOC entry 255 (class 1259 OID 142497)
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.setor_atuacao_id_setor_atuacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 255
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.setor_atuacao_id_setor_atuacao_seq OWNED BY public.setor_atuacao.id_setor_atuacao;


--
-- TOC entry 258 (class 1259 OID 142507)
-- Name: status_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.status_usuario (
    id_status_usuario integer NOT NULL,
    mudanca timestamp(6) without time zone DEFAULT now() NOT NULL,
    nome_status_usuario character varying(50) NOT NULL,
    status character varying(10) NOT NULL,
    usuario_id_status_usuario integer NOT NULL
);


--
-- TOC entry 257 (class 1259 OID 142506)
-- Name: status_usuario_id_status_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.status_usuario_id_status_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 257
-- Name: status_usuario_id_status_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.status_usuario_id_status_usuario_seq OWNED BY public.status_usuario.id_status_usuario;


--
-- TOC entry 260 (class 1259 OID 142515)
-- Name: tipo_bolsa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_bolsa (
    id_tipo_bolsa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_tipo_bolsa character varying(100) NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 142523)
-- Name: tipo_bolsa_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_bolsa_aud (
    id_tipo_bolsa integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    ativo boolean,
    created_by integer,
    created_date timestamp(6) without time zone,
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_tipo_bolsa character varying(100)
);


--
-- TOC entry 259 (class 1259 OID 142514)
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_bolsa_id_tipo_bolsa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 259
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_bolsa_id_tipo_bolsa_seq OWNED BY public.tipo_bolsa.id_tipo_bolsa;


--
-- TOC entry 263 (class 1259 OID 142529)
-- Name: titulacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.titulacao (
    id_titulacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    nome_titulacao character varying(30) NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 142528)
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.titulacao_id_titulacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 262
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.titulacao_id_titulacao_seq OWNED BY public.titulacao.id_titulacao;


--
-- TOC entry 265 (class 1259 OID 142538)
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_by integer,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    email character varying(50) NOT NULL,
    email_verificado_usuario boolean DEFAULT false NOT NULL,
    nome_usuario character varying(100) NOT NULL,
    senha_usuario character varying(80) NOT NULL,
    login_usuario character varying(50) NOT NULL,
    valido_usuario boolean DEFAULT true NOT NULL
);


--
-- TOC entry 266 (class 1259 OID 142548)
-- Name: usuario_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_aud (
    id_usuario integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    ativo boolean,
    created_by integer,
    created_date timestamp(6) without time zone,
    last_modified_by integer,
    last_modified_date timestamp(6) without time zone,
    email character varying(50),
    email_verificado_usuario boolean,
    nome_usuario character varying(100),
    senha_usuario character varying(80),
    login_usuario character varying(50),
    valido_usuario boolean
);


--
-- TOC entry 267 (class 1259 OID 142553)
-- Name: usuario_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_grupo (
    id_usuario integer NOT NULL,
    grupo character varying(10) NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 142558)
-- Name: usuario_grupo_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_grupo_aud (
    rev integer NOT NULL,
    id_usuario integer NOT NULL,
    grupo character varying(10) NOT NULL,
    revtype smallint
);


--
-- TOC entry 264 (class 1259 OID 142537)
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
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 264
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 3348 (class 2604 OID 142307)
-- Name: anuncio id_anuncio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio ALTER COLUMN id_anuncio SET DEFAULT nextval('public.anuncio_id_anuncio_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 142318)
-- Name: area_atuacao id_area_atuacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao ALTER COLUMN id_area_atuacao SET DEFAULT nextval('public.area_atuacao_id_area_atuacao_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 142327)
-- Name: area_emprego id_area_emprego; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_emprego ALTER COLUMN id_area_emprego SET DEFAULT nextval('public.area_emprego_id_area_emprego_seq'::regclass);


--
-- TOC entry 3357 (class 2604 OID 142336)
-- Name: contribuicao id_contribuicao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao ALTER COLUMN id_contribuicao SET DEFAULT nextval('public.contribuicao_id_contribuicao_seq'::regclass);


--
-- TOC entry 3360 (class 2604 OID 142345)
-- Name: cota id_cota; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota ALTER COLUMN id_cota SET DEFAULT nextval('public.cota_id_cota_seq'::regclass);


--
-- TOC entry 3363 (class 2604 OID 142359)
-- Name: curso id_curso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso ALTER COLUMN id_curso SET DEFAULT nextval('public.curso_id_curso_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 142368)
-- Name: depoimento id_depoimento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento ALTER COLUMN id_depoimento SET DEFAULT nextval('public.depoimento_id_depoimento_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 142377)
-- Name: egresso id_egresso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso ALTER COLUMN id_egresso SET DEFAULT nextval('public.egresso_id_egresso_seq'::regclass);


--
-- TOC entry 3376 (class 2604 OID 142420)
-- Name: egresso_valido id_egresso_valido; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido ALTER COLUMN id_egresso_valido SET DEFAULT nextval('public.egresso_valido_id_egresso_valido_seq'::regclass);


--
-- TOC entry 3377 (class 2604 OID 142427)
-- Name: empresa id_empresa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);


--
-- TOC entry 3380 (class 2604 OID 142436)
-- Name: endereco id_endereco; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id_endereco SET DEFAULT nextval('public.endereco_id_endereco_seq'::regclass);


--
-- TOC entry 3383 (class 2604 OID 142447)
-- Name: faixa_salarial id_faixa_salarial; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial ALTER COLUMN id_faixa_salarial SET DEFAULT nextval('public.faixa_salarial_id_faixa_salarial_seq'::regclass);


--
-- TOC entry 3386 (class 2604 OID 142456)
-- Name: genero id_genero; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero ALTER COLUMN id_genero SET DEFAULT nextval('public.genero_id_genero_seq'::regclass);


--
-- TOC entry 3389 (class 2604 OID 142470)
-- Name: mensagem id_mensagem; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem ALTER COLUMN id_mensagem SET DEFAULT nextval('public.mensagem_id_mensagem_seq'::regclass);


--
-- TOC entry 3390 (class 2604 OID 142479)
-- Name: palestra id_palestra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra ALTER COLUMN id_palestra SET DEFAULT nextval('public.palestra_id_palestra_seq'::regclass);


--
-- TOC entry 3393 (class 2604 OID 142488)
-- Name: recuperacao_senha id_recuperacao_senha; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recuperacao_senha ALTER COLUMN id_recuperacao_senha SET DEFAULT nextval('public.recuperacao_senha_id_recuperacao_senha_seq'::regclass);


--
-- TOC entry 3395 (class 2604 OID 142501)
-- Name: setor_atuacao id_setor_atuacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao ALTER COLUMN id_setor_atuacao SET DEFAULT nextval('public.setor_atuacao_id_setor_atuacao_seq'::regclass);


--
-- TOC entry 3398 (class 2604 OID 142510)
-- Name: status_usuario id_status_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status_usuario ALTER COLUMN id_status_usuario SET DEFAULT nextval('public.status_usuario_id_status_usuario_seq'::regclass);


--
-- TOC entry 3400 (class 2604 OID 142518)
-- Name: tipo_bolsa id_tipo_bolsa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa ALTER COLUMN id_tipo_bolsa SET DEFAULT nextval('public.tipo_bolsa_id_tipo_bolsa_seq'::regclass);


--
-- TOC entry 3403 (class 2604 OID 142532)
-- Name: titulacao id_titulacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao ALTER COLUMN id_titulacao SET DEFAULT nextval('public.titulacao_id_titulacao_seq'::regclass);


--
-- TOC entry 3406 (class 2604 OID 142541)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3701 (class 0 OID 142304)
-- Dependencies: 216
-- Data for Name: anuncio; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3703 (class 0 OID 142315)
-- Dependencies: 218
-- Data for Name: area_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.area_atuacao VALUES (1, true, 1, '2023-07-02 12:35:17.212268', NULL, NULL, 'Computação');
INSERT INTO public.area_atuacao VALUES (2, true, 1, '2023-07-02 12:35:17.213568', NULL, NULL, 'Pesquisa');
INSERT INTO public.area_atuacao VALUES (3, true, 1, '2023-07-02 12:35:17.222874', NULL, NULL, 'Desempregado');
INSERT INTO public.area_atuacao VALUES (4, true, 1, '2023-07-02 12:35:17.224444', NULL, NULL, 'Programador');
INSERT INTO public.area_atuacao VALUES (5, true, 1, '2023-07-02 12:35:17.225796', NULL, NULL, 'Analista');
INSERT INTO public.area_atuacao VALUES (6, true, 1, '2023-07-02 12:35:17.22725', NULL, NULL, 'Outros');


--
-- TOC entry 3705 (class 0 OID 142324)
-- Dependencies: 220
-- Data for Name: area_emprego; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.area_emprego VALUES (1, true, 1, '2023-07-02 12:35:25.347513', NULL, NULL, 'Engenharia de Software');
INSERT INTO public.area_emprego VALUES (2, true, 1, '2023-07-02 12:35:25.348998', NULL, NULL, 'Programação');
INSERT INTO public.area_emprego VALUES (3, true, 1, '2023-07-02 12:35:25.350164', NULL, NULL, 'Informática');
INSERT INTO public.area_emprego VALUES (4, true, 1, '2023-07-02 12:35:25.351331', NULL, NULL, 'Suporte a TI');
INSERT INTO public.area_emprego VALUES (5, true, 1, '2023-07-02 12:35:25.3525', NULL, NULL, 'Analista de Sistema');
INSERT INTO public.area_emprego VALUES (6, true, 1, '2023-07-02 12:35:25.353843', NULL, NULL, 'Analista de QA');
INSERT INTO public.area_emprego VALUES (7, true, 1, '2023-07-02 12:35:25.355155', NULL, NULL, 'Outros');


--
-- TOC entry 3707 (class 0 OID 142333)
-- Dependencies: 222
-- Data for Name: contribuicao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3709 (class 0 OID 142342)
-- Dependencies: 224
-- Data for Name: cota; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cota VALUES (1, true, 1, '2023-07-02 12:35:17.182819', NULL, NULL, 'Escola');
INSERT INTO public.cota VALUES (2, true, 1, '2023-07-02 12:35:17.192155', NULL, NULL, 'Renda');
INSERT INTO public.cota VALUES (3, true, 1, '2023-07-02 12:35:17.193568', NULL, NULL, 'Autodeclaração de Raça');
INSERT INTO public.cota VALUES (4, true, 1, '2023-07-02 12:35:17.19493', NULL, NULL, 'Quilombolas/Indígenas');
INSERT INTO public.cota VALUES (5, true, 1, '2023-07-02 12:35:17.196244', NULL, NULL, 'PCD');


--
-- TOC entry 3710 (class 0 OID 142350)
-- Dependencies: 225
-- Data for Name: cota_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3712 (class 0 OID 142356)
-- Dependencies: 227
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.curso VALUES (1, true, 1, '2023-07-02 12:35:17.197574', NULL, NULL, 'CIÊNCIA DA COMPUTAÇÃO');


--
-- TOC entry 3714 (class 0 OID 142365)
-- Dependencies: 229
-- Data for Name: depoimento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3716 (class 0 OID 142374)
-- Dependencies: 231
-- Data for Name: egresso; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3717 (class 0 OID 142385)
-- Dependencies: 232
-- Data for Name: egresso_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3718 (class 0 OID 142392)
-- Dependencies: 233
-- Data for Name: egresso_cota; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3719 (class 0 OID 142397)
-- Dependencies: 234
-- Data for Name: egresso_cota_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3720 (class 0 OID 142402)
-- Dependencies: 235
-- Data for Name: egresso_empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3721 (class 0 OID 142409)
-- Dependencies: 236
-- Data for Name: egresso_titulacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3723 (class 0 OID 142417)
-- Dependencies: 238
-- Data for Name: egresso_valido; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.egresso_valido VALUES (1, NULL, '200411140009', 'ADALBERTO DOS REMEDIOS SILVA JUNIOR');
INSERT INTO public.egresso_valido VALUES (2, 'quase_4ever@yahoo.com.br', '200511140025', 'ADONIAS PINHEIRO PIRES');
INSERT INTO public.egresso_valido VALUES (3, NULL, '200311140030', 'ADRIANA MENDONCA GARCES');
INSERT INTO public.egresso_valido VALUES (4, 'adrianocbsi05@gmail.com', '200511140017', 'ADRIANO ANDRADE SILVA');
INSERT INTO public.egresso_valido VALUES (5, NULL, '200311140009', 'ALAYR MAUES MELO SOBRINHO');
INSERT INTO public.egresso_valido VALUES (6, NULL, '200411140017', 'ALBERTO WILLIAMS CORREA FERREIRA');
INSERT INTO public.egresso_valido VALUES (7, 'alessandrocunha1@gmail.com', '200711140025', 'ALESSANDRO PEDRO DA CUNHA');
INSERT INTO public.egresso_valido VALUES (8, 'alexandrecjr@ufpa.br', '200611140006', 'ALEXANDRE BRITO CARDIAS JUNIOR');
INSERT INTO public.egresso_valido VALUES (9, 'alexandretelesbastos@gmail.com', '200811140014', 'ALEXANDRE TELES BASTOS');
INSERT INTO public.egresso_valido VALUES (10, NULL, '200411140008', 'ALEXSANDER HAGE DE MELO');
INSERT INTO public.egresso_valido VALUES (11, 'alisoncosta@globo.com', '200811140007', 'ALISON COSTA DA CONCEICAO');
INSERT INTO public.egresso_valido VALUES (12, 'apbelem@bol.com.br', '200511140033', 'ALISSON PAULO SOUSA SIQUEIRA');
INSERT INTO public.egresso_valido VALUES (13, 'allan.pa.br@gmail.com', '201311140010', 'ALLAN DA SILVA ALCANTARA');
INSERT INTO public.egresso_valido VALUES (14, 'jardim-do-heden@hotmail.com', '200811140040', 'ALLE HEDEN TRINDADE DE SOUZA');
INSERT INTO public.egresso_valido VALUES (15, 'altisouza@gmail.com', '200311140004', 'ALTIERE COSTA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (16, 'anovaes27@gmail.com', '201111140034', 'ANDERSON COSTA NOVAES DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (17, 'andufpa@gmail.com', '201111140018', 'ANDERSON JORGE SANTOS FERREIRA');
INSERT INTO public.egresso_valido VALUES (18, 'andsilvapara@bol.com.br', '200311140029', 'ANDERSON JUNIOR PARAENSE DA SILVA');
INSERT INTO public.egresso_valido VALUES (19, 'andervilo@hotmail.com', '201111140007', 'ANDERSON NAZARENO ALCANTARA DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (20, 'andre.n.los@gmail.com', '201211140004', 'ANDRÉ AVELINO DA SILVA NETO');
INSERT INTO public.egresso_valido VALUES (21, 'andre.def93@gmail.com', '201311140016', 'ANDRE DEFREMONT');
INSERT INTO public.egresso_valido VALUES (22, 'acgrafic@gmail.com', '200711140013', 'ANDRE LUIZ COELHO PINHEIRO');
INSERT INTO public.egresso_valido VALUES (23, 'andredgusmao@gmail.com', '200811140002', 'ANDRE LUIZ DE GUSMAO');
INSERT INTO public.egresso_valido VALUES (24, 'andressa.myrtys@gmail.com', '200911140012', 'ANDRESSA MYRTYS PEREIRA NOWACZYK');
INSERT INTO public.egresso_valido VALUES (25, NULL, '200211140003', 'ANDRE THIAGO SANTANA FERNANDES');
INSERT INTO public.egresso_valido VALUES (26, 'antonilsonalcantara@gmail.com', '201211140014', 'ANTONILSON DA SILVA ALCANTARA');
INSERT INTO public.egresso_valido VALUES (27, 'alan.menezes@yahoo.com.br', '200911140029', 'ANTONIO ALAN MENEZES DA SILVA');
INSERT INTO public.egresso_valido VALUES (28, NULL, '200211140020', 'ANTONIO NICOLAU MAIA JUNIOR');
INSERT INTO public.egresso_valido VALUES (29, NULL, '200411140016', 'ARLEM ANTONIO PEREIRA LEMOS');
INSERT INTO public.egresso_valido VALUES (30, 'berton28@hotmail.com', '200211140032', 'BELARDIM BERTON LOPES ARAUJO');
INSERT INTO public.egresso_valido VALUES (31, NULL, '200711140015', 'BERNARDO JOSE DA SILVA ESTACIO');
INSERT INTO public.egresso_valido VALUES (32, 'brenobcampos@gmail.com', '200711140017', 'BRENO BRUNO VIEIRA DE CAMPOS');
INSERT INTO public.egresso_valido VALUES (33, 'bjullynn@gmail.com', '200911140031', 'BRUNA JULLY NEVES NUNES');
INSERT INTO public.egresso_valido VALUES (34, 'botabotelho@hotmail.com', '200311140035', 'BRUNO BOTELHO CARDOSO');
INSERT INTO public.egresso_valido VALUES (35, 'brunolmartins@gmail.com', '201011140026', 'BRUNO LIMA MARTINS');
INSERT INTO public.egresso_valido VALUES (36, 'csp@ufpa.br', '200611140025', 'CARLOS DOS SANTOS PORTELA');
INSERT INTO public.egresso_valido VALUES (37, NULL, '200511140024', 'CARMEN LUCIA MARTINS DO NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (38, NULL, '200311140024', 'CECIL CORDEIRO DA SILVA');
INSERT INTO public.egresso_valido VALUES (39, 'crsg.si.2012@gmail.com', '201211140034', 'CLEBER ROBSON DA SILVA GOMES');
INSERT INTO public.egresso_valido VALUES (40, NULL, '200411140023', 'DACIO PANTOJA SILVA');
INSERT INTO public.egresso_valido VALUES (41, 'dangelomendes10@gmail.com', '201011140021', 'DANGELO WESLEY OLIVEIRA MENDES');
INSERT INTO public.egresso_valido VALUES (42, NULL, '200511140036', 'DANIEL BERG SOUZA DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (43, NULL, '200211140015', 'DANIELLE GONCALVES BARROS');
INSERT INTO public.egresso_valido VALUES (44, 'danilopinto@museu-goeldi.br', '200411140019', 'DANILO ANDERSON PALHANO PINTO');
INSERT INTO public.egresso_valido VALUES (45, NULL, '200411140005', 'DANILO HENRIQUE SOUSA MARTINS');
INSERT INTO public.egresso_valido VALUES (46, 'danilomatosdasilva@gmail.com', '200811140023', 'DANILO MATOS DA SILVA');
INSERT INTO public.egresso_valido VALUES (47, 'danilosduarte5@gmail.com', '201611140020', 'DANILO SOUZA DUARTE');
INSERT INTO public.egresso_valido VALUES (48, 'david.barros.j@gmail.com', '201111140037', 'DAVID BARROS DE OLIVEIRA JUNIOR');
INSERT INTO public.egresso_valido VALUES (49, 'cuentrosilva@gmail.com', '201011140007', 'DEBORA DA SILVA CUENTRO');
INSERT INTO public.egresso_valido VALUES (50, 'deboraelima58@gmail.com', '201111140005', 'DEBORA EMERIQUE DE LIMA');
INSERT INTO public.egresso_valido VALUES (51, 'denermaues@gmail.com', '201511140004', 'DENER MAUES NEGRAO');
INSERT INTO public.egresso_valido VALUES (52, 'denisson_roney@hotmail.com', '201111140039', 'DENISSON RONEY ALVES REIS');
INSERT INTO public.egresso_valido VALUES (53, 'diegolisboa@ufpa.br', '200711140027', 'DIEGO ASSIS DA SILVA LISBOA');
INSERT INTO public.egresso_valido VALUES (54, 'diego.souza@icen.ufpa.br', '200911140008', 'DIEGO RODRIGUES DE SOUZA');
INSERT INTO public.egresso_valido VALUES (55, 'diegofuture@yahoo.com.br', '200711140022', 'DIEGO SAMPAIO PANTOJA');
INSERT INTO public.egresso_valido VALUES (56, 'diellefranco@yahoo.com.br', '200211140004', 'DIELLE DA SILVA CORREA FRANCO');
INSERT INTO public.egresso_valido VALUES (57, 'cetlho@gmail.com', '201011140022', 'DIOGO ADRIEL LIMA FERREIRA');
INSERT INTO public.egresso_valido VALUES (58, 'diogo.marinho@gmail.com', '200411140002', 'DIOGO MARINHO ALMEIDA');
INSERT INTO public.egresso_valido VALUES (59, 'diorgino@gmail.com', '201011140023', 'DIORGINO RIGLES ALVES REIS');
INSERT INTO public.egresso_valido VALUES (60, 'diovanini@gmail.com', '200611140021', 'DIOVANNI MORAES DE ARAUJO');
INSERT INTO public.egresso_valido VALUES (61, 'edgar.eguchi@gmail.com', '200611140033', 'EDGAR EGUCHI ALVES');
INSERT INTO public.egresso_valido VALUES (62, NULL, '200411140015', 'EDILSON ALVARO CUSTODIO JUNIOR');
INSERT INTO public.egresso_valido VALUES (63, 'ednssousa@yahoo.com.br', '200511140020', 'EDNELSON SILVA DE SOUSA');
INSERT INTO public.egresso_valido VALUES (64, NULL, '200411140027', 'EDSON GOMES DE AGUIAR SILVA');
INSERT INTO public.egresso_valido VALUES (65, NULL, '200311140008', 'EDUARDO SOUSA DE ARAUJO');
INSERT INTO public.egresso_valido VALUES (66, 'edwinchagas@ufpa.br', '201511140005', 'EDWIN VIANA CHAGAS');
INSERT INTO public.egresso_valido VALUES (67, 'ebec2012@gmail.com', '201211140035', 'ELDER BRUNO EVARISTO CORREA');
INSERT INTO public.egresso_valido VALUES (68, 'thiagom@ufpa.br', '201111140031', 'ELDER THIAGO COSTA MOREIRA');
INSERT INTO public.egresso_valido VALUES (69, 'elielsbentes@hotmail.com', '201111140019', 'ELIEL DOS SANTOS BENTES');
INSERT INTO public.egresso_valido VALUES (70, 'elienenb@yahoo.com.br', '200411140012', 'ELIENE DE NAZARE NASCIMENTO PAIXAO');
INSERT INTO public.egresso_valido VALUES (71, 'eliwelton.g.p@gmail.com', '201311140007', 'ELIWELTON GOMES PAES');
INSERT INTO public.egresso_valido VALUES (72, 'eltonsarmanho@gmail.com', '200611140008', 'ELTON SARMANHO SIQUEIRA');
INSERT INTO public.egresso_valido VALUES (73, 'elvisthermo@hotmail.com', '201611140041', 'ELVIS THERMO CARVALHO MIRANDA');
INSERT INTO public.egresso_valido VALUES (74, 'e.syadetbo@gmail.com', '201311140005', 'ERICK CARDOSO SYADE');
INSERT INTO public.egresso_valido VALUES (75, 'erikasoueu@gmail.com', '200611140019', 'ERIKA MAIA LIMA');
INSERT INTO public.egresso_valido VALUES (76, NULL, '200411140035', 'EUDO NEVES PRIMO');
INSERT INTO public.egresso_valido VALUES (77, 'evandroofox@gmail.com', '201211140005', 'EVANDRO DE SOUZA MONTEIRO');
INSERT INTO public.egresso_valido VALUES (78, 'ewertom.moraes@gmail.com', '201311140004', 'EWERTOM MOZART MORAES DE MIRANDA');
INSERT INTO public.egresso_valido VALUES (79, 'expeditonobrefilho@gmail.com', '201311140031', 'EXPEDITO AUGUSTO CARDOSO NOBRE FILHO');
INSERT INTO public.egresso_valido VALUES (80, NULL, '200411140034', 'FABIO LUIZ CORDEIRO REZENDE');
INSERT INTO public.egresso_valido VALUES (81, 'araujopa@gmail.com', '200711140024', 'FABRICIO ALMEIDA ARAUJO');
INSERT INTO public.egresso_valido VALUES (82, NULL, '200611140013', 'FABRICIO BRAGA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (83, NULL, '200711140019', 'FAUSTINO FIRMINO DE CARVALHO JUNIOR');
INSERT INTO public.egresso_valido VALUES (84, 'felipe.leite.nazareth@gmail.com', '200811140009', 'FELIPE LEITE DE NAZARETH');
INSERT INTO public.egresso_valido VALUES (85, 'fernandoaj@ufpa.br', '201411140003', 'FERNANDO CESAR CHAVES ALVES JUNIOR');
INSERT INTO public.egresso_valido VALUES (86, 'f.fabiogama88@gmail.com', '201011140028', 'FERNANDO FABIO DIAS GAMA DA MATA');
INSERT INTO public.egresso_valido VALUES (87, 'fernandols.cardoso@gmail.com', '200811140010', 'FERNANDO LUIZ DE SIQUEIRA CARDOSO');
INSERT INTO public.egresso_valido VALUES (88, 'flash104@gmail.com', '200811140024', 'FERNANDO WAGNER ASSUNCAO TEIXEIRA');
INSERT INTO public.egresso_valido VALUES (89, 'flavio.oliveira@ica.ufpa.br', '200511140018', 'FLAVIO AUGUSTO SANTOS DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (90, 'franccy.b@gmail.com', '201211140015', 'FRANCIELLEM MAYARA PONTES BEZERRA');
INSERT INTO public.egresso_valido VALUES (91, 'assuncao.francielma@gmail.com', '201611140010', 'FRANCIELMA DOS SANTOS ASSUNCAO');
INSERT INTO public.egresso_valido VALUES (92, NULL, '200711140010', 'FRANCISCO BANDEIRA BRITO JUNIOR');
INSERT INTO public.egresso_valido VALUES (93, 'jramlen@gmail.com', '200911140027', 'FRANCISCO CARLOS GUALBERTO DOS SANTOS JUNIOR');
INSERT INTO public.egresso_valido VALUES (94, NULL, '200311140033', 'FRANCISCO PAULO BRITO BORGES');
INSERT INTO public.egresso_valido VALUES (95, NULL, '200211140031', 'FRANKNALDO TORRES GOMES');
INSERT INTO public.egresso_valido VALUES (96, 'ggomes873@gmail.com', '201611140012', 'GABRIEL CRUZ SOARES GOMES');
INSERT INTO public.egresso_valido VALUES (97, 'gabrielmedsilva@hotmail.com', '201111140025', 'GABRIEL MEDEIROS DA SILVA');
INSERT INTO public.egresso_valido VALUES (98, 'gedean.carvalho@hotmail.com', '201011140002', 'GEDEAN GONCALVES CARVALHO');
INSERT INTO public.egresso_valido VALUES (99, NULL, '200311140001', 'GENE SHUCHIN WEN');
INSERT INTO public.egresso_valido VALUES (100, NULL, '200511140008', 'GEORGE GILSON OLIVEIRA DOS REIS');
INSERT INTO public.egresso_valido VALUES (101, 'geovanipaz7@gmail.com', '201211140009', 'GEOVANI OLIVEIRA CABRAL DA PAZ');
INSERT INTO public.egresso_valido VALUES (102, 'gersonsouza2@gmail.com', '201111140012', 'GERSON SOUZA DA SILVA');
INSERT INTO public.egresso_valido VALUES (103, 'gilbertojr@ufpa.br', '200611140023', 'GILBERTO NERINO DE SOUZA JUNIOR');
INSERT INTO public.egresso_valido VALUES (104, 'assumpcaogiovanni@yahoo.com.br', '200711140033', 'GIOVANNI ASSUMPCAO MAGNO');
INSERT INTO public.egresso_valido VALUES (105, 'g3oaugusto@gmail.com', '200611140005', 'GIOVANNI AUGUSTO MELO PINHEIRO');
INSERT INTO public.egresso_valido VALUES (106, NULL, '200711140035', 'GLEIDSON FELIPE PEREIRA DA SILVA');
INSERT INTO public.egresso_valido VALUES (107, 'gleisebaldez@gmail.com', '200711140001', 'GLEISE PINHEIRO BALDEZ');
INSERT INTO public.egresso_valido VALUES (108, NULL, '200311140010', 'GLEYDSON DA COSTA FERREIRA');
INSERT INTO public.egresso_valido VALUES (109, NULL, '200311140011', 'GLEYSON MIRANDA MELO');
INSERT INTO public.egresso_valido VALUES (110, 'gustavomaues@ufpa.br', '200311140005', 'GUSTAVO MAUES DE OLIVEIRA LOBATO');
INSERT INTO public.egresso_valido VALUES (111, 'hanagabrielle@outlook.com', '201711140009', 'HANA GABRIELLE DOS SANTOS BARATA');
INSERT INTO public.egresso_valido VALUES (112, 'hans.w.santos@gmail.com', '201011140010', 'HANS WILLIAM DOS SANTOS SILVA');
INSERT INTO public.egresso_valido VALUES (113, 'hegoncbsi@yahoo.com.br', '200511140022', 'HEGON HENRIQUE CORREA DA SILVA');
INSERT INTO public.egresso_valido VALUES (114, 'herberthalmeida@hotmail.com', '200811140031', 'HERBERTH MENDES DE ALMEIDA');
INSERT INTO public.egresso_valido VALUES (115, 'hieda@ufpa.br', '200211140009', 'HIEDA ADRIANA NASCIMENTO SILVA');
INSERT INTO public.egresso_valido VALUES (116, 'hbsnhugo@gmail.com', '200711140011', 'HUGO BISPO SANTOS DO NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (117, NULL, '200311140032', 'HUGO RONALDO GONZALEZ NOGUEIRA');
INSERT INTO public.egresso_valido VALUES (118, 'ideraldo_carlos@hotmail.com', '200611140010', 'IDERALDO CARLOS PAVESI');
INSERT INTO public.egresso_valido VALUES (119, NULL, '200811140041', 'IGOR BARBOSA DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (120, 'i.moreiragt@gmail.com', '201511140003', 'INGRID MOREIRA MIRANDA DA SILVA');
INSERT INTO public.egresso_valido VALUES (121, 'isaacelgrably@hotmail.com', '201111140020', 'ISAAC SOUZA ELGRABLY');
INSERT INTO public.egresso_valido VALUES (122, 'iuriraiol@gmail.com', '200911140006', 'IURI IGONEZ SILVA RAIOL');
INSERT INTO public.egresso_valido VALUES (123, 'jacksonpscruz@outlook.com', '200411140011', 'JACKSON PEREIRA DA SILVA CRUZ');
INSERT INTO public.egresso_valido VALUES (124, 'jadirjunior@ufpa.br', '200911140023', 'JADIR HORACIO SARMENTO PINTO JUNIOR');
INSERT INTO public.egresso_valido VALUES (125, 'jailsontolosa@gmail.com', '201111140014', 'JAILSON MARTINS TOLOSA');
INSERT INTO public.egresso_valido VALUES (126, 'junior.jairo1@gmail.com', '200811140039', 'JAIRO DE JESUS NASCIMENTO DA SILVA JUNIOR');
INSERT INTO public.egresso_valido VALUES (127, 'jamysonmatoso@yahoo.com.br', '200911140011', 'JAMYSON DA SILVA MATOSO');
INSERT INTO public.egresso_valido VALUES (128, NULL, '200211140010', 'JANDER DE SOUZA E SILVA');
INSERT INTO public.egresso_valido VALUES (129, 'jeffklister@gmail.com', '201311140001', 'JEFFERSON KLISTER DUARTE DA SILVA JUNIOR');
INSERT INTO public.egresso_valido VALUES (130, 'jesserocha2012@gmail.com', '201111140001', 'JESSÉ DA COSTA ROCHA');
INSERT INTO public.egresso_valido VALUES (131, 'jessicadepaula.stm@gmail.com', '201411140036', 'JESSICA DE PAULA FIGUEIRA RIBEIRO');
INSERT INTO public.egresso_valido VALUES (132, 'j0g4d0r1@hotmail.com', '200611140012', 'JHONATHAS SOUSA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (133, NULL, '200211140028', 'JHOVAN OBEDE TERRA DA SILVA');
INSERT INTO public.egresso_valido VALUES (134, 'joaoamil@hotmail.com', '200911140002', 'JOAO LUIS DOS REIS LIMA');
INSERT INTO public.egresso_valido VALUES (135, 'jvpaternostroc2@gmail.com', '201211140003', 'JOAO VICTOR PATERNOSTRO CORREA');
INSERT INTO public.egresso_valido VALUES (136, 'jq.quaresma12@gmail.com', '201111140011', 'JOSE AUGUSTO DE SENA QUARESMA');
INSERT INTO public.egresso_valido VALUES (137, NULL, '200711140020', 'JOSE BRICIO MACHADO CARDOSO NETO');
INSERT INTO public.egresso_valido VALUES (138, 'deivisonvx@gmail.com', '201311140026', 'JOSE DEIVISON VIEIRA XAVIER');
INSERT INTO public.egresso_valido VALUES (139, NULL, '200211140012', 'JOSE HIRVALDO LOBO MONTEIRO');
INSERT INTO public.egresso_valido VALUES (140, 'jose.monteiro@icen.ufpa.br', '201411140019', 'JOSE RAMON DA CONCEIÇAO MONTEIRO');
INSERT INTO public.egresso_valido VALUES (141, 'joycesinfo03@yahoo.com.br', '200311140015', 'JOYCE ANNE PINTO RODRIGUES');
INSERT INTO public.egresso_valido VALUES (142, 'julio.menezesi2013@gmail.com', '201311140036', 'JULIO DE PADUA LOPES MENEZES');
INSERT INTO public.egresso_valido VALUES (143, 'julioebs20@hotmail.com', '200711140014', 'JULIO EDUARDO BITTENCOURT DA SILVA');
INSERT INTO public.egresso_valido VALUES (144, 'juliusufpa2010@gmail.com', '201011140033', 'JULIO FRANCISCO COUTO DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (145, 'julioramonufpa@gmail.com', '200811140025', 'JULIO RAMON NOGUEIRA LISBOA');
INSERT INTO public.egresso_valido VALUES (146, NULL, '200711140004', 'KAIO SERGIO DA MOTTA VALENTE');
INSERT INTO public.egresso_valido VALUES (147, 'kalill.lameira@gmail.com', '201411140013', 'KALILL CORDEIRO LAMEIRA');
INSERT INTO public.egresso_valido VALUES (148, NULL, '200611140029', 'KAMILA BALTAZAR CORREIA');
INSERT INTO public.egresso_valido VALUES (149, 'katyakeila@gmail.com', '200511140031', 'KATYA KEILA COSTA ASSIS');
INSERT INTO public.egresso_valido VALUES (150, 'kelvintvieira@hotmail.com', '201111140016', 'KELVIN TEIXEIRA VIEIRA');
INSERT INTO public.egresso_valido VALUES (151, 'brunocorrea@ufpa.br', '200811140013', 'KLEOSON BRUNO CORREA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (152, 'laerte-gm@hotmail.com', '200911140001', 'LAERTE GUEDES MONTEIRO');
INSERT INTO public.egresso_valido VALUES (153, 'laertthpotter@hotmail.com', '201011140034', 'LAERTH LASERINO PINTO MONTEIRO');
INSERT INTO public.egresso_valido VALUES (154, 'laissribeiro@gmail.com', '200811140019', 'LAIS CONCEICAO RIBEIRO');
INSERT INTO public.egresso_valido VALUES (155, NULL, '200511140027', 'LARISSA DE SOUZA CARNEIRO');
INSERT INTO public.egresso_valido VALUES (156, 'leandro.goms.moura@gmail.com', '200911140033', 'LEANDRO GOMES DE MOURA');
INSERT INTO public.egresso_valido VALUES (157, NULL, '200411140004', 'LEANDRO HERNANDEZ ALMEIDA');
INSERT INTO public.egresso_valido VALUES (158, 'leidiel@ufpa.br', '200611140003', 'LEIDIEL ARAUJO DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (159, 'leonardoandre27@gmail.com', '201111140010', 'LEONARDO ANDRE SILVA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (160, 'barbosleonardo@gmail.com', '201011140001', 'LEONARDO BARBOSA DA COSTA');
INSERT INTO public.egresso_valido VALUES (161, 'leonardofig88@gmail.com', '201411140011', 'LEONARDO DA COSTA FIGUEIREDO');
INSERT INTO public.egresso_valido VALUES (162, 'leo_dm@live.it', '201111140008', 'LEONARDO DIAS MARTINS');
INSERT INTO public.egresso_valido VALUES (163, NULL, '200911140015', 'LEONARDO FERREIRA E SILVA');
INSERT INTO public.egresso_valido VALUES (164, 'leofozzy@yahoo.com.br', '200411140020', 'LEONARDO HERNANDEZ ALMEIDA');
INSERT INTO public.egresso_valido VALUES (165, 'leo-sdl@hotmail.br', '200511140002', 'LEO SANTOS DE LIMA');
INSERT INTO public.egresso_valido VALUES (166, NULL, '200511140015', 'LEYRILANE DE SOUZA');
INSERT INTO public.egresso_valido VALUES (167, 'lourdilene.souza@gmail.com', '201011140031', 'LOURDILENE SILVA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (168, NULL, '200311140013', 'LOURIVAL DA CONCEICAO PEREIRA JUNIOR');
INSERT INTO public.egresso_valido VALUES (169, 'luanoliveira35@hotmail.com', '201411140029', 'LUAN DOS SANTOS OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (170, 'akaluan.la@gmail.com', '201611140015', 'LUAN FELIPE BRITTO ALVES');
INSERT INTO public.egresso_valido VALUES (171, NULL, '200611140031', 'LUCIANA NEVES BENTES');
INSERT INTO public.egresso_valido VALUES (172, NULL, '200411140025', 'LUCIANE FARIAS SOARES');
INSERT INTO public.egresso_valido VALUES (173, 'alelibbra@hotmail.com', '200511140009', 'LUIZ ALESSANDRO LOPES FEITOSA');
INSERT INTO public.egresso_valido VALUES (174, 'luizdsousa@gmail.com', '201311140013', 'LUIZ ANTONIO ANDRADE DE SOUSA');
INSERT INTO public.egresso_valido VALUES (175, 'eduardo@alcantara.net.br', '201111140006', 'LUIZ EDUARDO ALVES DE ALCANTARA');
INSERT INTO public.egresso_valido VALUES (176, 'luizfelipph@gmail.com', '201211140006', 'LUIZ FELIPPH CALADO SOSINHO');
INSERT INTO public.egresso_valido VALUES (177, 'otaviodanin@gmail.com', '200911140021', 'LUIZ OTAVIO DANIN DE LIMA');
INSERT INTO public.egresso_valido VALUES (178, NULL, '200311140026', 'LUZIANA BRAGA CORREA');
INSERT INTO public.egresso_valido VALUES (179, NULL, '200411140003', 'LYNDON JOHNSON BRITO SOUSA');
INSERT INTO public.egresso_valido VALUES (180, 'mpillar@yahoo.com.br', '200211140013', 'MABEL PILAR NASCIMENTO DUARTE');
INSERT INTO public.egresso_valido VALUES (181, 'victor.ufpaa@gmail.com', '201211140022', 'MANOEL VICTOR RODRIGUES LEITE');
INSERT INTO public.egresso_valido VALUES (182, 'manuely.guedes@icen.ufpa.br', '201011140020', 'MANUELY BARBOSA GUEDES');
INSERT INTO public.egresso_valido VALUES (183, NULL, '200211140007', 'MARCELA SANTIAGO DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (184, 'marcelo@ufpa.br', '200411140029', 'MARCELO DA SILVA MORAES');
INSERT INTO public.egresso_valido VALUES (185, 'marcelosarraf@gmail.com', '200211140006', 'MARCELO SARRAF PINHO');
INSERT INTO public.egresso_valido VALUES (186, 'marcio.ponte@ufopa.edu.br', '200211140014', 'MARCIO JOSE MOUTINHO DA PONTE');
INSERT INTO public.egresso_valido VALUES (187, 'marciogomes@mpf.mp.br', '200311140016', 'MARCIO NUNES GOMES');
INSERT INTO public.egresso_valido VALUES (188, 'macapela@ufpa.br', '200411140032', 'MARCO AURELIO CAPELA');
INSERT INTO public.egresso_valido VALUES (189, 'almeidmar@gmail.com', '201511140034', 'MARCOS ALMEIDA DA COSTA');
INSERT INTO public.egresso_valido VALUES (190, NULL, '200411140030', 'MARCOS AUGUSTO BARATA DA SILVA');
INSERT INTO public.egresso_valido VALUES (191, 'marcsi2320@gmail.com', '201311140034', 'MARCOS PAULO FERREIRA COSTA');
INSERT INTO public.egresso_valido VALUES (192, NULL, '200411140024', 'MARCOS PAULO NASCIMENTO SILVA');
INSERT INTO public.egresso_valido VALUES (193, NULL, '200611140020', 'MARCOS VALERIO DA SILVA RENDEIRO');
INSERT INTO public.egresso_valido VALUES (194, 'marianojefferson@hotmail.com', '200711140021', 'MARIANO JEFFERSON BATISTA GOMES JUNIOR');
INSERT INTO public.egresso_valido VALUES (195, 'mario_oliveira10@yahoo.com.br', '201011140039', 'MARIO ANTONIO PEREIRA DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (196, NULL, '200211140017', 'MARIO BASTOS DE BRITO JUNIOR');
INSERT INTO public.egresso_valido VALUES (197, 'marlonufpasi@gmail.com', '201211140028', 'MARLON SILVA PIMENTEL CRUZ');
INSERT INTO public.egresso_valido VALUES (198, 'marlon.santos.santos@icen.ufpa.br', '201511140006', 'MARLON WILSON SANTOS DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (199, 'jodye_st@hotmail.com', '200511140019', 'MARTA JODYE BORDO DA CONCEICAO');
INSERT INTO public.egresso_valido VALUES (200, 'matheusvieiracoelho@gmail.com', '201311140021', 'MATHEUS SEABRA DE CARVALHO VIEIRA COELHO');
INSERT INTO public.egresso_valido VALUES (201, 'mauricio.si.ufpa@gmail.com', '201811140014', 'MAURICIO MARTINS RIBEIRO');
INSERT INTO public.egresso_valido VALUES (202, 'mauroabferreira@yahoo.com.br', '201111140048', 'MAURO AUGUSTO BARROS FERREIRA');
INSERT INTO public.egresso_valido VALUES (203, NULL, '200411140026', 'MAXIMIANO DAVES DA COSTA VIEIRA');
INSERT INTO public.egresso_valido VALUES (204, NULL, '200511140010', 'MAX WANDERSON DE ARAUJO FAVACHO');
INSERT INTO public.egresso_valido VALUES (205, 'maykonaraujo23@gmail.com', '201311140018', 'MAYKON ARAUJO DE SOUZA');
INSERT INTO public.egresso_valido VALUES (206, 'michelgondim@yahoo.com.br', '200511140034', 'MICHEL FEU CASTRO GONDIM');
INSERT INTO public.egresso_valido VALUES (207, NULL, '200711140008', 'MICHEL PEREIRA MARQUES');
INSERT INTO public.egresso_valido VALUES (208, 'NILJUNIOR@GMAIL.COM                                                             ', '200611140028', 'NILTON RODRIGUES DE ASSIS JUNIOR');
INSERT INTO public.egresso_valido VALUES (209, 'odirley007@yahoo.com.br', '201211140008', 'ODIRLEY PINHEIRO DE MATOS');
INSERT INTO public.egresso_valido VALUES (210, 'ontf.filho@gmail.com', '200811140026', 'ORLANDO DO NASCIMENTO TAVARES FILHO');
INSERT INTO public.egresso_valido VALUES (211, NULL, '200211140022', 'OTAVIO DUTRA LEITE');
INSERT INTO public.egresso_valido VALUES (212, 'patricia.diniz@tucurui.ufpa.br', '200411140010', 'PATRICIA PINTO DINIZ');
INSERT INTO public.egresso_valido VALUES (213, 'psn_leandro@hotmail.com', '200811140030', 'PAULEANDRO SILVA NUNES');
INSERT INTO public.egresso_valido VALUES (214, 'paulo_alp19@hotmail.com', '200611140026', 'PAULO ALBERTO LIMA PRADO');
INSERT INTO public.egresso_valido VALUES (215, NULL, '200211140008', 'PAULO ANDRE MOREIRA CARVALHO');
INSERT INTO public.egresso_valido VALUES (216, 'paulohenriq10@gmail.com', '201211140025', 'PAULO HENRIQUE AMORIM PEREIRA');
INSERT INTO public.egresso_valido VALUES (217, 'pv.lima05@gmail.com', '201111140024', 'PAULO VITOR CHAVES DE LIMA');
INSERT INTO public.egresso_valido VALUES (218, 'paulocardoso.dev@gmail.com', '200811140008', 'PAULO VITOR RODRIGUES CARDOSO');
INSERT INTO public.egresso_valido VALUES (219, 'weskleyalmeida.si@gmail.com', '201011140032', 'PAULO WESKLEY DE ALMEIDA FERREIRA');
INSERT INTO public.egresso_valido VALUES (220, 'pedro_cabeludow@hotmail.com', '200611140002', 'PEDRO ESTEVAO DA CONCEICAO MOUTINHO JUNIOR');
INSERT INTO public.egresso_valido VALUES (221, 'rafmout@yahoo.com.br', '200511140012', 'RAFAELA CARDOSO MOUTINHO');
INSERT INTO public.egresso_valido VALUES (222, 'peccatiello@ig.com.br', '200511140007', 'RAFAEL BRUNO PECCATIELLO');
INSERT INTO public.egresso_valido VALUES (223, NULL, '200711140031', 'RAFAEL DANTAS CARVALHO');
INSERT INTO public.egresso_valido VALUES (224, 'rafcavalheiro@gmail.com', '201211140030', 'RAFAEL DE SOUZA CAVALHEIRO');
INSERT INTO public.egresso_valido VALUES (225, 'desouza.timao@gmail.com', '201011140005', 'RAFAEL FERREIRA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (226, 'rafael.sousa@ifpa.edu.br', '200711140032', 'RAFAEL GOMES SOUSA');
INSERT INTO public.egresso_valido VALUES (227, 'raimundonorberto@yahoo.com.br', '200211140021', 'RAIMUNDO NORBERTO LAMEIRA JUNIOR');
INSERT INTO public.egresso_valido VALUES (228, 'razeved@yahoo.com.br', '200511140011', 'RAPHAEL DA SILVA AZEVEDO');
INSERT INTO public.egresso_valido VALUES (229, NULL, '200911140025', 'RAPHAEL ROGERIO MOUTA');
INSERT INTO public.egresso_valido VALUES (230, 'fa15698@yahoo.com.br', '200811140018', 'RAUL CESAR MONTEIRO DA SILVA');
INSERT INTO public.egresso_valido VALUES (231, 'renaneduardorodrigues@gmail.com', '201011140016', 'RENAN EDUARDO SOARES RODRIGUES');
INSERT INTO public.egresso_valido VALUES (232, NULL, '200511140032', 'RENATA RODRIGUES DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (233, 'ricardosarmanho@hotmail.com', '201411140007', 'RICARDO ANDERSON MUNIZ SARMANHO');
INSERT INTO public.egresso_valido VALUES (234, 'rafeio@bol.com.br', '200611140018', 'RICARDO ARAUJO FEIO');
INSERT INTO public.egresso_valido VALUES (235, NULL, '200411140007', 'RICARDO PAES ALMEIDA');
INSERT INTO public.egresso_valido VALUES (236, 'roberto.almeida@icen.ufpa.br', '201311140002', 'ROBERTO BARBOSA DE ALMEIDA JUNIOR');
INSERT INTO public.egresso_valido VALUES (237, 'rbxjunior@gmail.com', '201211140019', 'ROBERTO BRITO XAVIER JUNIOR');
INSERT INTO public.egresso_valido VALUES (238, 'bob.felix89@gmail.com', '201011140014', 'ROBERTO FELIX');
INSERT INTO public.egresso_valido VALUES (239, 'rsantsil@gmail.com', '201011140015', 'ROBSON DOS SANTOS SILVA');
INSERT INTO public.egresso_valido VALUES (240, 'rodrigobbrasil@gmail.com', '200711140002', 'RODRIGO BEZERRA BRASIL');
INSERT INTO public.egresso_valido VALUES (241, 'rodrigoviana@ufpa.br', '201011140030', 'RODRIGO DO CARMO VIANA');
INSERT INTO public.egresso_valido VALUES (242, 'rvidalth@yahoo.com.br', '200811140027', 'RODRIGO VIDAL MIRANDA');
INSERT INTO public.egresso_valido VALUES (243, 'rlimac@gmail.com', '200211140019', 'ROGERIO LIMA CARNEIRO');
INSERT INTO public.egresso_valido VALUES (244, 'rjsilva@ufpa.br', '200411140022', 'ROMAO SOUZA SILVA');
INSERT INTO public.egresso_valido VALUES (245, NULL, '200311140025', 'ROSANE DA SILVA SIQUEIRA');
INSERT INTO public.egresso_valido VALUES (246, 'zanraiol@gmail.com', '200211140026', 'ROSANGELA SOUSA RAIOL');
INSERT INTO public.egresso_valido VALUES (247, 'rfgomesjr@gmail.com', '200911140020', 'ROSIVALDO FONSECA GOMES JUNIOR');
INSERT INTO public.egresso_valido VALUES (248, NULL, '200811140032', 'ROUSEVELT RODRIGUES DE ALMEIDA');
INSERT INTO public.egresso_valido VALUES (249, NULL, '200211140018', 'RUMENIGG NOGUEIRA VIEIRA');
INSERT INTO public.egresso_valido VALUES (250, 'samwallflowergirl@gmail.com', '201511140002', 'SAMARA FERNANDES PIMENTEL');
INSERT INTO public.egresso_valido VALUES (251, 'ifpa.santana@gmail.com', '200911140014', 'SAMUEL LINHARES SANTANA');
INSERT INTO public.egresso_valido VALUES (252, NULL, '200711140006', 'SANDRO ALAN DE SOUZA MONTEIRO');
INSERT INTO public.egresso_valido VALUES (253, NULL, '200511140035', 'SEBASTIAO GILBERTO LOPES VAZ');
INSERT INTO public.egresso_valido VALUES (254, 'sergio_ewr17@hotmail.com', '201111140030', 'SERGIO EWERTON MACIEL RODES');
INSERT INTO public.egresso_valido VALUES (255, 'sbpaco@gmail.com', '200511140014', 'SILVIO BRUNO PAIVA COSTA');
INSERT INTO public.egresso_valido VALUES (256, 'simondelarocha@yahoo.com.br', '200511140004', 'SIMON AFONSO CORREA LOBATO');
INSERT INTO public.egresso_valido VALUES (257, NULL, '200711140007', 'SIVALDO DE OLIVEIRA BARBOSA');
INSERT INTO public.egresso_valido VALUES (258, 'talitatravassos.tt@gmail.com', '201411140025', 'TALITA DE CACIA SOUSA TRAVASSOS');
INSERT INTO public.egresso_valido VALUES (259, NULL, '200211140016', 'TAMARA CUNHA MENDES');
INSERT INTO public.egresso_valido VALUES (260, 'tatianejbm@yahoo.com.br', '200811140015', 'TATIANE BOTELHO BORGES');
INSERT INTO public.egresso_valido VALUES (261, 'thiagobm01@hotmail.com', '201611140002', 'THIAGO BENICIO MACEDO');
INSERT INTO public.egresso_valido VALUES (262, 'tsilva0891@gmail.com', '201211140010', 'THIAGO CORDEIRO COSTA DA SILVA');
INSERT INTO public.egresso_valido VALUES (263, NULL, '200211140001', 'THIAGO DA SILVA GILLA');
INSERT INTO public.egresso_valido VALUES (264, NULL, '200311140020', 'THIAGO DE LIMA ARAUJO');
INSERT INTO public.egresso_valido VALUES (265, 'thiagomatos99@hotmail.com', '200911140017', 'THIAGO DE MATOS BEZERRA');
INSERT INTO public.egresso_valido VALUES (266, NULL, '200711140023', 'THIAGO MODESTO DIAS');
INSERT INTO public.egresso_valido VALUES (267, 'ioritss@hotmail.com', '200711140034', 'THIAGO SALES SANTOS');
INSERT INTO public.egresso_valido VALUES (268, 'jvantero@gmail.com', '201011140012', 'TIAGO ANTERO DE SOUSA ALVES');
INSERT INTO public.egresso_valido VALUES (269, NULL, '200311140003', 'TIAGO PORTO SANTOS DO NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (270, 'VCPSINFO@YAHOO.COM.BR', '200311140017', 'VERONICA COSTA PANTOJA');
INSERT INTO public.egresso_valido VALUES (271, NULL, '200511140016', 'VICTOR GUSTAVO DE MELLO GONCALVES');
INSERT INTO public.egresso_valido VALUES (272, 'victorhugo543af@gmail.com', '201711140002', 'VICTOR HUGO AZEVEDO FERREIRA');
INSERT INTO public.egresso_valido VALUES (273, 'viniciusqquei@gmail.com', '201611140031', 'VINICIUS FAVACHO QUEIROZ');
INSERT INTO public.egresso_valido VALUES (274, 'vitor.cirilo3@gmail.com', '201011140003', 'VITOR CIRILO ARAUJO SANTOS');
INSERT INTO public.egresso_valido VALUES (275, 'vitor@ufpa.br', '200711140003', 'VITOR DE SOUZA CASTRO');
INSERT INTO public.egresso_valido VALUES (276, 'walbert.monteiro@ifpa.edu.br', '200511140021', 'WALBERT CUNHA MONTEIRO');
INSERT INTO public.egresso_valido VALUES (277, 'walbertsilva5@gmail.com', '201011140009', 'WALBERT EMANUEL DA SILVA NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (278, 'walderwolf.tm@gmail.com', '201111140038', 'WALDER LOBO MARQUES');
INSERT INTO public.egresso_valido VALUES (279, 'waleriamoura@gmail.com', '200511140028', 'WALERIA PAULA DA LUZ MOURA SOUZA');
INSERT INTO public.egresso_valido VALUES (280, NULL, '200311140034', 'WANDERSON AUGUSTO DE SOUZA PEREIRA');
INSERT INTO public.egresso_valido VALUES (281, NULL, '200311140007', 'WELLINGTON CARDOSO COSTA');
INSERT INTO public.egresso_valido VALUES (282, 'engwillsm@yahoo.com.br', '200811140003', 'WELLINGTON SOUZA MORAES');
INSERT INTO public.egresso_valido VALUES (283, 'wesleyandmelo@gmail.com', '200911140032', 'WESLEY ANDERSON OLIVEIRA DE MELO');
INSERT INTO public.egresso_valido VALUES (284, 'wesley.tadsi@yahoo.com.br', '201011140013', 'WESLEY DE OLIVEIRA BARBOSA');
INSERT INTO public.egresso_valido VALUES (285, NULL, '200511140029', 'WILLIAM CAPELA CARDOSO');
INSERT INTO public.egresso_valido VALUES (286, 'williamsawaki@gmail.com', '201011140006', 'WILLIAM SAWAKI DE MELO E SILVA');
INSERT INTO public.egresso_valido VALUES (287, NULL, '200411140033', 'WILLY CLEYBER ALMEIDA SILVA');
INSERT INTO public.egresso_valido VALUES (288, 'wilton.cns@gmail.com', '200511140037', 'WILTON CESAR NASCIMENTO DA SILVA');
INSERT INTO public.egresso_valido VALUES (289, NULL, '200311140018', 'YASMIN VIEIRA DE MELO KOURY');
INSERT INTO public.egresso_valido VALUES (290, 'yurimelo89@gmail.com', '201611140027', 'YURI MELO E SILVA DO ESPIRITO SANTO');
INSERT INTO public.egresso_valido VALUES (291, 'abelbruno@hotmail.com', '200804940012', 'ABEL BRUNO NASCIMENTO SILVA');
INSERT INTO public.egresso_valido VALUES (292, NULL, '199904940002', 'ABNATAL PEREIRA CORDOVIL JUNIOR');
INSERT INTO public.egresso_valido VALUES (293, 'abner.cardo@gmail.com', '201604940029', 'ABNER CARDOSO DA SILVA');
INSERT INTO public.egresso_valido VALUES (294, 'abnergillet16@gmail.com', '201304940017', 'ABNER GILLET FARIAS');
INSERT INTO public.egresso_valido VALUES (295, NULL, '199504940031', 'ABRAHAM LINCOLN RABELO DE SOUSA');
INSERT INTO public.egresso_valido VALUES (296, 'acza.silva@icen.ufpa.br', '201704940024', 'ACZA LIRA SILVA');
INSERT INTO public.egresso_valido VALUES (297, 'adailton@ufpa.br', '200204940003', 'ADAILTON MAGALHAES LIMA');
INSERT INTO public.egresso_valido VALUES (298, NULL, '200304940019', 'ADEILSON NAZARENO ARAUJO PINHEIRO');
INSERT INTO public.egresso_valido VALUES (299, NULL, '199104940049', 'ADELMO FREIRES GOMES');
INSERT INTO public.egresso_valido VALUES (300, 'adcorecha@gmail.com', '200904940039', 'ADENILTON CORECHA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (301, NULL, '199104940090', 'ADERBAL MOURA SANTOS');
INSERT INTO public.egresso_valido VALUES (302, NULL, '200104940034', 'ADEVALDO QUEIROZ DA SILVA');
INSERT INTO public.egresso_valido VALUES (303, 'adieltab16@gmail.com', '201504940002', 'ADIEL DOS SANTOS NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (304, 'adilson.sousa@icen.ufpa.br', '200904940009', 'ADILSON FRANCISCO FERREIRA SOUSA');
INSERT INTO public.egresso_valido VALUES (305, NULL, '199304940001', 'ADRIANA LEITE DE ALCANTARA');
INSERT INTO public.egresso_valido VALUES (306, NULL, '199904940016', 'ADRIANA NUNES TELES');
INSERT INTO public.egresso_valido VALUES (307, 'ribeiroadrianno@ig.com.br', '200204940036', 'ADRIANO DE AGUIAR RIBEIRO');
INSERT INTO public.egresso_valido VALUES (308, NULL, '200004940020', 'ADRIANO DE OLIVEIRA MARTINS');
INSERT INTO public.egresso_valido VALUES (309, NULL, '199404940002', 'ADRIANO LUIZ PINTO SOBRAL');
INSERT INTO public.egresso_valido VALUES (310, 'adriano.sbarreto@hotmail.com', '201304940025', 'ADRIANO SILVA BARRETO');
INSERT INTO public.egresso_valido VALUES (311, 'aianshay@gmail.com', '201704940041', 'AIAN SHAY BENTES DAMASCENO CARDOSO');
INSERT INTO public.egresso_valido VALUES (312, NULL, '200004940046', 'AILTO LORASCHI');
INSERT INTO public.egresso_valido VALUES (313, 'airton@ufpa.br', '200604940031', 'AIRTON NOBUMASA ISHIMORI');
INSERT INTO public.egresso_valido VALUES (314, 'aveloso@ufpa.br', '201504940009', 'ALAN TONY SOUZA VELOSO');
INSERT INTO public.egresso_valido VALUES (315, 'aclsobrinho@gmail.com', '201704940019', 'ALBERTO DA CRUZ LIMA SOBRINHO');
INSERT INTO public.egresso_valido VALUES (316, NULL, '199104940107', 'ALBERTO SHINTA KURODA');
INSERT INTO public.egresso_valido VALUES (317, 'almeida.alcyr@gmail.com', '201204940025', 'ALCYR DA COSTA ALMEIDA JUNIOR');
INSERT INTO public.egresso_valido VALUES (318, NULL, '199104940108', 'ALEKSANDRA DO SOCORRO DA SILVA');
INSERT INTO public.egresso_valido VALUES (319, NULL, '200404940026', 'ALESSANDRA CAROLINE DOS SANTOS NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (320, NULL, '200104940011', 'ALESSANDRA DA SILVA GOMES');
INSERT INTO public.egresso_valido VALUES (321, NULL, '199104940050', 'ALESSANDRA FONTEL POMPEU');
INSERT INTO public.egresso_valido VALUES (322, 'alessandra.araujo@icen.ufpa.br', '201204940027', 'ALESSANDRA PANTOJA DE ARAUJO');
INSERT INTO public.egresso_valido VALUES (323, 'alessandrapriscila.alves@gmail.com', '201004940012', 'ALESSANDRA PRISCILA ALVES DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (324, NULL, '199304940002', 'ALETEIA PATRICIA FAVACHO DE ARAUJO');
INSERT INTO public.egresso_valido VALUES (325, NULL, '200004940013', 'ALEXANDER RICHARD VINSON');
INSERT INTO public.egresso_valido VALUES (326, 'alexandre.freytas@gmail.com', '201104940039', 'ALEXANDRE ABREU DE FREITAS');
INSERT INTO public.egresso_valido VALUES (327, NULL, '199504940001', 'ALEXANDRE ALVAREZ MARTINI SANTOS');
INSERT INTO public.egresso_valido VALUES (328, NULL, '199304940004', 'ALEXANDRE CARLOS BEZERRA MACEDO');
INSERT INTO public.egresso_valido VALUES (329, NULL, '199204940001', 'ALEXANDRE MELO BRAGA');
INSERT INTO public.egresso_valido VALUES (330, 'alexandre.monassa@gmail.com', '200504940011', 'ALEXANDRE MONASSA MOREIRA');
INSERT INTO public.egresso_valido VALUES (331, 'gomes.bcc@gmail.com', '201004940020', 'ALEXANDRE RODRIGUES GOMES');
INSERT INTO public.egresso_valido VALUES (332, NULL, '200004940016', 'ALEX YUICHI YOKOKURA');
INSERT INTO public.egresso_valido VALUES (333, 'jrcdz01@gmail.com', '201104940033', 'ALFREDO LIMA DA COSTA JUNIOR');
INSERT INTO public.egresso_valido VALUES (334, NULL, '199704940017', 'ALINE CLAIREFONT TAVARES MELO');
INSERT INTO public.egresso_valido VALUES (335, NULL, '200304940005', 'ALINE DE OLIVEIRA SILVA');
INSERT INTO public.egresso_valido VALUES (336, 'apssig@ig.com.br', '200204940047', 'ALINE PATRICIA DA SILVA PIMENTEL');
INSERT INTO public.egresso_valido VALUES (337, NULL, '199404940045', 'ALINE REGINA DE OLIVEIRA MIRANDA');
INSERT INTO public.egresso_valido VALUES (338, 'alisonricss@yahoo.com.br', '200304940003', 'ALISON RICARDO SANTOS DA SILVA');
INSERT INTO public.egresso_valido VALUES (339, 'allinelemos@gmail.com', '200204940007', 'ALLINE DE MELO LEMOS');
INSERT INTO public.egresso_valido VALUES (340, 'alline_peixoto@yahoo.com.br', '200104940049', 'ALLINE DE OLIVEIRA PEIXOTO');
INSERT INTO public.egresso_valido VALUES (341, 'allisknarf@gmail.com', '200904940031', 'ALLISFRANK DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (342, 'aluizio.ramos.adv@gmail.com', '201004940028', 'ALUIZIO RAMOS PEREIRA NETO');
INSERT INTO public.egresso_valido VALUES (343, NULL, '200204940060', 'AMANDA NOBRE COSTA');
INSERT INTO public.egresso_valido VALUES (344, 'acms@ufpa.br', '199104940001', 'ANA CARLA MACEDO DA SILVA');
INSERT INTO public.egresso_valido VALUES (345, 'carolufpa@gmail.com', '200204940055', 'ANA CAROLINA DE ARAUJO BARBOSA');
INSERT INTO public.egresso_valido VALUES (346, 'idabiap@yahoo.com.br', '200204940046', 'ANA IDALINA TENORIO PIEDADE');
INSERT INTO public.egresso_valido VALUES (347, 'aisabelamr@gmail.com', '201404940021', 'ANA ISABELA MANITO RAMOS');
INSERT INTO public.egresso_valido VALUES (348, NULL, '199204940044', 'ANA KARLA MIRANDA DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (349, 'av503vitoria@gmail.com', '201704940008', 'ANA VITORIA DE BACELAR MACHADO E SILVA');
INSERT INTO public.egresso_valido VALUES (350, NULL, '199804940029', 'ANDERSON BAIA MAIA');
INSERT INTO public.egresso_valido VALUES (351, NULL, '200504940036', 'ANDERSON DE OLIVEIRA BANDEIRA');
INSERT INTO public.egresso_valido VALUES (352, 'anderson.fn88@gmail.com', '200904940015', 'ANDERSON FURTADO DE NAZARE');
INSERT INTO public.egresso_valido VALUES (353, NULL, '199704940007', 'ANDERSON JONES SILVA DE JESUS');
INSERT INTO public.egresso_valido VALUES (354, 'andersonjsc@gmail.com', '200204940052', 'ANDERSON JORGE SERRA DA COSTA');
INSERT INTO public.egresso_valido VALUES (355, 'andersonoanjo18@gmail.com', '200904940016', 'ANDERSON MARQUES MORAIS');
INSERT INTO public.egresso_valido VALUES (356, 'arr@ufpa.br', '199504940002', 'ANDERSON RAIOL RODRIGUES');
INSERT INTO public.egresso_valido VALUES (357, 'agoes@ufpa.br', '200304940016', 'ANDERSON SILVA DE OLIVEIRA GÓES');
INSERT INTO public.egresso_valido VALUES (358, 'andre.cbcc@gmail.com', '200804940001', 'ANDRE LUIS MACHADO DE VASCONCELOS');
INSERT INTO public.egresso_valido VALUES (359, 'andrebahia.cbcc@gmail.com', '200804940022', 'ANDRE MIGUEL PENA BAHIA');
INSERT INTO public.egresso_valido VALUES (360, 'andremirandap93@gmail.com', '201604940032', 'ANDRE MIRANDA PINHEIRO');
INSERT INTO public.egresso_valido VALUES (361, NULL, '199504940032', 'ANDRE RICARDO FARIA GOMES');
INSERT INTO public.egresso_valido VALUES (362, 'andreymacedo06@hotmail.com', '200904940014', 'ANDREY DE MACEDO SOUSA');
INSERT INTO public.egresso_valido VALUES (363, NULL, '199104940052', 'ANE MARGARETH MONTE VERDE SILVA');
INSERT INTO public.egresso_valido VALUES (364, NULL, '199104940053', 'ANETE HIROMI HASHIMOTO');
INSERT INTO public.egresso_valido VALUES (365, NULL, '199304940006', 'ANGELA CRISTINA SOUZA DE AQUINO');
INSERT INTO public.egresso_valido VALUES (366, 'angelaamador@ufpa.br', '201104940028', 'ANGELA MARIA TRINDADE AMADOR');
INSERT INTO public.egresso_valido VALUES (367, '3390955@gmail.com', '200104940031', 'ANGELO DE BARROS BRAGA');
INSERT INTO public.egresso_valido VALUES (368, 'angeloluizz@gmail.com', '201004940045', 'ANGELO LUIZ DA CRUZ OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (369, 'aandrecunhas@gmail.com', '201004940031', 'ANTONIO ANDRE CUNHA DA SILVA');
INSERT INTO public.egresso_valido VALUES (370, NULL, '199604940015', 'ANTONIO FABIO RODRIGUES DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (371, 'antonio.almeida.negocios@gamial.com', '199104940110', 'ANTONIO JOSE CASTRO DE ALMEIDA JUNIOR');
INSERT INTO public.egresso_valido VALUES (372, 'amsouzapa2@gmail.com', '200204940048', 'ANTONIO MARCOS FERREIRA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (373, NULL, '199904940023', 'ANTONIO SOARES LOBATO');
INSERT INTO public.egresso_valido VALUES (374, 'aeng.garcia@gmail.com', '201204940030', 'ARIANE ELIZABETH NUNES GARCIA');
INSERT INTO public.egresso_valido VALUES (375, NULL, '199604940006', 'AROLDO CRISTIANO GUERREIRO LEAL');
INSERT INTO public.egresso_valido VALUES (376, 'ivson.ma@gmail.com', '201204940014', 'ARTHUR IVSON XAVIER DE MORAES BATISTA');
INSERT INTO public.egresso_valido VALUES (377, 'arthur_masahiro@hotmail.com', '201104940003', 'ARTHUR MASAHIRO YOSHINO');
INSERT INTO public.egresso_valido VALUES (378, 'arthur.yoshikawa@icen.ufpa.br', '201704940039', 'ARTHUR TAKESHI NORONHA YOSHIKAWA');
INSERT INTO public.egresso_valido VALUES (379, 'aruandasimoes@gmail.com', '199404940005', 'ARUANDA SIMOES GONCALVES  MEIGUINS');
INSERT INTO public.egresso_valido VALUES (380, 'augusto.f.cravo@gmail.com', '201404940003', 'AUGUSTO FARIAS CRAVO');
INSERT INTO public.egresso_valido VALUES (381, NULL, '199104940111', 'BARBARA CONCEICAO DE OLIVEIRA BARBOSA');
INSERT INTO public.egresso_valido VALUES (382, NULL, '200304940021', 'BERNARDO LOBATO DOS SANTOS NETO');
INSERT INTO public.egresso_valido VALUES (383, 'haquiticos@gmail.com', '200204940054', 'BILLY ANDERSON PINHEIRO');
INSERT INTO public.egresso_valido VALUES (384, 'blenofvale@gmail.com', '201204940035', 'BLENO WILSON FRANKLIN VALE DA SILVA');
INSERT INTO public.egresso_valido VALUES (385, 'brenofranca@yahoo.com.br', '200204940005', 'BRENO BERNARD NICOLAU DE FRANCA');
INSERT INTO public.egresso_valido VALUES (386, NULL, '200004940043', 'BRENO CRISTOVAO RODRIGUES PINTO');
INSERT INTO public.egresso_valido VALUES (387, 'brunelli.miranda@gmail.com', '201104940015', 'BRUNELLI PINTO MIRANDA');
INSERT INTO public.egresso_valido VALUES (388, 'murakami.bruno@gmail.com', '201204940005', 'BRUNO AKIRA FUKUSHIMA MURAKAMI');
INSERT INTO public.egresso_valido VALUES (389, NULL, '199504940004', 'BRUNO BITAR MORHY');
INSERT INTO public.egresso_valido VALUES (390, NULL, '200104940029', 'BRUNO DA COSTA BARROSO');
INSERT INTO public.egresso_valido VALUES (391, 'bnmonteiro2@gmail.com', '200704940029', 'BRUNO DO NASCIMENTO MONTEIRO');
INSERT INTO public.egresso_valido VALUES (392, 'caiomfrodrigues@gmail.com', '201204940010', 'CAIO MARCOS FLEXA RODRIGUES');
INSERT INTO public.egresso_valido VALUES (393, 'caiocarvalho1996@hotmail.com', '201304940006', 'CAIO PINHEIRO DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (394, 'xcaiosr@gmail.com', '201604940020', 'CAIO SHIMADA RABELLO');
INSERT INTO public.egresso_valido VALUES (395, NULL, '199104940048', 'CALADO PEREIRA FIJAMO');
INSERT INTO public.egresso_valido VALUES (396, NULL, '200004940039', 'CAMILA MARINHO ALMEIDA');
INSERT INTO public.egresso_valido VALUES (397, NULL, '199104940054', 'CARLA ALESSANDRA GOMES DE LIMA');
INSERT INTO public.egresso_valido VALUES (398, 'alrac.cruz@gmail.com', '200804940032', 'CARLA CRISTINA DA CRUZ ARAUJO');
INSERT INTO public.egresso_valido VALUES (399, NULL, '199904940035', 'CARLA MARINA COSTA PAXIUBA');
INSERT INTO public.egresso_valido VALUES (400, NULL, '199104940112', 'CARLOS ALBERTO LEITE MENDES');
INSERT INTO public.egresso_valido VALUES (401, NULL, '199904940060', 'CARLOS ALEXANDRE LOURINHO GOMES');
INSERT INTO public.egresso_valido VALUES (402, NULL, '200004940058', 'CARLOS ANDRE NEVES DO VALE');
INSERT INTO public.egresso_valido VALUES (403, 'carlos.damasceno@icen.ufpa.br', '200804940017', 'CARLOS DIEGO NASCIMENTO DAMASCENO');
INSERT INTO public.egresso_valido VALUES (404, NULL, '200104940017', 'CARLOS EDUARDO COSTEIRA CALDAS');
INSERT INTO public.egresso_valido VALUES (405, 'kadu-marinho@hotmail.com', '200804940014', 'CARLOS EDUARDO MARINHO GOMES');
INSERT INTO public.egresso_valido VALUES (406, NULL, '199304940007', 'CARLOS EDUARDO RIBEIRO BASTOS');
INSERT INTO public.egresso_valido VALUES (407, 'gustavoresqueufpa@gmail.com', '201004940024', 'CARLOS GUSTAVO RESQUE DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (408, 'carlos.h.cardoso140@gmail.com', '201604940014', 'CARLOS HENRIQUE RIBEIRO CARDOSO');
INSERT INTO public.egresso_valido VALUES (409, NULL, '199604940034', 'CARLOS MARCIO JORGE SARAIVA');
INSERT INTO public.egresso_valido VALUES (410, NULL, '199104940004', 'CARLOS RENATO LISBOA FRANCES');
INSERT INTO public.egresso_valido VALUES (411, NULL, '200004940026', 'CASSIO ALEXANDRE TEIXEIRA MENEZES');
INSERT INTO public.egresso_valido VALUES (412, NULL, '199804940001', 'CIDIANE ARACATY LOBATO');
INSERT INTO public.egresso_valido VALUES (413, NULL, '200104940023', 'CINTIA KELLI CABRAL RODRIGUES');
INSERT INTO public.egresso_valido VALUES (414, NULL, '199104940005', 'CIRNEY RICARDO J B CARNEIRO');
INSERT INTO public.egresso_valido VALUES (415, 'claricemoraesf@gmail.com', '200904940035', 'CLARICE MORAES FERREIRA');
INSERT INTO public.egresso_valido VALUES (416, NULL, '199104940114', 'CLARK DA CUNHA SA');
INSERT INTO public.egresso_valido VALUES (417, NULL, '199904940031', 'CLAUDIA MYLENE DA SILVA PINHEIRO');
INSERT INTO public.egresso_valido VALUES (418, NULL, '199904940057', 'CLAUDIO ANTONIO DA SILVA CAVALCANTI');
INSERT INTO public.egresso_valido VALUES (419, 'diegodisouzza@gmail.com', '201004940007', 'CLAUDIO DIEGO TEIXEIRA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (420, NULL, '199704940025', 'CLAUDIO KENJI KAWAMURA DA SILVA');
INSERT INTO public.egresso_valido VALUES (421, NULL, '199604940018', 'CLEBER ROBERTO PAES DA ROCHA');
INSERT INTO public.egresso_valido VALUES (422, 'cmguerreiro2@gmail.com', '200204940032', 'CLEBERSON MALCHER GUERREIRO');
INSERT INTO public.egresso_valido VALUES (423, NULL, '199104940008', 'CLEIDSON RONALD BOTELHO DE SOUZA');
INSERT INTO public.egresso_valido VALUES (424, 'cleidyr.system@gmail.com', '201004940049', 'CLEIDYR DA SILVA LIMA');
INSERT INTO public.egresso_valido VALUES (425, NULL, '200304940018', 'CLODOALDO ESTUMANO DA SILVA');
INSERT INTO public.egresso_valido VALUES (426, NULL, '199104940105', 'CLOVIS DA PAZ TAVARES JUNIOR');
INSERT INTO public.egresso_valido VALUES (427, NULL, '200104940019', 'CRISTIANE DO SOCORRO PIRES ALMEIDA');
INSERT INTO public.egresso_valido VALUES (428, NULL, '200104940024', 'CRISTIANE MARQUES DA SILVA');
INSERT INTO public.egresso_valido VALUES (429, NULL, '200304940007', 'CRYS SAYURI GOTO');
INSERT INTO public.egresso_valido VALUES (430, NULL, '199104940009', 'CYNTHIA MARA FONSECA DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (431, 'donk14@gmail.com', '200904940022', 'DANIELA KARINE MARAVALHO AVELAR');
INSERT INTO public.egresso_valido VALUES (432, NULL, '199104940093', 'DANIELA NAZARE MAIA DA CONCEICAO');
INSERT INTO public.egresso_valido VALUES (433, 'djtavaresieq@gmail.com', '200704940023', 'DANIEL DE JESUS TAVARES');
INSERT INTO public.egresso_valido VALUES (434, 'danieldiascv@gmail.com', '200304940035', 'DANIEL DIAS DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (435, 'daniqueiroz.bt@gmail.com', '200504940034', 'DANIELE MOURA DE QUEIROZ');
INSERT INTO public.egresso_valido VALUES (436, NULL, '200104940001', 'DANIEL HENRIQUES MOREIRA');
INSERT INTO public.egresso_valido VALUES (437, 'danicostas@yahoo.com.br', '200304940029', 'DANIELLE DA SILVA COSTA NUNES');
INSERT INTO public.egresso_valido VALUES (438, NULL, '200204940053', 'DANIELLE DE MICHELI PALHANO PINTO');
INSERT INTO public.egresso_valido VALUES (439, NULL, '200004940025', 'DANIELLE FURTADO DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (440, NULL, '199904940010', 'DANIEL LIMA BRASIL');
INSERT INTO public.egresso_valido VALUES (441, 'daniellcavalcanti@bol.com.br', '201204940018', 'DANIELL SOARES CAVALCANTI VIEIRA');
INSERT INTO public.egresso_valido VALUES (442, 'dosdasilva@hotmail.com', '199204940004', 'DANIEL ORLANDO SERPA DA SILVA');
INSERT INTO public.egresso_valido VALUES (443, NULL, '199504940005', 'DANIEL SANTOS RODRIGUES');
INSERT INTO public.egresso_valido VALUES (444, 'cabraldanilo@yahoo.com.br', '200104940046', 'DANILO DO CARMO QUADROS CABRAL');
INSERT INTO public.egresso_valido VALUES (445, 'danjsteixeira@gmail.com', '201204940020', 'DAN JHONATAN DA SILVA TEIXEIRA');
INSERT INTO public.egresso_valido VALUES (446, NULL, '199104940056', 'DARLENE DOS REIS SOARES GONCALVES');
INSERT INTO public.egresso_valido VALUES (447, NULL, '199504940006', 'DAUCIKELEM BRAGA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (448, NULL, '200404940017', 'DAVID LEONARDO MIRANDA BENTOLILA');
INSERT INTO public.egresso_valido VALUES (449, NULL, '200004940057', 'DAVID SAMUEL BELICHA ISRAEL');
INSERT INTO public.egresso_valido VALUES (450, NULL, '199604940031', 'DAVI MITSUO DA SILVA SHIBAYAMA');
INSERT INTO public.egresso_valido VALUES (451, 'davisonph@ufpa.br', '200704940024', 'DAVISON HOLANDA PACHECO');
INSERT INTO public.egresso_valido VALUES (452, NULL, '200204940061', 'DEDIER GOMES MERCES LIMA');
INSERT INTO public.egresso_valido VALUES (453, 'detilufpa@yahoo.com.br', '200304940034', 'DEIVID TINOCO LEMOS');
INSERT INTO public.egresso_valido VALUES (454, NULL, '199204940006', 'DELCIO NONATO ARAUJO DA SILVA');
INSERT INTO public.egresso_valido VALUES (455, NULL, '199904940042', 'DELIANE DE JESUS ALVES DE ANDRADE');
INSERT INTO public.egresso_valido VALUES (456, NULL, '199804940019', 'DENIS TAVARES SILVA');
INSERT INTO public.egresso_valido VALUES (457, 'derickedu@gmail.com', '201004940001', 'DERICK EDUARDO DIAS ROSA');
INSERT INTO public.egresso_valido VALUES (458, NULL, '200004940032', 'DEUZINEI PINHEIRO MIRANDA');
INSERT INTO public.egresso_valido VALUES (459, NULL, '200104940021', 'DIEGO JOSE CUNHA QUEIROZ');
INSERT INTO public.egresso_valido VALUES (460, 'diegooabreu@gmail.com', '201204940013', 'DIEGO OLIVEIRA ABREU');
INSERT INTO public.egresso_valido VALUES (461, NULL, '199104940010', 'DILMA FARIAS VIANA');
INSERT INTO public.egresso_valido VALUES (462, NULL, '199504940007', 'DOGEVAL AUGUSTO SACHETT');
INSERT INTO public.egresso_valido VALUES (463, 'ddamalio@yahoo.com.br', '200304940032', 'DOUGLAS BRITO DAMALIO');
INSERT INTO public.egresso_valido VALUES (464, NULL, '200204940069', 'DOUGLAS CARDOSO PINHEIRO');
INSERT INTO public.egresso_valido VALUES (465, NULL, '199604940014', 'DURVAL CASTRO DE BASTOS JUNIOR');
INSERT INTO public.egresso_valido VALUES (466, 'ponto_flutuante@yahoo.com.br', '200304940012', 'EDER CRUZ BARBOSA');
INSERT INTO public.egresso_valido VALUES (467, NULL, '200504940038', 'EDER TAVEIRA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (468, NULL, '200204940043', 'EDGAR ALMEIDA MANESCHY');
INSERT INTO public.egresso_valido VALUES (469, NULL, '199604940025', 'EDGARD ASSUNCAO ARAUJO');
INSERT INTO public.egresso_valido VALUES (470, NULL, '199204940007', 'EDILA MARTA MIRANDA LOBO');
INSERT INTO public.egresso_valido VALUES (471, NULL, '199104940095', 'EDMAR LUIZ DA COSTA BENTES');
INSERT INTO public.egresso_valido VALUES (472, 'ale-remo@hotmail.com', '201404940001', 'EDSON ALESSANDRO FAGUNDES COSTA');
INSERT INTO public.egresso_valido VALUES (473, 'ecdias@ufpa.br', '200304940015', 'EDSON COSTA DIAS');
INSERT INTO public.egresso_valido VALUES (474, NULL, '199404940006', 'EDSON EUSTACHIO OLIVEIRA DE AZEVEDO');
INSERT INTO public.egresso_valido VALUES (475, NULL, '199304940009', 'EDSON PRESTES E SILVA JUNIOR');
INSERT INTO public.egresso_valido VALUES (476, NULL, '199204940008', 'EDSON SILVA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (477, 'duducostacarvalho@gmail.com', '200704940030', 'EDUARDO COSTA DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (478, NULL, '199704940014', 'EDUARDO DE CARVALHO LEITE');
INSERT INTO public.egresso_valido VALUES (479, NULL, '199804940003', 'EDUARDO LEAL GUERRA');
INSERT INTO public.egresso_valido VALUES (480, NULL, '199204940009', 'EDVIRGES MARIA DA SILVA NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (481, 'ekcy00@gmail.com', '201104940006', 'EHILTON KAZUO CHIBA YOSHIDOME');
INSERT INTO public.egresso_valido VALUES (482, NULL, '199204940010', 'ELAINE DO SOCORRO FURRIEL AMANAJAS');
INSERT INTO public.egresso_valido VALUES (483, 'elderferreirass@gmail.com', '201004940006', 'ELDER DE JESUS FERREIRA DA SILVA');
INSERT INTO public.egresso_valido VALUES (484, NULL, '200004940055', 'ELENILTON ALEX SANTOS DA COSTA');
INSERT INTO public.egresso_valido VALUES (485, 'eliassm.ufpa@gmail.com', '201304940023', 'ELIAS SENA MORAES');
INSERT INTO public.egresso_valido VALUES (486, NULL, '199104940057', 'ELINETE NUNES FREITAS');
INSERT INTO public.egresso_valido VALUES (487, 'eaguiar@ufpa.br', '199504940009', 'ELISANGELA SANTANA AGUIAR');
INSERT INTO public.egresso_valido VALUES (488, NULL, '200304940033', 'ELIZEL PINHEIRO LEAL');
INSERT INTO public.egresso_valido VALUES (489, 'elltonsalesbarros@gmail.com', '201004940026', 'ELLTON SALES BARROS');
INSERT INTO public.egresso_valido VALUES (490, 'elton.private@gmail.com', '200704940032', 'ELTON JHON DIAS GONCALVES');
INSERT INTO public.egresso_valido VALUES (491, 'eltonpeniche14@gmail.com', '201504940035', 'ELTON PENICHE QUARESMA');
INSERT INTO public.egresso_valido VALUES (492, 'emanuel.estumano@gmail.com', '200104940042', 'EMANUEL ESTUMANO SANTOS');
INSERT INTO public.egresso_valido VALUES (493, NULL, '200304940017', 'EMANUEL NUNES REIS');
INSERT INTO public.egresso_valido VALUES (494, NULL, '199104940058', 'EMERSON JOSE SILVEIRA DA COSTA');
INSERT INTO public.egresso_valido VALUES (495, NULL, '199204940011', 'EMILIO JUN NAGAHAMA');
INSERT INTO public.egresso_valido VALUES (496, 'eric.cbcc@gmail.com', '201104940012', 'ERIC FELIPE DE OLIVEIRA PEREIRA');
INSERT INTO public.egresso_valido VALUES (497, 'erlon.fpinheiro@gmail.com', '201604940045', 'ERLON FONSECA PINHEIRO');
INSERT INTO public.egresso_valido VALUES (498, 'ernani@ufpa.br', '200204940006', 'ERNANI DE OLIVEIRA SALES');
INSERT INTO public.egresso_valido VALUES (499, 'esther.cardoso.silva@gmail.com', '201404940009', 'ESTHER CARDOSO DA SILVA');
INSERT INTO public.egresso_valido VALUES (500, NULL, '199104940115', 'EURICO OLIVEIRA DA ROCHA');
INSERT INTO public.egresso_valido VALUES (501, NULL, '200404940008', 'EVANDRO KOUJI DA SILVA TORII');
INSERT INTO public.egresso_valido VALUES (502, NULL, '199904940050', 'EVERTON MEIRELES COSTA');
INSERT INTO public.egresso_valido VALUES (503, 'ewelton.yoshio@gmail.com', '200504940019', 'EWELTON YOSHIO CHIBA YOSHIDOME');
INSERT INTO public.egresso_valido VALUES (504, NULL, '200504940004', 'EWERTON ALMEIDA SILVA');
INSERT INTO public.egresso_valido VALUES (505, NULL, '199304940010', 'EWERTON DA COSTA VAZ');
INSERT INTO public.egresso_valido VALUES (506, NULL, '199404940009', 'EWERTON DAVID MARTINS LEITE');
INSERT INTO public.egresso_valido VALUES (507, NULL, '199304940011', 'EZEQUIAS CARLOS FERREIRA DA SILVA');
INSERT INTO public.egresso_valido VALUES (508, 'fabil.goes@gmail.com', '200904940024', 'FABIANA RODRIGUES DE GÓES');
INSERT INTO public.egresso_valido VALUES (509, 'fa.vasconc@gmail.com', '201504940030', 'FABIO ALEX MENDES CAMPOS VASCONCELOS');
INSERT INTO public.egresso_valido VALUES (510, NULL, '199304940012', 'FABIO AUGUSTO DAS DORES SILVA');
INSERT INTO public.egresso_valido VALUES (511, NULL, '200004940001', 'FABIO AUGUSTO GUIMARAES TEIXEIRA');
INSERT INTO public.egresso_valido VALUES (512, 'fbragas@ufpa.br', '200304940026', 'FABIO BRAGA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (513, NULL, '199104940012', 'FABIO CARVALHO DA COSTA');
INSERT INTO public.egresso_valido VALUES (514, NULL, '199604940009', 'FABIO DE LIMA BEZERRA');
INSERT INTO public.egresso_valido VALUES (515, NULL, '199704940005', 'FABIO DE OLIVEIRA FERREIRA');
INSERT INTO public.egresso_valido VALUES (516, 'fabiosouza21777@gmail.com', '201704940029', 'FABIO DE SOUZA MIRANDA');
INSERT INTO public.egresso_valido VALUES (517, NULL, '199304940013', 'FABIOLA PANTOJA OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (518, 'miranda.fmm@gmail.com', '201104940008', 'FABIO MALCHER MIRANDA');
INSERT INTO public.egresso_valido VALUES (519, NULL, '199904940030', 'FABIO MENDES MONTEIRO');
INSERT INTO public.egresso_valido VALUES (520, 'fabiosizo@yahoo.com.br', '200304940027', 'FABIO REIS SIZO NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (521, 'nagahama@yahoo.com', '199704940012', 'FABIO YU NAGAHAMA');
INSERT INTO public.egresso_valido VALUES (522, NULL, '199504940011', 'FABRICIO JOSE UCHOA CORREA');
INSERT INTO public.egresso_valido VALUES (523, NULL, '199804940011', 'FABRICIO SILVA DE MAGALHAES');
INSERT INTO public.egresso_valido VALUES (524, 'fagnerleal@ufpa.br', '200904940002', 'FAGNER LEAL PANTOJA');
INSERT INTO public.egresso_valido VALUES (525, 'sem.ideias.na.hora@gmail.com', '201704940017', 'FELIPE DE MELO RODRIGUES E OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (526, 'felipe.quevici@gmail.com', '201304940003', 'FELIPE ELIASQUEVICI');
INSERT INTO public.egresso_valido VALUES (527, 'shinakuma3000@hotmail.com', '201604940033', 'FELIPE GUSMAO ARAUJO');
INSERT INTO public.egresso_valido VALUES (528, 'felipe.leite3@gmail.com', '200804940010', 'FELIPE LEITE DA SILVA');
INSERT INTO public.egresso_valido VALUES (529, NULL, '199104940059', 'FERNANDO CESAR SILVA DE MENEZES');
INSERT INTO public.egresso_valido VALUES (530, NULL, '199604940012', 'FERNANDO MENEZES MATOS');
INSERT INTO public.egresso_valido VALUES (531, 'fernando.vilanova@gmail.com', '200104940058', 'FERNANDO SILVA VILA NOVA');
INSERT INTO public.egresso_valido VALUES (532, 'filipecoelho@ufpa.br', '201304940029', 'FILIPE DAMASCENO COELHO');
INSERT INTO public.egresso_valido VALUES (533, NULL, '200204940051', 'FLAVIA COELHO PINHEIRO');
INSERT INTO public.egresso_valido VALUES (534, 'flavio.dias@yahoo.com.br', '200504940003', 'FLAVIO DIAS DE ASSUNCAO');
INSERT INTO public.egresso_valido VALUES (535, NULL, '199204940012', 'FLAVIO JOSE FERRO BARROS');
INSERT INTO public.egresso_valido VALUES (536, 'francisco_nascimento@outlook.com.br', '201304940028', 'FRANCISCO CARRERA NASCIMENTO JUNIOR');
INSERT INTO public.egresso_valido VALUES (537, NULL, '199904940033', 'FRANCISCO CESAR DE JESUS SILVA');
INSERT INTO public.egresso_valido VALUES (538, NULL, '199504940012', 'FRANCISCO COSTA COELHO JUNIOR');
INSERT INTO public.egresso_valido VALUES (539, 'junior.demarimm@gmail.com', '201004940027', 'FRANCISCO DEMARIM DE AGUIAR JUNIOR');
INSERT INTO public.egresso_valido VALUES (540, 'wertherjr@gmail.com', '200704940025', 'FRANCISCO WERTHER SILVA DE SANTANA JUNIOR');
INSERT INTO public.egresso_valido VALUES (541, NULL, '199804940028', 'FRANCIS JAMES VIANA RIBEIRO');
INSERT INTO public.egresso_valido VALUES (542, NULL, '200104940008', 'FRANK DA SILVA MALCHER');
INSERT INTO public.egresso_valido VALUES (543, NULL, '200204940027', 'FRANKLIM HARRISON MOREIRA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (544, NULL, '199904940020', 'FREDERICO NOBRE REIS');
INSERT INTO public.egresso_valido VALUES (545, 'andrade.f.gabriela@gmail.com', '200304940011', 'GABRIELA FONSECA ANDRADE');
INSERT INTO public.egresso_valido VALUES (546, NULL, '199104940060', 'GABRIELA NUNES CAMPOS');
INSERT INTO public.egresso_valido VALUES (547, 'gab.abreu23@gmail.com', '201404940017', 'GABRIEL BELTRAO DE ABREU');
INSERT INTO public.egresso_valido VALUES (548, 'gabrielescudeiro1@gmail.com', '201304940019', 'GABRIEL DE MAGALHAES ESCUDEIRO');
INSERT INTO public.egresso_valido VALUES (549, NULL, '200404940014', 'GABRIEL DE SOUSA ARAUJO');
INSERT INTO public.egresso_valido VALUES (550, 'gabriel.crispino@hotmail.com', '201304940010', 'GABRIEL NUNES CRISPINO');
INSERT INTO public.egresso_valido VALUES (551, NULL, '199104940015', 'GARDENIA VIEIRA DE ALBUQUERQUE');
INSERT INTO public.egresso_valido VALUES (552, 'george.melo7@gmail.com', '201304940008', 'GEORGE TASSIANO MELO PEREIRA');
INSERT INTO public.egresso_valido VALUES (553, 'gesspinhero@gmail.com', '201204940022', 'GESSICA PINHEIRO DE MORAES BATISTA');
INSERT INTO public.egresso_valido VALUES (554, NULL, '199104940016', 'GHISLENE BRITO DE FREITAS');
INSERT INTO public.egresso_valido VALUES (555, NULL, '199204940041', 'GILBERT ASDRUBAL HERNANDEZ LOURENCO');
INSERT INTO public.egresso_valido VALUES (556, NULL, '199704940015', 'GILMARA SANTOS DA SILVA');
INSERT INTO public.egresso_valido VALUES (557, NULL, '199704940022', 'GILSON TAVARES QUEIROZ');
INSERT INTO public.egresso_valido VALUES (558, 'gior.grs@gmail.com', '201304940009', 'GIORDANNA DE GREGORIIS');
INSERT INTO public.egresso_valido VALUES (559, NULL, '199104940062', 'GIOVANI FONTENELLE COSTA');
INSERT INTO public.egresso_valido VALUES (560, NULL, '200004940038', 'GISSELEN RENEE DE OLIVEIRA SOUZA');
INSERT INTO public.egresso_valido VALUES (561, NULL, '200004940005', 'GLAUCO ESTACIO GONCALVES');
INSERT INTO public.egresso_valido VALUES (562, NULL, '200304940030', 'GLEFSON FRANCO CARNEIRO');
INSERT INTO public.egresso_valido VALUES (563, 'glenonmateus@gmail.com', '200704940017', 'GLENON MATEUS BARBOSA ARAUJO');
INSERT INTO public.egresso_valido VALUES (564, 'gleysongama@gmail.com.br', '200604940035', 'GLEYSON DO NASCIMENTO GAMA');
INSERT INTO public.egresso_valido VALUES (565, NULL, '199304940015', 'GUILHERME AUGUSTO BARROS CONDE');
INSERT INTO public.egresso_valido VALUES (566, 'guilhermef.bcc@gmail.com', '201004940036', 'GUILHERME FARIAS LIMA');
INSERT INTO public.egresso_valido VALUES (567, 'guitrompa1@gmail.com', '201604940009', 'GUILHERME SMETHURST ALBUQUERQUE');
INSERT INTO public.egresso_valido VALUES (568, NULL, '199404940010', 'GUSTAVO HENRIQUE SAMPAIO COUTO');
INSERT INTO public.egresso_valido VALUES (569, 'hamiltoncavalcante@gmail.com', '200704940015', 'HAMILTON DA SILVA CAVALCANTE');
INSERT INTO public.egresso_valido VALUES (570, NULL, '200104940027', 'HAMILTON JOSE MORAES DE ALBUQUERQUE');
INSERT INTO public.egresso_valido VALUES (571, NULL, '199604940024', 'HAMILTON LUIZ RODRIGUES DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (572, 'heitorom9@gmail.com', '201004940013', 'HEITOR DE OLIVEIRA MACEDO');
INSERT INTO public.egresso_valido VALUES (573, NULL, '200104940004', 'HELDER KLEMP CORREA DA SILVA');
INSERT INTO public.egresso_valido VALUES (574, NULL, '199104940096', 'HELDER LUIZ BEZERRA DE OLIVEIRA GARCIA');
INSERT INTO public.egresso_valido VALUES (575, NULL, '199304940016', 'HELIO CARVALHO OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (576, NULL, '199904940048', 'HELIO MARCOS PAZ DE ALMEIDA');
INSERT INTO public.egresso_valido VALUES (577, NULL, '199204940014', 'HENLY KOUICHI TSUCHIYA');
INSERT INTO public.egresso_valido VALUES (578, 'heresson@gmail.com', '200504940006', 'HERESSON JOÃO PAMPOLHA DE SIQUEIRA MENDES');
INSERT INTO public.egresso_valido VALUES (579, NULL, '199604940011', 'HERIVELTON BARBOSA LIMA');
INSERT INTO public.egresso_valido VALUES (580, 'hugo141592@gmail.com', '201104940023', 'HUGO BRITO LIMA');
INSERT INTO public.egresso_valido VALUES (581, NULL, '200104940052', 'HUGO CEZAR DO NASCIMENTO GOES');
INSERT INTO public.egresso_valido VALUES (582, 'hugo@unifesspa.edu.br', '200204940022', 'HUGO PEREIRA KURIBAYASHI');
INSERT INTO public.egresso_valido VALUES (583, 'hogotoda@gmail.com', '200104940012', 'HUGO SAWADA TODA');
INSERT INTO public.egresso_valido VALUES (584, 'hyagogow@gmail.com', '201004940015', 'HYAGO PINHEIRO COSTA OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (585, 'iancamposcc@gmail.com', '201604940043', 'IAN CAMPOS BEZERRA REGO');
INSERT INTO public.egresso_valido VALUES (586, NULL, '200104940013', 'IGOR DE SOUZA ALMEIDA');
INSERT INTO public.egresso_valido VALUES (587, 'igfuca@gmail.com', '200604940011', 'IGOR FURTADO CARVALHO');
INSERT INTO public.egresso_valido VALUES (588, 'imatheus.sm@gmail.com', '201704940007', 'IGOR MATHEUS SOUZA MOREIRA');
INSERT INTO public.egresso_valido VALUES (589, 'ivoquimico@gmail.com', '200404940024', 'IGOR SAMUEL MOREIRA DE MELO');
INSERT INTO public.egresso_valido VALUES (590, 'ingrid.frcomp@gmail.com', '201504940028', 'INGRID FURTADO RAIOL');
INSERT INTO public.egresso_valido VALUES (591, 'iraquitanfilho@gmail.com', '200804940006', 'IRAQUITAN CORDEIRO FILHO');
INSERT INTO public.egresso_valido VALUES (592, NULL, '199104940116', 'IROMAR GOMES DA SILVA');
INSERT INTO public.egresso_valido VALUES (593, 'maues.isa@gmail.com', '201704940005', 'ISABELA LOPES MAUES BATISTA');
INSERT INTO public.egresso_valido VALUES (594, 'hisara3@gmail.com', '201504940001', 'ISRAEL SEWANOU HOUNSOU');
INSERT INTO public.egresso_valido VALUES (595, 'italo.campos@icen.ufpa.br', '201504940012', 'ITALO RAMON DA COSTA CAMPOS');
INSERT INTO public.egresso_valido VALUES (596, NULL, '199804940017', 'IVANDILSON DE SOUZA DUARTE');
INSERT INTO public.egresso_valido VALUES (597, NULL, '199104940017', 'IVAN DOS SANTOS MELLO');
INSERT INTO public.egresso_valido VALUES (598, NULL, '199304940017', 'JAIME DE MELO SABAT NETO');
INSERT INTO public.egresso_valido VALUES (599, NULL, '199104940019', 'JAIME NAZARENO DA SILVA SOARES JUNIOR');
INSERT INTO public.egresso_valido VALUES (600, NULL, '199504940013', 'JAIR DA SILVA FERREIRA JUNIOR');
INSERT INTO public.egresso_valido VALUES (601, 'jairofilho79@gmail.com', '201604940016', 'JAIRO NASCIMENTO DE SOUSA FILHO');
INSERT INTO public.egresso_valido VALUES (602, NULL, '199404940013', 'JANAINA DE FATIMA ROLLA FERREIRA');
INSERT INTO public.egresso_valido VALUES (603, NULL, '199104940117', 'JANAINA DJENANE SOUZA CATETE');
INSERT INTO public.egresso_valido VALUES (604, NULL, '199204940016', 'JANNE YUKIKO YOSHIKAWA OEIRAS');
INSERT INTO public.egresso_valido VALUES (605, 'janynnepalheta@gmail.com', '201104940030', 'JANYNNE STEPHANIE DE OLIVEIRA PALHETA');
INSERT INTO public.egresso_valido VALUES (606, 'jaymejunior@yahoo.com.br', '201504940005', 'JAYME DA COSTA CABRAL JUNIOR');
INSERT INTO public.egresso_valido VALUES (607, 'jeancnasc@hotmail.com', '201004940008', 'JEAN CARNEIRO DO NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (608, NULL, '200404940002', 'JEAN MARCEL DOS REIS COSTA');
INSERT INTO public.egresso_valido VALUES (609, 'jeanneop22@gmail.com', '201304940002', 'JEANNE DE OLIVEIRA PEREIRA');
INSERT INTO public.egresso_valido VALUES (610, NULL, '200004940031', 'JEFERSON MARCELO DE OLIVEIRA CAMARA');
INSERT INTO public.egresso_valido VALUES (611, 'jefjr2504@gmail.com', '201004940014', 'JEFFERSON FERREIRA DE FIGUEIREDO JUNIOR');
INSERT INTO public.egresso_valido VALUES (612, NULL, '199704940023', 'JEFFERSON MIGUEL GONCALVES FERREIRA');
INSERT INTO public.egresso_valido VALUES (613, 'jeffson.celeiro@gmail.com', '201504940027', 'JEFFSON CELEIRO SOUSA');
INSERT INTO public.egresso_valido VALUES (614, NULL, '200004940002', 'JESSE DE SOUZA SOARES');
INSERT INTO public.egresso_valido VALUES (615, 'jnane@ufpa.br', '200004940022', 'JNANE DE SOUSA NEIVA');
INSERT INTO public.egresso_valido VALUES (616, NULL, '199104940063', 'JOAO CALDAS JUNIOR');
INSERT INTO public.egresso_valido VALUES (617, 'lubien1996@gmail.com', '201504940020', 'JOAO DE DEUS FERREIRA FILHO');
INSERT INTO public.egresso_valido VALUES (618, 'jjcf_cc_ufpa@hotmail.com', '201004940018', 'JOAO JOSE CORSI FILHO');
INSERT INTO public.egresso_valido VALUES (619, 'salvatti@ufpa.br', '200104940050', 'JOÃO JÚLIO SALVATTI NETO');
INSERT INTO public.egresso_valido VALUES (620, 'jmfda00@gmail.com', '201704940004', 'JOAO MARCELO FREITAS DE ALMEIDA');
INSERT INTO public.egresso_valido VALUES (621, NULL, '200004940047', 'JOAO MAURICIO SILVA DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (622, NULL, '199904940043', 'JOAO PAULO SOUZA ALVES DE SOUZA');
INSERT INTO public.egresso_valido VALUES (623, 'joaopedromoraes@outlook.com', '201504940006', 'JOAO PEDRO MOREIRA MORAES');
INSERT INTO public.egresso_valido VALUES (624, NULL, '199104940064', 'JOAO ROBERTO PINHEIRO DA CRUZ');
INSERT INTO public.egresso_valido VALUES (625, 'jvcanavarro@gmail.com', '201704940015', 'JOAO VICTOR DA SILVA DIAS CANAVARRO');
INSERT INTO public.egresso_valido VALUES (626, 'jmcpa1982@gmail.com', '199904940019', 'JOAQUIM MAGNO CUNHA');
INSERT INTO public.egresso_valido VALUES (627, NULL, '199504940014', 'JOEL COSTA DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (628, NULL, '199404940014', 'JOERCIO DE SENA RODRIGUES');
INSERT INTO public.egresso_valido VALUES (629, NULL, '199304940018', 'JOGINETE PEREIRA ACRIAO');
INSERT INTO public.egresso_valido VALUES (630, NULL, '200004940017', 'JONATHAN TRINDADE DO NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (631, NULL, '199604940030', 'JONATHAS REIS DA SILVA');
INSERT INTO public.egresso_valido VALUES (632, NULL, '200104940045', 'JONE KAZUKI YAMAGUCHI');
INSERT INTO public.egresso_valido VALUES (633, NULL, '199104940065', 'JORGE LUIS MORAES VALENTE');
INSERT INTO public.egresso_valido VALUES (634, 'jorgedelima911@gmail.com', '200904940023', 'JORGE LUIZ VASCONCELOS DE LIMA');
INSERT INTO public.egresso_valido VALUES (635, 'ailtonvaladares@yahoo.com.br', '200404940023', 'JOSÉ AILTON SOARES VALADARES JÚNIOR');
INSERT INTO public.egresso_valido VALUES (636, 'zeavila@gmail.com', '200504940028', 'JOSE ALBERTO DE ANDRADE AVILA');
INSERT INTO public.egresso_valido VALUES (637, NULL, '199604940010', 'JOSE ALEX AIRES DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (638, NULL, '200204940037', 'JOSEANE DE CASSIA DA SILVA VIANA');
INSERT INTO public.egresso_valido VALUES (639, 'josesarmanho@ufpa.br', '199304940019', 'JOSE ANTONIO SARMANHO DOS SANTOS FREIRE');
INSERT INTO public.egresso_valido VALUES (640, 'correasjunior@gmail.com', '200904940028', 'JOSE CORREA DA SILVA JUNIOR');
INSERT INTO public.egresso_valido VALUES (641, NULL, '200104940041', 'JOSE ENDERSON FERREIRA RODRIGUES');
INSERT INTO public.egresso_valido VALUES (642, 'contato@joseflavio.com', '200404940035', 'JOSÉ FLÁVIO DE SOUZA DIAS JÚNIOR');
INSERT INTO public.egresso_valido VALUES (643, NULL, '200604940037', 'JOSE MARIA DE OLIVEIRA JUNIOR');
INSERT INTO public.egresso_valido VALUES (644, NULL, '199604940037', 'JOSE RAIMUNDO FREITAS DE MENESES');
INSERT INTO public.egresso_valido VALUES (645, NULL, '199204940018', 'JOSE RICARDO SIQUEIRA DE MIRANDA');
INSERT INTO public.egresso_valido VALUES (646, NULL, '199104940069', 'JOSUE PEREIRA DE CASTRO');
INSERT INTO public.egresso_valido VALUES (647, NULL, '199204940017', 'JO UEYAMA');
INSERT INTO public.egresso_valido VALUES (648, 'joyce.csb@gmail.com', '200604940023', 'JOYCE CRISTINA SOUZA BASTOS');
INSERT INTO public.egresso_valido VALUES (649, NULL, '199204940019', 'JOZENILDO SOARES DE SOUZA');
INSERT INTO public.egresso_valido VALUES (650, NULL, '199804940004', 'JULIANO KAZUKI MATSUZAKI OYA');
INSERT INTO public.egresso_valido VALUES (651, NULL, '199304940021', 'JULIO VALENTE DA COSTA JUNIOR');
INSERT INTO public.egresso_valido VALUES (652, NULL, '200004940014', 'JUSSARA ALEIXO SILVA SOUSA');
INSERT INTO public.egresso_valido VALUES (653, 'kaeuchoa@hotmail.com', '201304940012', 'KAE UCHOA SARMANHO');
INSERT INTO public.egresso_valido VALUES (654, NULL, '199804940021', 'KARLA NAZARE FERREIRA DAMASCENO');
INSERT INTO public.egresso_valido VALUES (655, 'karla.santoli@gmail.com', '200104940055', 'KARLA SANTOS DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (656, 'braga.paoola@gmail.com', '201004940029', 'KARLYANNE PAOOLA SILVA BRAGA');
INSERT INTO public.egresso_valido VALUES (657, NULL, '199204940020', 'KAZUSHIGE BATISTA MATSUMOTO');
INSERT INTO public.egresso_valido VALUES (658, NULL, '199704940003', 'KEISE BARBOSA PEIXOTO');
INSERT INTO public.egresso_valido VALUES (659, 'kellydosocorro@gmail.com', '201604940040', 'KELLY DO SOCORRO SILVA DA COSTA');
INSERT INTO public.egresso_valido VALUES (660, NULL, '200104940032', 'KELLY ROBERTA TORRES GUIMARAES');
INSERT INTO public.egresso_valido VALUES (661, NULL, '199104940021', 'KELVIN LOPES DIAS');
INSERT INTO public.egresso_valido VALUES (662, NULL, '199304940022', 'KIWAKO BATISTA MATSUMOTO');
INSERT INTO public.egresso_valido VALUES (663, NULL, '199704940024', 'KIZZY BEZERRA THE');
INSERT INTO public.egresso_valido VALUES (664, 'kleber.mendonca@hotmail.com', '200904940036', 'KLEBER MENDONCA DE MELO');
INSERT INTO public.egresso_valido VALUES (665, NULL, '199504940034', 'KLEBER PALHETA SILVA');
INSERT INTO public.egresso_valido VALUES (666, NULL, '199804940023', 'KLEDER MIRANDA GONCALVES');
INSERT INTO public.egresso_valido VALUES (667, NULL, '199804940025', 'KLESSIS LOPES DIAS');
INSERT INTO public.egresso_valido VALUES (668, 'kleverton.macedo@gmail.com', '200704940021', 'KLEVERTON CARLOS MACEDO DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (669, NULL, '199504940016', 'KLISSIOMARA LOPES DIAS');
INSERT INTO public.egresso_valido VALUES (670, NULL, '199704940029', 'KYLME IKEGAMI SAKIYAMA');
INSERT INTO public.egresso_valido VALUES (671, 'lanapsf@gmail.com', '201204940009', 'LANA PRISCILA DA SILVA FERREIRA');
INSERT INTO public.egresso_valido VALUES (672, NULL, '199404940017', 'LANA RAQUEL SOUZA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (673, 'alilari@uol.com.br', '200504940030', 'LARISSA FERNANDES CHAGAS');
INSERT INTO public.egresso_valido VALUES (674, 'laudafarias@yahoo.com.br', '200204940033', 'LAUDEMIRA PACHECO FARIAS');
INSERT INTO public.egresso_valido VALUES (675, NULL, '200704940034', 'LEANDRO BEZERRA COUTINHO');
INSERT INTO public.egresso_valido VALUES (676, 'hscleandro@gmail.com', '200804940008', 'LEANDRO HENRIQUE SANTOS CORREA');
INSERT INTO public.egresso_valido VALUES (677, NULL, '199904940012', 'LEANDRO LAGES DE CARVALHO FARIA');
INSERT INTO public.egresso_valido VALUES (678, 'le-an-dro95@hotmail.com', '201404940031', 'LEANDRO ORLANDO SOUSA DA SILVA');
INSERT INTO public.egresso_valido VALUES (679, NULL, '200204940039', 'LEANDRO PANTOJA PEREIRA');
INSERT INTO public.egresso_valido VALUES (680, 'ledaoliveiramonteiro@gmail.com', '199104940121', 'LEDA MARA SOUZA DE OLIVEIRA MONTEIRO');
INSERT INTO public.egresso_valido VALUES (681, NULL, '199804940012', 'LENON JOSE COSTA RAIOL');
INSERT INTO public.egresso_valido VALUES (682, 'leomarioguitarr@yahoo.com.br', '200604940025', 'LEOMARIO SILVA MACHADO');
INSERT INTO public.egresso_valido VALUES (683, 'leohenryster@gmail.com', '200904940033', 'LEONAM GAMA DA SILVA');
INSERT INTO public.egresso_valido VALUES (684, NULL, '199804940026', 'LEONARDO ATHANAZIO DE CERQUEIRA GATTI');
INSERT INTO public.egresso_valido VALUES (685, 'nardoasafonso@gmail.com', '201204940026', 'LEONARDO AUGUSTO SOUZA AFONSO');
INSERT INTO public.egresso_valido VALUES (686, 'srleonardofurtado@gmail.com', '201604940024', 'LEONARDO BARBOSA FURTADO');
INSERT INTO public.egresso_valido VALUES (687, 'leonardo.chfc@gmail.com', '201504940019', 'LEONARDO CHRISTIAN FERREIRA DA COSTA');
INSERT INTO public.egresso_valido VALUES (688, NULL, '200104940009', 'LEONARDO CORREA BAIMA');
INSERT INTO public.egresso_valido VALUES (689, 'leosr89@gmail.com', '200904940007', 'LEONARDO DE SOUSA RAMOS');
INSERT INTO public.egresso_valido VALUES (690, NULL, '199704940008', 'LEONARDO HIROKAZU DE SOUZA HAMADA');
INSERT INTO public.egresso_valido VALUES (691, 'leonardovalente@gmail.com', '200104940048', 'LEONARDO JUNQUEIRA DA SILVA VALENTE');
INSERT INTO public.egresso_valido VALUES (692, 'leonardopfb@gmail.com', '200304940004', 'LEONARDO PATRICIO FERREIRA BARBOSA');
INSERT INTO public.egresso_valido VALUES (693, 'leonardo.santos.formento@gmail.com', '201104940007', 'LEONARDO SANTOS FORMENTO');
INSERT INTO public.egresso_valido VALUES (694, 'leonardosarraff@gmail.com', '200704940005', 'LEONARDO SARRAFF NUNES DE MORAES');
INSERT INTO public.egresso_valido VALUES (695, NULL, '200104940014', 'LEONARDO YOICHI FEIO OKADA');
INSERT INTO public.egresso_valido VALUES (696, NULL, '199404940041', 'LICIA CRISTINA BRITO DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (697, NULL, '200004940007', 'LIDIANE PARENTE ANDRADE');
INSERT INTO public.egresso_valido VALUES (698, NULL, '199404940018', 'LIGEIA DE ALMEIDA ALENCAR');
INSERT INTO public.egresso_valido VALUES (699, 'liken_iu@yahoo.com.br', '200404940025', 'LIKEN IU MATSUMOTO CORREIA LIMA');
INSERT INTO public.egresso_valido VALUES (700, 'lilianferreira@ufpa.br', '200904940017', 'LILIAN SANTOS FERREIRA DA SILVA');
INSERT INTO public.egresso_valido VALUES (701, NULL, '199104940023', 'LINDALVO GONZAGA DE ALCANTARA NETO');
INSERT INTO public.egresso_valido VALUES (702, NULL, '200304940001', 'LIS WEIJI KANASHIRO PEREIRA');
INSERT INTO public.egresso_valido VALUES (703, NULL, '199804940006', 'LIVIA RENATA VALE FRANCO DE SA');
INSERT INTO public.egresso_valido VALUES (704, 'louisebarros@yahoo.com.br', '200404940012', 'LOUISE GONCALVES DE BARROS');
INSERT INTO public.egresso_valido VALUES (705, 'lucasmelo@ufpa.br', '200804940007', 'LUCAS DE MELO SILVA');
INSERT INTO public.egresso_valido VALUES (706, 'luks.ferraro@gmail.com', '201604940042', 'LUCAS FELIPE FERRARO CARDOSO');
INSERT INTO public.egresso_valido VALUES (707, 'lucassouzaufpa@gmail.com', '201604940039', 'LUCAS GABRIEL DE SOUZA');
INSERT INTO public.egresso_valido VALUES (708, 'lucasrodriguesgui@hotmail.com', '201404940005', 'LUCAS RODRIGUES GUIMARAES');
INSERT INTO public.egresso_valido VALUES (709, 'tavares.lucas1996@gmail.com', '201404940026', 'LUCAS TAVARES MONTEIRO');
INSERT INTO public.egresso_valido VALUES (710, 'luceliapgoncalves@gmail.com', '200304940006', 'LUCELIA PEREIRA GONCALVES');
INSERT INTO public.egresso_valido VALUES (711, NULL, '199304940023', 'LUCIANA CRISTINA MARTINS');
INSERT INTO public.egresso_valido VALUES (712, 'paiva@ufpa.br', '199604940013', 'LUCIANA DE NAZARE PAIVA NUNES');
INSERT INTO public.egresso_valido VALUES (713, 'lucianabrito@openmailbox.org', '201204940031', 'LUCIANA LIMA BRITO');
INSERT INTO public.egresso_valido VALUES (714, 'luma@ufpa.br', '199904940026', 'LUCIANA MARIA AZEVEDO NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (715, NULL, '199104940024', 'LUCIANA TOUREIRO HAGE');
INSERT INTO public.egresso_valido VALUES (716, NULL, '199404940020', 'LUCIENE PEREIRA COSTA');
INSERT INTO public.egresso_valido VALUES (717, NULL, '199104940071', 'LUCIO EDUARDO SOLANO REIS');
INSERT INTO public.egresso_valido VALUES (718, NULL, '199504940030', 'LUIS MIGUEL FONSECA DE MORAIS');
INSERT INTO public.egresso_valido VALUES (719, NULL, '199904940029', 'LUIZ ACACIO CENTENO CORDEIRO JUNIOR');
INSERT INTO public.egresso_valido VALUES (720, NULL, '199404940021', 'LUIZ ALANO ALEXANDRE LOPES');
INSERT INTO public.egresso_valido VALUES (721, 'lasf_bel@yahoo.com.br', '200204940017', 'LUIZ ALBERTO DA SILVA FILHO');
INSERT INTO public.egresso_valido VALUES (722, NULL, '199604940022', 'LUIZ ALBUQUERQUE LEAO');
INSERT INTO public.egresso_valido VALUES (723, 'luizdanin@gmail.com', '201104940004', 'LUIZ AUGUSTO MONTEIRO ROSO DANIN');
INSERT INTO public.egresso_valido VALUES (724, NULL, '200104940005', 'LUIZ DANIEL CREAO AUGUSTO');
INSERT INTO public.egresso_valido VALUES (725, 'ldourado1980@globo.com', '199904940015', 'LUIZ DOURADO DIAS JUNIOR');
INSERT INTO public.egresso_valido VALUES (726, NULL, '200004940037', 'LUIZ GUSTAVO COSTA CARVALHO');
INSERT INTO public.egresso_valido VALUES (727, NULL, '200104940030', 'LUIZ OTAVIO DA SILVA BARATA');
INSERT INTO public.egresso_valido VALUES (728, NULL, '200004940035', 'LUIZ TOME VILHENA DANTAS NETO');
INSERT INTO public.egresso_valido VALUES (729, NULL, '199104940072', 'LUIZ WALDOMIRO MONTEIRO NETO');
INSERT INTO public.egresso_valido VALUES (730, 'filholuzio@gmail.com', '200204940042', 'LUZIO SANTANA DA SILVA FILHO');
INSERT INTO public.egresso_valido VALUES (731, NULL, '199204940021', 'LUZONILDO LEAO DA SILVA');
INSERT INTO public.egresso_valido VALUES (732, 'manoel.afonsoo@gmail.com', '201004940009', 'MANOEL AFONSO PEREIRA DE LIMA FILHO');
INSERT INTO public.egresso_valido VALUES (733, NULL, '199504940018', 'MANOEL FREDERICO BELTRAO ROSAS JUNIOR');
INSERT INTO public.egresso_valido VALUES (734, NULL, '199704940010', 'MANUELA DE JESUS SEMBLANO BITTENCOURT');
INSERT INTO public.egresso_valido VALUES (735, NULL, '200004940050', 'MARCEL ABREU DA MOTA');
INSERT INTO public.egresso_valido VALUES (736, NULL, '199104940026', 'MARCELA PIEDADE DO AMARAL');
INSERT INTO public.egresso_valido VALUES (737, NULL, '200004940029', 'MARCELIO D OLIVEIRA LEAL');
INSERT INTO public.egresso_valido VALUES (738, NULL, '200004940008', 'MARCELLA LETICIA DE SOUZA COSTA');
INSERT INTO public.egresso_valido VALUES (739, 'mpmota@ufpa.br', '200304940014', 'MARCELLE PEREIRA MOTA');
INSERT INTO public.egresso_valido VALUES (740, NULL, '199504940035', 'MARCELLO ADOLFO VELOSO DA SILVA');
INSERT INTO public.egresso_valido VALUES (741, 'mas@ufpa.br', '200204940013', 'MARCELO ALMEIDA DA SILVA');
INSERT INTO public.egresso_valido VALUES (742, NULL, '200004940028', 'MARCELO ANDRADE DA GAMA MALCHER');
INSERT INTO public.egresso_valido VALUES (743, NULL, '200204940019', 'MARCELO ANDRADE PEREIRA');
INSERT INTO public.egresso_valido VALUES (744, 'marceloalves@ufpa.br', '201404940014', 'MARCELO ANTONIO ALVES ALENCAR');
INSERT INTO public.egresso_valido VALUES (745, NULL, '199704940004', 'MARCELO DE BRITO GARCIA');
INSERT INTO public.egresso_valido VALUES (746, 'mmaia.cc@gmail.com', '200904940027', 'MARCELO MAIA DA SILVA');
INSERT INTO public.egresso_valido VALUES (747, NULL, '199404940022', 'MARCELO NASCIMENTO COSTA');
INSERT INTO public.egresso_valido VALUES (748, NULL, '200204940050', 'MARCELO RIBEIRO ALBERNAZ');
INSERT INTO public.egresso_valido VALUES (749, NULL, '199504940019', 'MARCELO SAMUEL DA COSTA MAGALHAES');
INSERT INTO public.egresso_valido VALUES (750, NULL, '199204940022', 'MARCIA ANDREA DE CARVALHO FREITAS');
INSERT INTO public.egresso_valido VALUES (751, NULL, '199804940002', 'MARCIA CRISTINA MONTEIRO DE MORAES');
INSERT INTO public.egresso_valido VALUES (752, NULL, '199504940020', 'MARCIA MARIA DA SILVA AMARAL');
INSERT INTO public.egresso_valido VALUES (753, NULL, '199104940123', 'MARCIO AMAZON KOHLER DA C KURIBAYASHI');
INSERT INTO public.egresso_valido VALUES (754, NULL, '199104940098', 'MARCIO AUGUSTO PEREIRA BAILOSA');
INSERT INTO public.egresso_valido VALUES (755, NULL, '200204940035', 'MARCIO BRAGA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (756, NULL, '199604940003', 'MARCIO FREITAS CABRAL DA LUZ');
INSERT INTO public.egresso_valido VALUES (757, NULL, '200204940031', 'MARCIO KUROKI GONCALVES');
INSERT INTO public.egresso_valido VALUES (758, NULL, '199204940023', 'MARCO ANTONIO FAGUNDES DE MORAES');
INSERT INTO public.egresso_valido VALUES (759, NULL, '199104940027', 'MARCOS AURELIO TRAJANO DE ASSIS');
INSERT INTO public.egresso_valido VALUES (760, NULL, '199904940005', 'MARCOS ROMERO GONZAGA DE ALMEIDA');
INSERT INTO public.egresso_valido VALUES (761, 'marcosbenaion@gmail.com', '201204940019', 'MARCOS SENNA BENAION LEAL');
INSERT INTO public.egresso_valido VALUES (762, NULL, '199104940106', 'MARCUS DE BARROS BRAGA');
INSERT INTO public.egresso_valido VALUES (763, NULL, '199204940024', 'MARIA ADALZIRA SEIXAS LOPES');
INSERT INTO public.egresso_valido VALUES (764, 'mariaandreia@ufpa.br', '199504940021', 'MARIA ANDRÉIA RODRIGUES DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (765, NULL, '200004940011', 'MARIANA DE NAZARE DOS ANJOS LIMA');
INSERT INTO public.egresso_valido VALUES (766, NULL, '200104940007', 'MARINA ATSUMI OIKAWA');
INSERT INTO public.egresso_valido VALUES (767, NULL, '199404940025', 'MARINA NERY BRACCHI');
INSERT INTO public.egresso_valido VALUES (768, NULL, '200004940030', 'MARIO DO SOCORRO JARDIM MONTEIRO');
INSERT INTO public.egresso_valido VALUES (769, 'marissabc@ufpa.br', '201104940005', 'MARISSA BRASIL DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (770, 'marjoriepmarques@gmail.com', '201004940010', 'MARJORIE PEREIRA MARQUES');
INSERT INTO public.egresso_valido VALUES (771, 'marlos_ferreira@yahoo.com.br', '200204940026', 'MARLOS BATISTA FERREIRA');
INSERT INTO public.egresso_valido VALUES (772, 'marlos1415@gmail.com', '200604940027', 'MARLOS DE MORAES TAVARES');
INSERT INTO public.egresso_valido VALUES (773, NULL, '199104940124', 'MARTHA CASTELLO BRANCO DE MELLO');
INSERT INTO public.egresso_valido VALUES (774, NULL, '200304940031', 'MARYANNE PACHECO SOEIRO DE BARROS');
INSERT INTO public.egresso_valido VALUES (775, NULL, '199704940021', 'MASAO IIDA');
INSERT INTO public.egresso_valido VALUES (776, 'mprodrigues@openmailbox.org', '201204940006', 'MATEUS PINTO RODRIGUES');
INSERT INTO public.egresso_valido VALUES (777, 'matheusfreire.cbcc@gmail.com', '201104940020', 'MATHEUS FERREIRA FREIRE');
INSERT INTO public.egresso_valido VALUES (778, 'sa.matheus.leite@gmail.com', '201504940018', 'MATHEUS OLIVEIRA LEITE DE SA');
INSERT INTO public.egresso_valido VALUES (779, NULL, '199904940025', 'MAURICIO PIO DE LACERDA');
INSERT INTO public.egresso_valido VALUES (780, 'mauricio.ronny@ufla.br', '200504940015', 'MAURICIO RONNY DE ALMEIDA SOUZA');
INSERT INTO public.egresso_valido VALUES (781, NULL, '199304940028', 'MAX HIDEYUKI MATSUZAKI');
INSERT INTO public.egresso_valido VALUES (782, 'maxwelmdias@gmail.com', '200404940028', 'MAXWEL MACEDO DIAS');
INSERT INTO public.egresso_valido VALUES (783, 'mcfigueiredo@ufpa.br', '200404940001', 'MAYARA COSTA FIGUEIREDO');
INSERT INTO public.egresso_valido VALUES (784, NULL, '199804940022', 'MELINA DE VASCONCELOS ALBERIO');
INSERT INTO public.egresso_valido VALUES (785, NULL, '199304940029', 'MELISSA SA OTERO');
INSERT INTO public.egresso_valido VALUES (786, 'michellkruz@gmail.com', '201104940035', 'MICHELL COSTA OLIVEIRA DA CRUZ');
INSERT INTO public.egresso_valido VALUES (787, NULL, '200004940049', 'MICHEL PENA DOS SANTOS NERY');
INSERT INTO public.egresso_valido VALUES (788, 'migsiq2@gmail.com', '199904940047', 'MIGUEL FORMIGOSA SIQUEIRA');
INSERT INTO public.egresso_valido VALUES (789, 'mp_godan@hotmail.com', '200504940016', 'MIGUEL JOSE DE ALMEIDA PERNAMBUCO FILHO');
INSERT INTO public.egresso_valido VALUES (790, NULL, '199404940026', 'MIGUEL PEREIRA MARQUES');
INSERT INTO public.egresso_valido VALUES (791, NULL, '199604940027', 'MILENA HELLEM BEZERRA DA SILVA');
INSERT INTO public.egresso_valido VALUES (792, 'milenarayane@ufpa.br', '200904940030', 'MILENA RAYANE DOS SANTOS GALVAO');
INSERT INTO public.egresso_valido VALUES (793, 'mizaelm2@yahoo.com.br', '200604940020', 'MIZAEL PANTOJA MONTEIRO');
INSERT INTO public.egresso_valido VALUES (794, NULL, '199604940016', 'MOISES BEN HUR SOUSA SEIFFERT SIMOES');
INSERT INTO public.egresso_valido VALUES (795, 'moises.silva@icen.ufpa.br', '201204940021', 'MOISES FELIPE MELLO DA SILVA');
INSERT INTO public.egresso_valido VALUES (796, NULL, '199304940030', 'MONICA DE NAZARE TAVARES DE PAULA GOYANA');
INSERT INTO public.egresso_valido VALUES (797, NULL, '199604940004', 'MONICA FERNANDES DA SILVA');
INSERT INTO public.egresso_valido VALUES (798, 'mosheribeiro@yahoo.com.br', '200504940008', 'MOSHE DAYAN SOUSA RIBEIRO');
INSERT INTO public.egresso_valido VALUES (799, 'murilosalles@yahoo.com.br', '200204940045', 'MURILO FARIAS SALES');
INSERT INTO public.egresso_valido VALUES (800, NULL, '200104940056', 'NATALIA COUTO DIAS');
INSERT INTO public.egresso_valido VALUES (801, NULL, '199104940036', 'NAYME CRISTHINA GOMES DE ALMEIDA');
INSERT INTO public.egresso_valido VALUES (802, NULL, '199304940031', 'NELSON BRAZAO MACIEL JUNIOR');
INSERT INTO public.egresso_valido VALUES (803, 'nickspsouza@gmail.com', '201104940037', 'NICOLI DA SILVA PEREIRA DE SOUZA');
INSERT INTO public.egresso_valido VALUES (804, 'nikolas.carneiro@gmail.com', '201104940009', 'NIKOLAS JORGE SANTIAGO CARNEIRO');
INSERT INTO public.egresso_valido VALUES (805, NULL, '199904940040', 'NILSON JOSE MENDES DA COSTA FILHO');
INSERT INTO public.egresso_valido VALUES (806, NULL, '199404940027', 'NOEL BASTOS GONZAGA');
INSERT INTO public.egresso_valido VALUES (807, NULL, '200004940009', 'ODNALRO CRUZ VIDEIRA JUNIOR');
INSERT INTO public.egresso_valido VALUES (808, NULL, '199104940028', 'OLINDA MIOKA CHUBACHI');
INSERT INTO public.egresso_valido VALUES (809, NULL, '199704940011', 'OSIEL MARLON NEGRAO DA SILVA');
INSERT INTO public.egresso_valido VALUES (810, 'onoura@gmail.com', '199504940023', 'OTÁVIO NOURA TEIXEIRA');
INSERT INTO public.egresso_valido VALUES (811, 'orvoltz@gmail.com', '200004940053', 'OTAVIO RODRIGUES JUNIOR');
INSERT INTO public.egresso_valido VALUES (812, 'patriciaufpa@gmail.com', '200404940011', 'PATRICIA MATIAS LOPES');
INSERT INTO public.egresso_valido VALUES (813, 'pdanni@gmail.com', '200204940021', 'PAULA DANIELE DE OLIVEIRA MOREIRA');
INSERT INTO public.egresso_valido VALUES (814, NULL, '199104940100', 'PAULA JOSIANE DE SA SANTOS');
INSERT INTO public.egresso_valido VALUES (815, NULL, '199304940032', 'PAULO ANDRE EVANGELISTA DA SILVA');
INSERT INTO public.egresso_valido VALUES (816, 'paulocleiton@ufpa.br', '200304940036', 'PAULO CLEITON VIEIRA DA SILVA');
INSERT INTO public.egresso_valido VALUES (817, 'pjpaulor@gmail.com', '200504940031', 'PAULO FERNANDO SOUZA RODRIGUES JUNIOR');
INSERT INTO public.egresso_valido VALUES (818, NULL, '199704940019', 'PAULO GLEIDSON RISUENHO PEINADO');
INSERT INTO public.egresso_valido VALUES (819, NULL, '199104940087', 'PAULO GUILHERME DOS SANTOS NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (820, NULL, '199104940101', 'PAULO JORGE OLIVEIRA BRAGA');
INSERT INTO public.egresso_valido VALUES (821, NULL, '199104940128', 'PAULO NAZARENO MAIA SAMPAIO');
INSERT INTO public.egresso_valido VALUES (822, 'paulo.robertojr100@gmail.com', '201104940001', 'PAULO ROBERTO SILVA CHAGAS JUNIOR');
INSERT INTO public.egresso_valido VALUES (823, 'prcmalcher@gmail.com', '200804940027', 'PAULO ROBSON CAMPELO MALCHER');
INSERT INTO public.egresso_valido VALUES (824, 'paulorudolph07@gmail.com', '200504940009', 'PAULO RUDOLPH DA SILVA NASCIMENTO');
INSERT INTO public.egresso_valido VALUES (825, 'paulosena99@gmail.com', '201404940044', 'PAULO SENA FERREIRA FILHO');
INSERT INTO public.egresso_valido VALUES (826, NULL, '199104940029', 'PAULO SERGIO DOS SANTOS COSTA');
INSERT INTO public.egresso_valido VALUES (827, NULL, '199104940075', 'PAULO SERGIO LAMEIRA SANTOS');
INSERT INTO public.egresso_valido VALUES (828, NULL, '199304940033', 'PAULO SERGIO SILVA RODRIGUES');
INSERT INTO public.egresso_valido VALUES (829, NULL, '199404940029', 'PAULO TAKASHI SAWAKI FILHO');
INSERT INTO public.egresso_valido VALUES (830, 'pvsfair@gmail.com', '201304940021', 'PAULO VICTOR DE LIMA SFAIR ALVARES');
INSERT INTO public.egresso_valido VALUES (831, 'paulusanglada@hotmail.com', '200204940010', 'PAULUS ROBERTO GUEIROS ANGLADA');
INSERT INTO public.egresso_valido VALUES (832, NULL, '200804940021', 'PEDRO AFONSO NASCIMENTO DE AVIZ');
INSERT INTO public.egresso_valido VALUES (833, NULL, '200104940060', 'PEDRO NOLASCO FERREIRA NETO');
INSERT INTO public.egresso_valido VALUES (834, 'ppvitorr@gmail.com', '201704940003', 'PEDRO VICTOR AROUCK MELO');
INSERT INTO public.egresso_valido VALUES (835, NULL, '199904940007', 'PRISCILA CORREA SABOIA');
INSERT INTO public.egresso_valido VALUES (836, NULL, '200204940009', 'PRISCILA GOES BURLE');
INSERT INTO public.egresso_valido VALUES (837, NULL, '199404940042', 'PRISCILLA LANNE CORDEIRO DE LEAO');
INSERT INTO public.egresso_valido VALUES (838, NULL, '200104940040', 'RAFAELA DA SILVA LOBO');
INSERT INTO public.egresso_valido VALUES (839, NULL, '200304940009', 'RAFAEL DA SILVA TAKASHIMA');
INSERT INTO public.egresso_valido VALUES (840, NULL, '200304940028', 'RAFAEL FREITAS DE MORAIS');
INSERT INTO public.egresso_valido VALUES (841, 'rafaellgom@gmail.com', '200504940018', 'RAFAEL LOPES GOMES');
INSERT INTO public.egresso_valido VALUES (842, 'rafaelmf@ufpa.br', '200404940007', 'RAFAEL MARTINS FEITOSA');
INSERT INTO public.egresso_valido VALUES (843, 'rafamesquita89@gmail.com', '200804940029', 'RAFAEL MESQUITA DO MAR');
INSERT INTO public.egresso_valido VALUES (844, 'rafaelsousa2187@gmail.com', '201604940041', 'RAFAEL NASCIMENTO DE SOUSA');
INSERT INTO public.egresso_valido VALUES (845, 'nascimento.rsouza@gmail.com', '200904940012', 'RAFAEL NASCIMENTO DE SOUZA');
INSERT INTO public.egresso_valido VALUES (846, NULL, '200204940001', 'RAFAEL PEREIRA ESTEVES');
INSERT INTO public.egresso_valido VALUES (847, 'rafaveguim@gmail.com', '200604940002', 'RAFAEL VERAS GUIMARAES');
INSERT INTO public.egresso_valido VALUES (848, 'rfbcj@hotmail.com', '201504940004', 'RAIMUNDO FERNANDO BENTES DAS CHAGAS JUNIOR');
INSERT INTO public.egresso_valido VALUES (849, 'r.lorenna@gmail.com', '201104940013', 'RAISSA LORENA SILVA DA SILVA');
INSERT INTO public.egresso_valido VALUES (850, 'ramiroserge@gmail.com', '201004940040', 'RAMIRO LUZ VERGOLINO ZAHLOUTH');
INSERT INTO public.egresso_valido VALUES (851, 'ramonestii@gmail.com', '201304940013', 'RAMON DA GAMA CORDEIRO');
INSERT INTO public.egresso_valido VALUES (852, 'ramonfalsoni@hotmail.com', '200704940011', 'RAMON FALSONI');
INSERT INTO public.egresso_valido VALUES (853, 'ramontcruz@gmail.com', '200604940009', 'RAMON TORRES CRUZ');
INSERT INTO public.egresso_valido VALUES (854, 'ranieri@ufpa.br', '200604940024', 'RANIERI BARROS TEIXEIRA');
INSERT INTO public.egresso_valido VALUES (855, NULL, '200504940033', 'RAPHAEL BRITO DE PAIVA');
INSERT INTO public.egresso_valido VALUES (856, NULL, '199904940003', 'REGIANE ANDRADE BRITO');
INSERT INTO public.egresso_valido VALUES (857, NULL, '199804940024', 'REGIANE LIMA DE SOUSA');
INSERT INTO public.egresso_valido VALUES (858, NULL, '199104940032', 'REGIANE YUMIKO DA SILVA KAWASAKI');
INSERT INTO public.egresso_valido VALUES (859, 'regicsf2010@gmail.com', '201004940002', 'REGINALDO CORDEIRO DOS SANTOS FILHO');
INSERT INTO public.egresso_valido VALUES (860, NULL, '199204940031', 'REGINALDO TERUYOSHI HAMAGUCHI');
INSERT INTO public.egresso_valido VALUES (861, NULL, '199204940029', 'REGINA NAOMI TANAKA');
INSERT INTO public.egresso_valido VALUES (862, 'reinaldoc@gmail.com', '200104940057', 'REINALDO GIL LIMA DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (863, 'Renanf016@gmail.com', '201304940011', 'RENAN FILIP COSTA BALIEIRO');
INSERT INTO public.egresso_valido VALUES (864, 'renancunhafonseca@hotmail.com', '201704940034', 'RENAN FONSECA CUNHA');
INSERT INTO public.egresso_valido VALUES (865, 'renan.leviathan@gmail.com', '201504940029', 'RENAN LOBO DUARTE');
INSERT INTO public.egresso_valido VALUES (866, 'renan3mf@hotmail.com', '200604940010', 'RENAN SALES BARROS');
INSERT INTO public.egresso_valido VALUES (867, 'renannojosa@gmail.com', '201304940032', 'RENAN THIAGO DA SILVA ROSA');
INSERT INTO public.egresso_valido VALUES (868, NULL, '200304940002', 'RENATA PEREIRA BAENA');
INSERT INTO public.egresso_valido VALUES (869, NULL, '199704940006', 'RENATO FIGUEIRO MAIA');
INSERT INTO public.egresso_valido VALUES (870, 'Rjlmota@gmail.com', '201704940001', 'RENATO JOSE LIMA MOTA');
INSERT INTO public.egresso_valido VALUES (871, 'pennafort22@gmail.com', '200604940007', 'RENATO PENNAFORT ROCHA');
INSERT INTO public.egresso_valido VALUES (872, 'renato.renison@gmail.com', '201004940011', 'RENATO RENISON MOREIRA OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (873, NULL, '199704940035', 'RENATO WILSON SOUZA DE OLIVEIRA');
INSERT INTO public.egresso_valido VALUES (874, NULL, '199304940034', 'RICARDO ANDRE CAVALCANTE DE SOUZA');
INSERT INTO public.egresso_valido VALUES (875, 'ricardo@vfatec.com.br', '201304940001', 'RICARDO BASTOS ARRAES');
INSERT INTO public.egresso_valido VALUES (876, NULL, '200004940015', 'RICARDO CARVALHO DE SOUZA');
INSERT INTO public.egresso_valido VALUES (877, NULL, '199904940011', 'RICARDO CESAR FREITAS DE SOUZA');
INSERT INTO public.egresso_valido VALUES (878, NULL, '199304940035', 'RICARDO DE FARIAS SANTOS');
INSERT INTO public.egresso_valido VALUES (879, NULL, '199804940020', 'RICARDO IUNES COSTA');
INSERT INTO public.egresso_valido VALUES (880, NULL, '199304940036', 'RICHARD DIAS DA COSTA');
INSERT INTO public.egresso_valido VALUES (881, NULL, '199404940031', 'RITA DE CASSIA DAVID DAS NEVES');
INSERT INTO public.egresso_valido VALUES (882, NULL, '199304940037', 'ROBERTA DE OLIVEIRA CAVALCANTE');
INSERT INTO public.egresso_valido VALUES (883, 'robertaba@gmail.com', '199404940032', 'ROBERTA MACHADO BRASIL DE LIMA ARAUJO');
INSERT INTO public.egresso_valido VALUES (884, NULL, '199104940076', 'ROBERTA VILHENA VIEIRA');
INSERT INTO public.egresso_valido VALUES (885, NULL, '199704940002', 'ROBERTO DE ARAUJO MOURA');
INSERT INTO public.egresso_valido VALUES (886, NULL, '200404940030', 'ROBERTO FRANKLIN MOREIRA CARDOSO');
INSERT INTO public.egresso_valido VALUES (887, NULL, '199104940102', 'ROBERTO NOGUEIRA LIMA');
INSERT INTO public.egresso_valido VALUES (888, 'roberto.pinheiro@hotmail.com.br', '200804940033', 'ROBERTO PINHEIRO DA FONSECA');
INSERT INTO public.egresso_valido VALUES (889, NULL, '200104940037', 'ROBERTSON DIOGO DE MORAES BANDEIRA');
INSERT INTO public.egresso_valido VALUES (890, 'robsonaguiar@ufpa.br', '200404940018', 'ROBSON DA SILVA AGUIAR');
INSERT INTO public.egresso_valido VALUES (891, 'rodolfo_fiel@yahoo.com.br', '200304940023', 'RODOLFO FIEL DE SOUSA');
INSERT INTO public.egresso_valido VALUES (892, NULL, '199604940029', 'RODOLFO MOACIR SEABRA JUNIOR');
INSERT INTO public.egresso_valido VALUES (893, 'rodbarbalho@gmail.com', '200604940044', 'RODRIGO ARAUJO BARBALHO');
INSERT INTO public.egresso_valido VALUES (894, NULL, '199504940026', 'RODRIGO CUNHA MENDES');
INSERT INTO public.egresso_valido VALUES (895, 'rodrigopara@gmail.com', '200904940003', 'RODRIGO DE BRITTO PONTES RODRIGUES PARA');
INSERT INTO public.egresso_valido VALUES (896, NULL, '199404940033', 'RODRIGO DE FREITAS VALE');
INSERT INTO public.egresso_valido VALUES (897, 'rodrigo99monteiro@gmail.com', '201404940012', 'RODRIGO HENRIQUE BARBOSA MONTEIRO');
INSERT INTO public.egresso_valido VALUES (898, NULL, '199904940014', 'RODRIGO PINTO CARDOSO');
INSERT INTO public.egresso_valido VALUES (899, NULL, '199104940077', 'RODRIGO QUITES REIS');
INSERT INTO public.egresso_valido VALUES (900, NULL, '199904940058', 'RODRIGO SILVA PINTO');
INSERT INTO public.egresso_valido VALUES (901, NULL, '199104940078', 'ROGERIO FIGUEIREDO DE BRITO');
INSERT INTO public.egresso_valido VALUES (902, 'albuquerque@ufpa.br', '200504940022', 'ROMULO PINTO DE ALBUQUERQUE');
INSERT INTO public.egresso_valido VALUES (903, 'ronaldsouza16@hotmail.com', '201104940029', 'RONALD ASSUNCAO SOUZA');
INSERT INTO public.egresso_valido VALUES (904, 'RONALDPPINHO@GMAIL.COM', '201704940035', 'RONALDD PATRIK SILVA PINHO');
INSERT INTO public.egresso_valido VALUES (905, NULL, '200504940047', 'RONALDO CUNHA GOMES');
INSERT INTO public.egresso_valido VALUES (906, 'ronaldsilva852@gmail.com', '200904940019', 'RONALD RIBEIRO SILVA');
INSERT INTO public.egresso_valido VALUES (907, NULL, '200104940036', 'ROSANA CERES EVANGELISTA KALIL');
INSERT INTO public.egresso_valido VALUES (908, NULL, '199104940079', 'ROSANA DE NAZARE MENEZES MATOS');
INSERT INTO public.egresso_valido VALUES (909, NULL, '199104940046', 'ROSARINA MARIA PINHEIRO RODRIGUES');
INSERT INTO public.egresso_valido VALUES (910, NULL, '199804940010', 'ROSSANA DA CUNHA SILVA');
INSERT INTO public.egresso_valido VALUES (911, 'profrubensfr@ig.com.br', '200504940045', 'RUBENS FERNANDES ROCHA');
INSERT INTO public.egresso_valido VALUES (912, NULL, '199704940026', 'RUBIA CRISTIANE BORGES CASTRO');
INSERT INTO public.egresso_valido VALUES (913, NULL, '199104940080', 'RUI DE ALMEIDA MACOLA');
INSERT INTO public.egresso_valido VALUES (914, NULL, '199204940033', 'SALOMAO FERNANDES DE FREITAS JUNIOR');
INSERT INTO public.egresso_valido VALUES (915, NULL, '199204940034', 'SAMIRA MARIA LUZ CARMO');
INSERT INTO public.egresso_valido VALUES (916, 'sfelixjr@gmail.com', '200504940007', 'SAMUEL FELIX DE SOUSA JUNIOR');
INSERT INTO public.egresso_valido VALUES (917, 'samcampos81@gmail.com', '200004940042', 'SAMUEL MARQUES CAMPOS');
INSERT INTO public.egresso_valido VALUES (918, NULL, '199204940035', 'SANDRO MARCELO ATI TADAIESKY');
INSERT INTO public.egresso_valido VALUES (919, 'sandyfaro0@gmail.com', '201604940027', 'SANDY ANDRADE FARO');
INSERT INTO public.egresso_valido VALUES (920, NULL, '200004940034', 'SANDY EVELON CUNHA DAS NEVES');
INSERT INTO public.egresso_valido VALUES (921, 'saul.berardo@gmail.com', '200404940005', 'SAUL CAMPOS BERARDO');
INSERT INTO public.egresso_valido VALUES (922, NULL, '200104940003', 'SAVANA CECILIA PARGA CARNEIRO');
INSERT INTO public.egresso_valido VALUES (923, NULL, '199604940021', 'SCHUBERT RIBEIRO DE CARVALHO');
INSERT INTO public.egresso_valido VALUES (924, NULL, '199204940036', 'SEBASTIAO ALESSANDRO LINHARES DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (925, NULL, '199904940038', 'SEBASTIAO ANTONIO V DE FARIAS JUNIOR');
INSERT INTO public.egresso_valido VALUES (926, 'sababorges@gmail.com', '199904940004', 'SEBASTIAO BORGES FONSECA');
INSERT INTO public.egresso_valido VALUES (927, NULL, '199404940034', 'SEBASTIAO DE SOUSA MESQUITA');
INSERT INTO public.egresso_valido VALUES (928, NULL, '199104940081', 'SERGIO ANGELO CAMPOS ALVES');
INSERT INTO public.egresso_valido VALUES (929, NULL, '199204940038', 'SERGIO RICARDO LIMA DA SILVA');
INSERT INTO public.egresso_valido VALUES (930, NULL, '199104940047', 'SHIRLEY DOS SANTOS SALES BAIMA PINTO');
INSERT INTO public.egresso_valido VALUES (931, NULL, '200104940025', 'SIDNEY MASAHARU MATSUNAGA');
INSERT INTO public.egresso_valido VALUES (932, NULL, '199104940132', 'SILVANA ROSSY DE BRITO');
INSERT INTO public.egresso_valido VALUES (933, NULL, '200704940018', 'SILVIA CRISTINA NUNES DAS DORES');
INSERT INTO public.egresso_valido VALUES (934, NULL, '199104940133', 'SILVIA DAS DORES RISSINO');
INSERT INTO public.egresso_valido VALUES (935, NULL, '199504940033', 'SILVIO CARLOS AZEVEDO ANDRADE');
INSERT INTO public.egresso_valido VALUES (936, NULL, '199404940035', 'SIMEAO SANTOS DAS DORES');
INSERT INTO public.egresso_valido VALUES (937, NULL, '200104940002', 'SIMONE BACELLAR LOPES');
INSERT INTO public.egresso_valido VALUES (938, 'simonefonseca@yahoo.com.br', '200304940013', 'SIMONE FONSECA FERREIRA');
INSERT INTO public.egresso_valido VALUES (939, 'simone.nara@gmail.com', '200604940014', 'SIMONE NAYARA COSTA CARNEIRO');
INSERT INTO public.egresso_valido VALUES (940, 'suelenbbrabo@gmail.com', '200804940036', 'SUELEN BRAGA BRABO');
INSERT INTO public.egresso_valido VALUES (941, 'SUELLENPSR@UFPA.BR', '200404940021', 'SUELLEN PATRICIA SILVESTRE RIBEIRO ALBERNAZ');
INSERT INTO public.egresso_valido VALUES (942, 'tacio@ufpa.br', '200204940014', 'TACIO VINICIUS BERNARDES RIBEIRO');
INSERT INTO public.egresso_valido VALUES (943, 'taina.inaie@gmail.com', '201504940007', 'TAINA INAIE DOS SANTOS DA SILVA');
INSERT INTO public.egresso_valido VALUES (944, 'tales.miranda84@gmail.com', '200704940008', 'TALES CHENE DE MIRANDA');
INSERT INTO public.egresso_valido VALUES (945, NULL, '200704940004', 'TALITA VIEIRA RIBEIRO');
INSERT INTO public.egresso_valido VALUES (946, 'talvane.glauber@gmail.com', '201104940031', 'TALVANE GLAUBER LOPES DE LIMA');
INSERT INTO public.egresso_valido VALUES (947, NULL, '199104940035', 'TAYANA UCHOA CONTE');
INSERT INTO public.egresso_valido VALUES (948, 'teo@ufpa.br', '200804940002', 'TEOFILO AUGUSTO BORDALO DE SOUZA VIEIRA');
INSERT INTO public.egresso_valido VALUES (949, NULL, '199104940103', 'TEREZA CONCEICAO AKI BARROS KANZAKI');
INSERT INTO public.egresso_valido VALUES (950, 'thales_cross@hotmail.com', '201304940014', 'THALES SILVA DE SOUSA');
INSERT INTO public.egresso_valido VALUES (951, 'dhandarah1996@gmail.com', '201404940010', 'THAYS DHANDARAH RODRIGUES SA');
INSERT INTO public.egresso_valido VALUES (952, NULL, '200304940025', 'THIAGO FONSECA DE ANDRADE');
INSERT INTO public.egresso_valido VALUES (953, 'thiago.tjas@gmail.com', '200704940006', 'THIAGO JORGE ALMEIDA DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (954, NULL, '200104940054', 'THIAGO RUBENI ALVES DA SILVA');
INSERT INTO public.egresso_valido VALUES (955, 'tsylasac@gmail.com', '201004940022', 'THIAGO SYLAS ANTUNES DA COSTA');
INSERT INTO public.egresso_valido VALUES (956, 'tiagodavi70@gmail.com', '201104940024', 'TIAGO DAVI OLIVEIRA DE ARAUJO');
INSERT INTO public.egresso_valido VALUES (957, 'netotuby@gmail.com', '201704940006', 'TUBY D OLIVEIRA NETO');
INSERT INTO public.egresso_valido VALUES (958, NULL, '200004940004', 'ULISSES MARTINS DIAS');
INSERT INTO public.egresso_valido VALUES (959, 'urielfcampos95@gmail.com', '201504940023', 'URIEL FERREIRA CAMPOS');
INSERT INTO public.egresso_valido VALUES (960, 'vagner.nogueira@gmail.com', '200404940013', 'VAGNER NOGUEIRA SILVA');
INSERT INTO public.egresso_valido VALUES (961, NULL, '199904940049', 'VALERIA FREITAS SOUSA');
INSERT INTO public.egresso_valido VALUES (962, 'valeria@ufpa.br', '199104940104', 'VALERIA GOMES DA CAMARA CORECHA BASTOS');
INSERT INTO public.egresso_valido VALUES (963, NULL, '199104940082', 'VANA DO CARMO CARVALHO PEREIRA');
INSERT INTO public.egresso_valido VALUES (964, NULL, '200004940019', 'VANDERLENE COVRE ROCHA');
INSERT INTO public.egresso_valido VALUES (965, NULL, '199104940083', 'VICTOR AMARANTE DE BARROS');
INSERT INTO public.egresso_valido VALUES (966, 'ccvem@yahoo.com.br', '200404940004', 'VICTOR ESPINDOLA MARTINS');
INSERT INTO public.egresso_valido VALUES (967, NULL, '200104940044', 'VICTOR LOURENCO GARCIA DA CUNHA');
INSERT INTO public.egresso_valido VALUES (968, 'victorlsn@gmail.com', '200904940006', 'VICTOR LUIZ SANTOS NEGRAO');
INSERT INTO public.egresso_valido VALUES (969, NULL, '199804940009', 'VINICIUS LIMA DA SILVA');
INSERT INTO public.egresso_valido VALUES (970, 'vitorlimac2@gmail.com', '200804940004', 'VITOR LIMA COELHO');
INSERT INTO public.egresso_valido VALUES (971, 'vitornovaes.cantao@gmail.com', '201704940018', 'VITOR NOVAES CANTAO');
INSERT INTO public.egresso_valido VALUES (972, 'vfeitosa86@hotmail.com', '200504940001', 'VITOR PINHEIRO FEITOSA');
INSERT INTO public.egresso_valido VALUES (973, NULL, '200104940018', 'VIVIANE SOARES GRIECO');
INSERT INTO public.egresso_valido VALUES (974, 'wagnerfelidre@gmail.com', '201704940043', 'WAGNER FELIDRE NEGRAO DA SILVA');
INSERT INTO public.egresso_valido VALUES (975, 'walissoncardosogomes@gmail.com', '201204940001', 'WALISSON CARDOSO GOMES');
INSERT INTO public.egresso_valido VALUES (976, NULL, '200504940005', 'WALLACE MICHEL PINTO LIRA');
INSERT INTO public.egresso_valido VALUES (977, 'wallacecovic@yahoo.com.br', '201404940028', 'WALLACE PACHECO PEREIRA');
INSERT INTO public.egresso_valido VALUES (978, 'walmir.psj@gmail.com', '200704940031', 'WALMIR PORTAL DOS SANTOS JUNIOR');
INSERT INTO public.egresso_valido VALUES (979, 'wnessms@hotmail.com', '200604940029', 'WANESSA MELO DA SILVA');
INSERT INTO public.egresso_valido VALUES (980, NULL, '199304940040', 'WANILSON MIRANDA DE FIGUEIREDO');
INSERT INTO public.egresso_valido VALUES (981, NULL, '199504940028', 'WANJA DANIELLE DA SILVA MOTA');
INSERT INTO public.egresso_valido VALUES (982, NULL, '199504940029', 'WASHINGTON NEVES DE ALMEIDA');
INSERT INTO public.egresso_valido VALUES (983, NULL, '199404940038', 'WEILA SHEYLA DE MELO BRITO');
INSERT INTO public.egresso_valido VALUES (984, 'fmwellson@yahoo.com.br', '200804940009', 'WELLSON SERGIO BITENCOURT DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (985, 'wendelrenann@gmail.com', '201104940017', 'WENDEL RENAN MACEDO DOS SANTOS');
INSERT INTO public.egresso_valido VALUES (986, 'wescley.fontes@gmail.com', '199804940008', 'WESCLEY PIMENTEL FONTES');
INSERT INTO public.egresso_valido VALUES (987, 'wesleyhanani@yahoo.com.br', '200104940061', 'WESLEY HANANI PINTO DO CARMO');
INSERT INTO public.egresso_valido VALUES (988, 'wevertoncordeiro@gmail.com', '200204940016', 'WEVERTON LUIS DA COSTA CORDEIRO');
INSERT INTO public.egresso_valido VALUES (989, NULL, '199104940084', 'WILLIS DO SOCORRO A DE CAMPOS');
INSERT INTO public.egresso_valido VALUES (990, 'yann.fabricio@hotmail.com', '201704940026', 'YANN FABRICIO CARDOSO DE FIGUEIREDO');
INSERT INTO public.egresso_valido VALUES (991, 'paz.yasminl@gmail.com', '201304940005', 'YASMIN LUANA SALES DA PAZ');
INSERT INTO public.egresso_valido VALUES (992, 'castelo@ufpa.br', '200504940035', 'YOSSEF GABRIEL OLIVEIRA CASTELO');
INSERT INTO public.egresso_valido VALUES (993, 'yvanbrito96@gmail.com', '201304940016', 'YVAN PEREIRA DOS SANTOS BRITO');
INSERT INTO public.egresso_valido VALUES (994, 'rabelo.lincoln@gmail.com', NULL, 'Abraham Lincoln Rabelo De Sousa');
INSERT INTO public.egresso_valido VALUES (995, 'adailtulima@gmail.com', NULL, 'ADAILTON MAGALHAES LIMA');
INSERT INTO public.egresso_valido VALUES (996, 'adalbertocmelo@gmail.com', NULL, 'Adalberto Cavalcante de Melo');
INSERT INTO public.egresso_valido VALUES (997, 'adrianne.veras@outlook.com', NULL, 'Adrianne Veras de Almeida');
INSERT INTO public.egresso_valido VALUES (998, 'alencv@gmail.com', NULL, 'Alen Costa Vieira');
INSERT INTO public.egresso_valido VALUES (999, 'allandoug@gmail.com', NULL, 'Allan Douglas Bento da Costa');
INSERT INTO public.egresso_valido VALUES (1000, 'larissa.engcomp@gmail.com', NULL, 'Ana Larissa da Silva Dias');
INSERT INTO public.egresso_valido VALUES (1001, 'andersonsoares@ufra.edu.br', NULL, 'Anderson Gregório Marques Soares');
INSERT INTO public.egresso_valido VALUES (1002, 'anderson.gmarques@gmail.com', NULL, 'Anderson Gregório Marques Soares');
INSERT INTO public.egresso_valido VALUES (1003, 'anderson_detran@hotmail.com', NULL, 'Anderson Trindade Maia');
INSERT INTO public.egresso_valido VALUES (1004, 'andre.rammos7@gmail.com', NULL, 'André de Jesus Araújo Ramos');
INSERT INTO public.egresso_valido VALUES (1005, 'andre.riker@gmail.com', NULL, 'André Figueira Riker');
INSERT INTO public.egresso_valido VALUES (1006, 'ditoneto@gmail.com', NULL, 'Benedito de Souza Ribeiro Neto');
INSERT INTO public.egresso_valido VALUES (1007, 'bfranca@unicamp.br', NULL, 'Breno Bernard Nicolau de França');
INSERT INTO public.egresso_valido VALUES (1008, 'upbrunogc@gmail.com', NULL, 'Bruno Garcia da Costa');
INSERT INTO public.egresso_valido VALUES (1009, 'britodi@gmail.com', NULL, 'Bruno Pereira Brito');
INSERT INTO public.egresso_valido VALUES (1010, 'gustavo.cbcc@gmail.com', NULL, 'Carlos Gustavo Resque dos Santos');
INSERT INTO public.egresso_valido VALUES (1011, 'takeshiyasojima@gmail.com', NULL, 'Carlos Takeshi Kudo Yasojima');
INSERT INTO public.egresso_valido VALUES (1012, 'cassio.batista.13@gmail.com', NULL, 'Cassio Trindade Batista');
INSERT INTO public.egresso_valido VALUES (1013, 'avcesar@gmail.com', NULL, 'Cesar Siqueira de Oliveira');
INSERT INTO public.egresso_valido VALUES (1014, 'claudomir.junior@ifma.edu.br', NULL, 'Claudomir Cardoso de Carvalho Junior');
INSERT INTO public.egresso_valido VALUES (1015, 'dom.clay@yahoo.com.br', NULL, 'Clay Palmeira da Silva');
INSERT INTO public.egresso_valido VALUES (1016, 'cleytondim@ufpa.br', NULL, 'Cleyton Aparecido Dim');
INSERT INTO public.egresso_valido VALUES (1017, 'cynthya.telles@gmail.com', NULL, 'Cynthya Letícia Teles De Oliveira');
INSERT INTO public.egresso_valido VALUES (1018, 'daniel.leal.souza@gmail.com', NULL, 'Daniel Leal Souza');
INSERT INTO public.egresso_valido VALUES (1019, 'lenomeireles@gmail.com', NULL, 'Danileno Meireles do Rosario');
INSERT INTO public.egresso_valido VALUES (1020, 'diegoaires@gmail.com', NULL, 'Diego Bento Aires Teixeira');
INSERT INTO public.egresso_valido VALUES (1021, 'hortencio1983@gmail.com', NULL, 'Diego Hortêncio dos Santos');
INSERT INTO public.egresso_valido VALUES (1022, 'diegoabreuengcomp@gmail.com', NULL, 'Diego Oliveira Abreu');
INSERT INTO public.egresso_valido VALUES (1023, 'eddasjbertrand@gmail.com', NULL, 'Eddas Josue Bertrand Martinez');
INSERT INTO public.egresso_valido VALUES (1024, 'edianfranklin@gmail.com', NULL, 'Edian Franklin Franco De Los Santos');
INSERT INTO public.egresso_valido VALUES (1025, 'edinaldo.laroque@gmail.com', NULL, 'Edinaldo João Costa de La-roque');
INSERT INTO public.egresso_valido VALUES (1026, 'koitiyasojima@gmail.com', NULL, 'Edson Koiti Kudo Yasojima');
INSERT INTO public.egresso_valido VALUES (1027, 'eduardolima.ufpa@gmail.com', NULL, 'Eduardo Gabriel Lima da Silva');
INSERT INTO public.egresso_valido VALUES (1028, 'marquesraiol@gmail.com', NULL, 'Eduardo Paulo Marques Raiol');
INSERT INTO public.egresso_valido VALUES (1029, 'ejrueda95g@gmail.com', NULL, 'Edwin Jahir Rueda Rojas');
INSERT INTO public.egresso_valido VALUES (1030, 'elismclean@gmail.com', NULL, 'Elisiane Monteiro Soares');
INSERT INTO public.egresso_valido VALUES (1031, 'msoares.elziane@gmail.com', NULL, 'Elziane Monteiro Soares');
INSERT INTO public.egresso_valido VALUES (1032, 'emanuel.montero.e@gmail.com', NULL, 'Emanuel Montero Espaillat');
INSERT INTO public.egresso_valido VALUES (1033, 'erick.c.modesto@gmail.com', NULL, 'Erick Modesto Campos');
INSERT INTO public.egresso_valido VALUES (1034, 'ericsonsarmento+ppgcc@gmail.com', NULL, 'Ericson Sarmento Costa');
INSERT INTO public.egresso_valido VALUES (1035, 'estevaosantos265@gmail.com', NULL, 'Estêvão Damasceno Santos');
INSERT INTO public.egresso_valido VALUES (1036, 'fabiomm@ufmg.br', NULL, 'Fabio Malcher Miranda');
INSERT INTO public.egresso_valido VALUES (1037, 'fabioaraujo289@gmail.com', NULL, 'Fabio Rocha de Araujo');
INSERT INTO public.egresso_valido VALUES (1038, 'fabriciogarcia@ufpa.br', NULL, 'Fabricio wickey da silva garcia');
INSERT INTO public.egresso_valido VALUES (1039, 'fabriciowsgarcia@gmail.com', NULL, 'Fabricio Wickey da Silva Garcia');
INSERT INTO public.egresso_valido VALUES (1040, 'felipearaujo289@gmail.com', NULL, 'Felipe Rocha de Araújo');
INSERT INTO public.egresso_valido VALUES (1041, 'fernnf@gmail.com', NULL, 'Fernando Nazareno Nascimento Farias');
INSERT INTO public.egresso_valido VALUES (1042, 'gilsonrocha@gmail.com', NULL, 'Gilson Rocha Silva');
INSERT INTO public.egresso_valido VALUES (1043, 'hernan.laguado@gmail.com', NULL, 'Hernan Dario Carreño Laguado');
INSERT INTO public.egresso_valido VALUES (1044, 'hilton.castro@ifap.edu.br', NULL, 'Hilton Prado de Castro Junior');
INSERT INTO public.egresso_valido VALUES (1045, 'hugoblim@gmail.com', NULL, 'Hugo Brito Lima');
INSERT INTO public.egresso_valido VALUES (1046, 'iagolmedeiros@gmail.com', NULL, 'Iago Lins de Medeiros');
INSERT INTO public.egresso_valido VALUES (1047, 'igorpnatal@gmail.com', NULL, 'Igor da Penha Natal');
INSERT INTO public.egresso_valido VALUES (1048, 'IGGOR16@GMAIL.COM', NULL, 'Igor Ernesto Ferreira Costa');
INSERT INTO public.egresso_valido VALUES (1049, 'isadoramsantos@gmail.com', NULL, 'Isadora Mendes dos Santos');
INSERT INTO public.egresso_valido VALUES (1050, 'ivoabreu94@gmail.com', NULL, 'Ivo de Abreu Araújo');
INSERT INTO public.egresso_valido VALUES (1051, 'jadielly.oliveira@gmail.com', NULL, 'Jadielly Fernandes Oliveira Treccani');
INSERT INTO public.egresso_valido VALUES (1052, 'jwagner28@gmail.com', NULL, 'Jailton Wagner Rodrigues Tavares');
INSERT INTO public.egresso_valido VALUES (1053, 'jair.jr.j2@gmail.com', NULL, 'Jair da Silva Ferreira Junior');
INSERT INTO public.egresso_valido VALUES (1054, 'jeanarouche@gmail.com', NULL, 'Jean Carlos Arouche Freire');
INSERT INTO public.egresso_valido VALUES (1055, 'jeffersonmorais@gmail.com', NULL, 'Jefferson Magalhães de Morais');
INSERT INTO public.egresso_valido VALUES (1056, 'joahannes@gmail.com', NULL, 'Joahannes Bruno Dias da Costa');
INSERT INTO public.egresso_valido VALUES (1057, 'salvatti@gmail.com', NULL, 'João Júlio Salvatti Neto');
INSERT INTO public.egresso_valido VALUES (1058, 'jonathasp6@gmail.com', NULL, 'Jonathas Pinheiro Trindade');
INSERT INTO public.egresso_valido VALUES (1059, 'jose.sousa.filho@gmail.com', NULL, 'José de Sousa Ribeiro Filho');
INSERT INTO public.egresso_valido VALUES (1060, 'joseflaviojr@gmail.com', NULL, 'José Flávio de Souza Dias Júnior');
INSERT INTO public.egresso_valido VALUES (1061, 'furtado@unifap.br', NULL, 'Julio Cezar Costa Furtado');
INSERT INTO public.egresso_valido VALUES (1062, 'k_info_04@yahoo.com.br', NULL, 'Karla Suely Diniz da Costa');
INSERT INTO public.egresso_valido VALUES (1063, 'larissamonteiropimentel@gmail.com', NULL, 'Larissa Monteiro Pimentel');
INSERT INTO public.egresso_valido VALUES (1064, 'patricia.souza@ufra.edu.br', NULL, 'Lena Patrícia Souza Rodrigues');
INSERT INTO public.egresso_valido VALUES (1065, 'lennonsfurtado@gmail.com', NULL, 'Lennon Sales Furtado');
INSERT INTO public.egresso_valido VALUES (1066, 'hamadaleonardo@gmail.com', NULL, 'Leonardo Hirokazu de Souza Hamada');
INSERT INTO public.egresso_valido VALUES (1067, 'matakura@gmail.com', NULL, 'Leonardo Sarraff Nunes de Moraes');
INSERT INTO public.egresso_valido VALUES (1068, 'lucas.melo04@gmail.com', NULL, 'Lucas de Melo Silva');
INSERT INTO public.egresso_valido VALUES (1069, 'lucelia.matsumoto@serpro.gov.br', NULL, 'Lucelia Pereira Goncalves');
INSERT INTO public.egresso_valido VALUES (1070, 'lu.abdon.si@gmail.com', NULL, 'Luciana Abdon Almeida');
INSERT INTO public.egresso_valido VALUES (1071, 'duartelucianoribeiro@gmail.com', NULL, 'LUCIANO RIBEIRO DUARTE');
INSERT INTO public.egresso_valido VALUES (1072, 'cellemota@gmail.com', NULL, 'Marcelle Pereira Mota');
INSERT INTO public.egresso_valido VALUES (1073, 'marciapantoja13@gmail.com', NULL, 'Marcia Priscila Furtado Pantoja');
INSERT INTO public.egresso_valido VALUES (1074, 'goes.nascimento@gmail.com', NULL, 'Marcio Goes do Nascimento');
INSERT INTO public.egresso_valido VALUES (1075, 'mjmponte@gmail.com', NULL, 'Márcio José Moutinho da Ponte');
INSERT INTO public.egresso_valido VALUES (1076, 'ma.balieiro@gmail.com', NULL, 'Marco Antonio Balieiro Da Silva');
INSERT INTO public.egresso_valido VALUES (1077, 'marcos.seruffo@gmail.com', NULL, 'Marcos César da Rocha Seruffo');
INSERT INTO public.egresso_valido VALUES (1078, 'carvalhonazario@yahoo.com.br', NULL, 'Marcos Felipe Carvalho Nazario');
INSERT INTO public.egresso_valido VALUES (1079, 'mm.marisamoreno@gmail.com', NULL, 'Marisa Cristina Moreno Alves de Andrade');
INSERT INTO public.egresso_valido VALUES (1080, 'mauricio.ronny@gmail.com', NULL, 'Mauricio Ronny de Almeida Souza');
INSERT INTO public.egresso_valido VALUES (1081, 'maurolarrat@ufpa.br', NULL, 'Mauro Rodrigo Larrat Frota e Silva');
INSERT INTO public.egresso_valido VALUES (1082, 'mayfigueiredo@gmail.com', NULL, 'Mayara Costa Figueiredo');
INSERT INTO public.egresso_valido VALUES (1083, 'mireillepm@gmail.com', NULL, 'Mireille Pinheiro Moreira Balieiro');
INSERT INTO public.egresso_valido VALUES (1084, 'mulgsm@gmail.com', NULL, 'Müller Gabriel Da Silva Miranda');
INSERT INTO public.egresso_valido VALUES (1085, 'nagila.ufpa@gmail.com', NULL, 'Nágila Natália Torres Vale');
INSERT INTO public.egresso_valido VALUES (1086, 'engenilk@gmail.com', NULL, 'Nielsen Alves Gonçalves');
INSERT INTO public.egresso_valido VALUES (1087, 'olavo.nylander@gmail.com', NULL, 'Olavo Nylander Brito Neto');
INSERT INTO public.egresso_valido VALUES (1088, 'piagodinho@gmail.com', NULL, 'Paulo Igor Alves Godinho');
INSERT INTO public.egresso_valido VALUES (1089, 'paulo.cardoso12@gmail.com', NULL, 'Paulo Vitor Rodrigues Cardoso');
INSERT INTO public.egresso_valido VALUES (1090, 'pedroabg@gmail.com', NULL, 'Pedro Alberto Bento Gomes');
INSERT INTO public.egresso_valido VALUES (1091, 'pedro.cumino@gmail.com', NULL, 'Pedro Luiz Magalhães Cumino');
INSERT INTO public.egresso_valido VALUES (1092, 'pedro.montibeler@gmail.com', NULL, 'Pedro Montibeler Salvador');
INSERT INTO public.egresso_valido VALUES (1093, 'phelipefeio09@gmail.com', NULL, 'Phelipe Luiz Dias Feio');
INSERT INTO public.egresso_valido VALUES (1094, 'rafael.feito@gmail.com', NULL, 'Rafael Martins Feitosa');
INSERT INTO public.egresso_valido VALUES (1095, 'rafesteves@gmail.com', NULL, 'Rafael Pereira Esteves');
INSERT INTO public.egresso_valido VALUES (1096, 'rafaelstnoliveira@gmail.com', NULL, 'Rafael Santana Oliveira');
INSERT INTO public.egresso_valido VALUES (1097, 'reinald28@gmail.com', NULL, 'Reinaldo Junior Lopes Cardoso');
INSERT INTO public.egresso_valido VALUES (1098, 'renatadcascaes@gmail.com', NULL, 'Renata Kelly Dantas Cascaes');
INSERT INTO public.egresso_valido VALUES (1099, 'renpina@gmail.com', NULL, 'Renato de Pina Ferreira');
INSERT INTO public.egresso_valido VALUES (1100, 'renatohidaka@gmail.com', NULL, 'Renato Hidaka Torres');
INSERT INTO public.egresso_valido VALUES (1101, 'rennanmaia@gmail.com', NULL, 'Rennan Jose Maia da Silva');
INSERT INTO public.egresso_valido VALUES (1102, 'ricardorodrigomm@gmail.com', NULL, 'Ricardo Rodrigo Marinho Melo');
INSERT INTO public.egresso_valido VALUES (1103, 'roberto.yuri.franco@gmail.com', NULL, 'Roberto Yuri da Silva Franco');
INSERT INTO public.egresso_valido VALUES (1104, 'rodrigo.sad.lima@gmail.com', NULL, 'Rodrigo Santos do Amor Divino Lima');
INSERT INTO public.egresso_valido VALUES (1105, 'romulo.s.pinheiro@gmail.com', NULL, 'Romulo Silva Pinheiro');
INSERT INTO public.egresso_valido VALUES (1106, 'sandrodpm@gmail.com', NULL, 'Sandro de Paula Mendonça ');
INSERT INTO public.egresso_valido VALUES (1107, 'maru.merces18@gmail.com', NULL, 'Sara das Merces Silva');
INSERT INTO public.egresso_valido VALUES (1108, 'saulberardo@gmail.com', NULL, 'Saul Campos Berardo');
INSERT INTO public.egresso_valido VALUES (1109, 's.rodriguescn@gmail.com', NULL, 'sebastião rodrigues da costa neto');
INSERT INTO public.egresso_valido VALUES (1110, 'silverio@ufpa.br', NULL, 'Silvério Sirotheau Corrêa Neto');
INSERT INTO public.egresso_valido VALUES (1111, 'ssirotheau@gmail.com', NULL, 'Silvério Sirotheau Corrêa Neto');
INSERT INTO public.egresso_valido VALUES (1112, 'suelene.correa@ifpa.edu.br', NULL, 'Suelene de Jesus do Carmo Corrêa ');
INSERT INTO public.egresso_valido VALUES (1113, 'tcoqueiro@hotmail.com', NULL, 'Thiago Antônio Sidônio Coqueiro');
INSERT INTO public.egresso_valido VALUES (1114, 'vagner@ufpa.br', NULL, 'Vagner de Brito Nascimento');
INSERT INTO public.egresso_valido VALUES (1115, 'vitor@unifesspa.edu.br', NULL, 'Vitor de Souza Castro');
INSERT INTO public.egresso_valido VALUES (1116, 'walbertcm@gmail.com', NULL, 'Walbert Cunha Monteiro');
INSERT INTO public.egresso_valido VALUES (1117, 'wendymgaleno@gmail.com', NULL, 'Wendy Mendes Galeno');
INSERT INTO public.egresso_valido VALUES (1118, 'wilsonluiz.dsf@gmail.com', NULL, 'Wilson Luiz da Silva Farias');
INSERT INTO public.egresso_valido VALUES (1119, 'yurilimacavalcante@gmail.com', NULL, 'Yuri Lima Cavalcante');
INSERT INTO public.egresso_valido VALUES (1120, 'yuri.nassar@gmail.com', NULL, 'Yuri Santa Rosa Nassar dos Santos');


--
-- TOC entry 3725 (class 0 OID 142424)
-- Dependencies: 240
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.empresa VALUES (1, true, 1, '2023-07-02 12:35:19.235984', NULL, NULL, false, 'ABEU - CENTRO UNIVERSITÁRIO (UNIABEU)', 1);
INSERT INTO public.empresa VALUES (2, true, 1, '2023-07-02 12:35:19.237495', NULL, NULL, false, 'ACADEMIA DE POLÍCIA MILITAR DE MINAS GERAIS (APM)', 2);
INSERT INTO public.empresa VALUES (3, true, 1, '2023-07-02 12:35:19.238864', NULL, NULL, false, 'ACADEMIA JUDICIAL DO TRIBUNAL DE JUSTIÇA DE SANTA CATARINA (AJ)', 3);
INSERT INTO public.empresa VALUES (4, true, 1, '2023-07-02 12:35:19.240169', NULL, NULL, false, 'ACADEMIA MILITAR DAS AGULHAS NEGRAS (AMAN)', 4);
INSERT INTO public.empresa VALUES (5, true, 1, '2023-07-02 12:35:19.241598', NULL, NULL, false, 'ACADEMIA NACIONAL DE POLÍCIA - ANP (ANP)', 5);
INSERT INTO public.empresa VALUES (6, true, 1, '2023-07-02 12:35:19.249169', NULL, NULL, false, 'AJES - FACULDADE DO VALE DO JURUENA (AJES)', 6);
INSERT INTO public.empresa VALUES (7, true, 1, '2023-07-02 12:35:19.250494', NULL, NULL, false, 'ALFA - FACULDADE DE TEÓFILO OTONI (ALFA - TO)', 7);
INSERT INTO public.empresa VALUES (8, true, 1, '2023-07-02 12:35:19.251667', NULL, NULL, false, 'BRAIN BUSINESS SCHOOL (BRAIN)', 8);
INSERT INTO public.empresa VALUES (9, true, 1, '2023-07-02 12:35:19.252831', NULL, NULL, false, 'CEDDU - CENTRO DE ENSINO SUPERIOR (CEDDU)', 9);
INSERT INTO public.empresa VALUES (10, true, 1, '2023-07-02 12:35:19.254052', NULL, NULL, false, 'CENAC - CENTRO DE ENSINO NACIONAL', 10);
INSERT INTO public.empresa VALUES (11, true, 1, '2023-07-02 12:35:19.255411', NULL, NULL, false, 'CENTRO DE EDUCAÇÃO TÉCNICA DA UTRAMIG (UTRAMIG)', 2);
INSERT INTO public.empresa VALUES (12, true, 1, '2023-07-02 12:35:19.264545', NULL, NULL, false, 'CENTRO DE EDUCAÇÃO TECNOLÓGICO DA FUNDAÇÃO INDAIATUBANA DE EDUCAÇÃO E CULTURA (FIEC)', 11);
INSERT INTO public.empresa VALUES (13, true, 1, '2023-07-02 12:35:19.265967', NULL, NULL, false, 'CENTRO DE ENSINO E PESQUISA DO PRÓ-CARDÍACO (PROCEP)', 12);
INSERT INTO public.empresa VALUES (14, true, 1, '2023-07-02 12:35:19.267273', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR CESUL (CESUL)', 13);
INSERT INTO public.empresa VALUES (15, true, 1, '2023-07-02 12:35:19.268616', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE ALTAMIRA', 14);
INSERT INTO public.empresa VALUES (16, true, 1, '2023-07-02 12:35:19.269942', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE ARCOVERDE (CESA)', 15);
INSERT INTO public.empresa VALUES (17, true, 1, '2023-07-02 12:35:19.271046', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE BACABEIRA (CESBA)', 16);
INSERT INTO public.empresa VALUES (18, true, 1, '2023-07-02 12:35:19.278444', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE CATALÃO', 17);
INSERT INTO public.empresa VALUES (19, true, 1, '2023-07-02 12:35:19.279864', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE CONSELHEIRO LAFAIETE (CES-CL)', 18);
INSERT INTO public.empresa VALUES (20, true, 1, '2023-07-02 12:35:19.281195', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE DIVINÓPOLIS', 19);
INSERT INTO public.empresa VALUES (21, true, 1, '2023-07-02 12:35:19.282523', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE ILHÉUS (CESUPI)', 20);
INSERT INTO public.empresa VALUES (22, true, 1, '2023-07-02 12:35:19.28368', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE JATAÍ (CESUT)', 21);
INSERT INTO public.empresa VALUES (23, true, 1, '2023-07-02 12:35:19.285083', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE LORENA', 22);
INSERT INTO public.empresa VALUES (24, true, 1, '2023-07-02 12:35:19.294203', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE PALMAS (CESUP)', 23);
INSERT INTO public.empresa VALUES (25, true, 1, '2023-07-02 12:35:19.295581', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE SERRA DOURADA', 22);
INSERT INTO public.empresa VALUES (26, true, 1, '2023-07-02 12:35:19.296928', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE SETE LAGOAS', 24);
INSERT INTO public.empresa VALUES (27, true, 1, '2023-07-02 12:35:19.298257', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE VITÓRIA (CESV)', 25);
INSERT INTO public.empresa VALUES (28, true, 1, '2023-07-02 12:35:19.29943', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DO AMAPÁ (CEAP)', 26);
INSERT INTO public.empresa VALUES (29, true, 1, '2023-07-02 12:35:19.300651', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DO VALE DO PARNAÍBA (CESVALE)', 27);
INSERT INTO public.empresa VALUES (30, true, 1, '2023-07-02 12:35:19.308071', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DO VALE SÃO FRANCISCO (CESVASF)', 28);
INSERT INTO public.empresa VALUES (31, true, 1, '2023-07-02 12:35:19.309467', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR RIOGRANDENSE (CESURG)', 29);
INSERT INTO public.empresa VALUES (32, true, 1, '2023-07-02 12:35:19.310835', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR RIOGRANDENSE GUAPORE (CESURG GUAPORE)', 30);
INSERT INTO public.empresa VALUES (33, true, 1, '2023-07-02 12:35:19.31216', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR SOCIESC DE JARAGUÁ DO SUL', 31);
INSERT INTO public.empresa VALUES (34, true, 1, '2023-07-02 12:35:19.313459', NULL, NULL, false, 'CENTRO DE ENSINO UNIFICADO DO PIAUÍ (CEUPI)', 27);
INSERT INTO public.empresa VALUES (35, true, 1, '2023-07-02 12:35:19.314589', NULL, NULL, false, 'CENTRO DE ESTUDOS DE PESSOAL E FORTE DUQUE DE CAXIAS (CEP)', 12);
INSERT INTO public.empresa VALUES (36, true, 1, '2023-07-02 12:35:19.323955', NULL, NULL, false, 'CENTRO DE ESTUDOS EM DIREITO E NEGÓCIOS', 2);
INSERT INTO public.empresa VALUES (37, true, 1, '2023-07-02 12:35:19.325627', NULL, NULL, false, 'CENTRO DE ESTUDOS SUPERIORES APRENDIZ (CESA)', 32);
INSERT INTO public.empresa VALUES (38, true, 1, '2023-07-02 12:35:19.327118', NULL, NULL, false, 'CENTRO DE ESTUDOS SUPERIORES DE JATAÍ', 21);
INSERT INTO public.empresa VALUES (39, true, 1, '2023-07-02 12:35:19.328633', NULL, NULL, false, 'CENTRO DE FORMAÇÃO, TREINAMENTO E APERFEIÇOAMENTO (CEFOR)', 5);
INSERT INTO public.empresa VALUES (40, true, 1, '2023-07-02 12:35:19.330154', NULL, NULL, false, 'CENTRO DE INSTRUÇÃO DE AVIAÇÃO DO EXÉRCITO (CIAVEX)', 33);
INSERT INTO public.empresa VALUES (41, true, 1, '2023-07-02 12:35:19.331736', NULL, NULL, false, 'CENTRO DE INSTRUÇÃO DE GUERRA ELETRÔNICA (CIGE)', 5);
INSERT INTO public.empresa VALUES (42, true, 1, '2023-07-02 12:35:19.338595', NULL, NULL, false, 'CENTRO DE MEDICINA ESPECIALIZADA, PESQUISA E ENSINO (CEMEPE)', 2);
INSERT INTO public.empresa VALUES (43, true, 1, '2023-07-02 12:35:19.340231', NULL, NULL, false, 'CENTRO FEDERAL DE EDUCAÇÃO TECNOLÓGICA CELSO SUCKOW DA FONSECA (CEFET/RJ)', 12);
INSERT INTO public.empresa VALUES (44, true, 1, '2023-07-02 12:35:19.341517', NULL, NULL, false, 'CENTRO FEDERAL DE EDUCAÇÃO TECNOLÓGICA DE MINAS GERAIS (CEFET/MG)', 2);
INSERT INTO public.empresa VALUES (45, true, 1, '2023-07-02 12:35:19.342866', NULL, NULL, false, 'CENTRO REGIONAL UNIVERSITÁRIO DE ESPÍRITO SANTO DO PINHAL (UNIPINHAL)', 34);
INSERT INTO public.empresa VALUES (46, true, 1, '2023-07-02 12:35:19.344187', NULL, NULL, false, 'CENTRO SUPERIOR DE ENSINO E PESQUISA DE MACHADO (CESEP)', 35);
INSERT INTO public.empresa VALUES (47, true, 1, '2023-07-02 12:35:19.345579', NULL, NULL, false, 'CENTRO SUPERIOR DE ESTUDOS JURÍDICOS CARLOS DRUMMOND DE ANDRADE (CSEJCDA)', 8);
INSERT INTO public.empresa VALUES (48, true, 1, '2023-07-02 12:35:19.355001', NULL, NULL, false, 'CENTRO TÉCNICO-EDUCACIONAL SUPERIOR DO OESTE PARANAENSE (CTESOP)', 36);
INSERT INTO public.empresa VALUES (49, true, 1, '2023-07-02 12:35:19.356988', NULL, NULL, false, 'CENTRO UNIVERSIÁRIO UNIFTC', 37);
INSERT INTO public.empresa VALUES (50, true, 1, '2023-07-02 12:35:19.358747', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ACADEMIA (UNIACADEMIA)', 38);
INSERT INTO public.empresa VALUES (51, true, 1, '2023-07-02 12:35:19.360186', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ADVENTISTA DE SÃO PAULO (UNASP)', 8);
INSERT INTO public.empresa VALUES (52, true, 1, '2023-07-02 12:35:19.361517', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AESO - BARROS MELO (UNIAESO)', 39);
INSERT INTO public.empresa VALUES (53, true, 1, '2023-07-02 12:35:19.362818', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AGES (UNIAGES)', 40);
INSERT INTO public.empresa VALUES (54, true, 1, '2023-07-02 12:35:19.369867', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ALFREDO NASSER (UNIFAN)', 41);
INSERT INTO public.empresa VALUES (55, true, 1, '2023-07-02 12:35:19.371462', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ÁLVARES PENTEADO (FECAP)', 8);
INSERT INTO public.empresa VALUES (56, true, 1, '2023-07-02 12:35:19.373039', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ALVES FARIA (UNIALFA)', 42);
INSERT INTO public.empresa VALUES (57, true, 1, '2023-07-02 12:35:19.374678', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AMPARENSE (UNIFIA)', 43);
INSERT INTO public.empresa VALUES (58, true, 1, '2023-07-02 12:35:19.376144', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGÜERA (UNIFIAN)', 44);
INSERT INTO public.empresa VALUES (59, true, 1, '2023-07-02 12:35:19.377707', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA DE FORTALEZA (UNIPITÁGORAS)', 45);
INSERT INTO public.empresa VALUES (60, true, 1, '2023-07-02 12:35:19.387136', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA DE MARABÁ', 46);
INSERT INTO public.empresa VALUES (61, true, 1, '2023-07-02 12:35:19.388859', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA DE SÃO PAULO', 8);
INSERT INTO public.empresa VALUES (62, true, 1, '2023-07-02 12:35:19.390455', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS AMPLI', 47);
INSERT INTO public.empresa VALUES (63, true, 1, '2023-07-02 12:35:19.392065', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS UNOPAR DE CAMPO GRANDE', 48);
INSERT INTO public.empresa VALUES (64, true, 1, '2023-07-02 12:35:19.393378', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS UNOPAR DE NITERÓI (UNIAN-RJ)', 49);
INSERT INTO public.empresa VALUES (65, true, 1, '2023-07-02 12:35:19.394794', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANTÔNIO EUFRÁSIO DE TOLEDO DE PRESIDENTE PRUDENTE - TOLEDO PRUDENTE (TOLEDO PRUDENTE)', 50);
INSERT INTO public.empresa VALUES (66, true, 1, '2023-07-02 12:35:19.401799', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO APARÍCIO CARVALHO', 51);
INSERT INTO public.empresa VALUES (67, true, 1, '2023-07-02 12:35:19.40319', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ARAGUAIA (UNIARAGUAIA)', 42);
INSERT INTO public.empresa VALUES (68, true, 1, '2023-07-02 12:35:19.404498', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ARMANDO ALVARES PENTEADO (FA-FAAP)', 8);
INSERT INTO public.empresa VALUES (69, true, 1, '2023-07-02 12:35:19.405825', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ARNALDO HORÁCIO FERREIRA', 52);
INSERT INTO public.empresa VALUES (70, true, 1, '2023-07-02 12:35:19.407176', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ARTHUR SÁ EARP NETO (UNIFASE)', 53);
INSERT INTO public.empresa VALUES (71, true, 1, '2023-07-02 12:35:19.408373', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ASSIS GURGACZ (FAG)', 54);
INSERT INTO public.empresa VALUES (72, true, 1, '2023-07-02 12:35:19.417763', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ASSUNÇÃO (UNIFAI)', 8);
INSERT INTO public.empresa VALUES (73, true, 1, '2023-07-02 12:35:19.419192', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ATENAS (UNIATENAS)', 55);
INSERT INTO public.empresa VALUES (74, true, 1, '2023-07-02 12:35:19.420527', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ATENEU', 45);
INSERT INTO public.empresa VALUES (75, true, 1, '2023-07-02 12:35:19.42186', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AUGUSTO MOTTA (UNISUAM)', 12);
INSERT INTO public.empresa VALUES (76, true, 1, '2023-07-02 12:35:19.423252', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AUTÔNOMO DO BRASIL (UNIBRASIL)', 56);
INSERT INTO public.empresa VALUES (77, true, 1, '2023-07-02 12:35:19.424759', NULL, NULL, false, 'CENTRO UNIVERSITARIO AVANTIS (UNIAVAN)', 57);
INSERT INTO public.empresa VALUES (78, true, 1, '2023-07-02 12:35:19.432043', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BARÃO DE MAUÁ (CBM)', 58);
INSERT INTO public.empresa VALUES (79, true, 1, '2023-07-02 12:35:19.433329', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BARRIGA VERDE (UNIBAVE)', 59);
INSERT INTO public.empresa VALUES (80, true, 1, '2023-07-02 12:35:19.43467', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BELAS ARTES DE SÃO PAULO (FEBASP)', 8);
INSERT INTO public.empresa VALUES (81, true, 1, '2023-07-02 12:35:19.435994', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BRASILEIRO (UNIBRA)', 60);
INSERT INTO public.empresa VALUES (82, true, 1, '2023-07-02 12:35:19.437163', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BRASÍLIA DO ESTADO DE GOIÁS (UNIBRASÍLIA)', 61);
INSERT INTO public.empresa VALUES (83, true, 1, '2023-07-02 12:35:19.438438', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BRAZ CUBAS', 62);
INSERT INTO public.empresa VALUES (84, true, 1, '2023-07-02 12:35:19.447931', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CAMBURY (UNICAMBURY)', 42);
INSERT INTO public.empresa VALUES (85, true, 1, '2023-07-02 12:35:19.449581', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CAMPO LIMPO PAULISTA ( UNIFACCAMP)', 63);
INSERT INTO public.empresa VALUES (86, true, 1, '2023-07-02 12:35:19.450888', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CAMPO REAL', 64);
INSERT INTO public.empresa VALUES (87, true, 1, '2023-07-02 12:35:19.452224', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CAMPOS DE ANDRADE (UNIANDRADE)', 56);
INSERT INTO public.empresa VALUES (88, true, 1, '2023-07-02 12:35:19.453564', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CARLOS DRUMMOND DE ANDRADE (UNIDRUMMOND)', 8);
INSERT INTO public.empresa VALUES (89, true, 1, '2023-07-02 12:35:19.454689', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CASTELO BRANCO (UNICB)', 65);
INSERT INTO public.empresa VALUES (90, true, 1, '2023-07-02 12:35:19.461657', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATHEDRAL', 66);
INSERT INTO public.empresa VALUES (91, true, 1, '2023-07-02 12:35:19.4632', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATÓLICA DE QUIXADÁ (UNICATÓLICA)', 67);
INSERT INTO public.empresa VALUES (92, true, 1, '2023-07-02 12:35:19.464528', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO - CATÓLICA DE SANTA CATARINA EM JARAGUÁ DO SUL (CATÓLICA EM JARAGUÁ )', 31);
INSERT INTO public.empresa VALUES (93, true, 1, '2023-07-02 12:35:19.465849', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO - CATÓLICA DE SANTA CATARINA EM JOINVILLE (CATÓLICA EM JOINVILE)', 68);
INSERT INTO public.empresa VALUES (94, true, 1, '2023-07-02 12:35:19.467214', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATÓLICA DO LESTE DE MINAS GERAIS (UNILESTE)', 69);
INSERT INTO public.empresa VALUES (95, true, 1, '2023-07-02 12:35:19.468613', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATÓLICA DO TOCANTINS (UNICATÓLICA)', 23);
INSERT INTO public.empresa VALUES (96, true, 1, '2023-07-02 12:35:19.478033', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATÓLICO SALESIANO AUXILIUM (UNISALESIANO)', 70);
INSERT INTO public.empresa VALUES (97, true, 1, '2023-07-02 12:35:19.479467', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CELSO LISBOA (UCL)', 12);
INSERT INTO public.empresa VALUES (98, true, 1, '2023-07-02 12:35:19.480804', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CENECISTA DE OSÓRIO (UNICNEC)', 71);
INSERT INTO public.empresa VALUES (99, true, 1, '2023-07-02 12:35:19.482135', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CENTRAL PAULISTA (UNICEP)', 72);
INSERT INTO public.empresa VALUES (100, true, 1, '2023-07-02 12:35:19.483521', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CESMAC (CESMAC)', 73);
INSERT INTO public.empresa VALUES (101, true, 1, '2023-07-02 12:35:19.484872', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CESUCA', 74);
INSERT INTO public.empresa VALUES (102, true, 1, '2023-07-02 12:35:19.492187', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CEUNI - FAMETRO (FAMETRO)', 75);
INSERT INTO public.empresa VALUES (103, true, 1, '2023-07-02 12:35:19.493694', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CHRISTUS (UNICHRISTUS)', 45);
INSERT INTO public.empresa VALUES (104, true, 1, '2023-07-02 12:35:19.495194', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CIDADE VERDE (UNICV)', 76);
INSERT INTO public.empresa VALUES (105, true, 1, '2023-07-02 12:35:19.496522', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CNEC DE BENTO GONÇALVES', 77);
INSERT INTO public.empresa VALUES (106, true, 1, '2023-07-02 12:35:19.498027', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CURITIBA (UNICURITIBA)', 56);
INSERT INTO public.empresa VALUES (107, true, 1, '2023-07-02 12:35:19.499156', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA AMAZÔNIA (UNAMA)', 78);
INSERT INTO public.empresa VALUES (108, true, 1, '2023-07-02 12:35:19.508556', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA AMAZÔNIA (UNIESAMAZ)', 79);
INSERT INTO public.empresa VALUES (109, true, 1, '2023-07-02 12:35:19.509994', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL DE BARRETOS (UNIFEB)', 80);
INSERT INTO public.empresa VALUES (110, true, 1, '2023-07-02 12:35:19.511331', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL GUAXUPÉ (UNIFEG)', 81);
INSERT INTO public.empresa VALUES (111, true, 1, '2023-07-02 12:35:19.512682', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL INACIANA PE SABÓIA DE MEDEIROS (FEI)', 82);
INSERT INTO public.empresa VALUES (112, true, 1, '2023-07-02 12:35:19.514012', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO HERMINIO OMETTO (FHO)', 83);
INSERT INTO public.empresa VALUES (113, true, 1, '2023-07-02 12:35:19.515433', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA GRANDE DOURADOS (UNIGRAN)', 84);
INSERT INTO public.empresa VALUES (114, true, 1, '2023-07-02 12:35:19.522391', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA GRANDE FORTALEZA (UNIGRANDE)', 45);
INSERT INTO public.empresa VALUES (115, true, 1, '2023-07-02 12:35:19.524001', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA INDÚSTRIA (UNINDUS)', 85);
INSERT INTO public.empresa VALUES (116, true, 1, '2023-07-02 12:35:19.525476', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA REGIÃO DA CAMPANHA', 86);
INSERT INTO public.empresa VALUES (117, true, 1, '2023-07-02 12:35:19.526803', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DAS AMÉRICAS (CAM)', 8);
INSERT INTO public.empresa VALUES (118, true, 1, '2023-07-02 12:35:19.528133', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA SERRA GAÚCHA (FSG)', 87);
INSERT INTO public.empresa VALUES (119, true, 1, '2023-07-02 12:35:19.529522', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DAS FACULDADES ASSOCIADAS DE ENSINO - FAE (UNIFAE)', 88);
INSERT INTO public.empresa VALUES (120, true, 1, '2023-07-02 12:35:19.538057', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DAS FACULDADES INTEGRADAS DE OURINHOS (UNIFIO)', 89);
INSERT INTO public.empresa VALUES (121, true, 1, '2023-07-02 12:35:19.539597', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DAS FACULDADES METROPOLITANAS UNIDAS (FMU)', 8);
INSERT INTO public.empresa VALUES (122, true, 1, '2023-07-02 12:35:19.541252', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA VITÓRIA DE SANTO ANTÃO (UNIVISA)', 90);
INSERT INTO public.empresa VALUES (123, true, 1, '2023-07-02 12:35:19.542926', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ADAMANTINA (FAI)', 91);
INSERT INTO public.empresa VALUES (124, true, 1, '2023-07-02 12:35:19.544399', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ARARAS - (UNAR)', 83);
INSERT INTO public.empresa VALUES (125, true, 1, '2023-07-02 12:35:19.545535', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BARRA MANSA (UBM)', 92);
INSERT INTO public.empresa VALUES (126, true, 1, '2023-07-02 12:35:19.552691', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BAURU', 93);
INSERT INTO public.empresa VALUES (127, true, 1, '2023-07-02 12:35:19.554006', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BELO HORIZONTE (UNI-BH)', 2);
INSERT INTO public.empresa VALUES (128, true, 1, '2023-07-02 12:35:19.555383', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BRASÍLIA (UNICEUB)', 5);
INSERT INTO public.empresa VALUES (129, true, 1, '2023-07-02 12:35:19.556884', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BRUSQUE (UNIFEBE)', 94);
INSERT INTO public.empresa VALUES (130, true, 1, '2023-07-02 12:35:19.558382', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE CARATINGA (UNEC)', 95);
INSERT INTO public.empresa VALUES (131, true, 1, '2023-07-02 12:35:19.559931', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE CIÊNCIAS E EMPREENDEDORISMO (UNIFACEMP)', 96);
INSERT INTO public.empresa VALUES (132, true, 1, '2023-07-02 12:35:19.568639', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE CIÊNCIAS E TECNOLOGIA DO MARANHÃO (UNIFACEMA)', 97);
INSERT INTO public.empresa VALUES (133, true, 1, '2023-07-02 12:35:19.570075', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE DESENVOLVIMENTO DO CENTRO OESTE (UNIDESC)', 98);
INSERT INTO public.empresa VALUES (134, true, 1, '2023-07-02 12:35:19.571406', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ENSINO, CIÊNCIA E TECNOLOGIA DO PARANÁ (UNIENSINO)', 56);
INSERT INTO public.empresa VALUES (135, true, 1, '2023-07-02 12:35:19.572714', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ENSINO SUPERIOR DO AMAZONAS (CIESA)', 75);
INSERT INTO public.empresa VALUES (632, true, 1, '2023-07-02 12:35:20.79441', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PALMAS', 23);
INSERT INTO public.empresa VALUES (136, true, 1, '2023-07-02 12:35:19.574107', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE EXCELÊNCIA (UNEX)', 99);
INSERT INTO public.empresa VALUES (137, true, 1, '2023-07-02 12:35:19.575632', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE EXCELÊNCIA ENIAC (ENIAC)', 100);
INSERT INTO public.empresa VALUES (138, true, 1, '2023-07-02 12:35:19.582621', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE FORMIGA (UNIFORMG)', 101);
INSERT INTO public.empresa VALUES (139, true, 1, '2023-07-02 12:35:19.583906', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE GOIÂNIA (UNICEUG)', 42);
INSERT INTO public.empresa VALUES (140, true, 1, '2023-07-02 12:35:19.585257', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE GOIÁS (UNIGOIÁS)', 42);
INSERT INTO public.empresa VALUES (141, true, 1, '2023-07-02 12:35:19.586609', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE GOIATUBA (UNICERRADO)', 102);
INSERT INTO public.empresa VALUES (142, true, 1, '2023-07-02 12:35:19.588098', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ITAJUBÁ (FEPI)', 103);
INSERT INTO public.empresa VALUES (143, true, 1, '2023-07-02 12:35:19.589425', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ITAPIRA UNIESI (UNIESI)', 104);
INSERT INTO public.empresa VALUES (144, true, 1, '2023-07-02 12:35:19.598169', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE JAGUARIÚNA (UNIFAJ)', 105);
INSERT INTO public.empresa VALUES (145, true, 1, '2023-07-02 12:35:19.599723', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE JALES (UNIJALES)', 106);
INSERT INTO public.empresa VALUES (146, true, 1, '2023-07-02 12:35:19.601073', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE JOÃO PESSOA (UNIPÊ)', 107);
INSERT INTO public.empresa VALUES (147, true, 1, '2023-07-02 12:35:19.602399', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE LAVRAS (UNILAVRAS)', 108);
INSERT INTO public.empresa VALUES (148, true, 1, '2023-07-02 12:35:19.603738', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE LINS (UNILINS)', 70);
INSERT INTO public.empresa VALUES (149, true, 1, '2023-07-02 12:35:19.605141', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE MINEIROS (UNIFIMES)', 109);
INSERT INTO public.empresa VALUES (150, true, 1, '2023-07-02 12:35:19.612456', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE PATO BRANCO (UNIDEP)', 110);
INSERT INTO public.empresa VALUES (151, true, 1, '2023-07-02 12:35:19.614182', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE PATOS (UNIFIP)', 111);
INSERT INTO public.empresa VALUES (152, true, 1, '2023-07-02 12:35:19.615684', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE PATOS DE MINAS (UNIPAM)', 112);
INSERT INTO public.empresa VALUES (153, true, 1, '2023-07-02 12:35:19.617129', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE PAULÍNIA (UNIFACP)', 113);
INSERT INTO public.empresa VALUES (154, true, 1, '2023-07-02 12:35:19.618442', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE RIO PRETO (UNIRP)', 114);
INSERT INTO public.empresa VALUES (155, true, 1, '2023-07-02 12:35:19.619842', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE RONDÔNIA (UNESC)', 115);
INSERT INTO public.empresa VALUES (156, true, 1, '2023-07-02 12:35:19.628608', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE SALVADOR (UNICEUSA)', 116);
INSERT INTO public.empresa VALUES (157, true, 1, '2023-07-02 12:35:19.630191', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE SANTA FÉ DO SUL (UNIFUNEC)', 117);
INSERT INTO public.empresa VALUES (158, true, 1, '2023-07-02 12:35:19.63152', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE SETE LAGOAS (UNIFEMM)', 24);
INSERT INTO public.empresa VALUES (159, true, 1, '2023-07-02 12:35:19.632838', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE TALENTOS HUMANOS (UNIFACTHUS)', 118);
INSERT INTO public.empresa VALUES (160, true, 1, '2023-07-02 12:35:19.634171', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE TECNOLOGIA CARLOS DRUMMOND DE ANDRADE', 8);
INSERT INTO public.empresa VALUES (161, true, 1, '2023-07-02 12:35:19.63531', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE TECNOLOGIA DE CURITIBA (UNIFATEC)', 56);
INSERT INTO public.empresa VALUES (162, true, 1, '2023-07-02 12:35:19.642396', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE TECNOLOGIA E NEGÓCIOS CARLOS DRUMMOND DE ANDRADE (UNITEN CDA)', 8);
INSERT INTO public.empresa VALUES (163, true, 1, '2023-07-02 12:35:19.643791', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE UNIÃO DA VITÓRIA (UNIUV)', 119);
INSERT INTO public.empresa VALUES (164, true, 1, '2023-07-02 12:35:19.645134', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VALENÇA (UNIFAA)', 120);
INSERT INTO public.empresa VALUES (165, true, 1, '2023-07-02 12:35:19.646459', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VÁRZEA GRANDE (UNIVAG)', 121);
INSERT INTO public.empresa VALUES (166, true, 1, '2023-07-02 12:35:19.647804', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VIÇOSA (UNIVIÇOSA)', 122);
INSERT INTO public.empresa VALUES (167, true, 1, '2023-07-02 12:35:19.649194', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VOLTA REDONDA (UNIFOA)', 123);
INSERT INTO public.empresa VALUES (168, true, 1, '2023-07-02 12:35:19.657927', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VOTUPORANGA (UNIFEV)', 10);
INSERT INTO public.empresa VALUES (169, true, 1, '2023-07-02 12:35:19.659444', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DINÂMICA DAS CATARATAS (UDC)', 124);
INSERT INTO public.empresa VALUES (170, true, 1, '2023-07-02 12:35:19.660763', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO CERRADO-PATROCÍNIO (UNICERP)', 125);
INSERT INTO public.empresa VALUES (171, true, 1, '2023-07-02 12:35:19.662117', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOCTUM DE TEÓFILO OTONI (UNIDOCTUM)', 7);
INSERT INTO public.empresa VALUES (172, true, 1, '2023-07-02 12:35:19.663439', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO DISTRITO FEDERAL (UDF)', 5);
INSERT INTO public.empresa VALUES (173, true, 1, '2023-07-02 12:35:19.664851', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO ESPÍRITO SANTO (UNESC)', 65);
INSERT INTO public.empresa VALUES (174, true, 1, '2023-07-02 12:35:19.671677', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO ESTADO DO PARÁ (CESUPA)', 79);
INSERT INTO public.empresa VALUES (175, true, 1, '2023-07-02 12:35:19.673065', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO INSTITUTO DE EDUCAÇÃO SUPERIOR DE BRASÍLIA - IESB (IESB)', 5);
INSERT INTO public.empresa VALUES (176, true, 1, '2023-07-02 12:35:19.674691', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO INSTITUTO MAUÁ DE TECNOLOGIA (CEUN-IMT)', 126);
INSERT INTO public.empresa VALUES (177, true, 1, '2023-07-02 12:35:19.676001', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOM BOSCO DO RIO DE JANEIRO (UNIDOMBOSCO-RJ)', 4);
INSERT INTO public.empresa VALUES (178, true, 1, '2023-07-02 12:35:19.677336', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOM PEDRO II (UNIDOMPEDRO)', 116);
INSERT INTO public.empresa VALUES (179, true, 1, '2023-07-02 12:35:19.67865', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DON DOMÊNICO (UNIDON)', 127);
INSERT INTO public.empresa VALUES (180, true, 1, '2023-07-02 12:35:19.687303', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO NORTE (UNINORTE)', 75);
INSERT INTO public.empresa VALUES (181, true, 1, '2023-07-02 12:35:19.6886', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO NORTE DE MINAS (UNINORTE MINAS)', 128);
INSERT INTO public.empresa VALUES (182, true, 1, '2023-07-02 12:35:19.690028', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO NORTE DE SÃO PAULO (UNORTE)', 114);
INSERT INTO public.empresa VALUES (183, true, 1, '2023-07-02 12:35:19.69145', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO PARANÁ (UNIPA)', 56);
INSERT INTO public.empresa VALUES (184, true, 1, '2023-07-02 12:35:19.692861', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO PIAUÍ (UNIFAPI)', 27);
INSERT INTO public.empresa VALUES (185, true, 1, '2023-07-02 12:35:19.694382', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO PLANALTO CENTRAL APPARECIDO DOS SANTOS (UNICEPLAC)', 5);
INSERT INTO public.empresa VALUES (186, true, 1, '2023-07-02 12:35:19.701238', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO PLANALTO DE ARAXÁ (UNIARAXÁ)', 129);
INSERT INTO public.empresa VALUES (187, true, 1, '2023-07-02 12:35:19.702699', NULL, NULL, false, 'CENTRO UNIVERSITARIO DO RECIFE (UNIPESU)', 60);
INSERT INTO public.empresa VALUES (188, true, 1, '2023-07-02 12:35:19.70421', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO RIO DE JANEIRO (UNIRJ)', 12);
INSERT INTO public.empresa VALUES (189, true, 1, '2023-07-02 12:35:19.705555', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO RIO GRANDE DO NORTE (UNI-RN)', 130);
INSERT INTO public.empresa VALUES (190, true, 1, '2023-07-02 12:35:19.706965', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO RIO SÃO FRANCISCO UNIRIOS (UNIRIOS)', 131);
INSERT INTO public.empresa VALUES (191, true, 1, '2023-07-02 12:35:19.708656', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOS GUARARAPES (UNIFG)', 132);
INSERT INTO public.empresa VALUES (192, true, 1, '2023-07-02 12:35:19.717209', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO SUDESTE MINEIRO (UNICSUM)', 38);
INSERT INTO public.empresa VALUES (193, true, 1, '2023-07-02 12:35:19.718499', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO SUL DE MINAS (UNIS-MG)', 133);
INSERT INTO public.empresa VALUES (194, true, 1, '2023-07-02 12:35:19.719823', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO TRIÂNGULO (UNITRI)', 134);
INSERT INTO public.empresa VALUES (195, true, 1, '2023-07-02 12:35:19.721159', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOUTOR LEÃO SAMPAIO (UNILEÃO)', 135);
INSERT INTO public.empresa VALUES (196, true, 1, '2023-07-02 12:35:19.722614', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO VALE DO ARAGUAIA (UNIVAR)', 66);
INSERT INTO public.empresa VALUES (197, true, 1, '2023-07-02 12:35:19.723903', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO VALE DO JAGUARIBE (UNIJAGUARIBE)', 136);
INSERT INTO public.empresa VALUES (198, true, 1, '2023-07-02 12:35:19.730816', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO VALE DO RIBEIRA (UNIVR)', 137);
INSERT INTO public.empresa VALUES (199, true, 1, '2023-07-02 12:35:19.73186', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESPÍRITO-SANTENSE/FAESA', 25);
INSERT INTO public.empresa VALUES (200, true, 1, '2023-07-02 12:35:19.733186', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DA AMAZÔNIA (ESTÁCIO AMAZÔNIA)', 138);
INSERT INTO public.empresa VALUES (201, true, 1, '2023-07-02 12:35:19.734602', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DA BAHIA (ESTÁCIO BAHIA)', 116);
INSERT INTO public.empresa VALUES (202, true, 1, '2023-07-02 12:35:19.743355', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE BELO HORIZONTE - ESTÁCIO BH (ESTÁCIO BH)', 2);
INSERT INTO public.empresa VALUES (274, true, 1, '2023-07-02 12:35:19.919699', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LUSÍADA (UNILUS)', 171);
INSERT INTO public.empresa VALUES (203, true, 1, '2023-07-02 12:35:19.744818', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE BRASÍLIA - ESTÁCIO BRASÍLIA (ESTÁCIO BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (204, true, 1, '2023-07-02 12:35:19.746272', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE GOIÁS (ESTÁCIO GOIÁS)', 42);
INSERT INTO public.empresa VALUES (205, true, 1, '2023-07-02 12:35:19.747597', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE JI-PARANÁ (ESTÁCIO UNIJIPA)', 139);
INSERT INTO public.empresa VALUES (206, true, 1, '2023-07-02 12:35:19.748926', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE RIBEIRÃO PRETO (ESTÁCIO RIBEIRÃO PRE)', 58);
INSERT INTO public.empresa VALUES (207, true, 1, '2023-07-02 12:35:19.750343', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE SANTA CATARINA - ESTÁCIO SANTA CATARINA', 140);
INSERT INTO public.empresa VALUES (208, true, 1, '2023-07-02 12:35:19.757428', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE SÃO LUÍS', 141);
INSERT INTO public.empresa VALUES (209, true, 1, '2023-07-02 12:35:19.759241', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE SÃO PAULO (ESTÁCIO SÃO PAULO)', 8);
INSERT INTO public.empresa VALUES (210, true, 1, '2023-07-02 12:35:19.760661', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE SERGIPE', 142);
INSERT INTO public.empresa VALUES (211, true, 1, '2023-07-02 12:35:19.762001', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DO CEARÁ (ESTÁCIO CEARÁ)', 45);
INSERT INTO public.empresa VALUES (212, true, 1, '2023-07-02 12:35:19.763365', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DO RECIFE', 60);
INSERT INTO public.empresa VALUES (213, true, 1, '2023-07-02 12:35:19.764504', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO JUIZ DE FORA - ESTÁCIO JUIZ DE FORA', 38);
INSERT INTO public.empresa VALUES (214, true, 1, '2023-07-02 12:35:19.773115', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO META DE RIO BRANCO ESTÁCIO (UNIMETA)', 143);
INSERT INTO public.empresa VALUES (215, true, 1, '2023-07-02 12:35:19.774801', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ETEP', 144);
INSERT INTO public.empresa VALUES (216, true, 1, '2023-07-02 12:35:19.776124', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO EURÍPEDES DE MARÍLIA (UNIVEM)', 145);
INSERT INTO public.empresa VALUES (217, true, 1, '2023-07-02 12:35:19.777465', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO EURO-AMERICANO (UNIEURO)', 5);
INSERT INTO public.empresa VALUES (218, true, 1, '2023-07-02 12:35:19.778796', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACENS (UNIFACENS)', 146);
INSERT INTO public.empresa VALUES (219, true, 1, '2023-07-02 12:35:19.780237', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACEX (UNIFACEX)', 130);
INSERT INTO public.empresa VALUES (220, true, 1, '2023-07-02 12:35:19.787164', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACID WYDEN (UNIFACID WYDEN)', 27);
INSERT INTO public.empresa VALUES (221, true, 1, '2023-07-02 12:35:19.788557', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACISA (UNIFACISA)', 147);
INSERT INTO public.empresa VALUES (222, true, 1, '2023-07-02 12:35:19.789995', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACOL (UNIFACOL)', 90);
INSERT INTO public.empresa VALUES (223, true, 1, '2023-07-02 12:35:19.791265', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACUNICAMPS (FACUNICAMPS)', 42);
INSERT INTO public.empresa VALUES (224, true, 1, '2023-07-02 12:35:19.792625', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACVEST (UNIFACVEST)', 148);
INSERT INTO public.empresa VALUES (225, true, 1, '2023-07-02 12:35:19.794148', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FADERGS (FADERGS)', 149);
INSERT INTO public.empresa VALUES (226, true, 1, '2023-07-02 12:35:19.802847', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAEL (UNIFAEL)', 150);
INSERT INTO public.empresa VALUES (227, true, 1, '2023-07-02 12:35:19.804338', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAEMA (UNIFAEMA)', 151);
INSERT INTO public.empresa VALUES (228, true, 1, '2023-07-02 12:35:19.805672', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAESA', 25);
INSERT INTO public.empresa VALUES (229, true, 1, '2023-07-02 12:35:19.807018', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAI', 152);
INSERT INTO public.empresa VALUES (230, true, 1, '2023-07-02 12:35:19.808335', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAMEC (UNIFAMEC)', 153);
INSERT INTO public.empresa VALUES (231, true, 1, '2023-07-02 12:35:19.809466', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAMETRO ( UNIFAMETRO)', 45);
INSERT INTO public.empresa VALUES (232, true, 1, '2023-07-02 12:35:19.816286', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAMINAS (UNIFAMINAS)', 154);
INSERT INTO public.empresa VALUES (233, true, 1, '2023-07-02 12:35:19.817625', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FANOR WYDEN (UNIFANOR WYDEN)', 45);
INSERT INTO public.empresa VALUES (234, true, 1, '2023-07-02 12:35:19.818944', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FARIAS BRITO', 45);
INSERT INTO public.empresa VALUES (235, true, 1, '2023-07-02 12:35:19.820276', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FASIPE', 155);
INSERT INTO public.empresa VALUES (236, true, 1, '2023-07-02 12:35:19.821663', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAVENI (UNIFAVENI)', 100);
INSERT INTO public.empresa VALUES (237, true, 1, '2023-07-02 12:35:19.823044', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAVIP WYDEN (UNIFAVIP WYDEN)', 156);
INSERT INTO public.empresa VALUES (238, true, 1, '2023-07-02 12:35:19.831686', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FBV WYDEN (UNIFBV WYDEN)', 60);
INSERT INTO public.empresa VALUES (239, true, 1, '2023-07-02 12:35:19.832997', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FG (UNIFG)', 157);
INSERT INTO public.empresa VALUES (240, true, 1, '2023-07-02 12:35:19.834329', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FIBRA (UNIFIBRA)', 79);
INSERT INTO public.empresa VALUES (241, true, 1, '2023-07-02 12:35:19.835508', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FIEO (UNIFIEO)', 158);
INSERT INTO public.empresa VALUES (242, true, 1, '2023-07-02 12:35:19.836832', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FILADÉLFIA (UNIFIL)', 159);
INSERT INTO public.empresa VALUES (243, true, 1, '2023-07-02 12:35:19.838248', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FIP-MOC (UNIFIPMOC)', 128);
INSERT INTO public.empresa VALUES (244, true, 1, '2023-07-02 12:35:19.845129', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FLUMINENSE (UNIFLU)', 160);
INSERT INTO public.empresa VALUES (245, true, 1, '2023-07-02 12:35:19.846414', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FMABC (FMABC)', 47);
INSERT INTO public.empresa VALUES (246, true, 1, '2023-07-02 12:35:19.847743', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNCESI (UNIFUNCESI)', 161);
INSERT INTO public.empresa VALUES (247, true, 1, '2023-07-02 12:35:19.849098', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNDAÇÃO DE ENSINO OCTÁVIO BASTOS - FEOB (UNIFEOB)', 88);
INSERT INTO public.empresa VALUES (248, true, 1, '2023-07-02 12:35:19.850419', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNDAÇÃO SANTO ANDRÉ (CUFSA)', 47);
INSERT INTO public.empresa VALUES (249, true, 1, '2023-07-02 12:35:19.851575', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNORTE (UNIFUNORTE)', 128);
INSERT INTO public.empresa VALUES (250, true, 1, '2023-07-02 12:35:19.86033', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNVIC (UNIFUNVIC)', 162);
INSERT INTO public.empresa VALUES (251, true, 1, '2023-07-02 12:35:19.861785', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GAMA E SOUZA', 12);
INSERT INTO public.empresa VALUES (252, true, 1, '2023-07-02 12:35:19.86311', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GERALDO DI BIASE (UGB)', 123);
INSERT INTO public.empresa VALUES (253, true, 1, '2023-07-02 12:35:19.86446', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GOVERNADOR OZANAM COELHO (UNIFAGOC)', 163);
INSERT INTO public.empresa VALUES (254, true, 1, '2023-07-02 12:35:19.865796', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GOYAZES (UNIGOYAZES)', 164);
INSERT INTO public.empresa VALUES (255, true, 1, '2023-07-02 12:35:19.867195', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GUAIRACÁ (UNIGUAIRACÁ)', 64);
INSERT INTO public.empresa VALUES (256, true, 1, '2023-07-02 12:35:19.874083', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO IBMEC (IBMEC)', 12);
INSERT INTO public.empresa VALUES (257, true, 1, '2023-07-02 12:35:19.875537', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO IBMR', 12);
INSERT INTO public.empresa VALUES (258, true, 1, '2023-07-02 12:35:19.876884', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ICESP (UNICESP)', 5);
INSERT INTO public.empresa VALUES (259, true, 1, '2023-07-02 12:35:19.878188', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO IDEAU (UNIDEAU)', 165);
INSERT INTO public.empresa VALUES (260, true, 1, '2023-07-02 12:35:19.879551', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO IMEPAC - ARAGUARI', 166);
INSERT INTO public.empresa VALUES (261, true, 1, '2023-07-02 12:35:19.880943', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INGÁ (UNINGÁ)', 76);
INSERT INTO public.empresa VALUES (262, true, 1, '2023-07-02 12:35:19.889728', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INTA (UNINTA)', 167);
INSERT INTO public.empresa VALUES (263, true, 1, '2023-07-02 12:35:19.891527', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INTEGRADO DE CAMPO MOURÃO', 168);
INSERT INTO public.empresa VALUES (264, true, 1, '2023-07-02 12:35:19.892975', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INTERNACIONAL (UNINTER)', 56);
INSERT INTO public.empresa VALUES (265, true, 1, '2023-07-02 12:35:19.894505', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INTERNACIONAL SIGNORELLI (UNISIGNORELLI)', 12);
INSERT INTO public.empresa VALUES (266, true, 1, '2023-07-02 12:35:19.895972', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ÍTALO-BRASILEIRO (UNIÍTALO)', 8);
INSERT INTO public.empresa VALUES (267, true, 1, '2023-07-02 12:35:19.897274', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ITOP (UNITOP)', 23);
INSERT INTO public.empresa VALUES (268, true, 1, '2023-07-02 12:35:19.90411', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO JOAQUIM NABUCO DE RECIFE (UNINABUCO RECIFE)', 60);
INSERT INTO public.empresa VALUES (269, true, 1, '2023-07-02 12:35:19.905426', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO JORGE AMADO (UNIJORGE)', 116);
INSERT INTO public.empresa VALUES (270, true, 1, '2023-07-02 12:35:19.9068', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LA SALLE (UNILASALLE - LUCAS)', 169);
INSERT INTO public.empresa VALUES (271, true, 1, '2023-07-02 12:35:19.908103', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LA SALLE DO RIO DE JANEIRO (UNILASALLE/RJ)', 49);
INSERT INTO public.empresa VALUES (272, true, 1, '2023-07-02 12:35:19.909452', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LEONARDO DA VINCI (UNIASSELVI)', 170);
INSERT INTO public.empresa VALUES (273, true, 1, '2023-07-02 12:35:19.910964', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LS (UNILS)', 5);
INSERT INTO public.empresa VALUES (275, true, 1, '2023-07-02 12:35:19.921156', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LUTERANO DE MANAUS (CEULM/ULBRA)', 75);
INSERT INTO public.empresa VALUES (276, true, 1, '2023-07-02 12:35:19.922663', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LUTERANO DE PALMAS (CEULP)', 23);
INSERT INTO public.empresa VALUES (277, true, 1, '2023-07-02 12:35:19.92398', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LUTERANO DE SANTARÉM (CEULS)', 78);
INSERT INTO public.empresa VALUES (278, true, 1, '2023-07-02 12:35:19.925335', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MARIA MILZA (UNIMAM)', 172);
INSERT INTO public.empresa VALUES (279, true, 1, '2023-07-02 12:35:19.9267', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MÁRIO PALMÉRIO (UNIFUCAMP)', 173);
INSERT INTO public.empresa VALUES (280, true, 1, '2023-07-02 12:35:19.933576', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MATER DEI', 110);
INSERT INTO public.empresa VALUES (281, true, 1, '2023-07-02 12:35:19.934861', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAUÁ DE BRASÍLIA (UNIMAUÁ)', 5);
INSERT INTO public.empresa VALUES (282, true, 1, '2023-07-02 12:35:19.936203', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU (UNINASSAU)', 60);
INSERT INTO public.empresa VALUES (283, true, 1, '2023-07-02 12:35:19.937561', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU ALIANÇA (UNINASSAU ALIANÇA)', 27);
INSERT INTO public.empresa VALUES (284, true, 1, '2023-07-02 12:35:19.938889', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURICIO DE NASSAU DE ARACAJU', 142);
INSERT INTO public.empresa VALUES (285, true, 1, '2023-07-02 12:35:19.940043', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE BARREIRAS (UNINASSAU)', 174);
INSERT INTO public.empresa VALUES (286, true, 1, '2023-07-02 12:35:19.948535', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE BELÉM', 79);
INSERT INTO public.empresa VALUES (287, true, 1, '2023-07-02 12:35:19.950033', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CACOAL (UNINASSAU)', 115);
INSERT INTO public.empresa VALUES (288, true, 1, '2023-07-02 12:35:19.951389', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CAMPINA GRANDE (UNINASSAU CPV)', 147);
INSERT INTO public.empresa VALUES (289, true, 1, '2023-07-02 12:35:19.952874', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CARUARU (UNINASSAU CARUARU)', 156);
INSERT INTO public.empresa VALUES (290, true, 1, '2023-07-02 12:35:19.95435', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE FORTALEZA (UNINASSAU FORTALEZA)', 45);
INSERT INTO public.empresa VALUES (291, true, 1, '2023-07-02 12:35:19.955865', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE JOÃO PESSOA', 107);
INSERT INTO public.empresa VALUES (292, true, 1, '2023-07-02 12:35:19.962688', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE JUAZEIRO DO NORTE (UNINASSAU)', 135);
INSERT INTO public.empresa VALUES (293, true, 1, '2023-07-02 12:35:19.964201', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE MACEIÓ (UNINASSAUMACEI?)', 73);
INSERT INTO public.empresa VALUES (294, true, 1, '2023-07-02 12:35:19.965495', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE NATAL (UNINASSAU)', 130);
INSERT INTO public.empresa VALUES (295, true, 1, '2023-07-02 12:35:19.966853', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE SALVADOR (UNINASSAU SALVADOR)', 116);
INSERT INTO public.empresa VALUES (296, true, 1, '2023-07-02 12:35:19.968195', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE SÃO LUÍS (UNINASSAU)', 141);
INSERT INTO public.empresa VALUES (297, true, 1, '2023-07-02 12:35:19.969616', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE TERESINA', 27);
INSERT INTO public.empresa VALUES (298, true, 1, '2023-07-02 12:35:19.978299', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DO RIO DE JANEIRO (UNINASSAU)', 12);
INSERT INTO public.empresa VALUES (299, true, 1, '2023-07-02 12:35:19.979612', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU PAULISTA (UNINASSAU PAULISTA)', 175);
INSERT INTO public.empresa VALUES (300, true, 1, '2023-07-02 12:35:19.98098', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE UNINASSAU DE PARNAÍBA (UNINASSAU PARNAÍBA)', 176);
INSERT INTO public.empresa VALUES (301, true, 1, '2023-07-02 12:35:19.982481', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAX PLANCK (UNIMAX)', 11);
INSERT INTO public.empresa VALUES (302, true, 1, '2023-07-02 12:35:19.983982', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METODISTA (IPA)', 149);
INSERT INTO public.empresa VALUES (303, true, 1, '2023-07-02 12:35:19.985298', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METODISTA IZABELA HENDRIX (CEUNIH)', 2);
INSERT INTO public.empresa VALUES (304, true, 1, '2023-07-02 12:35:19.992206', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METROCAMP WYDEN (UNIMETROCAMP WYDEN)', 177);
INSERT INTO public.empresa VALUES (305, true, 1, '2023-07-02 12:35:19.993675', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METROPOLITANO DA AMAZÔNIA (UNIFAMAZ)', 79);
INSERT INTO public.empresa VALUES (306, true, 1, '2023-07-02 12:35:19.995179', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METROPOLITANO DE MARINGÁ (UNIFAMMA)', 76);
INSERT INTO public.empresa VALUES (307, true, 1, '2023-07-02 12:35:19.996634', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METROPOLITANO DE SÃO PAULO (UNIMESP)', 100);
INSERT INTO public.empresa VALUES (308, true, 1, '2023-07-02 12:35:19.99798', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MÓDULO (MÓDULO)', 178);
INSERT INTO public.empresa VALUES (309, true, 1, '2023-07-02 12:35:19.999369', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MOURA LACERDA (CUML)', 58);
INSERT INTO public.empresa VALUES (310, true, 1, '2023-07-02 12:35:20.008109', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MULTIVIX VITÓRIA', 25);
INSERT INTO public.empresa VALUES (311, true, 1, '2023-07-02 12:35:20.009601', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MUNICIPAL DE FRANCA (UNI-FACEF)', 179);
INSERT INTO public.empresa VALUES (312, true, 1, '2023-07-02 12:35:20.011119', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MUNICIPAL DE SÃO JOSÉ (USJ)', 140);
INSERT INTO public.empresa VALUES (313, true, 1, '2023-07-02 12:35:20.012444', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NATALENSE (UNICEUNA)', 130);
INSERT INTO public.empresa VALUES (314, true, 1, '2023-07-02 12:35:20.013786', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NEWTON PAIVA (NEWTON PAIVA)', 2);
INSERT INTO public.empresa VALUES (315, true, 1, '2023-07-02 12:35:20.015199', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NOBRE DE FEIRA DE SANTANA', 99);
INSERT INTO public.empresa VALUES (316, true, 1, '2023-07-02 12:35:20.022104', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NOSSA SENHORA APARECIDA (UNIFANAP)', 41);
INSERT INTO public.empresa VALUES (317, true, 1, '2023-07-02 12:35:20.023837', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NOSSA SENHORA DO PATROCÍNIO (CEUNSP)', 180);
INSERT INTO public.empresa VALUES (318, true, 1, '2023-07-02 12:35:20.025325', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO OPET (UNIOPET)', 56);
INSERT INTO public.empresa VALUES (319, true, 1, '2023-07-02 12:35:20.026661', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PADRE ALBINO', 181);
INSERT INTO public.empresa VALUES (320, true, 1, '2023-07-02 12:35:20.028172', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PADRE ANCHIETA (UNIANCHIETA)', 182);
INSERT INTO public.empresa VALUES (321, true, 1, '2023-07-02 12:35:20.029496', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PARAÍSO', 135);
INSERT INTO public.empresa VALUES (322, true, 1, '2023-07-02 12:35:20.038193', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PARA O DESENVOLVIMENTO DO ALTO VALE DO ITAJAÍ (UNIDAVI)', 183);
INSERT INTO public.empresa VALUES (323, true, 1, '2023-07-02 12:35:20.039539', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PAULISTANA (UNIPAULISTANA)', 8);
INSERT INTO public.empresa VALUES (324, true, 1, '2023-07-02 12:35:20.04103', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PIAGET (UNIPIAGET)', 184);
INSERT INTO public.empresa VALUES (325, true, 1, '2023-07-02 12:35:20.042493', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PLANALTO DO DISTRITO FEDERAL - UNIPLAN (UNIPLAN)', 5);
INSERT INTO public.empresa VALUES (326, true, 1, '2023-07-02 12:35:20.043811', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PRESIDENTE ANTÔNIO CARLOS (UNIPAC)', 32);
INSERT INTO public.empresa VALUES (327, true, 1, '2023-07-02 12:35:20.045232', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PRESIDENTE TANCREDO DE ALMEIDA NEVES (UNIPTAN)', 185);
INSERT INTO public.empresa VALUES (328, true, 1, '2023-07-02 12:35:20.052146', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PROCESSUS (UNIPROCESSUS)', 5);
INSERT INTO public.empresa VALUES (329, true, 1, '2023-07-02 12:35:20.053597', NULL, NULL, false, 'CENTRO UNIVERSITARIO PROJEÇÃO (UNIPROJEÇÃO)', 5);
INSERT INTO public.empresa VALUES (330, true, 1, '2023-07-02 12:35:20.054925', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO REDENTOR (FACREDENTOR)', 186);
INSERT INTO public.empresa VALUES (331, true, 1, '2023-07-02 12:35:20.056252', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO RITTER DOS REIS (UNIRITTER)', 149);
INSERT INTO public.empresa VALUES (332, true, 1, '2023-07-02 12:35:20.057603', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO RUY BARBOSA WYDEN (UNIRUY WYDEN)', 116);
INSERT INTO public.empresa VALUES (333, true, 1, '2023-07-02 12:35:20.058998', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SAGRADO CORAÇÃO (UNISAGRADO)', 93);
INSERT INTO public.empresa VALUES (334, true, 1, '2023-07-02 12:35:20.067565', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SALESIANO (UNISALES)', 25);
INSERT INTO public.empresa VALUES (335, true, 1, '2023-07-02 12:35:20.068895', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SALESIANO DE SÃO PAULO (UNISAL)', 187);
INSERT INTO public.empresa VALUES (336, true, 1, '2023-07-02 12:35:20.070255', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA AMÉLIA (SECAL)', 188);
INSERT INTO public.empresa VALUES (337, true, 1, '2023-07-02 12:35:20.071566', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA CECÍLIA (UNICEA)', 162);
INSERT INTO public.empresa VALUES (338, true, 1, '2023-07-02 12:35:20.072914', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA CRUZ DE CURITIBA (UNI SANTA CRUZ)', 56);
INSERT INTO public.empresa VALUES (339, true, 1, '2023-07-02 12:35:20.074106', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA MARIA (UNIFSM)', 189);
INSERT INTO public.empresa VALUES (340, true, 1, '2023-07-02 12:35:20.080904', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA MARIA DA GLÓRIA (UNISMG)', 76);
INSERT INTO public.empresa VALUES (341, true, 1, '2023-07-02 12:35:20.082418', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANT''ANNA (UNISANT''ANNA)', 8);
INSERT INTO public.empresa VALUES (342, true, 1, '2023-07-02 12:35:20.083917', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA RITA (UNIFASAR)', 18);
INSERT INTO public.empresa VALUES (343, true, 1, '2023-07-02 12:35:20.085396', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTO AGOSTINHO (UNIFSA)', 27);
INSERT INTO public.empresa VALUES (344, true, 1, '2023-07-02 12:35:20.086716', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO CAMILO (SAO CAMILO)', 8);
INSERT INTO public.empresa VALUES (345, true, 1, '2023-07-02 12:35:20.088112', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO CAMILO - ESPÍRITO SANTO (SÃO CAMILO-ES)', 190);
INSERT INTO public.empresa VALUES (346, true, 1, '2023-07-02 12:35:20.096814', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO JOSÉ (UNISJ)', 12);
INSERT INTO public.empresa VALUES (347, true, 1, '2023-07-02 12:35:20.098129', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO JOSÉ DE ITAPERUNA', 186);
INSERT INTO public.empresa VALUES (348, true, 1, '2023-07-02 12:35:20.09948', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO JUDAS TADEU (CSJT)', 171);
INSERT INTO public.empresa VALUES (349, true, 1, '2023-07-02 12:35:20.100814', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO LUCAS JI-PARANÁ (UNISL)', 139);
INSERT INTO public.empresa VALUES (350, true, 1, '2023-07-02 12:35:20.102316', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO LUCAS PORTO VELHO (SÃO LUCAS PVH)', 51);
INSERT INTO public.empresa VALUES (351, true, 1, '2023-07-02 12:35:20.103866', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO MIGUEL (UNISÃOMIGUEL)', 60);
INSERT INTO public.empresa VALUES (352, true, 1, '2023-07-02 12:35:20.110878', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO ROQUE (UNISÃO ROQUE)', 191);
INSERT INTO public.empresa VALUES (353, true, 1, '2023-07-02 12:35:20.112393', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SATC (UNISATC)', 192);
INSERT INTO public.empresa VALUES (354, true, 1, '2023-07-02 12:35:20.113708', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SENAC (RS)', 149);
INSERT INTO public.empresa VALUES (355, true, 1, '2023-07-02 12:35:20.115051', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SENAC (SENACSP)', 8);
INSERT INTO public.empresa VALUES (356, true, 1, '2023-07-02 12:35:20.116386', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SENAI BLUMENAU', 193);
INSERT INTO public.empresa VALUES (357, true, 1, '2023-07-02 12:35:20.117527', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SENAI CIMATEC (SENAI CIMATEC)', 116);
INSERT INTO public.empresa VALUES (358, true, 1, '2023-07-02 12:35:20.126122', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SERRA DOS ÓRGÃOS (UNIFESO)', 194);
INSERT INTO public.empresa VALUES (359, true, 1, '2023-07-02 12:35:20.127693', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SETE DE SETEMBRO (UNI7)', 45);
INSERT INTO public.empresa VALUES (360, true, 1, '2023-07-02 12:35:20.129036', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SOCIAL DA BAHIA (UNISBA)', 116);
INSERT INTO public.empresa VALUES (361, true, 1, '2023-07-02 12:35:20.130365', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SOCIESC', 68);
INSERT INTO public.empresa VALUES (362, true, 1, '2023-07-02 12:35:20.131696', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SOCIESC DE BLUMENAU', 193);
INSERT INTO public.empresa VALUES (363, true, 1, '2023-07-02 12:35:20.132916', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SUDOESTE PAULISTA (UNIFSP)', 195);
INSERT INTO public.empresa VALUES (364, true, 1, '2023-07-02 12:35:20.139889', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SUL-AMERICANA (UNIFASAM)', 42);
INSERT INTO public.empresa VALUES (365, true, 1, '2023-07-02 12:35:20.141226', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SUMARÉ', 8);
INSERT INTO public.empresa VALUES (366, true, 1, '2023-07-02 12:35:20.14257', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TABOSA DE ALMEIDA (ASCES-UNITA)', 156);
INSERT INTO public.empresa VALUES (367, true, 1, '2023-07-02 12:35:20.143884', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TERESA D''ÁVILA (FATEA)', 22);
INSERT INTO public.empresa VALUES (368, true, 1, '2023-07-02 12:35:20.14507', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TIRADENTES (UNIT)', 73);
INSERT INTO public.empresa VALUES (369, true, 1, '2023-07-02 12:35:20.146453', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TIRADENTES DE PERNAMBUCO (UNIT PE)', 60);
INSERT INTO public.empresa VALUES (370, true, 1, '2023-07-02 12:35:20.15517', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TOCANTINENSE PRESIDENTE ANTÔNIO CARLOS (UNITPAC)', 196);
INSERT INTO public.empresa VALUES (371, true, 1, '2023-07-02 12:35:20.156613', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TOLEDO WYDEN (UNITOLEDO WYDEN)', 197);
INSERT INTO public.empresa VALUES (372, true, 1, '2023-07-02 12:35:20.157948', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UFBRA (UFBRA)', 144);
INSERT INTO public.empresa VALUES (373, true, 1, '2023-07-02 12:35:20.159277', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA (UNA)', 2);
INSERT INTO public.empresa VALUES (374, true, 1, '2023-07-02 12:35:20.160627', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA DE BETIM', 198);
INSERT INTO public.empresa VALUES (375, true, 1, '2023-07-02 12:35:20.16172', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA DE BOM DESPACHO (UNA)', 199);
INSERT INTO public.empresa VALUES (376, true, 1, '2023-07-02 12:35:20.168697', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA DE CONTAGEM', 200);
INSERT INTO public.empresa VALUES (377, true, 1, '2023-07-02 12:35:20.170049', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA DE UBERLÂNDIA', 134);
INSERT INTO public.empresa VALUES (378, true, 1, '2023-07-02 12:35:20.171383', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIÃO DAS AMÉRICAS DESCOMPLICA (UNIAMÉRICA )', 124);
INSERT INTO public.empresa VALUES (379, true, 1, '2023-07-02 12:35:20.172701', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIASSELVI DE BLUMENAU', 193);
INSERT INTO public.empresa VALUES (380, true, 1, '2023-07-02 12:35:20.174067', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIASSELVI DE BRUSQUE', 94);
INSERT INTO public.empresa VALUES (381, true, 1, '2023-07-02 12:35:20.175441', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIASSELVI DE GUARAMIRIM', 201);
INSERT INTO public.empresa VALUES (382, true, 1, '2023-07-02 12:35:20.184181', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNI-BAN (UNI-BAN)', 8);
INSERT INTO public.empresa VALUES (383, true, 1, '2023-07-02 12:35:20.185455', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIBRAS DO SUDOESTE GOIANO (UNIBRAS)', 202);
INSERT INTO public.empresa VALUES (384, true, 1, '2023-07-02 12:35:20.186827', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIBTA', 8);
INSERT INTO public.empresa VALUES (385, true, 1, '2023-07-02 12:35:20.188149', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIC', 203);
INSERT INTO public.empresa VALUES (386, true, 1, '2023-07-02 12:35:20.189481', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNICARIOCA (UNICARIOCA)', 12);
INSERT INTO public.empresa VALUES (387, true, 1, '2023-07-02 12:35:20.190906', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNICURITIBA (UNICURITIBA)', 56);
INSERT INTO public.empresa VALUES (388, true, 1, '2023-07-02 12:35:20.19771', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIDADE DE ENSINO SUPERIOR DOM BOSCO (UNDB)', 141);
INSERT INTO public.empresa VALUES (389, true, 1, '2023-07-02 12:35:20.199013', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIDOM - BOSCO (UNIDOM - BOSCO)', 56);
INSERT INTO public.empresa VALUES (390, true, 1, '2023-07-02 12:35:20.200349', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO - UNIESP (UNIESP)', 204);
INSERT INTO public.empresa VALUES (391, true, 1, '2023-07-02 12:35:20.201723', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFAAT (UNIFAAT)', 205);
INSERT INTO public.empresa VALUES (392, true, 1, '2023-07-02 12:35:20.203024', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFACEAR', 206);
INSERT INTO public.empresa VALUES (393, true, 1, '2023-07-02 12:35:20.204126', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFACIG', 207);
INSERT INTO public.empresa VALUES (394, true, 1, '2023-07-02 12:35:20.212804', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFAFIBE (FAFIBE)', 208);
INSERT INTO public.empresa VALUES (395, true, 1, '2023-07-02 12:35:20.214131', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFAS', 209);
INSERT INTO public.empresa VALUES (396, true, 1, '2023-07-02 12:35:20.215468', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFATEB', 210);
INSERT INTO public.empresa VALUES (397, true, 1, '2023-07-02 12:35:20.216819', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFATECIE (UNIFATECIE)', 211);
INSERT INTO public.empresa VALUES (398, true, 1, '2023-07-02 12:35:20.218154', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFECAF', 212);
INSERT INTO public.empresa VALUES (399, true, 1, '2023-07-02 12:35:20.219558', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFTC', 116);
INSERT INTO public.empresa VALUES (400, true, 1, '2023-07-02 12:35:20.226514', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFTC SALVADOR', 116);
INSERT INTO public.empresa VALUES (401, true, 1, '2023-07-02 12:35:20.227996', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFTEC', 87);
INSERT INTO public.empresa VALUES (402, true, 1, '2023-07-02 12:35:20.229317', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFTEC BENTO GONÇALVES', 77);
INSERT INTO public.empresa VALUES (403, true, 1, '2023-07-02 12:35:20.230696', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIGRAN CAPITAL', 48);
INSERT INTO public.empresa VALUES (404, true, 1, '2023-07-02 12:35:20.232182', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIHORIZONTES', 2);
INSERT INTO public.empresa VALUES (405, true, 1, '2023-07-02 12:35:20.233553', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNINORTE', 143);
INSERT INTO public.empresa VALUES (406, true, 1, '2023-07-02 12:35:20.242096', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNINOVAFAPI (UNINOVAFAPI)', 27);
INSERT INTO public.empresa VALUES (407, true, 1, '2023-07-02 12:35:20.243422', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNINOVO (UNINOVO)', 39);
INSERT INTO public.empresa VALUES (408, true, 1, '2023-07-02 12:35:20.244735', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIRB (UNIRB)', 116);
INSERT INTO public.empresa VALUES (409, true, 1, '2023-07-02 12:35:20.246077', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIRB - ALAGOINHAS', 213);
INSERT INTO public.empresa VALUES (410, true, 1, '2023-07-02 12:35:20.247381', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNISAN (UNISAN)', 8);
INSERT INTO public.empresa VALUES (411, true, 1, '2023-07-02 12:35:20.248528', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNISEP (CEUUN)', 214);
INSERT INTO public.empresa VALUES (412, true, 1, '2023-07-02 12:35:20.255685', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVEL', 54);
INSERT INTO public.empresa VALUES (413, true, 1, '2023-07-02 12:35:20.257337', NULL, NULL, false, 'CENTRO UNIVERSITARIO UNIVERSO BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (414, true, 1, '2023-07-02 12:35:20.258823', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVERSO GOIÂNIA', 42);
INSERT INTO public.empresa VALUES (415, true, 1, '2023-07-02 12:35:20.26032', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVERSO JUIZ DE FORA', 38);
INSERT INTO public.empresa VALUES (416, true, 1, '2023-07-02 12:35:20.261839', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVERSO RECIFE', 60);
INSERT INTO public.empresa VALUES (417, true, 1, '2023-07-02 12:35:20.263246', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVERSO SALVADOR', 116);
INSERT INTO public.empresa VALUES (418, true, 1, '2023-07-02 12:35:20.271987', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVINTE', 215);
INSERT INTO public.empresa VALUES (419, true, 1, '2023-07-02 12:35:20.274102', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO U:VERSE', 143);
INSERT INTO public.empresa VALUES (420, true, 1, '2023-07-02 12:35:20.275397', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO VALE DO CRICARÉ (UNIVC)', 216);
INSERT INTO public.empresa VALUES (421, true, 1, '2023-07-02 12:35:20.27673', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO VALE DO RIO VERDE', 217);
INSERT INTO public.empresa VALUES (422, true, 1, '2023-07-02 12:35:20.278082', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO VALE DO SALGADO', 218);
INSERT INTO public.empresa VALUES (423, true, 1, '2023-07-02 12:35:20.279517', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO VÉRTICE (UNIVÉRTIX)', 219);
INSERT INTO public.empresa VALUES (424, true, 1, '2023-07-02 12:35:20.286481', NULL, NULL, false, 'CESREI FACULDADE', 147);
INSERT INTO public.empresa VALUES (425, true, 1, '2023-07-02 12:35:20.287942', NULL, NULL, false, 'CHRISTUS FACULDADE DO PIAUÍ (CHRISFAPI)', 220);
INSERT INTO public.empresa VALUES (426, true, 1, '2023-07-02 12:35:20.289332', NULL, NULL, false, 'CISNE - FACULDADE DE QUIXADÁ (CFQ)', 67);
INSERT INTO public.empresa VALUES (427, true, 1, '2023-07-02 12:35:20.2908', NULL, NULL, false, 'CISNE - FACULDADE TECNOLÓGICA DE QUIXADÁ (CFTQ)', 67);
INSERT INTO public.empresa VALUES (428, true, 1, '2023-07-02 12:35:20.292226', NULL, NULL, false, 'CLARETIANO - CENTRO UNIVERSITÁRIO (CLARETIANOBT)', 221);
INSERT INTO public.empresa VALUES (429, true, 1, '2023-07-02 12:35:20.293362', NULL, NULL, false, 'CLARETIANO - CENTRO UNIVERSITÁRIO', 222);
INSERT INTO public.empresa VALUES (430, true, 1, '2023-07-02 12:35:20.301895', NULL, NULL, false, 'CLARETIANO - FACULDADE DE BOA VISTA (CLARETIANOBV)', 138);
INSERT INTO public.empresa VALUES (431, true, 1, '2023-07-02 12:35:20.303206', NULL, NULL, false, 'COLÉGIO PEDRO II (CP II)', 12);
INSERT INTO public.empresa VALUES (432, true, 1, '2023-07-02 12:35:20.304546', NULL, NULL, false, 'COMPLEXO DE ENSINO SUPERIOR DE PALMAS (CESUP)', 23);
INSERT INTO public.empresa VALUES (433, true, 1, '2023-07-02 12:35:20.305704', NULL, NULL, false, 'CONSERVATÓRIO BRASILEIRO DE MÚSICA - CENTRO UNIVERSITÁRIO BRASILEIRO DE EDUCAÇÃO (CBM-UNICBE)', 12);
INSERT INTO public.empresa VALUES (434, true, 1, '2023-07-02 12:35:20.307086', NULL, NULL, false, 'DIRETORIA DE FORMAÇÃO E DESENVOLVIMENTO PROFISSIONAL (FUNDAJ)', 60);
INSERT INTO public.empresa VALUES (435, true, 1, '2023-07-02 12:35:20.30845', NULL, NULL, false, 'EJ - FACULDADE DE TECNOLOGIA EM AVIAÇÃO CIVIL (EJ)', 223);
INSERT INTO public.empresa VALUES (436, true, 1, '2023-07-02 12:35:20.315586', NULL, NULL, false, 'ENSINO SUPERIOR ALBERT SABIN JK (ESAS JK)', 5);
INSERT INTO public.empresa VALUES (437, true, 1, '2023-07-02 12:35:20.317062', NULL, NULL, false, 'EPGE ESCOLA BRASILEIRA DE ECONOMIA E FINANÇAS (FGV EPGE)', 12);
INSERT INTO public.empresa VALUES (438, true, 1, '2023-07-02 12:35:20.318439', NULL, NULL, false, 'ESCOLA BAHIANA DE MEDICINA E SAÚDE PÚBLICA (EBMSP)', 116);
INSERT INTO public.empresa VALUES (439, true, 1, '2023-07-02 12:35:20.319898', NULL, NULL, false, 'ESCOLA BRASILEIRA DE ADMINISTRAÇÃO PÚBLICA E DE EMPRESAS (EBAPE)', 12);
INSERT INTO public.empresa VALUES (440, true, 1, '2023-07-02 12:35:20.321242', NULL, NULL, false, 'ESCOLA BRASILEIRA DE MEDICINA CHINESA (EBRAMEC)', 8);
INSERT INTO public.empresa VALUES (441, true, 1, '2023-07-02 12:35:20.322635', NULL, NULL, false, 'ESCOLA DA ADVOCACIA-GERAL DA UNIÃO (EAGU)', 5);
INSERT INTO public.empresa VALUES (442, true, 1, '2023-07-02 12:35:20.331358', NULL, NULL, false, 'ESCOLA DA CIDADE - FACULDADE DE ARQUITETURA E URBANISMO (ESCOLA DA CIDADE)', 8);
INSERT INTO public.empresa VALUES (443, true, 1, '2023-07-02 12:35:20.332665', NULL, NULL, false, 'ESCOLA DE ADMINISTRAÇÃO DE EMPRESAS DE SÃO PAULO - FGV EAESP (FGV-EAESP)', 8);
INSERT INTO public.empresa VALUES (444, true, 1, '2023-07-02 12:35:20.334013', NULL, NULL, false, 'ESCOLA DE ADMINISTRAÇÃO E NEGÓCIOS (ESAD)', 5);
INSERT INTO public.empresa VALUES (445, true, 1, '2023-07-02 12:35:20.335308', NULL, NULL, false, 'ESCOLA DE ADMINISTRAÇÃO FAZENDÁRIA (ESAF)', 5);
INSERT INTO public.empresa VALUES (446, true, 1, '2023-07-02 12:35:20.336651', NULL, NULL, false, 'ESCOLA DE APERFEIÇOAMENTO DE OFICIAIS (ESAO)', 12);
INSERT INTO public.empresa VALUES (447, true, 1, '2023-07-02 12:35:20.337781', NULL, NULL, false, 'ESCOLA DE ARTILHARIA DE COSTA E ANTIAÉREA (ESCOSAAE)', 12);
INSERT INTO public.empresa VALUES (448, true, 1, '2023-07-02 12:35:20.344927', NULL, NULL, false, 'ESCOLA DE CIÊNCIAS SOCIAIS FGV CPDOC (FGV CPDOC)', 12);
INSERT INTO public.empresa VALUES (449, true, 1, '2023-07-02 12:35:20.346606', NULL, NULL, false, 'ESCOLA DE COMANDO E ESTADO-MAIOR DO EXÉRCITO (ECEME)', 12);
INSERT INTO public.empresa VALUES (450, true, 1, '2023-07-02 12:35:20.347918', NULL, NULL, false, 'ESCOLA DE COMUNICAÇÃO, MÍDIA E INFORMAÇÃO DA FUNDAÇÃO GETULIO VARGAS (FGV ECMI)', 12);
INSERT INTO public.empresa VALUES (451, true, 1, '2023-07-02 12:35:20.349252', NULL, NULL, false, 'ESCOLA DE COMUNICAÇÕES (ESCOM)', 5);
INSERT INTO public.empresa VALUES (452, true, 1, '2023-07-02 12:35:20.350617', NULL, NULL, false, 'ESCOLA DE CONTAS E CAPACITAÇÃO PROFESSOR PEDRO ALEIXO', 2);
INSERT INTO public.empresa VALUES (453, true, 1, '2023-07-02 12:35:20.351977', NULL, NULL, false, 'ESCOLA DE DIREITO DE SÃO PAULO - FGV DIREITO SP (FGV DIREITO SP)', 8);
INSERT INTO public.empresa VALUES (454, true, 1, '2023-07-02 12:35:20.360584', NULL, NULL, false, 'ESCOLA DE DIREITO DO RIO DE JANEIRO (DIREITO RIO)', 12);
INSERT INTO public.empresa VALUES (455, true, 1, '2023-07-02 12:35:20.36215', NULL, NULL, false, 'ESCOLA DE DIREITO FUCAPE (FUCAPE DIREITO)', 25);
INSERT INTO public.empresa VALUES (456, true, 1, '2023-07-02 12:35:20.363481', NULL, NULL, false, 'ESCOLA DE ECONOMIA DE SÃO PAULO (EESP)', 8);
INSERT INTO public.empresa VALUES (457, true, 1, '2023-07-02 12:35:20.364828', NULL, NULL, false, 'ESCOLA DE EDUCAÇÃO FÍSICA DO EXÉRCITO (ESEFEX)', 12);
INSERT INTO public.empresa VALUES (458, true, 1, '2023-07-02 12:35:20.366147', NULL, NULL, false, 'ESCOLA DE EDUCAÇÃO PERMANENTE (EEP)', 8);
INSERT INTO public.empresa VALUES (459, true, 1, '2023-07-02 12:35:20.367546', NULL, NULL, false, 'ESCOLA DE ENFERMAGEM DA FUNDAÇÃO TÉCNICO EDUCACIONAL SOUZA MARQUES (EEFTESM)', 12);
INSERT INTO public.empresa VALUES (460, true, 1, '2023-07-02 12:35:20.374797', NULL, NULL, false, 'ESCOLA DE ENGENHARIA DE PIRACICABA (EEP/FUMEP)', 224);
INSERT INTO public.empresa VALUES (461, true, 1, '2023-07-02 12:35:20.376895', NULL, NULL, false, 'ESCOLA DE ENGENHARIA KENNEDY (EEK)', 2);
INSERT INTO public.empresa VALUES (462, true, 1, '2023-07-02 12:35:20.378623', NULL, NULL, false, 'ESCOLA DE ENSINO SUPERIOR DA FIPE (FIPEEES)', 8);
INSERT INTO public.empresa VALUES (463, true, 1, '2023-07-02 12:35:20.380222', NULL, NULL, false, 'ESCOLA DE ENSINO SUPERIOR DO AGRESTE PARAIBANO (EESAP)', 225);
INSERT INTO public.empresa VALUES (464, true, 1, '2023-07-02 12:35:20.381679', NULL, NULL, false, 'ESCOLA DE EQUITAÇÃO DO EXÉRCITO (ESEQEX)', 12);
INSERT INTO public.empresa VALUES (465, true, 1, '2023-07-02 12:35:20.382809', NULL, NULL, false, 'ESCOLA DE GOVERNO PROFESSOR PAULO NEVES DE CARVALHO (EG)', 2);
INSERT INTO public.empresa VALUES (466, true, 1, '2023-07-02 12:35:20.391726', NULL, NULL, false, 'ESCOLA DE INSTRUÇÃO ESPECIALIZADA (ESIE)', 12);
INSERT INTO public.empresa VALUES (467, true, 1, '2023-07-02 12:35:20.393344', NULL, NULL, false, 'ESCOLA DE INTELIGÊNCIA - ESINT/ABIN (ESINT/ABIN)', 5);
INSERT INTO public.empresa VALUES (468, true, 1, '2023-07-02 12:35:20.394697', NULL, NULL, false, 'ESCOLA DE INTELIGÊNCIA MILITAR DO EXÉRCITO (ESIMEX)', 5);
INSERT INTO public.empresa VALUES (469, true, 1, '2023-07-02 12:35:20.396013', NULL, NULL, false, 'ESCOLA DE MATEMÁTICA APLICADA (EMAP-FGV)', 12);
INSERT INTO public.empresa VALUES (470, true, 1, '2023-07-02 12:35:20.397362', NULL, NULL, false, 'ESCOLA DE MEDICINA SOUZA MARQUES DA FUNDAÇÃO TÉCNICO-EDUCACIONAL SOUZA MARQUES (EMSM)', 12);
INSERT INTO public.empresa VALUES (471, true, 1, '2023-07-02 12:35:20.398778', NULL, NULL, false, 'ESCOLA DE POLÍTICAS PÚBLICAS E GOVERNO DA FUNDAÇÃO GETULIO VARGAS (FGV EPPG)', 5);
INSERT INTO public.empresa VALUES (472, true, 1, '2023-07-02 12:35:20.405727', NULL, NULL, false, 'ESCOLA DE SARGENTOS DAS ARMAS (ESA)', 217);
INSERT INTO public.empresa VALUES (473, true, 1, '2023-07-02 12:35:20.407259', NULL, NULL, false, 'ESCOLA DE SARGENTOS DE LOGÍSTICA (ESSLOG)', 12);
INSERT INTO public.empresa VALUES (474, true, 1, '2023-07-02 12:35:20.408723', NULL, NULL, false, 'ESCOLA DE SOCIOLOGIA E POLÍTICA DE SÃO PAULO (ESP)', 8);
INSERT INTO public.empresa VALUES (475, true, 1, '2023-07-02 12:35:20.410257', NULL, NULL, false, 'ESCOLA DIEESE DE CIÊNCIAS DO TRABALHO (DIEESE)', 8);
INSERT INTO public.empresa VALUES (476, true, 1, '2023-07-02 12:35:20.41174', NULL, NULL, false, 'ESCOLA MUNICIPAL DE GESTÃO DO LEGISLATIVO (EMUGLE)', 160);
INSERT INTO public.empresa VALUES (477, true, 1, '2023-07-02 12:35:20.413314', NULL, NULL, false, 'ESCOLA NACIONAL DE ADMINISTRAÇÃO PÚBLICA (ENAP)', 5);
INSERT INTO public.empresa VALUES (478, true, 1, '2023-07-02 12:35:20.42212', NULL, NULL, false, 'ESCOLA NACIONAL DE CIÊNCIAS ESTATÍSTICAS (ENCE)', 12);
INSERT INTO public.empresa VALUES (479, true, 1, '2023-07-02 12:35:20.423585', NULL, NULL, false, 'ESCOLA SAÚDE PÚBLICA - ESPMT (ESPMT)', 203);
INSERT INTO public.empresa VALUES (480, true, 1, '2023-07-02 12:35:20.425114', NULL, NULL, false, 'ESCOLA SUPERIOR ABERTA DO BRASIL (ESAB)', 226);
INSERT INTO public.empresa VALUES (481, true, 1, '2023-07-02 12:35:20.42656', NULL, NULL, false, 'ESCOLA SUPERIOR ASSOCIADA DE GOIÂNIA (ESUP)', 42);
INSERT INTO public.empresa VALUES (482, true, 1, '2023-07-02 12:35:20.42789', NULL, NULL, false, 'ESCOLA SUPERIOR BATISTA DO AMAZONAS (ESBAM)', 75);
INSERT INTO public.empresa VALUES (483, true, 1, '2023-07-02 12:35:20.429022', NULL, NULL, false, 'ESCOLA SUPERIOR DA AMAZÔNIA DE ABAETETUBA (ESAMAZ)', 227);
INSERT INTO public.empresa VALUES (484, true, 1, '2023-07-02 12:35:20.435972', NULL, NULL, false, 'ESCOLA SUPERIOR DE AGRONOMIA DE PARAGUAÇU PAULISTA (ESAPP)', 228);
INSERT INTO public.empresa VALUES (485, true, 1, '2023-07-02 12:35:20.437289', NULL, NULL, false, 'ESCOLA SUPERIOR DE ARTES CÉLIA HELENA', 8);
INSERT INTO public.empresa VALUES (486, true, 1, '2023-07-02 12:35:20.43848', NULL, NULL, false, 'ESCOLA SUPERIOR DE AVIAÇÃO CIVIL (ESAC)', 147);
INSERT INTO public.empresa VALUES (487, true, 1, '2023-07-02 12:35:20.439853', NULL, NULL, false, 'ESCOLA SUPERIOR DE CATALÃO', 17);
INSERT INTO public.empresa VALUES (488, true, 1, '2023-07-02 12:35:20.441662', NULL, NULL, false, 'ESCOLA SUPERIOR DE CIÊNCIAS DA SANTA CASA DE MISERICÓRDIA DE VITÓRIA (EMESCAM)', 25);
INSERT INTO public.empresa VALUES (489, true, 1, '2023-07-02 12:35:20.443803', NULL, NULL, false, 'ESCOLA SUPERIOR DE CIÊNCIAS DA SAÚDE (ESCS)', 5);
INSERT INTO public.empresa VALUES (490, true, 1, '2023-07-02 12:35:20.45258', NULL, NULL, false, 'ESCOLA SUPERIOR DE CRICIÚMA - ESUCRI (ESUCRI)', 192);
INSERT INTO public.empresa VALUES (491, true, 1, '2023-07-02 12:35:20.454054', NULL, NULL, false, 'ESCOLA SUPERIOR DE CRUZEIRO "PREFEITO HAMILTON VIEIRA MENDES" (ESEFIC)', 229);
INSERT INTO public.empresa VALUES (492, true, 1, '2023-07-02 12:35:20.455387', NULL, NULL, false, 'ESCOLA SUPERIOR DE EDUCAÇÃO (ESJUS)', 2);
INSERT INTO public.empresa VALUES (493, true, 1, '2023-07-02 12:35:20.456753', NULL, NULL, false, 'ESCOLA SUPERIOR DE EDUCAÇÃO CORPORATIVA (ESEC)', 140);
INSERT INTO public.empresa VALUES (494, true, 1, '2023-07-02 12:35:20.458273', NULL, NULL, false, 'ESCOLA SUPERIOR DE EDUCAÇÃO E NEGÓCIOS (ESN)', 145);
INSERT INTO public.empresa VALUES (495, true, 1, '2023-07-02 12:35:20.459814', NULL, NULL, false, 'ESCOLA SUPERIOR DE EDUCAÇÃO FÍSICA DE JUNDIAÍ (ESEFJ)', 182);
INSERT INTO public.empresa VALUES (496, true, 1, '2023-07-02 12:35:20.466757', NULL, NULL, false, 'ESCOLA SUPERIOR DE ENGENHARIA E GESTÃO DE SÃO PAULO - ESEG (ESEG)', 8);
INSERT INTO public.empresa VALUES (497, true, 1, '2023-07-02 12:35:20.468073', NULL, NULL, false, 'ESCOLA SUPERIOR DE ENSINO HELENA ANTIPOFF (ESEHA)', 49);
INSERT INTO public.empresa VALUES (498, true, 1, '2023-07-02 12:35:20.46942', NULL, NULL, false, 'ESCOLA SUPERIOR DE GESTÃO (ESGE)', 5);
INSERT INTO public.empresa VALUES (499, true, 1, '2023-07-02 12:35:20.470768', NULL, NULL, false, 'ESCOLA SUPERIOR DE GESTÃO COMERCIAL E MARKETING (ESIC)', 56);
INSERT INTO public.empresa VALUES (500, true, 1, '2023-07-02 12:35:20.472258', NULL, NULL, false, 'ESCOLA SUPERIOR DE ITABIRA', 161);
INSERT INTO public.empresa VALUES (501, true, 1, '2023-07-02 12:35:20.473423', NULL, NULL, false, 'ESCOLA SUPERIOR DE MARKETING (ESM)', 60);
INSERT INTO public.empresa VALUES (502, true, 1, '2023-07-02 12:35:20.482293', NULL, NULL, false, 'ESCOLA SUPERIOR DE POUSO ALEGRE', 230);
INSERT INTO public.empresa VALUES (503, true, 1, '2023-07-02 12:35:20.483686', NULL, NULL, false, 'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING (ESPM)', 8);
INSERT INTO public.empresa VALUES (504, true, 1, '2023-07-02 12:35:20.485033', NULL, NULL, false, 'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING DE PORTO ALEGRE (ESPM - POA)', 149);
INSERT INTO public.empresa VALUES (505, true, 1, '2023-07-02 12:35:20.486361', NULL, NULL, false, 'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING DO RIO DE JANEIRO (ESPM)', 12);
INSERT INTO public.empresa VALUES (506, true, 1, '2023-07-02 12:35:20.487699', NULL, NULL, false, 'ESCOLA SUPERIOR DE SAÚDE DE ARCOVERDE (ESSA)', 15);
INSERT INTO public.empresa VALUES (507, true, 1, '2023-07-02 12:35:20.488922', NULL, NULL, false, 'ESCOLA SUPERIOR DE TECNOLOGIA & GESTÃO DE SANTA CATARINA (EST&G)', 3);
INSERT INTO public.empresa VALUES (508, true, 1, '2023-07-02 12:35:20.496299', NULL, NULL, false, 'ESCOLA SUPERIOR DE TEOLOGIA E ESPIRITUALIDADE FRANCISCANA (ESTEF)', 149);
INSERT INTO public.empresa VALUES (509, true, 1, '2023-07-02 12:35:20.49781', NULL, NULL, false, 'ESCOLA SUPERIOR DO AR (EAR)', 100);
INSERT INTO public.empresa VALUES (510, true, 1, '2023-07-02 12:35:20.499049', NULL, NULL, false, 'ESCOLA SUPERIOR DOM HELDER CÂMARA (ESDHC)', 2);
INSERT INTO public.empresa VALUES (511, true, 1, '2023-07-02 12:35:20.500391', NULL, NULL, false, 'ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO (ESCOLAMP)', 5);
INSERT INTO public.empresa VALUES (512, true, 1, '2023-07-02 12:35:20.501723', NULL, NULL, false, 'ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO DA UNIÃO (ESMPU)', 5);
INSERT INTO public.empresa VALUES (513, true, 1, '2023-07-02 12:35:20.503087', NULL, NULL, false, 'ESCOLA SUPERIOR DO SUL DE SANTA CATARINA', 192);
INSERT INTO public.empresa VALUES (514, true, 1, '2023-07-02 12:35:20.511894', NULL, NULL, false, 'ESCOLA SUPERIOR EM MEIO AMBIENTE (ESMA)', 231);
INSERT INTO public.empresa VALUES (515, true, 1, '2023-07-02 12:35:20.513341', NULL, NULL, false, 'ESCOLA SUPERIOR MADRE CELESTE (ESMAC)', 232);
INSERT INTO public.empresa VALUES (516, true, 1, '2023-07-02 12:35:20.514837', NULL, NULL, false, 'ESCOLA SUPERIOR NACIONAL DE SEGUROS (ESNS)', 12);
INSERT INTO public.empresa VALUES (517, true, 1, '2023-07-02 12:35:20.516173', NULL, NULL, false, 'ESCOLA SUPERIOR NACIONAL DE SEGUROS DE SÃO PAULO (ESNS-SP)', 8);
INSERT INTO public.empresa VALUES (518, true, 1, '2023-07-02 12:35:20.51751', NULL, NULL, false, 'ESCOLA SUPERIOR SÃO FRANCISCO DE ASSIS (ESFA)', 233);
INSERT INTO public.empresa VALUES (519, true, 1, '2023-07-02 12:35:20.518642', NULL, NULL, false, 'ESCOLA SUPERIOR SÃO JUDAS DE GUARULHOS', 100);
INSERT INTO public.empresa VALUES (520, true, 1, '2023-07-02 12:35:20.525578', NULL, NULL, false, 'ESCOLA SUPERIOR SÃO JUDAS DE SÃO BERNARDO DO CAMPO', 82);
INSERT INTO public.empresa VALUES (521, true, 1, '2023-07-02 12:35:20.526913', NULL, NULL, false, 'ESCOLA SUPERIOR UNA DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (522, true, 1, '2023-07-02 12:35:20.528235', NULL, NULL, false, 'ESCOLA SUPERIOR UNA DE ITUMBIARA', 234);
INSERT INTO public.empresa VALUES (523, true, 1, '2023-07-02 12:35:20.529571', NULL, NULL, false, 'ESTÁCIO FATERN - FACULDADE ESTÁCIO DO RIO GRANDE DO NORTE (ESTÁCIO FATERN)', 130);
INSERT INTO public.empresa VALUES (524, true, 1, '2023-07-02 12:35:20.530914', NULL, NULL, false, 'FACITEN - FACULDADE DE CIÊNCIAS E TECNOLOGIAS DE NATAL (FACITEN)', 130);
INSERT INTO public.empresa VALUES (525, true, 1, '2023-07-02 12:35:20.532299', NULL, NULL, false, 'FACUDADE IEDUCARE - FIED (FIED)', 235);
INSERT INTO public.empresa VALUES (526, true, 1, '2023-07-02 12:35:20.541233', NULL, NULL, false, 'FACUDADE UNINEVES', 107);
INSERT INTO public.empresa VALUES (527, true, 1, '2023-07-02 12:35:20.542799', NULL, NULL, false, 'FACULDADE 05 DE JULHO (F5)', 167);
INSERT INTO public.empresa VALUES (528, true, 1, '2023-07-02 12:35:20.54414', NULL, NULL, false, 'FACULDADE 2001', 60);
INSERT INTO public.empresa VALUES (529, true, 1, '2023-07-02 12:35:20.54549', NULL, NULL, false, 'FACULDADE 28 DE AGOSTO DE ENSINO E PESQUISA (28 DE AGOSTO)', 8);
INSERT INTO public.empresa VALUES (530, true, 1, '2023-07-02 12:35:20.546975', NULL, NULL, false, 'FACULDADE ABC DE GOIÂNIA (FABC)', 42);
INSERT INTO public.empresa VALUES (531, true, 1, '2023-07-02 12:35:20.548353', NULL, NULL, false, 'FACULDADE ABERTA DO TOCANTINS (FAT)', 236);
INSERT INTO public.empresa VALUES (532, true, 1, '2023-07-02 12:35:20.555169', NULL, NULL, false, 'FACULDADE ABRANGE ABC (FABRANGE)', 82);
INSERT INTO public.empresa VALUES (533, true, 1, '2023-07-02 12:35:20.556494', NULL, NULL, false, 'FACULDADE ADELINA MOURA - FAADEMA (FAADEMA)', 237);
INSERT INTO public.empresa VALUES (534, true, 1, '2023-07-02 12:35:20.557821', NULL, NULL, false, 'FACULDADE ADELMAR ROSADO (FAR)', 27);
INSERT INTO public.empresa VALUES (535, true, 1, '2023-07-02 12:35:20.559154', NULL, NULL, false, 'FACULDADE ADJETIVO CETEP (ADJETIVO-CETEP)', 238);
INSERT INTO public.empresa VALUES (536, true, 1, '2023-07-02 12:35:20.560493', NULL, NULL, false, 'FACULDADE ADVENTISTA DA AMAZÔNIA (FAAMA)', 239);
INSERT INTO public.empresa VALUES (537, true, 1, '2023-07-02 12:35:20.561627', NULL, NULL, false, 'FACULDADE ADVENTISTA DA BAHIA (FADBA)', 240);
INSERT INTO public.empresa VALUES (538, true, 1, '2023-07-02 12:35:20.570399', NULL, NULL, false, 'FACULDADE ADVENTISTA DO PARANÁ (FAP)', 241);
INSERT INTO public.empresa VALUES (539, true, 1, '2023-07-02 12:35:20.571729', NULL, NULL, false, 'FACULDADE AFONSO MAFRENSE (FAM)', 242);
INSERT INTO public.empresa VALUES (540, true, 1, '2023-07-02 12:35:20.573068', NULL, NULL, false, 'FACULDADE ÁGAPE DE SÃO FÉLIX', 243);
INSERT INTO public.empresa VALUES (541, true, 1, '2023-07-02 12:35:20.574407', NULL, NULL, false, 'FACULDADE AGES DE JACOBINA (FACULDADE AGES)', 244);
INSERT INTO public.empresa VALUES (542, true, 1, '2023-07-02 12:35:20.575739', NULL, NULL, false, 'FACULDADE AGES DE MEDICINA (FACULDADE AGES)', 244);
INSERT INTO public.empresa VALUES (543, true, 1, '2023-07-02 12:35:20.577134', NULL, NULL, false, 'FACULDADE AGES DE MEDICINA DE IRECÊ (FACULDADE AGES)', 245);
INSERT INTO public.empresa VALUES (544, true, 1, '2023-07-02 12:35:20.584101', NULL, NULL, false, 'FACULDADE AGES DE SENHOR DO BONFIM (FACULDADE AGES)', 246);
INSERT INTO public.empresa VALUES (545, true, 1, '2023-07-02 12:35:20.585409', NULL, NULL, false, 'FACULDADE AGES DE TUCANO (FACULDADE AGES)', 247);
INSERT INTO public.empresa VALUES (546, true, 1, '2023-07-02 12:35:20.586745', NULL, NULL, false, 'FACULDADE ÁGORA - ADMINISTRAÇÃO, EDUCAÇÃO E CULTURA (FAAEC)', 56);
INSERT INTO public.empresa VALUES (547, true, 1, '2023-07-02 12:35:20.588084', NULL, NULL, false, 'FACULDADE ÁGORA - FAG (FAG)', 248);
INSERT INTO public.empresa VALUES (548, true, 1, '2023-07-02 12:35:20.589461', NULL, NULL, false, 'FACULDADE AIEC (AIEC / FAAB)', 5);
INSERT INTO public.empresa VALUES (549, true, 1, '2023-07-02 12:35:20.591001', NULL, NULL, false, 'FACULDADE AJES (AJES)', 6);
INSERT INTO public.empresa VALUES (550, true, 1, '2023-07-02 12:35:20.599758', NULL, NULL, false, 'FACULDADE ALAGOANA DE ADMINISTRAÇÃO (FAA)', 73);
INSERT INTO public.empresa VALUES (551, true, 1, '2023-07-02 12:35:20.601073', NULL, NULL, false, 'FACULDADE ALBERT EINSTEIN (FALBE)', 5);
INSERT INTO public.empresa VALUES (552, true, 1, '2023-07-02 12:35:20.602401', NULL, NULL, false, 'FACULDADE ALDETE MARIA ALVES (FAMA)', 249);
INSERT INTO public.empresa VALUES (553, true, 1, '2023-07-02 12:35:20.603742', NULL, NULL, false, 'FACULDADE ALFA AMÉRICA', 250);
INSERT INTO public.empresa VALUES (554, true, 1, '2023-07-02 12:35:20.605053', NULL, NULL, false, 'FACULDADE ALFA DE TEÓFILO OTONI (ALFA)', 7);
INSERT INTO public.empresa VALUES (555, true, 1, '2023-07-02 12:35:20.606197', NULL, NULL, false, 'FACULDADE ALFA UMUARAMA (ALFA)', 251);
INSERT INTO public.empresa VALUES (556, true, 1, '2023-07-02 12:35:20.613165', NULL, NULL, false, 'FACULDADE ALFAUNIPAC DE ALMENARA', 252);
INSERT INTO public.empresa VALUES (557, true, 1, '2023-07-02 12:35:20.614485', NULL, NULL, false, 'FACULDADE ALFAUNIPAC DE ARAÇUAÍ', 253);
INSERT INTO public.empresa VALUES (558, true, 1, '2023-07-02 12:35:20.615814', NULL, NULL, false, 'FACULDADE ALFAUNIPAC DE CAPELINHA', 254);
INSERT INTO public.empresa VALUES (559, true, 1, '2023-07-02 12:35:20.617171', NULL, NULL, false, 'FACULDADE ALFAUNIPAC DE GUANHÃES', 255);
INSERT INTO public.empresa VALUES (560, true, 1, '2023-07-02 12:35:20.61851', NULL, NULL, false, 'FACULDADE ALFREDO NASSER DE CASA NOVA (FAN)', 256);
INSERT INTO public.empresa VALUES (561, true, 1, '2023-07-02 12:35:20.619901', NULL, NULL, false, 'FACULDADE ALFREDO NASSER DE PONTALINA', 257);
INSERT INTO public.empresa VALUES (562, true, 1, '2023-07-02 12:35:20.628757', NULL, NULL, false, 'FACULDADE ALFREDO NASSER DE REMANSO', 258);
INSERT INTO public.empresa VALUES (563, true, 1, '2023-07-02 12:35:20.630207', NULL, NULL, false, 'FACULDADE ALIANÇA DE ITABERAI', 259);
INSERT INTO public.empresa VALUES (564, true, 1, '2023-07-02 12:35:20.631545', NULL, NULL, false, 'FACULDADE ALIANÇA DO MARANHÃO (FAMAR)', 141);
INSERT INTO public.empresa VALUES (565, true, 1, '2023-07-02 12:35:20.632879', NULL, NULL, false, 'FACULDADE ALIANÇA EDUCACIONAL DO ESTADO DE SÃO PAULO', 260);
INSERT INTO public.empresa VALUES (566, true, 1, '2023-07-02 12:35:20.634226', NULL, NULL, false, 'FACULDADE ALIS DE ITABIRITO', 261);
INSERT INTO public.empresa VALUES (567, true, 1, '2023-07-02 12:35:20.635613', NULL, NULL, false, 'FACULDADE ALMEIDA RODRIGUES (FAR)', 202);
INSERT INTO public.empresa VALUES (568, true, 1, '2023-07-02 12:35:20.642737', NULL, NULL, false, 'FACULDADE ALPHA (ALPHA)', 60);
INSERT INTO public.empresa VALUES (569, true, 1, '2023-07-02 12:35:20.644226', NULL, NULL, false, 'FACULDADE ALPHAVILLE (FAVI)', 158);
INSERT INTO public.empresa VALUES (570, true, 1, '2023-07-02 12:35:20.645554', NULL, NULL, false, 'FACULDADE ALURA.TECH (ALURA.TECH)', 8);
INSERT INTO public.empresa VALUES (571, true, 1, '2023-07-02 12:35:20.64689', NULL, NULL, false, 'FACULDADE ÁLVARES DE AZEVEDO (FAATESP)', 8);
INSERT INTO public.empresa VALUES (572, true, 1, '2023-07-02 12:35:20.648212', NULL, NULL, false, 'FACULDADE ALVES LIMA (FAAL)', 5);
INSERT INTO public.empresa VALUES (573, true, 1, '2023-07-02 12:35:20.649171', NULL, NULL, false, 'FACULDADE AMADEUS (FAMA)', 142);
INSERT INTO public.empresa VALUES (574, true, 1, '2023-07-02 12:35:20.658005', NULL, NULL, false, 'FACULDADE AMAZONAS', 262);
INSERT INTO public.empresa VALUES (575, true, 1, '2023-07-02 12:35:20.659481', NULL, NULL, false, 'FACULDADE AMÉRICA (AMÉRICA)', 190);
INSERT INTO public.empresa VALUES (576, true, 1, '2023-07-02 12:35:20.660981', NULL, NULL, false, 'FACULDADE AMERICAS INTERNATIONAL COLLEGE (FAMG)', 8);
INSERT INTO public.empresa VALUES (577, true, 1, '2023-07-02 12:35:20.662315', NULL, NULL, false, 'FACULDADE ANA CAROLINA PUGA (FAPUGA)', 8);
INSERT INTO public.empresa VALUES (578, true, 1, '2023-07-02 12:35:20.66364', NULL, NULL, false, 'FACULDADE ANASPS (FANASPS)', 5);
INSERT INTO public.empresa VALUES (579, true, 1, '2023-07-02 12:35:20.665026', NULL, NULL, false, 'FACULDADE ANCHIETA DO RECIFE (FAR)', 60);
INSERT INTO public.empresa VALUES (580, true, 1, '2023-07-02 12:35:20.671991', NULL, NULL, false, 'FACULDADE ANCLIVEPA (ANCLIVEPA)', 8);
INSERT INTO public.empresa VALUES (581, true, 1, '2023-07-02 12:35:20.673496', NULL, NULL, false, 'FACULDADE ANCLIVEPA BRASÍLIA', 5);
INSERT INTO public.empresa VALUES (582, true, 1, '2023-07-02 12:35:20.674822', NULL, NULL, false, 'FACULDADE ANCLIVEPA DE GESTÃO E HUMANOLOGIA (FAGH)', 8);
INSERT INTO public.empresa VALUES (583, true, 1, '2023-07-02 12:35:20.676162', NULL, NULL, false, 'FACULDADE ANCLIVEPA DE NATAL', 130);
INSERT INTO public.empresa VALUES (584, true, 1, '2023-07-02 12:35:20.677498', NULL, NULL, false, 'FACULDADE ANCLIVEPA SÃO PAULO (ANCLIVEPA SP)', 8);
INSERT INTO public.empresa VALUES (585, true, 1, '2023-07-02 12:35:20.67901', NULL, NULL, false, 'FACULDADE ANDREOTTI DE MARINGÁ (FAM)', 76);
INSERT INTO public.empresa VALUES (586, true, 1, '2023-07-02 12:35:20.687763', NULL, NULL, false, 'FACULDADE ANGEL VIANNA (FAV)', 12);
INSERT INTO public.empresa VALUES (587, true, 1, '2023-07-02 12:35:20.689081', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ALAGOINHAS (FPA)', 213);
INSERT INTO public.empresa VALUES (588, true, 1, '2023-07-02 12:35:20.690436', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ALVORADA', 263);
INSERT INTO public.empresa VALUES (589, true, 1, '2023-07-02 12:35:20.691763', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ANÁPOLIS', 264);
INSERT INTO public.empresa VALUES (590, true, 1, '2023-07-02 12:35:20.693108', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE BAURU', 93);
INSERT INTO public.empresa VALUES (591, true, 1, '2023-07-02 12:35:20.69572', NULL, NULL, false, 'FACULDADE ANHANGUERA DE BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (592, true, 1, '2023-07-02 12:35:20.703024', NULL, NULL, false, 'FACULDADE ANHANGUERA DE BETIM', 198);
INSERT INTO public.empresa VALUES (593, true, 1, '2023-07-02 12:35:20.704342', NULL, NULL, false, 'FACULDADE ANHANGUERA DE BRASÍLIA (ANHANGUERA DF)', 5);
INSERT INTO public.empresa VALUES (594, true, 1, '2023-07-02 12:35:20.705682', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CACHOEIRO DE ITAPEMIRIM', 190);
INSERT INTO public.empresa VALUES (595, true, 1, '2023-07-02 12:35:20.707053', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CAMAÇARI', 153);
INSERT INTO public.empresa VALUES (596, true, 1, '2023-07-02 12:35:20.708359', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE CAMPINAS', 177);
INSERT INTO public.empresa VALUES (597, true, 1, '2023-07-02 12:35:20.709745', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CARUARU', 156);
INSERT INTO public.empresa VALUES (598, true, 1, '2023-07-02 12:35:20.718517', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CASCAVEL', 54);
INSERT INTO public.empresa VALUES (599, true, 1, '2023-07-02 12:35:20.719846', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CATANDUVA (FAC)', 181);
INSERT INTO public.empresa VALUES (600, true, 1, '2023-07-02 12:35:20.721189', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CAXIAS DO SUL', 87);
INSERT INTO public.empresa VALUES (601, true, 1, '2023-07-02 12:35:20.722349', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CIÊNCIAS JURÍDICAS, GERENCIAIS E EDUCAÇÃO DE SINOP', 155);
INSERT INTO public.empresa VALUES (602, true, 1, '2023-07-02 12:35:20.723552', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CIÊNCIAS SOCIAIS APLICADAS DE SINOP (FACISAS)', 155);
INSERT INTO public.empresa VALUES (603, true, 1, '2023-07-02 12:35:20.724899', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CONTAGEM', 200);
INSERT INTO public.empresa VALUES (604, true, 1, '2023-07-02 12:35:20.731823', NULL, NULL, false, 'FACULDADE ANHANGUERA DE DIVINÓPOLIS', 19);
INSERT INTO public.empresa VALUES (605, true, 1, '2023-07-02 12:35:20.733153', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE DOURADOS', 84);
INSERT INTO public.empresa VALUES (606, true, 1, '2023-07-02 12:35:20.734323', NULL, NULL, false, 'FACULDADE ANHANGUERA DE FEIRA DE SANTANA', 99);
INSERT INTO public.empresa VALUES (607, true, 1, '2023-07-02 12:35:20.735688', NULL, NULL, false, 'FACULDADE ANHANGUERA DE GOIÂNIA', 42);
INSERT INTO public.empresa VALUES (608, true, 1, '2023-07-02 12:35:20.736988', NULL, NULL, false, 'FACULDADE ANHANGUERA DE GOVERNADOR VALADARES', 265);
INSERT INTO public.empresa VALUES (609, true, 1, '2023-07-02 12:35:20.737958', NULL, NULL, false, 'FACULDADE ANHANGUERA DE GUARAPARI', 266);
INSERT INTO public.empresa VALUES (610, true, 1, '2023-07-02 12:35:20.74693', NULL, NULL, false, 'FACULDADE ANHANGUERA DE GUARULHOS', 100);
INSERT INTO public.empresa VALUES (611, true, 1, '2023-07-02 12:35:20.748374', NULL, NULL, false, 'FACULDADE ANHANGUERA DE IMPERATRIZ', 267);
INSERT INTO public.empresa VALUES (612, true, 1, '2023-07-02 12:35:20.74938', NULL, NULL, false, 'FACULDADE ANHANGUERA DE INDAIATUBA', 11);
INSERT INTO public.empresa VALUES (613, true, 1, '2023-07-02 12:35:20.750767', NULL, NULL, false, 'FACULDADE ANHANGUERA DE IPATINGA', 268);
INSERT INTO public.empresa VALUES (614, true, 1, '2023-07-02 12:35:20.752055', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ITABUNA', 269);
INSERT INTO public.empresa VALUES (615, true, 1, '2023-07-02 12:35:20.753457', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ITAPECERICA DA SERRA', 270);
INSERT INTO public.empresa VALUES (616, true, 1, '2023-07-02 12:35:20.760454', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ITAPETININGA', 271);
INSERT INTO public.empresa VALUES (617, true, 1, '2023-07-02 12:35:20.761902', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ITAPEVA (FAI)', 272);
INSERT INTO public.empresa VALUES (618, true, 1, '2023-07-02 12:35:20.76328', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JACAREÍ', 273);
INSERT INTO public.empresa VALUES (619, true, 1, '2023-07-02 12:35:20.764582', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JAÚ (FAJ)', 274);
INSERT INTO public.empresa VALUES (620, true, 1, '2023-07-02 12:35:20.765906', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JEQUIÉ (FPJ)', 275);
INSERT INTO public.empresa VALUES (621, true, 1, '2023-07-02 12:35:20.767149', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JOINVILLE', 68);
INSERT INTO public.empresa VALUES (622, true, 1, '2023-07-02 12:35:20.776093', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JUAZEIRO DO NORTE', 135);
INSERT INTO public.empresa VALUES (623, true, 1, '2023-07-02 12:35:20.777096', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JUNDIAÍ', 182);
INSERT INTO public.empresa VALUES (624, true, 1, '2023-07-02 12:35:20.778434', NULL, NULL, false, 'FACULDADE ANHANGUERA DE LIMEIRA', 276);
INSERT INTO public.empresa VALUES (625, true, 1, '2023-07-02 12:35:20.779758', NULL, NULL, false, 'FACULDADE ANHANGUERA DE LINHARES', 277);
INSERT INTO public.empresa VALUES (626, true, 1, '2023-07-02 12:35:20.780745', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MACAPÁ', 26);
INSERT INTO public.empresa VALUES (627, true, 1, '2023-07-02 12:35:20.787682', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MACEIÓ', 73);
INSERT INTO public.empresa VALUES (628, true, 1, '2023-07-02 12:35:20.788994', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MARABÁ', 46);
INSERT INTO public.empresa VALUES (629, true, 1, '2023-07-02 12:35:20.790359', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MATÃO', 278);
INSERT INTO public.empresa VALUES (630, true, 1, '2023-07-02 12:35:20.79169', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MOGI GUAÇU (FAMG)', 279);
INSERT INTO public.empresa VALUES (631, true, 1, '2023-07-02 12:35:20.79302', NULL, NULL, false, 'FACULDADE ANHANGUERA DE OSASCO', 158);
INSERT INTO public.empresa VALUES (633, true, 1, '2023-07-02 12:35:20.803356', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PARAGOMINAS (FPP)', 280);
INSERT INTO public.empresa VALUES (634, true, 1, '2023-07-02 12:35:20.805316', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PARAUAPEBAS', 281);
INSERT INTO public.empresa VALUES (635, true, 1, '2023-07-02 12:35:20.80687', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PASSO FUNDO', 282);
INSERT INTO public.empresa VALUES (636, true, 1, '2023-07-02 12:35:20.80847', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PELOTAS', 283);
INSERT INTO public.empresa VALUES (637, true, 1, '2023-07-02 12:35:20.809925', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PINDAMONHANGABA', 162);
INSERT INTO public.empresa VALUES (638, true, 1, '2023-07-02 12:35:20.811288', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE PIRACICABA', 224);
INSERT INTO public.empresa VALUES (639, true, 1, '2023-07-02 12:35:20.818242', NULL, NULL, false, 'FACULDADE ANHANGUERA DE POÇOS DE CALDAS', 284);
INSERT INTO public.empresa VALUES (640, true, 1, '2023-07-02 12:35:20.819528', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PONTA GROSSA', 188);
INSERT INTO public.empresa VALUES (641, true, 1, '2023-07-02 12:35:20.820872', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PORTO ALEGRE', 149);
INSERT INTO public.empresa VALUES (642, true, 1, '2023-07-02 12:35:20.822208', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PRIMAVERA DO LESTE (FIPL)', 285);
INSERT INTO public.empresa VALUES (643, true, 1, '2023-07-02 12:35:20.823382', NULL, NULL, false, 'FACULDADE ANHANGUERA DE RIBEIRÃO DAS NEVES', 286);
INSERT INTO public.empresa VALUES (644, true, 1, '2023-07-02 12:35:20.824526', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE RIBEIRÃO PRETO', 58);
INSERT INTO public.empresa VALUES (645, true, 1, '2023-07-02 12:35:20.833283', NULL, NULL, false, 'FACULDADE ANHANGUERA DE RIO BRANCO', 143);
INSERT INTO public.empresa VALUES (646, true, 1, '2023-07-02 12:35:20.834599', NULL, NULL, false, 'FACULDADE ANHANGUERA DE RIO CLARO', 222);
INSERT INTO public.empresa VALUES (647, true, 1, '2023-07-02 12:35:20.835965', NULL, NULL, false, 'FACULDADE ANHANGUERA DE RONDONÓPOLIS (FAR)', 287);
INSERT INTO public.empresa VALUES (648, true, 1, '2023-07-02 12:35:20.837331', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SANTA BÁRBARA', 288);
INSERT INTO public.empresa VALUES (649, true, 1, '2023-07-02 12:35:20.838826', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SANTO ANTÔNIO DE JESUS', 96);
INSERT INTO public.empresa VALUES (650, true, 1, '2023-07-02 12:35:20.840407', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO BERNARDO', 82);
INSERT INTO public.empresa VALUES (651, true, 1, '2023-07-02 12:35:20.847442', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO JOÃO DE MERITI', 289);
INSERT INTO public.empresa VALUES (652, true, 1, '2023-07-02 12:35:20.848951', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE SÃO JOSÉ', 144);
INSERT INTO public.empresa VALUES (653, true, 1, '2023-07-02 12:35:20.850286', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO JOSÉ DO RIO PRETO (FASJRP)', 114);
INSERT INTO public.empresa VALUES (654, true, 1, '2023-07-02 12:35:20.851622', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO JOSÉ-SC (FASJ-SC)', 140);
INSERT INTO public.empresa VALUES (655, true, 1, '2023-07-02 12:35:20.852956', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO LUIZ', 141);
INSERT INTO public.empresa VALUES (656, true, 1, '2023-07-02 12:35:20.854354', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SERRA (FPS)', 290);
INSERT INTO public.empresa VALUES (657, true, 1, '2023-07-02 12:35:20.863387', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SERTÃOZINHO (FASERT)', 291);
INSERT INTO public.empresa VALUES (658, true, 1, '2023-07-02 12:35:20.864881', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SOBRAL', 167);
INSERT INTO public.empresa VALUES (659, true, 1, '2023-07-02 12:35:20.866214', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE SOROCABA (FSO)', 146);
INSERT INTO public.empresa VALUES (660, true, 1, '2023-07-02 12:35:20.867576', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SORRISO', 292);
INSERT INTO public.empresa VALUES (661, true, 1, '2023-07-02 12:35:20.868917', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SUMARÉ (FACSUMARÉ)', 293);
INSERT INTO public.empresa VALUES (662, true, 1, '2023-07-02 12:35:20.870079', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TABOÃO DA SERRA (FATS)', 212);
INSERT INTO public.empresa VALUES (663, true, 1, '2023-07-02 12:35:20.877086', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TANGARÁ DA SERRA (FITS)', 294);
INSERT INTO public.empresa VALUES (664, true, 1, '2023-07-02 12:35:20.878608', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TAUBATÉ', 33);
INSERT INTO public.empresa VALUES (665, true, 1, '2023-07-02 12:35:20.87995', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TECNOLOGIA DE BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (666, true, 1, '2023-07-02 12:35:20.881288', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TECNOLOGIA DE JUNDIAÍ', 182);
INSERT INTO public.empresa VALUES (667, true, 1, '2023-07-02 12:35:20.882622', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TEIXEIRA DE FREITAS', 295);
INSERT INTO public.empresa VALUES (668, true, 1, '2023-07-02 12:35:20.884023', NULL, NULL, false, 'FACULDADE ANHANGUERA DE UBERLÂNDIA', 134);
INSERT INTO public.empresa VALUES (669, true, 1, '2023-07-02 12:35:20.892958', NULL, NULL, false, 'FACULDADE ANHANGUERA DE VALINHOS', 296);
INSERT INTO public.empresa VALUES (670, true, 1, '2023-07-02 12:35:20.894481', NULL, NULL, false, 'FACULDADE ANHANGUERA DE VALPARAÍSO', 297);
INSERT INTO public.empresa VALUES (671, true, 1, '2023-07-02 12:35:20.895818', NULL, NULL, false, 'FACULDADE ANHANGUERA DE VITÓRIA DA CONQUISTA', 37);
INSERT INTO public.empresa VALUES (672, true, 1, '2023-07-02 12:35:20.897157', NULL, NULL, false, 'FACULDADE ANHANGUERA DO AMAZONAS', 75);
INSERT INTO public.empresa VALUES (673, true, 1, '2023-07-02 12:35:20.898502', NULL, NULL, false, 'FACULDADE ANHANGUERA DO CEARÁ', 45);
INSERT INTO public.empresa VALUES (674, true, 1, '2023-07-02 12:35:20.899892', NULL, NULL, false, 'FACULDADE ANHANGUERA DO MARANHÃO', 141);
INSERT INTO public.empresa VALUES (675, true, 1, '2023-07-02 12:35:20.907134', NULL, NULL, false, 'FACULDADE ANHANGUERA DO RIO GRANDE', 298);
INSERT INTO public.empresa VALUES (676, true, 1, '2023-07-02 12:35:20.909051', NULL, NULL, false, 'FACULDADE ANHANGUERA FRANCA (FAF)', 179);
INSERT INTO public.empresa VALUES (677, true, 1, '2023-07-02 12:35:20.910516', NULL, NULL, false, 'FACULDADE ANHANGUERA ITABIRA', 161);
INSERT INTO public.empresa VALUES (678, true, 1, '2023-07-02 12:35:20.911845', NULL, NULL, false, 'FACULDADE ANHANGUERA JARAGUÁ DO SUL', 31);
INSERT INTO public.empresa VALUES (679, true, 1, '2023-07-02 12:35:20.913172', NULL, NULL, false, 'FACULDADE ANHANGUERA PITÁGORAS DE JUNDIAÍ', 182);
INSERT INTO public.empresa VALUES (680, true, 1, '2023-07-02 12:35:20.914311', NULL, NULL, false, 'FACULDADE ANHANGUERA PITÁGORAS VOTORANTIM (-)', 299);
INSERT INTO public.empresa VALUES (681, true, 1, '2023-07-02 12:35:20.923113', NULL, NULL, false, 'FACULDADE ANHANGUERA UNIDADE GUARAPARI', 266);
INSERT INTO public.empresa VALUES (682, true, 1, '2023-07-02 12:35:20.924596', NULL, NULL, false, 'FACULDADE ANHANGUERA UNIDADE PARAGOMINAS', 280);
INSERT INTO public.empresa VALUES (683, true, 1, '2023-07-02 12:35:20.926139', NULL, NULL, false, 'FACULDADE ANHANGUERA UNIDADE PARAUAPEBAS', 281);
INSERT INTO public.empresa VALUES (684, true, 1, '2023-07-02 12:35:20.927469', NULL, NULL, false, 'FACULDADE ANHANGUERA UNIME DE SALVADOR', 116);
INSERT INTO public.empresa VALUES (685, true, 1, '2023-07-02 12:35:20.928794', NULL, NULL, false, 'FACULDADE ANÍSIO TEIXEIRA DE FEIRA DE SANTANA (FAT)', 99);
INSERT INTO public.empresa VALUES (686, true, 1, '2023-07-02 12:35:20.930192', NULL, NULL, false, 'FACULDADE ANTÔNIO MENEGHETTI (AMF)', 300);
INSERT INTO public.empresa VALUES (687, true, 1, '2023-07-02 12:35:20.937191', NULL, NULL, false, 'FACULDADE APOGEU (APOGEU)', 5);
INSERT INTO public.empresa VALUES (688, true, 1, '2023-07-02 12:35:20.938725', NULL, NULL, false, 'FACULDADE ÁREA1 WYDEN (ÁREA1 WYDEN)', 116);
INSERT INTO public.empresa VALUES (689, true, 1, '2023-07-02 12:35:20.940064', NULL, NULL, false, 'FACULDADE ARIANO SUASSUNA - UNIVAS', 262);
INSERT INTO public.empresa VALUES (690, true, 1, '2023-07-02 12:35:20.94144', NULL, NULL, false, 'FACULDADE ARI DE SÁ (FAS)', 45);
INSERT INTO public.empresa VALUES (691, true, 1, '2023-07-02 12:35:20.942743', NULL, NULL, false, 'FACULDADE ARNALDO JANSSEN (FAJANSSEN)', 2);
INSERT INTO public.empresa VALUES (692, true, 1, '2023-07-02 12:35:20.944141', NULL, NULL, false, 'FACULDADE ARQUIDIOCESANA DE CURVELO (FAC)', 301);
INSERT INTO public.empresa VALUES (693, true, 1, '2023-07-02 12:35:20.952937', NULL, NULL, false, 'FACULDADE ARQUIDIOCESANA DE PIRAPORA (FAP)', 302);
INSERT INTO public.empresa VALUES (694, true, 1, '2023-07-02 12:35:20.954249', NULL, NULL, false, 'FACULDADE ASA DE BRUMADINHO (IECEMB - FAB)', 303);
INSERT INTO public.empresa VALUES (695, true, 1, '2023-07-02 12:35:20.95556', NULL, NULL, false, 'FACULDADE ASSEMBLEIANA DO BRASIL', 42);
INSERT INTO public.empresa VALUES (696, true, 1, '2023-07-02 12:35:20.956905', NULL, NULL, false, 'FACULDADE ASSIS GURGACZ (FAG TOLEDO)', 304);
INSERT INTO public.empresa VALUES (697, true, 1, '2023-07-02 12:35:20.95824', NULL, NULL, false, 'FACULDADE ASSOCIADA BRASIL (FAB)', 8);
INSERT INTO public.empresa VALUES (698, true, 1, '2023-07-02 12:35:20.959368', NULL, NULL, false, 'FACULDADE ASSOCIADA BRASIL - EAD', 8);
INSERT INTO public.empresa VALUES (699, true, 1, '2023-07-02 12:35:20.966354', NULL, NULL, false, 'FACULDADE ASTORGA (FAAST)', 305);
INSERT INTO public.empresa VALUES (700, true, 1, '2023-07-02 12:35:20.96788', NULL, NULL, false, 'FACULDADE ATAME (ATAME)', 5);
INSERT INTO public.empresa VALUES (701, true, 1, '2023-07-02 12:35:20.969417', NULL, NULL, false, 'FACULDADE ATENAS CENTRO DE MATO GROSSO', 292);
INSERT INTO public.empresa VALUES (702, true, 1, '2023-07-02 12:35:20.970892', NULL, NULL, false, 'FACULDADE ATENAS CENTRO DE MINAS', 24);
INSERT INTO public.empresa VALUES (703, true, 1, '2023-07-02 12:35:20.972328', NULL, NULL, false, 'FACULDADE ATENAS DO SUL BAIANO', 306);
INSERT INTO public.empresa VALUES (704, true, 1, '2023-07-02 12:35:20.973757', NULL, NULL, false, 'FACULDADE ATENAS PASSOS', 307);
INSERT INTO public.empresa VALUES (705, true, 1, '2023-07-02 12:35:20.982466', NULL, NULL, false, 'FACULDADE ATENAS PORTO SEGURO', 308);
INSERT INTO public.empresa VALUES (706, true, 1, '2023-07-02 12:35:20.983885', NULL, NULL, false, 'FACULDADE ATENAS SETE LAGOAS', 24);
INSERT INTO public.empresa VALUES (707, true, 1, '2023-07-02 12:35:20.985227', NULL, NULL, false, 'FACULDADE ATENAS SORRISO', 292);
INSERT INTO public.empresa VALUES (708, true, 1, '2023-07-02 12:35:20.986558', NULL, NULL, false, 'FACULDADE ATENAS SUL DE MINAS', 307);
INSERT INTO public.empresa VALUES (709, true, 1, '2023-07-02 12:35:20.987895', NULL, NULL, false, 'FACULDADE ATENAS VALENÇA', 306);
INSERT INTO public.empresa VALUES (710, true, 1, '2023-07-02 12:35:20.989289', NULL, NULL, false, 'FACULDADE ATITUDE DE EDUCAÇÃO CONTINUADA (FAEC)', 309);
INSERT INTO public.empresa VALUES (711, true, 1, '2023-07-02 12:35:20.996316', NULL, NULL, false, 'FACULDADE ATTICUS', 124);
INSERT INTO public.empresa VALUES (712, true, 1, '2023-07-02 12:35:20.997726', NULL, NULL, false, 'FACULDADE ATUALIZA (ATUALIZA)', 116);
INSERT INTO public.empresa VALUES (713, true, 1, '2023-07-02 12:35:20.999057', NULL, NULL, false, 'FACULDADE AUDEN EDUCACIONAL (FAED)', 8);
INSERT INTO public.empresa VALUES (714, true, 1, '2023-07-02 12:35:21.000363', NULL, NULL, false, 'FACULDADE AUTÔNOMA DE DIREITO (FADISP)', 8);
INSERT INTO public.empresa VALUES (715, true, 1, '2023-07-02 12:35:21.001717', NULL, NULL, false, 'FACULDADE AUTÔNOMA DO BRASIL - MACEIÓ (FBR MACEIÓ)', 73);
INSERT INTO public.empresa VALUES (716, true, 1, '2023-07-02 12:35:21.002881', NULL, NULL, false, 'FACULDADE BAHIANA DE ENGENHARIA E CIÊNCIAS SOCIAIS APLICADAS (FBE)', 116);
INSERT INTO public.empresa VALUES (717, true, 1, '2023-07-02 12:35:21.011792', NULL, NULL, false, 'FACULDADE BAIANA DE DIREITO E GESTÃO', 116);
INSERT INTO public.empresa VALUES (718, true, 1, '2023-07-02 12:35:21.013181', NULL, NULL, false, 'FACULDADE BAIANA DO SENHOR DO BONFIM (FABASB)', 246);
INSERT INTO public.empresa VALUES (719, true, 1, '2023-07-02 12:35:21.014522', NULL, NULL, false, 'FACULDADE BARÃO DE JEQUIRIÇA (FBJ DIGITAL)', 306);
INSERT INTO public.empresa VALUES (720, true, 1, '2023-07-02 12:35:21.015891', NULL, NULL, false, 'FACULDADE BARDDAL DE ARTES APLICADAS', 3);
INSERT INTO public.empresa VALUES (721, true, 1, '2023-07-02 12:35:21.017378', NULL, NULL, false, 'FACULDADE BARRETOS (FB)', 80);
INSERT INTO public.empresa VALUES (722, true, 1, '2023-07-02 12:35:21.018755', NULL, NULL, false, 'FACULDADE BARROS MELO RECIFE (UNIAESO)', 60);
INSERT INTO public.empresa VALUES (723, true, 1, '2023-07-02 12:35:21.025874', NULL, NULL, false, 'FACULDADE BATISTA BRASILEIRA (FBB)', 116);
INSERT INTO public.empresa VALUES (724, true, 1, '2023-07-02 12:35:21.027377', NULL, NULL, false, 'FACULDADE BATISTA DE MINAS GERAIS (FBMG)', 2);
INSERT INTO public.empresa VALUES (725, true, 1, '2023-07-02 12:35:21.028696', NULL, NULL, false, 'FACULDADE BATISTA DO CARIRI (FBC)', 310);
INSERT INTO public.empresa VALUES (726, true, 1, '2023-07-02 12:35:21.03003', NULL, NULL, false, 'FACULDADE BATISTA DO ESTADO DO RIO DE JANEIRO - FABERJ (FABERJ )', 160);
INSERT INTO public.empresa VALUES (727, true, 1, '2023-07-02 12:35:21.031376', NULL, NULL, false, 'FACULDADE BATISTA DO RIO DE JANEIRO (FABAT)', 12);
INSERT INTO public.empresa VALUES (728, true, 1, '2023-07-02 12:35:21.032598', NULL, NULL, false, 'FACULDADE BATISTA PIONEIRA', 311);
INSERT INTO public.empresa VALUES (729, true, 1, '2023-07-02 12:35:21.041701', NULL, NULL, false, 'FACULDADE BELA VISTA (FBV)', 8);
INSERT INTO public.empresa VALUES (730, true, 1, '2023-07-02 12:35:21.043585', NULL, NULL, false, 'FACULDADE BEM TE VI LTDA (FAC-BTV)', 56);
INSERT INTO public.empresa VALUES (731, true, 1, '2023-07-02 12:35:21.044892', NULL, NULL, false, 'FACULDADE BERTIOGA (FABE)', 312);
INSERT INTO public.empresa VALUES (732, true, 1, '2023-07-02 12:35:21.046216', NULL, NULL, false, 'FACULDADE BEZERRA DE ARAÚJO (FABA)', 12);
INSERT INTO public.empresa VALUES (733, true, 1, '2023-07-02 12:35:21.047552', NULL, NULL, false, 'FACULDADE BILAC DE SÃO JOSÉ DOS CAMPOS (BILAC)', 144);
INSERT INTO public.empresa VALUES (734, true, 1, '2023-07-02 12:35:21.048692', NULL, NULL, false, 'FACULDADE BIOPARK', 304);
INSERT INTO public.empresa VALUES (735, true, 1, '2023-07-02 12:35:21.055502', NULL, NULL, false, 'FACULDADE BIOPARK II (BIOPARK II)', 304);
INSERT INTO public.empresa VALUES (736, true, 1, '2023-07-02 12:35:21.056819', NULL, NULL, false, 'FACULDADE BIRIGUI (FABI)', 313);
INSERT INTO public.empresa VALUES (737, true, 1, '2023-07-02 12:35:21.058199', NULL, NULL, false, 'FACULDADE BOA ESPERANÇA (FABECA)', 314);
INSERT INTO public.empresa VALUES (738, true, 1, '2023-07-02 12:35:21.059513', NULL, NULL, false, 'FACULDADE BOAS NOVAS DE CIÊNCIAS TEOLÓGICAS, SOCIAIS E BIOTECNOLÓGICAS (FBNCTSB)', 75);
INSERT INTO public.empresa VALUES (739, true, 1, '2023-07-02 12:35:21.060862', NULL, NULL, false, 'FACULDADE BOOKPLAY', 10);
INSERT INTO public.empresa VALUES (740, true, 1, '2023-07-02 12:35:21.062382', NULL, NULL, false, 'FACULDADE BORGES DE MENDONÇA (FBM)', 3);
INSERT INTO public.empresa VALUES (741, true, 1, '2023-07-02 12:35:21.071313', NULL, NULL, false, 'FACULDADE BRASILEIRA CRISTÃ (FBC)', 290);
INSERT INTO public.empresa VALUES (742, true, 1, '2023-07-02 12:35:21.072675', NULL, NULL, false, 'FACULDADE BRASILEIRA DE CACHOEIRO', 190);
INSERT INTO public.empresa VALUES (743, true, 1, '2023-07-02 12:35:21.074128', NULL, NULL, false, 'FACULDADE BRASILEIRA DE EDUCAÇÃO E CULTURA (FABEC BRASIL)', 42);
INSERT INTO public.empresa VALUES (744, true, 1, '2023-07-02 12:35:21.075531', NULL, NULL, false, 'FACULDADE BRASILEIRA DE ENSINO, PESQUISA E EXTENSÃO (FABEX)', 107);
INSERT INTO public.empresa VALUES (745, true, 1, '2023-07-02 12:35:21.076882', NULL, NULL, false, 'FACULDADE BRASILEIRA DE ESTUDOS AVANÇADOS (FABEA)', 141);
INSERT INTO public.empresa VALUES (746, true, 1, '2023-07-02 12:35:21.078296', NULL, NULL, false, 'FACULDADE BRASILEIRA DE INOVAÇÃO (FABIN)', 149);
INSERT INTO public.empresa VALUES (747, true, 1, '2023-07-02 12:35:21.085201', NULL, NULL, false, 'FACULDADE BRASILEIRA DE NEGÓCIOS INOVADORES (FABRANI)', 315);
INSERT INTO public.empresa VALUES (748, true, 1, '2023-07-02 12:35:21.086599', NULL, NULL, false, 'FACULDADE BRASILEIRA DE TECNOLOGIA (FBT)', 99);
INSERT INTO public.empresa VALUES (749, true, 1, '2023-07-02 12:35:21.08793', NULL, NULL, false, 'FACULDADE BRASILEIRA DE TRIBUTAÇÃO (FBT)', 149);
INSERT INTO public.empresa VALUES (750, true, 1, '2023-07-02 12:35:21.089295', NULL, NULL, false, 'FACULDADE BRASILEIRA DIGITAL (FABRADI)', 8);
INSERT INTO public.empresa VALUES (751, true, 1, '2023-07-02 12:35:21.090651', NULL, NULL, false, 'FACULDADE BRASILEIRA DO RECÔNCAVO (FBBR)', 172);
INSERT INTO public.empresa VALUES (752, true, 1, '2023-07-02 12:35:21.091906', NULL, NULL, false, 'FACULDADE BRASIL EMPREENDER (FABEMP)', 134);
INSERT INTO public.empresa VALUES (753, true, 1, '2023-07-02 12:35:21.100842', NULL, NULL, false, 'FACULDADE BRASÍLIA (FBR)', 5);
INSERT INTO public.empresa VALUES (754, true, 1, '2023-07-02 12:35:21.103045', NULL, NULL, false, 'FACULDADE BRASIL NORTE (FABRAN)', 26);
INSERT INTO public.empresa VALUES (755, true, 1, '2023-07-02 12:35:21.104674', NULL, NULL, false, 'FACULDADE BRAVIUM (BRAVIUM)', 297);
INSERT INTO public.empresa VALUES (756, true, 1, '2023-07-02 12:35:21.105963', NULL, NULL, false, 'FACULDADE BSSP', 42);
INSERT INTO public.empresa VALUES (757, true, 1, '2023-07-02 12:35:21.107381', NULL, NULL, false, 'FACULDADE CALAFIORI (CALAFIORI)', 316);
INSERT INTO public.empresa VALUES (758, true, 1, '2023-07-02 12:35:21.108853', NULL, NULL, false, 'FACULDADE CAL DE ARTES CÊNICAS (FACULDADE CAL)', 12);
INSERT INTO public.empresa VALUES (759, true, 1, '2023-07-02 12:35:21.11575', NULL, NULL, false, 'FACULDADE CAMAQÜENSE DE CIÊNCIAS CONTÁBEIS E ADMINISTRATIVAS (FACCCA)', 317);
INSERT INTO public.empresa VALUES (760, true, 1, '2023-07-02 12:35:21.117188', NULL, NULL, false, 'FACULDADE CAMPOS BELOS (UNICAMPO)', 318);
INSERT INTO public.empresa VALUES (761, true, 1, '2023-07-02 12:35:21.118516', NULL, NULL, false, 'FACULDADE CAMPOS ELÍSEOS (FCE)', 8);
INSERT INTO public.empresa VALUES (762, true, 1, '2023-07-02 12:35:21.11968', NULL, NULL, false, 'FACULDADE CANADENSES NO BRASIL', 65);
INSERT INTO public.empresa VALUES (763, true, 1, '2023-07-02 12:35:21.121019', NULL, NULL, false, 'FACULDADE CANÇÃO NOVA (FCN)', 319);
INSERT INTO public.empresa VALUES (764, true, 1, '2023-07-02 12:35:21.122425', NULL, NULL, false, 'FACULDADE CÂNDIDO RONDON (FCR)', 203);
INSERT INTO public.empresa VALUES (765, true, 1, '2023-07-02 12:35:21.13135', NULL, NULL, false, 'FACULDADE CAPACITAR', 86);
INSERT INTO public.empresa VALUES (766, true, 1, '2023-07-02 12:35:21.132795', NULL, NULL, false, 'FACULDADE CASA BRANCA (FACAB)', 320);
INSERT INTO public.empresa VALUES (767, true, 1, '2023-07-02 12:35:21.134342', NULL, NULL, false, 'FACULDADE CASA DO ESTUDANTE (FACE)', 321);
INSERT INTO public.empresa VALUES (768, true, 1, '2023-07-02 12:35:21.135994', NULL, NULL, false, 'FACULDADE CÁSPER LÍBERO (FCL)', 8);
INSERT INTO public.empresa VALUES (769, true, 1, '2023-07-02 12:35:21.137468', NULL, NULL, false, 'FACULDADE CASTRO ALVES (FCA)', 116);
INSERT INTO public.empresa VALUES (770, true, 1, '2023-07-02 12:35:21.14508', NULL, NULL, false, 'FACULDADE CATHEDRAL (FACES)', 138);
INSERT INTO public.empresa VALUES (771, true, 1, '2023-07-02 12:35:21.146456', NULL, NULL, false, 'FACULDADE CATÓLICA CAVANIS DO SUDOESTE DO PARÁ (FCCSPA)', 322);
INSERT INTO public.empresa VALUES (772, true, 1, '2023-07-02 12:35:21.147844', NULL, NULL, false, 'FACULDADE CATÓLICA DA PARAÍBA', 189);
INSERT INTO public.empresa VALUES (773, true, 1, '2023-07-02 12:35:21.149119', NULL, NULL, false, 'FACULDADE CATÓLICA DE ABAETETUBA (FCAB)', 227);
INSERT INTO public.empresa VALUES (774, true, 1, '2023-07-02 12:35:21.150523', NULL, NULL, false, 'FACULDADE CATÓLICA DE ANÁPOLIS (CATÓLICA DE ANÁPOLIS)', 264);
INSERT INTO public.empresa VALUES (775, true, 1, '2023-07-02 12:35:21.159281', NULL, NULL, false, 'FACULDADE CATÓLICA DE BELÉM (FACBEL)', 232);
INSERT INTO public.empresa VALUES (776, true, 1, '2023-07-02 12:35:21.160822', NULL, NULL, false, 'FACULDADE CATÓLICA DE FEIRA DE SANTANA', 99);
INSERT INTO public.empresa VALUES (777, true, 1, '2023-07-02 12:35:21.162152', NULL, NULL, false, 'FACULDADE CATÓLICA DE FORTALEZA (FCF)', 45);
INSERT INTO public.empresa VALUES (778, true, 1, '2023-07-02 12:35:21.163491', NULL, NULL, false, 'FACULDADE CATÓLICA DE MATO GROSSO (FACC-MT)', 121);
INSERT INTO public.empresa VALUES (779, true, 1, '2023-07-02 12:35:21.164666', NULL, NULL, false, 'FACULDADE CATÓLICA DE POUSO ALEGRE (FACAPA)', 230);
INSERT INTO public.empresa VALUES (780, true, 1, '2023-07-02 12:35:21.166066', NULL, NULL, false, 'FACULDADE CATÓLICA DE RONDONIA (FCR)', 51);
INSERT INTO public.empresa VALUES (781, true, 1, '2023-07-02 12:35:21.172997', NULL, NULL, false, 'FACULDADE CATÓLICA DE SANTA CATARINA (FACASC)', 3);
INSERT INTO public.empresa VALUES (782, true, 1, '2023-07-02 12:35:21.174513', NULL, NULL, false, 'FACULDADE CATÓLICA DE SÃO JOSÉ DOS CAMPOS (CATÓLICA-SJC)', 144);
INSERT INTO public.empresa VALUES (783, true, 1, '2023-07-02 12:35:21.176278', NULL, NULL, false, 'FACULDADE CATÓLICA DE VÁRZEA GRANDE (FACC-VG)', 121);
INSERT INTO public.empresa VALUES (784, true, 1, '2023-07-02 12:35:21.177705', NULL, NULL, false, 'FACULDADE CATÓLICA DOM ORIONE (FACDO)', 196);
INSERT INTO public.empresa VALUES (785, true, 1, '2023-07-02 12:35:21.179037', NULL, NULL, false, 'FACULDADE CATÓLICA DO RIO GRANDE DO NORTE', 323);
INSERT INTO public.empresa VALUES (786, true, 1, '2023-07-02 12:35:21.180174', NULL, NULL, false, 'FACULDADE CATÓLICA IMACULADA CONCEIÇÃO DO RECIFE (CATÓLICA)', 60);
INSERT INTO public.empresa VALUES (787, true, 1, '2023-07-02 12:35:21.188995', NULL, NULL, false, 'FACULDADE CATÓLICA PAULISTA (FACAP)', 145);
INSERT INTO public.empresa VALUES (788, true, 1, '2023-07-02 12:35:21.190328', NULL, NULL, false, 'FACULDADE CATÓLICA RAINHA DA PAZ DE ARAPUTANGA (FCARP)', 324);
INSERT INTO public.empresa VALUES (789, true, 1, '2023-07-02 12:35:21.191732', NULL, NULL, false, 'FACULDADE CATÓLICA SALESIANA DE MACAÉ (FCSMA)', 325);
INSERT INTO public.empresa VALUES (790, true, 1, '2023-07-02 12:35:21.193185', NULL, NULL, false, 'FACULDADE CATÓLICA SANTA TERESINHA (FCST)', 326);
INSERT INTO public.empresa VALUES (791, true, 1, '2023-07-02 12:35:21.194527', NULL, NULL, false, 'FACULDADE CATUAÍ (ICES)', 327);
INSERT INTO public.empresa VALUES (792, true, 1, '2023-07-02 12:35:21.195897', NULL, NULL, false, 'FACULDADE CCI (FAC CCI)', 5);
INSERT INTO public.empresa VALUES (793, true, 1, '2023-07-02 12:35:21.202931', NULL, NULL, false, 'FACULDADE CDL', 45);
INSERT INTO public.empresa VALUES (794, true, 1, '2023-07-02 12:35:21.204314', NULL, NULL, false, 'FACULDADE CEAFI', 42);
INSERT INTO public.empresa VALUES (795, true, 1, '2023-07-02 12:35:21.205663', NULL, NULL, false, 'FACULDADE CEAM (CEAM)', 60);
INSERT INTO public.empresa VALUES (796, true, 1, '2023-07-02 12:35:21.206819', NULL, NULL, false, 'FACULDADE CEARENSE (FAC)', 45);
INSERT INTO public.empresa VALUES (797, true, 1, '2023-07-02 12:35:21.207991', NULL, NULL, false, 'FACULDADE CECAPE', 135);
INSERT INTO public.empresa VALUES (798, true, 1, '2023-07-02 12:35:21.209437', NULL, NULL, false, 'FACULDADE CEDIN (CEDIN)', 2);
INSERT INTO public.empresa VALUES (799, true, 1, '2023-07-02 12:35:21.218247', NULL, NULL, false, 'FACULDADE CENBRAP (CENBRAP)', 42);
INSERT INTO public.empresa VALUES (800, true, 1, '2023-07-02 12:35:21.219697', NULL, NULL, false, 'FACULDADE CENECISTA DE CAPIVARI (FACECAP)', 328);
INSERT INTO public.empresa VALUES (801, true, 1, '2023-07-02 12:35:21.221043', NULL, NULL, false, 'FACULDADE CENECISTA DE RIO BONITO (FACERB)', 329);
INSERT INTO public.empresa VALUES (802, true, 1, '2023-07-02 12:35:21.222338', NULL, NULL, false, 'FACULDADE CENECISTA DE SETE LAGOAS (FCSL)', 24);
INSERT INTO public.empresa VALUES (803, true, 1, '2023-07-02 12:35:21.223487', NULL, NULL, false, 'FACULDADE CENSUPEG', 68);
INSERT INTO public.empresa VALUES (804, true, 1, '2023-07-02 12:35:21.224477', NULL, NULL, false, 'FACULDADE CENTRAL DE CRISTALINA (FACEC)', 330);
INSERT INTO public.empresa VALUES (805, true, 1, '2023-07-02 12:35:21.231424', NULL, NULL, false, 'FACULDADE CENTRAL DO RECIFE CENTRO (FACENTRAL REC)', 60);
INSERT INTO public.empresa VALUES (806, true, 1, '2023-07-02 12:35:21.233358', NULL, NULL, false, 'FACULDADE CENTRO MATO-GROSSENSE', 292);
INSERT INTO public.empresa VALUES (807, true, 1, '2023-07-02 12:35:21.235022', NULL, NULL, false, 'FACULDADE CENTRO OESTE CATANDUVAS (FACOC)', 331);
INSERT INTO public.empresa VALUES (808, true, 1, '2023-07-02 12:35:21.236435', NULL, NULL, false, 'FACULDADE CENTRO PAULISTANO', 8);
INSERT INTO public.empresa VALUES (809, true, 1, '2023-07-02 12:35:21.237805', NULL, NULL, false, 'FACULDADE CENTRO SÃO PAULO (FACESP)', 8);
INSERT INTO public.empresa VALUES (810, true, 1, '2023-07-02 12:35:21.239188', NULL, NULL, false, 'FACULDADE CENTRO SUL', 332);
INSERT INTO public.empresa VALUES (811, true, 1, '2023-07-02 12:35:21.248054', NULL, NULL, false, 'FACULDADE CEPEP', 45);
INSERT INTO public.empresa VALUES (812, true, 1, '2023-07-02 12:35:21.249443', NULL, NULL, false, 'FACULDADE CERES (FACERES)', 114);
INSERT INTO public.empresa VALUES (813, true, 1, '2023-07-02 12:35:21.25077', NULL, NULL, false, 'FACULDADE CERRADO (FACE)', 5);
INSERT INTO public.empresa VALUES (814, true, 1, '2023-07-02 12:35:21.252115', NULL, NULL, false, 'FACULDADE CERS (CERS)', 60);
INSERT INTO public.empresa VALUES (815, true, 1, '2023-07-02 12:35:21.253454', NULL, NULL, false, 'FACULDADE CESAR (FCE)', 60);
INSERT INTO public.empresa VALUES (816, true, 1, '2023-07-02 12:35:21.254843', NULL, NULL, false, 'FACULDADE CESGRANRIO (FACESGRANRIO)', 12);
INSERT INTO public.empresa VALUES (817, true, 1, '2023-07-02 12:35:21.26194', NULL, NULL, false, 'FACULDADE CESMAC DO AGRESTE (CESMAC AGRESTE)', 333);
INSERT INTO public.empresa VALUES (818, true, 1, '2023-07-02 12:35:21.263511', NULL, NULL, false, 'FACULDADE CESMAC DO SERTÃO (CESMAC SERTÃO)', 334);
INSERT INTO public.empresa VALUES (819, true, 1, '2023-07-02 12:35:21.265065', NULL, NULL, false, 'FACULDADE CESMA DE MARACANAÚ (FACESMA)', 335);
INSERT INTO public.empresa VALUES (820, true, 1, '2023-07-02 12:35:21.266785', NULL, NULL, false, 'FACULDADE CESPU EUROPA BRASIL (FACCE)', 132);
INSERT INTO public.empresa VALUES (821, true, 1, '2023-07-02 12:35:21.268617', NULL, NULL, false, 'FACULDADE CESUMAR DE CAMPO GRANDE (FACCESUMAR)', 48);
INSERT INTO public.empresa VALUES (822, true, 1, '2023-07-02 12:35:21.270115', NULL, NULL, false, 'FACULDADE CESUMAR DE GUARAPUAVA (FAC-CESUMAR)', 64);
INSERT INTO public.empresa VALUES (823, true, 1, '2023-07-02 12:35:21.278799', NULL, NULL, false, 'FACULDADE CESUMAR DE LONDRINA (FAC-CESUMAR)', 159);
INSERT INTO public.empresa VALUES (824, true, 1, '2023-07-02 12:35:21.280465', NULL, NULL, false, 'FACULDADE CESUMAR DE PONTA GROSSA (FAC-CESUMAR)', 188);
INSERT INTO public.empresa VALUES (825, true, 1, '2023-07-02 12:35:21.281765', NULL, NULL, false, 'FACULDADE CESURG MARAU', 336);
INSERT INTO public.empresa VALUES (826, true, 1, '2023-07-02 12:35:21.283092', NULL, NULL, false, 'FACULDADE CESUSC', 3);
INSERT INTO public.empresa VALUES (827, true, 1, '2023-07-02 12:35:21.28443', NULL, NULL, false, 'FACULDADE CETRUS SANAR (CETRUS)', 8);
INSERT INTO public.empresa VALUES (828, true, 1, '2023-07-02 12:35:21.285655', NULL, NULL, false, 'FACULDADE CGESP GOIANIA (FAC CGESP)', 42);
INSERT INTO public.empresa VALUES (829, true, 1, '2023-07-02 12:35:21.292721', NULL, NULL, false, 'FACULDADE CHRISTUS (CHRISTUS EUSÉBIO)', 337);
INSERT INTO public.empresa VALUES (830, true, 1, '2023-07-02 12:35:21.294283', NULL, NULL, false, 'FACULDADE CIDADE DE APARECIDA DE GOIÂNIA (FACCIDADE)', 41);
INSERT INTO public.empresa VALUES (831, true, 1, '2023-07-02 12:35:21.295672', NULL, NULL, false, 'FACULDADE CIDADE DE COROMANDEL (FCC)', 338);
INSERT INTO public.empresa VALUES (832, true, 1, '2023-07-02 12:35:21.297166', NULL, NULL, false, 'FACULDADE CIDADE DE JOÃO PINHEIRO (FCJP)', 339);
INSERT INTO public.empresa VALUES (833, true, 1, '2023-07-02 12:35:21.298711', NULL, NULL, false, 'FACULDADE CIDADE DE PATOS DE MINAS (FPM)', 112);
INSERT INTO public.empresa VALUES (834, true, 1, '2023-07-02 12:35:21.300593', NULL, NULL, false, 'FACULDADE CIDADE LUZ (FACILUZ)', 340);
INSERT INTO public.empresa VALUES (835, true, 1, '2023-07-02 12:35:21.309251', NULL, NULL, false, 'FACULDADE CIDADE TEOLÓGICA PENTECOSTAL (FCTP)', 45);
INSERT INTO public.empresa VALUES (836, true, 1, '2023-07-02 12:35:21.310911', NULL, NULL, false, 'FACULDADE CIÊNCIAS DA VIDA (FCV)', 24);
INSERT INTO public.empresa VALUES (837, true, 1, '2023-07-02 12:35:21.312395', NULL, NULL, false, 'FACULDADE CLARETIANA DE BRASILIA (FCB)', 5);
INSERT INTO public.empresa VALUES (838, true, 1, '2023-07-02 12:35:21.313735', NULL, NULL, false, 'FACULDADE CLARETIANA DE TEOLOGIA', 56);
INSERT INTO public.empresa VALUES (839, true, 1, '2023-07-02 12:35:21.315057', NULL, NULL, false, 'FACULDADE CLEBER LEITE (FCL)', 47);
INSERT INTO public.empresa VALUES (840, true, 1, '2023-07-02 12:35:21.316152', NULL, NULL, false, 'FACULDADE CLEBER LEITE - EAD (FCL - EAD)', 47);
INSERT INTO public.empresa VALUES (841, true, 1, '2023-07-02 12:35:21.322982', NULL, NULL, false, 'FACULDADE CMB (CMB)', 149);
INSERT INTO public.empresa VALUES (842, true, 1, '2023-07-02 12:35:21.324314', NULL, NULL, false, 'FACULDADE CNEC ALBERTO TORRES', 341);
INSERT INTO public.empresa VALUES (843, true, 1, '2023-07-02 12:35:21.325619', NULL, NULL, false, 'FACULDADE CNEC CAMPO LARGO', 342);
INSERT INTO public.empresa VALUES (844, true, 1, '2023-07-02 12:35:21.326943', NULL, NULL, false, 'FACULDADE CNEC CAPITÃO LEMOS CUNHA', 12);
INSERT INTO public.empresa VALUES (845, true, 1, '2023-07-02 12:35:21.328132', NULL, NULL, false, 'FACULDADE CNEC DE EDUCAÇÃO DE UBERABA (FACEUB)', 118);
INSERT INTO public.empresa VALUES (846, true, 1, '2023-07-02 12:35:21.329531', NULL, NULL, false, 'FACULDADE CNEC FARROUPILHA', 343);
INSERT INTO public.empresa VALUES (847, true, 1, '2023-07-02 12:35:21.338284', NULL, NULL, false, 'FACULDADE CNEC GRAVATAÍ', 344);
INSERT INTO public.empresa VALUES (848, true, 1, '2023-07-02 12:35:21.339828', NULL, NULL, false, 'FACULDADE CNEC ITAJAÍ', 345);
INSERT INTO public.empresa VALUES (849, true, 1, '2023-07-02 12:35:21.341195', NULL, NULL, false, 'FACULDADE CNEC JOINVILLE', 68);
INSERT INTO public.empresa VALUES (850, true, 1, '2023-07-02 12:35:21.342706', NULL, NULL, false, 'FACULDADE CNEC NOVA PETRÓPOLIS', 346);
INSERT INTO public.empresa VALUES (851, true, 1, '2023-07-02 12:35:21.344003', NULL, NULL, false, 'FACULDADE CNEC RIO DAS OSTRAS', 347);
INSERT INTO public.empresa VALUES (852, true, 1, '2023-07-02 12:35:21.345419', NULL, NULL, false, 'FACULDADE CNEC SANTO ÂNGELO', 348);
INSERT INTO public.empresa VALUES (853, true, 1, '2023-07-02 12:35:21.352367', NULL, NULL, false, 'FACULDADE CNEC UNAÍ', 349);
INSERT INTO public.empresa VALUES (854, true, 1, '2023-07-02 12:35:21.353669', NULL, NULL, false, 'FACULDADE CNEC VARGINHA', 133);
INSERT INTO public.empresa VALUES (855, true, 1, '2023-07-02 12:35:21.355017', NULL, NULL, false, 'FACULDADE COELHO NETO (FACNET)', 267);
INSERT INTO public.empresa VALUES (856, true, 1, '2023-07-02 12:35:21.356348', NULL, NULL, false, 'FACULDADE COGNITIVO (COGNITIVO)', 3);
INSERT INTO public.empresa VALUES (857, true, 1, '2023-07-02 12:35:21.357712', NULL, NULL, false, 'FACULDADE CONCEITO EDUCACIONAL (FACCON)', 15);
INSERT INTO public.empresa VALUES (858, true, 1, '2023-07-02 12:35:21.359045', NULL, NULL, false, 'FACULDADE CONCÓRDIA (FACC)', 350);
INSERT INTO public.empresa VALUES (859, true, 1, '2023-07-02 12:35:21.367915', NULL, NULL, false, 'FACULDADE CONECTADA FACONNECT (FACONNECT)', 351);
INSERT INTO public.empresa VALUES (860, true, 1, '2023-07-02 12:35:21.369464', NULL, NULL, false, 'FACULDADE CONEXÃO (CONEXÃO)', 352);
INSERT INTO public.empresa VALUES (861, true, 1, '2023-07-02 12:35:21.370801', NULL, NULL, false, 'FACULDADE CONHECIMENTO & CIÊNCIA (FCC)', 79);
INSERT INTO public.empresa VALUES (862, true, 1, '2023-07-02 12:35:21.372131', NULL, NULL, false, 'FACULDADE COSMOPOLITA', 79);
INSERT INTO public.empresa VALUES (863, true, 1, '2023-07-02 12:35:21.37348', NULL, NULL, false, 'FACULDADE COTEMIG (COTEMIG)', 2);
INSERT INTO public.empresa VALUES (864, true, 1, '2023-07-02 12:35:21.375018', NULL, NULL, false, 'FACULDADE CRISTÃ DA CIDADE (FCC)', 144);
INSERT INTO public.empresa VALUES (865, true, 1, '2023-07-02 12:35:21.381751', NULL, NULL, false, 'FACULDADE CRISTÃ DE CURITIBA (FCC)', 56);
INSERT INTO public.empresa VALUES (866, true, 1, '2023-07-02 12:35:21.383193', NULL, NULL, false, 'FACULDADE CRISTO REI (FACCREI)', 353);
INSERT INTO public.empresa VALUES (867, true, 1, '2023-07-02 12:35:21.384517', NULL, NULL, false, 'FACULDADE CTA (CTA)', 8);
INSERT INTO public.empresa VALUES (868, true, 1, '2023-07-02 12:35:21.385848', NULL, NULL, false, 'FACULDADE CUIABÁ (FAUC)', 203);
INSERT INTO public.empresa VALUES (869, true, 1, '2023-07-02 12:35:21.387188', NULL, NULL, false, 'FACULDADE CULTURA INGLESA (FCI)', 8);
INSERT INTO public.empresa VALUES (870, true, 1, '2023-07-02 12:35:21.388415', NULL, NULL, false, 'FACULDADE CURITIBANA (FAC)', 56);
INSERT INTO public.empresa VALUES (871, true, 1, '2023-07-02 12:35:21.397585', NULL, NULL, false, 'FACULDADE DA ALTA PAULISTA (FAP)', 354);
INSERT INTO public.empresa VALUES (872, true, 1, '2023-07-02 12:35:21.399469', NULL, NULL, false, 'FACULDADE DA AMAZÔNIA (FAMA)', 355);
INSERT INTO public.empresa VALUES (873, true, 1, '2023-07-02 12:35:21.400902', NULL, NULL, false, 'FACULDADE DA AMAZÔNIA (FAAM)', 232);
INSERT INTO public.empresa VALUES (874, true, 1, '2023-07-02 12:35:21.402249', NULL, NULL, false, 'FACULDADE DA AMAZÔNIA DE PORTO VELHO', 51);
INSERT INTO public.empresa VALUES (875, true, 1, '2023-07-02 12:35:21.403561', NULL, NULL, false, 'FACULDADE DA AMAZÔNIA LEGAL (FAMA)', 356);
INSERT INTO public.empresa VALUES (876, true, 1, '2023-07-02 12:35:21.404661', NULL, NULL, false, 'FACULDADE DA ASSOCIAÇÃO BRASILIENSE DE EDUCAÇÃO (FABE)', 336);
INSERT INTO public.empresa VALUES (877, true, 1, '2023-07-02 12:35:21.41167', NULL, NULL, false, 'FACULDADE DA ASSOCIAÇÃO MÉDICA PAULISTA (APM)', 8);
INSERT INTO public.empresa VALUES (878, true, 1, '2023-07-02 12:35:21.413131', NULL, NULL, false, 'FACULDADE DA CIDADE DE MACEIÓ (FACIMA)', 73);
INSERT INTO public.empresa VALUES (879, true, 1, '2023-07-02 12:35:21.41447', NULL, NULL, false, 'FACULDADE DA CONSTRUÇÃO E DO TRABALHO (FACT)', 8);
INSERT INTO public.empresa VALUES (880, true, 1, '2023-07-02 12:35:21.415785', NULL, NULL, false, 'FACULDADE DA ESCADA (FAESC)', 357);
INSERT INTO public.empresa VALUES (881, true, 1, '2023-07-02 12:35:21.417125', NULL, NULL, false, 'FACULDADE DA FRATERNIDADE DE VALENÇA (FFV)', 306);
INSERT INTO public.empresa VALUES (882, true, 1, '2023-07-02 12:35:21.418519', NULL, NULL, false, 'FACULDADE DA FUNDAÇÃO EDUCACIONAL ARAÇATUBA (FAC-FEA)', 197);
INSERT INTO public.empresa VALUES (883, true, 1, '2023-07-02 12:35:21.427425', NULL, NULL, false, 'FACULDADE DAMA', 358);
INSERT INTO public.empresa VALUES (884, true, 1, '2023-07-02 12:35:21.428985', NULL, NULL, false, 'FACULDADE DAMAS DA INSTRUÇÃO CRISTÃ (FADIC)', 60);
INSERT INTO public.empresa VALUES (885, true, 1, '2023-07-02 12:35:21.430323', NULL, NULL, false, 'FACULDADE DAMÁSIO (DAMASIO)', 8);
INSERT INTO public.empresa VALUES (886, true, 1, '2023-07-02 12:35:21.431732', NULL, NULL, false, 'FACULDADE DAMÁSIO EDUCACIONAL (FDE)', 8);
INSERT INTO public.empresa VALUES (887, true, 1, '2023-07-02 12:35:21.433393', NULL, NULL, false, 'FACULDADE DA POLÍCIA MILITAR (FPM)', 42);
INSERT INTO public.empresa VALUES (888, true, 1, '2023-07-02 12:35:21.434888', NULL, NULL, false, 'FACULDADE DA POLÍCIA MILITAR DE SANTA CATARINA (FAPOM)', 3);
INSERT INTO public.empresa VALUES (889, true, 1, '2023-07-02 12:35:21.441999', NULL, NULL, false, 'FACULDADE DA REGIÃO DOS LAGOS (FERLAGOS)', 359);
INSERT INTO public.empresa VALUES (890, true, 1, '2023-07-02 12:35:21.443833', NULL, NULL, false, 'FACULDADE DA REGIÃO SERRANA (FARESE)', 360);
INSERT INTO public.empresa VALUES (891, true, 1, '2023-07-02 12:35:21.44533', NULL, NULL, false, 'FACULDADE DA REGIÃO SISALEIRA (FARESI)', 361);
INSERT INTO public.empresa VALUES (892, true, 1, '2023-07-02 12:35:21.446646', NULL, NULL, false, 'FACULDADE DAS ATIVIDADES EMPRESARIAIS DE TERESINA (FAETE)', 27);
INSERT INTO public.empresa VALUES (893, true, 1, '2023-07-02 12:35:21.44801', NULL, NULL, false, 'FACULDADE DA SAÚDE E ECOLOGIA HUMANA (FASEH)', 362);
INSERT INTO public.empresa VALUES (894, true, 1, '2023-07-02 12:35:21.449119', NULL, NULL, false, 'FACULDADE DA SERRA GAÚCHA DE BENTO GONÇALVES', 77);
INSERT INTO public.empresa VALUES (895, true, 1, '2023-07-02 12:35:21.457802', NULL, NULL, false, 'FACULDADE DA SEUNE (SEUNE)', 73);
INSERT INTO public.empresa VALUES (896, true, 1, '2023-07-02 12:35:21.459253', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO CIÊNCIAS ECON E CONTÁBEIS DE GUARATINGUETÁ (FACEAG)', 363);
INSERT INTO public.empresa VALUES (897, true, 1, '2023-07-02 12:35:21.460581', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO, COMÉRCIO E EMPREENDEDORISMO (FACEM)', 364);
INSERT INTO public.empresa VALUES (898, true, 1, '2023-07-02 12:35:21.46192', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE CAMPO BELO (FACAMP)', 365);
INSERT INTO public.empresa VALUES (899, true, 1, '2023-07-02 12:35:21.463316', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE CATAGUASES (UNIPACAT)', 366);
INSERT INTO public.empresa VALUES (900, true, 1, '2023-07-02 12:35:21.464927', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE CHAPADÃO DO SUL (FACHASUL)', 367);
INSERT INTO public.empresa VALUES (901, true, 1, '2023-07-02 12:35:21.471725', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE FÁTIMA DO SUL (FAFS)', 368);
INSERT INTO public.empresa VALUES (902, true, 1, '2023-07-02 12:35:21.473156', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE ITABIRITO (FAI)', 261);
INSERT INTO public.empresa VALUES (903, true, 1, '2023-07-02 12:35:21.474576', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE MARIANA (FAMA)', 238);
INSERT INTO public.empresa VALUES (904, true, 1, '2023-07-02 12:35:21.475867', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE NOVA ANDRADINA - FANOVA (FANOVA)', 369);
INSERT INTO public.empresa VALUES (905, true, 1, '2023-07-02 12:35:21.477193', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE SANTA CRUZ DO RIO PARDO (FASC)', 370);
INSERT INTO public.empresa VALUES (906, true, 1, '2023-07-02 12:35:21.478601', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO E ARTES DE LIMEIRA (FAAL)', 276);
INSERT INTO public.empresa VALUES (907, true, 1, '2023-07-02 12:35:21.487403', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO E NEGÓCIOS (FAN)', 73);
INSERT INTO public.empresa VALUES (908, true, 1, '2023-07-02 12:35:21.488842', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO E NEGÓCIOS DE SERGIPE (FANESE)', 142);
INSERT INTO public.empresa VALUES (909, true, 1, '2023-07-02 12:35:21.490184', NULL, NULL, false, 'FACULDADE DE AGRONEGÓCIOS DE HOLAMBRA (FAAGROH)', 371);
INSERT INTO public.empresa VALUES (910, true, 1, '2023-07-02 12:35:21.491635', NULL, NULL, false, 'FACULDADE DE AGRONOMIA UNA DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (911, true, 1, '2023-07-02 12:35:21.49332', NULL, NULL, false, 'FACULDADE DE AGRONOMIA UNA DE ITUMBIARA', 234);
INSERT INTO public.empresa VALUES (912, true, 1, '2023-07-02 12:35:21.494478', NULL, NULL, false, 'FACULDADE DE AGUDOS (FAAG)', 372);
INSERT INTO public.empresa VALUES (913, true, 1, '2023-07-02 12:35:21.501489', NULL, NULL, false, 'FACULDADE DE ALTA FLORESTA (FAF)', 373);
INSERT INTO public.empresa VALUES (914, true, 1, '2023-07-02 12:35:21.502874', NULL, NULL, false, 'FACULDADE DE AMAMBAI (FIAMA)', 374);
INSERT INTO public.empresa VALUES (915, true, 1, '2023-07-02 12:35:21.504215', NULL, NULL, false, 'FACULDADE DE AMERICANA (FAM)', 187);
INSERT INTO public.empresa VALUES (916, true, 1, '2023-07-02 12:35:21.505558', NULL, NULL, false, 'FACULDADE DE AMPÉRE (FAMPER)', 375);
INSERT INTO public.empresa VALUES (917, true, 1, '2023-07-02 12:35:21.506713', NULL, NULL, false, 'FACULDADE DE ANICUNS (FA)', 376);
INSERT INTO public.empresa VALUES (918, true, 1, '2023-07-02 12:35:21.508239', NULL, NULL, false, 'FACULDADE DE APUCARANA (FAP)', 377);
INSERT INTO public.empresa VALUES (919, true, 1, '2023-07-02 12:35:21.516976', NULL, NULL, false, 'FACULDADE DE ARACAJU (FACAR)', 142);
INSERT INTO public.empresa VALUES (920, true, 1, '2023-07-02 12:35:21.518287', NULL, NULL, false, 'FACULDADE DE ARARAQUARA (FARA)', 378);
INSERT INTO public.empresa VALUES (921, true, 1, '2023-07-02 12:35:21.519624', NULL, NULL, false, 'FACULDADE DE ARTES DULCINA DE MORAES (FADM)', 5);
INSERT INTO public.empresa VALUES (922, true, 1, '2023-07-02 12:35:21.520957', NULL, NULL, false, 'FACULDADE DE ASSIS (FASS)', 379);
INSERT INTO public.empresa VALUES (923, true, 1, '2023-07-02 12:35:21.522291', NULL, NULL, false, 'FACULDADE DE BALSAS (UNIBALSAS)', 380);
INSERT INTO public.empresa VALUES (924, true, 1, '2023-07-02 12:35:21.523696', NULL, NULL, false, 'FACULDADE DE BARUERI (FCGB)', 381);
INSERT INTO public.empresa VALUES (925, true, 1, '2023-07-02 12:35:21.530901', NULL, NULL, false, 'FACULDADE DE BELÉM (FABEL)', 79);
INSERT INTO public.empresa VALUES (926, true, 1, '2023-07-02 12:35:21.532687', NULL, NULL, false, 'FACULDADE DE BELO HORIZONTE (FDR)', 2);
INSERT INTO public.empresa VALUES (927, true, 1, '2023-07-02 12:35:21.534143', NULL, NULL, false, 'FACULDADE DE BOITUVA (FIB)', 382);
INSERT INTO public.empresa VALUES (928, true, 1, '2023-07-02 12:35:21.535467', NULL, NULL, false, 'FACULDADE DE BOTUCATU (FDB)', 383);
INSERT INTO public.empresa VALUES (929, true, 1, '2023-07-02 12:35:21.536633', NULL, NULL, false, 'FACULDADE DE BRAGANÇA (FABRA)', 384);
INSERT INTO public.empresa VALUES (930, true, 1, '2023-07-02 12:35:21.537599', NULL, NULL, false, 'FACULDADE DE CAFELÂNDIA (FAC)', 385);
INSERT INTO public.empresa VALUES (931, true, 1, '2023-07-02 12:35:21.546519', NULL, NULL, false, 'FACULDADE DE CAIEIRAS', 386);
INSERT INTO public.empresa VALUES (932, true, 1, '2023-07-02 12:35:21.547927', NULL, NULL, false, 'FACULDADE DE CALDAS NOVAS (UNICALDAS)', 387);
INSERT INTO public.empresa VALUES (933, true, 1, '2023-07-02 12:35:21.549258', NULL, NULL, false, 'FACULDADE DE CAMPINA GRANDE (FAC-CG)', 147);
INSERT INTO public.empresa VALUES (934, true, 1, '2023-07-02 12:35:21.55063', NULL, NULL, false, 'FACULDADE DE CAMPINA GRANDE DO SUL (FACSUL)', 388);
INSERT INTO public.empresa VALUES (935, true, 1, '2023-07-02 12:35:21.551932', NULL, NULL, false, 'FACULDADE DE CARIACICA (FAC DE CARIACICA)', 389);
INSERT INTO public.empresa VALUES (936, true, 1, '2023-07-02 12:35:21.553319', NULL, NULL, false, 'FACULDADE DE CASTELO - MULTIVIX CASTELO (MULTIVIX CASTELO)', 390);
INSERT INTO public.empresa VALUES (937, true, 1, '2023-07-02 12:35:21.560233', NULL, NULL, false, 'FACULDADE DE CIÊNCIA E EDUCAÇÃO DO CAPARAÓ (FACEC)', 391);
INSERT INTO public.empresa VALUES (938, true, 1, '2023-07-02 12:35:21.561658', NULL, NULL, false, 'FACULDADE DE CIÊNCIA E TECNOLOGIA DE MONTES CLAROS (FACIT)', 128);
INSERT INTO public.empresa VALUES (939, true, 1, '2023-07-02 12:35:21.563183', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS AGRÁRIAS DE ANDRADINA (FCAA)', 392);
INSERT INTO public.empresa VALUES (940, true, 1, '2023-07-02 12:35:21.564913', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS AGRÁRIAS DE ARARIPINA (FACIAGRA)', 393);
INSERT INTO public.empresa VALUES (941, true, 1, '2023-07-02 12:35:21.566326', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS APLICADAS DE LIMOEIRO (FACAL)', 394);
INSERT INTO public.empresa VALUES (942, true, 1, '2023-07-02 12:35:21.567722', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS APLICADAS DE LIMOEIRO', 395);
INSERT INTO public.empresa VALUES (943, true, 1, '2023-07-02 12:35:21.576599', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS APLICADAS PIAUIENSE (FACAPI)', 396);
INSERT INTO public.empresa VALUES (944, true, 1, '2023-07-02 12:35:21.577995', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS BIOMÉDICAS DO ESPÍRITO SANTO (PIO XII - BIO)', 389);
INSERT INTO public.empresa VALUES (945, true, 1, '2023-07-02 12:35:21.579329', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS CONTÁBEIS (FACIC)', 116);
INSERT INTO public.empresa VALUES (946, true, 1, '2023-07-02 12:35:21.580715', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS CONTÁBEIS DE NOVA ANDRADINA - FACINAN (FACINAN)', 369);
INSERT INTO public.empresa VALUES (947, true, 1, '2023-07-02 12:35:21.582', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS CONTÁBEIS E ADMINISTRATIVAS DE CACHOEIRO DO ITAPEMIRIM (FACCACI)', 190);
INSERT INTO public.empresa VALUES (948, true, 1, '2023-07-02 12:35:21.583107', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS CONTÁBEIS E DE ADMINISTRAÇÃO DE EMPRESAS (FCCAE)', 12);
INSERT INTO public.empresa VALUES (949, true, 1, '2023-07-02 12:35:21.590046', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA AMAZÔNIA (FCA)', 26);
INSERT INTO public.empresa VALUES (950, true, 1, '2023-07-02 12:35:21.591414', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA BAHIA - FACIBA (FACIBA)', 116);
INSERT INTO public.empresa VALUES (951, true, 1, '2023-07-02 12:35:21.592747', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA FUNDAÇÃO INSTITUTO TECNOLÓGICO DE OSASCO (FAC-FITO)', 158);
INSERT INTO public.empresa VALUES (952, true, 1, '2023-07-02 12:35:21.594073', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE (FACS)', 142);
INSERT INTO public.empresa VALUES (953, true, 1, '2023-07-02 12:35:21.595398', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE ARCHIMEDES THEODORO (FAC - SAUDE ARTHE)', 397);
INSERT INTO public.empresa VALUES (954, true, 1, '2023-07-02 12:35:21.596861', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DE BARRETOS DR. PAULO PRATA (FACISB)', 80);
INSERT INTO public.empresa VALUES (955, true, 1, '2023-07-02 12:35:21.605673', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DE SÃO PAULO (FACIS)', 8);
INSERT INTO public.empresa VALUES (956, true, 1, '2023-07-02 12:35:21.607101', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DE SERRA TALHADA (FACISST)', 398);
INSERT INTO public.empresa VALUES (957, true, 1, '2023-07-02 12:35:21.608469', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DE UNAÍ (FACISA)', 349);
INSERT INTO public.empresa VALUES (958, true, 1, '2023-07-02 12:35:21.609775', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DO GRUPO HOSPITALAR CONCEIÇÃO (FACS - GHC)', 149);
INSERT INTO public.empresa VALUES (959, true, 1, '2023-07-02 12:35:21.611091', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE IGESP', 8);
INSERT INTO public.empresa VALUES (960, true, 1, '2023-07-02 12:35:21.612483', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE MOINHOS DE VENTO (FACSMV)', 149);
INSERT INTO public.empresa VALUES (961, true, 1, '2023-07-02 12:35:21.619449', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE PITÁGORAS DE CODÓ', 399);
INSERT INTO public.empresa VALUES (962, true, 1, '2023-07-02 12:35:21.620742', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE SÍRIO-LIBANÊS (SÍRIO-LIBANÊS)', 8);
INSERT INTO public.empresa VALUES (963, true, 1, '2023-07-02 12:35:21.622076', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DE GOIANA (FCG)', 400);
INSERT INTO public.empresa VALUES (964, true, 1, '2023-07-02 12:35:21.623376', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DE TIMBAÚBA (FACET)', 401);
INSERT INTO public.empresa VALUES (965, true, 1, '2023-07-02 12:35:21.624575', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DO TOCANTINS (FACIT)', 196);
INSERT INTO public.empresa VALUES (966, true, 1, '2023-07-02 12:35:21.625721', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS, EDUCAÇÃO E TEOLOGIA DO NORTE DO BRASIL (FACETEN)', 138);
INSERT INTO public.empresa VALUES (967, true, 1, '2023-07-02 12:35:21.634564', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS, EDUCAÇÃO, SAÚDE, PESQUISA E GESTÃO (FSF)', 402);
INSERT INTO public.empresa VALUES (968, true, 1, '2023-07-02 12:35:21.63592', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS EDUCACIONAIS DE CAPIM GROSSO (FCG)', 403);
INSERT INTO public.empresa VALUES (969, true, 1, '2023-07-02 12:35:21.637264', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS EDUCACIONAIS DO RIO GRANDE DO NORTE (FACERN)', 130);
INSERT INTO public.empresa VALUES (970, true, 1, '2023-07-02 12:35:21.63859', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS EDUCACIONAIS E EMPRESARIAIS DE NATAL (FACEN)', 130);
INSERT INTO public.empresa VALUES (971, true, 1, '2023-07-02 12:35:21.639921', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS EDUCACIONAIS E TECNOLOGIAS INTEGRADAS (FACETI)', 25);
INSERT INTO public.empresa VALUES (972, true, 1, '2023-07-02 12:35:21.641357', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E EDUCAÇÃO DO ESPÍRITO SANTO (UNIVES)', 25);
INSERT INTO public.empresa VALUES (973, true, 1, '2023-07-02 12:35:21.648605', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E EDUCAÇÃO EM SAÚDE (FACCESA)', 60);
INSERT INTO public.empresa VALUES (974, true, 1, '2023-07-02 12:35:21.650141', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E EDUCAÇÃO SENA AIRES (FACESA)', 297);
INSERT INTO public.empresa VALUES (975, true, 1, '2023-07-02 12:35:21.651676', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E LETRAS DE BRAGANÇA PAULISTA (FESB)', 404);
INSERT INTO public.empresa VALUES (976, true, 1, '2023-07-02 12:35:21.65312', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E SAÚDE EDUFOR (EDUFOR)', 141);
INSERT INTO public.empresa VALUES (977, true, 1, '2023-07-02 12:35:21.654508', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DA BAHIA (FACITE)', 405);
INSERT INTO public.empresa VALUES (978, true, 1, '2023-07-02 12:35:21.656003', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE BIRIGUI (FATEB)', 313);
INSERT INTO public.empresa VALUES (979, true, 1, '2023-07-02 12:35:21.665148', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE CHAPECÓ (FACITEC)', 406);
INSERT INTO public.empresa VALUES (980, true, 1, '2023-07-02 12:35:21.666906', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE JANAÚBA (FACITEC)', 407);
INSERT INTO public.empresa VALUES (981, true, 1, '2023-07-02 12:35:21.668504', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE TERESINA (FACET)', 27);
INSERT INTO public.empresa VALUES (982, true, 1, '2023-07-02 12:35:21.669799', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE UNAÍ - FACTU (FACTU)', 349);
INSERT INTO public.empresa VALUES (983, true, 1, '2023-07-02 12:35:21.671176', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA PASCHOAL DANTAS', 8);
INSERT INTO public.empresa VALUES (984, true, 1, '2023-07-02 12:35:21.672346', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA PROFESSOR DIRSON MACIEL DE BARROS (FADIMAB)', 400);
INSERT INTO public.empresa VALUES (985, true, 1, '2023-07-02 12:35:21.679484', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIAS DE CAMPOS GERAIS (FACICA)', 408);
INSERT INTO public.empresa VALUES (986, true, 1, '2023-07-02 12:35:21.681357', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS GERENCIAIS ALVES FORTES (FACE - ALFOR)', 397);
INSERT INTO public.empresa VALUES (987, true, 1, '2023-07-02 12:35:21.683175', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS GERENCIAIS DE SÃO GOTARDO (CESG)', 409);
INSERT INTO public.empresa VALUES (988, true, 1, '2023-07-02 12:35:21.684755', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS (IMENSU)', 410);
INSERT INTO public.empresa VALUES (989, true, 1, '2023-07-02 12:35:21.68604', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DE CURVELO (FACIC)', 301);
INSERT INTO public.empresa VALUES (990, true, 1, '2023-07-02 12:35:21.687259', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DE FORTALEZA (FCHFOR)', 45);
INSERT INTO public.empresa VALUES (991, true, 1, '2023-07-02 12:35:21.696726', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DE OLINDA (FACHO)', 39);
INSERT INTO public.empresa VALUES (992, true, 1, '2023-07-02 12:35:21.699012', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DE PERNAMBUCO (FCHPE)', 60);
INSERT INTO public.empresa VALUES (993, true, 1, '2023-07-02 12:35:21.70047', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DO ESTADO DE SÃO PAULO (FACIC)', 229);
INSERT INTO public.empresa VALUES (994, true, 1, '2023-07-02 12:35:21.701783', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DO SERTÃO CENTRAL (FACHUSC)', 411);
INSERT INTO public.empresa VALUES (995, true, 1, '2023-07-02 12:35:21.703109', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E EXATAS DO SERTÃO DO SÃO FRANCISCO (FACESF)', 28);
INSERT INTO public.empresa VALUES (996, true, 1, '2023-07-02 12:35:21.704472', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS APLICADAS DO CABO DE SANTO AGOSTINHO (FACHUCA)', 412);
INSERT INTO public.empresa VALUES (997, true, 1, '2023-07-02 12:35:21.711527', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DE ARARIPINA - FACISA (FACISA)', 393);
INSERT INTO public.empresa VALUES (998, true, 1, '2023-07-02 12:35:21.713053', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DE IGARASSU (FACIG)', 413);
INSERT INTO public.empresa VALUES (999, true, 1, '2023-07-02 12:35:21.714408', NULL, NULL, false, 'FACULDADE DE CIENCIAS HUMANAS E SOCIAIS DE SERRA TALHADA (FACHUSST)', 398);
INSERT INTO public.empresa VALUES (1000, true, 1, '2023-07-02 12:35:21.715753', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DO XINGU E AMAZÔNIA (FACX)', 14);
INSERT INTO public.empresa VALUES (1001, true, 1, '2023-07-02 12:35:21.717057', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS ESUDA (FCHE)', 60);
INSERT INTO public.empresa VALUES (1002, true, 1, '2023-07-02 12:35:21.718215', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS,EXATAS E DA SAÚDE DO PIAUÍ (FAHESP)', 176);
INSERT INTO public.empresa VALUES (1003, true, 1, '2023-07-02 12:35:21.727329', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS ANHANGUERA DE ARAPIRACA', 333);
INSERT INTO public.empresa VALUES (1004, true, 1, '2023-07-02 12:35:21.729552', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE ALTAMIRA', 14);
INSERT INTO public.empresa VALUES (1005, true, 1, '2023-07-02 12:35:21.731738', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE ASSIS', 379);
INSERT INTO public.empresa VALUES (1006, true, 1, '2023-07-02 12:35:21.733508', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE BELO JARDIM', 395);
INSERT INTO public.empresa VALUES (1007, true, 1, '2023-07-02 12:35:21.735108', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE BOM JESUS DA LAPA', 414);
INSERT INTO public.empresa VALUES (1008, true, 1, '2023-07-02 12:35:21.736608', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE CAMPINA GRANDE', 147);
INSERT INTO public.empresa VALUES (1009, true, 1, '2023-07-02 12:35:21.743868', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE CRUZ DAS ALMAS', 172);
INSERT INTO public.empresa VALUES (1010, true, 1, '2023-07-02 12:35:21.745601', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE ERECHIM', 415);
INSERT INTO public.empresa VALUES (1011, true, 1, '2023-07-02 12:35:21.746859', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE ITUMBIARA', 234);
INSERT INTO public.empresa VALUES (1012, true, 1, '2023-07-02 12:35:21.748197', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE JABOATÃO DOS GUARARAPES', 132);
INSERT INTO public.empresa VALUES (1013, true, 1, '2023-07-02 12:35:21.749485', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE JACOBINA', 244);
INSERT INTO public.empresa VALUES (1014, true, 1, '2023-07-02 12:35:21.750888', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE LUZIÂNIA', 98);
INSERT INTO public.empresa VALUES (1015, true, 1, '2023-07-02 12:35:21.759822', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE PARAÍSO DO TOCANTINS (FCJP)', 416);
INSERT INTO public.empresa VALUES (1016, true, 1, '2023-07-02 12:35:21.761675', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE SANTA MARIA (UNISM)', 417);
INSERT INTO public.empresa VALUES (1017, true, 1, '2023-07-02 12:35:21.763725', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE TUCURUÍ', 418);
INSERT INTO public.empresa VALUES (1018, true, 1, '2023-07-02 12:35:21.765296', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS CEMEPE (CEMEPE)', 2);
INSERT INTO public.empresa VALUES (1019, true, 1, '2023-07-02 12:35:21.766826', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DA PARAÍBA (FCM-PB)', 107);
INSERT INTO public.empresa VALUES (1020, true, 1, '2023-07-02 12:35:21.767887', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DA SANTA CASA SÃO PAULO (FCMSCSP)', 8);
INSERT INTO public.empresa VALUES (1021, true, 1, '2023-07-02 12:35:21.77484', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DE MARICÁ (FACMAR)', 419);
INSERT INTO public.empresa VALUES (1022, true, 1, '2023-07-02 12:35:21.776172', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DE MINAS GERAIS (FCMMG)', 2);
INSERT INTO public.empresa VALUES (1023, true, 1, '2023-07-02 12:35:21.777534', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DE SÃO JOSÉ DOS CAMPOS', 144);
INSERT INTO public.empresa VALUES (1024, true, 1, '2023-07-02 12:35:21.778865', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DE TRÊS RIOS (FCM/TR)', 420);
INSERT INTO public.empresa VALUES (1025, true, 1, '2023-07-02 12:35:21.780162', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DO PARÁ (FACIMPA)', 46);
INSERT INTO public.empresa VALUES (1026, true, 1, '2023-07-02 12:35:21.781559', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS E DA SAÚDE DE JUIZ DE FORA (FCMS/JF)', 38);
INSERT INTO public.empresa VALUES (1027, true, 1, '2023-07-02 12:35:21.790356', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS E JURÍDICA (FACMED)', 421);
INSERT INTO public.empresa VALUES (1028, true, 1, '2023-07-02 12:35:21.791685', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS ODONTOLÓGICAS (FCO)', 128);
INSERT INTO public.empresa VALUES (1029, true, 1, '2023-07-02 12:35:21.793028', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS (FACISA)', 423);
INSERT INTO public.empresa VALUES (1030, true, 1, '2023-07-02 12:35:21.7944', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE BELO HORIZONTE (FACISABH)', 2);
INSERT INTO public.empresa VALUES (1031, true, 1, '2023-07-02 12:35:21.795855', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE EXTREMA (FAEX)', 424);
INSERT INTO public.empresa VALUES (1032, true, 1, '2023-07-02 12:35:21.797304', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE MARABÁ (FACIMAB)', 46);
INSERT INTO public.empresa VALUES (1033, true, 1, '2023-07-02 12:35:21.80428', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE MINAS GERAIS (FACISAMG)', 425);
INSERT INTO public.empresa VALUES (1034, true, 1, '2023-07-02 12:35:21.805675', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DO SUL DE MINAS - FACESM (FACESM)', 103);
INSERT INTO public.empresa VALUES (1035, true, 1, '2023-07-02 12:35:21.807028', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DO VALE DO SÃO LOURENÇO (EDUVALE)', 426);
INSERT INTO public.empresa VALUES (1036, true, 1, '2023-07-02 12:35:21.808354', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS E DE TECNOLOGIAS DE AGUA BOA (FACESA)', 427);
INSERT INTO public.empresa VALUES (1037, true, 1, '2023-07-02 12:35:21.809693', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS DOS PALMARES (FACIP)', 428);
INSERT INTO public.empresa VALUES (1038, true, 1, '2023-07-02 12:35:21.810867', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS E AGRÁRIAS DE ITAPEVA (FAIT)', 272);
INSERT INTO public.empresa VALUES (1039, true, 1, '2023-07-02 12:35:21.819627', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS TECNOLÓGICAS DE FORTALEZA (FCTFOR)', 45);
INSERT INTO public.empresa VALUES (1040, true, 1, '2023-07-02 12:35:21.821039', NULL, NULL, false, 'FACULDADE DECISION DE NEGÓCIOS', 149);
INSERT INTO public.empresa VALUES (1041, true, 1, '2023-07-02 12:35:21.822369', NULL, NULL, false, 'FACULDADE DE COLIDER (FACIDER)', 356);
INSERT INTO public.empresa VALUES (1042, true, 1, '2023-07-02 12:35:21.82371', NULL, NULL, false, 'FACULDADE DE COLINAS DO TOCANTINS', 429);
INSERT INTO public.empresa VALUES (1043, true, 1, '2023-07-02 12:35:21.825055', NULL, NULL, false, 'FACULDADE DE COMUNICAÇÃO ANHANGUERA UNIDADE GUARAPARI', 266);
INSERT INTO public.empresa VALUES (1044, true, 1, '2023-07-02 12:35:21.826513', NULL, NULL, false, 'FACULDADE DE COMUNICAÇÃO E DESIGN "OSWALDO CRUZ"', 8);
INSERT INTO public.empresa VALUES (1045, true, 1, '2023-07-02 12:35:21.833687', NULL, NULL, false, 'FACULDADE DE DESENVOLVIMENTO DO NORTE (FADENORTE)', 430);
INSERT INTO public.empresa VALUES (1046, true, 1, '2023-07-02 12:35:21.835469', NULL, NULL, false, 'FACULDADE DE DESENVOLVIMENTO SUSTENTÁVEL DE CRUZEIRO DO SUL (IEVAL)', 431);
INSERT INTO public.empresa VALUES (1047, true, 1, '2023-07-02 12:35:21.836883', NULL, NULL, false, 'FACULDADE DE DIREITO 8 DE JULHO', 142);
INSERT INTO public.empresa VALUES (1048, true, 1, '2023-07-02 12:35:21.838194', NULL, NULL, false, 'FACULDADE DE DIREITO ANHANGUERA UNIDADE GUARAPARI', 266);
INSERT INTO public.empresa VALUES (1049, true, 1, '2023-07-02 12:35:21.839515', NULL, NULL, false, 'FACULDADE DE DIREITO ATAME (ATAME)', 42);
INSERT INTO public.empresa VALUES (1050, true, 1, '2023-07-02 12:35:21.840901', NULL, NULL, false, 'FACULDADE DE DIREITO AVANTIS DE ITAPEMA (AVANTIS ITAPEMA)', 432);
INSERT INTO public.empresa VALUES (1051, true, 1, '2023-07-02 12:35:21.849792', NULL, NULL, false, 'FACULDADE DE DIREITO, CIÊNCIAS E TECNOLOGIA SANTA MARIA MADA (FADICT)', 73);
INSERT INTO public.empresa VALUES (1052, true, 1, '2023-07-02 12:35:21.851305', NULL, NULL, false, 'FACULDADE DE DIREITO DA FUNDAÇÃO ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO', 149);
INSERT INTO public.empresa VALUES (1053, true, 1, '2023-07-02 12:35:21.852622', NULL, NULL, false, 'FACULDADE DE DIREITO DE ALTA FLORESTA', 373);
INSERT INTO public.empresa VALUES (1054, true, 1, '2023-07-02 12:35:21.853948', NULL, NULL, false, 'FACULDADE DE DIREITO DE CACHOEIRO DO ITAPEMIRIM (FDCI)', 190);
INSERT INTO public.empresa VALUES (1055, true, 1, '2023-07-02 12:35:21.8553', NULL, NULL, false, 'FACULDADE DE DIREITO DE CONSELHEIRO LAFAIETE (FDCL)', 18);
INSERT INTO public.empresa VALUES (1056, true, 1, '2023-07-02 12:35:21.856423', NULL, NULL, false, 'FACULDADE DE DIREITO DE CONTAGEM (FDCON)', 200);
INSERT INTO public.empresa VALUES (1057, true, 1, '2023-07-02 12:35:21.86365', NULL, NULL, false, 'FACULDADE DE DIREITO DE FRANCA (FDF)', 179);
INSERT INTO public.empresa VALUES (1058, true, 1, '2023-07-02 12:35:21.865146', NULL, NULL, false, 'FACULDADE DE DIREITO DE IPATINGA (FADIPA)', 268);
INSERT INTO public.empresa VALUES (1059, true, 1, '2023-07-02 12:35:21.866491', NULL, NULL, false, 'FACULDADE DE DIREITO DE ITÚ (FADITU)', 180);
INSERT INTO public.empresa VALUES (1060, true, 1, '2023-07-02 12:35:21.867816', NULL, NULL, false, 'FACULDADE DE DIREITO DE SANTA MARIA (FADISMA)', 417);
INSERT INTO public.empresa VALUES (1061, true, 1, '2023-07-02 12:35:21.869139', NULL, NULL, false, 'FACULDADE DE DIREITO DE SÃO BERNARDO DO CAMPO (FDSBC)', 82);
INSERT INTO public.empresa VALUES (1062, true, 1, '2023-07-02 12:35:21.870579', NULL, NULL, false, 'FACULDADE DE DIREITO DE SOROCABA (FADI)', 146);
INSERT INTO public.empresa VALUES (1063, true, 1, '2023-07-02 12:35:21.879413', NULL, NULL, false, 'FACULDADE DE DIREITO DE URUGUAIANA - ANHANGUERA', 433);
INSERT INTO public.empresa VALUES (1064, true, 1, '2023-07-02 12:35:21.880944', NULL, NULL, false, 'FACULDADE DE DIREITO DE VARGINHA - FADIVA (FADIVA)', 133);
INSERT INTO public.empresa VALUES (1065, true, 1, '2023-07-02 12:35:21.88229', NULL, NULL, false, 'FACULDADE DE DIREITO DE VITÓRIA (FDV)', 25);
INSERT INTO public.empresa VALUES (1066, true, 1, '2023-07-02 12:35:21.883625', NULL, NULL, false, 'FACULDADE DE DIREITO DO SUL DE MINAS (FDSM)', 230);
INSERT INTO public.empresa VALUES (1067, true, 1, '2023-07-02 12:35:21.884938', NULL, NULL, false, 'FACULDADE DE DIREITO DO VALE DO RIO DOCE (FADIVALE)', 265);
INSERT INTO public.empresa VALUES (1068, true, 1, '2023-07-02 12:35:21.886356', NULL, NULL, false, 'FACULDADE DE DIREITO E CIÊNCIAS SOCIAIS DO LESTE DE MINAS - FADILESTE (FADILESTE)', 434);
INSERT INTO public.empresa VALUES (1069, true, 1, '2023-07-02 12:35:21.893664', NULL, NULL, false, 'FACULDADE DE DIREITO SERRA DOURADA', 14);
INSERT INTO public.empresa VALUES (1070, true, 1, '2023-07-02 12:35:21.895892', NULL, NULL, false, 'FACULDADE DE DIREITO TECH DE SÃO PAULO (FADITECH)', 8);
INSERT INTO public.empresa VALUES (1071, true, 1, '2023-07-02 12:35:21.89781', NULL, NULL, false, 'FACULDADE DE DRACENA', 435);
INSERT INTO public.empresa VALUES (1072, true, 1, '2023-07-02 12:35:21.899443', NULL, NULL, false, 'FACULDADE DE DUQUE DE CAXIAS (FDC)', 436);
INSERT INTO public.empresa VALUES (1073, true, 1, '2023-07-02 12:35:21.900756', NULL, NULL, false, 'FACULDADE DE ECONOMIA E PROCESSAMENTO DE DADOS DE FOZ DO IGUAÇU (FEPI)', 124);
INSERT INTO public.empresa VALUES (1074, true, 1, '2023-07-02 12:35:21.901864', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO ACRIANA EUCLIDES DA CUNHA (INEC)', 143);
INSERT INTO public.empresa VALUES (1075, true, 1, '2023-07-02 12:35:21.910876', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO CIÊNCIAS E ARTES DOM BOSCO DE MONTE APRAZÍVEL (FAECA DOM BOSCO)', 437);
INSERT INTO public.empresa VALUES (1076, true, 1, '2023-07-02 12:35:21.912714', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO CIÊNCIAS E LETRAS DE PARAÍSO (FECIPAR)', 416);
INSERT INTO public.empresa VALUES (1077, true, 1, '2023-07-02 12:35:21.914268', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DA IBIAPABA (FAEDI)', 438);
INSERT INTO public.empresa VALUES (1078, true, 1, '2023-07-02 12:35:21.915496', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE COSTA RICA (FECRA)', 439);
INSERT INTO public.empresa VALUES (1079, true, 1, '2023-07-02 12:35:21.916817', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE GUARATINGUETÁ (FACEG)', 363);
INSERT INTO public.empresa VALUES (1080, true, 1, '2023-07-02 12:35:21.918213', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE ITABORAÍ (FEITA)', 341);
INSERT INTO public.empresa VALUES (1081, true, 1, '2023-07-02 12:35:21.925457', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE JARU (UNICENTRO)', 440);
INSERT INTO public.empresa VALUES (1082, true, 1, '2023-07-02 12:35:21.927714', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE NOVA ANDRADINA (FENA)', 369);
INSERT INTO public.empresa VALUES (1083, true, 1, '2023-07-02 12:35:21.929711', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE PATOS DE MINAS (FAEP)', 112);
INSERT INTO public.empresa VALUES (1084, true, 1, '2023-07-02 12:35:21.931286', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE PORTO VELHO (UNIRON)', 51);
INSERT INTO public.empresa VALUES (1085, true, 1, '2023-07-02 12:35:21.932832', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE SANTA CATARINA (FAESC)', 3);
INSERT INTO public.empresa VALUES (1086, true, 1, '2023-07-02 12:35:21.934409', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE SÃO MATEUS', 441);
INSERT INTO public.empresa VALUES (1087, true, 1, '2023-07-02 12:35:21.943258', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE TANGARÁ DA SERRA', 294);
INSERT INTO public.empresa VALUES (1088, true, 1, '2023-07-02 12:35:21.944859', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DO PIAUÍ (FAEPI)', 27);
INSERT INTO public.empresa VALUES (1089, true, 1, '2023-07-02 12:35:21.946434', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E CULTURA DE JI-PARANÁ (FAJIPA)', 139);
INSERT INTO public.empresa VALUES (1090, true, 1, '2023-07-02 12:35:21.947917', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E ESTUDOS SOCIAIS DE UBERLÂNDIA (FEESU)', 134);
INSERT INTO public.empresa VALUES (1091, true, 1, '2023-07-02 12:35:21.949423', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO ELIÂ (FACEEL)', 442);
INSERT INTO public.empresa VALUES (1092, true, 1, '2023-07-02 12:35:21.950543', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO EM CIÊNCIAS DA SAÚDE (FECS)', 8);
INSERT INTO public.empresa VALUES (1093, true, 1, '2023-07-02 12:35:21.957657', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E TECNOLOGIA DA AMAZÔNIA (FAM)', 227);
INSERT INTO public.empresa VALUES (1094, true, 1, '2023-07-02 12:35:21.959365', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E TECNOLOGIA DO ESPÍRITO SANTO (FETES)', 290);
INSERT INTO public.empresa VALUES (1095, true, 1, '2023-07-02 12:35:21.961267', NULL, NULL, false, 'FACULDADE DE EDUCACAO E TECNOLOGIA DO PARA (FAETE)', 227);
INSERT INTO public.empresa VALUES (1096, true, 1, '2023-07-02 12:35:21.963189', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E TECNOLOGIA IRACEMA (FAETI)', 8);
INSERT INTO public.empresa VALUES (1097, true, 1, '2023-07-02 12:35:21.964604', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO FÍSICA DA ASSOCIAÇÃO CRISTÃ DE MOÇOS DE SOROCABA (FEFISO)', 146);
INSERT INTO public.empresa VALUES (1098, true, 1, '2023-07-02 12:35:21.965959', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO FÍSICA DE FOZ DO IGUAÇU', 124);
INSERT INTO public.empresa VALUES (1099, true, 1, '2023-07-02 12:35:21.97479', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO MEMORIAL ADELAIDE FRANCO (FEMAF)', 443);
INSERT INTO public.empresa VALUES (1100, true, 1, '2023-07-02 12:35:21.976395', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO PAULISTANA (FAEP)', 8);
INSERT INTO public.empresa VALUES (1101, true, 1, '2023-07-02 12:35:21.978006', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SANTA TEREZINHA (FEST)', 267);
INSERT INTO public.empresa VALUES (1102, true, 1, '2023-07-02 12:35:21.979756', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SÃO FRANCISCO (FAESF)', 443);
INSERT INTO public.empresa VALUES (1103, true, 1, '2023-07-02 12:35:21.981245', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SÃO LUÍS (FESL)', 315);
INSERT INTO public.empresa VALUES (1104, true, 1, '2023-07-02 12:35:21.982774', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SOCIAL DA BAHIA (FAESB)', 306);
INSERT INTO public.empresa VALUES (1105, true, 1, '2023-07-02 12:35:21.989686', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUL DO PIAUÍ', 444);
INSERT INTO public.empresa VALUES (1106, true, 1, '2023-07-02 12:35:21.991004', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE CATALÃO', 17);
INSERT INTO public.empresa VALUES (1107, true, 1, '2023-07-02 12:35:21.992453', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE CHAPECÓ (FACESC)', 406);
INSERT INTO public.empresa VALUES (1108, true, 1, '2023-07-02 12:35:21.993858', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE DIVINÓPOLIS', 19);
INSERT INTO public.empresa VALUES (1109, true, 1, '2023-07-02 12:35:21.995456', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE PARAGOMINAS (FACESP)', 280);
INSERT INTO public.empresa VALUES (1110, true, 1, '2023-07-02 12:35:21.996634', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE PERNAMBUCO (FAESPE)', 445);
INSERT INTO public.empresa VALUES (1111, true, 1, '2023-07-02 12:35:22.005463', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE PERNAMBUCO (FACESP)', 445);
INSERT INTO public.empresa VALUES (1112, true, 1, '2023-07-02 12:35:22.006839', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE POUSO ALEGRE', 230);
INSERT INTO public.empresa VALUES (1113, true, 1, '2023-07-02 12:35:22.008014', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE SETE LAGOAS', 24);
INSERT INTO public.empresa VALUES (1114, true, 1, '2023-07-02 12:35:22.009347', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE TANGARÁ DA SERRA (FAEST)', 294);
INSERT INTO public.empresa VALUES (1115, true, 1, '2023-07-02 12:35:22.01072', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DO PARANÁ (FESPPR)', 56);
INSERT INTO public.empresa VALUES (1116, true, 1, '2023-07-02 12:35:22.012114', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR IESLA (IESLA)', 2);
INSERT INTO public.empresa VALUES (1117, true, 1, '2023-07-02 12:35:22.019119', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA BARRA MANSA (FAETERJ B.MANSA)', 92);
INSERT INTO public.empresa VALUES (1118, true, 1, '2023-07-02 12:35:22.020444', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO (FAETERJ CAXIAS)', 436);
INSERT INTO public.empresa VALUES (1119, true, 1, '2023-07-02 12:35:22.021773', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO (FAETERJ PARACAMBI)', 446);
INSERT INTO public.empresa VALUES (1120, true, 1, '2023-07-02 12:35:22.023146', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ PETRÓPOLIS)', 53);
INSERT INTO public.empresa VALUES (1121, true, 1, '2023-07-02 12:35:22.024499', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ S ANT. PÁDUA)', 447);
INSERT INTO public.empresa VALUES (1122, true, 1, '2023-07-02 12:35:22.026092', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ ITAPERUNA)', 186);
INSERT INTO public.empresa VALUES (1123, true, 1, '2023-07-02 12:35:22.0349', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ BJ ITABAPOAN)', 448);
INSERT INTO public.empresa VALUES (1124, true, 1, '2023-07-02 12:35:22.036434', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ TRÊS RIOS)', 420);
INSERT INTO public.empresa VALUES (1125, true, 1, '2023-07-02 12:35:22.037775', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO FERNANDO MOTA (FAETERJ-RIO)', 12);
INSERT INTO public.empresa VALUES (1126, true, 1, '2023-07-02 12:35:22.039104', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO VALE DO PAJEÚ (FVP)', 449);
INSERT INTO public.empresa VALUES (1127, true, 1, '2023-07-02 12:35:22.040431', NULL, NULL, false, 'FACULDADE DE ELESBÃO VELOSO (FAEVE)', 450);
INSERT INTO public.empresa VALUES (1128, true, 1, '2023-07-02 12:35:22.041577', NULL, NULL, false, 'FACULDADE DE EMPREENDEDORISMO E CIÊNCIAS HUMANAS (FACULDADE FAECH)', 134);
INSERT INTO public.empresa VALUES (1129, true, 1, '2023-07-02 12:35:22.048917', NULL, NULL, false, 'FACULDADE DE ENFERMAGEM NOVA ESPERANÇA (FACENE)', 107);
INSERT INTO public.empresa VALUES (1130, true, 1, '2023-07-02 12:35:22.05031', NULL, NULL, false, 'FACULDADE DE ENFERMAGEM NOVA ESPERANÇA DE MOSSORÓ - FACENE/RN (FACENE/RN)', 323);
INSERT INTO public.empresa VALUES (1131, true, 1, '2023-07-02 12:35:22.051673', NULL, NULL, false, 'FACULDADE DE ENFERMAGEM SÃO VICENTE DE PAULA (FESVIP)', 107);
INSERT INTO public.empresa VALUES (1132, true, 1, '2023-07-02 12:35:22.053136', NULL, NULL, false, 'FACULDADE DE ENGENHARIA DE MINAS GERAIS - FEAMIG (FEAMIG)', 2);
INSERT INTO public.empresa VALUES (1133, true, 1, '2023-07-02 12:35:22.05447', NULL, NULL, false, 'FACULDADE DE ENGENHARIA DE RESENDE (FER)', 4);
INSERT INTO public.empresa VALUES (1134, true, 1, '2023-07-02 12:35:22.055858', NULL, NULL, false, 'FACULDADE DE ENGENHARIA E ADMINISTRAÇÃO PAULISTA (FEAP)', 195);
INSERT INTO public.empresa VALUES (1135, true, 1, '2023-07-02 12:35:22.064892', NULL, NULL, false, 'FACULDADE DE ENGENHARIA E AGRIMENSURA DE SÃO PAULO (FEASP)', 8);
INSERT INTO public.empresa VALUES (1136, true, 1, '2023-07-02 12:35:22.066631', NULL, NULL, false, 'FACULDADE DE ENGENHARIA SOUZA MARQUES (FESM)', 12);
INSERT INTO public.empresa VALUES (1137, true, 1, '2023-07-02 12:35:22.068281', NULL, NULL, false, 'FACULDADE DE ENSINO DE MINAS GERAIS (FACEMG)', 2);
INSERT INTO public.empresa VALUES (1138, true, 1, '2023-07-02 12:35:22.069776', NULL, NULL, false, 'FACULDADE DE ENSINO DE PESQUISA DO COOPERATIVISMO (FEPCOOP)', 203);
INSERT INTO public.empresa VALUES (1139, true, 1, '2023-07-02 12:35:22.071286', NULL, NULL, false, 'FACULDADE DE ENSINO E CULTURA DO CEARÁ (FAECE)', 45);
INSERT INTO public.empresa VALUES (1140, true, 1, '2023-07-02 12:35:22.072674', NULL, NULL, false, 'FACULDADE DE ENSINO JURÍDICO DE VITÓRIA (FEJ)', 25);
INSERT INTO public.empresa VALUES (1141, true, 1, '2023-07-02 12:35:22.079803', NULL, NULL, false, 'FACULDADE DE ENSINO PASCHOAL DANTAS (FEPD)', 8);
INSERT INTO public.empresa VALUES (1142, true, 1, '2023-07-02 12:35:22.081406', NULL, NULL, false, 'FACULDADE DE ENSINO PORTAL (FEP)', 451);
INSERT INTO public.empresa VALUES (1143, true, 1, '2023-07-02 12:35:22.082731', NULL, NULL, false, 'FACULDADE DE ENSINO REGIONAL ALTERNATIVA (FERA)', 333);
INSERT INTO public.empresa VALUES (1144, true, 1, '2023-07-02 12:35:22.084144', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR (FAES)', 134);
INSERT INTO public.empresa VALUES (1145, true, 1, '2023-07-02 12:35:22.085613', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR BRASILEIRA - FACULDADE FEBRAS (FEBRAS)', 226);
INSERT INTO public.empresa VALUES (1146, true, 1, '2023-07-02 12:35:22.086874', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DA AMAZÔNIA (FESAM)', 26);
INSERT INTO public.empresa VALUES (1147, true, 1, '2023-07-02 12:35:22.095964', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DA AMAZÔNIA REUNIDA (FESAR)', 452);
INSERT INTO public.empresa VALUES (1148, true, 1, '2023-07-02 12:35:22.097712', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DA CIDADE DE FEIRA DE SANTANA (FAESF/UNEF)', 99);
INSERT INTO public.empresa VALUES (1149, true, 1, '2023-07-02 12:35:22.099323', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DA PARAÍBA (FESP)', 107);
INSERT INTO public.empresa VALUES (1150, true, 1, '2023-07-02 12:35:22.100851', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DE FLORIANO (FAESF)', 453);
INSERT INTO public.empresa VALUES (1151, true, 1, '2023-07-02 12:35:22.102328', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DE LINHARES (FACELI)', 277);
INSERT INTO public.empresa VALUES (1152, true, 1, '2023-07-02 12:35:22.104265', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DE MARECHAL CÂNDIDO RONDON (ISEPE RONDON)', 454);
INSERT INTO public.empresa VALUES (1153, true, 1, '2023-07-02 12:35:22.11183', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DE PARNAÍBA (FAESPA)', 176);
INSERT INTO public.empresa VALUES (1154, true, 1, '2023-07-02 12:35:22.113751', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DO CENTRO DO PARANÁ (UCP)', 455);
INSERT INTO public.empresa VALUES (1155, true, 1, '2023-07-02 12:35:22.115191', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DO INTERIOR PAULISTA (FAIP)', 145);
INSERT INTO public.empresa VALUES (1156, true, 1, '2023-07-02 12:35:22.116528', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DO LAGO (FAESLA)', 456);
INSERT INTO public.empresa VALUES (1157, true, 1, '2023-07-02 12:35:22.11786', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DOM BOSCO (FACDOMBOSCO)', 353);
INSERT INTO public.empresa VALUES (1158, true, 1, '2023-07-02 12:35:22.119272', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DO PIAUÍ (FAESPI)', 27);
INSERT INTO public.empresa VALUES (1159, true, 1, '2023-07-02 12:35:22.128512', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR E FORMAÇÃO INTEGRAL (FAEF)', 457);
INSERT INTO public.empresa VALUES (1160, true, 1, '2023-07-02 12:35:22.130814', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR PASCHOAL DANTAS', 8);
INSERT INTO public.empresa VALUES (1161, true, 1, '2023-07-02 12:35:22.132502', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR PELEGRINO CIPRIANI (FASPEC)', 203);
INSERT INTO public.empresa VALUES (1162, true, 1, '2023-07-02 12:35:22.133808', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR REFFERENCIAL (FAREFF)', 48);
INSERT INTO public.empresa VALUES (1163, true, 1, '2023-07-02 12:35:22.135117', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR SANTA BARBARA (FAESB)', 458);
INSERT INTO public.empresa VALUES (1164, true, 1, '2023-07-02 12:35:22.136236', NULL, NULL, false, 'FACULDADE DE ESTUDOS AVANÇADOS DO PARÁ (FEAPA)', 79);
INSERT INTO public.empresa VALUES (1165, true, 1, '2023-07-02 12:35:22.143291', NULL, NULL, false, 'FACULDADE DE ESTUDOS SOCIAIS APLICADOS DE VIANA (FESAV)', 459);
INSERT INTO public.empresa VALUES (1166, true, 1, '2023-07-02 12:35:22.144604', NULL, NULL, false, 'FACULDADE DE ESTUDOS SOCIAIS DO ESPÍRITO SANTO (PIO XII)', 389);
INSERT INTO public.empresa VALUES (1167, true, 1, '2023-07-02 12:35:22.145927', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE ALEGRE (FAFIA)', 460);
INSERT INTO public.empresa VALUES (1168, true, 1, '2023-07-02 12:35:22.147265', NULL, NULL, false, 'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE BOA ESPERANÇA (FAFIBE)', 314);
INSERT INTO public.empresa VALUES (1169, true, 1, '2023-07-02 12:35:22.148615', NULL, NULL, false, 'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE IBITINGA (FAIBI)', 461);
INSERT INTO public.empresa VALUES (1170, true, 1, '2023-07-02 12:35:22.150009', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE ITUVERAVA (FFCL)', 462);
INSERT INTO public.empresa VALUES (1171, true, 1, '2023-07-02 12:35:22.158942', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE MACAÉ (FAFIMA)', 325);
INSERT INTO public.empresa VALUES (1172, true, 1, '2023-07-02 12:35:22.160299', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE PENÁPOLIS (FAFIPE)', 463);
INSERT INTO public.empresa VALUES (1173, true, 1, '2023-07-02 12:35:22.161708', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE SÃO JOSÉ DO RIO PARDO (FFCL)', 464);
INSERT INTO public.empresa VALUES (1174, true, 1, '2023-07-02 12:35:22.163169', NULL, NULL, false, 'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DO ALTO SÃO FRANCISCO (FASF)', 465);
INSERT INTO public.empresa VALUES (1175, true, 1, '2023-07-02 12:35:22.164498', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DOM BOSCO (FFCLDB)', 4);
INSERT INTO public.empresa VALUES (1176, true, 1, '2023-07-02 12:35:22.165861', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS SOUZA MARQUES (FFCLSM)', 12);
INSERT INTO public.empresa VALUES (1177, true, 1, '2023-07-02 12:35:22.172946', NULL, NULL, false, 'FACULDADE DE FILOSOFIA E TEOLOGIA PAULO VI (FFTP)', 62);
INSERT INTO public.empresa VALUES (1178, true, 1, '2023-07-02 12:35:22.173892', NULL, NULL, false, 'FACULDADE DE FORMAÇÃO DE PROFESSORES DA MATA SUL (FAMASUL)', 428);
INSERT INTO public.empresa VALUES (1179, true, 1, '2023-07-02 12:35:22.175227', NULL, NULL, false, 'FACULDADE DE FORMAÇÃO DE PROFESSORES DE ARARIPINA (FAFOPA)', 393);
INSERT INTO public.empresa VALUES (1180, true, 1, '2023-07-02 12:35:22.176739', NULL, NULL, false, 'FACULDADE DE FORMAÇÃO DE PROFESSORES DE SERRA TALHADA (FAFOPST)', 398);
INSERT INTO public.empresa VALUES (1181, true, 1, '2023-07-02 12:35:22.185527', NULL, NULL, false, 'FACULDADE DE FORTALEZA (FAFOR)', 45);
INSERT INTO public.empresa VALUES (1182, true, 1, '2023-07-02 12:35:22.186886', NULL, NULL, false, 'FACULDADE DE FRUTAL (FAF)', 466);
INSERT INTO public.empresa VALUES (1183, true, 1, '2023-07-02 12:35:22.188233', NULL, NULL, false, 'FACULDADE DE GESTÃO, EDUCAÇÃO E DE SAÚDE (FGS)', 203);
INSERT INTO public.empresa VALUES (1184, true, 1, '2023-07-02 12:35:22.189396', NULL, NULL, false, 'FACULDADE DE GESTÃO E INOVAÇÃO (FGI)', 21);
INSERT INTO public.empresa VALUES (1185, true, 1, '2023-07-02 12:35:22.190771', NULL, NULL, false, 'FACULDADE DE GESTAO E NEGOCIOS DE CACHOEIRINHA (FGN CACHOEIRINH)', 74);
INSERT INTO public.empresa VALUES (1186, true, 1, '2023-07-02 12:35:22.192166', NULL, NULL, false, 'FACULDADE DE GESTAO E NEGOCIOS DE SALVADOR (FGN)', 116);
INSERT INTO public.empresa VALUES (1187, true, 1, '2023-07-02 12:35:22.199476', NULL, NULL, false, 'FACULDADE DE GESTAO E NEGOCIOS DE TERESINA (FGN TERESINA)', 27);
INSERT INTO public.empresa VALUES (1188, true, 1, '2023-07-02 12:35:22.200837', NULL, NULL, false, 'FACULDADE DE GOIANA (FAG)', 400);
INSERT INTO public.empresa VALUES (1189, true, 1, '2023-07-02 12:35:22.202002', NULL, NULL, false, 'FACULDADE DE GOVERNANÇA, ENGENHARIA E EDUCAÇÃO DE SÃO PAULO (FGE-SP)', 195);
INSERT INTO public.empresa VALUES (1190, true, 1, '2023-07-02 12:35:22.203344', NULL, NULL, false, 'FACULDADE DE GUARANTÃ DO NORTE ( UNIFAMA)', 467);
INSERT INTO public.empresa VALUES (1191, true, 1, '2023-07-02 12:35:22.20468', NULL, NULL, false, 'FACULDADE DE GUARULHOS (FAG)', 100);
INSERT INTO public.empresa VALUES (1192, true, 1, '2023-07-02 12:35:22.205899', NULL, NULL, false, 'FACULDADE DEHONIANA (DEHONIANA)', 33);
INSERT INTO public.empresa VALUES (1193, true, 1, '2023-07-02 12:35:22.21476', NULL, NULL, false, 'FACULDADE DE HORTOLÂNDIA (FACH)', 468);
INSERT INTO public.empresa VALUES (1194, true, 1, '2023-07-02 12:35:22.216098', NULL, NULL, false, 'FACULDADE DE IBAITI (FEATI)', 469);
INSERT INTO public.empresa VALUES (1195, true, 1, '2023-07-02 12:35:22.217474', NULL, NULL, false, 'FACULDADE DE ILHA SOLTEIRA (FAISA)', 340);
INSERT INTO public.empresa VALUES (1196, true, 1, '2023-07-02 12:35:22.218779', NULL, NULL, false, 'FACULDADE DE IMPERATRIZ WYDEN (FACIMP WYDEN)', 267);
INSERT INTO public.empresa VALUES (1197, true, 1, '2023-07-02 12:35:22.220088', NULL, NULL, false, 'FACULDADE DE INDIARA (FAIND)', 470);
INSERT INTO public.empresa VALUES (1198, true, 1, '2023-07-02 12:35:22.221208', NULL, NULL, false, 'FACULDADE DE INFORMÁTICA DE OURO PRETO DO OESTE (FIOURO)', 471);
INSERT INTO public.empresa VALUES (1199, true, 1, '2023-07-02 12:35:22.228613', NULL, NULL, false, 'FACULDADE DE INHUMAS - FAC-MAIS (FACMAIS)', 472);
INSERT INTO public.empresa VALUES (1200, true, 1, '2023-07-02 12:35:22.230304', NULL, NULL, false, 'FACULDADE DE INTEGRAÇÃO DO ENSINO SUPERIOR DO CONE SUL (FISUL)', 473);
INSERT INTO public.empresa VALUES (1201, true, 1, '2023-07-02 12:35:22.231612', NULL, NULL, false, 'FACULDADE DE INTEGRAÇÃO DO SERTÃO (FIS)', 398);
INSERT INTO public.empresa VALUES (1202, true, 1, '2023-07-02 12:35:22.232922', NULL, NULL, false, 'FACULDADE DE IPORÁ (FAI)', 474);
INSERT INTO public.empresa VALUES (1203, true, 1, '2023-07-02 12:35:22.234272', NULL, NULL, false, 'FACULDADE DE ITAITUBA (FAI)', 475);
INSERT INTO public.empresa VALUES (1204, true, 1, '2023-07-02 12:35:22.235683', NULL, NULL, false, 'FACULDADE DE ITÁPOLIS - FACITA (FACITA)', 223);
INSERT INTO public.empresa VALUES (1205, true, 1, '2023-07-02 12:35:22.244637', NULL, NULL, false, 'FACULDADE DE JABOTICABAL (FAJAB)', 315);
INSERT INTO public.empresa VALUES (1206, true, 1, '2023-07-02 12:35:22.246083', NULL, NULL, false, 'FACULDADE DE JACAREÍ', 273);
INSERT INTO public.empresa VALUES (1207, true, 1, '2023-07-02 12:35:22.247402', NULL, NULL, false, 'FACULDADE DE JANDAIA DO SUL (FAFIJAN)', 476);
INSERT INTO public.empresa VALUES (1208, true, 1, '2023-07-02 12:35:22.248722', NULL, NULL, false, 'FACULDADE DE JUSSARA (FAJ)', 477);
INSERT INTO public.empresa VALUES (1209, true, 1, '2023-07-02 12:35:22.250049', NULL, NULL, false, 'FACULDADE DELMIRO GOUVEIA (FDG)', 73);
INSERT INTO public.empresa VALUES (1210, true, 1, '2023-07-02 12:35:22.251457', NULL, NULL, false, 'FACULDADE DELTA (FACULDADE DELTA)', 42);
INSERT INTO public.empresa VALUES (1211, true, 1, '2023-07-02 12:35:22.258696', NULL, NULL, false, 'FACULDADE DE LUCAS DO RIO VERDE (UNIFAMA)', 169);
INSERT INTO public.empresa VALUES (1212, true, 1, '2023-07-02 12:35:22.26002', NULL, NULL, false, 'FACULDADE DE MARÍLIA (FAMAR)', 145);
INSERT INTO public.empresa VALUES (1213, true, 1, '2023-07-02 12:35:22.261361', NULL, NULL, false, 'FACULDADE DE MARTINÓPOLIS (FAMA)', 478);
INSERT INTO public.empresa VALUES (1214, true, 1, '2023-07-02 12:35:22.262864', NULL, NULL, false, 'FACULDADE DE MATO GROSSO (FAMAT)', 203);
INSERT INTO public.empresa VALUES (1215, true, 1, '2023-07-02 12:35:22.264383', NULL, NULL, false, 'FACULDADE DE MATUPÁ ( UNIFAMA)', 479);
INSERT INTO public.empresa VALUES (1216, true, 1, '2023-07-02 12:35:22.265609', NULL, NULL, false, 'FACULDADE DE MAUÁ - FAMA (FAMA)', 480);
INSERT INTO public.empresa VALUES (1217, true, 1, '2023-07-02 12:35:22.274465', NULL, NULL, false, 'FACULDADE DE MEDIAÇÃO ÍVIA CORNELI (FAMIC)', 481);
INSERT INTO public.empresa VALUES (1218, true, 1, '2023-07-02 12:35:22.275755', NULL, NULL, false, 'FACULDADE DE MEDICINA (ITPAC)', 196);
INSERT INTO public.empresa VALUES (1219, true, 1, '2023-07-02 12:35:22.277085', NULL, NULL, false, 'FACULDADE DE MEDICINA DE AÇAILÂNDIA', 482);
INSERT INTO public.empresa VALUES (1220, true, 1, '2023-07-02 12:35:22.278471', NULL, NULL, false, 'FACULDADE DE MEDICINA DE BARBACENA (FAME)', 32);
INSERT INTO public.empresa VALUES (1221, true, 1, '2023-07-02 12:35:22.27982', NULL, NULL, false, 'FACULDADE DE MEDICINA DE CAMPOS (FMC)', 160);
INSERT INTO public.empresa VALUES (1222, true, 1, '2023-07-02 12:35:22.281213', NULL, NULL, false, 'FACULDADE DE MEDICINA DE GARANHUNS (SUB JUDICE)', 483);
INSERT INTO public.empresa VALUES (1223, true, 1, '2023-07-02 12:35:22.288221', NULL, NULL, false, 'FACULDADE DE MEDICINA DE ITAJUBÁ (FMIT)', 103);
INSERT INTO public.empresa VALUES (1224, true, 1, '2023-07-02 12:35:22.289557', NULL, NULL, false, 'FACULDADE DE MEDICINA DE JI-PARANÁ', 139);
INSERT INTO public.empresa VALUES (1225, true, 1, '2023-07-02 12:35:22.290903', NULL, NULL, false, 'FACULDADE DE MEDICINA DE JUNDIAÍ (FMJ)', 182);
INSERT INTO public.empresa VALUES (1226, true, 1, '2023-07-02 12:35:22.29225', NULL, NULL, false, 'FACULDADE DE MEDICINA DE MARÍLIA (FAMEMA)', 145);
INSERT INTO public.empresa VALUES (1227, true, 1, '2023-07-02 12:35:22.293561', NULL, NULL, false, 'FACULDADE DE MEDICINA DE OLINDA (FMO)', 39);
INSERT INTO public.empresa VALUES (1228, true, 1, '2023-07-02 12:35:22.295171', NULL, NULL, false, 'FACULDADE DE MEDICINA DE PETRÓPOLIS (FMP)', 53);
INSERT INTO public.empresa VALUES (1229, true, 1, '2023-07-02 12:35:22.303998', NULL, NULL, false, 'FACULDADE DE MEDICINA DE SÃO JOSÉ DO RIO PRETO (FAMERP)', 114);
INSERT INTO public.empresa VALUES (1230, true, 1, '2023-07-02 12:35:22.305487', NULL, NULL, false, 'FACULDADE DE MEDICINA DO SERTÃO (FMS)', 15);
INSERT INTO public.empresa VALUES (1231, true, 1, '2023-07-02 12:35:22.306812', NULL, NULL, false, 'FACULDADE DE MEDICINA ESTÁCIO DE CASTANHAL (ESTÁCIO FMEC)', 484);
INSERT INTO public.empresa VALUES (1232, true, 1, '2023-07-02 12:35:22.30813', NULL, NULL, false, 'FACULDADE DE MEDICINA ESTÁCIO DE JUAZEIRO DO NORTE (ESTÁCIO FMJ)', 135);
INSERT INTO public.empresa VALUES (1233, true, 1, '2023-07-02 12:35:22.309488', NULL, NULL, false, 'FACULDADE DE MEDICINA NOVA ESPERANÇA (FAMENE)', 107);
INSERT INTO public.empresa VALUES (1234, true, 1, '2023-07-02 12:35:22.310607', NULL, NULL, false, 'FACULDADE DE MIGUEL PEREIRA (FAMIPE)', 485);
INSERT INTO public.empresa VALUES (1235, true, 1, '2023-07-02 12:35:22.31774', NULL, NULL, false, 'FACULDADE DE MINAS BH (FAMINAS-BH)', 2);
INSERT INTO public.empresa VALUES (1236, true, 1, '2023-07-02 12:35:22.31916', NULL, NULL, false, 'FACULDADE DE MIRASSOL', 486);
INSERT INTO public.empresa VALUES (1237, true, 1, '2023-07-02 12:35:22.320651', NULL, NULL, false, 'FACULDADE DE MÚSICA CARLOS GOMES (FMCG)', 8);
INSERT INTO public.empresa VALUES (1238, true, 1, '2023-07-02 12:35:22.321978', NULL, NULL, false, 'FACULDADE DE MÚSICA DO ESPÍRITO SANTO MAURÍCIO DE OLIVEIRA (FAMES)', 25);
INSERT INTO public.empresa VALUES (1239, true, 1, '2023-07-02 12:35:22.3233', NULL, NULL, false, 'FACULDADE DE MÚSICA SOUZA LIMA (FMSL)', 8);
INSERT INTO public.empresa VALUES (1240, true, 1, '2023-07-02 12:35:22.324694', NULL, NULL, false, 'FACULDADE DE NOVA MUTUM (UNIFAMA)', 487);
INSERT INTO public.empresa VALUES (1241, true, 1, '2023-07-02 12:35:22.333614', NULL, NULL, false, 'FACULDADE DE NOVA MUTUM', 487);
INSERT INTO public.empresa VALUES (1242, true, 1, '2023-07-02 12:35:22.334937', NULL, NULL, false, 'FACULDADE DE NOVA SERRANA (FANS)', 488);
INSERT INTO public.empresa VALUES (1243, true, 1, '2023-07-02 12:35:22.336291', NULL, NULL, false, 'FACULDADE DE ODONTOLOGIA DA APCD (FAOA)', 8);
INSERT INTO public.empresa VALUES (1244, true, 1, '2023-07-02 12:35:22.337612', NULL, NULL, false, 'FACULDADE DE ODONTOLOGIA DE MANAUS (FOM)', 75);
INSERT INTO public.empresa VALUES (1245, true, 1, '2023-07-02 12:35:22.338932', NULL, NULL, false, 'FACULDADE DE ODONTOLOGIA DO RECIFE (FOR)', 60);
INSERT INTO public.empresa VALUES (1246, true, 1, '2023-07-02 12:35:22.340344', NULL, NULL, false, 'FACULDADE DE OLÍMPIA', 489);
INSERT INTO public.empresa VALUES (1247, true, 1, '2023-07-02 12:35:22.347491', NULL, NULL, false, 'FACULDADE DE OSASCO (FCO)', 158);
INSERT INTO public.empresa VALUES (1248, true, 1, '2023-07-02 12:35:22.348897', NULL, NULL, false, 'FACULDADE DE PALMAS (FAPAL)', 23);
INSERT INTO public.empresa VALUES (1249, true, 1, '2023-07-02 12:35:22.350229', NULL, NULL, false, 'FACULDADE DE PALMEIRAS DE GOIÁS - FACMAIS (FACMAIS)', 490);
INSERT INTO public.empresa VALUES (1250, true, 1, '2023-07-02 12:35:22.351591', NULL, NULL, false, 'FACULDADE DE PARÁ DE MINAS (FAPAM)', 491);
INSERT INTO public.empresa VALUES (1251, true, 1, '2023-07-02 12:35:22.353032', NULL, NULL, false, 'FACULDADE DE PEDAGOGIA (ANAEC)', 369);
INSERT INTO public.empresa VALUES (1252, true, 1, '2023-07-02 12:35:22.35412', NULL, NULL, false, 'FACULDADE DE PENÁPOLIS', 463);
INSERT INTO public.empresa VALUES (1253, true, 1, '2023-07-02 12:35:22.363085', NULL, NULL, false, 'FACULDADE DE PENEDO (FAC-PENEDO)', 492);
INSERT INTO public.empresa VALUES (1254, true, 1, '2023-07-02 12:35:22.364561', NULL, NULL, false, 'FACULDADE DE PETROLINA (FACAPE)', 445);
INSERT INTO public.empresa VALUES (1255, true, 1, '2023-07-02 12:35:22.365858', NULL, NULL, false, 'FACULDADE DE PINHAIS (FAPI)', 493);
INSERT INTO public.empresa VALUES (1256, true, 1, '2023-07-02 12:35:22.367915', NULL, NULL, false, 'FACULDADE DE PIRACANJUBA (FAP)', 494);
INSERT INTO public.empresa VALUES (1257, true, 1, '2023-07-02 12:35:22.369014', NULL, NULL, false, 'FACULDADE DE PONTA PORÃ (FAP)', 495);
INSERT INTO public.empresa VALUES (1258, true, 1, '2023-07-02 12:35:22.376184', NULL, NULL, false, 'FACULDADE DE PORTO FELIZ', 496);
INSERT INTO public.empresa VALUES (1259, true, 1, '2023-07-02 12:35:22.378523', NULL, NULL, false, 'FACULDADE DE PRESIDENTE EPITÁCIO - FAPE (FAPE)', 497);
INSERT INTO public.empresa VALUES (1260, true, 1, '2023-07-02 12:35:22.379832', NULL, NULL, false, 'FACULDADE DE PRESIDENTE PRUDENTE (FAPEPE)', 50);
INSERT INTO public.empresa VALUES (1261, true, 1, '2023-07-02 12:35:22.381178', NULL, NULL, false, 'FACULDADE DE PRESIDENTE VENCESLAU (FAPREV)', 498);
INSERT INTO public.empresa VALUES (1262, true, 1, '2023-07-02 12:35:22.382566', NULL, NULL, false, 'FACULDADE DE PRIMAVERA (CESPRI)', 499);
INSERT INTO public.empresa VALUES (1263, true, 1, '2023-07-02 12:35:22.392791', NULL, NULL, false, 'FACULDADE DE QUIXERAMOBIM (UNIQ)', 500);
INSERT INTO public.empresa VALUES (1264, true, 1, '2023-07-02 12:35:22.394146', NULL, NULL, false, 'FACULDADE DE RANCHARIA', 501);
INSERT INTO public.empresa VALUES (1265, true, 1, '2023-07-02 12:35:22.395627', NULL, NULL, false, 'FACULDADE DE RIBEIRÃO PIRES', 502);
INSERT INTO public.empresa VALUES (1266, true, 1, '2023-07-02 12:35:22.397098', NULL, NULL, false, 'FACULDADE DE RIBEIRÃO PRETO (AFARP)', 58);
INSERT INTO public.empresa VALUES (1267, true, 1, '2023-07-02 12:35:22.398203', NULL, NULL, false, 'FACULDADE DE RIO CLARO (CBTA)', 222);
INSERT INTO public.empresa VALUES (1268, true, 1, '2023-07-02 12:35:22.406613', NULL, NULL, false, 'FACULDADE DE ROLIM DE MOURA (FAROL)', 503);
INSERT INTO public.empresa VALUES (1269, true, 1, '2023-07-02 12:35:22.40886', NULL, NULL, false, 'FACULDADE DE RONDÔNIA (FARO)', 51);
INSERT INTO public.empresa VALUES (1270, true, 1, '2023-07-02 12:35:22.410007', NULL, NULL, false, 'FACULDADE DE ROSEIRA (FARO)', 504);
INSERT INTO public.empresa VALUES (1271, true, 1, '2023-07-02 12:35:22.41143', NULL, NULL, false, 'FACULDADE DE SABARÁ (SOECS)', 505);
INSERT INTO public.empresa VALUES (1272, true, 1, '2023-07-02 12:35:22.420296', NULL, NULL, false, 'FACULDADE DE SANTA BÁRBARA D''OESTE (FAP)', 288);
INSERT INTO public.empresa VALUES (1273, true, 1, '2023-07-02 12:35:22.422434', NULL, NULL, false, 'FACULDADE DE SANTA CATARINA (FASC)', 140);
INSERT INTO public.empresa VALUES (1274, true, 1, '2023-07-02 12:35:22.423757', NULL, NULL, false, 'FACULDADE DE SANTA CRUZ DA BAHIA (FSC)', 506);
INSERT INTO public.empresa VALUES (1275, true, 1, '2023-07-02 12:35:22.425178', NULL, NULL, false, 'FACULDADE DE SANTA INÊS (FSI)', 507);
INSERT INTO public.empresa VALUES (1276, true, 1, '2023-07-02 12:35:22.433813', NULL, NULL, false, 'FACULDADE DE SANTA LUZIA (FACSAL)', 508);
INSERT INTO public.empresa VALUES (1277, true, 1, '2023-07-02 12:35:22.43537', NULL, NULL, false, 'FACULDADE DE SANTANA DE PARNAÍBA (FASP)', 509);
INSERT INTO public.empresa VALUES (1278, true, 1, '2023-07-02 12:35:22.436692', NULL, NULL, false, 'FACULDADE DE SANTO ANDRÉ', 47);
INSERT INTO public.empresa VALUES (1279, true, 1, '2023-07-02 12:35:22.438086', NULL, NULL, false, 'FACULDADE DE SANTO ÂNGELO (FASA)', 348);
INSERT INTO public.empresa VALUES (1280, true, 1, '2023-07-02 12:35:22.440183', NULL, NULL, false, 'FACULDADE DE SANTO ANTONIO DA PLATINA', 510);
INSERT INTO public.empresa VALUES (1281, true, 1, '2023-07-02 12:35:22.449112', NULL, NULL, false, 'FACULDADE DE SÃO BENTO (FSB)', 8);
INSERT INTO public.empresa VALUES (1282, true, 1, '2023-07-02 12:35:22.451317', NULL, NULL, false, 'FACULDADE DE SÃO BERNARDO DO CAMPO (FAPAN)', 82);
INSERT INTO public.empresa VALUES (1283, true, 1, '2023-07-02 12:35:22.452662', NULL, NULL, false, 'FACULDADE DE SÃO BERNARDO DO CAMPO - FASB (FASB I)', 82);
INSERT INTO public.empresa VALUES (1284, true, 1, '2023-07-02 12:35:22.453986', NULL, NULL, false, 'FACULDADE DE SÃO CAETANO DO SUL', 126);
INSERT INTO public.empresa VALUES (1285, true, 1, '2023-07-02 12:35:22.462784', NULL, NULL, false, 'FACULDADE DE SÃO CARLOS (FASC)', 72);
INSERT INTO public.empresa VALUES (1286, true, 1, '2023-07-02 12:35:22.464997', NULL, NULL, false, 'FACULDADE DE SÃO LOURENÇO (FASAMA)', 511);
INSERT INTO public.empresa VALUES (1287, true, 1, '2023-07-02 12:35:22.46722', NULL, NULL, false, 'FACULDADE DE SÃO MARCOS (FACSM)', 512);
INSERT INTO public.empresa VALUES (1288, true, 1, '2023-07-02 12:35:22.468463', NULL, NULL, false, 'FACULDADE DE SÃO PAULO (FASP)', 8);
INSERT INTO public.empresa VALUES (1289, true, 1, '2023-07-02 12:35:22.47852', NULL, NULL, false, 'FACULDADE DE SÃO ROQUE (FASAR)', 191);
INSERT INTO public.empresa VALUES (1290, true, 1, '2023-07-02 12:35:22.47996', NULL, NULL, false, 'FACULDADE DE SÃO VICENTE (FSV)', 513);
INSERT INTO public.empresa VALUES (1291, true, 1, '2023-07-02 12:35:22.481305', NULL, NULL, false, 'FACULDADE DE SAÚDE, CIÊNCIAS E TECNOLOGIA - FACESB (FACESB)', 514);
INSERT INTO public.empresa VALUES (1292, true, 1, '2023-07-02 12:35:22.482602', NULL, NULL, false, 'FACULDADE DE SAÚDE DO SERTÃO DE PERNAMBUCO (FASPE)', 515);
INSERT INTO public.empresa VALUES (1293, true, 1, '2023-07-02 12:35:22.48356', NULL, NULL, false, 'FACULDADE DE SAÚDE E HUMANIDADES IBITURUNA (FASI)', 128);
INSERT INTO public.empresa VALUES (1294, true, 1, '2023-07-02 12:35:22.490912', NULL, NULL, false, 'FACULDADE DE SAÚDE SANTO AGOSTINHO DE VITÓRIA DA CONQUISTA (FASA)', 37);
INSERT INTO public.empresa VALUES (1295, true, 1, '2023-07-02 12:35:22.492249', NULL, NULL, false, 'FACULDADE DESCOMPLICA', 12);
INSERT INTO public.empresa VALUES (1296, true, 1, '2023-07-02 12:35:22.493578', NULL, NULL, false, 'FACULDADE DE SERTÃOZINHO', 291);
INSERT INTO public.empresa VALUES (1297, true, 1, '2023-07-02 12:35:22.494951', NULL, NULL, false, 'FACULDADE DE SOBRAL (FASOL)', 167);
INSERT INTO public.empresa VALUES (1298, true, 1, '2023-07-02 12:35:22.496449', NULL, NULL, false, 'FACULDADE DE SOROCABA', 146);
INSERT INTO public.empresa VALUES (1299, true, 1, '2023-07-02 12:35:22.497958', NULL, NULL, false, 'FACULDADE DE SUZANO (UNISUZ)', 184);
INSERT INTO public.empresa VALUES (1300, true, 1, '2023-07-02 12:35:22.506799', NULL, NULL, false, 'FACULDADE DE TAPEJARA (FAT)', 516);
INSERT INTO public.empresa VALUES (1301, true, 1, '2023-07-02 12:35:22.508109', NULL, NULL, false, 'FACULDADE DE TAQUARITINGA (FTGA)', 517);
INSERT INTO public.empresa VALUES (1302, true, 1, '2023-07-02 12:35:22.509442', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA AEROTD (AEROTD)', 3);
INSERT INTO public.empresa VALUES (1303, true, 1, '2023-07-02 12:35:22.510778', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ALCIDES MAYA (AMTEC)', 149);
INSERT INTO public.empresa VALUES (1304, true, 1, '2023-07-02 12:35:22.512023', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ALPHA CHANNEL (FATAC)', 8);
INSERT INTO public.empresa VALUES (1305, true, 1, '2023-07-02 12:35:22.513557', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ALTO MÉDIO SÃO FRANCISCO (FAC FUNAM)', 302);
INSERT INTO public.empresa VALUES (1306, true, 1, '2023-07-02 12:35:22.520682', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ASSESSORITEC', 68);
INSERT INTO public.empresa VALUES (1307, true, 1, '2023-07-02 12:35:22.522024', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA AVANÇADA', 264);
INSERT INTO public.empresa VALUES (1308, true, 1, '2023-07-02 12:35:22.523358', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA BANDEIRANTES (BANDTEC)', 8);
INSERT INTO public.empresa VALUES (1309, true, 1, '2023-07-02 12:35:22.524683', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA CACHOEIRO DE ITAPEMIRIM (FACI)', 190);
INSERT INTO public.empresa VALUES (1310, true, 1, '2023-07-02 12:35:22.526009', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA CENTEC - CARIRI (CENTEC)', 135);
INSERT INTO public.empresa VALUES (1311, true, 1, '2023-07-02 12:35:22.526987', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA CENTEC - SERTÃO CENTRAL (FTC SERTÃO CENTRAL)', 500);
INSERT INTO public.empresa VALUES (1312, true, 1, '2023-07-02 12:35:22.53591', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA CNA (FATECNA)', 5);
INSERT INTO public.empresa VALUES (1313, true, 1, '2023-07-02 12:35:22.537455', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA COESP (FCOESP)', 107);
INSERT INTO public.empresa VALUES (1314, true, 1, '2023-07-02 12:35:22.53879', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DA AMAZÔNIA (FATEC)', 75);
INSERT INTO public.empresa VALUES (1315, true, 1, '2023-07-02 12:35:22.540145', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DA PARAÍBA (FATECPB)', 204);
INSERT INTO public.empresa VALUES (1316, true, 1, '2023-07-02 12:35:22.541449', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ADAMANTINA', 91);
INSERT INTO public.empresa VALUES (1317, true, 1, '2023-07-02 12:35:22.542834', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE AMERICANA "MINISTRO RALPH BIASI" (FATEC-AM)', 187);
INSERT INTO public.empresa VALUES (1318, true, 1, '2023-07-02 12:35:22.550286', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ARAÇATUBA (FATEC ARAÇATUBA)', 197);
INSERT INTO public.empresa VALUES (1319, true, 1, '2023-07-02 12:35:22.551834', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ARARAQUARA (FATEC ARQ)', 378);
INSERT INTO public.empresa VALUES (1320, true, 1, '2023-07-02 12:35:22.553172', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ARARAS', 83);
INSERT INTO public.empresa VALUES (1321, true, 1, '2023-07-02 12:35:22.554351', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ASSIS (FATEC ASSIS)', 379);
INSERT INTO public.empresa VALUES (1322, true, 1, '2023-07-02 12:35:22.555709', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE BARUERI (FATEC BARUERI)', 381);
INSERT INTO public.empresa VALUES (1323, true, 1, '2023-07-02 12:35:22.557112', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE BAURU (FATEC)', 93);
INSERT INTO public.empresa VALUES (1324, true, 1, '2023-07-02 12:35:22.56605', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE BOTUCATU (FATEC BT)', 383);
INSERT INTO public.empresa VALUES (1325, true, 1, '2023-07-02 12:35:22.567609', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE BRAGANÇA PAULISTA', 404);
INSERT INTO public.empresa VALUES (1326, true, 1, '2023-07-02 12:35:22.568956', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CAMPINAS (FATEC CAMPINAS)', 177);
INSERT INTO public.empresa VALUES (1327, true, 1, '2023-07-02 12:35:22.570284', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CAPÃO BONITO (FATEC-CB)', 518);
INSERT INTO public.empresa VALUES (1328, true, 1, '2023-07-02 12:35:22.571632', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CARAPICUIBA (FATEC)', 519);
INSERT INTO public.empresa VALUES (1329, true, 1, '2023-07-02 12:35:22.572737', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CATANDUVA (FATEC CATANDUVA)', 181);
INSERT INTO public.empresa VALUES (1330, true, 1, '2023-07-02 12:35:22.580171', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE COTIA (FATEC COTIA)', 520);
INSERT INTO public.empresa VALUES (1331, true, 1, '2023-07-02 12:35:22.58173', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CRUZEIRO DO OESTE (FACO)', 521);
INSERT INTO public.empresa VALUES (1332, true, 1, '2023-07-02 12:35:22.583052', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE DIADEMA LUIGI PAPAIZ (FATEC DIADEMA)', 522);
INSERT INTO public.empresa VALUES (1333, true, 1, '2023-07-02 12:35:22.584376', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE FERRAZ DE VASCONCELOS', 523);
INSERT INTO public.empresa VALUES (1334, true, 1, '2023-07-02 12:35:22.585701', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE FRANCO DA ROCHA', 524);
INSERT INTO public.empresa VALUES (1335, true, 1, '2023-07-02 12:35:22.586932', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE GARÇA (FATECGA)', 457);
INSERT INTO public.empresa VALUES (1336, true, 1, '2023-07-02 12:35:22.59604', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE GUARATINGUETÁ (FATEC GT)', 363);
INSERT INTO public.empresa VALUES (1337, true, 1, '2023-07-02 12:35:22.597574', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE GUARULHOS (FATEC GR)', 100);
INSERT INTO public.empresa VALUES (1338, true, 1, '2023-07-02 12:35:22.598903', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE HORIZONTE (FATHOR)', 525);
INSERT INTO public.empresa VALUES (1339, true, 1, '2023-07-02 12:35:22.60044', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE INDAIATUBA (FATEC-ID)', 11);
INSERT INTO public.empresa VALUES (1340, true, 1, '2023-07-02 12:35:22.601926', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITAPETININGA - PROF.ANTÔNIO BELIZANDRO BARBOSA REZENDE (FATEC - ITAPETININGA)', 271);
INSERT INTO public.empresa VALUES (1341, true, 1, '2023-07-02 12:35:22.603293', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITAPIRA (FATEC ITAPIRA)', 104);
INSERT INTO public.empresa VALUES (1342, true, 1, '2023-07-02 12:35:22.61059', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITAQUAQUECETUBA (FATEC ITAQUA)', 526);
INSERT INTO public.empresa VALUES (1343, true, 1, '2023-07-02 12:35:22.61194', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITAQUERA (FATEC ITAQUERA)', 8);
INSERT INTO public.empresa VALUES (1344, true, 1, '2023-07-02 12:35:22.613258', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITATIBA (FATEC ITATIBA)', 527);
INSERT INTO public.empresa VALUES (1345, true, 1, '2023-07-02 12:35:22.614587', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE JACAREÍ (FATEC JACAREÍ)', 273);
INSERT INTO public.empresa VALUES (1346, true, 1, '2023-07-02 12:35:22.61596', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE JAHU (FATEC-JAHU)', 274);
INSERT INTO public.empresa VALUES (1347, true, 1, '2023-07-02 12:35:22.617257', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE JALES (FATEC JALES)', 106);
INSERT INTO public.empresa VALUES (1348, true, 1, '2023-07-02 12:35:22.626064', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE JUNDIAÍ (FATEC/JD)', 182);
INSERT INTO public.empresa VALUES (1349, true, 1, '2023-07-02 12:35:22.627487', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE MATÃO', 278);
INSERT INTO public.empresa VALUES (1350, true, 1, '2023-07-02 12:35:22.628907', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE MAUÁ (FATEC MAUÁ)', 480);
INSERT INTO public.empresa VALUES (1351, true, 1, '2023-07-02 12:35:22.630343', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE MOCOCA (FATEC)', 528);
INSERT INTO public.empresa VALUES (1352, true, 1, '2023-07-02 12:35:22.63167', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE MOGI DAS CRUZES (FATEC-MC)', 62);
INSERT INTO public.empresa VALUES (1353, true, 1, '2023-07-02 12:35:22.633057', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE OSASCO - PREFEITO HIRANT SANAZAR (FATEC OSASCO)', 158);
INSERT INTO public.empresa VALUES (1354, true, 1, '2023-07-02 12:35:22.640377', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE OURINHOS (FATEC)', 89);
INSERT INTO public.empresa VALUES (1355, true, 1, '2023-07-02 12:35:22.641692', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PINDAMONHANGABA (FATEC PI)', 162);
INSERT INTO public.empresa VALUES (1356, true, 1, '2023-07-02 12:35:22.643024', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PIRACICABA (FATEC PIRACICABA)', 224);
INSERT INTO public.empresa VALUES (1357, true, 1, '2023-07-02 12:35:22.644388', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PIRACICABA (FATEP)', 224);
INSERT INTO public.empresa VALUES (1358, true, 1, '2023-07-02 12:35:22.645745', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE POMPEIA - SHUNJI NISHIMURA (FATEC POMPEIA)', 529);
INSERT INTO public.empresa VALUES (1359, true, 1, '2023-07-02 12:35:22.647096', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PONTA PORÃ (FATEP)', 495);
INSERT INTO public.empresa VALUES (1360, true, 1, '2023-07-02 12:35:22.656126', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PRAIA GRANDE (FATECPG)', 250);
INSERT INTO public.empresa VALUES (1361, true, 1, '2023-07-02 12:35:22.657535', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PRESIDENTE PRUDENTE (FATEC)', 50);
INSERT INTO public.empresa VALUES (1362, true, 1, '2023-07-02 12:35:22.658868', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SANTANA DE PARNAÍBA (FATEC-SPB)', 509);
INSERT INTO public.empresa VALUES (1363, true, 1, '2023-07-02 12:35:22.660211', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO BERNARDO DO CAMPO (FATEC-SB)', 82);
INSERT INTO public.empresa VALUES (1364, true, 1, '2023-07-02 12:35:22.661554', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO CAETANO DO SUL (FATEC SCS)', 126);
INSERT INTO public.empresa VALUES (1365, true, 1, '2023-07-02 12:35:22.662697', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO CARLOS (FATEC SÃO CARLO)', 72);
INSERT INTO public.empresa VALUES (1366, true, 1, '2023-07-02 12:35:22.670073', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO JOSÉ DO RIO PRETO (FATECRP)', 114);
INSERT INTO public.empresa VALUES (1367, true, 1, '2023-07-02 12:35:22.671402', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO JOSÉ DOS CAMPOS - JESSEN VIDAL (FATECSJCAMPOS)', 144);
INSERT INTO public.empresa VALUES (1368, true, 1, '2023-07-02 12:35:22.672746', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO PAULO (FATEC-SP)', 8);
INSERT INTO public.empresa VALUES (1369, true, 1, '2023-07-02 12:35:22.674086', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO ROQUE (FATEC-SR)', 191);
INSERT INTO public.empresa VALUES (1370, true, 1, '2023-07-02 12:35:22.6754', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO SEBASTIÃO (FATEC SS)', 530);
INSERT INTO public.empresa VALUES (1371, true, 1, '2023-07-02 12:35:22.676779', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO VICENTE (FATEF)', 513);
INSERT INTO public.empresa VALUES (1372, true, 1, '2023-07-02 12:35:22.685962', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SERTÃOZINHO (FATEC SERTÃOZINHO)', 291);
INSERT INTO public.empresa VALUES (1373, true, 1, '2023-07-02 12:35:22.687448', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SINOP (FASTECH)', 155);
INSERT INTO public.empresa VALUES (1374, true, 1, '2023-07-02 12:35:22.688773', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SOROCABA (FATEC SO)', 146);
INSERT INTO public.empresa VALUES (1375, true, 1, '2023-07-02 12:35:22.68994', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SUMARÉ (FATEC DE SUMARÉ)', 293);
INSERT INTO public.empresa VALUES (1376, true, 1, '2023-07-02 12:35:22.691127', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE TAQUARITINGA (FATEC/TQ)', 517);
INSERT INTO public.empresa VALUES (1377, true, 1, '2023-07-02 12:35:22.692519', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE TATUÍ - PROF. WILSON ROBERTO RIBEIRO DE CAMARGO (FATEC TATUÍ)', 458);
INSERT INTO public.empresa VALUES (1378, true, 1, '2023-07-02 12:35:22.699928', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE TAUBATÉ (FATEC TAUBATÉ)', 33);
INSERT INTO public.empresa VALUES (1379, true, 1, '2023-07-02 12:35:22.701475', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE TERESINA (FACULDADE CET)', 27);
INSERT INTO public.empresa VALUES (1380, true, 1, '2023-07-02 12:35:22.70278', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO AMAPÁ (META)', 26);
INSERT INTO public.empresa VALUES (1381, true, 1, '2023-07-02 12:35:22.70396', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO BRASIL (FAT BRASIL)', 531);
INSERT INTO public.empresa VALUES (1382, true, 1, '2023-07-02 12:35:22.705287', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO COOPERATIVISMO', 149);
INSERT INTO public.empresa VALUES (1383, true, 1, '2023-07-02 12:35:22.706386', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO IPIRANGA (FATECIPI)', 8);
INSERT INTO public.empresa VALUES (1384, true, 1, '2023-07-02 12:35:22.715546', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DOM AMAURY CASTANHO (FATEC ITU)', 180);
INSERT INTO public.empresa VALUES (1385, true, 1, '2023-07-02 12:35:22.717058', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO NORDESTE (FATENE)', 45);
INSERT INTO public.empresa VALUES (1386, true, 1, '2023-07-02 12:35:22.718398', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO PIAUÍ (FATEPI)', 27);
INSERT INTO public.empresa VALUES (1387, true, 1, '2023-07-02 12:35:22.719723', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO TATUAPÉ (FATEC-TT)', 8);
INSERT INTO public.empresa VALUES (1388, true, 1, '2023-07-02 12:35:22.721075', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO VALE DO IVAÍ (FATEC-IVAI)', 532);
INSERT INTO public.empresa VALUES (1389, true, 1, '2023-07-02 12:35:22.72246', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DR. THOMAZ NOVELINO (FATEC FRANCA)', 179);
INSERT INTO public.empresa VALUES (1390, true, 1, '2023-07-02 12:35:22.730021', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E ADMINISTRAÇÃO EDUFOR (EDUFOR)', 141);
INSERT INTO public.empresa VALUES (1391, true, 1, '2023-07-02 12:35:22.731669', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS (FTC JUAZEIRO)', 533);
INSERT INTO public.empresa VALUES (1392, true, 1, '2023-07-02 12:35:22.732961', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DA BAHIA (FATEC/BA)', 213);
INSERT INTO public.empresa VALUES (1393, true, 1, '2023-07-02 12:35:22.734393', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE CAMPINA GRANDE (FTC CAMP GRANDE)', 147);
INSERT INTO public.empresa VALUES (1394, true, 1, '2023-07-02 12:35:22.735841', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE ITABUNA (FTC)', 269);
INSERT INTO public.empresa VALUES (1395, true, 1, '2023-07-02 12:35:22.737211', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE JEQUIÉ (FTC)', 275);
INSERT INTO public.empresa VALUES (1396, true, 1, '2023-07-02 12:35:22.746387', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE TERESINA (FTC TERESINA)', 27);
INSERT INTO public.empresa VALUES (1397, true, 1, '2023-07-02 12:35:22.748262', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DO ALTO PARANAÍBA (FATAP)', 125);
INSERT INTO public.empresa VALUES (1398, true, 1, '2023-07-02 12:35:22.749917', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CAMAÇARI (FTC CAMAÇARI)', 153);
INSERT INTO public.empresa VALUES (1399, true, 1, '2023-07-02 12:35:22.751234', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CARUARU (FTC - CARUARU)', 156);
INSERT INTO public.empresa VALUES (1400, true, 1, '2023-07-02 12:35:22.752568', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CAUCAIA (FTC CAUCAIA)', 534);
INSERT INTO public.empresa VALUES (1401, true, 1, '2023-07-02 12:35:22.753709', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC ITAPIPOCA (FTC ITAPIPOCA)', 535);
INSERT INTO public.empresa VALUES (1402, true, 1, '2023-07-02 12:35:22.76096', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC JUAZEIRO DO NORTE (FTC JUAZEIRO CE)', 135);
INSERT INTO public.empresa VALUES (1403, true, 1, '2023-07-02 12:35:22.762476', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC N. SRA. DO SOCORRO (FTC N S SOCORRO)', 536);
INSERT INTO public.empresa VALUES (1404, true, 1, '2023-07-02 12:35:22.763957', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC PARNAMIRIM (FTC PARNAMIRIM)', 537);
INSERT INTO public.empresa VALUES (1405, true, 1, '2023-07-02 12:35:22.765281', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC PETROLINA (FTC PETROLINA)', 445);
INSERT INTO public.empresa VALUES (1406, true, 1, '2023-07-02 12:35:22.766612', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC TEIXEIRA DE FREITAS (FTC)', 295);
INSERT INTO public.empresa VALUES (1407, true, 1, '2023-07-02 12:35:22.767989', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E DESENVOLVIMENTO DE COMPETÊNCIAS (FDC)', 79);
INSERT INTO public.empresa VALUES (1408, true, 1, '2023-07-02 12:35:22.776977', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA, EDUCAÇÃO SUPERIOR E PROFISSIONAL (FATESP)', 27);
INSERT INTO public.empresa VALUES (1409, true, 1, '2023-07-02 12:35:22.778309', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E EDUCAÇÃO DE GOIÁS (FATEG)', 538);
INSERT INTO public.empresa VALUES (1410, true, 1, '2023-07-02 12:35:22.779834', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E EDUCAÇÃO SUPERIOR E PROFISSIONALIZ (FATESP)', 539);
INSERT INTO public.empresa VALUES (1411, true, 1, '2023-07-02 12:35:22.781137', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EGÍDIO JOSÉ DA SILVA (FATEGIDIO)', 7);
INSERT INTO public.empresa VALUES (1412, true, 1, '2023-07-02 12:35:22.782474', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E INOVAÇÃO SENAC DF', 5);
INSERT INTO public.empresa VALUES (1413, true, 1, '2023-07-02 12:35:22.78387', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EM HOTELARIA, GASTRONOMIA E TURISMO DE SÃO PAULO (HOTEC)', 8);
INSERT INTO public.empresa VALUES (1414, true, 1, '2023-07-02 12:35:22.791164', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EM SAÚDE (FATESA)', 58);
INSERT INTO public.empresa VALUES (1415, true, 1, '2023-07-02 12:35:22.792617', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EM SAÚDE CIEPH (FACTES)', 3);
INSERT INTO public.empresa VALUES (1416, true, 1, '2023-07-02 12:35:22.793951', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EM SAÚDE - IAHCS (FATESA)', 149);
INSERT INTO public.empresa VALUES (1417, true, 1, '2023-07-02 12:35:22.795322', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E NEGÓCIOS DE CATALÃO (FATENC)', 17);
INSERT INTO public.empresa VALUES (1418, true, 1, '2023-07-02 12:35:22.796803', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ESTÁCIO DE CURITIBA (FATEC ESTÁC CURITIBA)', 56);
INSERT INTO public.empresa VALUES (1419, true, 1, '2023-07-02 12:35:22.797918', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ESTUDANTE RAFAEL ALMEIDA CAMARINHA - MARILIA (FATEC MARILIA)', 145);
INSERT INTO public.empresa VALUES (1420, true, 1, '2023-07-02 12:35:22.806862', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FAESA (CET-FAESA)', 25);
INSERT INTO public.empresa VALUES (1421, true, 1, '2023-07-02 12:35:22.808172', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA - FATEC DE RIBEIRÃO PRETO', 58);
INSERT INTO public.empresa VALUES (1422, true, 1, '2023-07-02 12:35:22.809514', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FRANCISCO MORATO (FFRAMO)', 540);
INSERT INTO public.empresa VALUES (1423, true, 1, '2023-07-02 12:35:22.81085', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FTEC (FTEC NOVO HAMBURGO)', 541);
INSERT INTO public.empresa VALUES (1424, true, 1, '2023-07-02 12:35:22.812213', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FTEC DE PORTO ALEGRE (FTEC PORTO ALEGRE)', 149);
INSERT INTO public.empresa VALUES (1425, true, 1, '2023-07-02 12:35:22.813745', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FUTURO (FATEC FUTURO)', 56);
INSERT INTO public.empresa VALUES (1426, true, 1, '2023-07-02 12:35:22.821022', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA GAP (GAP)', 264);
INSERT INTO public.empresa VALUES (1427, true, 1, '2023-07-02 12:35:22.822487', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IBRATE (FAITEC)', 56);
INSERT INTO public.empresa VALUES (1428, true, 1, '2023-07-02 12:35:22.823818', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ÍCONE (FACTI)', 5);
INSERT INTO public.empresa VALUES (1429, true, 1, '2023-07-02 12:35:22.82516', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA INFORMÁTICA (FATI)', 45);
INSERT INTO public.empresa VALUES (1430, true, 1, '2023-07-02 12:35:22.826494', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IPANEMA', 146);
INSERT INTO public.empresa VALUES (1431, true, 1, '2023-07-02 12:35:22.827891', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IPEP DE CAMPINAS (FATEC CAMPINAS)', 177);
INSERT INTO public.empresa VALUES (1432, true, 1, '2023-07-02 12:35:22.837232', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IPPEO (IPPEO)', 56);
INSERT INTO public.empresa VALUES (1433, true, 1, '2023-07-02 12:35:22.838681', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IPUC (FATIPUC)', 542);
INSERT INTO public.empresa VALUES (1434, true, 1, '2023-07-02 12:35:22.840042', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA JARDIM (FATEJ)', 47);
INSERT INTO public.empresa VALUES (1435, true, 1, '2023-07-02 12:35:22.841388', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA JORGE CARAM SABBAG (FATEC BEBEDOURO)', 208);
INSERT INTO public.empresa VALUES (1436, true, 1, '2023-07-02 12:35:22.84272', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA LA SALLE - ESTRELA (FACSALLE)', 543);
INSERT INTO public.empresa VALUES (1437, true, 1, '2023-07-02 12:35:22.843856', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA NILO DE STÉFANI - JABOTICABAL (FATEC JBL)', 315);
INSERT INTO public.empresa VALUES (1438, true, 1, '2023-07-02 12:35:22.851348', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA NOVA PALHOÇA (FATENP)', 544);
INSERT INTO public.empresa VALUES (1439, true, 1, '2023-07-02 12:35:22.853155', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA OSWALDO CRUZ (FATEC OSWALDO CRUZ)', 8);
INSERT INTO public.empresa VALUES (1440, true, 1, '2023-07-02 12:35:22.854476', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PAULISTA', 545);
INSERT INTO public.empresa VALUES (1441, true, 1, '2023-07-02 12:35:22.85581', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PENTÁGONO (FATEP)', 47);
INSERT INTO public.empresa VALUES (1442, true, 1, '2023-07-02 12:35:22.857129', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PORTO DAS MONÇÕES (FAMO)', 496);
INSERT INTO public.empresa VALUES (1443, true, 1, '2023-07-02 12:35:22.858537', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PORTO SUL (FAPS)', 250);
INSERT INTO public.empresa VALUES (1444, true, 1, '2023-07-02 12:35:22.867576', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PROFESSOR ANTÔNIO SEABRA (FATEC LINS)', 70);
INSERT INTO public.empresa VALUES (1445, true, 1, '2023-07-02 12:35:22.869125', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA RUBENS LARA (FATEC-BS)', 171);
INSERT INTO public.empresa VALUES (1446, true, 1, '2023-07-02 12:35:22.87046', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SAINT PAUL', 8);
INSERT INTO public.empresa VALUES (1447, true, 1, '2023-07-02 12:35:22.871811', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SANTO ANDRÉ (FATEC-SA)', 47);
INSERT INTO public.empresa VALUES (1448, true, 1, '2023-07-02 12:35:22.873151', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SEBRAE (FATEC SEBRAE)', 8);
INSERT INTO public.empresa VALUES (1449, true, 1, '2023-07-02 12:35:22.874546', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC AMAZONAS', 75);
INSERT INTO public.empresa VALUES (1450, true, 1, '2023-07-02 12:35:22.881919', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC CASCAVEL', 54);
INSERT INTO public.empresa VALUES (1451, true, 1, '2023-07-02 12:35:22.883482', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC CURITIBA', 56);
INSERT INTO public.empresa VALUES (1452, true, 1, '2023-07-02 12:35:22.884859', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC CURITIBA PORTÃO', 56);
INSERT INTO public.empresa VALUES (1453, true, 1, '2023-07-02 12:35:22.886338', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC MARINGÁ', 76);
INSERT INTO public.empresa VALUES (1454, true, 1, '2023-07-02 12:35:22.887823', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC MINAS - UNIDADE BARBACENA', 32);
INSERT INTO public.empresa VALUES (1455, true, 1, '2023-07-02 12:35:22.888989', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC MINAS - UNIDADE BELO HORIZONTE (FTS)', 2);
INSERT INTO public.empresa VALUES (1456, true, 1, '2023-07-02 12:35:22.898057', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC PELOTAS (FATEC SENAC PELOTAS)', 283);
INSERT INTO public.empresa VALUES (1457, true, 1, '2023-07-02 12:35:22.89975', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC PONTA GROSSA', 188);
INSERT INTO public.empresa VALUES (1458, true, 1, '2023-07-02 12:35:22.901083', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC RIO (FATEC)', 12);
INSERT INTO public.empresa VALUES (1459, true, 1, '2023-07-02 12:35:22.902443', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI ANTÔNIO ADOLPHO LOBBE', 72);
INSERT INTO public.empresa VALUES (1460, true, 1, '2023-07-02 12:35:22.903752', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI CAMPO GRANDE', 48);
INSERT INTO public.empresa VALUES (1461, true, 1, '2023-07-02 12:35:22.905166', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI CHAPECÓ (SENAI)', 406);
INSERT INTO public.empresa VALUES (1462, true, 1, '2023-07-02 12:35:22.912703', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI CIC', 56);
INSERT INTO public.empresa VALUES (1463, true, 1, '2023-07-02 12:35:22.914335', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI CURITIBA', 56);
INSERT INTO public.empresa VALUES (1464, true, 1, '2023-07-02 12:35:22.915906', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI DE DESENVOLVIMENTO GERENCIAL (FATESG)', 42);
INSERT INTO public.empresa VALUES (1465, true, 1, '2023-07-02 12:35:22.917546', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI DOURADOS (FATEC DOURADOS)', 84);
INSERT INTO public.empresa VALUES (1466, true, 1, '2023-07-02 12:35:22.918995', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI FELIX GUISARD', 33);
INSERT INTO public.empresa VALUES (1467, true, 1, '2023-07-02 12:35:22.920498', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI FLORIANÓPOLIS (SENAI -SC - CTAI)', 3);
INSERT INTO public.empresa VALUES (1468, true, 1, '2023-07-02 12:35:22.929681', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI GASPAR RICARDO JUNIOR', 146);
INSERT INTO public.empresa VALUES (1469, true, 1, '2023-07-02 12:35:22.931383', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI ÍTALO BOLOGNA (FATECIB)', 42);
INSERT INTO public.empresa VALUES (1470, true, 1, '2023-07-02 12:35:22.932871', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI JARAGUÁ DO SUL (FATEC)', 31);
INSERT INTO public.empresa VALUES (1471, true, 1, '2023-07-02 12:35:22.934368', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI JOINVILLE (SENAI DE JOINVILLE)', 68);
INSERT INTO public.empresa VALUES (1472, true, 1, '2023-07-02 12:35:22.935701', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI LONDRINA', 159);
INSERT INTO public.empresa VALUES (1473, true, 1, '2023-07-02 12:35:22.936841', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI MARIO AMATO (SENAI)', 82);
INSERT INTO public.empresa VALUES (1474, true, 1, '2023-07-02 12:35:22.944148', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI MATO GROSSO (FATEC SENAI MT)', 203);
INSERT INTO public.empresa VALUES (1475, true, 1, '2023-07-02 12:35:22.945669', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI NADIR DIAS DE FIGUEIREDO', 158);
INSERT INTO public.empresa VALUES (1476, true, 1, '2023-07-02 12:35:22.947127', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI PERNAMBUCO', 60);
INSERT INTO public.empresa VALUES (1477, true, 1, '2023-07-02 12:35:22.948455', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI PORTO ALEGRE (FATEC SENAI)', 149);
INSERT INTO public.empresa VALUES (1478, true, 1, '2023-07-02 12:35:22.949787', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI ROBERTO MANGE', 177);
INSERT INTO public.empresa VALUES (1479, true, 1, '2023-07-02 12:35:22.951162', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI ROBERTO MANGE (FATEC SENAI RM)', 264);
INSERT INTO public.empresa VALUES (1480, true, 1, '2023-07-02 12:35:22.960096', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA TUPY DE SÃO BENTO DO SUL (FTT-SBS)', 546);
INSERT INTO public.empresa VALUES (1481, true, 1, '2023-07-02 12:35:22.961398', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ZONA LESTE (FATEC-ZL)', 8);
INSERT INTO public.empresa VALUES (1482, true, 1, '2023-07-02 12:35:22.962833', NULL, NULL, false, 'FACULDADE DE TECONOLOGIA DA ZONA SUL (FATEC ZONASUL)', 8);
INSERT INTO public.empresa VALUES (1483, true, 1, '2023-07-02 12:35:22.964273', NULL, NULL, false, 'FACULDADE DE TEODORO SAMPAIO (FTS)', 547);
INSERT INTO public.empresa VALUES (1484, true, 1, '2023-07-02 12:35:22.965776', NULL, NULL, false, 'FACULDADE DE TEOLOGIA DA ARQUIDIOCESE DE BRASÍLIA (FATEO)', 5);
INSERT INTO public.empresa VALUES (1485, true, 1, '2023-07-02 12:35:22.967304', NULL, NULL, false, 'FACULDADE DE TEOLOGIA DE SÃO PAULO DA IGREJA PRESBITERIANA INDEPENDENTE DO BRASIL', 8);
INSERT INTO public.empresa VALUES (1486, true, 1, '2023-07-02 12:35:22.974753', NULL, NULL, false, 'FACULDADE DE TEOLOGIA E CIÊNCIAS HUMANAS (FATECH)', 26);
INSERT INTO public.empresa VALUES (1487, true, 1, '2023-07-02 12:35:22.976252', NULL, NULL, false, 'FACULDADE DE TEOLOGIA E CIÊNCIAS HUMANAS (ITEPAFACULDADES)', 282);
INSERT INTO public.empresa VALUES (1488, true, 1, '2023-07-02 12:35:22.977597', NULL, NULL, false, 'FACULDADE DE TEOLOGIA EVANGÉLICA EM CURITIBA - FATEV (FATEV)', 56);
INSERT INTO public.empresa VALUES (1489, true, 1, '2023-07-02 12:35:22.978935', NULL, NULL, false, 'FACULDADE DE TEOLOGIA, FILOSOFIA E CIÊNCIAS HUMANAS GAMALIEL (FATEFIG)', 418);
INSERT INTO public.empresa VALUES (1490, true, 1, '2023-07-02 12:35:22.980239', NULL, NULL, false, 'FACULDADE DE TEOLOGIA FORTALEZA - FATEFOR (FATEFOR)', 45);
INSERT INTO public.empresa VALUES (1491, true, 1, '2023-07-02 12:35:22.981387', NULL, NULL, false, 'FACULDADE DE TEOLOGIA INTEGRADA (FATIN)', 413);
INSERT INTO public.empresa VALUES (1492, true, 1, '2023-07-02 12:35:22.990711', NULL, NULL, false, 'FACULDADE DE TIETÊ', 548);
INSERT INTO public.empresa VALUES (1493, true, 1, '2023-07-02 12:35:22.992186', NULL, NULL, false, 'FACULDADE DE TUPÃ', 354);
INSERT INTO public.empresa VALUES (1494, true, 1, '2023-07-02 12:35:22.993669', NULL, NULL, false, 'FACULDADE DE VIÇOSA (FDV)', 122);
INSERT INTO public.empresa VALUES (1495, true, 1, '2023-07-02 12:35:22.995058', NULL, NULL, false, 'FACULDADE DE VITÓRIA', 25);
INSERT INTO public.empresa VALUES (1496, true, 1, '2023-07-02 12:35:22.99657', NULL, NULL, false, 'FACULDADE DIADEMA (FAD)', 522);
INSERT INTO public.empresa VALUES (1497, true, 1, '2023-07-02 12:35:22.998135', NULL, NULL, false, 'FACULDADE DINÂMICA (FACDIN)', 549);
INSERT INTO public.empresa VALUES (1498, true, 1, '2023-07-02 12:35:23.005457', NULL, NULL, false, 'FACULDADE DINÂMICA DO VALE DO PIRANGA (FADIP)', 550);
INSERT INTO public.empresa VALUES (1499, true, 1, '2023-07-02 12:35:23.006858', NULL, NULL, false, 'FACULDADE DIOCESANA SÃO JOSÉ (FADISI)', 143);
INSERT INTO public.empresa VALUES (1500, true, 1, '2023-07-02 12:35:23.008209', NULL, NULL, false, 'FACULDADE DO AMAZONAS (IAES)', 75);
INSERT INTO public.empresa VALUES (1501, true, 1, '2023-07-02 12:35:23.009537', NULL, NULL, false, 'FACULDADE DO AMAZONAS DE ENSINO, PESQUISA E INOVAÇÃO (FAMEPI)', 75);
INSERT INTO public.empresa VALUES (1502, true, 1, '2023-07-02 12:35:23.010868', NULL, NULL, false, 'FACULDADE DO BAIXO PARNAÍBA (FAP)', 551);
INSERT INTO public.empresa VALUES (1503, true, 1, '2023-07-02 12:35:23.012464', NULL, NULL, false, 'FACULDADE DO BELO JARDIM (FBJ)', 395);
INSERT INTO public.empresa VALUES (1504, true, 1, '2023-07-02 12:35:23.021597', NULL, NULL, false, 'FACULDADE DO CARIRI PARAIBANO (UNICIR)', 552);
INSERT INTO public.empresa VALUES (1505, true, 1, '2023-07-02 12:35:23.023184', NULL, NULL, false, 'FACULDADE DO CEFI (FACEFI)', 149);
INSERT INTO public.empresa VALUES (1506, true, 1, '2023-07-02 12:35:23.024525', NULL, NULL, false, 'FACULDADE DO CENTRO EDUCACIONAL MINEIRO - FACEM (FACEM-BH)', 2);
INSERT INTO public.empresa VALUES (1507, true, 1, '2023-07-02 12:35:23.026034', NULL, NULL, false, 'FACULDADE DO CENTRO EDUCACIONAL SANTA ISABEL (FACESI)', 553);
INSERT INTO public.empresa VALUES (1508, true, 1, '2023-07-02 12:35:23.027531', NULL, NULL, false, 'FACULDADE DO CENTRO LESTE (UCL)', 290);
INSERT INTO public.empresa VALUES (1509, true, 1, '2023-07-02 12:35:23.028686', NULL, NULL, false, 'FACULDADE DO CENTRO MARANHENSE (FCMA)', 554);
INSERT INTO public.empresa VALUES (1510, true, 1, '2023-07-02 12:35:23.036109', NULL, NULL, false, 'FACULDADE DO CENTRO OESTE PAULISTA (FACOP)', 555);
INSERT INTO public.empresa VALUES (1511, true, 1, '2023-07-02 12:35:23.037432', NULL, NULL, false, 'FACULDADE DOCKTOR (FADOCKTOR)', 154);
INSERT INTO public.empresa VALUES (1512, true, 1, '2023-07-02 12:35:23.038739', NULL, NULL, false, 'FACULDADE DO CLUBE NÁUTICO MOGIANO (FCNM)', 62);
INSERT INTO public.empresa VALUES (1513, true, 1, '2023-07-02 12:35:23.040098', NULL, NULL, false, 'FACULDADE DO COMÉRCIO DE SÃO PAULO (FAC-SP)', 8);
INSERT INTO public.empresa VALUES (1514, true, 1, '2023-07-02 12:35:23.041446', NULL, NULL, false, 'FACULDADE DO COMPLEXO EDUCACIONAL SANTO ANDRÉ (FACESA)', 556);
INSERT INTO public.empresa VALUES (1515, true, 1, '2023-07-02 12:35:23.042801', NULL, NULL, false, 'FACULDADE DOCTUM DA ZONA NORTE DE JUIZ DE FORA (DOCTUM)', 38);
INSERT INTO public.empresa VALUES (1516, true, 1, '2023-07-02 12:35:23.051905', NULL, NULL, false, 'FACULDADE DOCTUM DE ALMENARA (DOCTUM)', 252);
INSERT INTO public.empresa VALUES (1517, true, 1, '2023-07-02 12:35:23.053436', NULL, NULL, false, 'FACULDADE DOCTUM DE CARANGOLA (DOCTUM)', 557);
INSERT INTO public.empresa VALUES (1518, true, 1, '2023-07-02 12:35:23.054776', NULL, NULL, false, 'FACULDADE DOCTUM DE JOÃO MONLEVADE (DOCTUM)', 558);
INSERT INTO public.empresa VALUES (1519, true, 1, '2023-07-02 12:35:23.056232', NULL, NULL, false, 'FACULDADE DOCTUM DE JUIZ DE FORA (DOCTUM)', 38);
INSERT INTO public.empresa VALUES (1520, true, 1, '2023-07-02 12:35:23.057624', NULL, NULL, false, 'FACULDADE DOCTUM DE MANHUAÇU - DOCTUM (FCM)', 207);
INSERT INTO public.empresa VALUES (1521, true, 1, '2023-07-02 12:35:23.059139', NULL, NULL, false, 'FACULDADE DOCTUM DE SERRA (DOCTUM)', 290);
INSERT INTO public.empresa VALUES (1522, true, 1, '2023-07-02 12:35:23.066748', NULL, NULL, false, 'FACULDADE DOCTUM DE SETE LAGOAS (DOCTUM)', 24);
INSERT INTO public.empresa VALUES (1523, true, 1, '2023-07-02 12:35:23.068307', NULL, NULL, false, 'FACULDADE DOCTUM DE VILA VELHA (DOCTUM)', 226);
INSERT INTO public.empresa VALUES (1524, true, 1, '2023-07-02 12:35:23.069621', NULL, NULL, false, 'FACULDADE DOCTUM DE VITÓRIA (DOCTUM)', 25);
INSERT INTO public.empresa VALUES (1525, true, 1, '2023-07-02 12:35:23.071001', NULL, NULL, false, 'FACULDADE DO EDUCADOR (FEDUC)', 8);
INSERT INTO public.empresa VALUES (1526, true, 1, '2023-07-02 12:35:23.072318', NULL, NULL, false, 'FACULDADE DO ESTADO DE SÃO PAULO (ESP)', 197);
INSERT INTO public.empresa VALUES (1527, true, 1, '2023-07-02 12:35:23.073422', NULL, NULL, false, 'FACULDADE DO ESTADO DO MARANHÃO (FACEM)', 141);
INSERT INTO public.empresa VALUES (1528, true, 1, '2023-07-02 12:35:23.082766', NULL, NULL, false, 'FACULDADE DO ESTADO DO RIO DE JANEIRO (FAERJ)', 160);
INSERT INTO public.empresa VALUES (1529, true, 1, '2023-07-02 12:35:23.084558', NULL, NULL, false, 'FACULDADE DO FUTURO (FAF)', 207);
INSERT INTO public.empresa VALUES (1530, true, 1, '2023-07-02 12:35:23.08587', NULL, NULL, false, 'FACULDADE DO GUARUJÁ (FAGU)', 127);
INSERT INTO public.empresa VALUES (1531, true, 1, '2023-07-02 12:35:23.087201', NULL, NULL, false, 'FACULDADE DO INSTITUTO BRASIL (FIBRA)', 264);
INSERT INTO public.empresa VALUES (1532, true, 1, '2023-07-02 12:35:23.08857', NULL, NULL, false, 'FACULDADE DO INSTITUTO NACIONAL DE PÓS-GRADUAÇÃO DE SÃO JOSÉ DOS CAMPOS (FACULDADE INPG - SJC)', 144);
INSERT INTO public.empresa VALUES (1533, true, 1, '2023-07-02 12:35:23.090123', NULL, NULL, false, 'FACULDADE DO INSTITUTO PANAMERICANO (FACIPAN)', 203);
INSERT INTO public.empresa VALUES (1534, true, 1, '2023-07-02 12:35:23.097462', NULL, NULL, false, 'FACULDADE DOIS DE JULHO (F2J)', 116);
INSERT INTO public.empresa VALUES (1535, true, 1, '2023-07-02 12:35:23.099022', NULL, NULL, false, 'FACULDADE DO LITORAL PARANAENSE (FLP)', 559);
INSERT INTO public.empresa VALUES (1536, true, 1, '2023-07-02 12:35:23.100506', NULL, NULL, false, 'FACULDADE DO LITORAL SUL PAULISTA (FALS)', 250);
INSERT INTO public.empresa VALUES (1537, true, 1, '2023-07-02 12:35:23.101826', NULL, NULL, false, 'FACULDADE DO MACIÇO DO BATURITÉ (FMB)', 560);
INSERT INTO public.empresa VALUES (1538, true, 1, '2023-07-02 12:35:23.103145', NULL, NULL, false, 'FACULDADE DOM ADELIO TOMASIN (FADAT)', 67);
INSERT INTO public.empresa VALUES (1539, true, 1, '2023-07-02 12:35:23.104553', NULL, NULL, false, 'FACULDADE DOM ALBERTO (FDA)', 561);
INSERT INTO public.empresa VALUES (1540, true, 1, '2023-07-02 12:35:23.113959', NULL, NULL, false, 'FACULDADE DO MARANHÃO (FACAM-MA)', 141);
INSERT INTO public.empresa VALUES (1541, true, 1, '2023-07-02 12:35:23.115525', NULL, NULL, false, 'FACULDADE DOM BOSCO (DOM BOSCO)', 54);
INSERT INTO public.empresa VALUES (1542, true, 1, '2023-07-02 12:35:23.117014', NULL, NULL, false, 'FACULDADE DOM BOSCO DE CAPITÃO LEÔNIDAS MARQUES', 562);
INSERT INTO public.empresa VALUES (1543, true, 1, '2023-07-02 12:35:23.11849', NULL, NULL, false, 'FACULDADE DOM BOSCO DE GOIOERÊ (DOM BOSCO GOIOERÊ)', 563);
INSERT INTO public.empresa VALUES (1544, true, 1, '2023-07-02 12:35:23.119864', NULL, NULL, false, 'FACULDADE DOM BOSCO DE MARINGA (DOM BOSCO)', 76);
INSERT INTO public.empresa VALUES (1545, true, 1, '2023-07-02 12:35:23.120976', NULL, NULL, false, 'FACULDADE DOM BOSCO DE PORTO ALEGRE (FDB)', 149);
INSERT INTO public.empresa VALUES (1546, true, 1, '2023-07-02 12:35:23.128148', NULL, NULL, false, 'FACULDADE DOM BOSCO DE UBIRATÃ (DOM BOSCO UBIRATÃ)', 564);
INSERT INTO public.empresa VALUES (1547, true, 1, '2023-07-02 12:35:23.129556', NULL, NULL, false, 'FACULDADE DOM BOSCO PARANÁ (DOM BOSCO PARANÁ)', 159);
INSERT INTO public.empresa VALUES (1548, true, 1, '2023-07-02 12:35:23.131031', NULL, NULL, false, 'FACULDADE DOMINIUS (FAD)', 157);
INSERT INTO public.empresa VALUES (1549, true, 1, '2023-07-02 12:35:23.132525', NULL, NULL, false, 'FACULDADE DOM LUCIANO MENDES (FDLM)', 238);
INSERT INTO public.empresa VALUES (1550, true, 1, '2023-07-02 12:35:23.133988', NULL, NULL, false, 'FACULDADE DOM LUIS DE ORLEANS E BRAGANÇA (FDL)', 565);
INSERT INTO public.empresa VALUES (1551, true, 1, '2023-07-02 12:35:23.135388', NULL, NULL, false, 'FACULDADE DOM PEDRO II DE SERGIPE (DP II SERGIPE)', 566);
INSERT INTO public.empresa VALUES (1552, true, 1, '2023-07-02 12:35:23.144371', NULL, NULL, false, 'FACULDADE DOM PEDRO II DE TECNOLOGIA (FDP II TEC)', 116);
INSERT INTO public.empresa VALUES (1553, true, 1, '2023-07-02 12:35:23.145818', NULL, NULL, false, 'FACULDADE DOM RICARDO (FDR)', 100);
INSERT INTO public.empresa VALUES (1554, true, 1, '2023-07-02 12:35:23.147299', NULL, NULL, false, 'FACULDADE DOMUS SAPIENS (FDS)', 533);
INSERT INTO public.empresa VALUES (1555, true, 1, '2023-07-02 12:35:23.148769', NULL, NULL, false, 'FACULDADE DO NORDESTE DA BAHIA (FANEB)', 567);
INSERT INTO public.empresa VALUES (1556, true, 1, '2023-07-02 12:35:23.150097', NULL, NULL, false, 'FACULDADE DO NOROESTE DE MINAS (FINOM)', 55);
INSERT INTO public.empresa VALUES (1557, true, 1, '2023-07-02 12:35:23.151513', NULL, NULL, false, 'FACULDADE DO NORTE DE MATO GROSSO (AJES)', 467);
INSERT INTO public.empresa VALUES (1558, true, 1, '2023-07-02 12:35:23.158705', NULL, NULL, false, 'FACULDADE DO NORTE NOVO DE APUCARANA (FACNOPAR)', 377);
INSERT INTO public.empresa VALUES (1559, true, 1, '2023-07-02 12:35:23.160026', NULL, NULL, false, 'FACULDADE DO OESTE POTIGUAR (FAOP)', 568);
INSERT INTO public.empresa VALUES (1560, true, 1, '2023-07-02 12:35:23.161373', NULL, NULL, false, 'FACULDADE DO PLANALTO CENTRAL (FAPLAC)', 539);
INSERT INTO public.empresa VALUES (1561, true, 1, '2023-07-02 12:35:23.162784', NULL, NULL, false, 'FACULDADE DO RECIFE (FAREC)', 60);
INSERT INTO public.empresa VALUES (1562, true, 1, '2023-07-02 12:35:23.164294', NULL, NULL, false, 'FACULDADE DO RIO DE JANEIRO', 12);
INSERT INTO public.empresa VALUES (1563, true, 1, '2023-07-02 12:35:23.165554', NULL, NULL, false, 'FACULDADE DOS CARAJÁS', 46);
INSERT INTO public.empresa VALUES (1564, true, 1, '2023-07-02 12:35:23.1747', NULL, NULL, false, 'FACULDADE DOS CERRADOS PIAUIENSES (FCP)', 569);
INSERT INTO public.empresa VALUES (1565, true, 1, '2023-07-02 12:35:23.176166', NULL, NULL, false, 'FACULDADE DO SERIDÓ (FAS)', 570);
INSERT INTO public.empresa VALUES (1566, true, 1, '2023-07-02 12:35:23.177525', NULL, NULL, false, 'FACULDADE DO SERTÃO BAIANO (FASBE)', 571);
INSERT INTO public.empresa VALUES (1567, true, 1, '2023-07-02 12:35:23.179079', NULL, NULL, false, 'FACULDADE DO SERTÃO CENTRAL (FASEC)', 572);
INSERT INTO public.empresa VALUES (1568, true, 1, '2023-07-02 12:35:23.180581', NULL, NULL, false, 'FACULDADE DO SERTÃO CENTRAL EAD (FASEC EAD)', 572);
INSERT INTO public.empresa VALUES (1569, true, 1, '2023-07-02 12:35:23.182122', NULL, NULL, false, 'FACULDADE DO SERTÃO DO ARARIPE (FASA)', 573);
INSERT INTO public.empresa VALUES (1570, true, 1, '2023-07-02 12:35:23.189316', NULL, NULL, false, 'FACULDADE DO SERTÃO DO PAJEÚ (FASP)', 574);
INSERT INTO public.empresa VALUES (1571, true, 1, '2023-07-02 12:35:23.190783', NULL, NULL, false, 'FACULDADE DO SERTÃO DO SÃO FRANCISCO (FASF)', 575);
INSERT INTO public.empresa VALUES (1572, true, 1, '2023-07-02 12:35:23.192104', NULL, NULL, false, 'FACULDADE DOS GÊNIOS (FAGENIUS)', 268);
INSERT INTO public.empresa VALUES (1573, true, 1, '2023-07-02 12:35:23.193438', NULL, NULL, false, 'FACULDADE DOS PALMARES (FAP)', 428);
INSERT INTO public.empresa VALUES (1574, true, 1, '2023-07-02 12:35:23.194792', NULL, NULL, false, 'FACULDADE DO SUDESTE GOIANO (FASUG)', 576);
INSERT INTO public.empresa VALUES (1575, true, 1, '2023-07-02 12:35:23.196296', NULL, NULL, false, 'FACULDADE DO SUL DA BAHIA (FASB)', 295);
INSERT INTO public.empresa VALUES (1576, true, 1, '2023-07-02 12:35:23.205504', NULL, NULL, false, 'FACULDADE DO TAPAJÓS (FAT)', 475);
INSERT INTO public.empresa VALUES (1577, true, 1, '2023-07-02 12:35:23.207013', NULL, NULL, false, 'FACULDADE DO TRABALHO (FATRA)', 134);
INSERT INTO public.empresa VALUES (1578, true, 1, '2023-07-02 12:35:23.208564', NULL, NULL, false, 'FACULDADE DOURADO (FD)', 8);
INSERT INTO public.empresa VALUES (1579, true, 1, '2023-07-02 12:35:23.211264', NULL, NULL, false, 'FACULDADE DOUTOR FRANCISCO MAEDA (FAFRAM)', 462);
INSERT INTO public.empresa VALUES (1580, true, 1, '2023-07-02 12:35:23.212621', NULL, NULL, false, 'FACULDADE DO VALE (FAV)', 452);
INSERT INTO public.empresa VALUES (1581, true, 1, '2023-07-02 12:35:23.213753', NULL, NULL, false, 'FACULDADE DO VALE DO CAJU (FVC)', 451);
INSERT INTO public.empresa VALUES (1582, true, 1, '2023-07-02 12:35:23.220982', NULL, NULL, false, 'FACULDADE DO VALE DO ITAPECURÚ (FAI)', 97);
INSERT INTO public.empresa VALUES (1583, true, 1, '2023-07-02 12:35:23.222451', NULL, NULL, false, 'FACULDADE DO VALE DO JAGUARIBE MOSSORÓ (FVJ MOSSORÓ)', 323);
INSERT INTO public.empresa VALUES (1584, true, 1, '2023-07-02 12:35:23.223771', NULL, NULL, false, 'FACULDADE DO VALE DO RIO ARINOS (AJES)', 577);
INSERT INTO public.empresa VALUES (1585, true, 1, '2023-07-02 12:35:23.225136', NULL, NULL, false, 'FACULDADE DO VALE ELVIRA DAYRELL - FAVED (FAVED)', 578);
INSERT INTO public.empresa VALUES (1586, true, 1, '2023-07-02 12:35:23.226448', NULL, NULL, false, 'FACULDADE DUARTE COELHO (FDC)', 579);
INSERT INTO public.empresa VALUES (1587, true, 1, '2023-07-02 12:35:23.227857', NULL, NULL, false, 'FACULDADE DYNAMUS DE CAMPINAS (FADYC)', 177);
INSERT INTO public.empresa VALUES (1588, true, 1, '2023-07-02 12:35:23.237049', NULL, NULL, false, 'FACULDADE EASE BRASIL (EASE)', 45);
INSERT INTO public.empresa VALUES (1589, true, 1, '2023-07-02 12:35:23.238594', NULL, NULL, false, 'FACULDADE EDUCABRASIL NOEL DE MELLO', 580);
INSERT INTO public.empresa VALUES (1590, true, 1, '2023-07-02 12:35:23.2399', NULL, NULL, false, 'FACULDADE EDUCACIONAL ARAUCÁRIA (FACEAR)', 56);
INSERT INTO public.empresa VALUES (1591, true, 1, '2023-07-02 12:35:23.241261', NULL, NULL, false, 'FACULDADE EDUCACIONAL DE COLOMBO (FAEC)', 582);
INSERT INTO public.empresa VALUES (1592, true, 1, '2023-07-02 12:35:23.242754', NULL, NULL, false, 'FACULDADE EDUCACIONAL DE MEDIANEIRA (UDC MEDIANEIRA)', 583);
INSERT INTO public.empresa VALUES (1593, true, 1, '2023-07-02 12:35:23.244338', NULL, NULL, false, 'FACULDADE EDUCACIONAL JURÍDICA E GERENCIAL DE OLIVEIRA (FEJUGO)', 584);
INSERT INTO public.empresa VALUES (1594, true, 1, '2023-07-02 12:35:23.251472', NULL, NULL, false, 'FACULDADE EDUCAMAIS (EDUCA+)', 8);
INSERT INTO public.empresa VALUES (1595, true, 1, '2023-07-02 12:35:23.253229', NULL, NULL, false, 'FACULDADE EDUCAREMT (EDUCARE)', 203);
INSERT INTO public.empresa VALUES (1596, true, 1, '2023-07-02 12:35:23.254716', NULL, NULL, false, 'FACULDADE EDUFOR (EDUFOR)', 141);
INSERT INTO public.empresa VALUES (1597, true, 1, '2023-07-02 12:35:23.256032', NULL, NULL, false, 'FACULDADE EDUFOR DE SALVADOR (EDUFOR)', 116);
INSERT INTO public.empresa VALUES (1598, true, 1, '2023-07-02 12:35:23.257424', NULL, NULL, false, 'FACULDADE EDUVALE DE AVARÉ (EDUVALE)', 195);
INSERT INTO public.empresa VALUES (1599, true, 1, '2023-07-02 12:35:23.258686', NULL, NULL, false, 'FACULDADE EFICAZ (EFICAZ)', 76);
INSERT INTO public.empresa VALUES (1600, true, 1, '2023-07-02 12:35:23.268014', NULL, NULL, false, 'FACULDADE EGAS MONIZ (FEM)', 60);
INSERT INTO public.empresa VALUES (1601, true, 1, '2023-07-02 12:35:23.269648', NULL, NULL, false, 'FACULDADE EINSTEIN', 116);
INSERT INTO public.empresa VALUES (1602, true, 1, '2023-07-02 12:35:23.271127', NULL, NULL, false, 'FACULDADE ELO (FAELO)', 60);
INSERT INTO public.empresa VALUES (1603, true, 1, '2023-07-02 12:35:23.272626', NULL, NULL, false, 'FACULDADE EMBU DAS ARTES (FAEM)', 585);
INSERT INTO public.empresa VALUES (1604, true, 1, '2023-07-02 12:35:23.274119', NULL, NULL, false, 'FACULDADE EMPRESARIAL DE CHAPECÓ (FAEM)', 406);
INSERT INTO public.empresa VALUES (1605, true, 1, '2023-07-02 12:35:23.275535', NULL, NULL, false, 'FACULDADE ENAU (FACENAU)', 502);
INSERT INTO public.empresa VALUES (1606, true, 1, '2023-07-02 12:35:23.280347', NULL, NULL, false, 'FACULDADE ENDEX (ENDEX)', 230);
INSERT INTO public.empresa VALUES (1607, true, 1, '2023-07-02 12:35:23.282203', NULL, NULL, false, 'FACULDADE ENERGIA', 3);
INSERT INTO public.empresa VALUES (1608, true, 1, '2023-07-02 12:35:23.283805', NULL, NULL, false, 'FACULDADE ENGENHEIRO SALVADOR ARENA (FESA)', 82);
INSERT INTO public.empresa VALUES (1609, true, 1, '2023-07-02 12:35:23.285332', NULL, NULL, false, 'FACULDADE ENSIN.E (ENSIN.E)', 38);
INSERT INTO public.empresa VALUES (1610, true, 1, '2023-07-02 12:35:23.286791', NULL, NULL, false, 'FACULDADE ERICH FROMM (FACEF)', 5);
INSERT INTO public.empresa VALUES (1611, true, 1, '2023-07-02 12:35:23.28835', NULL, NULL, false, 'FACULDADE ESAMC CAMPINAS (ESAMC)', 177);
INSERT INTO public.empresa VALUES (1612, true, 1, '2023-07-02 12:35:23.297635', NULL, NULL, false, 'FACULDADE ESAMC FRANCA (ESAMC FRANCA)', 179);
INSERT INTO public.empresa VALUES (1613, true, 1, '2023-07-02 12:35:23.299195', NULL, NULL, false, 'FACULDADE ESAMC GOIÂNIA (ESAMC GOIÂNIA)', 42);
INSERT INTO public.empresa VALUES (1614, true, 1, '2023-07-02 12:35:23.300508', NULL, NULL, false, 'FACULDADE ESAMC JUNDIAÍ (ESAMC)', 182);
INSERT INTO public.empresa VALUES (1615, true, 1, '2023-07-02 12:35:23.301855', NULL, NULL, false, 'FACULDADE ESAMC SANTOS (ESAMC)', 171);
INSERT INTO public.empresa VALUES (1616, true, 1, '2023-07-02 12:35:23.303173', NULL, NULL, false, 'FACULDADE ESAMC SÃO PAULO - ESAMC (ESAMC)', 8);
INSERT INTO public.empresa VALUES (1617, true, 1, '2023-07-02 12:35:23.304321', NULL, NULL, false, 'FACULDADE ESAMC SOROCABA (ESAMC)', 146);
INSERT INTO public.empresa VALUES (1618, true, 1, '2023-07-02 12:35:23.308879', NULL, NULL, false, 'FACULDADE ESAMC UBERLÂNDIA (ESAMC)', 134);
INSERT INTO public.empresa VALUES (1619, true, 1, '2023-07-02 12:35:23.310237', NULL, NULL, false, 'FACULDADE ESCOLA DE AYURVEDA (FAESDA)', 149);
INSERT INTO public.empresa VALUES (1620, true, 1, '2023-07-02 12:35:23.31176', NULL, NULL, false, 'FACULDADE ESCOLA DE NEGÓCIOS EXCELLENCE (FAENE)', 141);
INSERT INTO public.empresa VALUES (1621, true, 1, '2023-07-02 12:35:23.313345', NULL, NULL, false, 'FACULDADE ESCOLA PAULISTA DE DIREITO (FACEPD)', 8);
INSERT INTO public.empresa VALUES (1622, true, 1, '2023-07-02 12:35:23.314945', NULL, NULL, false, 'FACULDADE ESCOLA POLITÉCNICA DE INOVAÇÃO E CONHECIMENTO APLICADO (ÉPICA)', 193);
INSERT INTO public.empresa VALUES (1623, true, 1, '2023-07-02 12:35:23.316499', NULL, NULL, false, 'FACULDADE ESCOLA SOBRAL DE OLIVEIRA (FAESDO)', 586);
INSERT INTO public.empresa VALUES (1624, true, 1, '2023-07-02 12:35:23.325632', NULL, NULL, false, 'FACULDADE ESPECIALIZADA NA ÁREA DE SAÚDE DO RIO GRANDE DO SUL (FASURGS)', 282);
INSERT INTO public.empresa VALUES (1625, true, 1, '2023-07-02 12:35:23.327172', NULL, NULL, false, 'FACULDADE ÉSPER (ÉSPER)', 42);
INSERT INTO public.empresa VALUES (1626, true, 1, '2023-07-02 12:35:23.328516', NULL, NULL, false, 'FACULDADE ESPÍRITO SANTENSE (UNICAPE)', 389);
INSERT INTO public.empresa VALUES (1627, true, 1, '2023-07-02 12:35:23.329931', NULL, NULL, false, 'FACULDADE ESPÍRITO SANTENSE DE CIÊNCIAS JURÍDICAS (PIO XII - DIR)', 389);
INSERT INTO public.empresa VALUES (1628, true, 1, '2023-07-02 12:35:23.331381', NULL, NULL, false, 'FACULDADE ESPÍRITO SANTO (FAES)', 587);
INSERT INTO public.empresa VALUES (1629, true, 1, '2023-07-02 12:35:23.332937', NULL, NULL, false, 'FACULDADE ESSA EDUCACAO PROFISSIONAL (UNIESSA)', 8);
INSERT INTO public.empresa VALUES (1630, true, 1, '2023-07-02 12:35:23.337378', NULL, NULL, false, 'FACULDADE ESTÁCIO DA PARAÍBA (ESTACIO PARAIBA)', 107);
INSERT INTO public.empresa VALUES (1631, true, 1, '2023-07-02 12:35:23.338831', NULL, NULL, false, 'FACULDADE ESTÁCIO DE ALAGOAS - ESTÁCIO FAL (ESTÁCIO FAL)', 73);
INSERT INTO public.empresa VALUES (1632, true, 1, '2023-07-02 12:35:23.34017', NULL, NULL, false, 'FACULDADE ESTÁCIO DE ALAGOINHAS', 213);
INSERT INTO public.empresa VALUES (1633, true, 1, '2023-07-02 12:35:23.341524', NULL, NULL, false, 'FACULDADE ESTÁCIO DE ANANINDEUA', 232);
INSERT INTO public.empresa VALUES (1707, true, 1, '2023-07-02 12:35:23.505189', NULL, NULL, false, 'FACULDADE FERNÃO DIAS (FAFE)', 158);
INSERT INTO public.empresa VALUES (1634, true, 1, '2023-07-02 12:35:23.342856', NULL, NULL, false, 'FACULDADE ESTÁCIO DE BELÉM - ESTÁCIO BELÉM (ESTÁCIO BELÉM)', 79);
INSERT INTO public.empresa VALUES (1635, true, 1, '2023-07-02 12:35:23.343994', NULL, NULL, false, 'FACULDADE ESTÁCIO DE CANINDÉ (ESTÁCIO CANINDÉ)', 588);
INSERT INTO public.empresa VALUES (1636, true, 1, '2023-07-02 12:35:23.353185', NULL, NULL, false, 'FACULDADE ESTÁCIO DE CARAPICUÍBA (ESTÁCIO CARAPICUÍBA)', 519);
INSERT INTO public.empresa VALUES (1637, true, 1, '2023-07-02 12:35:23.354716', NULL, NULL, false, 'FACULDADE ESTÁCIO DE CASTANHAL (ESTÁCIO CASTANHAL)', 484);
INSERT INTO public.empresa VALUES (1638, true, 1, '2023-07-02 12:35:23.356052', NULL, NULL, false, 'FACULDADE ESTÁCIO DE COTIA (ESTACIO COTIA)', 520);
INSERT INTO public.empresa VALUES (1639, true, 1, '2023-07-02 12:35:23.357384', NULL, NULL, false, 'FACULDADE ESTÁCIO DE CURITIBA (ESTÁCIO CURITIBA)', 56);
INSERT INTO public.empresa VALUES (1640, true, 1, '2023-07-02 12:35:23.358717', NULL, NULL, false, 'FACULDADE ESTÁCIO DE FEIRA DE SANTANA (ESTÁCIO FEIRA DE SAN)', 99);
INSERT INTO public.empresa VALUES (1641, true, 1, '2023-07-02 12:35:23.360131', NULL, NULL, false, 'FACULDADE ESTÁCIO DE FLORIANÓPOLIS - ESTÁCIO FLORIANÓPOLIS', 3);
INSERT INTO public.empresa VALUES (1642, true, 1, '2023-07-02 12:35:23.364745', NULL, NULL, false, 'FACULDADE ESTÁCIO DE JARAGUÁ DO SUL (ESTÁCIO JARAGUÁ)', 31);
INSERT INTO public.empresa VALUES (1643, true, 1, '2023-07-02 12:35:23.366208', NULL, NULL, false, 'FACULDADE ESTÁCIO DE JUAZEIRO (ESTÁCIOJUAZEIRO)', 533);
INSERT INTO public.empresa VALUES (1644, true, 1, '2023-07-02 12:35:23.367683', NULL, NULL, false, 'FACULDADE ESTÁCIO DE NATAL (ESTACIO NATAL)', 130);
INSERT INTO public.empresa VALUES (1645, true, 1, '2023-07-02 12:35:23.369007', NULL, NULL, false, 'FACULDADE ESTÁCIO DE PIMENTA BUENO (ESTÁCIO FAP)', 589);
INSERT INTO public.empresa VALUES (1646, true, 1, '2023-07-02 12:35:23.370328', NULL, NULL, false, 'FACULDADE ESTÁCIO DE RIO PRETO (ESTÁCIO RIO PRETO)', 114);
INSERT INTO public.empresa VALUES (1647, true, 1, '2023-07-02 12:35:23.371726', NULL, NULL, false, 'FACULDADE ESTÁCIO DE SÁ DE OURINHOS (FAESO)', 89);
INSERT INTO public.empresa VALUES (1648, true, 1, '2023-07-02 12:35:23.38108', NULL, NULL, false, 'FACULDADE ESTÁCIO DE SÁ DE VILA VELHA (FESVV)', 226);
INSERT INTO public.empresa VALUES (1649, true, 1, '2023-07-02 12:35:23.383023', NULL, NULL, false, 'FACULDADE ESTÁCIO DE SÁ DE VITÓRIA (FESV)', 25);
INSERT INTO public.empresa VALUES (1650, true, 1, '2023-07-02 12:35:23.384517', NULL, NULL, false, 'FACULDADE ESTÁCIO DE SANTO ANDRÉ (ESTÁCIO SANTO ANDRÉ)', 47);
INSERT INTO public.empresa VALUES (1651, true, 1, '2023-07-02 12:35:23.385996', NULL, NULL, false, 'FACULDADE ESTÁCIO DE TERESINA (ESTÁCIO TERESINA)', 27);
INSERT INTO public.empresa VALUES (1652, true, 1, '2023-07-02 12:35:23.387495', NULL, NULL, false, 'FACULDADE ESTÁCIO DO AMAPÁ - ESTÁCIO AMAPÁ (ESTÁCIO AMAPÁ)', 26);
INSERT INTO public.empresa VALUES (1653, true, 1, '2023-07-02 12:35:23.388608', NULL, NULL, false, 'FACULDADE ESTÁCIO DO AMAZONAS - ESTÁCIO AMAZONAS (ESTÁCIO AMAZONAS)', 75);
INSERT INTO public.empresa VALUES (1654, true, 1, '2023-07-02 12:35:23.393181', NULL, NULL, false, 'FACULDADE ESTÁCIO DO PANTANAL (ESTÁCIO FAPAN)', 590);
INSERT INTO public.empresa VALUES (1655, true, 1, '2023-07-02 12:35:23.394508', NULL, NULL, false, 'FACULDADE ESTÁCIO DO PARÁ - ESTÁCIO FAP (ESTÁCIO FAP)', 79);
INSERT INTO public.empresa VALUES (1656, true, 1, '2023-07-02 12:35:23.395898', NULL, NULL, false, 'FACULDADE ESTÁCIO DO RIO GRANDE DO SUL - ESTÁCIO FARGS (ESTÁCIO FARGS)', 149);
INSERT INTO public.empresa VALUES (1657, true, 1, '2023-07-02 12:35:23.397202', NULL, NULL, false, 'FACULDADE ESTÁCIO MACAPÁ - ESTÁCIO MACAPÁ (ESTÁCIO MACAPÁ)', 26);
INSERT INTO public.empresa VALUES (1658, true, 1, '2023-07-02 12:35:23.39856', NULL, NULL, false, 'FACULDADE ESTÁCIO SÃO PAULO DE RONDÔNIA (ESTÁCIO FSP)', 503);
INSERT INTO public.empresa VALUES (1659, true, 1, '2023-07-02 12:35:23.400079', NULL, NULL, false, 'FACULDADE ESTRATEGO (ESTRATEGO)', 79);
INSERT INTO public.empresa VALUES (1660, true, 1, '2023-07-02 12:35:23.409138', NULL, NULL, false, 'FACULDADE EUGÊNIO GOMES (FEG)', 591);
INSERT INTO public.empresa VALUES (1661, true, 1, '2023-07-02 12:35:23.410405', NULL, NULL, false, 'FACULDADE EUROPÉIA DE TECNOLOGIA E CIÊNCIAS HUMANAS - EUROTECH (EUROTECH)', 132);
INSERT INTO public.empresa VALUES (1662, true, 1, '2023-07-02 12:35:23.411722', NULL, NULL, false, 'FACULDADE EUROPÉIA DE VITÓRIA (FAEV)', 389);
INSERT INTO public.empresa VALUES (1663, true, 1, '2023-07-02 12:35:23.413141', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE CERES (FACER)', 592);
INSERT INTO public.empresa VALUES (1664, true, 1, '2023-07-02 12:35:23.414597', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE GOIANÉSIA (FACEG)', 593);
INSERT INTO public.empresa VALUES (1665, true, 1, '2023-07-02 12:35:23.416138', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE JARAGUÁ (FEJA)', 594);
INSERT INTO public.empresa VALUES (1666, true, 1, '2023-07-02 12:35:23.420693', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE RUBIATABA (FER)', 595);
INSERT INTO public.empresa VALUES (1667, true, 1, '2023-07-02 12:35:23.422015', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE SALVADOR (FACESA)', 116);
INSERT INTO public.empresa VALUES (1668, true, 1, '2023-07-02 12:35:23.423357', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE SÃO PAULO', 8);
INSERT INTO public.empresa VALUES (1669, true, 1, '2023-07-02 12:35:23.424698', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE SENADOR CANEDO (FESCAN)', 538);
INSERT INTO public.empresa VALUES (1670, true, 1, '2023-07-02 12:35:23.426035', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE TECNOLOGIA, CIÊNCIAS E BIOTECNOLOGIA DA CGADB (FAECAD)', 12);
INSERT INTO public.empresa VALUES (1671, true, 1, '2023-07-02 12:35:23.427172', NULL, NULL, false, 'FACULDADE EVANGÉLICA DO MEIO NORTE (FAEME)', 596);
INSERT INTO public.empresa VALUES (1672, true, 1, '2023-07-02 12:35:23.436371', NULL, NULL, false, 'FACULDADE EVANGÉLICA MACKENZIE DO PARANÁ (FEMPAR)', 56);
INSERT INTO public.empresa VALUES (1673, true, 1, '2023-07-02 12:35:23.443186', NULL, NULL, false, 'FACULDADE EVANGÉLICA RAÍZES (RAÍZES)', 264);
INSERT INTO public.empresa VALUES (1674, true, 1, '2023-07-02 12:35:23.456599', NULL, NULL, false, 'FACULDADE EVOLUÇÃO (FAEV)', 8);
INSERT INTO public.empresa VALUES (1675, true, 1, '2023-07-02 12:35:23.458312', NULL, NULL, false, 'FACULDADE EVOLUÇÃO ALTO OESTE POTIGUAR (FACEP)', 597);
INSERT INTO public.empresa VALUES (1676, true, 1, '2023-07-02 12:35:23.459648', NULL, NULL, false, 'FACULDADE EVOLUIR (FAEV)', 45);
INSERT INTO public.empresa VALUES (1677, true, 1, '2023-07-02 12:35:23.460998', NULL, NULL, false, 'FACULDADE EXATA EDUCACIONAL (FEE)', 56);
INSERT INTO public.empresa VALUES (1678, true, 1, '2023-07-02 12:35:23.462353', NULL, NULL, false, 'FACULDADE FABAD (FABAD)', 162);
INSERT INTO public.empresa VALUES (1679, true, 1, '2023-07-02 12:35:23.46385', NULL, NULL, false, 'FACULDADE FACCAT (FACCAT)', 354);
INSERT INTO public.empresa VALUES (1680, true, 1, '2023-07-02 12:35:23.465217', NULL, NULL, false, 'FACULDADE FACIENCIA (FACIENCIA)', 56);
INSERT INTO public.empresa VALUES (1681, true, 1, '2023-07-02 12:35:23.466688', NULL, NULL, false, 'FACULDADE FACMIL', 114);
INSERT INTO public.empresa VALUES (1682, true, 1, '2023-07-02 12:35:23.468041', NULL, NULL, false, 'FACULDADE FACTUM (FACTUM)', 149);
INSERT INTO public.empresa VALUES (1683, true, 1, '2023-07-02 12:35:23.46936', NULL, NULL, false, 'FACULDADE FACUMINAS DE PÓS-GRADUAÇÃO EAD (FACUMINAS EAD)', 8);
INSERT INTO public.empresa VALUES (1684, true, 1, '2023-07-02 12:35:23.470794', NULL, NULL, false, 'FACULDADE FADAM (FADAM)', 45);
INSERT INTO public.empresa VALUES (1685, true, 1, '2023-07-02 12:35:23.472291', NULL, NULL, false, 'FACULDADE FADAM DE MARACANAÚ (FADAM)', 45);
INSERT INTO public.empresa VALUES (1686, true, 1, '2023-07-02 12:35:23.47375', NULL, NULL, false, 'FACULDADE FAIPE', 203);
INSERT INTO public.empresa VALUES (1687, true, 1, '2023-07-02 12:35:23.475277', NULL, NULL, false, 'FACULDADE FAMART', 598);
INSERT INTO public.empresa VALUES (1688, true, 1, '2023-07-02 12:35:23.476657', NULL, NULL, false, 'FACULDADE FAMEP - UNIDADE PARAMBU - CE (FAMEP)', 599);
INSERT INTO public.empresa VALUES (1689, true, 1, '2023-07-02 12:35:23.477925', NULL, NULL, false, 'FACULDADE FAMERCOSUL (FSUL)', 149);
INSERT INTO public.empresa VALUES (1690, true, 1, '2023-07-02 12:35:23.479704', NULL, NULL, false, 'FACULDADE FANORPI BANDEIRANTES (FANORPI)', 600);
INSERT INTO public.empresa VALUES (1691, true, 1, '2023-07-02 12:35:23.481532', NULL, NULL, false, 'FACULDADE FAPAF (FAPAF)', 601);
INSERT INTO public.empresa VALUES (1692, true, 1, '2023-07-02 12:35:23.483323', NULL, NULL, false, 'FACULDADE FARUS (FARUS)', 488);
INSERT INTO public.empresa VALUES (1693, true, 1, '2023-07-02 12:35:23.485078', NULL, NULL, false, 'FACULDADE FASIPE CUIABÁ (FFC)', 203);
INSERT INTO public.empresa VALUES (1694, true, 1, '2023-07-02 12:35:23.486544', NULL, NULL, false, 'FACULDADE FASIPE DE PRIMAVERA (FFP)', 285);
INSERT INTO public.empresa VALUES (1695, true, 1, '2023-07-02 12:35:23.48805', NULL, NULL, false, 'FACULDADE FASIPE DE RONDONÓPOLIS (FFR)', 287);
INSERT INTO public.empresa VALUES (1696, true, 1, '2023-07-02 12:35:23.48956', NULL, NULL, false, 'FACULDADE FASIPE DE SORRISO (FFS)', 292);
INSERT INTO public.empresa VALUES (1697, true, 1, '2023-07-02 12:35:23.491023', NULL, NULL, false, 'FACULDADE FASIPE DF (FACDF)', 5);
INSERT INTO public.empresa VALUES (1698, true, 1, '2023-07-02 12:35:23.492542', NULL, NULL, false, 'FACULDADE FASIPE MATO GROSSO (FFMT)', 203);
INSERT INTO public.empresa VALUES (1699, true, 1, '2023-07-02 12:35:23.494038', NULL, NULL, false, 'FACULDADE FASIPE PANTANAL (FASIPE)', 203);
INSERT INTO public.empresa VALUES (1700, true, 1, '2023-07-02 12:35:23.495431', NULL, NULL, false, 'FACULDADE FASUP (FASUP)', 175);
INSERT INTO public.empresa VALUES (1701, true, 1, '2023-07-02 12:35:23.496945', NULL, NULL, false, 'FACULDADE FATIFAJAR JAGUARIAÍVA (FAJAR)', 602);
INSERT INTO public.empresa VALUES (1702, true, 1, '2023-07-02 12:35:23.498437', NULL, NULL, false, 'FACULDADE FAVENI GUARULHOS (FAVENI - GUARULHOS)', 100);
INSERT INTO public.empresa VALUES (1703, true, 1, '2023-07-02 12:35:23.499923', NULL, NULL, false, 'FACULDADE FAVOO COOP', 355);
INSERT INTO public.empresa VALUES (1704, true, 1, '2023-07-02 12:35:23.501431', NULL, NULL, false, 'FACULDADE FECOMERCIO RORAIMA (FACORR)', 138);
INSERT INTO public.empresa VALUES (1705, true, 1, '2023-07-02 12:35:23.502744', NULL, NULL, false, 'FACULDADE FEITEP (FEITEP)', 76);
INSERT INTO public.empresa VALUES (1706, true, 1, '2023-07-02 12:35:23.504095', NULL, NULL, false, 'FACULDADE FERNANDA BICCHIERI', 1);
INSERT INTO public.empresa VALUES (1708, true, 1, '2023-07-02 12:35:23.506497', NULL, NULL, false, 'FACULDADE FIA DE ADMINISTRAÇÃO E NEGÓCIOS (FFIA)', 8);
INSERT INTO public.empresa VALUES (1709, true, 1, '2023-07-02 12:35:23.507838', NULL, NULL, false, 'FACULDADE FIDELIS (FF)', 56);
INSERT INTO public.empresa VALUES (1710, true, 1, '2023-07-02 12:35:23.509172', NULL, NULL, false, 'FACULDADE FIGUEIREDO COSTA - FIC', 73);
INSERT INTO public.empresa VALUES (1711, true, 1, '2023-07-02 12:35:23.510525', NULL, NULL, false, 'FACULDADE FILADELFIA DE TECNOLOGIA (FAFILTEC)', 345);
INSERT INTO public.empresa VALUES (1712, true, 1, '2023-07-02 12:35:23.512005', NULL, NULL, false, 'FACULDADE FILOS', 603);
INSERT INTO public.empresa VALUES (1713, true, 1, '2023-07-02 12:35:23.513604', NULL, NULL, false, 'FACULDADE FINACI (FINACI)', 8);
INSERT INTO public.empresa VALUES (1714, true, 1, '2023-07-02 12:35:23.515231', NULL, NULL, false, 'FACULDADE FINOM DE PATOS DE MINAS (FINOM)', 112);
INSERT INTO public.empresa VALUES (1715, true, 1, '2023-07-02 12:35:23.516824', NULL, NULL, false, 'FACULDADE FIPECAFI (FIPECAFI)', 8);
INSERT INTO public.empresa VALUES (1716, true, 1, '2023-07-02 12:35:23.51821', NULL, NULL, false, 'FACULDADE FISEPE (FISEPE)', 282);
INSERT INTO public.empresa VALUES (1717, true, 1, '2023-07-02 12:35:23.519527', NULL, NULL, false, 'FACULDADE FLAMINGO', 8);
INSERT INTO public.empresa VALUES (1718, true, 1, '2023-07-02 12:35:23.520746', NULL, NULL, false, 'FACULDADE FLEMING CERQUILHO (FAC CERQUILHO)', 604);
INSERT INTO public.empresa VALUES (1719, true, 1, '2023-07-02 12:35:23.522099', NULL, NULL, false, 'FACULDADE FLEMING DE OSASCO (A. FLEMING)', 158);
INSERT INTO public.empresa VALUES (1720, true, 1, '2023-07-02 12:35:23.523621', NULL, NULL, false, 'FACULDADE FOCUS (FOCUS)', 54);
INSERT INTO public.empresa VALUES (1721, true, 1, '2023-07-02 12:35:23.524946', NULL, NULL, false, 'FACULDADE FOZ DO IGUAÇU (FAFIG)', 124);
INSERT INTO public.empresa VALUES (1722, true, 1, '2023-07-02 12:35:23.526278', NULL, NULL, false, 'FACULDADE FRACTAL (FRACTAL)', 42);
INSERT INTO public.empresa VALUES (1723, true, 1, '2023-07-02 12:35:23.527657', NULL, NULL, false, 'FACULDADE FRAGA DE INTEGRAÇÃO DA CULTURA EDUCAÇÃO E PESQUISA (FICEPE)', 605);
INSERT INTO public.empresa VALUES (1724, true, 1, '2023-07-02 12:35:23.529203', NULL, NULL, false, 'FACULDADE FRASSINETTI DO RECIFE (FAFIRE)', 60);
INSERT INTO public.empresa VALUES (1725, true, 1, '2023-07-02 12:35:23.530394', NULL, NULL, false, 'FACULDADE FREIRE DE ENSINO (FFE)', 540);
INSERT INTO public.empresa VALUES (1726, true, 1, '2023-07-02 12:35:23.531801', NULL, NULL, false, 'FACULDADE FUCAPE (FUCAPE)', 25);
INSERT INTO public.empresa VALUES (1727, true, 1, '2023-07-02 12:35:23.533221', NULL, NULL, false, 'FACULDADE FUNORTE DE JANAÚBA', 407);
INSERT INTO public.empresa VALUES (1728, true, 1, '2023-07-02 12:35:23.534539', NULL, NULL, false, 'FACULDADE FUNORTE DE JANUÁRIA', 606);
INSERT INTO public.empresa VALUES (1729, true, 1, '2023-07-02 12:35:23.535869', NULL, NULL, false, 'FACULDADE FUTURA', 10);
INSERT INTO public.empresa VALUES (1730, true, 1, '2023-07-02 12:35:23.537208', NULL, NULL, false, 'FACULDADE G8 (FG8)', 8);
INSERT INTO public.empresa VALUES (1731, true, 1, '2023-07-02 12:35:23.538559', NULL, NULL, false, 'FACULDADE GALILEU (FG)', 383);
INSERT INTO public.empresa VALUES (1732, true, 1, '2023-07-02 12:35:23.539884', NULL, NULL, false, 'FACULDADE GARÇA BRANCA PANTANAL (FGB)', 203);
INSERT INTO public.empresa VALUES (1733, true, 1, '2023-07-02 12:35:23.541225', NULL, NULL, false, 'FACULDADE GENNARI E PEARTREE (FGP)', 607);
INSERT INTO public.empresa VALUES (1734, true, 1, '2023-07-02 12:35:23.542571', NULL, NULL, false, 'FACULDADE GEORGINA (FAGEO)', 608);
INSERT INTO public.empresa VALUES (1735, true, 1, '2023-07-02 12:35:23.543876', NULL, NULL, false, 'FACULDADE GIANNA BERETTA', 141);
INSERT INTO public.empresa VALUES (1736, true, 1, '2023-07-02 12:35:23.545286', NULL, NULL, false, 'FACULDADE GIL GAL (GILGAL)', 609);
INSERT INTO public.empresa VALUES (1737, true, 1, '2023-07-02 12:35:23.546808', NULL, NULL, false, 'FACULDADE GRAN TIETÊ (FGT)', 531);
INSERT INTO public.empresa VALUES (1738, true, 1, '2023-07-02 12:35:23.548299', NULL, NULL, false, 'FACULDADE GRAU S ENSINO SUPERIOR (GRAU)', 60);
INSERT INTO public.empresa VALUES (1739, true, 1, '2023-07-02 12:35:23.549763', NULL, NULL, false, 'FACULDADE GUARAÍ (FAG)', 610);
INSERT INTO public.empresa VALUES (1740, true, 1, '2023-07-02 12:35:23.551083', NULL, NULL, false, 'FACULDADE GUARAPUAVA (FG)', 64);
INSERT INTO public.empresa VALUES (1741, true, 1, '2023-07-02 12:35:23.552419', NULL, NULL, false, 'FACULDADE GUERRA (FAG)', 5);
INSERT INTO public.empresa VALUES (1742, true, 1, '2023-07-02 12:35:23.553746', NULL, NULL, false, 'FACULDADE GUILHERME GUIMBALA (FGG)', 68);
INSERT INTO public.empresa VALUES (1743, true, 1, '2023-07-02 12:35:23.55484', NULL, NULL, false, 'FACULDADE HÉLIO ROCHA (FHR)', 116);
INSERT INTO public.empresa VALUES (1744, true, 1, '2023-07-02 12:35:23.556172', NULL, NULL, false, 'FACULDADE HERRERO (FATEC)', 56);
INSERT INTO public.empresa VALUES (1745, true, 1, '2023-07-02 12:35:23.557518', NULL, NULL, false, 'FACULDADE HOLÍSTICA (FAHOL)', 56);
INSERT INTO public.empresa VALUES (1746, true, 1, '2023-07-02 12:35:23.558865', NULL, NULL, false, 'FACULDADE HONPAR', 611);
INSERT INTO public.empresa VALUES (1747, true, 1, '2023-07-02 12:35:23.560186', NULL, NULL, false, 'FACULDADE HORIZONTE (FACHORIZONTE)', 5);
INSERT INTO public.empresa VALUES (1748, true, 1, '2023-07-02 12:35:23.561537', NULL, NULL, false, 'FACULDADE HORIZONTINA (FAHOR)', 612);
INSERT INTO public.empresa VALUES (1749, true, 1, '2023-07-02 12:35:23.562892', NULL, NULL, false, 'FACULDADE HOSPITAL SÃO PAULO DE MURIAÉ (FAMEHSP)', 154);
INSERT INTO public.empresa VALUES (1750, true, 1, '2023-07-02 12:35:23.564235', NULL, NULL, false, 'FACULDADE IBAM', 12);
INSERT INTO public.empresa VALUES (1751, true, 1, '2023-07-02 12:35:23.565564', NULL, NULL, false, 'FACULDADE IBECO (IBECO)', 8);
INSERT INTO public.empresa VALUES (1752, true, 1, '2023-07-02 12:35:23.566893', NULL, NULL, false, 'FACULDADE IBERO AMERICANA DE SÃO PAULO (FIASP)', 613);
INSERT INTO public.empresa VALUES (1753, true, 1, '2023-07-02 12:35:23.568238', NULL, NULL, false, 'FACULDADE IBG (IBG)', 287);
INSERT INTO public.empresa VALUES (1754, true, 1, '2023-07-02 12:35:23.569558', NULL, NULL, false, 'FACULDADE IBGEN', 149);
INSERT INTO public.empresa VALUES (1755, true, 1, '2023-07-02 12:35:23.570869', NULL, NULL, false, 'FACULDADE IBIAPABA', 235);
INSERT INTO public.empresa VALUES (1756, true, 1, '2023-07-02 12:35:23.572231', NULL, NULL, false, 'FACULDADE IBMEC (IBMEC)', 2);
INSERT INTO public.empresa VALUES (1757, true, 1, '2023-07-02 12:35:23.573572', NULL, NULL, false, 'FACULDADE IBMEC DE BRASÍLIA (IBMEC BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (1758, true, 1, '2023-07-02 12:35:23.574893', NULL, NULL, false, 'FACULDADE IBMEC SÃO PAULO (IBMEC SP)', 8);
INSERT INTO public.empresa VALUES (1759, true, 1, '2023-07-02 12:35:23.576223', NULL, NULL, false, 'FACULDADE IBRA DA GRANDE SÃO PAULO (FACULDADE FAGRAN)', 8);
INSERT INTO public.empresa VALUES (1760, true, 1, '2023-07-02 12:35:23.577567', NULL, NULL, false, 'FACULDADE IBRA DE BRASÍLIA (FACULDADE FABRAS)', 5);
INSERT INTO public.empresa VALUES (1761, true, 1, '2023-07-02 12:35:23.578672', NULL, NULL, false, 'FACULDADE IBRA DE MINAS GERAIS (FACULDADE FIBMG)', 268);
INSERT INTO public.empresa VALUES (1762, true, 1, '2023-07-02 12:35:23.580061', NULL, NULL, false, 'FACULDADE IBRA DE TECNOLOGIA (FACULDADE FITEC)', 144);
INSERT INTO public.empresa VALUES (1763, true, 1, '2023-07-02 12:35:23.581535', NULL, NULL, false, 'FACULDADE IBRA DOS VALES (FACULDADE FADIVALES)', 273);
INSERT INTO public.empresa VALUES (1764, true, 1, '2023-07-02 12:35:23.583052', NULL, NULL, false, 'FACULDADE IBS (IBS)', 2);
INSERT INTO public.empresa VALUES (1765, true, 1, '2023-07-02 12:35:23.58435', NULL, NULL, false, 'FACULDADE ICESP (ICESP)', 5);
INSERT INTO public.empresa VALUES (1766, true, 1, '2023-07-02 12:35:23.585699', NULL, NULL, false, 'FACULDADE ICTQ/PGE (ICTQ/PGE)', 264);
INSERT INTO public.empresa VALUES (1767, true, 1, '2023-07-02 12:35:23.587022', NULL, NULL, false, 'FACULDADE IDD (IDD)', 56);
INSERT INTO public.empresa VALUES (1768, true, 1, '2023-07-02 12:35:23.588354', NULL, NULL, false, 'FACULDADE IDEAL WYDEN (FACI WYDEN)', 79);
INSERT INTO public.empresa VALUES (1769, true, 1, '2023-07-02 12:35:23.589686', NULL, NULL, false, 'FACULDADE IDEAU DE BAGÉ (IDEAU)', 86);
INSERT INTO public.empresa VALUES (1770, true, 1, '2023-07-02 12:35:23.590868', NULL, NULL, false, 'FACULDADE IDEAU DE CAXIAS DO SUL (IDEAU)', 87);
INSERT INTO public.empresa VALUES (1771, true, 1, '2023-07-02 12:35:23.592203', NULL, NULL, false, 'FACULDADE IDEAU DE PASSO FUNDO (IDEAU)', 282);
INSERT INTO public.empresa VALUES (1772, true, 1, '2023-07-02 12:35:23.593546', NULL, NULL, false, 'FACULDADE IDOR DE CIÊNCIAS MÉDICAS (FACULDADE IDOR)', 12);
INSERT INTO public.empresa VALUES (1773, true, 1, '2023-07-02 12:35:23.594851', NULL, NULL, false, 'FACULDADE ILAPEO (ILAPEO)', 56);
INSERT INTO public.empresa VALUES (1774, true, 1, '2023-07-02 12:35:23.596252', NULL, NULL, false, 'FACULDADE IMEPAC DE ITUMBIARA (IMEPAC ITUMBIAR)', 234);
INSERT INTO public.empresa VALUES (1775, true, 1, '2023-07-02 12:35:23.597744', NULL, NULL, false, 'FACULDADE IMES (IMES)', 265);
INSERT INTO public.empresa VALUES (1776, true, 1, '2023-07-02 12:35:23.599073', NULL, NULL, false, 'FACULDADE IMESP MONITOR (IMESP)', 8);
INSERT INTO public.empresa VALUES (1777, true, 1, '2023-07-02 12:35:23.600556', NULL, NULL, false, 'FACULDADE IMPACTA (IMPACTA)', 8);
INSERT INTO public.empresa VALUES (1778, true, 1, '2023-07-02 12:35:23.602055', NULL, NULL, false, 'FACULDADE IMPACTO', 73);
INSERT INTO public.empresa VALUES (1779, true, 1, '2023-07-02 12:35:23.603132', NULL, NULL, false, 'FACULDADE IMPACTO DE PORANGATU (FIP)', 614);
INSERT INTO public.empresa VALUES (1780, true, 1, '2023-07-02 12:35:23.609729', NULL, NULL, false, 'FACULDADE IMPACTOS - FACI (FACI)', 203);
INSERT INTO public.empresa VALUES (1781, true, 1, '2023-07-02 12:35:23.611076', NULL, NULL, false, 'FACULDADE INBEC (INBEC)', 45);
INSERT INTO public.empresa VALUES (1782, true, 1, '2023-07-02 12:35:23.612497', NULL, NULL, false, 'FACULDADE INDEPENDENTE DO NORDESTE (FAINOR)', 37);
INSERT INTO public.empresa VALUES (1783, true, 1, '2023-07-02 12:35:23.613985', NULL, NULL, false, 'FACULDADE INESP - INSTITUTO NACIONAL DE ENSINO E PESQUISA (INESP)', 273);
INSERT INTO public.empresa VALUES (1784, true, 1, '2023-07-02 12:35:23.615467', NULL, NULL, false, 'FACULDADE INNOVARE (FACINN)', 8);
INSERT INTO public.empresa VALUES (1785, true, 1, '2023-07-02 12:35:23.616785', NULL, NULL, false, 'FACULDADE INNOVATE DE ANÁPOLIS (INNOVATE)', 264);
INSERT INTO public.empresa VALUES (1786, true, 1, '2023-07-02 12:35:23.618124', NULL, NULL, false, 'FACULDADE INOVA MAIS DE SÃO PAULO (FIMSP)', 8);
INSERT INTO public.empresa VALUES (1787, true, 1, '2023-07-02 12:35:23.619473', NULL, NULL, false, 'FACULDADE INPG DE BLUMENAU (FACINPG)', 193);
INSERT INTO public.empresa VALUES (1788, true, 1, '2023-07-02 12:35:23.62083', NULL, NULL, false, 'FACULDADE INPRO (FACINPRO)', 42);
INSERT INTO public.empresa VALUES (1789, true, 1, '2023-07-02 12:35:23.622315', NULL, NULL, false, 'FACULDADE INSPIRAR (INSPIRAR)', 56);
INSERT INTO public.empresa VALUES (1790, true, 1, '2023-07-02 12:35:23.623655', NULL, NULL, false, 'FACULDADE INSTED', 48);
INSERT INTO public.empresa VALUES (1791, true, 1, '2023-07-02 12:35:23.625103', NULL, NULL, false, 'FACULDADE INSTITUTO BRASILEIRO DE ENSINO (FACIBE)', 2);
INSERT INTO public.empresa VALUES (1792, true, 1, '2023-07-02 12:35:23.62644', NULL, NULL, false, 'FACULDADE INSTITUTO DE ENSINO SUPERIOR (FACIES)', 42);
INSERT INTO public.empresa VALUES (1793, true, 1, '2023-07-02 12:35:23.627788', NULL, NULL, false, 'FACULDADE INSTITUTO PAULISTA DE ENSINO (FIPEN)', 158);
INSERT INTO public.empresa VALUES (1794, true, 1, '2023-07-02 12:35:23.62918', NULL, NULL, false, 'FACULDADE INSTITUTO RIO DE JANEIRO (FIURJ)', 12);
INSERT INTO public.empresa VALUES (1795, true, 1, '2023-07-02 12:35:23.630674', NULL, NULL, false, 'FACULDADE INSTITUTO SUPERIOR DE EDUCAÇÃO DO PARANÁ - FAINSEP (FAINSEP)', 76);
INSERT INTO public.empresa VALUES (1796, true, 1, '2023-07-02 12:35:23.632167', NULL, NULL, false, 'FACULDADE INTEGRAÇÃO (FI)', 8);
INSERT INTO public.empresa VALUES (1797, true, 1, '2023-07-02 12:35:23.633263', NULL, NULL, false, 'FACULDADE INTEGRADA CARAJÁS (FIC)', 452);
INSERT INTO public.empresa VALUES (1798, true, 1, '2023-07-02 12:35:23.634582', NULL, NULL, false, 'FACULDADE INTEGRADA CESUMAR DE CURITIBA (CESUMAR)', 56);
INSERT INTO public.empresa VALUES (1799, true, 1, '2023-07-02 12:35:23.635905', NULL, NULL, false, 'FACULDADE INTEGRADA CETE (FIC)', 483);
INSERT INTO public.empresa VALUES (1800, true, 1, '2023-07-02 12:35:23.637245', NULL, NULL, false, 'FACULDADE INTEGRADA DA AMAZÔNIA (FINAMA)', 79);
INSERT INTO public.empresa VALUES (1801, true, 1, '2023-07-02 12:35:23.63859', NULL, NULL, false, 'FACULDADE INTEGRADA DAS CATARATAS EJOVEM (EJOVEM)', 124);
INSERT INTO public.empresa VALUES (1802, true, 1, '2023-07-02 12:35:23.639931', NULL, NULL, false, 'FACULDADE INTEGRADA DE ADVOCACIA DA AMAZÔNIA (FINAMA)', 79);
INSERT INTO public.empresa VALUES (1803, true, 1, '2023-07-02 12:35:23.641301', NULL, NULL, false, 'FACULDADE INTEGRADA DE GESTÃO E MEIO AMBIENTE (FACIGMA)', 60);
INSERT INTO public.empresa VALUES (1804, true, 1, '2023-07-02 12:35:23.642787', NULL, NULL, false, 'FACULDADE INTEGRADA DE PALMEIRAS DE GOIÁS (FAI)', 490);
INSERT INTO public.empresa VALUES (1805, true, 1, '2023-07-02 12:35:23.644138', NULL, NULL, false, 'FACULDADE INTEGRADA DE SANTA MARIA (FISMA)', 417);
INSERT INTO public.empresa VALUES (1806, true, 1, '2023-07-02 12:35:23.645492', NULL, NULL, false, 'FACULDADE INTEGRADA DE TAUBATÉ (FACULDADE FITAU)', 33);
INSERT INTO public.empresa VALUES (1807, true, 1, '2023-07-02 12:35:23.647008', NULL, NULL, false, 'FACULDADE INTEGRADA INSTITUTO SOUZA (FASOUZA)', 268);
INSERT INTO public.empresa VALUES (1808, true, 1, '2023-07-02 12:35:23.648355', NULL, NULL, false, 'FACULDADE INTEGRAL CANTAREIRA (F.I.C.)', 8);
INSERT INTO public.empresa VALUES (1809, true, 1, '2023-07-02 12:35:23.649798', NULL, NULL, false, 'FACULDADE INTEGRAL DE JABOATÃO DOS GUARARAPES (FIJ)', 132);
INSERT INTO public.empresa VALUES (1810, true, 1, '2023-07-02 12:35:23.651099', NULL, NULL, false, 'FACULDADE INTELLECTUS (FACINTEL)', 176);
INSERT INTO public.empresa VALUES (1811, true, 1, '2023-07-02 12:35:23.652431', NULL, NULL, false, 'FACULDADE INTERAMERICANA DE PORTO VELHO (UNIRON)', 51);
INSERT INTO public.empresa VALUES (1812, true, 1, '2023-07-02 12:35:23.653801', NULL, NULL, false, 'FACULDADE INTERATIVA DE SÃO PAULO (FAISP)', 8);
INSERT INTO public.empresa VALUES (1813, true, 1, '2023-07-02 12:35:23.65513', NULL, NULL, false, 'FACULDADE INTERCONTINENTAL (FAICON)', 299);
INSERT INTO public.empresa VALUES (1814, true, 1, '2023-07-02 12:35:23.656452', NULL, NULL, false, 'FACULDADE INTERCULTURAL DA AMAZONIA (FIAMA)', 79);
INSERT INTO public.empresa VALUES (1815, true, 1, '2023-07-02 12:35:23.657538', NULL, NULL, false, 'FACULDADE INTERMUNICIPAL DO NOROESTE DO PARANÁ (FACINOR)', 615);
INSERT INTO public.empresa VALUES (1816, true, 1, '2023-07-02 12:35:23.658869', NULL, NULL, false, 'FACULDADE INTERNACIONAL CIDADE VIVA', 107);
INSERT INTO public.empresa VALUES (1817, true, 1, '2023-07-02 12:35:23.660055', NULL, NULL, false, 'FACULDADE INTERNACIONAL DA PARAÍBA (FPB)', 107);
INSERT INTO public.empresa VALUES (1818, true, 1, '2023-07-02 12:35:23.661216', NULL, NULL, false, 'FACULDADE INTERNACIONAL DE SÃO LUÍS (ISL)', 141);
INSERT INTO public.empresa VALUES (1819, true, 1, '2023-07-02 12:35:23.662611', NULL, NULL, false, 'FACULDADE INTERNACIONAL DE SÃO PAULO (FINSP)', 8);
INSERT INTO public.empresa VALUES (1820, true, 1, '2023-07-02 12:35:23.663939', NULL, NULL, false, 'FACULDADE INTERVALE (INTERVALE)', 616);
INSERT INTO public.empresa VALUES (1821, true, 1, '2023-07-02 12:35:23.665245', NULL, NULL, false, 'FACULDADE INTESP (INTESP)', 617);
INSERT INTO public.empresa VALUES (1822, true, 1, '2023-07-02 12:35:23.666559', NULL, NULL, false, 'FACULDADE INVEST DE CIÊNCIAS E TECNOLOGIA (INVEST)', 203);
INSERT INTO public.empresa VALUES (1823, true, 1, '2023-07-02 12:35:23.667918', NULL, NULL, false, 'FACULDADE INVICTUS (FIRP)', 114);
INSERT INTO public.empresa VALUES (1824, true, 1, '2023-07-02 12:35:23.669259', NULL, NULL, false, 'FACULDADE IPEMED DE CIÊNCIAS MÉDICAS (IPEMED)', 2);
INSERT INTO public.empresa VALUES (1825, true, 1, '2023-07-02 12:35:23.670549', NULL, NULL, false, 'FACULDADE IPESSP (IPESSP)', 8);
INSERT INTO public.empresa VALUES (1826, true, 1, '2023-07-02 12:35:23.671902', NULL, NULL, false, 'FACULDADE IRECÊ (FAI)', 245);
INSERT INTO public.empresa VALUES (1827, true, 1, '2023-07-02 12:35:23.673223', NULL, NULL, false, 'FACULDADE ISAE BRASIL (ISAE)', 56);
INSERT INTO public.empresa VALUES (1828, true, 1, '2023-07-02 12:35:23.674432', NULL, NULL, false, 'FACULDADE ISEIB DE BELO HORIZONTE (FIBH)', 2);
INSERT INTO public.empresa VALUES (1829, true, 1, '2023-07-02 12:35:23.675742', NULL, NULL, false, 'FACULDADE ISEIB DE BETIM (FISBE)', 198);
INSERT INTO public.empresa VALUES (1830, true, 1, '2023-07-02 12:35:23.676908', NULL, NULL, false, 'FACULDADE ISMD (ISMD)', 8);
INSERT INTO public.empresa VALUES (1831, true, 1, '2023-07-02 12:35:23.678248', NULL, NULL, false, 'FACULDADE ISRAELITA DE CIÊNCIAS DA SAÚDE ALBERT EINSTEIN (FICSAE)', 8);
INSERT INTO public.empresa VALUES (1832, true, 1, '2023-07-02 12:35:23.679617', NULL, NULL, false, 'FACULDADE ITA EDUCACIONAL PAULISTA', 531);
INSERT INTO public.empresa VALUES (1833, true, 1, '2023-07-02 12:35:23.680733', NULL, NULL, false, 'FACULDADE ITANHAÉM (FAITA)', 618);
INSERT INTO public.empresa VALUES (1834, true, 1, '2023-07-02 12:35:23.682017', NULL, NULL, false, 'FACULDADE ITAPURANGA', 619);
INSERT INTO public.empresa VALUES (1835, true, 1, '2023-07-02 12:35:23.683344', NULL, NULL, false, 'FACULDADE ITAQUÁ (UNEITAQUÁ)', 526);
INSERT INTO public.empresa VALUES (1836, true, 1, '2023-07-02 12:35:23.684533', NULL, NULL, false, 'FACULDADE ITATAIA (FACIT)', 620);
INSERT INTO public.empresa VALUES (1837, true, 1, '2023-07-02 12:35:23.685877', NULL, NULL, false, 'FACULDADE ITEANA DE BOTUCATU (FITB)', 383);
INSERT INTO public.empresa VALUES (1838, true, 1, '2023-07-02 12:35:23.687201', NULL, NULL, false, 'FACULDADE ITEC', 111);
INSERT INTO public.empresa VALUES (1839, true, 1, '2023-07-02 12:35:23.688537', NULL, NULL, false, 'FACULDADE ITH (ITH)', 42);
INSERT INTO public.empresa VALUES (1840, true, 1, '2023-07-02 12:35:23.68971', NULL, NULL, false, 'FACULDADE ITPAC ABAETETUBA (ITPAC ABAET)', 227);
INSERT INTO public.empresa VALUES (1841, true, 1, '2023-07-02 12:35:23.691043', NULL, NULL, false, 'FACULDADE ITPAC BRAGANÇA (ITPAC BRAGANÇA)', 384);
INSERT INTO public.empresa VALUES (1842, true, 1, '2023-07-02 12:35:23.692383', NULL, NULL, false, 'FACULDADE ITPAC SANTA INES (ITPAC SANTA INÊS)', 507);
INSERT INTO public.empresa VALUES (1843, true, 1, '2023-07-02 12:35:23.69355', NULL, NULL, false, 'FACULDADE JAGUAR INDAIÁ (FJI)', 11);
INSERT INTO public.empresa VALUES (1844, true, 1, '2023-07-02 12:35:23.694727', NULL, NULL, false, 'FACULDADE JARDINS (FACJARDINS)', 142);
INSERT INTO public.empresa VALUES (1845, true, 1, '2023-07-02 12:35:23.695919', NULL, NULL, false, 'FACULDADE JESUÍTA DE FILOSOFIA E TEOLOGIA (FAJE)', 2);
INSERT INTO public.empresa VALUES (1846, true, 1, '2023-07-02 12:35:23.697247', NULL, NULL, false, 'FACULDADE JK BRASÍLIA - RECANTO DAS EMAS (JK BSB RE)', 5);
INSERT INTO public.empresa VALUES (1847, true, 1, '2023-07-02 12:35:23.698576', NULL, NULL, false, 'FACULDADE JK DE TECNOLOGIA (FACJK)', 5);
INSERT INTO public.empresa VALUES (1848, true, 1, '2023-07-02 12:35:23.699903', NULL, NULL, false, 'FACULDADE JK - GUARÁ (JK)', 5);
INSERT INTO public.empresa VALUES (1849, true, 1, '2023-07-02 12:35:23.701257', NULL, NULL, false, 'FACULDADE JK - UNIDADE I - GAMA', 5);
INSERT INTO public.empresa VALUES (1850, true, 1, '2023-07-02 12:35:23.702596', NULL, NULL, false, 'FACULDADE JK - UNIDADE II - GAMA', 5);
INSERT INTO public.empresa VALUES (1851, true, 1, '2023-07-02 12:35:23.703492', NULL, NULL, false, 'FACULDADE JOÃO PAULO II (FAJOP)', 621);
INSERT INTO public.empresa VALUES (1852, true, 1, '2023-07-02 12:35:23.704864', NULL, NULL, false, 'FACULDADE KENNEDY DE BELO HORIZONTE (FKBH)', 2);
INSERT INTO public.empresa VALUES (1853, true, 1, '2023-07-02 12:35:23.706173', NULL, NULL, false, 'FACULDADE KENNEDY DE IPATINGA (FKIPATINGA)', 268);
INSERT INTO public.empresa VALUES (1854, true, 1, '2023-07-02 12:35:23.707366', NULL, NULL, false, 'FACULDADE KENNEDY DE MINAS GERAIS - FKMG (FKMG)', 2);
INSERT INTO public.empresa VALUES (1855, true, 1, '2023-07-02 12:35:23.708681', NULL, NULL, false, 'FACULDADE LABORO (LABORO)', 141);
INSERT INTO public.empresa VALUES (1856, true, 1, '2023-07-02 12:35:23.710026', NULL, NULL, false, 'FACULDADE LA SALLE', 75);
INSERT INTO public.empresa VALUES (1857, true, 1, '2023-07-02 12:35:23.711389', NULL, NULL, false, 'FACULDADE LATINO-AMERICANA (FLAM)', 622);
INSERT INTO public.empresa VALUES (1858, true, 1, '2023-07-02 12:35:23.712743', NULL, NULL, false, 'FACULDADE LEGALE (LEGALE)', 8);
INSERT INTO public.empresa VALUES (1859, true, 1, '2023-07-02 12:35:23.714104', NULL, NULL, false, 'FACULDADE LEONARDO DA VINCI DE BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (1860, true, 1, '2023-07-02 12:35:23.715421', NULL, NULL, false, 'FACULDADE LEONARDO DA VINCI DE SÃO GONÇALO', 623);
INSERT INTO public.empresa VALUES (1861, true, 1, '2023-07-02 12:35:23.716723', NULL, NULL, false, 'FACULDADE LEONARDO DA VINCI - SANTA CATARINA (FAVINCI)', 624);
INSERT INTO public.empresa VALUES (1862, true, 1, '2023-07-02 12:35:23.718043', NULL, NULL, false, 'FACULDADE LIBER DE PORANGATU (FACLIBER)', 614);
INSERT INTO public.empresa VALUES (1863, true, 1, '2023-07-02 12:35:23.71938', NULL, NULL, false, 'FACULDADE LIFE (FACLIFE)', 625);
INSERT INTO public.empresa VALUES (1864, true, 1, '2023-07-02 12:35:23.720716', NULL, NULL, false, 'FACULDADE LIFE UNIC EDUCATION (LI)', 68);
INSERT INTO public.empresa VALUES (1865, true, 1, '2023-07-02 12:35:23.722063', NULL, NULL, false, 'FACULDADE LIONS (FAC-LIONS)', 42);
INSERT INTO public.empresa VALUES (1866, true, 1, '2023-07-02 12:35:23.723223', NULL, NULL, false, 'FACULDADE LOGOS (FALOG)', 626);
INSERT INTO public.empresa VALUES (1867, true, 1, '2023-07-02 12:35:23.724572', NULL, NULL, false, 'FACULDADE LUCIANO FEIJÃO (FLF)', 167);
INSERT INTO public.empresa VALUES (1868, true, 1, '2023-07-02 12:35:23.725898', NULL, NULL, false, 'FACULDADE LUIZ EDUARDO MAGALHÃES (FILEM)', 52);
INSERT INTO public.empresa VALUES (1869, true, 1, '2023-07-02 12:35:23.72698', NULL, NULL, false, 'FACULDADE LUIZ MÁRIO MOUTINHO (FLMM)', 60);
INSERT INTO public.empresa VALUES (1870, true, 1, '2023-07-02 12:35:23.728345', NULL, NULL, false, 'FACULDADE LUSITANA DE PERNAMBUCO (FALUP)', 627);
INSERT INTO public.empresa VALUES (1871, true, 1, '2023-07-02 12:35:23.729681', NULL, NULL, false, 'FACULDADE LUSO-BRASILEIRA (FALUB)', 627);
INSERT INTO public.empresa VALUES (1872, true, 1, '2023-07-02 12:35:23.73102', NULL, NULL, false, 'FACULDADE LUSÓFONA DA BAHIA (FL-BA)', 116);
INSERT INTO public.empresa VALUES (1873, true, 1, '2023-07-02 12:35:23.73236', NULL, NULL, false, 'FACULDADE LUSÓFONA DE SÃO PAULO (FL-SP)', 520);
INSERT INTO public.empresa VALUES (1874, true, 1, '2023-07-02 12:35:23.733686', NULL, NULL, false, 'FACULDADE LUSÓFONA DO RIO DE JANEIRO (FL-RJ)', 623);
INSERT INTO public.empresa VALUES (1875, true, 1, '2023-07-02 12:35:23.73486', NULL, NULL, false, 'FACULDADE LUTERANA DE TEOLOGIA (FLT)', 546);
INSERT INTO public.empresa VALUES (1876, true, 1, '2023-07-02 12:35:23.736198', NULL, NULL, false, 'FACULDADE LUTERANA SÃO MARCOS (FALSM)', 263);
INSERT INTO public.empresa VALUES (1877, true, 1, '2023-07-02 12:35:23.737546', NULL, NULL, false, 'FACULDADE MACÊDO DE AMORIM (FAMAM)', 90);
INSERT INTO public.empresa VALUES (1878, true, 1, '2023-07-02 12:35:23.738878', NULL, NULL, false, 'FACULDADE MACHADO DE ASSIS (FAMA)', 12);
INSERT INTO public.empresa VALUES (1879, true, 1, '2023-07-02 12:35:23.740183', NULL, NULL, false, 'FACULDADE MACHADO SOBRINHO (FMS)', 38);
INSERT INTO public.empresa VALUES (1880, true, 1, '2023-07-02 12:35:23.741527', NULL, NULL, false, 'FACULDADE MADALENA SOFIA (FMS)', 56);
INSERT INTO public.empresa VALUES (1881, true, 1, '2023-07-02 12:35:23.742868', NULL, NULL, false, 'FACULDADE MADRE TEREZA (FAMAT)', 628);
INSERT INTO public.empresa VALUES (1882, true, 1, '2023-07-02 12:35:23.744197', NULL, NULL, false, 'FACULDADE MADRE THAIS (FMT)', 20);
INSERT INTO public.empresa VALUES (1883, true, 1, '2023-07-02 12:35:23.745419', NULL, NULL, false, 'FACULDADE MAIS DE ITUIUTABA (FACMAIS)', 629);
INSERT INTO public.empresa VALUES (1884, true, 1, '2023-07-02 12:35:23.746728', NULL, NULL, false, 'FACULDADE MALTA (FACMA)', 27);
INSERT INTO public.empresa VALUES (1885, true, 1, '2023-07-02 12:35:23.748069', NULL, NULL, false, 'FACULDADE MARANATHA (FAMAH)', 27);
INSERT INTO public.empresa VALUES (1886, true, 1, '2023-07-02 12:35:23.749384', NULL, NULL, false, 'FACULDADE MARANHENSE (FAM)', 630);
INSERT INTO public.empresa VALUES (1887, true, 1, '2023-07-02 12:35:23.750477', NULL, NULL, false, 'FACULDADE MARANHENSE SÃO JOSÉ DOS COCAIS (FSJ)', 456);
INSERT INTO public.empresa VALUES (1888, true, 1, '2023-07-02 12:35:23.75183', NULL, NULL, false, 'FACULDADE MARECHAL RONDON', 355);
INSERT INTO public.empresa VALUES (1889, true, 1, '2023-07-02 12:35:23.753204', NULL, NULL, false, 'FACULDADE MARECHAL RONDON (FMR)', 631);
INSERT INTO public.empresa VALUES (1890, true, 1, '2023-07-02 12:35:23.75451', NULL, NULL, false, 'FACULDADE MARECHAL RONDON DE BAURU (FMR-BAURU)', 93);
INSERT INTO public.empresa VALUES (1891, true, 1, '2023-07-02 12:35:23.755846', NULL, NULL, false, 'FACULDADE MARECHAL RONDON DE GUARULHOS (FMR-GUARULHOS)', 100);
INSERT INTO public.empresa VALUES (1892, true, 1, '2023-07-02 12:35:23.757167', NULL, NULL, false, 'FACULDADE MARECHAL RONDON DE MAUÁ (FMR-MAUÁ)', 480);
INSERT INTO public.empresa VALUES (1893, true, 1, '2023-07-02 12:35:23.758505', NULL, NULL, false, 'FACULDADE MARIA THEREZA (FAMATH)', 49);
INSERT INTO public.empresa VALUES (1894, true, 1, '2023-07-02 12:35:23.759668', NULL, NULL, false, 'FACULDADE MARINGÁ (CESPAR)', 76);
INSERT INTO public.empresa VALUES (1895, true, 1, '2023-07-02 12:35:23.761032', NULL, NULL, false, 'FACULDADE MÁRIO QUINTANA (FAMAQUI)', 149);
INSERT INTO public.empresa VALUES (1896, true, 1, '2023-07-02 12:35:23.762356', NULL, NULL, false, 'FACULDADE MARQUÊS DE OLINDA (FMO)', 127);
INSERT INTO public.empresa VALUES (1897, true, 1, '2023-07-02 12:35:23.763738', NULL, NULL, false, 'FACULDADE MARTHA FALCÃO WYDEN (FMF WYDEN)', 75);
INSERT INTO public.empresa VALUES (1898, true, 1, '2023-07-02 12:35:23.76505', NULL, NULL, false, 'FACULDADE MASTER DE PARAUAPEBAS - FAMAP (FAMAP)', 281);
INSERT INTO public.empresa VALUES (1899, true, 1, '2023-07-02 12:35:23.766366', NULL, NULL, false, 'FACULDADE MASTER DO PARÁ - FAMAP TUCUMÃ (FAMAP)', 632);
INSERT INTO public.empresa VALUES (1900, true, 1, '2023-07-02 12:35:23.767702', NULL, NULL, false, 'FACULDADE MASTER DO PARÁ - FAMAP XINGUARA (FAMAP)', 633);
INSERT INTO public.empresa VALUES (1901, true, 1, '2023-07-02 12:35:23.769067', NULL, NULL, false, 'FACULDADE MATO GROSSO DO SUL (FACSUL)', 48);
INSERT INTO public.empresa VALUES (1902, true, 1, '2023-07-02 12:35:23.770383', NULL, NULL, false, 'FACULDADE MAUÁ DE GOIÁS', 603);
INSERT INTO public.empresa VALUES (1903, true, 1, '2023-07-02 12:35:23.771724', NULL, NULL, false, 'FACULDADE MAURÍCIO DE NASSAU DE IMPETRATRIZ (FMN IMPERATRIZ)', 267);
INSERT INTO public.empresa VALUES (1904, true, 1, '2023-07-02 12:35:23.773049', NULL, NULL, false, 'FACULDADE MAURÍCIO DE NASSAU SERRA TALHADA (FMN SERRA)', 398);
INSERT INTO public.empresa VALUES (1905, true, 1, '2023-07-02 12:35:23.774128', NULL, NULL, false, 'FACULDADE M-EDUCAR (FAMED)', 634);
INSERT INTO public.empresa VALUES (1906, true, 1, '2023-07-02 12:35:23.775477', NULL, NULL, false, 'FACULDADE MEGA (MEGA)', 2);
INSERT INTO public.empresa VALUES (1907, true, 1, '2023-07-02 12:35:23.776816', NULL, NULL, false, 'FACULDADE MÉLIÈS (MÉLIÈS)', 8);
INSERT INTO public.empresa VALUES (1908, true, 1, '2023-07-02 12:35:23.778167', NULL, NULL, false, 'FACULDADE MENINO DEUS (FAMED)', 149);
INSERT INTO public.empresa VALUES (1909, true, 1, '2023-07-02 12:35:23.779555', NULL, NULL, false, 'FACULDADE MENNA BARRETO (FMB)', 206);
INSERT INTO public.empresa VALUES (1910, true, 1, '2023-07-02 12:35:23.781018', NULL, NULL, false, 'FACULDADE MERIDIONAL (IMED)', 282);
INSERT INTO public.empresa VALUES (1911, true, 1, '2023-07-02 12:35:23.782351', NULL, NULL, false, 'FACULDADE MERIDIONAL DE IJUÍ (IMED)', 311);
INSERT INTO public.empresa VALUES (1912, true, 1, '2023-07-02 12:35:23.78365', NULL, NULL, false, 'FACULDADE MERIDIONAL DE PORTO ALEGRE (IMED)', 149);
INSERT INTO public.empresa VALUES (1913, true, 1, '2023-07-02 12:35:23.785184', NULL, NULL, false, 'FACULDADE MERIDIONAL RS (IMED )', 149);
INSERT INTO public.empresa VALUES (1914, true, 1, '2023-07-02 12:35:23.78655', NULL, NULL, false, 'FACULDADE MESSIANICA', 8);
INSERT INTO public.empresa VALUES (1915, true, 1, '2023-07-02 12:35:23.788037', NULL, NULL, false, 'FACULDADE METODISTA CENTENÁRIO (FMC)', 417);
INSERT INTO public.empresa VALUES (1916, true, 1, '2023-07-02 12:35:23.789481', NULL, NULL, false, 'FACULDADE METODISTA CONEXIONAL (FACO)', 467);
INSERT INTO public.empresa VALUES (1917, true, 1, '2023-07-02 12:35:23.790832', NULL, NULL, false, 'FACULDADE METODISTA DE CIÊNCIAS HUMANAS E EXATAS (METODISTA)', 313);
INSERT INTO public.empresa VALUES (1918, true, 1, '2023-07-02 12:35:23.792169', NULL, NULL, false, 'FACULDADE METODISTA GRANBERY (FMG)', 38);
INSERT INTO public.empresa VALUES (1919, true, 1, '2023-07-02 12:35:23.793522', NULL, NULL, false, 'FACULDADE MÉTODO DE SÃO PAULO (FAMESP)', 8);
INSERT INTO public.empresa VALUES (1920, true, 1, '2023-07-02 12:35:23.794848', NULL, NULL, false, 'FACULDADE METROPOLITANA (UNNESA)', 51);
INSERT INTO public.empresa VALUES (1921, true, 1, '2023-07-02 12:35:23.796224', NULL, NULL, false, 'FACULDADE METROPOLITANA DA GRANDE RECIFE (UNESJ)', 132);
INSERT INTO public.empresa VALUES (1922, true, 1, '2023-07-02 12:35:23.79753', NULL, NULL, false, 'FACULDADE METROPOLITANA DE ANÁPOLIS (FAMA)', 264);
INSERT INTO public.empresa VALUES (1923, true, 1, '2023-07-02 12:35:23.798612', NULL, NULL, false, 'FACULDADE METROPOLITANA DE CIENCIAS E TECNOLOGIA (FAMEC)', 537);
INSERT INTO public.empresa VALUES (1924, true, 1, '2023-07-02 12:35:23.799935', NULL, NULL, false, 'FACULDADE METROPOLITANA DE COARI (FAMETRO)', 635);
INSERT INTO public.empresa VALUES (1925, true, 1, '2023-07-02 12:35:23.801286', NULL, NULL, false, 'FACULDADE METROPOLITANA DE DIAS D''ÀVILA (FACD''ÀVILA)', 636);
INSERT INTO public.empresa VALUES (1926, true, 1, '2023-07-02 12:35:23.802619', NULL, NULL, false, 'FACULDADE METROPOLITANA DE FLORIANÓPOLIS (FAMEFLORIPA)', 3);
INSERT INTO public.empresa VALUES (1927, true, 1, '2023-07-02 12:35:23.803954', NULL, NULL, false, 'FACULDADE METROPOLITANA DE FRANCA (FAMEF)', 179);
INSERT INTO public.empresa VALUES (1928, true, 1, '2023-07-02 12:35:23.805291', NULL, NULL, false, 'FACULDADE METROPOLITANA DE HORIZONTE (FMH)', 525);
INSERT INTO public.empresa VALUES (1929, true, 1, '2023-07-02 12:35:23.806629', NULL, NULL, false, 'FACULDADE METROPOLITANA DE ITACOATIARA (FAMETRO)', 637);
INSERT INTO public.empresa VALUES (1930, true, 1, '2023-07-02 12:35:23.807973', NULL, NULL, false, 'FACULDADE METROPOLITANA DE ITAJAÍ (FIMT)', 345);
INSERT INTO public.empresa VALUES (1931, true, 1, '2023-07-02 12:35:23.809319', NULL, NULL, false, 'FACULDADE METROPOLITANA DE JOINVILLE (FAMEVILLE)', 68);
INSERT INTO public.empresa VALUES (1932, true, 1, '2023-07-02 12:35:23.810659', NULL, NULL, false, 'FACULDADE METROPOLITANA DE LAGES (FAMELAGES)', 148);
INSERT INTO public.empresa VALUES (1933, true, 1, '2023-07-02 12:35:23.811998', NULL, NULL, false, 'FACULDADE METROPOLITANA DE PALHOÇA (FAMEPALHOÇA)', 544);
INSERT INTO public.empresa VALUES (1934, true, 1, '2023-07-02 12:35:23.813958', NULL, NULL, false, 'FACULDADE METROPOLITANA DE PARINTINS (FAMETRO)', 638);
INSERT INTO public.empresa VALUES (1935, true, 1, '2023-07-02 12:35:23.815561', NULL, NULL, false, 'FACULDADE METROPOLITANA DE RIO DO SUL (FAMESUL)', 183);
INSERT INTO public.empresa VALUES (1936, true, 1, '2023-07-02 12:35:23.817055', NULL, NULL, false, 'FACULDADE METROPOLITANA DE TEFÉ (FAMETRO)', 639);
INSERT INTO public.empresa VALUES (1937, true, 1, '2023-07-02 12:35:23.818553', NULL, NULL, false, 'FACULDADE METROPOLITANA DE TERESINA', 27);
INSERT INTO public.empresa VALUES (1938, true, 1, '2023-07-02 12:35:23.819891', NULL, NULL, false, 'FACULDADE METROPOLITANA DO CARIRI (FAMEC)', 310);
INSERT INTO public.empresa VALUES (1939, true, 1, '2023-07-02 12:35:23.821213', NULL, NULL, false, 'FACULDADE METROPOLITANA DO CEARÁ (FAMEC)', 45);
INSERT INTO public.empresa VALUES (1940, true, 1, '2023-07-02 12:35:23.82256', NULL, NULL, false, 'FACULDADE METROPOLITANA DO ESTADO DE SÃO PAULO (FAMEESP)', 58);
INSERT INTO public.empresa VALUES (1941, true, 1, '2023-07-02 12:35:23.823901', NULL, NULL, false, 'FACULDADE METROPOLITANA DO MARAJÓ (FAMMA)', 640);
INSERT INTO public.empresa VALUES (1942, true, 1, '2023-07-02 12:35:23.825316', NULL, NULL, false, 'FACULDADE METROPOLITANA DO PARÁ (FAMETRO)', 78);
INSERT INTO public.empresa VALUES (1943, true, 1, '2023-07-02 12:35:23.82666', NULL, NULL, false, 'FACULDADE METROPOLITANA DO PLANALTO NORTE (FAMEPLAN)', 358);
INSERT INTO public.empresa VALUES (1944, true, 1, '2023-07-02 12:35:23.82801', NULL, NULL, false, 'FACULDADE METROPOLITANA NORTE RIOGRANDENSE (FAMEN)', 130);
INSERT INTO public.empresa VALUES (1945, true, 1, '2023-07-02 12:35:23.829414', NULL, NULL, false, 'FACULDADE METROPOLITANA SÃO CARLOS BJI (FAMESC-BJI)', 448);
INSERT INTO public.empresa VALUES (1946, true, 1, '2023-07-02 12:35:23.831017', NULL, NULL, false, 'FACULDADE MICROLINS (FAMIC)', 181);
INSERT INTO public.empresa VALUES (1947, true, 1, '2023-07-02 12:35:23.832878', NULL, NULL, false, 'FACULDADE MILTON CAMPOS (FMC)', 481);
INSERT INTO public.empresa VALUES (1948, true, 1, '2023-07-02 12:35:23.8347', NULL, NULL, false, 'FACULDADE MINAS GERAIS (FAMIG)', 2);
INSERT INTO public.empresa VALUES (1949, true, 1, '2023-07-02 12:35:23.836255', NULL, NULL, false, 'FACULDADE MIRIENSE', 641);
INSERT INTO public.empresa VALUES (1950, true, 1, '2023-07-02 12:35:23.837683', NULL, NULL, false, 'FACULDADE MODAL (MODAL)', 2);
INSERT INTO public.empresa VALUES (1951, true, 1, '2023-07-02 12:35:23.839573', NULL, NULL, false, 'FACULDADE MODELO (FACIMOD)', 56);
INSERT INTO public.empresa VALUES (1952, true, 1, '2023-07-02 12:35:23.841215', NULL, NULL, false, 'FACULDADE MOGIANA (FAMOGI)', 642);
INSERT INTO public.empresa VALUES (1953, true, 1, '2023-07-02 12:35:23.84305', NULL, NULL, false, 'FACULDADE MOGIANA DO ESTADO DE SÃO PAULO (FMG)', 279);
INSERT INTO public.empresa VALUES (1954, true, 1, '2023-07-02 12:35:23.844722', NULL, NULL, false, 'FACULDADE MONSENHOR HIPOLITO (FMH)', 643);
INSERT INTO public.empresa VALUES (1955, true, 1, '2023-07-02 12:35:23.846423', NULL, NULL, false, 'FACULDADE MONTE PASCOAL (FMP)', 644);
INSERT INTO public.empresa VALUES (1956, true, 1, '2023-07-02 12:35:23.847951', NULL, NULL, false, 'FACULDADE MONTES CLAROS (FACULMONTES)', 128);
INSERT INTO public.empresa VALUES (1957, true, 1, '2023-07-02 12:35:23.849532', NULL, NULL, false, 'FACULDADE MONTESSORIANO DE SALVADOR (FAMA)', 116);
INSERT INTO public.empresa VALUES (1958, true, 1, '2023-07-02 12:35:23.850984', NULL, NULL, false, 'FACULDADE MORGANA POTRICH (FAMP)', 109);
INSERT INTO public.empresa VALUES (1959, true, 1, '2023-07-02 12:35:23.852199', NULL, NULL, false, 'FACULDADE MORUMBI (FAMOR)', 8);
INSERT INTO public.empresa VALUES (1960, true, 1, '2023-07-02 12:35:23.853505', NULL, NULL, false, 'FACULDADE MOZARTEUM DE SÃO PAULO (FAMOSP)', 8);
INSERT INTO public.empresa VALUES (1961, true, 1, '2023-07-02 12:35:23.854722', NULL, NULL, false, 'FACULDADE MULTIVERSA (MULTIVERSA)', 124);
INSERT INTO public.empresa VALUES (1962, true, 1, '2023-07-02 12:35:23.856046', NULL, NULL, false, 'FACULDADE MULTIVERSA DE FORTALEZA', 45);
INSERT INTO public.empresa VALUES (1963, true, 1, '2023-07-02 12:35:23.857426', NULL, NULL, false, 'FACULDADE MULTIVERSA DE PALOTINA (MULTIVERSA)', 645);
INSERT INTO public.empresa VALUES (1964, true, 1, '2023-07-02 12:35:23.858889', NULL, NULL, false, 'FACULDADE MULTIVERSA DE TECNOLOGIA', 45);
INSERT INTO public.empresa VALUES (1965, true, 1, '2023-07-02 12:35:23.860209', NULL, NULL, false, 'FACULDADE MULTIVIX CARIACICA (MULTIVIX CARIAC)', 389);
INSERT INTO public.empresa VALUES (1966, true, 1, '2023-07-02 12:35:23.861532', NULL, NULL, false, 'FACULDADE MULTIVIX DE CACHOEIRO (MULTIVIX CACHOEIRO)', 190);
INSERT INTO public.empresa VALUES (1967, true, 1, '2023-07-02 12:35:23.862907', NULL, NULL, false, 'FACULDADE MULTIVIX NOVA VENÉCIA (MULTIVIX NOVA VENÉCI)', 646);
INSERT INTO public.empresa VALUES (1968, true, 1, '2023-07-02 12:35:23.864229', NULL, NULL, false, 'FACULDADE MULTIVIX SÃO MATEUS (MULTIVIX SÃO MATEUS)', 216);
INSERT INTO public.empresa VALUES (1969, true, 1, '2023-07-02 12:35:23.865551', NULL, NULL, false, 'FACULDADE MULTIVIX SERRA (MULTIVIX SERRA)', 290);
INSERT INTO public.empresa VALUES (1970, true, 1, '2023-07-02 12:35:23.86688', NULL, NULL, false, 'FACULDADE MULTIVIX VILA VELHA (MULTIVIX VILA V)', 226);
INSERT INTO public.empresa VALUES (1971, true, 1, '2023-07-02 12:35:23.868224', NULL, NULL, false, 'FACULDADE MUNICIPAL DE EDUCAÇÃO E MEIO AMBIENTE (FAMA)', 647);
INSERT INTO public.empresa VALUES (1972, true, 1, '2023-07-02 12:35:23.869565', NULL, NULL, false, 'FACULDADE MUNICIPAL DE PALHOÇA (FMP)', 544);
INSERT INTO public.empresa VALUES (1973, true, 1, '2023-07-02 12:35:23.870907', NULL, NULL, false, 'FACULDADE MUNICIPAL PROFESSOR FRANCO MONTORO DE MOGI GUAÇU (FMPFM)', 279);
INSERT INTO public.empresa VALUES (1974, true, 1, '2023-07-02 12:35:23.872233', NULL, NULL, false, 'FACULDADE MURIALDO (FAMUR)', 87);
INSERT INTO public.empresa VALUES (1975, true, 1, '2023-07-02 12:35:23.87341', NULL, NULL, false, 'FACULDADE NACIONAL (FANAC)', 60);
INSERT INTO public.empresa VALUES (1976, true, 1, '2023-07-02 12:35:23.874751', NULL, NULL, false, 'FACULDADE NACIONAL DE NATUROPATIA ADMINISTRAÇÃO E PEDAGOGIA (FANNAP)', 541);
INSERT INTO public.empresa VALUES (1977, true, 1, '2023-07-02 12:35:23.875866', NULL, NULL, false, 'FACULDADE NAZARENA DO BRASIL (FNB)', 177);
INSERT INTO public.empresa VALUES (1978, true, 1, '2023-07-02 12:35:23.877338', NULL, NULL, false, 'FACULDADE NETCOM (FANET)', 141);
INSERT INTO public.empresa VALUES (1979, true, 1, '2023-07-02 12:35:23.878681', NULL, NULL, false, 'FACULDADE NETWORK (NWK)', 648);
INSERT INTO public.empresa VALUES (1980, true, 1, '2023-07-02 12:35:23.880096', NULL, NULL, false, 'FACULDADE NIP DE CIÊNCIAS APLICADAS (FANIP)', 60);
INSERT INTO public.empresa VALUES (1981, true, 1, '2023-07-02 12:35:23.881397', NULL, NULL, false, 'FACULDADE NOROESTE (FAN)', 42);
INSERT INTO public.empresa VALUES (1982, true, 1, '2023-07-02 12:35:23.88271', NULL, NULL, false, 'FACULDADE NORTE E NORDESTE DO BRASIL (FANOR - BRASIL)', 649);
INSERT INTO public.empresa VALUES (1983, true, 1, '2023-07-02 12:35:23.884058', NULL, NULL, false, 'FACULDADE NORTE-SUL (FANS)', 183);
INSERT INTO public.empresa VALUES (1984, true, 1, '2023-07-02 12:35:23.885384', NULL, NULL, false, 'FACULDADE NOSSA SENHORA APARECIDA (FNSA)', 98);
INSERT INTO public.empresa VALUES (1985, true, 1, '2023-07-02 12:35:23.886733', NULL, NULL, false, 'FACULDADE NOSSA SENHORA DA CONCEIÇÃO (FSC)', 142);
INSERT INTO public.empresa VALUES (1986, true, 1, '2023-07-02 12:35:23.888069', NULL, NULL, false, 'FACULDADE NOSSA SENHORA DE FÁTIMA (FACULDADE FÁTIMA)', 87);
INSERT INTO public.empresa VALUES (1987, true, 1, '2023-07-02 12:35:23.889391', NULL, NULL, false, 'FACULDADE NOSSA SENHORA DE LOURDES (FNSL)', 308);
INSERT INTO public.empresa VALUES (1988, true, 1, '2023-07-02 12:35:23.890729', NULL, NULL, false, 'FACULDADE NOVA ROMA (FNR)', 60);
INSERT INTO public.empresa VALUES (1989, true, 1, '2023-07-02 12:35:23.892033', NULL, NULL, false, 'FACULDADE NOVA ROMA CARUARU (FNR CARUARU)', 156);
INSERT INTO public.empresa VALUES (1990, true, 1, '2023-07-02 12:35:23.893369', NULL, NULL, false, 'FACULDADE NOVA ROMA DE CAMPO GRANDE (FNR - CAMPO GRANDE)', 48);
INSERT INTO public.empresa VALUES (1991, true, 1, '2023-07-02 12:35:23.894716', NULL, NULL, false, 'FACULDADE NOVE DE JULHO DE BAURU (NOVE-BAURU)', 93);
INSERT INTO public.empresa VALUES (1992, true, 1, '2023-07-02 12:35:23.895921', NULL, NULL, false, 'FACULDADE NOVE DE JULHO DE BOTUCATU (NOVE-BOTUCATU)', 383);
INSERT INTO public.empresa VALUES (1993, true, 1, '2023-07-02 12:35:23.897241', NULL, NULL, false, 'FACULDADE NOVE DE JULHO DE OSASCO (NOVE-OSASCO)', 158);
INSERT INTO public.empresa VALUES (1994, true, 1, '2023-07-02 12:35:23.898604', NULL, NULL, false, 'FACULDADE NOVE DE JULHO DE SÃO BERNARDO DO CAMPO (NOVE-SBC)', 82);
INSERT INTO public.empresa VALUES (1995, true, 1, '2023-07-02 12:35:23.899661', NULL, NULL, false, 'FACULDADE NOVE DE JULHO GUARULHOS (NOVE-GUARULHOS)', 100);
INSERT INTO public.empresa VALUES (1996, true, 1, '2023-07-02 12:35:23.900981', NULL, NULL, false, 'FACULDADE NOVE DE JULHO MAUÁ (NOVE_MAUÁ)', 480);
INSERT INTO public.empresa VALUES (1997, true, 1, '2023-07-02 12:35:23.902319', NULL, NULL, false, 'FACULDADE NOVOESTE (NOVOESTE)', 48);
INSERT INTO public.empresa VALUES (1998, true, 1, '2023-07-02 12:35:23.903656', NULL, NULL, false, 'FACULDADE NOVO HAMBURGO (FACULDADE IENH)', 541);
INSERT INTO public.empresa VALUES (1999, true, 1, '2023-07-02 12:35:23.905', NULL, NULL, false, 'FACULDADE NOVO HORIZONTE (FNH)', 90);
INSERT INTO public.empresa VALUES (2000, true, 1, '2023-07-02 12:35:23.906335', NULL, NULL, false, 'FACULDADE NOVO HORIZONTE DE IPOJUCA (FNH)', 650);
INSERT INTO public.empresa VALUES (2001, true, 1, '2023-07-02 12:35:23.90769', NULL, NULL, false, 'FACULDADE NOVO MILÊNIO (FNM)', 226);
INSERT INTO public.empresa VALUES (2002, true, 1, '2023-07-02 12:35:23.909042', NULL, NULL, false, 'FACULDADE OLGA METTIG (FAMETTIG)', 116);
INSERT INTO public.empresa VALUES (2003, true, 1, '2023-07-02 12:35:23.910385', NULL, NULL, false, 'FACULDADE ONE LEARNING', 566);
INSERT INTO public.empresa VALUES (2004, true, 1, '2023-07-02 12:35:23.911751', NULL, NULL, false, 'FACULDADE OPUS 365', 8);
INSERT INTO public.empresa VALUES (2005, true, 1, '2023-07-02 12:35:23.913122', NULL, NULL, false, 'FACULDADE ORÍGENES LESSA (FACOL)', 651);
INSERT INTO public.empresa VALUES (2006, true, 1, '2023-07-02 12:35:23.914574', NULL, NULL, false, 'FACULDADE PADRÃO (PADRAO)', 42);
INSERT INTO public.empresa VALUES (2007, true, 1, '2023-07-02 12:35:23.915889', NULL, NULL, false, 'FACULDADE PADRÃO (-)', 41);
INSERT INTO public.empresa VALUES (2008, true, 1, '2023-07-02 12:35:23.917218', NULL, NULL, false, 'FACULDADE PADRAO DE SENADOR CANEDO (FAPSC)', 538);
INSERT INTO public.empresa VALUES (2009, true, 1, '2023-07-02 12:35:23.918553', NULL, NULL, false, 'FACULDADE PAIVA ANDRADE (FPA)', 45);
INSERT INTO public.empresa VALUES (2010, true, 1, '2023-07-02 12:35:23.919887', NULL, NULL, false, 'FACULDADE PALOTINA (FAPAS)', 417);
INSERT INTO public.empresa VALUES (2011, true, 1, '2023-07-02 12:35:23.921224', NULL, NULL, false, 'FACULDADE PAN AMAZÔNICA (FAPAN)', 79);
INSERT INTO public.empresa VALUES (2012, true, 1, '2023-07-02 12:35:23.922384', NULL, NULL, false, 'FACULDADE PAN AMERICANA (FPA)', 652);
INSERT INTO public.empresa VALUES (2013, true, 1, '2023-07-02 12:35:23.923462', NULL, NULL, false, 'FACULDADE PAN-AMERICANA DE ADMINISTRAÇÃO E DIREITO (FAPAD)', 56);
INSERT INTO public.empresa VALUES (2014, true, 1, '2023-07-02 12:35:23.924818', NULL, NULL, false, 'FACULDADE PARAENSE DE ENSINO (FAPEN)', 79);
INSERT INTO public.empresa VALUES (2015, true, 1, '2023-07-02 12:35:23.926149', NULL, NULL, false, 'FACULDADE PARAÍSO ARARIPINA (FAP)', 393);
INSERT INTO public.empresa VALUES (2016, true, 1, '2023-07-02 12:35:23.92748', NULL, NULL, false, 'FACULDADE PARAÍSO FORTALEZA (FAP)', 45);
INSERT INTO public.empresa VALUES (2017, true, 1, '2023-07-02 12:35:23.928833', NULL, NULL, false, 'FACULDADE PARANÁ (FAP)', 327);
INSERT INTO public.empresa VALUES (2018, true, 1, '2023-07-02 12:35:23.930223', NULL, NULL, false, 'FACULDADE PARANAENSE (FACCAR)', 653);
INSERT INTO public.empresa VALUES (2019, true, 1, '2023-07-02 12:35:23.931578', NULL, NULL, false, 'FACULDADE PARANAENSE (FAPAR)', 56);
INSERT INTO public.empresa VALUES (2020, true, 1, '2023-07-02 12:35:23.933042', NULL, NULL, false, 'FACULDADE PARA O DESENVOLVIMENTO SUSTENTÁVEL DA AMAZÔNIA (FADESA)', 281);
INSERT INTO public.empresa VALUES (2021, true, 1, '2023-07-02 12:35:23.934361', NULL, NULL, false, 'FACULDADE PARQUE (FAP)', 116);
INSERT INTO public.empresa VALUES (2022, true, 1, '2023-07-02 12:35:23.935525', NULL, NULL, false, 'FACULDADE PASCHOAL DANTAS (FPD)', 8);
INSERT INTO public.empresa VALUES (2023, true, 1, '2023-07-02 12:35:23.936747', NULL, NULL, false, 'FACULDADE PASCHOAL DANTAS EAD (FPD - EAD)', 8);
INSERT INTO public.empresa VALUES (2024, true, 1, '2023-07-02 12:35:23.938034', NULL, NULL, false, 'FACULDADE PAULISTA DE ARTES (FPA)', 8);
INSERT INTO public.empresa VALUES (2025, true, 1, '2023-07-02 12:35:23.939372', NULL, NULL, false, 'FACULDADE PAULISTA DE BEM ESTAR E SAÚDE', 8);
INSERT INTO public.empresa VALUES (2026, true, 1, '2023-07-02 12:35:23.940767', NULL, NULL, false, 'FACULDADE PAULISTA DE CIÊNCIAS DA SAÚDE (FPCS)', 8);
INSERT INTO public.empresa VALUES (2027, true, 1, '2023-07-02 12:35:23.942134', NULL, NULL, false, 'FACULDADE PAULISTA DE COMUNICAÇÃO (FEPAC)', 8);
INSERT INTO public.empresa VALUES (2028, true, 1, '2023-07-02 12:35:23.943559', NULL, NULL, false, 'FACULDADE PAULISTA DE GESTÃO E SAÚDE', 8);
INSERT INTO public.empresa VALUES (2029, true, 1, '2023-07-02 12:35:23.944895', NULL, NULL, false, 'FACULDADE PAULISTA DE SERVIÇO SOCIAL DE SÃO CAETANO DO SUL (FAPSS)', 126);
INSERT INTO public.empresa VALUES (2030, true, 1, '2023-07-02 12:35:23.946352', NULL, NULL, false, 'FACULDADE PAULO PICANÇO (FACPP)', 45);
INSERT INTO public.empresa VALUES (2031, true, 1, '2023-07-02 12:35:23.947498', NULL, NULL, false, 'FACULDADE PAULUS DE TECNOLOGIA E COMUNICAÇÃO (FAPCOM)', 8);
INSERT INTO public.empresa VALUES (2032, true, 1, '2023-07-02 12:35:23.948778', NULL, NULL, false, 'FACULDADE PECEGE (PECEGE)', 224);
INSERT INTO public.empresa VALUES (2033, true, 1, '2023-07-02 12:35:23.950118', NULL, NULL, false, 'FACULDADE PEDRO II (FAPE2)', 2);
INSERT INTO public.empresa VALUES (2034, true, 1, '2023-07-02 12:35:23.951457', NULL, NULL, false, 'FACULDADE PEDRO LEOPOLDO (FPL)', 654);
INSERT INTO public.empresa VALUES (2035, true, 1, '2023-07-02 12:35:23.952819', NULL, NULL, false, 'FACULDADE PENTÁGONO - FAPEN (FAPEN)', 47);
INSERT INTO public.empresa VALUES (2036, true, 1, '2023-07-02 12:35:23.954137', NULL, NULL, false, 'FACULDADE PERNAMBUCANA DE SAÚDE (FPS)', 60);
INSERT INTO public.empresa VALUES (2037, true, 1, '2023-07-02 12:35:23.955464', NULL, NULL, false, 'FACULDADE PERUIBE (FPBE)', 655);
INSERT INTO public.empresa VALUES (2038, true, 1, '2023-07-02 12:35:23.956627', NULL, NULL, false, 'FACULDADE PESTALOZZI DE FRANCA (FAPESF)', 179);
INSERT INTO public.empresa VALUES (2039, true, 1, '2023-07-02 12:35:23.957975', NULL, NULL, false, 'FACULDADE PETRUS (FAPETRUS)', 141);
INSERT INTO public.empresa VALUES (2040, true, 1, '2023-07-02 12:35:23.959306', NULL, NULL, false, 'FACULDADE PHORTE DE EDUCAÇÃO E TECNOLOGIA', 8);
INSERT INTO public.empresa VALUES (2041, true, 1, '2023-07-02 12:35:23.960477', NULL, NULL, false, 'FACULDADE PHYSIO CURSOS (FACPHYSIO)', 8);
INSERT INTO public.empresa VALUES (2042, true, 1, '2023-07-02 12:35:23.96168', NULL, NULL, false, 'FACULDADE PIAUIENSE DE PROCESSAMENTO DE DADOS (FPPD)', 27);
INSERT INTO public.empresa VALUES (2043, true, 1, '2023-07-02 12:35:23.963092', NULL, NULL, false, 'FACULDADE PINHALZINHO (HORUS)', 656);
INSERT INTO public.empresa VALUES (2044, true, 1, '2023-07-02 12:35:23.964758', NULL, NULL, false, 'FACULDADE PINHEIRO GUIMARÃES (FAPG)', 12);
INSERT INTO public.empresa VALUES (2045, true, 1, '2023-07-02 12:35:23.966238', NULL, NULL, false, 'FACULDADE PIO DÉCIMO (FPD)', 142);
INSERT INTO public.empresa VALUES (2046, true, 1, '2023-07-02 12:35:23.967488', NULL, NULL, false, 'FACULDADE PIO DECIMO DE CANINDE DO SAO FRANCISCO (FAPIDE)', 657);
INSERT INTO public.empresa VALUES (2047, true, 1, '2023-07-02 12:35:23.96898', NULL, NULL, false, 'FACULDADE PITÁGORAS ANHANGUERA DE TERESINA', 27);
INSERT INTO public.empresa VALUES (2048, true, 1, '2023-07-02 12:35:23.970283', NULL, NULL, false, 'FACULDADE PITAGORAS ANHANGUERA DE TRÊS LAGOAS', 658);
INSERT INTO public.empresa VALUES (2049, true, 1, '2023-07-02 12:35:23.971632', NULL, NULL, false, 'FACULDADE PITÁGORAS BACABAL MEARIM', 659);
INSERT INTO public.empresa VALUES (2050, true, 1, '2023-07-02 12:35:23.972961', NULL, NULL, false, 'FACULDADE PITÁGORAS DE ALTAMIRA', 14);
INSERT INTO public.empresa VALUES (2051, true, 1, '2023-07-02 12:35:23.974352', NULL, NULL, false, 'FACULDADE PITÁGORAS DE BACABAL', 659);
INSERT INTO public.empresa VALUES (2052, true, 1, '2023-07-02 12:35:23.975824', NULL, NULL, false, 'FACULDADE PITÁGORAS DE BELÉM', 79);
INSERT INTO public.empresa VALUES (2053, true, 1, '2023-07-02 12:35:23.977145', NULL, NULL, false, 'FACULDADE PITÁGORAS DE BRUMADO', 660);
INSERT INTO public.empresa VALUES (2054, true, 1, '2023-07-02 12:35:23.978472', NULL, NULL, false, 'FACULDADE PITÁGORAS DE CONCÓRDIA', 350);
INSERT INTO public.empresa VALUES (2055, true, 1, '2023-07-02 12:35:23.979703', NULL, NULL, false, 'FACULDADE PITAGORAS DE EUNAPOLIS (FPE)', 587);
INSERT INTO public.empresa VALUES (2056, true, 1, '2023-07-02 12:35:23.981179', NULL, NULL, false, 'FACULDADE PITÁGORAS DE IRECÊ (FPI)', 245);
INSERT INTO public.empresa VALUES (2057, true, 1, '2023-07-02 12:35:23.982506', NULL, NULL, false, 'FACULDADE PITÁGORAS DE JUIZ DE FORA (FPJF)', 38);
INSERT INTO public.empresa VALUES (2058, true, 1, '2023-07-02 12:35:23.98385', NULL, NULL, false, 'FACULDADE PITÁGORAS DE LUIS EDUARDO MAGALHÃES', 52);
INSERT INTO public.empresa VALUES (2059, true, 1, '2023-07-02 12:35:23.985199', NULL, NULL, false, 'FACULDADE PITÁGORAS DE MEDICINA DE EUNÁPOLIS', 587);
INSERT INTO public.empresa VALUES (2060, true, 1, '2023-07-02 12:35:23.986492', NULL, NULL, false, 'FACULDADE PITÁGORAS DE MOSSORÓ', 323);
INSERT INTO public.empresa VALUES (2061, true, 1, '2023-07-02 12:35:23.987825', NULL, NULL, false, 'FACULDADE PITÁGORAS DE PARANAGUÁ', 661);
INSERT INTO public.empresa VALUES (2062, true, 1, '2023-07-02 12:35:23.989168', NULL, NULL, false, 'FACULDADE PITÁGORAS DE PENÁPOLIS', 463);
INSERT INTO public.empresa VALUES (2063, true, 1, '2023-07-02 12:35:23.990503', NULL, NULL, false, 'FACULDADE PITÁGORAS DE POUSO ALEGRE (FPPA)', 230);
INSERT INTO public.empresa VALUES (2064, true, 1, '2023-07-02 12:35:23.991579', NULL, NULL, false, 'FACULDADE PITÁGORAS DE RIO VERDE', 202);
INSERT INTO public.empresa VALUES (2065, true, 1, '2023-07-02 12:35:23.992794', NULL, NULL, false, 'FACULDADE PITÁGORAS DE TUCURUÍ', 418);
INSERT INTO public.empresa VALUES (2066, true, 1, '2023-07-02 12:35:23.994099', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR ANHANGUERA DE LONDRINA', 159);
INSERT INTO public.empresa VALUES (2067, true, 1, '2023-07-02 12:35:23.99545', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE BRUMADO', 660);
INSERT INTO public.empresa VALUES (2068, true, 1, '2023-07-02 12:35:23.996807', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE CALDAS NOVAS', 387);
INSERT INTO public.empresa VALUES (2069, true, 1, '2023-07-02 12:35:23.998129', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE CANINDÉ', 588);
INSERT INTO public.empresa VALUES (2070, true, 1, '2023-07-02 12:35:23.999472', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE CHAPECÓ', 406);
INSERT INTO public.empresa VALUES (2071, true, 1, '2023-07-02 12:35:24.000811', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE GUANAMBI (FPG)', 157);
INSERT INTO public.empresa VALUES (2072, true, 1, '2023-07-02 12:35:24.002145', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE ITAJUBÁ', 103);
INSERT INTO public.empresa VALUES (2073, true, 1, '2023-07-02 12:35:24.003484', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE JOÃO PESSOA', 107);
INSERT INTO public.empresa VALUES (2074, true, 1, '2023-07-02 12:35:24.004869', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE MURIAÉ', 154);
INSERT INTO public.empresa VALUES (2075, true, 1, '2023-07-02 12:35:24.006176', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE QUIXERAMOBIM', 500);
INSERT INTO public.empresa VALUES (2076, true, 1, '2023-07-02 12:35:24.007556', NULL, NULL, false, 'FACULDADE PLUS (PLUS)', 45);
INSERT INTO public.empresa VALUES (2077, true, 1, '2023-07-02 12:35:24.009034', NULL, NULL, false, 'FACULDADE POLIENSINO - FP', 203);
INSERT INTO public.empresa VALUES (2078, true, 1, '2023-07-02 12:35:24.010388', NULL, NULL, false, 'FACULDADE PÓLIS CIVITAS', 56);
INSERT INTO public.empresa VALUES (2079, true, 1, '2023-07-02 12:35:24.011677', NULL, NULL, false, 'FACULDADE POLITÉCNICA DE CAMPINAS (POLICAMP)', 177);
INSERT INTO public.empresa VALUES (2080, true, 1, '2023-07-02 12:35:24.013093', NULL, NULL, false, 'FACULDADE POLITÉCNICA DE CAMPO GRANDE (POLITÉCNICA)', 48);
INSERT INTO public.empresa VALUES (2081, true, 1, '2023-07-02 12:35:24.014777', NULL, NULL, false, 'FACULDADE PORTO DAS ÁGUAS (FAPAG)', 662);
INSERT INTO public.empresa VALUES (2082, true, 1, '2023-07-02 12:35:24.015972', NULL, NULL, false, 'FACULDADE PORTO UNIÃO (FPU)', 8);
INSERT INTO public.empresa VALUES (2083, true, 1, '2023-07-02 12:35:24.017298', NULL, NULL, false, 'FACULDADE POSITIVO LONDRINA (FPL)', 159);
INSERT INTO public.empresa VALUES (2084, true, 1, '2023-07-02 12:35:24.018623', NULL, NULL, false, 'FACULDADE PRAIA GRANDE (FPG)', 250);
INSERT INTO public.empresa VALUES (2085, true, 1, '2023-07-02 12:35:24.019966', NULL, NULL, false, 'FACULDADE PREMIER (PREMIER)', 42);
INSERT INTO public.empresa VALUES (2086, true, 1, '2023-07-02 12:35:24.0213', NULL, NULL, false, 'FACULDADE PRESBITERIANA GAMMON (FAGAMMON)', 108);
INSERT INTO public.empresa VALUES (2087, true, 1, '2023-07-02 12:35:24.022633', NULL, NULL, false, 'FACULDADE PRESBITERIANA MACKENZIE BRASILIA (FPMB)', 5);
INSERT INTO public.empresa VALUES (2088, true, 1, '2023-07-02 12:35:24.02396', NULL, NULL, false, 'FACULDADE PRESBITERIANA MACKENZIE RIO', 12);
INSERT INTO public.empresa VALUES (2089, true, 1, '2023-07-02 12:35:24.025323', NULL, NULL, false, 'FACULDADE PRESBITERIANA QUINZE DE NOVEMBRO', 483);
INSERT INTO public.empresa VALUES (2090, true, 1, '2023-07-02 12:35:24.026649', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS (FAPAC)', 663);
INSERT INTO public.empresa VALUES (2091, true, 1, '2023-07-02 12:35:24.027984', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE AIMORÉS', 664);
INSERT INTO public.empresa VALUES (2092, true, 1, '2023-07-02 12:35:24.02935', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE BAEPENDI (FAPAC BAEPENDI)', 665);
INSERT INTO public.empresa VALUES (2093, true, 1, '2023-07-02 12:35:24.030672', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE BARÃO DE COCAIS', 666);
INSERT INTO public.empresa VALUES (2094, true, 1, '2023-07-02 12:35:24.032034', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (2095, true, 1, '2023-07-02 12:35:24.033331', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE GOVERNADOR VALADARES (FAPAC - GV )', 265);
INSERT INTO public.empresa VALUES (2096, true, 1, '2023-07-02 12:35:24.034677', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE ITABIRITO', 261);
INSERT INTO public.empresa VALUES (2097, true, 1, '2023-07-02 12:35:24.035993', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE ITANHANDU (FAPACI)', 667);
INSERT INTO public.empresa VALUES (2098, true, 1, '2023-07-02 12:35:24.037332', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE LAMBARI (FAPAC LAMBARI)', 668);
INSERT INTO public.empresa VALUES (2099, true, 1, '2023-07-02 12:35:24.038677', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE LEOPOLDINA', 669);
INSERT INTO public.empresa VALUES (2100, true, 1, '2023-07-02 12:35:24.03975', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE MARIANA (FAPAM)', 238);
INSERT INTO public.empresa VALUES (2101, true, 1, '2023-07-02 12:35:24.041197', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE NOVA LIMA', 481);
INSERT INTO public.empresa VALUES (2102, true, 1, '2023-07-02 12:35:24.042766', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE PONTE NOVA', 550);
INSERT INTO public.empresa VALUES (2103, true, 1, '2023-07-02 12:35:24.044119', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE SABARÁ (FUNEES SABARÁ)', 505);
INSERT INTO public.empresa VALUES (2104, true, 1, '2023-07-02 12:35:24.045451', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE SÃO JOÃO NEPOMUCENO', 670);
INSERT INTO public.empresa VALUES (2105, true, 1, '2023-07-02 12:35:24.046856', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE TEÓFILO OTONI', 7);
INSERT INTO public.empresa VALUES (2106, true, 1, '2023-07-02 12:35:24.048324', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBÁ', 163);
INSERT INTO public.empresa VALUES (2107, true, 1, '2023-07-02 12:35:24.049643', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBERABA', 118);
INSERT INTO public.empresa VALUES (2108, true, 1, '2023-07-02 12:35:24.05097', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBERLÂNDIA', 134);
INSERT INTO public.empresa VALUES (2109, true, 1, '2023-07-02 12:35:24.052309', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE VISCONDE DO RIO BRANCO', 671);
INSERT INTO public.empresa VALUES (2110, true, 1, '2023-07-02 12:35:24.053647', NULL, NULL, false, 'FACULDADE PRESIDENTE DUTRA (FAP)', 672);
INSERT INTO public.empresa VALUES (2111, true, 1, '2023-07-02 12:35:24.054823', NULL, NULL, false, 'FACULDADE PRIME (FAPRIME)', 48);
INSERT INTO public.empresa VALUES (2112, true, 1, '2023-07-02 12:35:24.056111', NULL, NULL, false, 'FACULDADE PRIMEIRO DE JANEIRO (FPJ)', 673);
INSERT INTO public.empresa VALUES (2113, true, 1, '2023-07-02 12:35:24.057285', NULL, NULL, false, 'FACULDADE PRIMUM (PRIMUM)', 8);
INSERT INTO public.empresa VALUES (2114, true, 1, '2023-07-02 12:35:24.058627', NULL, NULL, false, 'FACULDADE PRINCESA DO OESTE (FPO)', 673);
INSERT INTO public.empresa VALUES (2115, true, 1, '2023-07-02 12:35:24.059969', NULL, NULL, false, 'FACULDADE PRISMA DE APUCARANA (FPA)', 377);
INSERT INTO public.empresa VALUES (2116, true, 1, '2023-07-02 12:35:24.061137', NULL, NULL, false, 'FACULDADE PROFESSOR DALTRO', 12);
INSERT INTO public.empresa VALUES (2117, true, 1, '2023-07-02 12:35:24.062338', NULL, NULL, false, 'FACULDADE PROFESSOR MIGUEL ÂNGELO DA SILVA SANTOS (FEMASS)', 325);
INSERT INTO public.empresa VALUES (2118, true, 1, '2023-07-02 12:35:24.0636', NULL, NULL, false, 'FACULDADE PROFISSIONAL (FAPRO)', 56);
INSERT INTO public.empresa VALUES (2119, true, 1, '2023-07-02 12:35:24.064951', NULL, NULL, false, 'FACULDADE PROF. LUÍZ MÁRIO D''AVILA (FADAVILA)', 80);
INSERT INTO public.empresa VALUES (2120, true, 1, '2023-07-02 12:35:24.066428', NULL, NULL, false, 'FACULDADE PROF. WLADEMIR DOS SANTOS (WLASAN)', 146);
INSERT INTO public.empresa VALUES (2121, true, 1, '2023-07-02 12:35:24.067778', NULL, NULL, false, 'FACULDADE PROGRESSO (FAP)', 100);
INSERT INTO public.empresa VALUES (2122, true, 1, '2023-07-02 12:35:24.069112', NULL, NULL, false, 'FACULDADE PROJEÇÃO DE CEILÂNDIA (FAPRO)', 5);
INSERT INTO public.empresa VALUES (2123, true, 1, '2023-07-02 12:35:24.07043', NULL, NULL, false, 'FACULDADE PROJEÇÃO DE SOBRADINHO (FAPRO)', 5);
INSERT INTO public.empresa VALUES (2124, true, 1, '2023-07-02 12:35:24.071777', NULL, NULL, false, 'FACULDADE PROJEÇÃO DE TAGUATINGA NORTE (FAPRO)', 5);
INSERT INTO public.empresa VALUES (2125, true, 1, '2023-07-02 12:35:24.073174', NULL, NULL, false, 'FACULDADE PROJEÇÃO DO GUARÁ', 5);
INSERT INTO public.empresa VALUES (2126, true, 1, '2023-07-02 12:35:24.074627', NULL, NULL, false, 'FACULDADE PROMINAS DE CONTAGEM (PROMINAS)', 200);
INSERT INTO public.empresa VALUES (2127, true, 1, '2023-07-02 12:35:24.075987', NULL, NULL, false, 'FACULDADE PROMINAS DE MONTES CLAROS (PROMINAS)', 128);
INSERT INTO public.empresa VALUES (2128, true, 1, '2023-07-02 12:35:24.077288', NULL, NULL, false, 'FACULDADE PROMINAS DE TIMÓTEO (PROMINAS)', 352);
INSERT INTO public.empresa VALUES (2129, true, 1, '2023-07-02 12:35:24.078627', NULL, NULL, false, 'FACULDADE PROMOVE DE ALFENAS', 674);
INSERT INTO public.empresa VALUES (2130, true, 1, '2023-07-02 12:35:24.080058', NULL, NULL, false, 'FACULDADE PROMOVE DE BELO HORIZONTE (PROMOVE)', 2);
INSERT INTO public.empresa VALUES (2131, true, 1, '2023-07-02 12:35:24.081364', NULL, NULL, false, 'FACULDADE PROMOVE DE CURVELO (FACURVELO)', 301);
INSERT INTO public.empresa VALUES (2132, true, 1, '2023-07-02 12:35:24.082661', NULL, NULL, false, 'FACULDADE PROMOVE DE MINAS GERAIS (PROMOVE)', 2);
INSERT INTO public.empresa VALUES (2133, true, 1, '2023-07-02 12:35:24.083987', NULL, NULL, false, 'FACULDADE PROMOVE DE SÃO PAULO (FPSP)', 8);
INSERT INTO public.empresa VALUES (2134, true, 1, '2023-07-02 12:35:24.085326', NULL, NULL, false, 'FACULDADE PROMOVE DE SETE LAGOAS (FSLMG)', 24);
INSERT INTO public.empresa VALUES (2135, true, 1, '2023-07-02 12:35:24.086505', NULL, NULL, false, 'FACULDADE PROMOVE DE TECNOLOGIA (FPTEC)', 2);
INSERT INTO public.empresa VALUES (2136, true, 1, '2023-07-02 12:35:24.087578', NULL, NULL, false, 'FACULDADE PSICOLOG (FAPSI)', 58);
INSERT INTO public.empresa VALUES (2137, true, 1, '2023-07-02 12:35:24.088913', NULL, NULL, false, 'FACULDADE QI BRASIL (FAQI)', 344);
INSERT INTO public.empresa VALUES (2138, true, 1, '2023-07-02 12:35:24.090098', NULL, NULL, false, 'FACULDADE QUALITTAS (QUALITTAS)', 8);
INSERT INTO public.empresa VALUES (2139, true, 1, '2023-07-02 12:35:24.091275', NULL, NULL, false, 'FACULDADE QUALITTAS - EAD', 8);
INSERT INTO public.empresa VALUES (2140, true, 1, '2023-07-02 12:35:24.092604', NULL, NULL, false, 'FACULDADE QUIRINÓPOLIS (FAQUI)', 621);
INSERT INTO public.empresa VALUES (2141, true, 1, '2023-07-02 12:35:24.093929', NULL, NULL, false, 'FACULDADE RACHEL DE QUEIROZ (FAQ)', 188);
INSERT INTO public.empresa VALUES (2142, true, 1, '2023-07-02 12:35:24.095302', NULL, NULL, false, 'FACULDADE RAIMUNDO MARINHO (FRM)', 73);
INSERT INTO public.empresa VALUES (2143, true, 1, '2023-07-02 12:35:24.09667', NULL, NULL, false, 'FACULDADE RAIMUNDO MARINHO DE PENEDO', 492);
INSERT INTO public.empresa VALUES (2144, true, 1, '2023-07-02 12:35:24.098382', NULL, NULL, false, 'FACULDADE REALIZA', 41);
INSERT INTO public.empresa VALUES (2145, true, 1, '2023-07-02 12:35:24.100073', NULL, NULL, false, 'FACULDADE REBOUÇAS DE CAMPINA GRANDE (FRCG)', 147);
INSERT INTO public.empresa VALUES (2146, true, 1, '2023-07-02 12:35:24.101515', NULL, NULL, false, 'FACULDADE RECONHECER (FR)', 42);
INSERT INTO public.empresa VALUES (2147, true, 1, '2023-07-02 12:35:24.102836', NULL, NULL, false, 'FACULDADE REFIDIM (REFIDIM)', 68);
INSERT INTO public.empresa VALUES (2148, true, 1, '2023-07-02 12:35:24.104193', NULL, NULL, false, 'FACULDADE REGES DE DRACENA', 435);
INSERT INTO public.empresa VALUES (2149, true, 1, '2023-07-02 12:35:24.105502', NULL, NULL, false, 'FACULDADE REGES DE JUNQUEIRÓPOLIS', 675);
INSERT INTO public.empresa VALUES (2150, true, 1, '2023-07-02 12:35:24.10687', NULL, NULL, false, 'FACULDADE REGES DE OSVALDO CRUZ', 676);
INSERT INTO public.empresa VALUES (2151, true, 1, '2023-07-02 12:35:24.108503', NULL, NULL, false, 'FACULDADE REGES DE REALEZA', 677);
INSERT INTO public.empresa VALUES (2152, true, 1, '2023-07-02 12:35:24.109921', NULL, NULL, false, 'FACULDADE REGES DE RIBEIRÃO PRETO', 58);
INSERT INTO public.empresa VALUES (2153, true, 1, '2023-07-02 12:35:24.111407', NULL, NULL, false, 'FACULDADE REGES DE TUPI PAULISTA', 678);
INSERT INTO public.empresa VALUES (2154, true, 1, '2023-07-02 12:35:24.112654', NULL, NULL, false, 'FACULDADE REGIONAL DE FILOSOFIA, CIÊNCIAS E LETRAS DE CANDEIAS (FAC)', 679);
INSERT INTO public.empresa VALUES (2155, true, 1, '2023-07-02 12:35:24.114259', NULL, NULL, false, 'FACULDADE REGIONAL DE LEOPOLDINA', 669);
INSERT INTO public.empresa VALUES (2156, true, 1, '2023-07-02 12:35:24.116006', NULL, NULL, false, 'FACULDADE REGIONAL DE MINAS GERAIS (FACMINAS)', 680);
INSERT INTO public.empresa VALUES (2157, true, 1, '2023-07-02 12:35:24.117298', NULL, NULL, false, 'FACULDADE REGIONAL DE RIACHÃO DO JACUÍPE (FARJ)', 681);
INSERT INTO public.empresa VALUES (2158, true, 1, '2023-07-02 12:35:24.118616', NULL, NULL, false, 'FACULDADE REGIONAL DO AMAZONAS (FAM)', 75);
INSERT INTO public.empresa VALUES (2159, true, 1, '2023-07-02 12:35:24.119951', NULL, NULL, false, 'FACULDADE REGIONAL DO CENTRO SUL DE SERGIPE (FARSUL)', 682);
INSERT INTO public.empresa VALUES (2160, true, 1, '2023-07-02 12:35:24.121291', NULL, NULL, false, 'FACULDADE REGIONAL DO JACUÍPE (FARJ)', 403);
INSERT INTO public.empresa VALUES (2161, true, 1, '2023-07-02 12:35:24.122458', NULL, NULL, false, 'FACULDADE REGIONAL JAGUARIBANA (FRJ)', 683);
INSERT INTO public.empresa VALUES (2162, true, 1, '2023-07-02 12:35:24.123632', NULL, NULL, false, 'FACULDADE REGIONAL PALMITOS (FAP)', 684);
INSERT INTO public.empresa VALUES (2163, true, 1, '2023-07-02 12:35:24.124976', NULL, NULL, false, 'FACULDADE REHAGRO (REHAGRO)', 2);
INSERT INTO public.empresa VALUES (2164, true, 1, '2023-07-02 12:35:24.126325', NULL, NULL, false, 'FACULDADE REPUBLICANA', 5);
INSERT INTO public.empresa VALUES (2165, true, 1, '2023-07-02 12:35:24.127655', NULL, NULL, false, 'FACULDADE RESULTADOS (FR)', 48);
INSERT INTO public.empresa VALUES (2166, true, 1, '2023-07-02 12:35:24.129009', NULL, NULL, false, 'FACULDADE RHEMA (FACUR)', 611);
INSERT INTO public.empresa VALUES (2167, true, 1, '2023-07-02 12:35:24.130364', NULL, NULL, false, 'FACULDADE RIO GUARIBAS (FARG)', 643);
INSERT INTO public.empresa VALUES (2168, true, 1, '2023-07-02 12:35:24.131828', NULL, NULL, false, 'FACULDADE RIO PARNAÍBA (FARP)', 456);
INSERT INTO public.empresa VALUES (2169, true, 1, '2023-07-02 12:35:24.133159', NULL, NULL, false, 'FACULDADE RIO SONO (RISO)', 685);
INSERT INTO public.empresa VALUES (2170, true, 1, '2023-07-02 12:35:24.134485', NULL, NULL, false, 'FACULDADE ROBERTO MIRANDA (FRM SP)', 8);
INSERT INTO public.empresa VALUES (2171, true, 1, '2023-07-02 12:35:24.135823', NULL, NULL, false, 'FACULDADE RODOLFO TEÓFILO (FRT)', 45);
INSERT INTO public.empresa VALUES (2172, true, 1, '2023-07-02 12:35:24.13675', NULL, NULL, false, 'FACULDADE RUDOLF STEINER (FRS)', 8);
INSERT INTO public.empresa VALUES (2173, true, 1, '2023-07-02 12:35:24.138086', NULL, NULL, false, 'FACULDADE SABERES (SABERES)', 25);
INSERT INTO public.empresa VALUES (2174, true, 1, '2023-07-02 12:35:24.139456', NULL, NULL, false, 'FACULDADES AGGEU MAGALHÃES (FAMA)', 398);
INSERT INTO public.empresa VALUES (2175, true, 1, '2023-07-02 12:35:24.140936', NULL, NULL, false, 'FACULDADE SAGRADA FAMÍLIA (FASF)', 188);
INSERT INTO public.empresa VALUES (2176, true, 1, '2023-07-02 12:35:24.142276', NULL, NULL, false, 'FACULDADE SALESIANA DE SANTA TERESA (FSST)', 686);
INSERT INTO public.empresa VALUES (2177, true, 1, '2023-07-02 12:35:24.143608', NULL, NULL, false, 'FACULDADE SALESIANA DOM BOSCO (FSDB)', 75);
INSERT INTO public.empresa VALUES (2178, true, 1, '2023-07-02 12:35:24.144951', NULL, NULL, false, 'FACULDADE SALESIANA DO NORDESTE (FASNE)', 60);
INSERT INTO public.empresa VALUES (2179, true, 1, '2023-07-02 12:35:24.146406', NULL, NULL, false, 'FACULDADE SANAR (SANAR)', 116);
INSERT INTO public.empresa VALUES (2180, true, 1, '2023-07-02 12:35:24.147854', NULL, NULL, false, 'FACULDADE SANTA CASA (FSC)', 116);
INSERT INTO public.empresa VALUES (2181, true, 1, '2023-07-02 12:35:24.149121', NULL, NULL, false, 'FACULDADE SANTA CASA DE BELO HORIZONTE (FSCBH)', 2);
INSERT INTO public.empresa VALUES (2182, true, 1, '2023-07-02 12:35:24.150466', NULL, NULL, false, 'FACULDADE SANTA CRUZ (FACRUZ)', 687);
INSERT INTO public.empresa VALUES (2183, true, 1, '2023-07-02 12:35:24.151635', NULL, NULL, false, 'FACULDADE SANTA FÉ (CESSF)', 141);
INSERT INTO public.empresa VALUES (2184, true, 1, '2023-07-02 12:35:24.152801', NULL, NULL, false, 'FACULDADE SANTA HELENA (FSH)', 60);
INSERT INTO public.empresa VALUES (2185, true, 1, '2023-07-02 12:35:24.154155', NULL, NULL, false, 'FACULDADE SANTA LÚCIA (FCACSL)', 642);
INSERT INTO public.empresa VALUES (2186, true, 1, '2023-07-02 12:35:24.155485', NULL, NULL, false, 'FACULDADE SANTA LUZIA (FSL)', 507);
INSERT INTO public.empresa VALUES (2187, true, 1, '2023-07-02 12:35:24.156784', NULL, NULL, false, 'FACULDADE SANTA MARCELINA (FASM)', 8);
INSERT INTO public.empresa VALUES (2188, true, 1, '2023-07-02 12:35:24.158126', NULL, NULL, false, 'FACULDADE SANTA MARCELINA MURIAÉ - FASM (FASM)', 154);
INSERT INTO public.empresa VALUES (2189, true, 1, '2023-07-02 12:35:24.159289', NULL, NULL, false, 'FACULDADE SANTA MARIA (FASAMP)', 688);
INSERT INTO public.empresa VALUES (2190, true, 1, '2023-07-02 12:35:24.160201', NULL, NULL, false, 'FACULDADE SANTANA', 242);
INSERT INTO public.empresa VALUES (2191, true, 1, '2023-07-02 12:35:24.16155', NULL, NULL, false, 'FACULDADE SANT ANA (IESSA)', 188);
INSERT INTO public.empresa VALUES (2192, true, 1, '2023-07-02 12:35:24.162893', NULL, NULL, false, 'FACULDADE SANTA RITA (FASAR)', 689);
INSERT INTO public.empresa VALUES (2193, true, 1, '2023-07-02 12:35:24.164265', NULL, NULL, false, 'FACULDADE SANTA RITA DE CÁSSIA (IFASC)', 234);
INSERT INTO public.empresa VALUES (2194, true, 1, '2023-07-02 12:35:24.165587', NULL, NULL, false, 'FACULDADE SANTA RITA DE CHAPECÓ', 406);
INSERT INTO public.empresa VALUES (2195, true, 1, '2023-07-02 12:35:24.166916', NULL, NULL, false, 'FACULDADE SANTA TERESA', 75);
INSERT INTO public.empresa VALUES (2196, true, 1, '2023-07-02 12:35:24.16825', NULL, NULL, false, 'FACULDADE SANTA TEREZINHA (CEST)', 141);
INSERT INTO public.empresa VALUES (2197, true, 1, '2023-07-02 12:35:24.169649', NULL, NULL, false, 'FACULDADE SANTISSIMA TRINDADE (FAST)', 690);
INSERT INTO public.empresa VALUES (2198, true, 1, '2023-07-02 12:35:24.171166', NULL, NULL, false, 'FACULDADE SANTÍSSIMO SACRAMENTO (FSSS)', 213);
INSERT INTO public.empresa VALUES (2199, true, 1, '2023-07-02 12:35:24.172753', NULL, NULL, false, 'FACULDADE SANTO AGOSTINHO (FACSA)', 691);
INSERT INTO public.empresa VALUES (2200, true, 1, '2023-07-02 12:35:24.174359', NULL, NULL, false, 'FACULDADE SANTO AGOSTINHO DE ITABUNA (FASAI)', 269);
INSERT INTO public.empresa VALUES (2201, true, 1, '2023-07-02 12:35:24.175809', NULL, NULL, false, 'FACULDADE SANTO AGOSTINHO DE SETE LAGOAS (FASASETE)', 24);
INSERT INTO public.empresa VALUES (2202, true, 1, '2023-07-02 12:35:24.177128', NULL, NULL, false, 'FACULDADE SANTO AGOSTINHO DE VITÓRIA DA CONQUISTA (FASAVIC)', 37);
INSERT INTO public.empresa VALUES (2203, true, 1, '2023-07-02 12:35:24.178465', NULL, NULL, false, 'FACULDADE SANTO ANDRÉ (FASA)', 355);
INSERT INTO public.empresa VALUES (2204, true, 1, '2023-07-02 12:35:24.179921', NULL, NULL, false, 'FACULDADE SANTO ANTONIO (FSA)', 213);
INSERT INTO public.empresa VALUES (2205, true, 1, '2023-07-02 12:35:24.181364', NULL, NULL, false, 'FACULDADE SANTO ANTÔNIO (FSA)', 692);
INSERT INTO public.empresa VALUES (2206, true, 1, '2023-07-02 12:35:24.182637', NULL, NULL, false, 'FACULDADE SANTO ANTÔNIO DE FEIRA DE SANTANA (FSAF)', 99);
INSERT INTO public.empresa VALUES (2207, true, 1, '2023-07-02 12:35:24.183794', NULL, NULL, false, 'FACULDADE SANTO ANTONIO DE ITABUNA (FSAI)', 269);
INSERT INTO public.empresa VALUES (2208, true, 1, '2023-07-02 12:35:24.184883', NULL, NULL, false, 'FACULDADE SANTO ANTÔNIO DE PÁDUA (FASAP)', 447);
INSERT INTO public.empresa VALUES (2209, true, 1, '2023-07-02 12:35:24.186219', NULL, NULL, false, 'FACULDADE SANTO ANTONIO DE QUEIMADAS (FSAQ)', 693);
INSERT INTO public.empresa VALUES (2210, true, 1, '2023-07-02 12:35:24.18741', NULL, NULL, false, 'FACULDADE SANTO ANTÔNIO - SJC (FSA)', 144);
INSERT INTO public.empresa VALUES (2211, true, 1, '2023-07-02 12:35:24.188729', NULL, NULL, false, 'FACULDADE SANTOS DUMONT (FSD)', 694);
INSERT INTO public.empresa VALUES (2212, true, 1, '2023-07-02 12:35:24.190066', NULL, NULL, false, 'FACULDADE SÃO BASÍLIO MAGNO (FASBAM)', 56);
INSERT INTO public.empresa VALUES (2213, true, 1, '2023-07-02 12:35:24.191246', NULL, NULL, false, 'FACULDADE SÃO BENTO DA BAHIA (FSBB)', 116);
INSERT INTO public.empresa VALUES (2214, true, 1, '2023-07-02 12:35:24.192581', NULL, NULL, false, 'FACULDADE SÃO BENTO DO RIO DE JANEIRO (FSB/RJ)', 12);
INSERT INTO public.empresa VALUES (2215, true, 1, '2023-07-02 12:35:24.193913', NULL, NULL, false, 'FACULDADE SÃO CAMILO (FASC)', 12);
INSERT INTO public.empresa VALUES (2216, true, 1, '2023-07-02 12:35:24.19526', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DA PARAÍBA (FASP)', 189);
INSERT INTO public.empresa VALUES (2217, true, 1, '2023-07-02 12:35:24.196674', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DA PARAÍBA CAMPINA GRANDE', 147);
INSERT INTO public.empresa VALUES (2218, true, 1, '2023-07-02 12:35:24.198132', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DE ASSIS (FSFA)', 149);
INSERT INTO public.empresa VALUES (2219, true, 1, '2023-07-02 12:35:24.199495', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DE CAJAZEIRAS (FSF)', 189);
INSERT INTO public.empresa VALUES (2220, true, 1, '2023-07-02 12:35:24.2008', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DO CEARÁ (FASC)', 332);
INSERT INTO public.empresa VALUES (2221, true, 1, '2023-07-02 12:35:24.202097', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DO CEARÁ - CRATO (FASC)', 310);
INSERT INTO public.empresa VALUES (2222, true, 1, '2023-07-02 12:35:24.203448', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO XAVIER (FACSFX)', 268);
INSERT INTO public.empresa VALUES (2223, true, 1, '2023-07-02 12:35:24.204802', NULL, NULL, false, 'FACULDADE SÃO JOAQUIM DA BARRA', 514);
INSERT INTO public.empresa VALUES (2224, true, 1, '2023-07-02 12:35:24.206209', NULL, NULL, false, 'FACULDADE SÃO JUDAS DE GUARULHOS', 100);
INSERT INTO public.empresa VALUES (2225, true, 1, '2023-07-02 12:35:24.207634', NULL, NULL, false, 'FACULDADE SÃO JUDAS DE SÃO BERNARDO DO CAMPO', 82);
INSERT INTO public.empresa VALUES (2226, true, 1, '2023-07-02 12:35:24.208551', NULL, NULL, false, 'FACULDADE SÃO JUDAS DE TERRA BOA (FSJ)', 695);
INSERT INTO public.empresa VALUES (2227, true, 1, '2023-07-02 12:35:24.209902', NULL, NULL, false, 'FACULDADE SÃO JUDAS TADEU (FSJT)', 12);
INSERT INTO public.empresa VALUES (2228, true, 1, '2023-07-02 12:35:24.211234', NULL, NULL, false, 'FACULDADE SÃO LEOPOLDO MANDIC', 177);
INSERT INTO public.empresa VALUES (2229, true, 1, '2023-07-02 12:35:24.212577', NULL, NULL, false, 'FACULDADE SÃO LEOPOLDO MANDIC DE ARARAS (SLMANDIC-ARARAS)', 83);
INSERT INTO public.empresa VALUES (2230, true, 1, '2023-07-02 12:35:24.214097', NULL, NULL, false, 'FACULDADE SÃO LEOPOLDO MANDIC DE LIMEIRA (SLM LIMEIRA)', 276);
INSERT INTO public.empresa VALUES (2231, true, 1, '2023-07-02 12:35:24.215585', NULL, NULL, false, 'FACULDADE SÃO LUÍS (FSL)', 94);
INSERT INTO public.empresa VALUES (2232, true, 1, '2023-07-02 12:35:24.21691', NULL, NULL, false, 'FACULDADE SÃO LUÍS DE FRANÇA (FSLF)', 142);
INSERT INTO public.empresa VALUES (2233, true, 1, '2023-07-02 12:35:24.218263', NULL, NULL, false, 'FACULDADE SÃO MARCOS (FASAMAR)', 663);
INSERT INTO public.empresa VALUES (2234, true, 1, '2023-07-02 12:35:24.219591', NULL, NULL, false, 'FACULDADE SÃO PAULO DE PRESIDENTE VENCESLAU (FASPREV)', 498);
INSERT INTO public.empresa VALUES (2235, true, 1, '2023-07-02 12:35:24.220928', NULL, NULL, false, 'FACULDADE SÃO SALVADOR (FSS)', 116);
INSERT INTO public.empresa VALUES (2236, true, 1, '2023-07-02 12:35:24.222273', NULL, NULL, false, 'FACULDADE SÃO SEBASTIÃO', 530);
INSERT INTO public.empresa VALUES (2237, true, 1, '2023-07-02 12:35:24.223597', NULL, NULL, false, 'FACULDADE SÃO TOMÁS DE AQUINO (FACESTA)', 334);
INSERT INTO public.empresa VALUES (2238, true, 1, '2023-07-02 12:35:24.224941', NULL, NULL, false, 'FACULDADE SÃO TOMÁS DE AQUINO DE NOVA LIMA (FACTAN)', 481);
INSERT INTO public.empresa VALUES (2239, true, 1, '2023-07-02 12:35:24.226252', NULL, NULL, false, 'FACULDADE SÃO TOMAZ DE AQUINO (FSTA)', 116);
INSERT INTO public.empresa VALUES (2240, true, 1, '2023-07-02 12:35:24.2276', NULL, NULL, false, 'FACULDADE SÃO VICENTE (FASVIPA)', 696);
INSERT INTO public.empresa VALUES (2241, true, 1, '2023-07-02 12:35:24.228928', NULL, NULL, false, 'FACULDADE SÃO VICENTE DE IRATI (FASVI)', 697);
INSERT INTO public.empresa VALUES (2242, true, 1, '2023-07-02 12:35:24.230292', NULL, NULL, false, 'FACULDADE SAPIENS (SAPIENS)', 51);
INSERT INTO public.empresa VALUES (2243, true, 1, '2023-07-02 12:35:24.232111', NULL, NULL, false, 'FACULDADES ASSOCIADAS DE UBERABA - FAZU (FAZU)', 118);
INSERT INTO public.empresa VALUES (2244, true, 1, '2023-07-02 12:35:24.233448', NULL, NULL, false, 'FACULDADES BATISTA DO PARANÁ (FABAPAR)', 56);
INSERT INTO public.empresa VALUES (2245, true, 1, '2023-07-02 12:35:24.234718', NULL, NULL, false, 'FACULDADES DE CAMPINAS (FACAMP)', 177);
INSERT INTO public.empresa VALUES (2246, true, 1, '2023-07-02 12:35:24.236052', NULL, NULL, false, 'FACULDADES DE CIÊNCIAS E TECNOLOGIA DO NORDESTE LTDA (FACINE)', 45);
INSERT INTO public.empresa VALUES (2247, true, 1, '2023-07-02 12:35:24.237404', NULL, NULL, false, 'FACULDADES DE DRACENA', 435);
INSERT INTO public.empresa VALUES (2248, true, 1, '2023-07-02 12:35:24.238876', NULL, NULL, false, 'FACULDADES DE INOVAÇÃO E TECNOLOGIA DE MINAS GERAIS (FIT MG)', 307);
INSERT INTO public.empresa VALUES (2249, true, 1, '2023-07-02 12:35:24.240437', NULL, NULL, false, 'FACULDADES DOCTUM DE CARATINGA (DOCTUM )', 95);
INSERT INTO public.empresa VALUES (2250, true, 1, '2023-07-02 12:35:24.241926', NULL, NULL, false, 'FACULDADES DOCTUM DE GUARAPARI (DOCTUM)', 266);
INSERT INTO public.empresa VALUES (2251, true, 1, '2023-07-02 12:35:24.243284', NULL, NULL, false, 'FACULDADES DOCTUM DE IPATINGA', 268);
INSERT INTO public.empresa VALUES (2252, true, 1, '2023-07-02 12:35:24.244807', NULL, NULL, false, 'FACULDADES DO VALE DO ARARANGUA - FVA (FVA)', 698);
INSERT INTO public.empresa VALUES (2253, true, 1, '2023-07-02 12:35:24.246403', NULL, NULL, false, 'FACULDADE SEB DE RIBEIRÃO PRETO (SEBRP)', 58);
INSERT INTO public.empresa VALUES (2254, true, 1, '2023-07-02 12:35:24.248099', NULL, NULL, false, 'FACULDADE SEB LAFAIETE (SEBLF)', 58);
INSERT INTO public.empresa VALUES (2255, true, 1, '2023-07-02 12:35:24.249863', NULL, NULL, false, 'FACULDADE SEBRAE', 8);
INSERT INTO public.empresa VALUES (2256, true, 1, '2023-07-02 12:35:24.25133', NULL, NULL, false, 'FACULDADE SENAC BLUMENAU (SENAC)', 193);
INSERT INTO public.empresa VALUES (2257, true, 1, '2023-07-02 12:35:24.252818', NULL, NULL, false, 'FACULDADE SENAC CAÇADOR (SENAC)', 699);
INSERT INTO public.empresa VALUES (2258, true, 1, '2023-07-02 12:35:24.254143', NULL, NULL, false, 'FACULDADE SENAC CEARA (SENACCE)', 45);
INSERT INTO public.empresa VALUES (2259, true, 1, '2023-07-02 12:35:24.255476', NULL, NULL, false, 'FACULDADE SENAC CHAPECÓ (SENAC)', 406);
INSERT INTO public.empresa VALUES (2260, true, 1, '2023-07-02 12:35:24.256808', NULL, NULL, false, 'FACULDADE SENAC CONCÓRDIA', 350);
INSERT INTO public.empresa VALUES (2261, true, 1, '2023-07-02 12:35:24.258137', NULL, NULL, false, 'FACULDADE SENAC CRICIÚMA (SENAC CRICIÚMA)', 192);
INSERT INTO public.empresa VALUES (2262, true, 1, '2023-07-02 12:35:24.259216', NULL, NULL, false, 'FACULDADE SENAC FLORIANÓPOLIS (SENAC FLORIANÓPOLIS)', 3);
INSERT INTO public.empresa VALUES (2263, true, 1, '2023-07-02 12:35:24.260557', NULL, NULL, false, 'FACULDADE SENAC GOIÁS (FACSENACGO)', 42);
INSERT INTO public.empresa VALUES (2264, true, 1, '2023-07-02 12:35:24.261734', NULL, NULL, false, 'FACULDADE SENAC JARAGUÁ DO SUL', 31);
INSERT INTO public.empresa VALUES (2265, true, 1, '2023-07-02 12:35:24.262944', NULL, NULL, false, 'FACULDADE SENAC MINAS (FSM)', 200);
INSERT INTO public.empresa VALUES (2266, true, 1, '2023-07-02 12:35:24.264406', NULL, NULL, false, 'FACULDADE SENAC PALHOÇA (SENAC PALHOÇA)', 544);
INSERT INTO public.empresa VALUES (2267, true, 1, '2023-07-02 12:35:24.265999', NULL, NULL, false, 'FACULDADE SENAC PERNAMBUCO (SENACPE)', 60);
INSERT INTO public.empresa VALUES (2268, true, 1, '2023-07-02 12:35:24.267447', NULL, NULL, false, 'FACULDADE SENAC SÃO MIGUEL DO OESTE', 700);
INSERT INTO public.empresa VALUES (2269, true, 1, '2023-07-02 12:35:24.268777', NULL, NULL, false, 'FACULDADE SENAC TUBARÃO', 701);
INSERT INTO public.empresa VALUES (2270, true, 1, '2023-07-02 12:35:24.270152', NULL, NULL, false, 'FACULDADE SENAI-CETIQT (SENAI-CETIQT)', 12);
INSERT INTO public.empresa VALUES (2271, true, 1, '2023-07-02 12:35:24.271519', NULL, NULL, false, 'FACULDADE SENAI DA PARAÍBA', 107);
INSERT INTO public.empresa VALUES (2272, true, 1, '2023-07-02 12:35:24.27304', NULL, NULL, false, 'FACULDADE SENAI DE CONSTRUÇÃO', 48);
INSERT INTO public.empresa VALUES (2273, true, 1, '2023-07-02 12:35:24.274457', NULL, NULL, false, 'FACULDADE SENAI DE TECNOLOGIA MECATRÔNICA (SENAI)', 126);
INSERT INTO public.empresa VALUES (2274, true, 1, '2023-07-02 12:35:24.275635', NULL, NULL, false, 'FACULDADE SENAI RIO', 12);
INSERT INTO public.empresa VALUES (2275, true, 1, '2023-07-02 12:35:24.276935', NULL, NULL, false, 'FACULDADE SENAI SÃO PAULO (SENAI SP)', 8);
INSERT INTO public.empresa VALUES (2276, true, 1, '2023-07-02 12:35:24.278292', NULL, NULL, false, 'FACULDADE SENSU (FAS)', 42);
INSERT INTO public.empresa VALUES (2277, true, 1, '2023-07-02 12:35:24.279691', NULL, NULL, false, 'FACULDADE SEQÜENCIAL', 8);
INSERT INTO public.empresa VALUES (2278, true, 1, '2023-07-02 12:35:24.281584', NULL, NULL, false, 'FACULDADE SERGIPANA (FASER)', 142);
INSERT INTO public.empresa VALUES (2279, true, 1, '2023-07-02 12:35:24.283335', NULL, NULL, false, 'FACULDADE SERRA DA MESA (FASEM)', 702);
INSERT INTO public.empresa VALUES (2280, true, 1, '2023-07-02 12:35:24.284397', NULL, NULL, false, 'FACULDADE SERRA DO CARMO (FASEC)', 23);
INSERT INTO public.empresa VALUES (2281, true, 1, '2023-07-02 12:35:24.285746', NULL, NULL, false, 'FACULDADE SERRA DOURADA', 14);
INSERT INTO public.empresa VALUES (2282, true, 1, '2023-07-02 12:35:24.287114', NULL, NULL, false, 'FACULDADE SERRA GERAL (FASG)', 407);
INSERT INTO public.empresa VALUES (2283, true, 1, '2023-07-02 12:35:24.288439', NULL, NULL, false, 'FACULDADE SESI-SP DE EDUCAÇÃO (FASESP)', 8);
INSERT INTO public.empresa VALUES (2284, true, 1, '2023-07-02 12:35:24.289777', NULL, NULL, false, 'FACULDADES EST (EST)', 703);
INSERT INTO public.empresa VALUES (2285, true, 1, '2023-07-02 12:35:24.291118', NULL, NULL, false, 'FACULDADE SETE LAGOAS (FACSETE)', 24);
INSERT INTO public.empresa VALUES (2286, true, 1, '2023-07-02 12:35:24.292435', NULL, NULL, false, 'FACULDADES EVANGÉLICAS INTEGRADAS CANTARES DE SALOMÃO (FEICS)', 203);
INSERT INTO public.empresa VALUES (2287, true, 1, '2023-07-02 12:35:24.293777', NULL, NULL, false, 'FACULDADES FAMEP (FAMEP)', 704);
INSERT INTO public.empresa VALUES (2288, true, 1, '2023-07-02 12:35:24.295336', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE EUCLIDES DA CUNHA - BA (FAMEP)', 705);
INSERT INTO public.empresa VALUES (2289, true, 1, '2023-07-02 12:35:24.29667', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE FORTALEZA CE (FAMEP)', 45);
INSERT INTO public.empresa VALUES (2290, true, 1, '2023-07-02 12:35:24.298024', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE IRARÁ - BA (FAMEP)', 706);
INSERT INTO public.empresa VALUES (2291, true, 1, '2023-07-02 12:35:24.29967', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE LAGO DA PEDRA - MA (FAMEP)', 707);
INSERT INTO public.empresa VALUES (2292, true, 1, '2023-07-02 12:35:24.301169', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE PARNAÍBA - PI (FAMEP)', 176);
INSERT INTO public.empresa VALUES (2293, true, 1, '2023-07-02 12:35:24.302701', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE TERESINA - P (FAMEP)', 27);
INSERT INTO public.empresa VALUES (2294, true, 1, '2023-07-02 12:35:24.303994', NULL, NULL, false, 'FACULDADES FAMEP - UNIDADE URUÇUI - PI (FAMEP)', 708);
INSERT INTO public.empresa VALUES (2295, true, 1, '2023-07-02 12:35:24.305419', NULL, NULL, false, 'FACULDADES FATIFAJAR - FATIFAJAR ARAPOTI', 709);
INSERT INTO public.empresa VALUES (2296, true, 1, '2023-07-02 12:35:24.306928', NULL, NULL, false, 'FACULDADES IDAAM (IDAAM)', 75);
INSERT INTO public.empresa VALUES (2297, true, 1, '2023-07-02 12:35:24.308375', NULL, NULL, false, 'FACULDADE SIGMA (SIGMA EAD)', 710);
INSERT INTO public.empresa VALUES (2298, true, 1, '2023-07-02 12:35:24.309598', NULL, NULL, false, 'FACULDADE SILVA NETO (FASINE)', 5);
INSERT INTO public.empresa VALUES (2299, true, 1, '2023-07-02 12:35:24.310935', NULL, NULL, false, 'FACULDADES IMPACTOS BRASIL (FACIB)', 203);
INSERT INTO public.empresa VALUES (2300, true, 1, '2023-07-02 12:35:24.312321', NULL, NULL, false, 'FACULDADE SINERGIA (SINERGIA)', 711);
INSERT INTO public.empresa VALUES (2301, true, 1, '2023-07-02 12:35:24.313845', NULL, NULL, false, 'FACULDADE SINOP (FASIP)', 155);
INSERT INTO public.empresa VALUES (2302, true, 1, '2023-07-02 12:35:24.315386', NULL, NULL, false, 'FACULDADE SINPAIN (SINPAIN)', 8);
INSERT INTO public.empresa VALUES (2303, true, 1, '2023-07-02 12:35:24.316856', NULL, NULL, false, 'FACULDADES INTEGRADAS ADVENTISTAS DE MINAS GERAIS (FADMINAS)', 108);
INSERT INTO public.empresa VALUES (2304, true, 1, '2023-07-02 12:35:24.318339', NULL, NULL, false, 'FACULDADES INTEGRADAS APARÍCIO CARVALHO VILHENA (FIMCAVILHENA)', 355);
INSERT INTO public.empresa VALUES (2305, true, 1, '2023-07-02 12:35:24.31969', NULL, NULL, false, 'FACULDADES INTEGRADAS ASMEC (ASMEC)', 712);
INSERT INTO public.empresa VALUES (2306, true, 1, '2023-07-02 12:35:24.321026', NULL, NULL, false, 'FACULDADES INTEGRADAS CAMÕES (FICA)', 56);
INSERT INTO public.empresa VALUES (2307, true, 1, '2023-07-02 12:35:24.322543', NULL, NULL, false, 'FACULDADES INTEGRADAS CAMPO-GRANDENSES (FIC)', 12);
INSERT INTO public.empresa VALUES (2308, true, 1, '2023-07-02 12:35:24.324027', NULL, NULL, false, 'FACULDADES INTEGRADAS CAMPOS SALLES (FICS)', 8);
INSERT INTO public.empresa VALUES (2309, true, 1, '2023-07-02 12:35:24.325334', NULL, NULL, false, 'FACULDADES INTEGRADAS CESUMAR DE ARAPONGAS (CESUMAR)', 611);
INSERT INTO public.empresa VALUES (2310, true, 1, '2023-07-02 12:35:24.326675', NULL, NULL, false, 'FACULDADES INTEGRADAS DA AMÉRICA DO SUL (FAC INTEGRA)', 387);
INSERT INTO public.empresa VALUES (2311, true, 1, '2023-07-02 12:35:24.328015', NULL, NULL, false, 'FACULDADES INTEGRADAS DA UPIS (UPIS)', 5);
INSERT INTO public.empresa VALUES (2312, true, 1, '2023-07-02 12:35:24.329354', NULL, NULL, false, 'FACULDADES INTEGRADAS DE ARACRUZ (FAACZ)', 321);
INSERT INTO public.empresa VALUES (2313, true, 1, '2023-07-02 12:35:24.330721', NULL, NULL, false, 'FACULDADES INTEGRADAS DE ARARAQUARA (FIAR)', 378);
INSERT INTO public.empresa VALUES (2314, true, 1, '2023-07-02 12:35:24.332258', NULL, NULL, false, 'FACULDADES INTEGRADAS DE BAURU (FIB)', 93);
INSERT INTO public.empresa VALUES (2315, true, 1, '2023-07-02 12:35:24.333692', NULL, NULL, false, 'FACULDADES INTEGRADAS DE BOTUCATU', 383);
INSERT INTO public.empresa VALUES (2316, true, 1, '2023-07-02 12:35:24.334765', NULL, NULL, false, 'FACULDADES INTEGRADAS DE CASSILÂNDIA (FIC)', 713);
INSERT INTO public.empresa VALUES (2317, true, 1, '2023-07-02 12:35:24.336101', NULL, NULL, false, 'FACULDADES INTEGRADAS DE CATAGUASES (FIC)', 366);
INSERT INTO public.empresa VALUES (2318, true, 1, '2023-07-02 12:35:24.33762', NULL, NULL, false, 'FACULDADES INTEGRADAS DE CIÊNCIAS HUMANAS, SAÚDE E EDUCAÇÃO DE GUARULHOS (FG)', 100);
INSERT INTO public.empresa VALUES (2319, true, 1, '2023-07-02 12:35:24.338966', NULL, NULL, false, 'FACULDADES INTEGRADAS DE DIAMANTINO (FID)', 714);
INSERT INTO public.empresa VALUES (2320, true, 1, '2023-07-02 12:35:24.340491', NULL, NULL, false, 'FACULDADES INTEGRADAS DE FERNANDÓPOLIS (FIFE)', 309);
INSERT INTO public.empresa VALUES (2321, true, 1, '2023-07-02 12:35:24.341809', NULL, NULL, false, 'FACULDADES INTEGRADAS DE GARANHUNS (FACIGA)', 483);
INSERT INTO public.empresa VALUES (2322, true, 1, '2023-07-02 12:35:24.343154', NULL, NULL, false, 'FACULDADES INTEGRADAS DE ITAPETININGA (FII)', 271);
INSERT INTO public.empresa VALUES (2323, true, 1, '2023-07-02 12:35:24.344474', NULL, NULL, false, 'FACULDADES INTEGRADAS DE JACAREPAGUÁ (FIJ)', 12);
INSERT INTO public.empresa VALUES (2324, true, 1, '2023-07-02 12:35:24.345842', NULL, NULL, false, 'FACULDADES INTEGRADAS DE JAHU (FIJ)', 274);
INSERT INTO public.empresa VALUES (2325, true, 1, '2023-07-02 12:35:24.347188', NULL, NULL, false, 'FACULDADES INTEGRADAS DE NAVIRAÍ (FINAV)', 715);
INSERT INTO public.empresa VALUES (2326, true, 1, '2023-07-02 12:35:24.348525', NULL, NULL, false, 'FACULDADES INTEGRADAS DE PARANAÍBA - FIPAR (FIPAR)', 716);
INSERT INTO public.empresa VALUES (2327, true, 1, '2023-07-02 12:35:24.349896', NULL, NULL, false, 'FACULDADES INTEGRADAS DE PATOS (FIP)', 147);
INSERT INTO public.empresa VALUES (2328, true, 1, '2023-07-02 12:35:24.351377', NULL, NULL, false, 'FACULDADES INTEGRADAS DE RONDONÓPOLIS (FAIR)', 287);
INSERT INTO public.empresa VALUES (2329, true, 1, '2023-07-02 12:35:24.352876', NULL, NULL, false, 'FACULDADES INTEGRADAS DE SAÚDE E EDUCAÇÃO DO BRASIL (FISEB)', 203);
INSERT INTO public.empresa VALUES (2330, true, 1, '2023-07-02 12:35:24.354307', NULL, NULL, false, 'FACULDADES INTEGRADAS DE TAGUAÍ (FIT)', 717);
INSERT INTO public.empresa VALUES (2331, true, 1, '2023-07-02 12:35:24.355639', NULL, NULL, false, 'FACULDADES INTEGRADAS DE TAQUARA (FACCAT)', 718);
INSERT INTO public.empresa VALUES (2332, true, 1, '2023-07-02 12:35:24.356977', NULL, NULL, false, 'FACULDADES INTEGRADAS DE TRÊS LAGOAS (AEMS)', 658);
INSERT INTO public.empresa VALUES (2333, true, 1, '2023-07-02 12:35:24.358336', NULL, NULL, false, 'FACULDADES INTEGRADAS DO BRASIL UNIFUTURO (FACULDADE UNIFUTURO)', 107);
INSERT INTO public.empresa VALUES (2334, true, 1, '2023-07-02 12:35:24.359405', NULL, NULL, false, 'FACULDADES INTEGRADAS DO EXTREMO SUL DA BAHIA (UNESULBAHIA)', 587);
INSERT INTO public.empresa VALUES (2335, true, 1, '2023-07-02 12:35:24.360742', NULL, NULL, false, 'FACULDADES INTEGRADAS DOM PEDRO II (DOMPEDRO)', 114);
INSERT INTO public.empresa VALUES (2336, true, 1, '2023-07-02 12:35:24.362082', NULL, NULL, false, 'FACULDADES INTEGRADAS DOS CAMPOS GERAIS (CESCAGE)', 188);
INSERT INTO public.empresa VALUES (2337, true, 1, '2023-07-02 12:35:24.363278', NULL, NULL, false, 'FACULDADES INTEGRADAS DO SUL DE MINAS - FISMINAS', 2);
INSERT INTO public.empresa VALUES (2338, true, 1, '2023-07-02 12:35:24.36461', NULL, NULL, false, 'FACULDADES INTEGRADAS DO VALE DO IVAÍ', 532);
INSERT INTO public.empresa VALUES (2339, true, 1, '2023-07-02 12:35:24.365931', NULL, NULL, false, 'FACULDADES INTEGRADAS EINSTEIN DE LIMEIRA (FIEL)', 276);
INSERT INTO public.empresa VALUES (2340, true, 1, '2023-07-02 12:35:24.367287', NULL, NULL, false, 'FACULDADES INTEGRADAS ESPÍRITA (FIES)', 56);
INSERT INTO public.empresa VALUES (2341, true, 1, '2023-07-02 12:35:24.368634', NULL, NULL, false, 'FACULDADES INTEGRADAS HÉLIO ALONSO (FACHA)', 12);
INSERT INTO public.empresa VALUES (2342, true, 1, '2023-07-02 12:35:24.369965', NULL, NULL, false, 'FACULDADES INTEGRADAS IESGO (IESGO)', 539);
INSERT INTO public.empresa VALUES (2343, true, 1, '2023-07-02 12:35:24.371295', NULL, NULL, false, 'FACULDADES INTEGRADAS IPEP (FIPEP)', 8);
INSERT INTO public.empresa VALUES (2344, true, 1, '2023-07-02 12:35:24.372661', NULL, NULL, false, 'FACULDADES INTEGRADAS IPITANGA (FACIIP)', 209);
INSERT INTO public.empresa VALUES (2345, true, 1, '2023-07-02 12:35:24.374009', NULL, NULL, false, 'FACULDADES INTEGRADAS MACHADO DE ASSIS (FEMA)', 719);
INSERT INTO public.empresa VALUES (2346, true, 1, '2023-07-02 12:35:24.3753', NULL, NULL, false, 'FACULDADES INTEGRADAS MARIA IMACULADA (FIMI)', 279);
INSERT INTO public.empresa VALUES (2347, true, 1, '2023-07-02 12:35:24.376637', NULL, NULL, false, 'FACULDADES INTEGRADAS OSWALDO CRUZ', 23);
INSERT INTO public.empresa VALUES (2348, true, 1, '2023-07-02 12:35:24.377975', NULL, NULL, false, 'FACULDADES INTEGRADAS PADRÃO (FIP GUANAMBI)', 157);
INSERT INTO public.empresa VALUES (2349, true, 1, '2023-07-02 12:35:24.379313', NULL, NULL, false, 'FACULDADES INTEGRADAS PAULISTA (FIP)', 8);
INSERT INTO public.empresa VALUES (2350, true, 1, '2023-07-02 12:35:24.382077', NULL, NULL, false, 'FACULDADES INTEGRADAS POTENCIAL (FIP)', 520);
INSERT INTO public.empresa VALUES (2351, true, 1, '2023-07-02 12:35:24.383636', NULL, NULL, false, 'FACULDADES INTEGRADAS QUALIS (FIQ)', 225);
INSERT INTO public.empresa VALUES (2352, true, 1, '2023-07-02 12:35:24.384695', NULL, NULL, false, 'FACULDADES INTEGRADAS REGIONAIS DE AVARÉ (FIRA)', 195);
INSERT INTO public.empresa VALUES (2353, true, 1, '2023-07-02 12:35:24.386026', NULL, NULL, false, 'FACULDADES INTEGRADAS RIO BRANCO (FRB)', 8);
INSERT INTO public.empresa VALUES (2354, true, 1, '2023-07-02 12:35:24.387187', NULL, NULL, false, 'FACULDADES INTEGRADAS RIO BRANCO GRANJA VIANNA (FRB-GV)', 520);
INSERT INTO public.empresa VALUES (2355, true, 1, '2023-07-02 12:35:24.38854', NULL, NULL, false, 'FACULDADES INTEGRADAS RUI BARBOSA (FIRB)', 392);
INSERT INTO public.empresa VALUES (2356, true, 1, '2023-07-02 12:35:24.389879', NULL, NULL, false, 'FACULDADES INTEGRADAS SÃO JUDAS TADEU (SJT)', 149);
INSERT INTO public.empresa VALUES (2357, true, 1, '2023-07-02 12:35:24.391215', NULL, NULL, false, 'FACULDADES INTEGRADAS SILVA E SOUZA (FAU)', 12);
INSERT INTO public.empresa VALUES (2358, true, 1, '2023-07-02 12:35:24.392551', NULL, NULL, false, 'FACULDADES INTEGRADAS SIMONSEN (FIS)', 12);
INSERT INTO public.empresa VALUES (2359, true, 1, '2023-07-02 12:35:24.393916', NULL, NULL, false, 'FACULDADES INTEGRADAS SOARES DE OLIVEIRA (FISO)', 80);
INSERT INTO public.empresa VALUES (2360, true, 1, '2023-07-02 12:35:24.395234', NULL, NULL, false, 'FACULDADES INTEGRADAS STELLA MARIS DE ANDRADINA (FISMA)', 392);
INSERT INTO public.empresa VALUES (2361, true, 1, '2023-07-02 12:35:24.396474', NULL, NULL, false, 'FACULDADES INTEGRADAS URUBUPUNGÁ (FIU)', 720);
INSERT INTO public.empresa VALUES (2362, true, 1, '2023-07-02 12:35:24.39796', NULL, NULL, false, 'FACULDADES INTEGRADAS VALE DO RIO VERDE (FIVAR)', 721);
INSERT INTO public.empresa VALUES (2363, true, 1, '2023-07-02 12:35:24.399424', NULL, NULL, false, 'FACULDADES INTEGRADAS VIANNA JÚNIOR (FIVJ)', 38);
INSERT INTO public.empresa VALUES (2364, true, 1, '2023-07-02 12:35:24.40075', NULL, NULL, false, 'FACULDADES INTEGRADAS VITAL BRAZIL (FVB)', 12);
INSERT INTO public.empresa VALUES (2365, true, 1, '2023-07-02 12:35:24.402084', NULL, NULL, false, 'FACULDADES INTEGRADAS ZONA DA MATA (FIZM)', 38);
INSERT INTO public.empresa VALUES (2366, true, 1, '2023-07-02 12:35:24.403422', NULL, NULL, false, 'FACULDADES IPEDE (IPEDE)', 399);
INSERT INTO public.empresa VALUES (2367, true, 1, '2023-07-02 12:35:24.404737', NULL, NULL, false, 'FACULDADES ITECNE DE CASCAVEL (ITECNE)', 54);
INSERT INTO public.empresa VALUES (2368, true, 1, '2023-07-02 12:35:24.406073', NULL, NULL, false, 'FACULDADES JOÃO PAULO II (FJP)', 282);
INSERT INTO public.empresa VALUES (2369, true, 1, '2023-07-02 12:35:24.407452', NULL, NULL, false, 'FACULDADES JOÃO PAULO II - CAMPUS PORTO ALEGRE (FJP)', 149);
INSERT INTO public.empresa VALUES (2370, true, 1, '2023-07-02 12:35:24.408499', NULL, NULL, false, 'FACULDADES JOÃO PAULO II - PELOTAS (FJP -PELOTAS)', 283);
INSERT INTO public.empresa VALUES (2371, true, 1, '2023-07-02 12:35:24.409849', NULL, NULL, false, 'FACULDADES JOÃO PAULO II - RIO GRANDE (FJP)', 298);
INSERT INTO public.empresa VALUES (2372, true, 1, '2023-07-02 12:35:24.411188', NULL, NULL, false, 'FACULDADE SKEMA BUSINESS SCHOOL (SKEMA)', 2);
INSERT INTO public.empresa VALUES (2373, true, 1, '2023-07-02 12:35:24.412513', NULL, NULL, false, 'FACULDADES LONDRINA', 159);
INSERT INTO public.empresa VALUES (2374, true, 1, '2023-07-02 12:35:24.413914', NULL, NULL, false, 'FACULDADES MAGSUL (FAMAG)', 495);
INSERT INTO public.empresa VALUES (2375, true, 1, '2023-07-02 12:35:24.415234', NULL, NULL, false, 'FACULDADES METROPOLITANAS DE CUIABÁ (FAMEC)', 203);
INSERT INTO public.empresa VALUES (2376, true, 1, '2023-07-02 12:35:24.41656', NULL, NULL, false, 'FACULDADE SNA DIGITAL (SNA DIGITAL)', 12);
INSERT INTO public.empresa VALUES (2377, true, 1, '2023-07-02 12:35:24.417916', NULL, NULL, false, 'FACULDADES NETWORK - CAMPUS SUMARÉ', 293);
INSERT INTO public.empresa VALUES (2378, true, 1, '2023-07-02 12:35:24.419224', NULL, NULL, false, 'FACULDADE SOBERANA DE ARAPIRACA (SOBERANA)', 333);
INSERT INTO public.empresa VALUES (2379, true, 1, '2023-07-02 12:35:24.420548', NULL, NULL, false, 'FACULDADE SOBERANA DE CACHOEIRO DO ITAPEMIRIM (SOBERANA)', 190);
INSERT INTO public.empresa VALUES (2380, true, 1, '2023-07-02 12:35:24.421912', NULL, NULL, false, 'FACULDADE SOBERANA DE JACOBINA (SOBERANA)', 244);
INSERT INTO public.empresa VALUES (2381, true, 1, '2023-07-02 12:35:24.423246', NULL, NULL, false, 'FACULDADE SOCIESC DE EDUCAÇÃO DE JARAGUÁ DO SUL', 31);
INSERT INTO public.empresa VALUES (2382, true, 1, '2023-07-02 12:35:24.424573', NULL, NULL, false, 'FACULDADE SOCIESC DE EDUCAÇÃO DE SÃO BENTO DO SUL', 546);
INSERT INTO public.empresa VALUES (2383, true, 1, '2023-07-02 12:35:24.425904', NULL, NULL, false, 'FACULDADE SOCIESC DE JARAGUÁ DO SUL (SOCIESC)', 31);
INSERT INTO public.empresa VALUES (2384, true, 1, '2023-07-02 12:35:24.427246', NULL, NULL, false, 'FACULDADE SOGIPA DE EDUCAÇÃO FÍSICA', 149);
INSERT INTO public.empresa VALUES (2385, true, 1, '2023-07-02 12:35:24.428592', NULL, NULL, false, 'FACULDADE SOLIDÁRIA DE SOBRADINHO (FASOL)', 5);
INSERT INTO public.empresa VALUES (2386, true, 1, '2023-07-02 12:35:24.42993', NULL, NULL, false, 'FACULDADE SOLIDARIA DO OESTE PAULISTA (FASOL)', 50);
INSERT INTO public.empresa VALUES (2387, true, 1, '2023-07-02 12:35:24.431277', NULL, NULL, false, 'FACULDADES OSWALDO CRUZ (FOC)', 8);
INSERT INTO public.empresa VALUES (2388, true, 1, '2023-07-02 12:35:24.432704', NULL, NULL, false, 'FACULDADES PEQUENO PRÍNCIPE (FPP)', 56);
INSERT INTO public.empresa VALUES (2389, true, 1, '2023-07-02 12:35:24.434039', NULL, NULL, false, 'FACULDADES PLANALTO CENTRAL (FPC)', 5);
INSERT INTO public.empresa VALUES (2390, true, 1, '2023-07-02 12:35:24.435368', NULL, NULL, false, 'FACULDADES REUNIDAS DA ASCE (FRASCE)', 12);
INSERT INTO public.empresa VALUES (2391, true, 1, '2023-07-02 12:35:24.436696', NULL, NULL, false, 'FACULDADES SULAMÉRICA BAHIA', 52);
INSERT INTO public.empresa VALUES (2392, true, 1, '2023-07-02 12:35:24.438033', NULL, NULL, false, 'FACULDADE STBNB', 60);
INSERT INTO public.empresa VALUES (2393, true, 1, '2023-07-02 12:35:24.439375', NULL, NULL, false, 'FACULDADE STELLA MARIS - FSM (FSM)', 45);
INSERT INTO public.empresa VALUES (2394, true, 1, '2023-07-02 12:35:24.440721', NULL, NULL, false, 'FACULDADE SUCESSO (FAS)', 722);
INSERT INTO public.empresa VALUES (2395, true, 1, '2023-07-02 12:35:24.442123', NULL, NULL, false, 'FACULDADE SUCESSO (FACSU)', 723);
INSERT INTO public.empresa VALUES (2396, true, 1, '2023-07-02 12:35:24.443604', NULL, NULL, false, 'FACULDADE SUDAMÉRICA (SUDAMÉRICA)', 366);
INSERT INTO public.empresa VALUES (2397, true, 1, '2023-07-02 12:35:24.44494', NULL, NULL, false, 'FACULDADE SUDOESTE (FASU)', 37);
INSERT INTO public.empresa VALUES (2398, true, 1, '2023-07-02 12:35:24.446277', NULL, NULL, false, 'FACULDADE SULAMÉRICA BRASÍLIA', 5);
INSERT INTO public.empresa VALUES (2399, true, 1, '2023-07-02 12:35:24.447787', NULL, NULL, false, 'FACULDADE SUL DA AMÉRICA (SULDAMÉRICA)', 41);
INSERT INTO public.empresa VALUES (2400, true, 1, '2023-07-02 12:35:24.449271', NULL, NULL, false, 'FACULDADE SUL FLUMINENSE (FASF)', 123);
INSERT INTO public.empresa VALUES (2401, true, 1, '2023-07-02 12:35:24.450802', NULL, NULL, false, 'FACULDADE SUL PAULISTA DE ITANHAÉM (FASUPI)', 618);
INSERT INTO public.empresa VALUES (2402, true, 1, '2023-07-02 12:35:24.452278', NULL, NULL, false, 'FACULDADES UNIDAS DE PESQUISA, CIÊNCIAS E SAÚDE LTDA (FAPEC)', 275);
INSERT INTO public.empresa VALUES (2403, true, 1, '2023-07-02 12:35:24.453768', NULL, NULL, false, 'FACULDADES UNIFICADAS DE CATAGUASES (FUC)', 366);
INSERT INTO public.empresa VALUES (2404, true, 1, '2023-07-02 12:35:24.455116', NULL, NULL, false, 'FACULDADES UNIFICADAS DE FOZ DO IGUAÇU (UNIFOZ)', 124);
INSERT INTO public.empresa VALUES (2405, true, 1, '2023-07-02 12:35:24.456432', NULL, NULL, false, 'FACULDADES UNIFICADAS DE IÚNA (FUI)', 724);
INSERT INTO public.empresa VALUES (2406, true, 1, '2023-07-02 12:35:24.457513', NULL, NULL, false, 'FACULDADES UNIFICADAS DE LEOPOLDINA (FUL)', 669);
INSERT INTO public.empresa VALUES (2407, true, 1, '2023-07-02 12:35:24.458856', NULL, NULL, false, 'FACULDADE SUPREMO (SUPREMO)', 2);
INSERT INTO public.empresa VALUES (2408, true, 1, '2023-07-02 12:35:24.460205', NULL, NULL, false, 'FACULDADE SUPREMO REDENTOR (FACSUR)', 688);
INSERT INTO public.empresa VALUES (2409, true, 1, '2023-07-02 12:35:24.461536', NULL, NULL, false, 'FACULDADES VALE DO PIANCÓ (FAVAP)', 725);
INSERT INTO public.empresa VALUES (2410, true, 1, '2023-07-02 12:35:24.46287', NULL, NULL, false, 'FACULDADE TECNOLOGICA ANTHROPOS (FATAN)', 235);
INSERT INTO public.empresa VALUES (2411, true, 1, '2023-07-02 12:35:24.464248', NULL, NULL, false, 'FACULDADE TECNOLÓGICA DE LIMOEIRO DO NORTE: LADISLAU PEREIRA (FTLN)', 726);
INSERT INTO public.empresa VALUES (2412, true, 1, '2023-07-02 12:35:24.46558', NULL, NULL, false, 'FACULDADE TECNOLÓGICA DENTAL CEEO (ESD-CEEO)', 727);
INSERT INTO public.empresa VALUES (2413, true, 1, '2023-07-02 12:35:24.467067', NULL, NULL, false, 'FACULDADE TECNOLÓGICA DE PERNAMBUCO (FATEPE)', 39);
INSERT INTO public.empresa VALUES (2414, true, 1, '2023-07-02 12:35:24.468399', NULL, NULL, false, 'FACULDADE TECNOLÓGICA FALCÃO (FTF)', 42);
INSERT INTO public.empresa VALUES (2415, true, 1, '2023-07-02 12:35:24.469744', NULL, NULL, false, 'FACULDADE TECNOLÓGICA INAP (FAT- INAP)', 2);
INSERT INTO public.empresa VALUES (2416, true, 1, '2023-07-02 12:35:24.471073', NULL, NULL, false, 'FACULDADE TECNOLÓGICA LATINO AMERICANA (FATLA)', 149);
INSERT INTO public.empresa VALUES (2417, true, 1, '2023-07-02 12:35:24.472451', NULL, NULL, false, 'FACULDADE TECSOMA (FATEC)', 55);
INSERT INTO public.empresa VALUES (2418, true, 1, '2023-07-02 12:35:24.473733', NULL, NULL, false, 'FACULDADE TELOS DE CAMPINAS (FATELOS)', 177);
INSERT INTO public.empresa VALUES (2419, true, 1, '2023-07-02 12:35:24.475072', NULL, NULL, false, 'FACULDADE TEOLÓGICA BATISTA DE BRASÍLIA (FTBB)', 5);
INSERT INTO public.empresa VALUES (2420, true, 1, '2023-07-02 12:35:24.476435', NULL, NULL, false, 'FACULDADE TEOLÓGICA BATISTA DE SÃO PAULO (FTBSP)', 8);
INSERT INTO public.empresa VALUES (2421, true, 1, '2023-07-02 12:35:24.477748', NULL, NULL, false, 'FACULDADE TEOLÓGICA BATISTA EQUATORIAL (FATEBE)', 79);
INSERT INTO public.empresa VALUES (2422, true, 1, '2023-07-02 12:35:24.479074', NULL, NULL, false, 'FACULDADE TEOLÓGICA BETÂNIA (FATEBE)', 56);
INSERT INTO public.empresa VALUES (2423, true, 1, '2023-07-02 12:35:24.480323', NULL, NULL, false, 'FACULDADE TEOLÓGICA DE CIÊNCIAS HUMANAS E SOCIAIS LOGOS (FAETEL)', 8);
INSERT INTO public.empresa VALUES (2424, true, 1, '2023-07-02 12:35:24.48135', NULL, NULL, false, 'FACULDADE TEOLÓGICA SUL AMERICANA (FTSA)', 159);
INSERT INTO public.empresa VALUES (2425, true, 1, '2023-07-02 12:35:24.482716', NULL, NULL, false, 'FACULDADE TERCEIRA VISÃO (F3V)', 473);
INSERT INTO public.empresa VALUES (2426, true, 1, '2023-07-02 12:35:24.484008', NULL, NULL, false, 'FACULDADE TERRA BRASILIS', 728);
INSERT INTO public.empresa VALUES (2427, true, 1, '2023-07-02 12:35:24.485379', NULL, NULL, false, 'FACULDADE TERRA NORDESTE (FATENE)', 534);
INSERT INTO public.empresa VALUES (2428, true, 1, '2023-07-02 12:35:24.486692', NULL, NULL, false, 'FACULDADE TERZIUS (TERZIUS)', 177);
INSERT INTO public.empresa VALUES (2429, true, 1, '2023-07-02 12:35:24.48803', NULL, NULL, false, 'FACULDADE TIRADENTES DE GOIANA (FITS)', 400);
INSERT INTO public.empresa VALUES (2430, true, 1, '2023-07-02 12:35:24.489367', NULL, NULL, false, 'FACULDADE TIRADENTES DE JABOATÃO DOS GUARARAPES', 132);
INSERT INTO public.empresa VALUES (2431, true, 1, '2023-07-02 12:35:24.490562', NULL, NULL, false, 'FACULDADE TRÊS DE MAIO (SETREM)', 729);
INSERT INTO public.empresa VALUES (2432, true, 1, '2023-07-02 12:35:24.491892', NULL, NULL, false, 'FACULDADE TRÊS MARIAS (FTM)', 107);
INSERT INTO public.empresa VALUES (2433, true, 1, '2023-07-02 12:35:24.493251', NULL, NULL, false, 'FACULDADE TRÊS PONTAS (FATEP)', 730);
INSERT INTO public.empresa VALUES (2434, true, 1, '2023-07-02 12:35:24.494601', NULL, NULL, false, 'FACULDADE TRILÓGICA KEPPE & PACHECO (KEPPE & PACHECO)', 731);
INSERT INTO public.empresa VALUES (2435, true, 1, '2023-07-02 12:35:24.495919', NULL, NULL, false, 'FACULDADE TRILÓGICA NOSSA SENHORA DE TODOS OS POVOS (FATRI EAD)', 8);
INSERT INTO public.empresa VALUES (2436, true, 1, '2023-07-02 12:35:24.49729', NULL, NULL, false, 'FACULDADE TUCURUÍ (FATUC)', 418);
INSERT INTO public.empresa VALUES (2437, true, 1, '2023-07-02 12:35:24.498739', NULL, NULL, false, 'FACULDADE UBERLANDENSE DE NÚCLEOS INTEGRADOS DE ENSINO, SERVIÇO SOCIAL E APRENDIZAGEM (FAESSA)', 134);
INSERT INTO public.empresa VALUES (2438, true, 1, '2023-07-02 12:35:24.500089', NULL, NULL, false, 'FACULDADE UBS (FACULDADE UBS)', 8);
INSERT INTO public.empresa VALUES (2439, true, 1, '2023-07-02 12:35:24.501405', NULL, NULL, false, 'FACULDADE UMFG (UMFG)', 732);
INSERT INTO public.empresa VALUES (2440, true, 1, '2023-07-02 12:35:24.502734', NULL, NULL, false, 'FACULDADE UNA DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (2441, true, 1, '2023-07-02 12:35:24.504089', NULL, NULL, false, 'FACULDADE UNA DE DIVINÓPOLIS (UNA DIVINOPOLIS)', 19);
INSERT INTO public.empresa VALUES (2442, true, 1, '2023-07-02 12:35:24.505174', NULL, NULL, false, 'FACULDADE UNA DE ITABIRA (UNA)', 161);
INSERT INTO public.empresa VALUES (2443, true, 1, '2023-07-02 12:35:24.506492', NULL, NULL, false, 'FACULDADE UNA DE ITUMBIARA', 234);
INSERT INTO public.empresa VALUES (2444, true, 1, '2023-07-02 12:35:24.507848', NULL, NULL, false, 'FACULDADE UNA DE JATAÍ (UNA)', 21);
INSERT INTO public.empresa VALUES (2445, true, 1, '2023-07-02 12:35:24.509177', NULL, NULL, false, 'FACULDADE UNA DE POUSO ALEGRE (UNA POUSOALEGRE)', 230);
INSERT INTO public.empresa VALUES (2446, true, 1, '2023-07-02 12:35:24.510527', NULL, NULL, false, 'FACULDADE UNA DE SETE LAGOAS (UNASET)', 24);
INSERT INTO public.empresa VALUES (2447, true, 1, '2023-07-02 12:35:24.511862', NULL, NULL, false, 'FACULDADE UNESC-UNAMA', 51);
INSERT INTO public.empresa VALUES (2448, true, 1, '2023-07-02 12:35:24.513267', NULL, NULL, false, 'FACULDADE UNEX (UNEX)', 308);
INSERT INTO public.empresa VALUES (2449, true, 1, '2023-07-02 12:35:24.514724', NULL, NULL, false, 'FACULDADE UNIABA (FAC UNIABA)', 5);
INSERT INTO public.empresa VALUES (2450, true, 1, '2023-07-02 12:35:24.516245', NULL, NULL, false, 'FACULDADE UNIÃO ARARUAMA DE ENSINO S/S LTDA. (FAC-UNILAGOS)', 733);
INSERT INTO public.empresa VALUES (2451, true, 1, '2023-07-02 12:35:24.51773', NULL, NULL, false, 'FACULDADE UNIÃO CULTURAL DO ESTADO DE SÃO PAULO (UCESP)', 197);
INSERT INTO public.empresa VALUES (2452, true, 1, '2023-07-02 12:35:24.519235', NULL, NULL, false, 'FACULDADE UNIÃO DE CAMPO MOURÃO', 168);
INSERT INTO public.empresa VALUES (2453, true, 1, '2023-07-02 12:35:24.52056', NULL, NULL, false, 'FACULDADE UNIÃO DE GOYAZES FORMOSA (FUG)', 539);
INSERT INTO public.empresa VALUES (2454, true, 1, '2023-07-02 12:35:24.52191', NULL, NULL, false, 'FACULDADE UNIÃO PAULISTANA (FAUP)', 8);
INSERT INTO public.empresa VALUES (2455, true, 1, '2023-07-02 12:35:24.523358', NULL, NULL, false, 'FACULDADE UNIATENEU (FATE)', 734);
INSERT INTO public.empresa VALUES (2456, true, 1, '2023-07-02 12:35:24.5247', NULL, NULL, false, 'FACULDADE UNIAVAN RIO DO SUL (UNIAVAN)', 183);
INSERT INTO public.empresa VALUES (2457, true, 1, '2023-07-02 12:35:24.526051', NULL, NULL, false, 'FACULDADE UNIBF', 735);
INSERT INTO public.empresa VALUES (2458, true, 1, '2023-07-02 12:35:24.527393', NULL, NULL, false, 'FACULDADE UNIBRAS DA BAHIA (FACBRAS)', 533);
INSERT INTO public.empresa VALUES (2459, true, 1, '2023-07-02 12:35:24.528718', NULL, NULL, false, 'FACULDADE UNIBRAS DO MARANHÃO (FACBRAS)', 507);
INSERT INTO public.empresa VALUES (2460, true, 1, '2023-07-02 12:35:24.529814', NULL, NULL, false, 'FACULDADE UNIBRAS DO MATO GROSSO (FACBRAS)', 736);
INSERT INTO public.empresa VALUES (2461, true, 1, '2023-07-02 12:35:24.53116', NULL, NULL, false, 'FACULDADE UNIBRAS DO NORTE GOIANO (FACBRAS)', 614);
INSERT INTO public.empresa VALUES (2462, true, 1, '2023-07-02 12:35:24.53248', NULL, NULL, false, 'FACULDADE UNIBRAS DO PARÁ (FACBRAS)', 737);
INSERT INTO public.empresa VALUES (2463, true, 1, '2023-07-02 12:35:24.533842', NULL, NULL, false, 'FACULDADE UNIBRASÍLIA (BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (2464, true, 1, '2023-07-02 12:35:24.535149', NULL, NULL, false, 'FACULDADE UNIBRASÍLIA DE CIÊNCIAS ECONÔMICAS DE MINAS GERAIS (BRASÍLIA)', 118);
INSERT INTO public.empresa VALUES (2465, true, 1, '2023-07-02 12:35:24.536487', NULL, NULL, false, 'FACULDADE UNIBRASÍLIA DE MINAS GERAIS (BRASÍLIA)', 118);
INSERT INTO public.empresa VALUES (2466, true, 1, '2023-07-02 12:35:24.537828', NULL, NULL, false, 'FACULDADE UNIBRASÍLIA SUL (BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (2467, true, 1, '2023-07-02 12:35:24.539171', NULL, NULL, false, 'FACULDADE ÚNICA DE FORMAÇÃO E ENSINO (FUNIFE)', 738);
INSERT INTO public.empresa VALUES (2468, true, 1, '2023-07-02 12:35:24.540508', NULL, NULL, false, 'FACULDADE ÚNICA DE IPATINGA (FUNIP)', 268);
INSERT INTO public.empresa VALUES (2469, true, 1, '2023-07-02 12:35:24.54183', NULL, NULL, false, 'FACULDADE UNICENTRAL', 739);
INSERT INTO public.empresa VALUES (2470, true, 1, '2023-07-02 12:35:24.543017', NULL, NULL, false, 'FACULDADE UNICESUMAR DE CORUMBÁ', 686);
INSERT INTO public.empresa VALUES (2471, true, 1, '2023-07-02 12:35:24.544334', NULL, NULL, false, 'FACULDADE UNICPO (FACULDADE UNICPO)', 299);
INSERT INTO public.empresa VALUES (2472, true, 1, '2023-07-02 12:35:24.545697', NULL, NULL, false, 'FACULDADE UNIDA DE CAMPINAS GOIÂNIA - FACUNICAMPS GOIÂNIA (FACUNICAMPS)', 42);
INSERT INTO public.empresa VALUES (2473, true, 1, '2023-07-02 12:35:24.547009', NULL, NULL, false, 'FACULDADE UNIDA DE SÃO PAULO (FAUSP)', 8);
INSERT INTO public.empresa VALUES (2474, true, 1, '2023-07-02 12:35:24.548385', NULL, NULL, false, 'FACULDADE UNIDA DE SÃO PAULO - EAD (FAUSP - EAD)', 8);
INSERT INTO public.empresa VALUES (2475, true, 1, '2023-07-02 12:35:24.549697', NULL, NULL, false, 'FACULDADE UNIDA DE VITÓRIA (FACULDADE UNIDA)', 25);
INSERT INTO public.empresa VALUES (2476, true, 1, '2023-07-02 12:35:24.551011', NULL, NULL, false, 'FACULDADE UNIEDUCAR', 45);
INSERT INTO public.empresa VALUES (2477, true, 1, '2023-07-02 12:35:24.552335', NULL, NULL, false, 'FACULDADE UNIFAEL CURITIBA (FAEL CURITIBA)', 56);
INSERT INTO public.empresa VALUES (2478, true, 1, '2023-07-02 12:35:24.553414', NULL, NULL, false, 'FACULDADE UNIFAEL PORTO ALEGRE (FAEL POA)', 149);
INSERT INTO public.empresa VALUES (2479, true, 1, '2023-07-02 12:35:24.554607', NULL, NULL, false, 'FACULDADE UNIFAHE', 740);
INSERT INTO public.empresa VALUES (2480, true, 1, '2023-07-02 12:35:24.555934', NULL, NULL, false, 'FACULDADE UNIFAMETRO CASCAVEL', 741);
INSERT INTO public.empresa VALUES (2481, true, 1, '2023-07-02 12:35:24.557093', NULL, NULL, false, 'FACULDADE UNIFAMETRO MARACANAÚ', 335);
INSERT INTO public.empresa VALUES (2482, true, 1, '2023-07-02 12:35:24.558277', NULL, NULL, false, 'FACULDADE UNIFICADA DO ESTADO DE SÃO PAULO (FAUESP - ONLINE)', 480);
INSERT INTO public.empresa VALUES (2483, true, 1, '2023-07-02 12:35:24.559607', NULL, NULL, false, 'FACULDADE UNIFICADA DO ESTADO DE SÃO PAULO (FAUESP)', 480);
INSERT INTO public.empresa VALUES (2484, true, 1, '2023-07-02 12:35:24.56096', NULL, NULL, false, 'FACULDADE UNIFTB', 742);
INSERT INTO public.empresa VALUES (2485, true, 1, '2023-07-02 12:35:24.562293', NULL, NULL, false, 'FACULDADE UNIGUAÇU (FAC UNIGUAÇU)', 743);
INSERT INTO public.empresa VALUES (2486, true, 1, '2023-07-02 12:35:24.563487', NULL, NULL, false, 'FACULDADE UNIMED', 2);
INSERT INTO public.empresa VALUES (2487, true, 1, '2023-07-02 12:35:24.5649', NULL, NULL, false, 'FACULDADE UNIME DE CIÊNCIAS EXATAS E TECNOLÓGICAS (FCT)', 209);
INSERT INTO public.empresa VALUES (2488, true, 1, '2023-07-02 12:35:24.566348', NULL, NULL, false, 'FACULDADE UNIME DE CIÊNCIAS JURÍDICAS (FCJ)', 209);
INSERT INTO public.empresa VALUES (2489, true, 1, '2023-07-02 12:35:24.567627', NULL, NULL, false, 'FACULDADE UNIME DE CIÊNCIAS SOCIAIS (FCS)', 209);
INSERT INTO public.empresa VALUES (2490, true, 1, '2023-07-02 12:35:24.568792', NULL, NULL, false, 'FACULDADE UNIME DE EDUCAÇÃO E COMUNICAÇÃO (FEC)', 209);
INSERT INTO public.empresa VALUES (2491, true, 1, '2023-07-02 12:35:24.570137', NULL, NULL, false, 'FACULDADE UNINA', 56);
INSERT INTO public.empresa VALUES (2492, true, 1, '2023-07-02 12:35:24.571523', NULL, NULL, false, 'FACULDADE UNINABUCO SÃO LOURENÇO DA MATA', 744);
INSERT INTO public.empresa VALUES (2493, true, 1, '2023-07-02 12:35:24.572865', NULL, NULL, false, 'FACULDADE UNINASSAU ARAPIRACA', 333);
INSERT INTO public.empresa VALUES (2494, true, 1, '2023-07-02 12:35:24.574174', NULL, NULL, false, 'FACULDADE UNINASSAU BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (2495, true, 1, '2023-07-02 12:35:24.575505', NULL, NULL, false, 'FACULDADE UNINASSAU BRASÍLIA (NASSAU BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (2496, true, 1, '2023-07-02 12:35:24.576593', NULL, NULL, false, 'FACULDADE UNINASSAU CABO', 412);
INSERT INTO public.empresa VALUES (2497, true, 1, '2023-07-02 12:35:24.577928', NULL, NULL, false, 'FACULDADE UNINASSAU CUIABÁ (NASSAU CUIABÁ)', 203);
INSERT INTO public.empresa VALUES (2498, true, 1, '2023-07-02 12:35:24.57927', NULL, NULL, false, 'FACULDADE UNINASSAU FEIRA DE SANTANA', 99);
INSERT INTO public.empresa VALUES (2499, true, 1, '2023-07-02 12:35:24.580636', NULL, NULL, false, 'FACULDADE UNINASSAU GARANHUNS (NASSAU GARANHUNS)', 483);
INSERT INTO public.empresa VALUES (2500, true, 1, '2023-07-02 12:35:24.582187', NULL, NULL, false, 'FACULDADE UNINASSAU JABOATÃO DOS GUARARAPES (UNINASSAU)', 132);
INSERT INTO public.empresa VALUES (2501, true, 1, '2023-07-02 12:35:24.583679', NULL, NULL, false, 'FACULDADE UNINASSAU LAURO DE FREITAS', 209);
INSERT INTO public.empresa VALUES (2502, true, 1, '2023-07-02 12:35:24.585183', NULL, NULL, false, 'FACULDADE UNINASSAU MARACANAÚ', 335);
INSERT INTO public.empresa VALUES (2503, true, 1, '2023-07-02 12:35:24.586527', NULL, NULL, false, 'FACULDADE UNINASSAU MOSSORÓ', 323);
INSERT INTO public.empresa VALUES (2504, true, 1, '2023-07-02 12:35:24.58803', NULL, NULL, false, 'FACULDADE UNINASSAU OLINDA - NASSAU OLINDA', 39);
INSERT INTO public.empresa VALUES (2505, true, 1, '2023-07-02 12:35:24.589531', NULL, NULL, false, 'FACULDADE UNINASSAU PALMAS (NASSAU PALMAS)', 23);
INSERT INTO public.empresa VALUES (2506, true, 1, '2023-07-02 12:35:24.590871', NULL, NULL, false, 'FACULDADE UNINASSAU PARNAMIRIM', 537);
INSERT INTO public.empresa VALUES (2507, true, 1, '2023-07-02 12:35:24.592379', NULL, NULL, false, 'FACULDADE UNINASSAU PETROLINA', 445);
INSERT INTO public.empresa VALUES (2508, true, 1, '2023-07-02 12:35:24.593843', NULL, NULL, false, 'FACULDADE UNINASSAU SOBRAL', 167);
INSERT INTO public.empresa VALUES (2509, true, 1, '2023-07-02 12:35:24.595183', NULL, NULL, false, 'FACULDADE UNINASSAU VILHENA', 355);
INSERT INTO public.empresa VALUES (2510, true, 1, '2023-07-02 12:35:24.596534', NULL, NULL, false, 'FACULDADE UNINASSAU VITÓRIA DA CONQUISTA', 37);
INSERT INTO public.empresa VALUES (2511, true, 1, '2023-07-02 12:35:24.598061', NULL, NULL, false, 'FACULDADE - UNINORTE ALTAMIRA', 14);
INSERT INTO public.empresa VALUES (2512, true, 1, '2023-07-02 12:35:24.599545', NULL, NULL, false, 'FACULDADE - UNINORTE BARCARENA', 745);
INSERT INTO public.empresa VALUES (2513, true, 1, '2023-07-02 12:35:24.60088', NULL, NULL, false, 'FACULDADE UNINORTE MARABÁ (UNINORTE MARABÁ)', 46);
INSERT INTO public.empresa VALUES (2514, true, 1, '2023-07-02 12:35:24.602134', NULL, NULL, false, 'FACULDADE UNINORTE TAILÂNDIA (UNINORTE)', 442);
INSERT INTO public.empresa VALUES (2515, true, 1, '2023-07-02 12:35:24.603638', NULL, NULL, false, 'FACULDADE UNINTA FORTALEZA', 45);
INSERT INTO public.empresa VALUES (2516, true, 1, '2023-07-02 12:35:24.605144', NULL, NULL, false, 'FACULDADE UNINTA FORTALEZA - GESTÃO E NEGÓCIOS', 45);
INSERT INTO public.empresa VALUES (2517, true, 1, '2023-07-02 12:35:24.606503', NULL, NULL, false, 'FACULDADE UNINTA IGUATU', 332);
INSERT INTO public.empresa VALUES (2518, true, 1, '2023-07-02 12:35:24.607999', NULL, NULL, false, 'FACULDADE UNINTA TIANGUA', 235);
INSERT INTO public.empresa VALUES (2519, true, 1, '2023-07-02 12:35:24.609325', NULL, NULL, false, 'FACULDADE UNÍNTESE', 348);
INSERT INTO public.empresa VALUES (2520, true, 1, '2023-07-02 12:35:24.610666', NULL, NULL, false, 'FACULDADE UNIRB - ALAGOAS (F. UNIRB)', 73);
INSERT INTO public.empresa VALUES (2521, true, 1, '2023-07-02 12:35:24.612004', NULL, NULL, false, 'FACULDADE UNIRB - ARACAJU (F. UNIRB)', 142);
INSERT INTO public.empresa VALUES (2522, true, 1, '2023-07-02 12:35:24.613345', NULL, NULL, false, 'FACULDADE UNIRB - ARAPIRACA (F. UNIRB)', 333);
INSERT INTO public.empresa VALUES (2523, true, 1, '2023-07-02 12:35:24.614861', NULL, NULL, false, 'FACULDADE UNIRB - BARREIRAS (F. UNIRB)', 174);
INSERT INTO public.empresa VALUES (2524, true, 1, '2023-07-02 12:35:24.616364', NULL, NULL, false, 'FACULDADE UNIRB - CAMAÇARI (FACULDADE UNIRB)', 153);
INSERT INTO public.empresa VALUES (2525, true, 1, '2023-07-02 12:35:24.617854', NULL, NULL, false, 'FACULDADE UNIRB CEARÁ (F.CEARÁ)', 45);
INSERT INTO public.empresa VALUES (2526, true, 1, '2023-07-02 12:35:24.619303', NULL, NULL, false, 'FACULDADE UNIRB - CIDADE DE FORTALEZA (F. UNIRB)', 45);
INSERT INTO public.empresa VALUES (2527, true, 1, '2023-07-02 12:35:24.620636', NULL, NULL, false, 'FACULDADE UNIRB - FEIRA DE SANTANA (F. UNIRB)', 99);
INSERT INTO public.empresa VALUES (2528, true, 1, '2023-07-02 12:35:24.621981', NULL, NULL, false, 'FACULDADE UNIRB - FORTALEZA (F. UNIRB)', 45);
INSERT INTO public.empresa VALUES (2529, true, 1, '2023-07-02 12:35:24.623319', NULL, NULL, false, 'FACULDADE UNIRB JOÃO PESSOA (F.UNIRB)', 107);
INSERT INTO public.empresa VALUES (2530, true, 1, '2023-07-02 12:35:24.624657', NULL, NULL, false, 'FACULDADE UNIRB - JUAZEIRO (FACULDADE UNIRB)', 533);
INSERT INTO public.empresa VALUES (2531, true, 1, '2023-07-02 12:35:24.62599', NULL, NULL, false, 'FACULDADE UNIRB - MACEIO (FACULDADE UNIRB)', 73);
INSERT INTO public.empresa VALUES (2532, true, 1, '2023-07-02 12:35:24.627074', NULL, NULL, false, 'FACULDADE UNIRB - MOSSORÓ (F. UNIRB)', 323);
INSERT INTO public.empresa VALUES (2533, true, 1, '2023-07-02 12:35:24.6284', NULL, NULL, false, 'FACULDADE UNIRB - NATAL (F. UNIRB)', 130);
INSERT INTO public.empresa VALUES (2534, true, 1, '2023-07-02 12:35:24.629736', NULL, NULL, false, 'FACULDADE UNIRB - PARNAÍBA (F. UNIRB)', 176);
INSERT INTO public.empresa VALUES (2535, true, 1, '2023-07-02 12:35:24.630914', NULL, NULL, false, 'FACULDADE UNIRB PARNAMIRIM (F.UNIRB)', 537);
INSERT INTO public.empresa VALUES (2536, true, 1, '2023-07-02 12:35:24.632079', NULL, NULL, false, 'FACULDADE UNIRB - PIAUÍ (F. UNIRB)', 27);
INSERT INTO public.empresa VALUES (2537, true, 1, '2023-07-02 12:35:24.633244', NULL, NULL, false, 'FACULDADE UNIRB - SALVADOR (FACULDADE UNIRB)', 116);
INSERT INTO public.empresa VALUES (2538, true, 1, '2023-07-02 12:35:24.634591', NULL, NULL, false, 'FACULDADE UNIRB - SERRINHA (FACULDADE UNIRB)', 746);
INSERT INTO public.empresa VALUES (2539, true, 1, '2023-07-02 12:35:24.635927', NULL, NULL, false, 'FACULDADE UNIRB - TERESINA (F. UNIRB)', 27);
INSERT INTO public.empresa VALUES (2540, true, 1, '2023-07-02 12:35:24.637101', NULL, NULL, false, 'FACULDADE UNIRIO', 51);
INSERT INTO public.empresa VALUES (2541, true, 1, '2023-07-02 12:35:24.638437', NULL, NULL, false, 'FACULDADE UNISE', 342);
INSERT INTO public.empresa VALUES (2542, true, 1, '2023-07-02 12:35:24.639603', NULL, NULL, false, 'FACULDADE UNIS POUSO ALEGRE', 230);
INSERT INTO public.empresa VALUES (2543, true, 1, '2023-07-02 12:35:24.640781', NULL, NULL, false, 'FACULDADE UNIS SÃO LOURENÇO', 511);
INSERT INTO public.empresa VALUES (2544, true, 1, '2023-07-02 12:35:24.642126', NULL, NULL, false, 'FACULDADE UNISUL DE BALNEÁRIO CAMBORIÚ', 57);
INSERT INTO public.empresa VALUES (2545, true, 1, '2023-07-02 12:35:24.643457', NULL, NULL, false, 'FACULDADE UNISUL DE EDUCAÇÃO DE ITAJAÍ', 345);
INSERT INTO public.empresa VALUES (2546, true, 1, '2023-07-02 12:35:24.644787', NULL, NULL, false, 'FACULDADE UNISUL DE FLORIANÓPOLIS', 3);
INSERT INTO public.empresa VALUES (2547, true, 1, '2023-07-02 12:35:24.646139', NULL, NULL, false, 'FACULDADE UNISUL DE ITAJAÍ', 345);
INSERT INTO public.empresa VALUES (2548, true, 1, '2023-07-02 12:35:24.647514', NULL, NULL, false, 'FACULDADE UNITÀ (UNITÀ)', 177);
INSERT INTO public.empresa VALUES (2549, true, 1, '2023-07-02 12:35:24.649027', NULL, NULL, false, 'FACULDADE UNITERP (FACTERP)', 114);
INSERT INTO public.empresa VALUES (2550, true, 1, '2023-07-02 12:35:24.650259', NULL, NULL, false, 'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE CAMPO GRANDE', 48);
INSERT INTO public.empresa VALUES (2551, true, 1, '2023-07-02 12:35:24.651598', NULL, NULL, false, 'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE GOIÂNIA (VERITAS GOIÂNIA)', 42);
INSERT INTO public.empresa VALUES (2552, true, 1, '2023-07-02 12:35:24.652919', NULL, NULL, false, 'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE PIRACICABA (UNIVERITAS PCBA)', 224);
INSERT INTO public.empresa VALUES (2553, true, 1, '2023-07-02 12:35:24.654245', NULL, NULL, false, 'FACULDADE UNIVERSALIS (FACSALIS)', 142);
INSERT INTO public.empresa VALUES (2554, true, 1, '2023-07-02 12:35:24.655576', NULL, NULL, false, 'FACULDADE UNIVERSO BRASÍLIA', 5);
INSERT INTO public.empresa VALUES (2555, true, 1, '2023-07-02 12:35:24.656916', NULL, NULL, false, 'FACULDADE UNIVEST DE EDUCAÇÃO (UNIVEST)', 203);
INSERT INTO public.empresa VALUES (2556, true, 1, '2023-07-02 12:35:24.658263', NULL, NULL, false, 'FACULDADE UNOPAR DE CIÊNCIAS JURÍDICAS DE PETROLINA', 445);
INSERT INTO public.empresa VALUES (2557, true, 1, '2023-07-02 12:35:24.659588', NULL, NULL, false, 'FACULDADE UNOPAR DE CIÊNCIAS JURÍDICAS DE SETE LAGOAS', 24);
INSERT INTO public.empresa VALUES (2558, true, 1, '2023-07-02 12:35:24.660941', NULL, NULL, false, 'FACULDADE UNYLEYA', 12);
INSERT INTO public.empresa VALUES (2559, true, 1, '2023-07-02 12:35:24.662277', NULL, NULL, false, 'FACULDADE UNYPUBLICA', 56);
INSERT INTO public.empresa VALUES (2560, true, 1, '2023-07-02 12:35:24.663626', NULL, NULL, false, 'FACULDADE URIEL DE ALMEIDA LEITÃO', 95);
INSERT INTO public.empresa VALUES (2561, true, 1, '2023-07-02 12:35:24.664993', NULL, NULL, false, 'FACULDADE VALE DO AÇO (FAVALE)', 482);
INSERT INTO public.empresa VALUES (2562, true, 1, '2023-07-02 12:35:24.666461', NULL, NULL, false, 'FACULDADE VALE DO GORUTUBA (FAVAG)', 747);
INSERT INTO public.empresa VALUES (2563, true, 1, '2023-07-02 12:35:24.667789', NULL, NULL, false, 'FACULDADE VALE DO PAJEU (FVP)', 748);
INSERT INTO public.empresa VALUES (2564, true, 1, '2023-07-02 12:35:24.669115', NULL, NULL, false, 'FACULDADE VALE DOS CARAJÁS (FVC)', 281);
INSERT INTO public.empresa VALUES (2565, true, 1, '2023-07-02 12:35:24.670445', NULL, NULL, false, 'FACULDADE VALE DO SORRISO (UNIVALE)', 609);
INSERT INTO public.empresa VALUES (2566, true, 1, '2023-07-02 12:35:24.671789', NULL, NULL, false, 'FACULDADE VAN GOGH (FVG)', 8);
INSERT INTO public.empresa VALUES (2567, true, 1, '2023-07-02 12:35:24.673153', NULL, NULL, false, 'FACULDADE VANGUARDA', 144);
INSERT INTO public.empresa VALUES (2568, true, 1, '2023-07-02 12:35:24.67421', NULL, NULL, false, 'FACULDADE VASCONCELLOS & SOUZA', 749);
INSERT INTO public.empresa VALUES (2569, true, 1, '2023-07-02 12:35:24.675545', NULL, NULL, false, 'FACULDADE VENDA NOVA DO IMIGRANTE (FAVENI)', 750);
INSERT INTO public.empresa VALUES (2570, true, 1, '2023-07-02 12:35:24.676895', NULL, NULL, false, 'FACULDADE VERBO EDUCACIONAL (VERBOEDU)', 149);
INSERT INTO public.empresa VALUES (2571, true, 1, '2023-07-02 12:35:24.678239', NULL, NULL, false, 'FACULDADE VERDE NORTE (FAVENORTE)', 751);
INSERT INTO public.empresa VALUES (2572, true, 1, '2023-07-02 12:35:24.679568', NULL, NULL, false, 'FACULDADE VÉRTIX TRIRRIENSE (FVT)', 420);
INSERT INTO public.empresa VALUES (2573, true, 1, '2023-07-02 12:35:24.680946', NULL, NULL, false, 'FACULDADE VIA SAPIENS (FVS)', 235);
INSERT INTO public.empresa VALUES (2574, true, 1, '2023-07-02 12:35:24.682276', NULL, NULL, false, 'FACULDADE VICENTINA - FAVI (FAVI)', 56);
INSERT INTO public.empresa VALUES (2575, true, 1, '2023-07-02 12:35:24.683606', NULL, NULL, false, 'FACULDADE VIDAL (FAVILI)', 726);
INSERT INTO public.empresa VALUES (2576, true, 1, '2023-07-02 12:35:24.684916', NULL, NULL, false, 'FACULDADE VINCIT (VINCIT)', 76);
INSERT INTO public.empresa VALUES (2577, true, 1, '2023-07-02 12:35:24.686254', NULL, NULL, false, 'FACULDADE VIRTUAL DO BRASIL (FVB)', 8);
INSERT INTO public.empresa VALUES (2578, true, 1, '2023-07-02 12:35:24.687602', NULL, NULL, false, 'FACULDADE VISCONDE DE CAIRÚ (FAVIC)', 116);
INSERT INTO public.empresa VALUES (2579, true, 1, '2023-07-02 12:35:24.688947', NULL, NULL, false, 'FACULDADE VITÓRIA EM CRISTO (FVC)', 12);
INSERT INTO public.empresa VALUES (2580, true, 1, '2023-07-02 12:35:24.690264', NULL, NULL, false, 'FACULDADE VIVA VITÓRIA (FAVIVA)', 25);
INSERT INTO public.empresa VALUES (2581, true, 1, '2023-07-02 12:35:24.691448', NULL, NULL, false, 'FACULDADE VOLPE MIELE (FVM)', 58);
INSERT INTO public.empresa VALUES (2582, true, 1, '2023-07-02 12:35:24.69274', NULL, NULL, false, 'FACULDADE VP (VP)', 41);
INSERT INTO public.empresa VALUES (2583, true, 1, '2023-07-02 12:35:24.693911', NULL, NULL, false, 'FACULDADE WENCESLAU BRAZ', 103);
INSERT INTO public.empresa VALUES (2584, true, 1, '2023-07-02 12:35:24.695082', NULL, NULL, false, 'FACULDADE WOLI', 129);
INSERT INTO public.empresa VALUES (2585, true, 1, '2023-07-02 12:35:24.704343', NULL, NULL, false, 'FACULDADE XP EDUCAÇÃO - IGTI (XPE)', 2);
INSERT INTO public.empresa VALUES (2586, true, 1, '2023-07-02 12:35:24.705958', NULL, NULL, false, 'FACULDADE XV DE AGOSTO (FAQ)', 752);
INSERT INTO public.empresa VALUES (2587, true, 1, '2023-07-02 12:35:24.707288', NULL, NULL, false, 'FACULDADE ZACARIAS DE GÓES (FAZAG)', 306);
INSERT INTO public.empresa VALUES (2588, true, 1, '2023-07-02 12:35:24.708646', NULL, NULL, false, 'FACULDADE ZUMBI DOS PALMARES (FAZP)', 8);
INSERT INTO public.empresa VALUES (2589, true, 1, '2023-07-02 12:35:24.709986', NULL, NULL, false, 'FACUMINAS FACULDADE (FACUMINAS)', 128);
INSERT INTO public.empresa VALUES (2590, true, 1, '2023-07-02 12:35:24.71132', NULL, NULL, false, 'FAE CENTRO UNIVERSITÁRIO', 56);
INSERT INTO public.empresa VALUES (2591, true, 1, '2023-07-02 12:35:24.71269', NULL, NULL, false, 'FAI - CENTRO DE ENSINO SUPERIOR EM GESTÃO, TECNOLOGIA E EDUCAÇÃO', 753);
INSERT INTO public.empresa VALUES (2592, true, 1, '2023-07-02 12:35:24.71404', NULL, NULL, false, 'FAJOPA - FACULDADE JOÃO PAULO II (FAJOPA)', 145);
INSERT INTO public.empresa VALUES (2593, true, 1, '2023-07-02 12:35:24.715343', NULL, NULL, false, 'FANEESP - FACULDADE NACIONAL DE EDUCAÇÃO E ENSINO SUPERIOR DO PARANÁ (FANEESP)', 206);
INSERT INTO public.empresa VALUES (2594, true, 1, '2023-07-02 12:35:24.716673', NULL, NULL, false, 'FASUL EDUCACIONAL EAD (FASUL EDUCACIONAL)', 511);
INSERT INTO public.empresa VALUES (2595, true, 1, '2023-07-02 12:35:24.717851', NULL, NULL, false, 'FATEC ARTHUR AZEVEDO - MOGI MIRIM (FATECMM)', 642);
INSERT INTO public.empresa VALUES (2596, true, 1, '2023-07-02 12:35:24.719022', NULL, NULL, false, 'FATEC CRUZEIRO - PROF. WALDOMIRO MAY', 229);
INSERT INTO public.empresa VALUES (2597, true, 1, '2023-07-02 12:35:24.720201', NULL, NULL, false, 'FATECE - FACULDADE DE TECNOLOGIA, CIÊNCIAS E EDUCAÇÃO (FATECE)', 754);
INSERT INTO public.empresa VALUES (2598, true, 1, '2023-07-02 12:35:24.721538', NULL, NULL, false, 'FATEC - FACULDADE DE TEOLOGIA E CIÊNCIAS DE VOTUPORANGA (FATEC)', 10);
INSERT INTO public.empresa VALUES (2599, true, 1, '2023-07-02 12:35:24.722862', NULL, NULL, false, 'FAVENORTE DE PORTEIRINHA (FAVEPORT)', 755);
INSERT INTO public.empresa VALUES (2600, true, 1, '2023-07-02 12:35:24.724167', NULL, NULL, false, 'FETAC - FACULDADE DE EDUCAÇÃO, TECNOLOGIA E ADMINISTRAÇÃO DE CAARAPÓ (FETAC)', 756);
INSERT INTO public.empresa VALUES (2601, true, 1, '2023-07-02 12:35:24.725646', NULL, NULL, false, 'FG FACULDADE GLOBAL (FG)', 149);
INSERT INTO public.empresa VALUES (2602, true, 1, '2023-07-02 12:35:24.726853', NULL, NULL, false, 'FGV / ESCOLA DE RELAÇÕES INTERNACIONAIS (FGV/RI)', 8);
INSERT INTO public.empresa VALUES (2603, true, 1, '2023-07-02 12:35:24.72823', NULL, NULL, false, 'FIAM-FAAM - CENTRO UNIVERSITÁRIO (UNIFIAM-FAAM)', 8);
INSERT INTO public.empresa VALUES (2604, true, 1, '2023-07-02 12:35:24.729491', NULL, NULL, false, 'FIAP - CENTRO UNIVERSITÁRIO', 8);
INSERT INTO public.empresa VALUES (2605, true, 1, '2023-07-02 12:35:24.731019', NULL, NULL, false, 'FIEP - FACULDADE INTERNACIONAL DE EVOLUÇÃO PROFISSIONAL (FIEP)', 116);
INSERT INTO public.empresa VALUES (2606, true, 1, '2023-07-02 12:35:24.732604', NULL, NULL, false, 'FI - FACULDADE IGUAÇU (FI)', 757);
INSERT INTO public.empresa VALUES (2607, true, 1, '2023-07-02 12:35:24.734166', NULL, NULL, false, 'FIP - FACULDADE DE IPORÃ PARANÁ (FIP)', 758);
INSERT INTO public.empresa VALUES (2608, true, 1, '2023-07-02 12:35:24.735482', NULL, NULL, false, 'FOCCA - FACULDADE DE OLINDA (FOCCA)', 39);
INSERT INTO public.empresa VALUES (2609, true, 1, '2023-07-02 12:35:24.736808', NULL, NULL, false, 'FORMAÇÃO FACULDADE INTEGRADA (FFI)', 141);
INSERT INTO public.empresa VALUES (2610, true, 1, '2023-07-02 12:35:24.738141', NULL, NULL, false, 'FRANKLINCOVEY BUSINESS SCHOOL (FCBS)', 8);
INSERT INTO public.empresa VALUES (2611, true, 1, '2023-07-02 12:35:24.739325', NULL, NULL, false, 'FTRB - FACULDADE TEOLÓGICA REFORMADA DE BRASÍLIA', 5);
INSERT INTO public.empresa VALUES (2612, true, 1, '2023-07-02 12:35:24.740645', NULL, NULL, false, 'FUNDAÇÃO DOM CABRAL', 481);
INSERT INTO public.empresa VALUES (2613, true, 1, '2023-07-02 12:35:24.741827', NULL, NULL, false, 'FUNDAÇÃO DOM CABRAL - ENSINO SUPERIOR (FDC)', 481);
INSERT INTO public.empresa VALUES (2614, true, 1, '2023-07-02 12:35:24.743139', NULL, NULL, false, 'FUNDAÇÃO ESCOLA LINCE KEMPIM (FELK)', 759);
INSERT INTO public.empresa VALUES (2615, true, 1, '2023-07-02 12:35:24.744464', NULL, NULL, false, 'FUNDAÇÃO FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE MANDAGUARI (FAFIMAN)', 760);
INSERT INTO public.empresa VALUES (2616, true, 1, '2023-07-02 12:35:24.745807', NULL, NULL, false, 'FUNDAÇÃO FACULDADE PARA AS ARTES, EDUCAÇÃO E COMUNICAÇÃO (FUNDAEC)', 8);
INSERT INTO public.empresa VALUES (2617, true, 1, '2023-07-02 12:35:24.747184', NULL, NULL, false, 'FUNDAÇÃO OSWALDO CRUZ (FIOCRUZ)', 12);
INSERT INTO public.empresa VALUES (2618, true, 1, '2023-07-02 12:35:24.748536', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE DO ESTADO DE SANTA CATARINA (UDESC)', 3);
INSERT INTO public.empresa VALUES (2619, true, 1, '2023-07-02 12:35:24.749865', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DA GRANDE DOURADOS (UFGD)', 84);
INSERT INTO public.empresa VALUES (2620, true, 1, '2023-07-02 12:35:24.751188', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DE CIÊNCIAS DA SAÚDE DE PORTO ALEGRE (UFCSPA)', 149);
INSERT INTO public.empresa VALUES (2621, true, 1, '2023-07-02 12:35:24.75252', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DE RONDÔNIA (UNIR)', 51);
INSERT INTO public.empresa VALUES (2622, true, 1, '2023-07-02 12:35:24.753595', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DO ABC (UFABC)', 47);
INSERT INTO public.empresa VALUES (2623, true, 1, '2023-07-02 12:35:24.754937', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DO PAMPA - UNIPAMPA (UNIPAMPA)', 86);
INSERT INTO public.empresa VALUES (2624, true, 1, '2023-07-02 12:35:24.756277', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DO TOCANTINS (UFT)', 23);
INSERT INTO public.empresa VALUES (2625, true, 1, '2023-07-02 12:35:24.757614', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DO VALE DO SÃO FRANCISCO (UNIVASF)', 445);
INSERT INTO public.empresa VALUES (2626, true, 1, '2023-07-02 12:35:24.758953', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE VIRTUAL DO ESTADO DE SÃO PAULO (UNIVESP)', 8);
INSERT INTO public.empresa VALUES (2627, true, 1, '2023-07-02 12:35:24.760295', NULL, NULL, false, 'FUNVIC - FACULDADE FUNVIC DE MOCOCA', 528);
INSERT INTO public.empresa VALUES (2628, true, 1, '2023-07-02 12:35:24.761633', NULL, NULL, false, 'GAIA (GAIA)', 146);
INSERT INTO public.empresa VALUES (2629, true, 1, '2023-07-02 12:35:24.76297', NULL, NULL, false, 'GRAN CENTRO UNIVERSITÁRIO (GRAN)', 56);
INSERT INTO public.empresa VALUES (2630, true, 1, '2023-07-02 12:35:24.764321', NULL, NULL, false, 'GRUPO DE NUTRIÇÃO HUMANA (GANEP)', 8);
INSERT INTO public.empresa VALUES (2631, true, 1, '2023-07-02 12:35:24.765657', NULL, NULL, false, 'IBPTECH FACULDADE DE CIÊNCIAS FORENSES E TECNOLOGIA', 8);
INSERT INTO public.empresa VALUES (2632, true, 1, '2023-07-02 12:35:24.76696', NULL, NULL, false, 'ICEV - INSTITUTO DE ENSINO SUPERIOR', 27);
INSERT INTO public.empresa VALUES (2633, true, 1, '2023-07-02 12:35:24.768302', NULL, NULL, false, 'ILUM ESCOLA DE CIÊNCIA', 177);
INSERT INTO public.empresa VALUES (2634, true, 1, '2023-07-02 12:35:24.769645', NULL, NULL, false, 'INSIDE - INSTITUTO SUPERIOR PARA INTEGRAÇÃO, DESENVOLVIMENTO E EDUCAÇÃO (INSIDE)', 5);
INSERT INTO public.empresa VALUES (2635, true, 1, '2023-07-02 12:35:24.770994', NULL, NULL, false, 'INSPER INSTITUTO DE ENSINO E PESQUISA', 8);
INSERT INTO public.empresa VALUES (2636, true, 1, '2023-07-02 12:35:24.772317', NULL, NULL, false, 'INSTITUIÇÃO DE ENSINO SUPERIOR DE CACOAL (FANORTE CACOAL)', 115);
INSERT INTO public.empresa VALUES (2637, true, 1, '2023-07-02 12:35:24.773666', NULL, NULL, false, 'INSTITUTO AMAZÔNICO DE ENSINO SUPERIOR (IAMES)', 75);
INSERT INTO public.empresa VALUES (2638, true, 1, '2023-07-02 12:35:24.774999', NULL, NULL, false, 'INSTITUTO APHONSIANO DE ENSINO SUPERIOR (IAESUP)', 164);
INSERT INTO public.empresa VALUES (2639, true, 1, '2023-07-02 12:35:24.776337', NULL, NULL, false, 'INSTITUTO ARIA', 5);
INSERT INTO public.empresa VALUES (2640, true, 1, '2023-07-02 12:35:24.777417', NULL, NULL, false, 'INSTITUTO BELO HORIZONTE DE ENSINO SUPERIOR (IBHES)', 2);
INSERT INTO public.empresa VALUES (2641, true, 1, '2023-07-02 12:35:24.778754', NULL, NULL, false, 'INSTITUTO BRASIL DE ENSINO SUPERIOR (IBRAS)', 188);
INSERT INTO public.empresa VALUES (2642, true, 1, '2023-07-02 12:35:24.780109', NULL, NULL, false, 'INSTITUTO BRASILEIRO DE COACHING (IBC)', 42);
INSERT INTO public.empresa VALUES (2643, true, 1, '2023-07-02 12:35:24.78143', NULL, NULL, false, 'INSTITUTO BRASILEIRO DE ENSINO, DESENVOLVIMENTO E PESQUISA DE BRASÍLIA (IDP-BSB)', 5);
INSERT INTO public.empresa VALUES (2644, true, 1, '2023-07-02 12:35:24.782797', NULL, NULL, false, 'INSTITUTO BRASILEIRO DE ENSINO, DESENVOLVIMENTO E PESQUISA DE SÃO PAULO (IDP-SP)', 8);
INSERT INTO public.empresa VALUES (2645, true, 1, '2023-07-02 12:35:24.784102', NULL, NULL, false, 'INSTITUTO CATÓLICO DE ESTUDOS SUPERIORES DO PIAUÍ (ICESPI)', 27);
INSERT INTO public.empresa VALUES (2646, true, 1, '2023-07-02 12:35:24.785451', NULL, NULL, false, 'INSTITUTO CUIABÁ DE ENSINO E CULTURA (ICEC)', 203);
INSERT INTO public.empresa VALUES (2647, true, 1, '2023-07-02 12:35:24.786786', NULL, NULL, false, 'INSTITUTO DE ASSISTÊNCIA MÉDICA AO SERVIDOR PÚBLICO ESTADUAL (IAMSPE)', 8);
INSERT INTO public.empresa VALUES (2648, true, 1, '2023-07-02 12:35:24.78812', NULL, NULL, false, 'INSTITUTO DE CIÊNCIAS SOCIAIS E HUMANAS (ICSH)', 297);
INSERT INTO public.empresa VALUES (2649, true, 1, '2023-07-02 12:35:24.789419', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO E APRENDIZAGEM - IDEA DIREITO (IDEA DIREITO)', 141);
INSERT INTO public.empresa VALUES (2650, true, 1, '2023-07-02 12:35:24.790593', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO E APRENDIZAGEM - IDEA SÃO LUIZ (IDEA SÃO LUIZ)', 141);
INSERT INTO public.empresa VALUES (2651, true, 1, '2023-07-02 12:35:24.791773', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO EDUCACIONAL (IDE)', 60);
INSERT INTO public.empresa VALUES (2652, true, 1, '2023-07-02 12:35:24.793104', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO EDUCACIONAL DA AMAZÔNIA (IDEA)', 267);
INSERT INTO public.empresa VALUES (2653, true, 1, '2023-07-02 12:35:24.794447', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO TECNOLÓGICO DA FGV (FGV/IDT)', 12);
INSERT INTO public.empresa VALUES (2654, true, 1, '2023-07-02 12:35:24.795795', NULL, NULL, false, 'INSTITUTO DE DIREITO DO NORTE - IDN MANAUS (IDN MANAUS)', 75);
INSERT INTO public.empresa VALUES (2655, true, 1, '2023-07-02 12:35:24.797153', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO E ENSINO SUPERIOR DE CAMPINAS (IESCAMP)', 177);
INSERT INTO public.empresa VALUES (2656, true, 1, '2023-07-02 12:35:24.798486', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO E INOVAÇÃO (IEDI)', 138);
INSERT INTO public.empresa VALUES (2657, true, 1, '2023-07-02 12:35:24.79981', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR DE POUSO ALEGRE', 230);
INSERT INTO public.empresa VALUES (2658, true, 1, '2023-07-02 12:35:24.800902', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR E INOVAÇÃO INVENIO (INVENIO)', 8);
INSERT INTO public.empresa VALUES (2659, true, 1, '2023-07-02 12:35:24.802215', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR E INOVAÇÃO PERSONA', 8);
INSERT INTO public.empresa VALUES (2660, true, 1, '2023-07-02 12:35:24.803385', NULL, NULL, false, 'INSTITUTO DE EDUCACAO SUPERIOR LATINOAMERICANO (SIGLA IESLA)', 2);
INSERT INTO public.empresa VALUES (2661, true, 1, '2023-07-02 12:35:24.804559', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR PRESIDENTE KENNEDY - CENTRO DE FORMAÇÃO DE PROFISSIONAIS DE EDUCAÇÃO (IFESP)', 130);
INSERT INTO public.empresa VALUES (2662, true, 1, '2023-07-02 12:35:24.805907', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR RAIMUNDO SÁ (IESRSA)', 643);
INSERT INTO public.empresa VALUES (2663, true, 1, '2023-07-02 12:35:24.807234', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR UNISUL DE ITAJAÍ', 345);
INSERT INTO public.empresa VALUES (2664, true, 1, '2023-07-02 12:35:24.808411', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR UNYAHNA DE SALVADOR (IESUS)', 116);
INSERT INTO public.empresa VALUES (2665, true, 1, '2023-07-02 12:35:24.809744', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO TECNOLÓGICA EIRELI (IETEC)', 2);
INSERT INTO public.empresa VALUES (2666, true, 1, '2023-07-02 12:35:24.811053', NULL, NULL, false, 'INSTITUTO DE ENSINO E PESQUISA DO HOSPITAL SÍRIO-LIBANÊS (IEP/HSL)', 8);
INSERT INTO public.empresa VALUES (2667, true, 1, '2023-07-02 12:35:24.812404', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR AGOSTINIANO CASA GAIA', 200);
INSERT INTO public.empresa VALUES (2668, true, 1, '2023-07-02 12:35:24.813728', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR BLAURO CARDOSO DE MATTOS (FASERRA)', 290);
INSERT INTO public.empresa VALUES (2669, true, 1, '2023-07-02 12:35:24.815076', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR BRASILEIRO (ESB)', 75);
INSERT INTO public.empresa VALUES (2670, true, 1, '2023-07-02 12:35:24.816414', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR CAPIXABA (IESCAPI)', 290);
INSERT INTO public.empresa VALUES (2671, true, 1, '2023-07-02 12:35:24.81775', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DA FUPESP (IESF)', 113);
INSERT INTO public.empresa VALUES (2672, true, 1, '2023-07-02 12:35:24.819079', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DA GRANDE FLORIANÓPOLIS (IESGF)', 140);
INSERT INTO public.empresa VALUES (2673, true, 1, '2023-07-02 12:35:24.82043', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE ALAGOAS (IESA)', 73);
INSERT INTO public.empresa VALUES (2674, true, 1, '2023-07-02 12:35:24.821766', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE AMERICANA (IESA)', 187);
INSERT INTO public.empresa VALUES (2675, true, 1, '2023-07-02 12:35:24.823099', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE BAURU (IESB)', 93);
INSERT INTO public.empresa VALUES (2676, true, 1, '2023-07-02 12:35:24.824007', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE CUIABÁ', 203);
INSERT INTO public.empresa VALUES (2677, true, 1, '2023-07-02 12:35:24.825353', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE FORTALEZA (IESF)', 45);
INSERT INTO public.empresa VALUES (2678, true, 1, '2023-07-02 12:35:24.826693', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE FOZ DO IGUAÇU (IESFI)', 124);
INSERT INTO public.empresa VALUES (2679, true, 1, '2023-07-02 12:35:24.827869', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE LONDRINA - INESUL (INESUL)', 159);
INSERT INTO public.empresa VALUES (2680, true, 1, '2023-07-02 12:35:24.829027', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE MINAS GERAIS (IESMIG)', 761);
INSERT INTO public.empresa VALUES (2681, true, 1, '2023-07-02 12:35:24.830281', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE OLINDA (IESO)', 39);
INSERT INTO public.empresa VALUES (2682, true, 1, '2023-07-02 12:35:24.83162', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE RONDÔNIA (IESUR)', 151);
INSERT INTO public.empresa VALUES (2683, true, 1, '2023-07-02 12:35:24.833078', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE TERESINA (IEST)', 27);
INSERT INTO public.empresa VALUES (2684, true, 1, '2023-07-02 12:35:24.83436', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DO AMAPÁ (IESAP)', 26);
INSERT INTO public.empresa VALUES (2685, true, 1, '2023-07-02 12:35:24.8357', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DO SUL DO MARANHÃO (IESMA)', 267);
INSERT INTO public.empresa VALUES (2686, true, 1, '2023-07-02 12:35:24.837034', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR E FORMAÇÃO AVANÇADA DE VITÓRIA (IESFAVI)', 25);
INSERT INTO public.empresa VALUES (2687, true, 1, '2023-07-02 12:35:24.838383', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR FRANCISCANO (IESF)', 762);
INSERT INTO public.empresa VALUES (2688, true, 1, '2023-07-02 12:35:24.83971', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR FUCAPI (CESF)', 75);
INSERT INTO public.empresa VALUES (2689, true, 1, '2023-07-02 12:35:24.840893', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR INTEGRADO-IESI (FENORD)', 7);
INSERT INTO public.empresa VALUES (2690, true, 1, '2023-07-02 12:35:24.842224', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR MATERDEI (IES-MATERDEI)', 75);
INSERT INTO public.empresa VALUES (2691, true, 1, '2023-07-02 12:35:24.843593', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR MÚLTIPLO (IESM)', 456);
INSERT INTO public.empresa VALUES (2692, true, 1, '2023-07-02 12:35:24.844907', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR PLANALTO (IESPLAN)', 5);
INSERT INTO public.empresa VALUES (2693, true, 1, '2023-07-02 12:35:24.846277', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR SANTA CECÍLIA (IESC)', 333);
INSERT INTO public.empresa VALUES (2694, true, 1, '2023-07-02 12:35:24.847375', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR SANTO ANTÔNIO (INESA)', 68);
INSERT INTO public.empresa VALUES (2695, true, 1, '2023-07-02 12:35:24.848707', NULL, NULL, false, 'INSTITUTO DE ESTUDOS SUPERIORES DO MARANHÃO (IESMA)', 141);
INSERT INTO public.empresa VALUES (2696, true, 1, '2023-07-02 12:35:24.850031', NULL, NULL, false, 'INSTITUTO DE FILOSOFIA E TEOLOGIA DE GOIÁS (IFITEG)', 42);
INSERT INTO public.empresa VALUES (2697, true, 1, '2023-07-02 12:35:24.85135', NULL, NULL, false, 'INSTITUTO DE PESQUISAS, ENSINO E GESTÃO EM SAÚDE (IPGS)', 149);
INSERT INTO public.empresa VALUES (2698, true, 1, '2023-07-02 12:35:24.852674', NULL, NULL, false, 'INSTITUTO DE PÓS-GRADUAÇÃO E ATUALIZAÇÃO EM ODONTOLOGIA (IPENO)', 3);
INSERT INTO public.empresa VALUES (2699, true, 1, '2023-07-02 12:35:24.854012', NULL, NULL, false, 'INSTITUTO DE SERRA DOURADA', 22);
INSERT INTO public.empresa VALUES (2700, true, 1, '2023-07-02 12:35:24.85532', NULL, NULL, false, 'INSTITUTO DE TECNOLOGIA E LIDERANÇA (INTELI)', 8);
INSERT INTO public.empresa VALUES (2701, true, 1, '2023-07-02 12:35:24.856663', NULL, NULL, false, 'INSTITUTO DO SUL DE SANTA CATARINA', 192);
INSERT INTO public.empresa VALUES (2702, true, 1, '2023-07-02 12:35:24.857828', NULL, NULL, false, 'INSTITUTO EDUCACIONAL DAS AMÉRICAS (IEA EDUCACIONAL)', 149);
INSERT INTO public.empresa VALUES (2703, true, 1, '2023-07-02 12:35:24.859001', NULL, NULL, false, 'INSTITUTO EDUCACIONAL MONTE PASCOAL', 42);
INSERT INTO public.empresa VALUES (2704, true, 1, '2023-07-02 12:35:24.860338', NULL, NULL, false, 'INSTITUTO ESPERANÇA DE ENSINO SUPERIOR (IESPES)', 78);
INSERT INTO public.empresa VALUES (2705, true, 1, '2023-07-02 12:35:24.861682', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA BAIANO (IFBAIANO)', 116);
INSERT INTO public.empresa VALUES (2706, true, 1, '2023-07-02 12:35:24.86304', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA CATARINENSE (IF CATARINENSE)', 193);
INSERT INTO public.empresa VALUES (2707, true, 1, '2023-07-02 12:35:24.864431', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DA BAHIA (IFBA)', 116);
INSERT INTO public.empresa VALUES (2708, true, 1, '2023-07-02 12:35:24.865769', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DA PARAÍBA (IFPB)', 107);
INSERT INTO public.empresa VALUES (2709, true, 1, '2023-07-02 12:35:24.867059', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE ALAGOAS (IFAL)', 73);
INSERT INTO public.empresa VALUES (2710, true, 1, '2023-07-02 12:35:24.868381', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIENCIA E TECNOLOGIA DE BRASILIA (IFB)', 5);
INSERT INTO public.empresa VALUES (2711, true, 1, '2023-07-02 12:35:24.869713', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE GOIÁS (IFG)', 42);
INSERT INTO public.empresa VALUES (2712, true, 1, '2023-07-02 12:35:24.870816', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MATO GROSSO (IFMT)', 203);
INSERT INTO public.empresa VALUES (2713, true, 1, '2023-07-02 12:35:24.872164', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MATO GROSSO DO SUL (IFMS)', 48);
INSERT INTO public.empresa VALUES (2714, true, 1, '2023-07-02 12:35:24.873484', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MINAS GERAIS (IFMG)', 2);
INSERT INTO public.empresa VALUES (2715, true, 1, '2023-07-02 12:35:24.874792', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE PERNAMBUCO (IFPE)', 60);
INSERT INTO public.empresa VALUES (2716, true, 1, '2023-07-02 12:35:24.876127', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO CIÊNCIA E TECNOLOGIA DE RONDÔNIA (IFRO)', 51);
INSERT INTO public.empresa VALUES (2717, true, 1, '2023-07-02 12:35:24.87748', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE RORAIMA (IFRR)', 138);
INSERT INTO public.empresa VALUES (2718, true, 1, '2023-07-02 12:35:24.878808', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SANTA CATARINA (IFSC)', 3);
INSERT INTO public.empresa VALUES (2719, true, 1, '2023-07-02 12:35:24.880193', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SÃO PAULO (IFSP)', 8);
INSERT INTO public.empresa VALUES (2720, true, 1, '2023-07-02 12:35:24.881536', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SERGIPE (IFS)', 142);
INSERT INTO public.empresa VALUES (2721, true, 1, '2023-07-02 12:35:24.882885', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO ACRE (IFAC)', 143);
INSERT INTO public.empresa VALUES (2722, true, 1, '2023-07-02 12:35:24.884209', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO AMAPÁ (IFAP)', 26);
INSERT INTO public.empresa VALUES (2723, true, 1, '2023-07-02 12:35:24.885516', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO AMAZONAS (IFAM)', 75);
INSERT INTO public.empresa VALUES (2724, true, 1, '2023-07-02 12:35:24.886862', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO CEARÁ (IFCE)', 45);
INSERT INTO public.empresa VALUES (2725, true, 1, '2023-07-02 12:35:24.888189', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO ESPÍRITO SANTO (IFES)', 25);
INSERT INTO public.empresa VALUES (2726, true, 1, '2023-07-02 12:35:24.889525', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO MARANHÃO (IFMA)', 141);
INSERT INTO public.empresa VALUES (2727, true, 1, '2023-07-02 12:35:24.890702', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO NORTE DE MINAS GERAIS (IFNMG)', 128);
INSERT INTO public.empresa VALUES (2728, true, 1, '2023-07-02 12:35:24.892042', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PARÁ (IFPA)', 79);
INSERT INTO public.empresa VALUES (2729, true, 1, '2023-07-02 12:35:24.8934', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PARANÁ (IFPR)', 56);
INSERT INTO public.empresa VALUES (2730, true, 1, '2023-07-02 12:35:24.894431', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PIAUÍ (IFPI)', 27);
INSERT INTO public.empresa VALUES (2731, true, 1, '2023-07-02 12:35:24.895761', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO DE JANEIRO (IFRJ)', 12);
INSERT INTO public.empresa VALUES (2732, true, 1, '2023-07-02 12:35:24.89696', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO GRANDE DO NORTE (IFRN)', 130);
INSERT INTO public.empresa VALUES (2733, true, 1, '2023-07-02 12:35:24.898281', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO GRANDE DO SUL (IFRS)', 77);
INSERT INTO public.empresa VALUES (2734, true, 1, '2023-07-02 12:35:24.899665', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SERTÃO PERNAMBUCANO (IF SERTÃO)', 445);
INSERT INTO public.empresa VALUES (2735, true, 1, '2023-07-02 12:35:24.900967', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SUDESTE DE MINAS GERAIS (IFSEMG)', 38);
INSERT INTO public.empresa VALUES (2736, true, 1, '2023-07-02 12:35:24.902304', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SUL DE MINAS GERAIS (IF SUL DE MINAS)', 230);
INSERT INTO public.empresa VALUES (2737, true, 1, '2023-07-02 12:35:24.903644', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO TOCANTINS (IFTO)', 23);
INSERT INTO public.empresa VALUES (2738, true, 1, '2023-07-02 12:35:24.904977', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO TRIÂNGULO MINEIRO (IFTM)', 118);
INSERT INTO public.empresa VALUES (2739, true, 1, '2023-07-02 12:35:24.906312', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA FARROUPILHA (IFFARROUPILHA)', 417);
INSERT INTO public.empresa VALUES (2740, true, 1, '2023-07-02 12:35:24.907661', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA FLUMINENSE (IF FLUMINENSE)', 160);
INSERT INTO public.empresa VALUES (2741, true, 1, '2023-07-02 12:35:24.908989', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA GOIANO (IF GOIANO)', 42);
INSERT INTO public.empresa VALUES (2742, true, 1, '2023-07-02 12:35:24.910324', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA SUL-RIO-GRANDENSE (IFSUL)', 283);
INSERT INTO public.empresa VALUES (2743, true, 1, '2023-07-02 12:35:24.911673', NULL, NULL, false, 'INSTITUTO FLORENCE DE ENSINO SUPERIOR (IFES)', 141);
INSERT INTO public.empresa VALUES (2744, true, 1, '2023-07-02 12:35:24.913024', NULL, NULL, false, 'INSTITUTO FRIBURGO DE ENSINO SUPERIOR (IFES)', 8);
INSERT INTO public.empresa VALUES (2745, true, 1, '2023-07-02 12:35:24.914357', NULL, NULL, false, 'INSTITUTO GOIANO DE DIREITO (IGD)', 42);
INSERT INTO public.empresa VALUES (2746, true, 1, '2023-07-02 12:35:24.915673', NULL, NULL, false, 'INSTITUTO INFNET RIO DE JANEIRO (INFNET)', 12);
INSERT INTO public.empresa VALUES (2747, true, 1, '2023-07-02 12:35:24.917017', NULL, NULL, false, 'INSTITUTO INTERNACIONAL DE ESTUDOS EM SAUDE (IIESAU)', 58);
INSERT INTO public.empresa VALUES (2748, true, 1, '2023-07-02 12:35:24.918088', NULL, NULL, false, 'INSTITUTO ITAPETININGANO DE ENSINO SUPERIOR (IIES)', 271);
INSERT INTO public.empresa VALUES (2749, true, 1, '2023-07-02 12:35:24.919416', NULL, NULL, false, 'INSTITUTO LEGISLATIVO BRASILEIRO (ILB)', 5);
INSERT INTO public.empresa VALUES (2750, true, 1, '2023-07-02 12:35:24.920764', NULL, NULL, false, 'INSTITUTO LEYA DE EDUCAÇÃO SUPERIOR (LEYA)', 5);
INSERT INTO public.empresa VALUES (2751, true, 1, '2023-07-02 12:35:24.922131', NULL, NULL, false, 'INSTITUTO LUTERANO DE ENSINO SUPERIOR DE ITUMBIARA (ILES)', 234);
INSERT INTO public.empresa VALUES (2752, true, 1, '2023-07-02 12:35:24.923454', NULL, NULL, false, 'INSTITUTO MACAPAENSE DE ENSINO SUPERIOR (IMMES)', 26);
INSERT INTO public.empresa VALUES (2753, true, 1, '2023-07-02 12:35:24.924777', NULL, NULL, false, 'INSTITUTO MACHADENSE DE ENSINO SUPERIOR (IMES)', 35);
INSERT INTO public.empresa VALUES (2754, true, 1, '2023-07-02 12:35:24.926114', NULL, NULL, false, 'INSTITUTO MARANHENSE DE ENSINO E CULTURA (IMEC)', 141);
INSERT INTO public.empresa VALUES (2755, true, 1, '2023-07-02 12:35:24.927293', NULL, NULL, false, 'INSTITUTO MATONENSE MUNICIPAL DE ENSINO SUPERIOR (IMMES)', 278);
INSERT INTO public.empresa VALUES (2756, true, 1, '2023-07-02 12:35:24.92864', NULL, NULL, false, 'INSTITUTO METROPOLITANO DE ENSINO SUPERIOR (IMES)', 268);
INSERT INTO public.empresa VALUES (2757, true, 1, '2023-07-02 12:35:24.929994', NULL, NULL, false, 'INSTITUTO MILITAR DE ENGENHARIA (IME)', 12);
INSERT INTO public.empresa VALUES (2758, true, 1, '2023-07-02 12:35:24.931511', NULL, NULL, false, 'INSTITUTO MOINHOS DE VENTO', 149);
INSERT INTO public.empresa VALUES (2759, true, 1, '2023-07-02 12:35:24.932862', NULL, NULL, false, 'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE ASSIS (IMESA)', 379);
INSERT INTO public.empresa VALUES (2760, true, 1, '2023-07-02 12:35:24.934372', NULL, NULL, false, 'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE BEBEDOURO VICTÓRIO CARDASSI (IMESB)', 208);
INSERT INTO public.empresa VALUES (2761, true, 1, '2023-07-02 12:35:24.935845', NULL, NULL, false, 'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE CATANDUVA (IMES CATANDUVA)', 181);
INSERT INTO public.empresa VALUES (2762, true, 1, '2023-07-02 12:35:24.937181', NULL, NULL, false, 'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE SÃO MANUEL (IMESSM)', 631);
INSERT INTO public.empresa VALUES (2763, true, 1, '2023-07-02 12:35:24.938544', NULL, NULL, false, 'INSTITUTO NACIONAL DE EDUCAÇÃO DE SURDOS (INES)', 12);
INSERT INTO public.empresa VALUES (2764, true, 1, '2023-07-02 12:35:24.939857', NULL, NULL, false, 'INSTITUTO NACIONAL DE ENSINO SUPERIOR E PÓS-GRADUAÇÃO PADRE GERVÁSIO (INAPÓS)', 230);
INSERT INTO public.empresa VALUES (2765, true, 1, '2023-07-02 12:35:24.941197', NULL, NULL, false, 'INSTITUTO NACIONAL DE TELECOMUNICAÇÕES (INATEL)', 753);
INSERT INTO public.empresa VALUES (2766, true, 1, '2023-07-02 12:35:24.942281', NULL, NULL, false, 'INSTITUTO PARAIBANO DE ENSINO RENOVADO (INPER)', 107);
INSERT INTO public.empresa VALUES (2767, true, 1, '2023-07-02 12:35:24.943646', NULL, NULL, false, 'INSTITUTO PLENITUDE EDUCAÇÃO (IPLENI)', 8);
INSERT INTO public.empresa VALUES (2768, true, 1, '2023-07-02 12:35:24.94518', NULL, NULL, false, 'INSTITUTO POLITÉCNICO DOCTUM DE VITÓRIA', 25);
INSERT INTO public.empresa VALUES (2769, true, 1, '2023-07-02 12:35:24.94647', NULL, NULL, false, 'INSTITUTO PROFESSOR FLÁVIO VELLINI', 8);
INSERT INTO public.empresa VALUES (2770, true, 1, '2023-07-02 12:35:24.947854', NULL, NULL, false, 'INSTITUTO RACINE DE EDUCAÇÃO SUPERIOR (RACINE)', 278);
INSERT INTO public.empresa VALUES (2771, true, 1, '2023-07-02 12:35:24.949188', NULL, NULL, false, 'INSTITUTO SALVADOR DE ENSINO E CULTURA (ISEC)', 116);
INSERT INTO public.empresa VALUES (2772, true, 1, '2023-07-02 12:35:24.950654', NULL, NULL, false, 'INSTITUTO SANTO TOMÁS DE AQUINO (ISTA)', 2);
INSERT INTO public.empresa VALUES (2773, true, 1, '2023-07-02 12:35:24.951986', NULL, NULL, false, 'INSTITUTO SÃO PAULO DE ESTUDOS SUPERIORES (ITESP)', 8);
INSERT INTO public.empresa VALUES (2774, true, 1, '2023-07-02 12:35:24.953325', NULL, NULL, false, 'INSTITUTO SERRA DOURADA', 14);
INSERT INTO public.empresa VALUES (2775, true, 1, '2023-07-02 12:35:24.954664', NULL, NULL, false, 'INSTITUTO SERZEDELLO CORRÊA (ISC-TCU)', 5);
INSERT INTO public.empresa VALUES (2776, true, 1, '2023-07-02 12:35:24.956002', NULL, NULL, false, 'INSTITUTO SOCIESC DE JARAGUÁ DO SUL (SOCIESC)', 31);
INSERT INTO public.empresa VALUES (2777, true, 1, '2023-07-02 12:35:24.957327', NULL, NULL, false, 'INSTITUTO SUPERIOR DA AFAC (ISAFAC)', 49);
INSERT INTO public.empresa VALUES (2778, true, 1, '2023-07-02 12:35:24.958679', NULL, NULL, false, 'INSTITUTO SUPERIOR DA CONVENÇÃO NAC. DAS ASSEMBLEIAS DE DEUS (ISCON)', 5);
INSERT INTO public.empresa VALUES (2779, true, 1, '2023-07-02 12:35:24.960015', NULL, NULL, false, 'INSTITUTO SUPERIOR DE CIÊNCIAS APLICADAS - ISCA (ISCA)', 276);
INSERT INTO public.empresa VALUES (2780, true, 1, '2023-07-02 12:35:24.961185', NULL, NULL, false, 'INSTITUTO SUPERIOR DE CIÊNCIAS DA SAÚDE CARLOS CHAGAS (IPGMCC)', 12);
INSERT INTO public.empresa VALUES (2781, true, 1, '2023-07-02 12:35:24.962504', NULL, NULL, false, 'INSTITUTO SUPERIOR DE CIÊNCIAS HUMANAS E SOCIAIS ANÍSIO TEIXEIRA (ISAT)', 623);
INSERT INTO public.empresa VALUES (2782, true, 1, '2023-07-02 12:35:24.96405', NULL, NULL, false, 'INSTITUTO SUPERIOR DE CIENCIAS POLICIAIS (ISCP)', 5);
INSERT INTO public.empresa VALUES (2783, true, 1, '2023-07-02 12:35:24.965675', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ALBERT EINSTEIN (ISALBE)', 5);
INSERT INTO public.empresa VALUES (2784, true, 1, '2023-07-02 12:35:24.967212', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ALMEIDA RODRIGUES (ISEAR)', 202);
INSERT INTO public.empresa VALUES (2785, true, 1, '2023-07-02 12:35:24.968857', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ANTONINO FREIRE - ISEAF (ISEAF)', 27);
INSERT INTO public.empresa VALUES (2786, true, 1, '2023-07-02 12:35:24.970309', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ATENEU (ISEAT)', 226);
INSERT INTO public.empresa VALUES (2787, true, 1, '2023-07-02 12:35:24.971632', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO CERES (ISE-CERES)', 114);
INSERT INTO public.empresa VALUES (2788, true, 1, '2023-07-02 12:35:24.972991', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DA ZONA OESTE (ISE ZONA OESTE)', 12);
INSERT INTO public.empresa VALUES (2789, true, 1, '2023-07-02 12:35:24.974314', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE BARRETOS (ISEB)', 80);
INSERT INTO public.empresa VALUES (2790, true, 1, '2023-07-02 12:35:24.975707', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE CAXIAS (ISEC)', 97);
INSERT INTO public.empresa VALUES (2791, true, 1, '2023-07-02 12:35:24.977189', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE GOIANA (I.S.E.G.)', 400);
INSERT INTO public.empresa VALUES (2792, true, 1, '2023-07-02 12:35:24.978536', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE GUARATUBA (ISEPE GUARATUBA)', 559);
INSERT INTO public.empresa VALUES (2793, true, 1, '2023-07-02 12:35:24.979863', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE SÃO PAULO (SINGULARIDADES/ISESP)', 8);
INSERT INTO public.empresa VALUES (2794, true, 1, '2023-07-02 12:35:24.981248', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO CECAP (ISCECAP)', 5);
INSERT INTO public.empresa VALUES (2795, true, 1, '2023-07-02 12:35:24.982739', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO CENTRO EDUCACIONAL NOSSA SENHORA AUXILIADORA (ISECENSA)', 160);
INSERT INTO public.empresa VALUES (2796, true, 1, '2023-07-02 12:35:24.984239', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO MUNICÍPIO DE ITAPERUNA (ISEMI)', 186);
INSERT INTO public.empresa VALUES (2797, true, 1, '2023-07-02 12:35:24.985738', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO RIO DE JANEIRO (ISERJ)', 12);
INSERT INTO public.empresa VALUES (2798, true, 1, '2023-07-02 12:35:24.9872', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO SERTÃO DO PAJEÚ (ISESP)', 574);
INSERT INTO public.empresa VALUES (2799, true, 1, '2023-07-02 12:35:24.988692', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO SUL DO PIAUÍ (ISESPI)', 763);
INSERT INTO public.empresa VALUES (2800, true, 1, '2023-07-02 12:35:24.990018', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ELVIRA DAYRELL (ISEED)', 578);
INSERT INTO public.empresa VALUES (2801, true, 1, '2023-07-02 12:35:24.991353', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO IBITURUNA', 128);
INSERT INTO public.empresa VALUES (2802, true, 1, '2023-07-02 12:35:24.992434', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO IVOTI (ISEI)', 764);
INSERT INTO public.empresa VALUES (2803, true, 1, '2023-07-02 12:35:24.993785', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO OCIDENTE (OCIDEMNTE)', 116);
INSERT INTO public.empresa VALUES (2804, true, 1, '2023-07-02 12:35:24.995119', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO PROFESSOR ALDO MUYLAERT (ISEPAM)', 160);
INSERT INTO public.empresa VALUES (2805, true, 1, '2023-07-02 12:35:24.996461', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO PROFESSORA NAIR FORTES ABU-MERHY (ISEFOR)', 397);
INSERT INTO public.empresa VALUES (2806, true, 1, '2023-07-02 12:35:24.997838', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO PRÓ-SABER (ISEPS)', 12);
INSERT INTO public.empresa VALUES (2807, true, 1, '2023-07-02 12:35:24.999186', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO SANTA CRUZ (ISED)', 687);
INSERT INTO public.empresa VALUES (2808, true, 1, '2023-07-02 12:35:25.000647', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO VERA CRUZ (ISE VERA CRUZ)', 8);
INSERT INTO public.empresa VALUES (2809, true, 1, '2023-07-02 12:35:25.001974', NULL, NULL, false, 'INSTITUTO SUPERIOR DE FILOSOFIA BERTHIER (IFIBE)', 282);
INSERT INTO public.empresa VALUES (2810, true, 1, '2023-07-02 12:35:25.003304', NULL, NULL, false, 'INSTITUTO SUPERIOR DE TECNOLOGIA EM HORTICULTURA (ISTHORTICULTURA)', 160);
INSERT INTO public.empresa VALUES (2811, true, 1, '2023-07-02 12:35:25.00466', NULL, NULL, false, 'INSTITUTO SUPERIOR DO LITORAL DO PARANÁ (ISULPAR)', 661);
INSERT INTO public.empresa VALUES (2812, true, 1, '2023-07-02 12:35:25.005986', NULL, NULL, false, 'INSTITUTO SUPERIOR DO MINISTERIO PUBLICO (ISMP)', 12);
INSERT INTO public.empresa VALUES (2813, true, 1, '2023-07-02 12:35:25.007285', NULL, NULL, false, 'INSTITUTO SUPERIOR E CENTRO EDUCACIONAL LUTERANO - BOM JESUS - IELUSC (BOM JESUS/IELUSC)', 68);
INSERT INTO public.empresa VALUES (2814, true, 1, '2023-07-02 12:35:25.008459', NULL, NULL, false, 'INSTITUTO TAQUARITINGUENSE DE ENSINO SUPERIOR DR. ARISTIDES DE CARVALHO SCHLOBACH (ITES)', 517);
INSERT INTO public.empresa VALUES (2815, true, 1, '2023-07-02 12:35:25.009629', NULL, NULL, false, 'INSTITUTO TAUBATÉ DE ENSINO SUPERIOR (I.T.E.S.)', 33);
INSERT INTO public.empresa VALUES (2816, true, 1, '2023-07-02 12:35:25.010804', NULL, NULL, false, 'INSTITUTO TECNOLÓGICO DE AERONÁUTICA (ITA)', 144);
INSERT INTO public.empresa VALUES (2817, true, 1, '2023-07-02 12:35:25.011966', NULL, NULL, false, 'INSTITUTO TECNOLÓGICO E DAS CIÊNCIAS SOCIAIS APLICADAS E DA SAÚDE DO CENTRO EDUC. N. SRª AUXILIADORA (ITCSAS/CENSA)', 160);
INSERT INTO public.empresa VALUES (2818, true, 1, '2023-07-02 12:35:25.013339', NULL, NULL, false, 'INSTITUTO TEOLÓGICO FRANCISCANO (ITF)', 53);
INSERT INTO public.empresa VALUES (2819, true, 1, '2023-07-02 12:35:25.014692', NULL, NULL, false, 'INSTITUTO TOCANTINENSE PRESIDENTE ANTONIO CARLOS (ITPAC)', 23);
INSERT INTO public.empresa VALUES (2820, true, 1, '2023-07-02 12:35:25.015747', NULL, NULL, false, 'INSTITUTO UNA DE ITABIRA (UNA)', 161);
INSERT INTO public.empresa VALUES (2821, true, 1, '2023-07-02 12:35:25.017064', NULL, NULL, false, 'INSTITUTO UNIVERSITÁRIO SÃO JUDAS DE GUARULHOS', 100);
INSERT INTO public.empresa VALUES (2822, true, 1, '2023-07-02 12:35:25.018275', NULL, NULL, false, 'INSTITUTO UNIVERSITÁRIO SÃO JUDAS DE SÃO BERNARDO DO CAMPO', 82);
INSERT INTO public.empresa VALUES (2823, true, 1, '2023-07-02 12:35:25.019593', NULL, NULL, false, 'INSTITUTO UNIVERSITÁRIO UNA DE CATALÃO (CATALANA)', 17);
INSERT INTO public.empresa VALUES (2824, true, 1, '2023-07-02 12:35:25.020928', NULL, NULL, false, 'INSTITUTO UNIVERSITÁRIO UNA DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (2825, true, 1, '2023-07-02 12:35:25.022272', NULL, NULL, false, 'INTERNATIONAL OROFACIAL ACADEMY RP (IOA RP)', 58);
INSERT INTO public.empresa VALUES (2826, true, 1, '2023-07-02 12:35:25.023606', NULL, NULL, false, 'IPD INSTITUTO DE PROFISSIONALIZAÇÃO DIGITAL (IPD)', 8);
INSERT INTO public.empresa VALUES (2827, true, 1, '2023-07-02 12:35:25.024956', NULL, NULL, false, 'IPOG - INSTITUTO DE PÓS-GRADUAÇÃO & GRADUAÇÃO (IPOG)', 42);
INSERT INTO public.empresa VALUES (2828, true, 1, '2023-07-02 12:35:25.026286', NULL, NULL, false, 'ISTITUTO EUROPEO DI DESIGN (IED SP)', 8);
INSERT INTO public.empresa VALUES (2829, true, 1, '2023-07-02 12:35:25.027621', NULL, NULL, false, 'ITPAC CRUZEIRO DO SUL (ITPAC - CZ)', 431);
INSERT INTO public.empresa VALUES (2830, true, 1, '2023-07-02 12:35:25.028919', NULL, NULL, false, 'ITPAC ITACOATIARA (ITPAC ITA)', 637);
INSERT INTO public.empresa VALUES (2831, true, 1, '2023-07-02 12:35:25.030101', NULL, NULL, false, 'ITPAC MANACAPURU (ITPAC MANACA)', 262);
INSERT INTO public.empresa VALUES (2832, true, 1, '2023-07-02 12:35:25.031445', NULL, NULL, false, 'L2 LABOR (L2 LABOR)', 765);
INSERT INTO public.empresa VALUES (2833, true, 1, '2023-07-02 12:35:25.032776', NULL, NULL, false, 'LIBERTAS - FACULDADES INTEGRADAS (LIBERTAS)', 316);
INSERT INTO public.empresa VALUES (2834, true, 1, '2023-07-02 12:35:25.034118', NULL, NULL, false, 'LINK SCHOOL OF BUSINESS (LSB)', 8);
INSERT INTO public.empresa VALUES (2835, true, 1, '2023-07-02 12:35:25.035276', NULL, NULL, false, 'NOVA FACULDADE (NF)', 200);
INSERT INTO public.empresa VALUES (2836, true, 1, '2023-07-02 12:35:25.036441', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE CAMPINAS (PUC-CAMPINAS)', 177);
INSERT INTO public.empresa VALUES (2837, true, 1, '2023-07-02 12:35:25.03779', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE GOIÁS (PUC GOIÁS)', 42);
INSERT INTO public.empresa VALUES (2838, true, 1, '2023-07-02 12:35:25.038876', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE MINAS GERAIS (PUC MINAS)', 2);
INSERT INTO public.empresa VALUES (2839, true, 1, '2023-07-02 12:35:25.040222', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE SÃO PAULO (PUCSP)', 8);
INSERT INTO public.empresa VALUES (2840, true, 1, '2023-07-02 12:35:25.04156', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO PARANÁ (PUCPR)', 56);
INSERT INTO public.empresa VALUES (2841, true, 1, '2023-07-02 12:35:25.04291', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO RIO DE JANEIRO (PUC-RIO)', 12);
INSERT INTO public.empresa VALUES (2842, true, 1, '2023-07-02 12:35:25.044252', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO RIO GRANDE DO SUL (PUCRS)', 149);
INSERT INTO public.empresa VALUES (2843, true, 1, '2023-07-02 12:35:25.045583', NULL, NULL, false, 'PROFESSOR EDSON ANTÔNIO VELANO (UNIFENAS)', 674);
INSERT INTO public.empresa VALUES (2844, true, 1, '2023-07-02 12:35:25.046926', NULL, NULL, false, 'RATIO - FACULDADE TEOLÓGICA E FILOSÓFICA (RATIO)', 45);
INSERT INTO public.empresa VALUES (2845, true, 1, '2023-07-02 12:35:25.048259', NULL, NULL, false, 'REAL FACULDADE DE BRASÍLIA (FU)', 5);
INSERT INTO public.empresa VALUES (2846, true, 1, '2023-07-02 12:35:25.049598', NULL, NULL, false, 'SINAL FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS (SINAL)', 143);
INSERT INTO public.empresa VALUES (2847, true, 1, '2023-07-02 12:35:25.050941', NULL, NULL, false, 'SIRIUS ESCOLA SUPERIOR DE TECNOLOGIA (SIRIUS)', 2);
INSERT INTO public.empresa VALUES (2848, true, 1, '2023-07-02 12:35:25.052239', NULL, NULL, false, 'SISTEMA EDUCACIONAL CORPORATIVO DA PETROBRAS', 12);
INSERT INTO public.empresa VALUES (2849, true, 1, '2023-07-02 12:35:25.05358', NULL, NULL, false, 'SISTEMAS DE ENSINO EM CIÊNCIAS E TECNOLOGIAS (SECTRAS)', 107);
INSERT INTO public.empresa VALUES (2850, true, 1, '2023-07-02 12:35:25.054925', NULL, NULL, false, 'SOBERANA FACULDADE DE SAÚDE DE PETROLINA (SOBERANA)', 445);
INSERT INTO public.empresa VALUES (2851, true, 1, '2023-07-02 12:35:25.056256', NULL, NULL, false, 'SOBRESP - FACULDADE DE CIÊNCIAS DA SAÚDE (SOBRESP)', 417);
INSERT INTO public.empresa VALUES (2852, true, 1, '2023-07-02 12:35:25.057604', NULL, NULL, false, 'STRONG BUSINESS SCHOOL', 47);
INSERT INTO public.empresa VALUES (2853, true, 1, '2023-07-02 12:35:25.058932', NULL, NULL, false, 'STRONG BUSINESS SCHOOL BS', 171);
INSERT INTO public.empresa VALUES (2854, true, 1, '2023-07-02 12:35:25.060105', NULL, NULL, false, 'SUSTENTARE ESCOLA DE NEGÓCIOS (SUSTENTARE)', 68);
INSERT INTO public.empresa VALUES (2855, true, 1, '2023-07-02 12:35:25.061446', NULL, NULL, false, 'SVT FACULDADE DE ENSINO SUPERIOR (SVT)', 141);
INSERT INTO public.empresa VALUES (2856, true, 1, '2023-07-02 12:35:25.062527', NULL, NULL, false, 'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS (TREVISAN)', 8);
INSERT INTO public.empresa VALUES (2857, true, 1, '2023-07-02 12:35:25.063889', NULL, NULL, false, 'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS', 12);
INSERT INTO public.empresa VALUES (2858, true, 1, '2023-07-02 12:35:25.065225', NULL, NULL, false, 'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS- (TEN)', 766);
INSERT INTO public.empresa VALUES (2859, true, 1, '2023-07-02 12:35:25.066548', NULL, NULL, false, 'UGV CENTRO UNIVERSITÁRIO', 119);
INSERT INTO public.empresa VALUES (2860, true, 1, '2023-07-02 12:35:25.06788', NULL, NULL, false, 'UNAMA FACULDADE DA AMAZÔNIA DE BOA VISTA (UNAMA)', 138);
INSERT INTO public.empresa VALUES (2861, true, 1, '2023-07-02 12:35:25.069548', NULL, NULL, false, 'UNAMA FACULDADE DA AMAZÔNIA DE MACAPÁ', 26);
INSERT INTO public.empresa VALUES (2862, true, 1, '2023-07-02 12:35:25.070898', NULL, NULL, false, 'UNAMA FACULDADE DA AMAZÔNIA DE RIO BRANCO (FMN RIO BRANCO)', 143);
INSERT INTO public.empresa VALUES (2863, true, 1, '2023-07-02 12:35:25.072261', NULL, NULL, false, 'UNETRI FACULDADES (UNETRI)', 767);
INSERT INTO public.empresa VALUES (2864, true, 1, '2023-07-02 12:35:25.073622', NULL, NULL, false, 'UNIÃO DAS FACULDADES DOS GRANDES LAGOS (UNILAGO)', 114);
INSERT INTO public.empresa VALUES (2865, true, 1, '2023-07-02 12:35:25.074932', NULL, NULL, false, 'UNICORP FACULDADES (UNICORP)', 107);
INSERT INTO public.empresa VALUES (2866, true, 1, '2023-07-02 12:35:25.076224', NULL, NULL, false, 'UNIVERSIDADE ALTO VALE DO RIO DO PEIXE (UNIARP)', 699);
INSERT INTO public.empresa VALUES (2867, true, 1, '2023-07-02 12:35:25.077415', NULL, NULL, false, 'UNIVERSIDADE ANHANGUERA (UNIDERP)', 48);
INSERT INTO public.empresa VALUES (2868, true, 1, '2023-07-02 12:35:25.078738', NULL, NULL, false, 'UNIVERSIDADE ANHANGUERA DE SÃO PAULO (UNIAN - SP)', 8);
INSERT INTO public.empresa VALUES (2869, true, 1, '2023-07-02 12:35:25.080077', NULL, NULL, false, 'UNIVERSIDADE ANHEMBI MORUMBI (UAM)', 8);
INSERT INTO public.empresa VALUES (2870, true, 1, '2023-07-02 12:35:25.081431', NULL, NULL, false, 'UNIVERSIDADE BRASIL (UB)', 8);
INSERT INTO public.empresa VALUES (2871, true, 1, '2023-07-02 12:35:25.082772', NULL, NULL, false, 'UNIVERSIDADE CÂNDIDO MENDES (UCAM)', 12);
INSERT INTO public.empresa VALUES (2872, true, 1, '2023-07-02 12:35:25.084096', NULL, NULL, false, 'UNIVERSIDADE CASTELO BRANCO (UCB)', 12);
INSERT INTO public.empresa VALUES (2873, true, 1, '2023-07-02 12:35:25.085428', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE BRASÍLIA (UCB)', 5);
INSERT INTO public.empresa VALUES (2874, true, 1, '2023-07-02 12:35:25.086336', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE PELOTAS (UCPEL)', 283);
INSERT INTO public.empresa VALUES (2875, true, 1, '2023-07-02 12:35:25.087675', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE PERNAMBUCO (UNICAP)', 60);
INSERT INTO public.empresa VALUES (2876, true, 1, '2023-07-02 12:35:25.089015', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE PETRÓPOLIS (UCP)', 53);
INSERT INTO public.empresa VALUES (2877, true, 1, '2023-07-02 12:35:25.090184', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE SANTOS (UNISANTOS)', 171);
INSERT INTO public.empresa VALUES (2878, true, 1, '2023-07-02 12:35:25.091352', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DOM BOSCO (UCDB)', 48);
INSERT INTO public.empresa VALUES (2879, true, 1, '2023-07-02 12:35:25.092689', NULL, NULL, false, 'UNIVERSIDADE CESUMAR (UNICESUMAR)', 76);
INSERT INTO public.empresa VALUES (2880, true, 1, '2023-07-02 12:35:25.094075', NULL, NULL, false, 'UNIVERSIDADE CEUMA (UNICEUMA)', 141);
INSERT INTO public.empresa VALUES (2881, true, 1, '2023-07-02 12:35:25.095382', NULL, NULL, false, 'UNIVERSIDADE CIDADE DE SÃO PAULO (UNICID)', 8);
INSERT INTO public.empresa VALUES (2882, true, 1, '2023-07-02 12:35:25.09654', NULL, NULL, false, 'UNIVERSIDADE COMUNITÁRIA DA REGIÃO DE CHAPECÓ (UNOCHAPECÓ)', 406);
INSERT INTO public.empresa VALUES (2883, true, 1, '2023-07-02 12:35:25.097899', NULL, NULL, false, 'UNIVERSIDADE CRUZEIRO DO SUL (UNICSUL)', 8);
INSERT INTO public.empresa VALUES (2884, true, 1, '2023-07-02 12:35:25.099209', NULL, NULL, false, 'UNIVERSIDADE DA AMAZÔNIA (UNAMA)', 79);
INSERT INTO public.empresa VALUES (2885, true, 1, '2023-07-02 12:35:25.100545', NULL, NULL, false, 'UNIVERSIDADE DA INTEGRAÇÃO INTERNACIONAL DA LUSOFONIA AFRO-BRASILEIRA (UNILAB)', 768);
INSERT INTO public.empresa VALUES (2886, true, 1, '2023-07-02 12:35:25.10188', NULL, NULL, false, 'UNIVERSIDADE DA REGIÃO DE JOINVILLE (UNIVILLE)', 68);
INSERT INTO public.empresa VALUES (2887, true, 1, '2023-07-02 12:35:25.10322', NULL, NULL, false, 'UNIVERSIDADE DE ARARAQUARA (UNIARA)', 378);
INSERT INTO public.empresa VALUES (2888, true, 1, '2023-07-02 12:35:25.104563', NULL, NULL, false, 'UNIVERSIDADE DE BRASÍLIA (UNB)', 5);
INSERT INTO public.empresa VALUES (2889, true, 1, '2023-07-02 12:35:25.105905', NULL, NULL, false, 'UNIVERSIDADE DE CAXIAS DO SUL (UCS)', 87);
INSERT INTO public.empresa VALUES (2890, true, 1, '2023-07-02 12:35:25.10726', NULL, NULL, false, 'UNIVERSIDADE DE CRUZ ALTA (UNICRUZ)', 769);
INSERT INTO public.empresa VALUES (2891, true, 1, '2023-07-02 12:35:25.108575', NULL, NULL, false, 'UNIVERSIDADE DE CUIABÁ (UNIC/UNIME)', 203);
INSERT INTO public.empresa VALUES (2892, true, 1, '2023-07-02 12:35:25.109653', NULL, NULL, false, 'UNIVERSIDADE DE FORTALEZA (UNIFOR)', 45);
INSERT INTO public.empresa VALUES (2893, true, 1, '2023-07-02 12:35:25.111005', NULL, NULL, false, 'UNIVERSIDADE DE FRANCA (UNIFRAN)', 179);
INSERT INTO public.empresa VALUES (2894, true, 1, '2023-07-02 12:35:25.112334', NULL, NULL, false, 'UNIVERSIDADE DE GURUPI (UNIRG)', 770);
INSERT INTO public.empresa VALUES (2895, true, 1, '2023-07-02 12:35:25.113685', NULL, NULL, false, 'UNIVERSIDADE DE ITAÚNA (UI)', 598);
INSERT INTO public.empresa VALUES (2896, true, 1, '2023-07-02 12:35:25.115004', NULL, NULL, false, 'UNIVERSIDADE DE MARÍLIA (UNIMAR)', 145);
INSERT INTO public.empresa VALUES (2897, true, 1, '2023-07-02 12:35:25.116181', NULL, NULL, false, 'UNIVERSIDADE DE MOGI DAS CRUZES (UMC)', 62);
INSERT INTO public.empresa VALUES (2898, true, 1, '2023-07-02 12:35:25.117511', NULL, NULL, false, 'UNIVERSIDADE DE PASSO FUNDO (UPF)', 282);
INSERT INTO public.empresa VALUES (2899, true, 1, '2023-07-02 12:35:25.118854', NULL, NULL, false, 'UNIVERSIDADE DE PERNAMBUCO (UPE)', 60);
INSERT INTO public.empresa VALUES (2900, true, 1, '2023-07-02 12:35:25.120185', NULL, NULL, false, 'UNIVERSIDADE DE RIBEIRÃO PRETO (UNAERP)', 58);
INSERT INTO public.empresa VALUES (2901, true, 1, '2023-07-02 12:35:25.121366', NULL, NULL, false, 'UNIVERSIDADE DE RIO VERDE (FESURV)', 202);
INSERT INTO public.empresa VALUES (2902, true, 1, '2023-07-02 12:35:25.122699', NULL, NULL, false, 'UNIVERSIDADE DE SANTA CRUZ DO SUL (UNISC)', 561);
INSERT INTO public.empresa VALUES (2903, true, 1, '2023-07-02 12:35:25.123993', NULL, NULL, false, 'UNIVERSIDADE DE SÃO PAULO (USP)', 8);
INSERT INTO public.empresa VALUES (2904, true, 1, '2023-07-02 12:35:25.125344', NULL, NULL, false, 'UNIVERSIDADE DE SOROCABA (UNISO)', 146);
INSERT INTO public.empresa VALUES (2905, true, 1, '2023-07-02 12:35:25.126686', NULL, NULL, false, 'UNIVERSIDADE DE TAUBATÉ (UNITAU)', 33);
INSERT INTO public.empresa VALUES (2906, true, 1, '2023-07-02 12:35:25.127849', NULL, NULL, false, 'UNIVERSIDADE DE UBERABA (UNIUBE)', 118);
INSERT INTO public.empresa VALUES (2907, true, 1, '2023-07-02 12:35:25.129015', NULL, NULL, false, 'UNIVERSIDADE DE VASSOURAS (UNIVASSOURAS)', 771);
INSERT INTO public.empresa VALUES (2908, true, 1, '2023-07-02 12:35:25.130365', NULL, NULL, false, 'UNIVERSIDADE DO CONTESTADO (UNC)', 772);
INSERT INTO public.empresa VALUES (2909, true, 1, '2023-07-02 12:35:25.131703', NULL, NULL, false, 'UNIVERSIDADE DO DISTRITO FEDERAL (UNDF)', 5);
INSERT INTO public.empresa VALUES (2910, true, 1, '2023-07-02 12:35:25.132777', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DA BAHIA (UNEB)', 116);
INSERT INTO public.empresa VALUES (2911, true, 1, '2023-07-02 12:35:25.134118', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DE MATO GROSSO CARLOS ALBERTO REYES MALDONADO - UNEMAT (UNEMAT)', 590);
INSERT INTO public.empresa VALUES (2912, true, 1, '2023-07-02 12:35:25.135464', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DE MINAS GERAIS (UEMG)', 2);
INSERT INTO public.empresa VALUES (2913, true, 1, '2023-07-02 12:35:25.136811', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO AMAPÁ (UEAP)', 26);
INSERT INTO public.empresa VALUES (2914, true, 1, '2023-07-02 12:35:25.138191', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO AMAZONAS (UEA)', 75);
INSERT INTO public.empresa VALUES (2915, true, 1, '2023-07-02 12:35:25.139504', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO PARÁ (UEPA)', 79);
INSERT INTO public.empresa VALUES (2916, true, 1, '2023-07-02 12:35:25.14084', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO (UERJ)', 12);
INSERT INTO public.empresa VALUES (2917, true, 1, '2023-07-02 12:35:25.142175', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO RIO GRANDE DO NORTE (UERN)', 323);
INSERT INTO public.empresa VALUES (2918, true, 1, '2023-07-02 12:35:25.143498', NULL, NULL, false, 'UNIVERSIDADE DO EXTREMO SUL CATARINENSE (UNESC)', 192);
INSERT INTO public.empresa VALUES (2919, true, 1, '2023-07-02 12:35:25.144832', NULL, NULL, false, 'UNIVERSIDADE DO GRANDE RIO PROFESSOR JOSÉ DE SOUZA HERDY (UNIGRANRIO)', 436);
INSERT INTO public.empresa VALUES (2920, true, 1, '2023-07-02 12:35:25.146153', NULL, NULL, false, 'UNIVERSIDADE DO OESTE DE SANTA CATARINA (UNOESC)', 773);
INSERT INTO public.empresa VALUES (2921, true, 1, '2023-07-02 12:35:25.147511', NULL, NULL, false, 'UNIVERSIDADE DO OESTE PAULISTA (UNOESTE)', 50);
INSERT INTO public.empresa VALUES (2922, true, 1, '2023-07-02 12:35:25.148998', NULL, NULL, false, 'UNIVERSIDADE DO PLANALTO CATARINENSE (UNIPLAC)', 148);
INSERT INTO public.empresa VALUES (2923, true, 1, '2023-07-02 12:35:25.150322', NULL, NULL, false, 'UNIVERSIDADE DO SUL DE SANTA CATARINA (UNISUL)', 701);
INSERT INTO public.empresa VALUES (2924, true, 1, '2023-07-02 12:35:25.15168', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO ITAJAÍ (UNIVALI)', 345);
INSERT INTO public.empresa VALUES (2925, true, 1, '2023-07-02 12:35:25.153015', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO PARAÍBA (UNIVAP)', 144);
INSERT INTO public.empresa VALUES (2926, true, 1, '2023-07-02 12:35:25.154332', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO RIO DOS SINOS (UNISINOS)', 703);
INSERT INTO public.empresa VALUES (2927, true, 1, '2023-07-02 12:35:25.155679', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO SAPUCAÍ (UNIVÁS)', 230);
INSERT INTO public.empresa VALUES (2928, true, 1, '2023-07-02 12:35:25.156763', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO TAQUARI (UNIVATES)', 774);
INSERT INTO public.empresa VALUES (2929, true, 1, '2023-07-02 12:35:25.157937', NULL, NULL, false, 'UNIVERSIDADE ESTÁCIO DE SÁ (UNESA)', 12);
INSERT INTO public.empresa VALUES (2930, true, 1, '2023-07-02 12:35:25.159279', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DA PARAÍBA (UEPB)', 147);
INSERT INTO public.empresa VALUES (2931, true, 1, '2023-07-02 12:35:25.16061', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DA REGIÃO TOCANTINA DO MARANHÃO (UEMASUL)', 267);
INSERT INTO public.empresa VALUES (2932, true, 1, '2023-07-02 12:35:25.161946', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE ALAGOAS - UNEAL (UNEAL)', 333);
INSERT INTO public.empresa VALUES (2933, true, 1, '2023-07-02 12:35:25.163287', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE CAMPINAS (UNICAMP)', 177);
INSERT INTO public.empresa VALUES (2934, true, 1, '2023-07-02 12:35:25.164626', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE CIÊNCIAS DA SAÚDE DE ALAGOAS - UNCISAL (UNCISAL)', 73);
INSERT INTO public.empresa VALUES (2935, true, 1, '2023-07-02 12:35:25.165792', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE FEIRA DE SANTANA (UEFS)', 99);
INSERT INTO public.empresa VALUES (2936, true, 1, '2023-07-02 12:35:25.167108', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE GOIÁS (UEG)', 264);
INSERT INTO public.empresa VALUES (2937, true, 1, '2023-07-02 12:35:25.168274', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE LONDRINA (UEL)', 159);
INSERT INTO public.empresa VALUES (2938, true, 1, '2023-07-02 12:35:25.169604', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE MARINGÁ (UEM)', 76);
INSERT INTO public.empresa VALUES (2939, true, 1, '2023-07-02 12:35:25.170948', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE MATO GROSSO DO SUL (UEMS)', 84);
INSERT INTO public.empresa VALUES (2940, true, 1, '2023-07-02 12:35:25.172281', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE MONTES CLAROS (UNIMONTES)', 128);
INSERT INTO public.empresa VALUES (2941, true, 1, '2023-07-02 12:35:25.173486', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE PONTA GROSSA (UEPG)', 188);
INSERT INTO public.empresa VALUES (2942, true, 1, '2023-07-02 12:35:25.174649', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE RORAIMA (UERR)', 138);
INSERT INTO public.empresa VALUES (2943, true, 1, '2023-07-02 12:35:25.175818', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE SANTA CRUZ (UESC)', 20);
INSERT INTO public.empresa VALUES (2944, true, 1, '2023-07-02 12:35:25.177006', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO CEARÁ (UECE)', 45);
INSERT INTO public.empresa VALUES (2945, true, 1, '2023-07-02 12:35:25.178336', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO CENTRO OESTE (UNICENTRO)', 64);
INSERT INTO public.empresa VALUES (2946, true, 1, '2023-07-02 12:35:25.17942', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO MARANHÃO (UEMA)', 141);
INSERT INTO public.empresa VALUES (2947, true, 1, '2023-07-02 12:35:25.180588', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO NORTE DO PARANÁ (UENP)', 775);
INSERT INTO public.empresa VALUES (2948, true, 1, '2023-07-02 12:35:25.181936', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO NORTE FLUMINENSE DARCY RIBEIRO (UENF)', 160);
INSERT INTO public.empresa VALUES (2949, true, 1, '2023-07-02 12:35:25.183281', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO OESTE DO PARANÁ (UNIOESTE)', 54);
INSERT INTO public.empresa VALUES (2950, true, 1, '2023-07-02 12:35:25.184601', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO PARANÁ (UNESPAR)', 211);
INSERT INTO public.empresa VALUES (2951, true, 1, '2023-07-02 12:35:25.185936', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO PIAUÍ (UESPI)', 27);
INSERT INTO public.empresa VALUES (2952, true, 1, '2023-07-02 12:35:25.187288', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO RIO GRANDE DO SUL (UERGS)', 149);
INSERT INTO public.empresa VALUES (2953, true, 1, '2023-07-02 12:35:25.188614', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO SUDOESTE DA BAHIA (UESB)', 37);
INSERT INTO public.empresa VALUES (2954, true, 1, '2023-07-02 12:35:25.189923', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO TOCANTINS (UNITINS)', 23);
INSERT INTO public.empresa VALUES (2955, true, 1, '2023-07-02 12:35:25.191085', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL PAULISTA JÚLIO DE MESQUITA FILHO (UNESP)', 8);
INSERT INTO public.empresa VALUES (2956, true, 1, '2023-07-02 12:35:25.192431', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL VALE DO ACARAÚ (UVA)', 167);
INSERT INTO public.empresa VALUES (2957, true, 1, '2023-07-02 12:35:25.19376', NULL, NULL, false, 'UNIVERSIDADE EVANGÉLICA DE GOIÁS (UNIEVANGÉLICA)', 264);
INSERT INTO public.empresa VALUES (2958, true, 1, '2023-07-02 12:35:25.194942', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DA BAHIA (UFBA)', 116);
INSERT INTO public.empresa VALUES (2959, true, 1, '2023-07-02 12:35:25.196116', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DA FRONTEIRA SUL (UFFS)', 406);
INSERT INTO public.empresa VALUES (2960, true, 1, '2023-07-02 12:35:25.19751', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DA INTEGRAÇÃO LATINO-AMERICANA (UNILA)', 124);
INSERT INTO public.empresa VALUES (2961, true, 1, '2023-07-02 12:35:25.198812', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DA PARAÍBA (UFPB)', 107);
INSERT INTO public.empresa VALUES (2962, true, 1, '2023-07-02 12:35:25.200135', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE ALAGOAS (UFAL)', 73);
INSERT INTO public.empresa VALUES (2963, true, 1, '2023-07-02 12:35:25.201485', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE ALFENAS (UNIFAL-MG)', 674);
INSERT INTO public.empresa VALUES (2964, true, 1, '2023-07-02 12:35:25.20257', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE CAMPINA GRANDE (UFCG)', 147);
INSERT INTO public.empresa VALUES (2965, true, 1, '2023-07-02 12:35:25.20391', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE CATALÃO (UFCAT)', 17);
INSERT INTO public.empresa VALUES (2966, true, 1, '2023-07-02 12:35:25.20526', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE GOIÁS (UFG)', 42);
INSERT INTO public.empresa VALUES (2967, true, 1, '2023-07-02 12:35:25.206759', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE ITAJUBÁ - UNIFEI (UNIFEI)', 103);
INSERT INTO public.empresa VALUES (2968, true, 1, '2023-07-02 12:35:25.208092', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE JATAÍ (UFJ)', 21);
INSERT INTO public.empresa VALUES (2969, true, 1, '2023-07-02 12:35:25.209427', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE JUIZ DE FORA (UFJF)', 38);
INSERT INTO public.empresa VALUES (2970, true, 1, '2023-07-02 12:35:25.210776', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE LAVRAS (UFLA)', 108);
INSERT INTO public.empresa VALUES (2971, true, 1, '2023-07-02 12:35:25.212261', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE MATO GROSSO (UFMT)', 203);
INSERT INTO public.empresa VALUES (2972, true, 1, '2023-07-02 12:35:25.213577', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE MATO GROSSO DO SUL (UFMS)', 48);
INSERT INTO public.empresa VALUES (2973, true, 1, '2023-07-02 12:35:25.214943', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE MINAS GERAIS (UFMG)', 2);
INSERT INTO public.empresa VALUES (2974, true, 1, '2023-07-02 12:35:25.21627', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE OURO PRETO (UFOP)', 776);
INSERT INTO public.empresa VALUES (2975, true, 1, '2023-07-02 12:35:25.217621', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE PELOTAS (UFPEL)', 283);
INSERT INTO public.empresa VALUES (2976, true, 1, '2023-07-02 12:35:25.218937', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE PERNAMBUCO (UFPE)', 60);
INSERT INTO public.empresa VALUES (2977, true, 1, '2023-07-02 12:35:25.220274', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE RONDONÓPOLIS (UFR)', 287);
INSERT INTO public.empresa VALUES (2978, true, 1, '2023-07-02 12:35:25.221616', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE RORAIMA (UFRR)', 138);
INSERT INTO public.empresa VALUES (2979, true, 1, '2023-07-02 12:35:25.222954', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SANTA CATARINA (UFSC)', 3);
INSERT INTO public.empresa VALUES (2980, true, 1, '2023-07-02 12:35:25.22429', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SANTA MARIA (UFSM)', 417);
INSERT INTO public.empresa VALUES (2981, true, 1, '2023-07-02 12:35:25.22545', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SÃO CARLOS (UFSCAR)', 72);
INSERT INTO public.empresa VALUES (2982, true, 1, '2023-07-02 12:35:25.226537', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SÃO JOÃO DEL REI (UFSJ)', 185);
INSERT INTO public.empresa VALUES (2983, true, 1, '2023-07-02 12:35:25.227884', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SÃO PAULO (UNIFESP)', 8);
INSERT INTO public.empresa VALUES (2984, true, 1, '2023-07-02 12:35:25.229208', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SERGIPE (UFS)', 777);
INSERT INTO public.empresa VALUES (2985, true, 1, '2023-07-02 12:35:25.230583', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE UBERLÂNDIA (UFU)', 134);
INSERT INTO public.empresa VALUES (2986, true, 1, '2023-07-02 12:35:25.231907', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE VIÇOSA (UFV)', 122);
INSERT INTO public.empresa VALUES (2987, true, 1, '2023-07-02 12:35:25.233257', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO ACRE (UFAC)', 143);
INSERT INTO public.empresa VALUES (2988, true, 1, '2023-07-02 12:35:25.234553', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO AGRESTE DE PERNAMBUCO (UFAPE )', 483);
INSERT INTO public.empresa VALUES (2989, true, 1, '2023-07-02 12:35:25.235893', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO AMAPÁ (UNIFAP)', 26);
INSERT INTO public.empresa VALUES (2990, true, 1, '2023-07-02 12:35:25.23726', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO AMAZONAS (UFAM)', 75);
INSERT INTO public.empresa VALUES (2991, true, 1, '2023-07-02 12:35:25.238572', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO CARIRI (UFCA)', 135);
INSERT INTO public.empresa VALUES (2992, true, 1, '2023-07-02 12:35:25.239908', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO CEARÁ (UFC)', 45);
INSERT INTO public.empresa VALUES (2993, true, 1, '2023-07-02 12:35:25.241256', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO DELTA DO PARNAIBA (UFDPAR)', 176);
INSERT INTO public.empresa VALUES (2994, true, 1, '2023-07-02 12:35:25.242622', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO ESPÍRITO SANTO (UFES)', 25);
INSERT INTO public.empresa VALUES (2995, true, 1, '2023-07-02 12:35:25.24394', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO ESTADO DO RIO DE JANEIRO (UNIRIO)', 12);
INSERT INTO public.empresa VALUES (2996, true, 1, '2023-07-02 12:35:25.245298', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO MARANHÃO (UFMA)', 141);
INSERT INTO public.empresa VALUES (2997, true, 1, '2023-07-02 12:35:25.246608', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO OESTE DA BAHIA (UFOB)', 174);
INSERT INTO public.empresa VALUES (2998, true, 1, '2023-07-02 12:35:25.247981', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO OESTE DO PARÁ (UFOPA)', 78);
INSERT INTO public.empresa VALUES (2999, true, 1, '2023-07-02 12:35:25.249306', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO PARÁ (UFPA)', 79);
INSERT INTO public.empresa VALUES (3000, true, 1, '2023-07-02 12:35:25.250584', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO PARANÁ (UFPR)', 56);
INSERT INTO public.empresa VALUES (3001, true, 1, '2023-07-02 12:35:25.252062', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO PIAUÍ (UFPI)', 27);
INSERT INTO public.empresa VALUES (3002, true, 1, '2023-07-02 12:35:25.253434', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RECÔNCAVO DA BAHIA (UFRB)', 172);
INSERT INTO public.empresa VALUES (3003, true, 1, '2023-07-02 12:35:25.254754', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RIO DE JANEIRO (UFRJ)', 12);
INSERT INTO public.empresa VALUES (3004, true, 1, '2023-07-02 12:35:25.256071', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RIO GRANDE (FURG)', 298);
INSERT INTO public.empresa VALUES (3005, true, 1, '2023-07-02 12:35:25.257418', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RIO GRANDE DO NORTE (UFRN)', 130);
INSERT INTO public.empresa VALUES (3006, true, 1, '2023-07-02 12:35:25.258867', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL (UFRGS)', 149);
INSERT INTO public.empresa VALUES (3007, true, 1, '2023-07-02 12:35:25.26021', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO SUL DA BAHIA (UFSB)', 269);
INSERT INTO public.empresa VALUES (3008, true, 1, '2023-07-02 12:35:25.261552', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO SUL E SUDESTE DO PARÁ (UNIFESSPA)', 46);
INSERT INTO public.empresa VALUES (3009, true, 1, '2023-07-02 12:35:25.262909', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DOS VALES DO JEQUITINHONHA E MUCURI (UFVJM)', 778);
INSERT INTO public.empresa VALUES (3010, true, 1, '2023-07-02 12:35:25.264277', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO TRIÂNGULO MINEIRO (UFTM)', 118);
INSERT INTO public.empresa VALUES (3011, true, 1, '2023-07-02 12:35:25.265741', NULL, NULL, false, 'UNIVERSIDADE FEDERAL FLUMINENSE (UFF)', 49);
INSERT INTO public.empresa VALUES (3012, true, 1, '2023-07-02 12:35:25.267084', NULL, NULL, false, 'UNIVERSIDADE FEDERAL RURAL DA AMAZÔNIA (UFRA)', 79);
INSERT INTO public.empresa VALUES (3013, true, 1, '2023-07-02 12:35:25.268463', NULL, NULL, false, 'UNIVERSIDADE FEDERAL RURAL DE PERNAMBUCO (UFRPE)', 60);
INSERT INTO public.empresa VALUES (3014, true, 1, '2023-07-02 12:35:25.269924', NULL, NULL, false, 'UNIVERSIDADE FEDERAL RURAL DO RIO DE JANEIRO (UFRRJ)', 779);
INSERT INTO public.empresa VALUES (3015, true, 1, '2023-07-02 12:35:25.271306', NULL, NULL, false, 'UNIVERSIDADE FEDERAL RURAL DO SEMI-ÁRIDO (UFERSA)', 323);
INSERT INTO public.empresa VALUES (3016, true, 1, '2023-07-02 12:35:25.272626', NULL, NULL, false, 'UNIVERSIDADE FEEVALE (FEEVALE)', 541);
INSERT INTO public.empresa VALUES (3017, true, 1, '2023-07-02 12:35:25.273938', NULL, NULL, false, 'UNIVERSIDADE FRANCISCANA (UFN)', 417);
INSERT INTO public.empresa VALUES (3018, true, 1, '2023-07-02 12:35:25.275026', NULL, NULL, false, 'UNIVERSIDADE FUMEC (FUMEC)', 2);
INSERT INTO public.empresa VALUES (3019, true, 1, '2023-07-02 12:35:25.276394', NULL, NULL, false, 'UNIVERSIDADE IBIRAPUERA (UNIB)', 8);
INSERT INTO public.empresa VALUES (3020, true, 1, '2023-07-02 12:35:25.277736', NULL, NULL, false, 'UNIVERSIDADE IGUAÇU (UNIG)', 780);
INSERT INTO public.empresa VALUES (3021, true, 1, '2023-07-02 12:35:25.279283', NULL, NULL, false, 'UNIVERSIDADE LA SALLE (UNILASALLE)', 542);
INSERT INTO public.empresa VALUES (3022, true, 1, '2023-07-02 12:35:25.280768', NULL, NULL, false, 'UNIVERSIDADE LUTERANA DO BRASIL (ULBRA)', 542);
INSERT INTO public.empresa VALUES (3023, true, 1, '2023-07-02 12:35:25.282063', NULL, NULL, false, 'UNIVERSIDADE METODISTA DE PIRACICABA (UNIMEP)', 224);
INSERT INTO public.empresa VALUES (3024, true, 1, '2023-07-02 12:35:25.283384', NULL, NULL, false, 'UNIVERSIDADE METODISTA DE SÃO PAULO (UMESP)', 82);
INSERT INTO public.empresa VALUES (3025, true, 1, '2023-07-02 12:35:25.284726', NULL, NULL, false, 'UNIVERSIDADE METROPOLITANA DE SANTOS (UNIMES)', 171);
INSERT INTO public.empresa VALUES (3026, true, 1, '2023-07-02 12:35:25.286069', NULL, NULL, false, 'UNIVERSIDADE MUNICIPAL DE SÃO CAETANO DO SUL (USCS)', 126);
INSERT INTO public.empresa VALUES (3027, true, 1, '2023-07-02 12:35:25.287406', NULL, NULL, false, 'UNIVERSIDADE NILTON LINS (UNINILTONLINS)', 75);
INSERT INTO public.empresa VALUES (3028, true, 1, '2023-07-02 12:35:25.288744', NULL, NULL, false, 'UNIVERSIDADE NOVE DE JULHO (UNINOVE)', 8);
INSERT INTO public.empresa VALUES (3029, true, 1, '2023-07-02 12:35:25.290079', NULL, NULL, false, 'UNIVERSIDADE PARANAENSE (UNIPAR)', 251);
INSERT INTO public.empresa VALUES (3030, true, 1, '2023-07-02 12:35:25.291404', NULL, NULL, false, 'UNIVERSIDADE PAULISTA (UNIP)', 8);
INSERT INTO public.empresa VALUES (3031, true, 1, '2023-07-02 12:35:25.292724', NULL, NULL, false, 'UNIVERSIDADE PITÁGORAS UNOPAR ANHANGUERA', 159);
INSERT INTO public.empresa VALUES (3032, true, 1, '2023-07-02 12:35:25.294117', NULL, NULL, false, 'UNIVERSIDADE POSITIVO (UP)', 56);
INSERT INTO public.empresa VALUES (3033, true, 1, '2023-07-02 12:35:25.295439', NULL, NULL, false, 'UNIVERSIDADE POTIGUAR (UNP)', 130);
INSERT INTO public.empresa VALUES (3034, true, 1, '2023-07-02 12:35:25.296758', NULL, NULL, false, 'UNIVERSIDADE PRESBITERIANA MACKENZIE (MACKENZIE)', 8);
INSERT INTO public.empresa VALUES (3035, true, 1, '2023-07-02 12:35:25.298111', NULL, NULL, false, 'UNIVERSIDADE REGIONAL DE BLUMENAU (FURB)', 193);
INSERT INTO public.empresa VALUES (3036, true, 1, '2023-07-02 12:35:25.299165', NULL, NULL, false, 'UNIVERSIDADE REGIONAL DO CARIRI (URCA)', 310);
INSERT INTO public.empresa VALUES (3037, true, 1, '2023-07-02 12:35:25.300502', NULL, NULL, false, 'UNIVERSIDADE REGIONAL DO NOROESTE DO ESTADO DO RIO GRANDE DO SUL (UNIJUI)', 311);
INSERT INTO public.empresa VALUES (3038, true, 1, '2023-07-02 12:35:25.301875', NULL, NULL, false, 'UNIVERSIDADE REGIONAL INTEGRADA DO ALTO URUGUAI E DAS MISSÕES (URI)', 415);
INSERT INTO public.empresa VALUES (3039, true, 1, '2023-07-02 12:35:25.30319', NULL, NULL, false, 'UNIVERSIDADE SALGADO DE OLIVEIRA (UNIVERSO)', 623);
INSERT INTO public.empresa VALUES (3040, true, 1, '2023-07-02 12:35:25.30452', NULL, NULL, false, 'UNIVERSIDADE SALVADOR (UNIFACS)', 116);
INSERT INTO public.empresa VALUES (3041, true, 1, '2023-07-02 12:35:25.305858', NULL, NULL, false, 'UNIVERSIDADE SANTA CECÍLIA (UNISANTA)', 171);
INSERT INTO public.empresa VALUES (3042, true, 1, '2023-07-02 12:35:25.307173', NULL, NULL, false, 'UNIVERSIDADE SANTA ÚRSULA (USU)', 12);
INSERT INTO public.empresa VALUES (3043, true, 1, '2023-07-02 12:35:25.308513', NULL, NULL, false, 'UNIVERSIDADE SANTO AMARO (UNISA)', 8);
INSERT INTO public.empresa VALUES (3044, true, 1, '2023-07-02 12:35:25.309837', NULL, NULL, false, 'UNIVERSIDADE SÃO FRANCISCO (USF)', 404);
INSERT INTO public.empresa VALUES (3045, true, 1, '2023-07-02 12:35:25.311184', NULL, NULL, false, 'UNIVERSIDADE SÃO JUDAS TADEU (USJT)', 8);
INSERT INTO public.empresa VALUES (3046, true, 1, '2023-07-02 12:35:25.312357', NULL, NULL, false, 'UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ (UTFPR)', 56);
INSERT INTO public.empresa VALUES (3047, true, 1, '2023-07-02 12:35:25.313761', NULL, NULL, false, 'UNIVERSIDADE TIRADENTES (UNIT)', 142);
INSERT INTO public.empresa VALUES (3048, true, 1, '2023-07-02 12:35:25.315061', NULL, NULL, false, 'UNIVERSIDADE TUIUTI DO PARANÁ (UTP)', 56);
INSERT INTO public.empresa VALUES (3049, true, 1, '2023-07-02 12:35:25.316388', NULL, NULL, false, 'UNIVERSIDADE UNIVERSUS VERITAS GUARULHOS (UNIVERITAS UNG)', 100);
INSERT INTO public.empresa VALUES (3050, true, 1, '2023-07-02 12:35:25.317736', NULL, NULL, false, 'UNIVERSIDADE VALE DO RIO DOCE (UNIVALE)', 265);
INSERT INTO public.empresa VALUES (3051, true, 1, '2023-07-02 12:35:25.319115', NULL, NULL, false, 'UNIVERSIDADE VEIGA DE ALMEIDA (UVA)', 12);
INSERT INTO public.empresa VALUES (3052, true, 1, '2023-07-02 12:35:25.3206', NULL, NULL, false, 'UNIVERSIDADE VILA VELHA (UVV)', 226);
INSERT INTO public.empresa VALUES (3053, true, 1, '2023-07-02 12:35:25.321922', NULL, NULL, false, 'UNIVERSIDADE VIRTUAL DO ESTADO DO MARANHÃO (UNIVIMA)', 141);
INSERT INTO public.empresa VALUES (3054, true, 1, '2023-07-02 12:35:25.322979', NULL, NULL, false, 'VOAS - INSTITUTO DE APRENDIZAGEM SUPERIOR (VOAS)', 116);


--
-- TOC entry 3727 (class 0 OID 142433)
-- Dependencies: 242
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.endereco VALUES (1, true, 1, '2023-07-02 12:35:17.228614', NULL, NULL, 'BELFORD ROXO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (2, true, 1, '2023-07-02 12:35:17.230621', NULL, NULL, 'BELO HORIZONTE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (3, true, 1, '2023-07-02 12:35:17.237929', NULL, NULL, 'FLORIANÓPOLIS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (4, true, 1, '2023-07-02 12:35:17.239943', NULL, NULL, 'RESENDE', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (5, true, 1, '2023-07-02 12:35:17.241461', NULL, NULL, 'BRASÍLIA', NULL, 'DF', 'BRASIL');
INSERT INTO public.endereco VALUES (6, true, 1, '2023-07-02 12:35:17.242945', NULL, NULL, 'JUÍNA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (7, true, 1, '2023-07-02 12:35:17.244278', NULL, NULL, 'TEÓFILO OTONI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (8, true, 1, '2023-07-02 12:35:17.24565', NULL, NULL, 'SÃO PAULO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (9, true, 1, '2023-07-02 12:35:17.255151', NULL, NULL, 'CACIMBINHAS', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (10, true, 1, '2023-07-02 12:35:17.256907', NULL, NULL, 'VOTUPORANGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (11, true, 1, '2023-07-02 12:35:17.258547', NULL, NULL, 'INDAIATUBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (12, true, 1, '2023-07-02 12:35:17.260016', NULL, NULL, 'RIO DE JANEIRO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (13, true, 1, '2023-07-02 12:35:17.261462', NULL, NULL, 'FRANCISCO BELTRÃO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (14, true, 1, '2023-07-02 12:35:17.262662', NULL, NULL, 'ALTAMIRA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (15, true, 1, '2023-07-02 12:35:17.270053', NULL, NULL, 'ARCOVERDE', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (16, true, 1, '2023-07-02 12:35:17.272428', NULL, NULL, 'BACABEIRA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (17, true, 1, '2023-07-02 12:35:17.27426', NULL, NULL, 'CATALÃO', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (18, true, 1, '2023-07-02 12:35:17.275694', NULL, NULL, 'CONSELHEIRO LAFAIETE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (19, true, 1, '2023-07-02 12:35:17.277043', NULL, NULL, 'DIVINÓPOLIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (20, true, 1, '2023-07-02 12:35:17.278539', NULL, NULL, 'ILHÉUS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (21, true, 1, '2023-07-02 12:35:17.288174', NULL, NULL, 'JATAÍ', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (22, true, 1, '2023-07-02 12:35:17.290109', NULL, NULL, 'LORENA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (23, true, 1, '2023-07-02 12:35:17.291766', NULL, NULL, 'PALMAS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (24, true, 1, '2023-07-02 12:35:17.293231', NULL, NULL, 'SETE LAGOAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (25, true, 1, '2023-07-02 12:35:17.29471', NULL, NULL, 'VITÓRIA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (26, true, 1, '2023-07-02 12:35:17.296269', NULL, NULL, 'MACAPÁ', NULL, 'AP', 'BRASIL');
INSERT INTO public.endereco VALUES (27, true, 1, '2023-07-02 12:35:17.303778', NULL, NULL, 'TERESINA', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (28, true, 1, '2023-07-02 12:35:17.305918', NULL, NULL, 'BELÉM DE SÃO FRANCISCO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (29, true, 1, '2023-07-02 12:35:17.307621', NULL, NULL, 'SARANDI', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (30, true, 1, '2023-07-02 12:35:17.309063', NULL, NULL, 'GUAPORÉ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (31, true, 1, '2023-07-02 12:35:17.310369', NULL, NULL, 'JARAGUÁ DO SUL', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (32, true, 1, '2023-07-02 12:35:17.31149', NULL, NULL, 'BARBACENA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (33, true, 1, '2023-07-02 12:35:17.321162', NULL, NULL, 'TAUBATÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (34, true, 1, '2023-07-02 12:35:17.323351', NULL, NULL, 'ESPÍRITO SANTO DO PINHAL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (35, true, 1, '2023-07-02 12:35:17.325143', NULL, NULL, 'MACHADO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (36, true, 1, '2023-07-02 12:35:17.326731', NULL, NULL, 'ASSIS CHATEAUBRIAND', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (37, true, 1, '2023-07-02 12:35:17.328051', NULL, NULL, 'VITÓRIA DA CONQUISTA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (38, true, 1, '2023-07-02 12:35:17.329455', NULL, NULL, 'JUIZ DE FORA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (39, true, 1, '2023-07-02 12:35:17.336772', NULL, NULL, 'OLINDA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (40, true, 1, '2023-07-02 12:35:17.338875', NULL, NULL, 'PARIPIRANGA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (41, true, 1, '2023-07-02 12:35:17.340638', NULL, NULL, 'APARECIDA DE GOIÂNIA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (42, true, 1, '2023-07-02 12:35:17.342103', NULL, NULL, 'GOIÂNIA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (43, true, 1, '2023-07-02 12:35:17.343602', NULL, NULL, 'AMPARO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (44, true, 1, '2023-07-02 12:35:17.344992', NULL, NULL, 'LEME', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (45, true, 1, '2023-07-02 12:35:17.354141', NULL, NULL, 'FORTALEZA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (46, true, 1, '2023-07-02 12:35:17.356195', NULL, NULL, 'MARABÁ', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (47, true, 1, '2023-07-02 12:35:17.357774', NULL, NULL, 'SANTO ANDRÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (48, true, 1, '2023-07-02 12:35:17.359262', NULL, NULL, 'CAMPO GRANDE', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (49, true, 1, '2023-07-02 12:35:17.360762', NULL, NULL, 'NITERÓI', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (50, true, 1, '2023-07-02 12:35:17.361999', NULL, NULL, 'PRESIDENTE PRUDENTE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (51, true, 1, '2023-07-02 12:35:17.369069', NULL, NULL, 'PORTO VELHO', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (52, true, 1, '2023-07-02 12:35:17.370604', NULL, NULL, 'LUÍS EDUARDO MAGALHÃES', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (53, true, 1, '2023-07-02 12:35:17.37246', NULL, NULL, 'PETRÓPOLIS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (54, true, 1, '2023-07-02 12:35:17.374016', NULL, NULL, 'CASCAVEL', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (55, true, 1, '2023-07-02 12:35:17.375539', NULL, NULL, 'PARACATU', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (56, true, 1, '2023-07-02 12:35:17.377027', NULL, NULL, 'CURITIBA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (57, true, 1, '2023-07-02 12:35:17.385939', NULL, NULL, 'BALNEÁRIO CAMBORIÚ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (58, true, 1, '2023-07-02 12:35:17.387473', NULL, NULL, 'RIBEIRÃO PRETO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (59, true, 1, '2023-07-02 12:35:17.388951', NULL, NULL, 'ORLEANS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (60, true, 1, '2023-07-02 12:35:17.390397', NULL, NULL, 'RECIFE', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (61, true, 1, '2023-07-02 12:35:17.391735', NULL, NULL, 'SÃO LUÍS DE MONTES BELOS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (62, true, 1, '2023-07-02 12:35:17.393163', NULL, NULL, 'MOGI DAS CRUZES', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (63, true, 1, '2023-07-02 12:35:17.400419', NULL, NULL, 'CAMPO LIMPO PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (64, true, 1, '2023-07-02 12:35:17.402005', NULL, NULL, 'GUARAPUAVA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (65, true, 1, '2023-07-02 12:35:17.403539', NULL, NULL, 'COLATINA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (66, true, 1, '2023-07-02 12:35:17.405413', NULL, NULL, 'BARRA DO GARÇAS', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (67, true, 1, '2023-07-02 12:35:17.407239', NULL, NULL, 'QUIXADÁ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (68, true, 1, '2023-07-02 12:35:17.408643', NULL, NULL, 'JOINVILLE', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (69, true, 1, '2023-07-02 12:35:17.417524', NULL, NULL, 'CORONEL FABRICIANO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (70, true, 1, '2023-07-02 12:35:17.418863', NULL, NULL, 'LINS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (71, true, 1, '2023-07-02 12:35:17.420368', NULL, NULL, 'OSÓRIO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (72, true, 1, '2023-07-02 12:35:17.422086', NULL, NULL, 'SÃO CARLOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (73, true, 1, '2023-07-02 12:35:17.423652', NULL, NULL, 'MACEIÓ', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (74, true, 1, '2023-07-02 12:35:17.425204', NULL, NULL, 'CACHOEIRINHA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (75, true, 1, '2023-07-02 12:35:17.432304', NULL, NULL, 'MANAUS', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (76, true, 1, '2023-07-02 12:35:17.433767', NULL, NULL, 'MARINGÁ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (77, true, 1, '2023-07-02 12:35:17.435089', NULL, NULL, 'BENTO GONÇALVES', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (78, true, 1, '2023-07-02 12:35:17.436485', NULL, NULL, 'SANTARÉM', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (79, true, 1, '2023-07-02 12:35:17.438258', NULL, NULL, 'BELÉM', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (80, true, 1, '2023-07-02 12:35:17.440357', NULL, NULL, 'BARRETOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (81, true, 1, '2023-07-02 12:35:17.449304', NULL, NULL, 'GUAXUPÉ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (82, true, 1, '2023-07-02 12:35:17.450876', NULL, NULL, 'SÃO BERNARDO DO CAMPO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (83, true, 1, '2023-07-02 12:35:17.452167', NULL, NULL, 'ARARAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (84, true, 1, '2023-07-02 12:35:17.453541', NULL, NULL, 'DOURADOS', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (85, true, 1, '2023-07-02 12:35:17.455125', NULL, NULL, 'SÃO JOSÉ DOS PINHAIS', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (86, true, 1, '2023-07-02 12:35:17.456324', NULL, NULL, 'BAGÉ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (87, true, 1, '2023-07-02 12:35:17.463559', NULL, NULL, 'CAXIAS DO SUL', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (88, true, 1, '2023-07-02 12:35:17.465103', NULL, NULL, 'SÃO JOÃO DA BOA VISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (89, true, 1, '2023-07-02 12:35:17.466438', NULL, NULL, 'OURINHOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (90, true, 1, '2023-07-02 12:35:17.467798', NULL, NULL, 'VITÓRIA DE SANTO ANTÃO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (91, true, 1, '2023-07-02 12:35:17.469109', NULL, NULL, 'ADAMANTINA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (92, true, 1, '2023-07-02 12:35:17.470667', NULL, NULL, 'BARRA MANSA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (93, true, 1, '2023-07-02 12:35:17.479578', NULL, NULL, 'BAURU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (94, true, 1, '2023-07-02 12:35:17.481061', NULL, NULL, 'BRUSQUE', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (95, true, 1, '2023-07-02 12:35:17.4824', NULL, NULL, 'CARATINGA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (96, true, 1, '2023-07-02 12:35:17.483903', NULL, NULL, 'SANTO ANTÔNIO DE JESUS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (97, true, 1, '2023-07-02 12:35:17.485225', NULL, NULL, 'CAXIAS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (98, true, 1, '2023-07-02 12:35:17.486668', NULL, NULL, 'LUZIÂNIA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (99, true, 1, '2023-07-02 12:35:17.493935', NULL, NULL, 'FEIRA DE SANTANA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (100, true, 1, '2023-07-02 12:35:17.49564', NULL, NULL, 'GUARULHOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (101, true, 1, '2023-07-02 12:35:17.496967', NULL, NULL, 'FORMIGA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (102, true, 1, '2023-07-02 12:35:17.498296', NULL, NULL, 'GOIATUBA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (103, true, 1, '2023-07-02 12:35:17.499613', NULL, NULL, 'ITAJUBÁ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (104, true, 1, '2023-07-02 12:35:17.500779', NULL, NULL, 'ITAPIRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (105, true, 1, '2023-07-02 12:35:17.509917', NULL, NULL, 'JAGUARIÚNA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (106, true, 1, '2023-07-02 12:35:17.511398', NULL, NULL, 'JALES', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (107, true, 1, '2023-07-02 12:35:17.512724', NULL, NULL, 'JOÃO PESSOA', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (108, true, 1, '2023-07-02 12:35:17.514083', NULL, NULL, 'LAVRAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (109, true, 1, '2023-07-02 12:35:17.515378', NULL, NULL, 'MINEIROS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (110, true, 1, '2023-07-02 12:35:17.516773', NULL, NULL, 'PATO BRANCO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (111, true, 1, '2023-07-02 12:35:17.52394', NULL, NULL, 'PATOS', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (112, true, 1, '2023-07-02 12:35:17.525433', NULL, NULL, 'PATOS DE MINAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (113, true, 1, '2023-07-02 12:35:17.526774', NULL, NULL, 'PAULÍNIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (114, true, 1, '2023-07-02 12:35:17.528113', NULL, NULL, 'SÃO JOSÉ DO RIO PRETO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (115, true, 1, '2023-07-02 12:35:17.529442', NULL, NULL, 'CACOAL', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (116, true, 1, '2023-07-02 12:35:17.530812', NULL, NULL, 'SALVADOR', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (117, true, 1, '2023-07-02 12:35:17.539815', NULL, NULL, 'SANTA FÉ DO SUL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (118, true, 1, '2023-07-02 12:35:17.54156', NULL, NULL, 'UBERABA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (119, true, 1, '2023-07-02 12:35:17.543027', NULL, NULL, 'UNIÃO DA VITÓRIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (120, true, 1, '2023-07-02 12:35:17.544505', NULL, NULL, 'VALENÇA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (121, true, 1, '2023-07-02 12:35:17.545827', NULL, NULL, 'VÁRZEA GRANDE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (122, true, 1, '2023-07-02 12:35:17.546971', NULL, NULL, 'VIÇOSA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (123, true, 1, '2023-07-02 12:35:17.554211', NULL, NULL, 'VOLTA REDONDA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (124, true, 1, '2023-07-02 12:35:17.556066', NULL, NULL, 'FOZ DO IGUAÇU', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (125, true, 1, '2023-07-02 12:35:17.557646', NULL, NULL, 'PATROCÍNIO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (126, true, 1, '2023-07-02 12:35:17.559142', NULL, NULL, 'SÃO CAETANO DO SUL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (127, true, 1, '2023-07-02 12:35:17.560658', NULL, NULL, 'GUARUJÁ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (128, true, 1, '2023-07-02 12:35:17.562204', NULL, NULL, 'MONTES CLAROS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (129, true, 1, '2023-07-02 12:35:17.572117', NULL, NULL, 'ARAXÁ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (130, true, 1, '2023-07-02 12:35:17.574346', NULL, NULL, 'NATAL', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (131, true, 1, '2023-07-02 12:35:17.575924', NULL, NULL, 'PAULO AFONSO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (132, true, 1, '2023-07-02 12:35:17.577245', NULL, NULL, 'JABOATÃO DOS GUARARAPES', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (133, true, 1, '2023-07-02 12:35:17.578634', NULL, NULL, 'VARGINHA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (134, true, 1, '2023-07-02 12:35:17.579979', NULL, NULL, 'UBERLÂNDIA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (135, true, 1, '2023-07-02 12:35:17.587365', NULL, NULL, 'JUAZEIRO DO NORTE', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (136, true, 1, '2023-07-02 12:35:17.589172', NULL, NULL, 'ARACATI', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (137, true, 1, '2023-07-02 12:35:17.590605', NULL, NULL, 'REGISTRO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (138, true, 1, '2023-07-02 12:35:17.591952', NULL, NULL, 'BOA VISTA', NULL, 'RR', 'BRASIL');
INSERT INTO public.endereco VALUES (139, true, 1, '2023-07-02 12:35:17.593287', NULL, NULL, 'JI-PARANÁ', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (140, true, 1, '2023-07-02 12:35:17.59441', NULL, NULL, 'SÃO JOSÉ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (141, true, 1, '2023-07-02 12:35:17.603781', NULL, NULL, 'SÃO LUÍS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (142, true, 1, '2023-07-02 12:35:17.606149', NULL, NULL, 'ARACAJU', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (143, true, 1, '2023-07-02 12:35:17.607842', NULL, NULL, 'RIO BRANCO', NULL, 'AC', 'BRASIL');
INSERT INTO public.endereco VALUES (144, true, 1, '2023-07-02 12:35:17.609337', NULL, NULL, 'SÃO JOSÉ DOS CAMPOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (145, true, 1, '2023-07-02 12:35:17.610818', NULL, NULL, 'MARÍLIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (146, true, 1, '2023-07-02 12:35:17.612199', NULL, NULL, 'SOROCABA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (147, true, 1, '2023-07-02 12:35:17.61922', NULL, NULL, 'CAMPINA GRANDE', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (148, true, 1, '2023-07-02 12:35:17.620812', NULL, NULL, 'LAGES', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (149, true, 1, '2023-07-02 12:35:17.622556', NULL, NULL, 'PORTO ALEGRE', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (150, true, 1, '2023-07-02 12:35:17.623996', NULL, NULL, 'LAPA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (151, true, 1, '2023-07-02 12:35:17.625601', NULL, NULL, 'ARIQUEMES', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (152, true, 1, '2023-07-02 12:35:17.627269', NULL, NULL, 'ITAPIRANGA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (153, true, 1, '2023-07-02 12:35:17.636506', NULL, NULL, 'CAMAÇARI', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (154, true, 1, '2023-07-02 12:35:17.638852', NULL, NULL, 'MURIAÉ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (155, true, 1, '2023-07-02 12:35:17.640922', NULL, NULL, 'SINOP', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (156, true, 1, '2023-07-02 12:35:17.642377', NULL, NULL, 'CARUARU', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (157, true, 1, '2023-07-02 12:35:17.643836', NULL, NULL, 'GUANAMBI', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (158, true, 1, '2023-07-02 12:35:17.644934', NULL, NULL, 'OSASCO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (159, true, 1, '2023-07-02 12:35:17.651891', NULL, NULL, 'LONDRINA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (160, true, 1, '2023-07-02 12:35:17.653345', NULL, NULL, 'CAMPOS DOS GOYTACAZES', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (161, true, 1, '2023-07-02 12:35:17.655074', NULL, NULL, 'ITABIRA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (162, true, 1, '2023-07-02 12:35:17.657101', NULL, NULL, 'PINDAMONHANGABA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (163, true, 1, '2023-07-02 12:35:17.658666', NULL, NULL, 'UBÁ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (164, true, 1, '2023-07-02 12:35:17.66018', NULL, NULL, 'TRINDADE', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (165, true, 1, '2023-07-02 12:35:17.669204', NULL, NULL, 'GETÚLIO VARGAS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (166, true, 1, '2023-07-02 12:35:17.672227', NULL, NULL, 'ARAGUARI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (167, true, 1, '2023-07-02 12:35:17.674268', NULL, NULL, 'SOBRAL', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (168, true, 1, '2023-07-02 12:35:17.675863', NULL, NULL, 'CAMPO MOURÃO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (169, true, 1, '2023-07-02 12:35:17.677306', NULL, NULL, 'LUCAS DO RIO VERDE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (170, true, 1, '2023-07-02 12:35:17.678722', NULL, NULL, 'INDAIAL', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (171, true, 1, '2023-07-02 12:35:17.685819', NULL, NULL, 'SANTOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (172, true, 1, '2023-07-02 12:35:17.687574', NULL, NULL, 'CRUZ DAS ALMAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (173, true, 1, '2023-07-02 12:35:17.689543', NULL, NULL, 'MONTE CARMELO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (174, true, 1, '2023-07-02 12:35:17.69111', NULL, NULL, 'BARREIRAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (175, true, 1, '2023-07-02 12:35:17.692572', NULL, NULL, 'PAULISTA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (176, true, 1, '2023-07-02 12:35:17.693845', NULL, NULL, 'PARNAÍBA', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (177, true, 1, '2023-07-02 12:35:17.703021', NULL, NULL, 'CAMPINAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (178, true, 1, '2023-07-02 12:35:17.704876', NULL, NULL, 'CARAGUATATUBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (179, true, 1, '2023-07-02 12:35:17.706619', NULL, NULL, 'FRANCA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (180, true, 1, '2023-07-02 12:35:17.708071', NULL, NULL, 'ITU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (181, true, 1, '2023-07-02 12:35:17.70958', NULL, NULL, 'CATANDUVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (182, true, 1, '2023-07-02 12:35:17.710958', NULL, NULL, 'JUNDIAÍ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (183, true, 1, '2023-07-02 12:35:17.718073', NULL, NULL, 'RIO DO SUL', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (184, true, 1, '2023-07-02 12:35:17.719655', NULL, NULL, 'SUZANO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (185, true, 1, '2023-07-02 12:35:17.721152', NULL, NULL, 'SÃO JOÃO DEL REI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (186, true, 1, '2023-07-02 12:35:17.723025', NULL, NULL, 'ITAPERUNA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (187, true, 1, '2023-07-02 12:35:17.724648', NULL, NULL, 'AMERICANA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (188, true, 1, '2023-07-02 12:35:17.726008', NULL, NULL, 'PONTA GROSSA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (189, true, 1, '2023-07-02 12:35:17.735034', NULL, NULL, 'CAJAZEIRAS', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (190, true, 1, '2023-07-02 12:35:17.736916', NULL, NULL, 'CACHOEIRO DE ITAPEMIRIM', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (191, true, 1, '2023-07-02 12:35:17.739356', NULL, NULL, 'SÃO ROQUE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (192, true, 1, '2023-07-02 12:35:17.741137', NULL, NULL, 'CRICIÚMA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (193, true, 1, '2023-07-02 12:35:17.742841', NULL, NULL, 'BLUMENAU', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (194, true, 1, '2023-07-02 12:35:17.744405', NULL, NULL, 'TERESÓPOLIS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (195, true, 1, '2023-07-02 12:35:17.751624', NULL, NULL, 'AVARÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (196, true, 1, '2023-07-02 12:35:17.753134', NULL, NULL, 'ARAGUAÍNA', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (197, true, 1, '2023-07-02 12:35:17.754702', NULL, NULL, 'ARAÇATUBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (198, true, 1, '2023-07-02 12:35:17.756139', NULL, NULL, 'BETIM', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (199, true, 1, '2023-07-02 12:35:17.757469', NULL, NULL, 'BOM DESPACHO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (200, true, 1, '2023-07-02 12:35:17.758855', NULL, NULL, 'CONTAGEM', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (201, true, 1, '2023-07-02 12:35:17.768148', NULL, NULL, 'GUARAMIRIM', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (202, true, 1, '2023-07-02 12:35:17.769952', NULL, NULL, 'RIO VERDE', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (203, true, 1, '2023-07-02 12:35:17.772043', NULL, NULL, 'CUIABÁ', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (204, true, 1, '2023-07-02 12:35:17.774175', NULL, NULL, 'CABEDELO', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (205, true, 1, '2023-07-02 12:35:17.775819', NULL, NULL, 'ATIBAIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (206, true, 1, '2023-07-02 12:35:17.777308', NULL, NULL, 'ARAUCÁRIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (207, true, 1, '2023-07-02 12:35:17.784445', NULL, NULL, 'MANHUAÇU', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (208, true, 1, '2023-07-02 12:35:17.785977', NULL, NULL, 'BEBEDOURO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (209, true, 1, '2023-07-02 12:35:17.787342', NULL, NULL, 'LAURO DE FREITAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (210, true, 1, '2023-07-02 12:35:17.788994', NULL, NULL, 'TELÊMACO BORBA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (211, true, 1, '2023-07-02 12:35:17.790533', NULL, NULL, 'PARANAVAÍ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (212, true, 1, '2023-07-02 12:35:17.791783', NULL, NULL, 'TABOÃO DA SERRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (213, true, 1, '2023-07-02 12:35:17.8009', NULL, NULL, 'ALAGOINHAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (214, true, 1, '2023-07-02 12:35:17.802647', NULL, NULL, 'DOIS VIZINHOS', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (215, true, 1, '2023-07-02 12:35:17.804234', NULL, NULL, 'CAPIVARI DE BAIXO', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (216, true, 1, '2023-07-02 12:35:17.805773', NULL, NULL, 'SÃO MATEUS', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (217, true, 1, '2023-07-02 12:35:17.807342', NULL, NULL, 'TRÊS CORAÇÕES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (218, true, 1, '2023-07-02 12:35:17.808901', NULL, NULL, 'ICÓ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (219, true, 1, '2023-07-02 12:35:17.816179', NULL, NULL, 'MATIPÓ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (220, true, 1, '2023-07-02 12:35:17.817847', NULL, NULL, 'PIRIPIRI', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (221, true, 1, '2023-07-02 12:35:17.819182', NULL, NULL, 'BATATAIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (222, true, 1, '2023-07-02 12:35:17.820524', NULL, NULL, 'RIO CLARO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (223, true, 1, '2023-07-02 12:35:17.821914', NULL, NULL, 'ITÁPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (224, true, 1, '2023-07-02 12:35:17.823427', NULL, NULL, 'PIRACICABA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (225, true, 1, '2023-07-02 12:35:17.832631', NULL, NULL, 'GUARABIRA', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (226, true, 1, '2023-07-02 12:35:17.834139', NULL, NULL, 'VILA VELHA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (227, true, 1, '2023-07-02 12:35:17.835662', NULL, NULL, 'ABAETETUBA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (228, true, 1, '2023-07-02 12:35:17.837208', NULL, NULL, 'PARAGUAÇU PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (229, true, 1, '2023-07-02 12:35:17.838985', NULL, NULL, 'CRUZEIRO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (230, true, 1, '2023-07-02 12:35:17.840321', NULL, NULL, 'POUSO ALEGRE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (231, true, 1, '2023-07-02 12:35:17.847403', NULL, NULL, 'IGUATAMA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (232, true, 1, '2023-07-02 12:35:17.848922', NULL, NULL, 'ANANINDEUA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (233, true, 1, '2023-07-02 12:35:17.850273', NULL, NULL, 'SANTA TERESA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (234, true, 1, '2023-07-02 12:35:17.851781', NULL, NULL, 'ITUMBIARA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (235, true, 1, '2023-07-02 12:35:17.853299', NULL, NULL, 'TIANGUÁ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (236, true, 1, '2023-07-02 12:35:17.854887', NULL, NULL, 'ARAGUATINS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (237, true, 1, '2023-07-02 12:35:17.863857', NULL, NULL, 'BURITICUPU', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (238, true, 1, '2023-07-02 12:35:17.865586', NULL, NULL, 'MARIANA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (239, true, 1, '2023-07-02 12:35:17.867039', NULL, NULL, 'BENEVIDES', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (240, true, 1, '2023-07-02 12:35:17.868402', NULL, NULL, 'CACHOEIRA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (241, true, 1, '2023-07-02 12:35:17.869866', NULL, NULL, 'IVATUBA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (242, true, 1, '2023-07-02 12:35:17.871324', NULL, NULL, 'SÃO RAIMUNDO NONATO', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (243, true, 1, '2023-07-02 12:35:17.87856', NULL, NULL, 'SÃO FÉLIX DO XINGU', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (244, true, 1, '2023-07-02 12:35:17.880298', NULL, NULL, 'JACOBINA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (245, true, 1, '2023-07-02 12:35:17.881939', NULL, NULL, 'IRECÊ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (246, true, 1, '2023-07-02 12:35:17.883423', NULL, NULL, 'SENHOR DO BONFIM', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (247, true, 1, '2023-07-02 12:35:17.884912', NULL, NULL, 'TUCANO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (248, true, 1, '2023-07-02 12:35:17.886216', NULL, NULL, 'CAMPO NOVO DO PARECIS', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (249, true, 1, '2023-07-02 12:35:17.895303', NULL, NULL, 'ITURAMA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (250, true, 1, '2023-07-02 12:35:17.897039', NULL, NULL, 'PRAIA GRANDE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (251, true, 1, '2023-07-02 12:35:17.898584', NULL, NULL, 'UMUARAMA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (252, true, 1, '2023-07-02 12:35:17.900093', NULL, NULL, 'ALMENARA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (253, true, 1, '2023-07-02 12:35:17.901604', NULL, NULL, 'ARAÇUAÍ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (254, true, 1, '2023-07-02 12:35:17.903104', NULL, NULL, 'CAPELINHA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (255, true, 1, '2023-07-02 12:35:17.910307', NULL, NULL, 'GUANHÃES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (256, true, 1, '2023-07-02 12:35:17.911835', NULL, NULL, 'CASA NOVA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (257, true, 1, '2023-07-02 12:35:17.913088', NULL, NULL, 'PONTALINA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (258, true, 1, '2023-07-02 12:35:17.9144', NULL, NULL, 'REMANSO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (259, true, 1, '2023-07-02 12:35:17.915747', NULL, NULL, 'ITABERAÍ', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (260, true, 1, '2023-07-02 12:35:17.917127', NULL, NULL, 'ITAPEVI', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (261, true, 1, '2023-07-02 12:35:17.926043', NULL, NULL, 'ITABIRITO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (262, true, 1, '2023-07-02 12:35:17.927359', NULL, NULL, 'MANACAPURU', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (263, true, 1, '2023-07-02 12:35:17.928694', NULL, NULL, 'ALVORADA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (264, true, 1, '2023-07-02 12:35:17.930062', NULL, NULL, 'ANÁPOLIS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (265, true, 1, '2023-07-02 12:35:17.931403', NULL, NULL, 'GOVERNADOR VALADARES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (266, true, 1, '2023-07-02 12:35:17.932564', NULL, NULL, 'GUARAPARI', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (267, true, 1, '2023-07-02 12:35:17.940029', NULL, NULL, 'IMPERATRIZ', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (268, true, 1, '2023-07-02 12:35:17.941685', NULL, NULL, 'IPATINGA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (269, true, 1, '2023-07-02 12:35:17.943168', NULL, NULL, 'ITABUNA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (270, true, 1, '2023-07-02 12:35:17.944511', NULL, NULL, 'ITAPECERICA DA SERRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (271, true, 1, '2023-07-02 12:35:17.945843', NULL, NULL, 'ITAPETININGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (272, true, 1, '2023-07-02 12:35:17.947231', NULL, NULL, 'ITAPEVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (273, true, 1, '2023-07-02 12:35:17.956202', NULL, NULL, 'JACAREÍ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (274, true, 1, '2023-07-02 12:35:17.957559', NULL, NULL, 'JAÚ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (275, true, 1, '2023-07-02 12:35:17.958862', NULL, NULL, 'JEQUIÉ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (276, true, 1, '2023-07-02 12:35:17.960031', NULL, NULL, 'LIMEIRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (277, true, 1, '2023-07-02 12:35:17.961366', NULL, NULL, 'LINHARES', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (278, true, 1, '2023-07-02 12:35:17.962827', NULL, NULL, 'MATÃO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (279, true, 1, '2023-07-02 12:35:17.970047', NULL, NULL, 'MOGI GUAÇU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (280, true, 1, '2023-07-02 12:35:17.971763', NULL, NULL, 'PARAGOMINAS', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (281, true, 1, '2023-07-02 12:35:17.97268', NULL, NULL, 'PARAUAPEBAS', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (282, true, 1, '2023-07-02 12:35:17.981727', NULL, NULL, 'PASSO FUNDO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (283, true, 1, '2023-07-02 12:35:17.983037', NULL, NULL, 'PELOTAS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (284, true, 1, '2023-07-02 12:35:17.984369', NULL, NULL, 'POÇOS DE CALDAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (285, true, 1, '2023-07-02 12:35:17.985696', NULL, NULL, 'PRIMAVERA DO LESTE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (286, true, 1, '2023-07-02 12:35:17.98827', NULL, NULL, 'RIBEIRÃO DAS NEVES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (287, true, 1, '2023-07-02 12:35:17.989703', NULL, NULL, 'RONDONÓPOLIS', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (288, true, 1, '2023-07-02 12:35:17.997084', NULL, NULL, 'SANTA BÁRBARA D''OESTE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (289, true, 1, '2023-07-02 12:35:17.998621', NULL, NULL, 'SÃO JOÃO DE MERITI', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (290, true, 1, '2023-07-02 12:35:17.999998', NULL, NULL, 'SERRA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (291, true, 1, '2023-07-02 12:35:18.001419', NULL, NULL, 'SERTÃOZINHO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (292, true, 1, '2023-07-02 12:35:18.002847', NULL, NULL, 'SORRISO', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (293, true, 1, '2023-07-02 12:35:18.004198', NULL, NULL, 'SUMARÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (294, true, 1, '2023-07-02 12:35:18.013166', NULL, NULL, 'TANGARÁ DA SERRA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (295, true, 1, '2023-07-02 12:35:18.014484', NULL, NULL, 'TEIXEIRA DE FREITAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (296, true, 1, '2023-07-02 12:35:18.015809', NULL, NULL, 'VALINHOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (297, true, 1, '2023-07-02 12:35:18.017327', NULL, NULL, 'VALPARAÍSO DE GOIÁS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (298, true, 1, '2023-07-02 12:35:18.018825', NULL, NULL, 'RIO GRANDE', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (299, true, 1, '2023-07-02 12:35:18.020104', NULL, NULL, 'VOTORANTIM', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (300, true, 1, '2023-07-02 12:35:18.028261', NULL, NULL, 'RESTINGA SECA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (301, true, 1, '2023-07-02 12:35:18.032658', NULL, NULL, 'CURVELO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (302, true, 1, '2023-07-02 12:35:18.034124', NULL, NULL, 'PIRAPORA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (303, true, 1, '2023-07-02 12:35:18.035406', NULL, NULL, 'BRUMADINHO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (304, true, 1, '2023-07-02 12:35:18.036734', NULL, NULL, 'TOLEDO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (305, true, 1, '2023-07-02 12:35:18.038148', NULL, NULL, 'ASTORGA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (306, true, 1, '2023-07-02 12:35:18.047001', NULL, NULL, 'VALENÇA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (307, true, 1, '2023-07-02 12:35:18.048285', NULL, NULL, 'PASSOS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (308, true, 1, '2023-07-02 12:35:18.049625', NULL, NULL, 'PORTO SEGURO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (309, true, 1, '2023-07-02 12:35:18.051174', NULL, NULL, 'FERNANDÓPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (310, true, 1, '2023-07-02 12:35:18.052548', NULL, NULL, 'CRATO', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (311, true, 1, '2023-07-02 12:35:18.05395', NULL, NULL, 'IJUÍ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (312, true, 1, '2023-07-02 12:35:18.061258', NULL, NULL, 'BERTIOGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (313, true, 1, '2023-07-02 12:35:18.062651', NULL, NULL, 'BIRIGUI', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (314, true, 1, '2023-07-02 12:35:18.064074', NULL, NULL, 'BOA ESPERANÇA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (315, true, 1, '2023-07-02 12:35:18.065532', NULL, NULL, 'JABOTICABAL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (316, true, 1, '2023-07-02 12:35:18.066853', NULL, NULL, 'SÃO SEBASTIÃO DO PARAÍSO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (317, true, 1, '2023-07-02 12:35:18.06809', NULL, NULL, 'CAMAQUÃ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (318, true, 1, '2023-07-02 12:35:18.076979', NULL, NULL, 'CAMPO ERÊ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (319, true, 1, '2023-07-02 12:35:18.078545', NULL, NULL, 'CACHOEIRA PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (320, true, 1, '2023-07-02 12:35:18.079865', NULL, NULL, 'CASA BRANCA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (321, true, 1, '2023-07-02 12:35:18.081196', NULL, NULL, 'ARACRUZ', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (322, true, 1, '2023-07-02 12:35:18.082533', NULL, NULL, 'NOVO PROGRESSO', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (323, true, 1, '2023-07-02 12:35:18.083922', NULL, NULL, 'MOSSORÓ', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (324, true, 1, '2023-07-02 12:35:18.091368', NULL, NULL, 'ARAPUTANGA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (325, true, 1, '2023-07-02 12:35:18.093132', NULL, NULL, 'MACAÉ', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (326, true, 1, '2023-07-02 12:35:18.094434', NULL, NULL, 'CAICÓ', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (327, true, 1, '2023-07-02 12:35:18.095795', NULL, NULL, 'CAMBÉ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (328, true, 1, '2023-07-02 12:35:18.097108', NULL, NULL, 'CAPIVARI', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (329, true, 1, '2023-07-02 12:35:18.098475', NULL, NULL, 'RIO BONITO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (330, true, 1, '2023-07-02 12:35:18.107716', NULL, NULL, 'CRISTALINA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (331, true, 1, '2023-07-02 12:35:18.109211', NULL, NULL, 'CATANDUVAS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (332, true, 1, '2023-07-02 12:35:18.110575', NULL, NULL, 'IGUATU', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (333, true, 1, '2023-07-02 12:35:18.111887', NULL, NULL, 'ARAPIRACA', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (334, true, 1, '2023-07-02 12:35:18.113264', NULL, NULL, 'PALMEIRA DOS ÍNDIOS', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (335, true, 1, '2023-07-02 12:35:18.114394', NULL, NULL, 'MARACANAÚ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (336, true, 1, '2023-07-02 12:35:18.121563', NULL, NULL, 'MARAU', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (337, true, 1, '2023-07-02 12:35:18.123075', NULL, NULL, 'EUSÉBIO', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (338, true, 1, '2023-07-02 12:35:18.12456', NULL, NULL, 'COROMANDEL', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (339, true, 1, '2023-07-02 12:35:18.126079', NULL, NULL, 'JOÃO PINHEIRO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (340, true, 1, '2023-07-02 12:35:18.127435', NULL, NULL, 'ILHA SOLTEIRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (341, true, 1, '2023-07-02 12:35:18.129019', NULL, NULL, 'ITABORAÍ', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (342, true, 1, '2023-07-02 12:35:18.138354', NULL, NULL, 'CAMPO LARGO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (343, true, 1, '2023-07-02 12:35:18.140065', NULL, NULL, 'FARROUPILHA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (344, true, 1, '2023-07-02 12:35:18.141436', NULL, NULL, 'GRAVATAÍ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (345, true, 1, '2023-07-02 12:35:18.142908', NULL, NULL, 'ITAJAÍ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (346, true, 1, '2023-07-02 12:35:18.144234', NULL, NULL, 'NOVA PETRÓPOLIS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (347, true, 1, '2023-07-02 12:35:18.145624', NULL, NULL, 'RIO DAS OSTRAS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (348, true, 1, '2023-07-02 12:35:18.152705', NULL, NULL, 'SANTO ÂNGELO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (349, true, 1, '2023-07-02 12:35:18.154045', NULL, NULL, 'UNAÍ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (350, true, 1, '2023-07-02 12:35:18.155531', NULL, NULL, 'CONCÓRDIA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (351, true, 1, '2023-07-02 12:35:18.157041', NULL, NULL, 'CONCHAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (352, true, 1, '2023-07-02 12:35:18.15839', NULL, NULL, 'TIMÓTEO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (353, true, 1, '2023-07-02 12:35:18.159482', NULL, NULL, 'CORNÉLIO PROCÓPIO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (354, true, 1, '2023-07-02 12:35:18.168636', NULL, NULL, 'TUPÃ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (355, true, 1, '2023-07-02 12:35:18.170092', NULL, NULL, 'VILHENA', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (356, true, 1, '2023-07-02 12:35:18.171441', NULL, NULL, 'COLÍDER', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (357, true, 1, '2023-07-02 12:35:18.172916', NULL, NULL, 'ESCADA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (358, true, 1, '2023-07-02 12:35:18.174243', NULL, NULL, 'CANOINHAS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (359, true, 1, '2023-07-02 12:35:18.175616', NULL, NULL, 'CABO FRIO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (360, true, 1, '2023-07-02 12:35:18.182719', NULL, NULL, 'SANTA MARIA DE JETIBÁ', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (361, true, 1, '2023-07-02 12:35:18.184', NULL, NULL, 'CONCEIÇÃO DO COITÉ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (362, true, 1, '2023-07-02 12:35:18.185343', NULL, NULL, 'VESPASIANO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (363, true, 1, '2023-07-02 12:35:18.186693', NULL, NULL, 'GUARATINGUETÁ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (364, true, 1, '2023-07-02 12:35:18.188037', NULL, NULL, 'SIDROLÂNDIA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (365, true, 1, '2023-07-02 12:35:18.189413', NULL, NULL, 'CAMPO BELO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (366, true, 1, '2023-07-02 12:35:18.19883', NULL, NULL, 'CATAGUASES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (367, true, 1, '2023-07-02 12:35:18.200132', NULL, NULL, 'CHAPADÃO DO SUL', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (368, true, 1, '2023-07-02 12:35:18.201491', NULL, NULL, 'FÁTIMA DO SUL', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (369, true, 1, '2023-07-02 12:35:18.202806', NULL, NULL, 'NOVA ANDRADINA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (370, true, 1, '2023-07-02 12:35:18.204191', NULL, NULL, 'SANTA CRUZ DO RIO PARDO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (371, true, 1, '2023-07-02 12:35:18.205487', NULL, NULL, 'HOLAMBRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (372, true, 1, '2023-07-02 12:35:18.212568', NULL, NULL, 'AGUDOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (373, true, 1, '2023-07-02 12:35:18.214077', NULL, NULL, 'ALTA FLORESTA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (374, true, 1, '2023-07-02 12:35:18.215708', NULL, NULL, 'AMAMBAÍ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (375, true, 1, '2023-07-02 12:35:18.217073', NULL, NULL, 'AMPÉRE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (376, true, 1, '2023-07-02 12:35:18.218411', NULL, NULL, 'ANICUNS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (377, true, 1, '2023-07-02 12:35:18.219983', NULL, NULL, 'APUCARANA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (378, true, 1, '2023-07-02 12:35:18.229372', NULL, NULL, 'ARARAQUARA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (379, true, 1, '2023-07-02 12:35:18.230876', NULL, NULL, 'ASSIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (380, true, 1, '2023-07-02 12:35:18.232216', NULL, NULL, 'BALSAS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (381, true, 1, '2023-07-02 12:35:18.233546', NULL, NULL, 'BARUERI', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (382, true, 1, '2023-07-02 12:35:18.234896', NULL, NULL, 'BOITUVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (383, true, 1, '2023-07-02 12:35:18.236482', NULL, NULL, 'BOTUCATU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (384, true, 1, '2023-07-02 12:35:18.243617', NULL, NULL, 'BRAGANÇA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (385, true, 1, '2023-07-02 12:35:18.245212', NULL, NULL, 'CAFELÂNDIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (386, true, 1, '2023-07-02 12:35:18.246676', NULL, NULL, 'CAIEIRAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (387, true, 1, '2023-07-02 12:35:18.248032', NULL, NULL, 'CALDAS NOVAS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (388, true, 1, '2023-07-02 12:35:18.249344', NULL, NULL, 'CAMPINA GRANDE DO SUL', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (389, true, 1, '2023-07-02 12:35:18.25051', NULL, NULL, 'CARIACICA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (390, true, 1, '2023-07-02 12:35:18.260011', NULL, NULL, 'CASTELO', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (391, true, 1, '2023-07-02 12:35:18.261833', NULL, NULL, 'GUAÇUÍ', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (392, true, 1, '2023-07-02 12:35:18.263322', NULL, NULL, 'ANDRADINA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (393, true, 1, '2023-07-02 12:35:18.264797', NULL, NULL, 'ARARIPINA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (394, true, 1, '2023-07-02 12:35:18.266157', NULL, NULL, 'LIMOEIRO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (395, true, 1, '2023-07-02 12:35:18.267603', NULL, NULL, 'BELO JARDIM', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (396, true, 1, '2023-07-02 12:35:18.274791', NULL, NULL, 'CAMPO MAIOR', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (397, true, 1, '2023-07-02 12:35:18.276278', NULL, NULL, 'ALÉM PARAÍBA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (398, true, 1, '2023-07-02 12:35:18.277449', NULL, NULL, 'SERRA TALHADA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (399, true, 1, '2023-07-02 12:35:18.278799', NULL, NULL, 'CODÓ', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (400, true, 1, '2023-07-02 12:35:18.280112', NULL, NULL, 'GOIANA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (401, true, 1, '2023-07-02 12:35:18.281352', NULL, NULL, 'TIMBAÚBA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (402, true, 1, '2023-07-02 12:35:18.290227', NULL, NULL, 'SÃO FIDÉLIS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (403, true, 1, '2023-07-02 12:35:18.291698', NULL, NULL, 'CAPIM GROSSO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (404, true, 1, '2023-07-02 12:35:18.293217', NULL, NULL, 'BRAGANÇA PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (405, true, 1, '2023-07-02 12:35:18.294544', NULL, NULL, 'SANTA MARIA DA VITÓRIA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (406, true, 1, '2023-07-02 12:35:18.295874', NULL, NULL, 'CHAPECÓ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (407, true, 1, '2023-07-02 12:35:18.296944', NULL, NULL, 'JANAÚBA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (408, true, 1, '2023-07-02 12:35:18.304113', NULL, NULL, 'CAMPOS GERAIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (409, true, 1, '2023-07-02 12:35:18.30568', NULL, NULL, 'SÃO GOTARDO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (410, true, 1, '2023-07-02 12:35:18.306971', NULL, NULL, 'MAIRIPORÃ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (411, true, 1, '2023-07-02 12:35:18.308318', NULL, NULL, 'SALGUEIRO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (412, true, 1, '2023-07-02 12:35:18.309657', NULL, NULL, 'CABO DE SANTO AGOSTINHO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (413, true, 1, '2023-07-02 12:35:18.31104', NULL, NULL, 'IGARASSU', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (414, true, 1, '2023-07-02 12:35:18.320054', NULL, NULL, 'BOM JESUS DA LAPA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (415, true, 1, '2023-07-02 12:35:18.321371', NULL, NULL, 'ERECHIM', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (416, true, 1, '2023-07-02 12:35:18.322541', NULL, NULL, 'PARAÍSO DO TOCANTINS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (417, true, 1, '2023-07-02 12:35:18.323694', NULL, NULL, 'SANTA MARIA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (418, true, 1, '2023-07-02 12:35:18.325041', NULL, NULL, 'TUCURUÍ', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (419, true, 1, '2023-07-02 12:35:18.326439', NULL, NULL, 'MARICÁ', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (420, true, 1, '2023-07-02 12:35:18.33357', NULL, NULL, 'TRÊS RIOS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (421, true, 1, '2023-07-02 12:35:18.334854', NULL, NULL, 'AUGUSTINÓPOLIS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (422, true, 1, '2023-07-02 12:35:18.33621', NULL, NULL, 'ITAMARAJU', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (423, true, 1, '2023-07-02 12:35:18.337537', NULL, NULL, 'XAXIM', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (424, true, 1, '2023-07-02 12:35:18.338889', NULL, NULL, 'EXTREMA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (425, true, 1, '2023-07-02 12:35:18.339999', NULL, NULL, 'JUATUBA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (426, true, 1, '2023-07-02 12:35:18.348843', NULL, NULL, 'JACIARA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (427, true, 1, '2023-07-02 12:35:18.350153', NULL, NULL, 'ÁGUA BOA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (428, true, 1, '2023-07-02 12:35:18.351523', NULL, NULL, 'PALMARES', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (429, true, 1, '2023-07-02 12:35:18.352842', NULL, NULL, 'COLINAS DO TOCANTINS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (430, true, 1, '2023-07-02 12:35:18.354185', NULL, NULL, 'SÃO FRANCISCO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (431, true, 1, '2023-07-02 12:35:18.355578', NULL, NULL, 'CRUZEIRO DO SUL', NULL, 'AC', 'BRASIL');
INSERT INTO public.endereco VALUES (432, true, 1, '2023-07-02 12:35:18.362646', NULL, NULL, 'ITAPEMA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (433, true, 1, '2023-07-02 12:35:18.364069', NULL, NULL, 'URUGUAIANA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (434, true, 1, '2023-07-02 12:35:18.365386', NULL, NULL, 'REDUTO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (435, true, 1, '2023-07-02 12:35:18.366721', NULL, NULL, 'DRACENA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (436, true, 1, '2023-07-02 12:35:18.36792', NULL, NULL, 'DUQUE DE CAXIAS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (437, true, 1, '2023-07-02 12:35:18.369325', NULL, NULL, 'MONTE APRAZÍVEL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (438, true, 1, '2023-07-02 12:35:18.37833', NULL, NULL, 'IPU', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (439, true, 1, '2023-07-02 12:35:18.379783', NULL, NULL, 'COSTA RICA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (440, true, 1, '2023-07-02 12:35:18.380964', NULL, NULL, 'JARU', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (441, true, 1, '2023-07-02 12:35:18.382257', NULL, NULL, 'SÃO MATEUS DO MARANHÃO', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (442, true, 1, '2023-07-02 12:35:18.383584', NULL, NULL, 'TAILÂNDIA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (443, true, 1, '2023-07-02 12:35:18.38474', NULL, NULL, 'PEDREIRAS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (444, true, 1, '2023-07-02 12:35:18.392014', NULL, NULL, 'SÃO JOÃO DO PIAUÍ', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (445, true, 1, '2023-07-02 12:35:18.393658', NULL, NULL, 'PETROLINA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (446, true, 1, '2023-07-02 12:35:18.394978', NULL, NULL, 'PARACAMBI', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (447, true, 1, '2023-07-02 12:35:18.39633', NULL, NULL, 'SANTO ANTÔNIO DE PÁDUA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (448, true, 1, '2023-07-02 12:35:18.397663', NULL, NULL, 'BOM JESUS DO ITABAPOANA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (449, true, 1, '2023-07-02 12:35:18.398878', NULL, NULL, 'BEZERROS', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (450, true, 1, '2023-07-02 12:35:18.407873', NULL, NULL, 'ELESBÃO VELOSO', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (451, true, 1, '2023-07-02 12:35:18.40915', NULL, NULL, 'PACAJUS', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (452, true, 1, '2023-07-02 12:35:18.410495', NULL, NULL, 'REDENÇÃO', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (453, true, 1, '2023-07-02 12:35:18.411668', NULL, NULL, 'FLORIANO', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (454, true, 1, '2023-07-02 12:35:18.412838', NULL, NULL, 'MARECHAL CÂNDIDO RONDON', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (455, true, 1, '2023-07-02 12:35:18.414256', NULL, NULL, 'PITANGA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (456, true, 1, '2023-07-02 12:35:18.421463', NULL, NULL, 'TIMON', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (457, true, 1, '2023-07-02 12:35:18.422935', NULL, NULL, 'GARÇA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (458, true, 1, '2023-07-02 12:35:18.424275', NULL, NULL, 'TATUÍ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (459, true, 1, '2023-07-02 12:35:18.425588', NULL, NULL, 'VIANA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (460, true, 1, '2023-07-02 12:35:18.426778', NULL, NULL, 'ALEGRE', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (461, true, 1, '2023-07-02 12:35:18.427918', NULL, NULL, 'IBITINGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (462, true, 1, '2023-07-02 12:35:18.436954', NULL, NULL, 'ITUVERAVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (463, true, 1, '2023-07-02 12:35:18.438413', NULL, NULL, 'PENÁPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (464, true, 1, '2023-07-02 12:35:18.439699', NULL, NULL, 'SÃO JOSÉ DO RIO PARDO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (465, true, 1, '2023-07-02 12:35:18.441066', NULL, NULL, 'LUZ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (466, true, 1, '2023-07-02 12:35:18.442419', NULL, NULL, 'FRUTAL', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (467, true, 1, '2023-07-02 12:35:18.443786', NULL, NULL, 'GUARANTÃ DO NORTE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (468, true, 1, '2023-07-02 12:35:18.450814', NULL, NULL, 'HORTOLÂNDIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (469, true, 1, '2023-07-02 12:35:18.45212', NULL, NULL, 'IBAITI', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (470, true, 1, '2023-07-02 12:35:18.453456', NULL, NULL, 'INDIARA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (471, true, 1, '2023-07-02 12:35:18.454821', NULL, NULL, 'OURO PRETO DO OESTE', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (472, true, 1, '2023-07-02 12:35:18.456166', NULL, NULL, 'INHUMAS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (473, true, 1, '2023-07-02 12:35:18.457576', NULL, NULL, 'GARIBALDI', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (474, true, 1, '2023-07-02 12:35:18.466624', NULL, NULL, 'IPORÁ', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (475, true, 1, '2023-07-02 12:35:18.468042', NULL, NULL, 'ITAITUBA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (476, true, 1, '2023-07-02 12:35:18.469398', NULL, NULL, 'JANDAIA DO SUL', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (477, true, 1, '2023-07-02 12:35:18.470953', NULL, NULL, 'JUSSARA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (478, true, 1, '2023-07-02 12:35:18.472266', NULL, NULL, 'MARTINÓPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (479, true, 1, '2023-07-02 12:35:18.473544', NULL, NULL, 'MATUPÁ', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (480, true, 1, '2023-07-02 12:35:18.480777', NULL, NULL, 'MAUÁ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (481, true, 1, '2023-07-02 12:35:18.482243', NULL, NULL, 'NOVA LIMA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (482, true, 1, '2023-07-02 12:35:18.483563', NULL, NULL, 'AÇAILÂNDIA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (483, true, 1, '2023-07-02 12:35:18.484904', NULL, NULL, 'GARANHUNS', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (484, true, 1, '2023-07-02 12:35:18.486229', NULL, NULL, 'CASTANHAL', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (485, true, 1, '2023-07-02 12:35:18.487632', NULL, NULL, 'MIGUEL PEREIRA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (486, true, 1, '2023-07-02 12:35:18.496709', NULL, NULL, 'MIRASSOL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (487, true, 1, '2023-07-02 12:35:18.498122', NULL, NULL, 'NOVA MUTUM', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (488, true, 1, '2023-07-02 12:35:18.499406', NULL, NULL, 'NOVA SERRANA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (489, true, 1, '2023-07-02 12:35:18.500754', NULL, NULL, 'OLÍMPIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (490, true, 1, '2023-07-02 12:35:18.502104', NULL, NULL, 'PALMEIRAS DE GOIÁS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (491, true, 1, '2023-07-02 12:35:18.503477', NULL, NULL, 'PARÁ DE MINAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (492, true, 1, '2023-07-02 12:35:18.510522', NULL, NULL, 'PENEDO', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (493, true, 1, '2023-07-02 12:35:18.511807', NULL, NULL, 'PINHAIS', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (494, true, 1, '2023-07-02 12:35:18.512993', NULL, NULL, 'PIRACANJUBA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (495, true, 1, '2023-07-02 12:35:18.514349', NULL, NULL, 'PONTA PORÃ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (496, true, 1, '2023-07-02 12:35:18.515684', NULL, NULL, 'PORTO FELIZ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (497, true, 1, '2023-07-02 12:35:18.516805', NULL, NULL, 'PRESIDENTE EPITÁCIO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (498, true, 1, '2023-07-02 12:35:18.525641', NULL, NULL, 'PRESIDENTE VENCESLAU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (499, true, 1, '2023-07-02 12:35:18.526928', NULL, NULL, 'ROSANA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (500, true, 1, '2023-07-02 12:35:18.528297', NULL, NULL, 'QUIXERAMOBIM', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (501, true, 1, '2023-07-02 12:35:18.529609', NULL, NULL, 'RANCHARIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (502, true, 1, '2023-07-02 12:35:18.530957', NULL, NULL, 'RIBEIRÃO PIRES', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (503, true, 1, '2023-07-02 12:35:18.532319', NULL, NULL, 'ROLIM DE MOURA', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (504, true, 1, '2023-07-02 12:35:18.539581', NULL, NULL, 'ROSEIRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (505, true, 1, '2023-07-02 12:35:18.540994', NULL, NULL, 'SABARÁ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (506, true, 1, '2023-07-02 12:35:18.542354', NULL, NULL, 'ITABERABA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (507, true, 1, '2023-07-02 12:35:18.543671', NULL, NULL, 'SANTA INÊS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (508, true, 1, '2023-07-02 12:35:18.544844', NULL, NULL, 'SANTA LUZIA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (509, true, 1, '2023-07-02 12:35:18.546223', NULL, NULL, 'SANTANA DE PARNAÍBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (510, true, 1, '2023-07-02 12:35:18.555377', NULL, NULL, 'SANTO ANTÔNIO DA PLATINA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (511, true, 1, '2023-07-02 12:35:18.556697', NULL, NULL, 'SÃO LOURENÇO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (512, true, 1, '2023-07-02 12:35:18.558023', NULL, NULL, 'SÃO MARCOS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (513, true, 1, '2023-07-02 12:35:18.559212', NULL, NULL, 'SÃO VICENTE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (514, true, 1, '2023-07-02 12:35:18.56054', NULL, NULL, 'SÃO JOAQUIM DA BARRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (515, true, 1, '2023-07-02 12:35:18.561692', NULL, NULL, 'FLORESTA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (516, true, 1, '2023-07-02 12:35:18.568965', NULL, NULL, 'TAPEJARA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (517, true, 1, '2023-07-02 12:35:18.570391', NULL, NULL, 'TAQUARITINGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (518, true, 1, '2023-07-02 12:35:18.571734', NULL, NULL, 'CAPÃO BONITO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (519, true, 1, '2023-07-02 12:35:18.57315', NULL, NULL, 'CARAPICUÍBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (520, true, 1, '2023-07-02 12:35:18.574632', NULL, NULL, 'COTIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (521, true, 1, '2023-07-02 12:35:18.575996', NULL, NULL, 'CRUZEIRO DO OESTE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (522, true, 1, '2023-07-02 12:35:18.584976', NULL, NULL, 'DIADEMA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (523, true, 1, '2023-07-02 12:35:18.586284', NULL, NULL, 'FERRAZ DE VASCONCELOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (524, true, 1, '2023-07-02 12:35:18.587641', NULL, NULL, 'FRANCO DA ROCHA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (525, true, 1, '2023-07-02 12:35:18.588986', NULL, NULL, 'HORIZONTE', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (526, true, 1, '2023-07-02 12:35:18.59028', NULL, NULL, 'ITAQUAQUECETUBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (527, true, 1, '2023-07-02 12:35:18.591679', NULL, NULL, 'ITATIBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (528, true, 1, '2023-07-02 12:35:18.59876', NULL, NULL, 'MOCOCA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (529, true, 1, '2023-07-02 12:35:18.600199', NULL, NULL, 'POMPÉIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (530, true, 1, '2023-07-02 12:35:18.601535', NULL, NULL, 'SÃO SEBASTIÃO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (531, true, 1, '2023-07-02 12:35:18.602883', NULL, NULL, 'BARRA BONITA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (532, true, 1, '2023-07-02 12:35:18.604217', NULL, NULL, 'IVAIPORÃ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (533, true, 1, '2023-07-02 12:35:18.605354', NULL, NULL, 'JUAZEIRO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (534, true, 1, '2023-07-02 12:35:18.614349', NULL, NULL, 'CAUCAIA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (535, true, 1, '2023-07-02 12:35:18.615657', NULL, NULL, 'ITAPIPOCA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (536, true, 1, '2023-07-02 12:35:18.616986', NULL, NULL, 'NOSSA SENHORA DO SOCORRO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (537, true, 1, '2023-07-02 12:35:18.618324', NULL, NULL, 'PARNAMIRIM', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (538, true, 1, '2023-07-02 12:35:18.619683', NULL, NULL, 'SENADOR CANEDO', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (539, true, 1, '2023-07-02 12:35:18.62107', NULL, NULL, 'FORMOSA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (540, true, 1, '2023-07-02 12:35:18.628183', NULL, NULL, 'FRANCISCO MORATO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (541, true, 1, '2023-07-02 12:35:18.629652', NULL, NULL, 'NOVO HAMBURGO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (542, true, 1, '2023-07-02 12:35:18.630952', NULL, NULL, 'CANOAS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (543, true, 1, '2023-07-02 12:35:18.632354', NULL, NULL, 'ESTRELA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (544, true, 1, '2023-07-02 12:35:18.633687', NULL, NULL, 'PALHOÇA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (545, true, 1, '2023-07-02 12:35:18.635086', NULL, NULL, 'LUPÉRCIO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (546, true, 1, '2023-07-02 12:35:18.644014', NULL, NULL, 'SÃO BENTO DO SUL', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (547, true, 1, '2023-07-02 12:35:18.645415', NULL, NULL, 'TEODORO SAMPAIO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (548, true, 1, '2023-07-02 12:35:18.646743', NULL, NULL, 'TIETÊ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (549, true, 1, '2023-07-02 12:35:18.648083', NULL, NULL, 'SANTA TEREZINHA DE GOIÁS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (550, true, 1, '2023-07-02 12:35:18.649418', NULL, NULL, 'PONTE NOVA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (551, true, 1, '2023-07-02 12:35:18.65057', NULL, NULL, 'CHAPADINHA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (552, true, 1, '2023-07-02 12:35:18.65784', NULL, NULL, 'SUMÉ', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (553, true, 1, '2023-07-02 12:35:18.659276', NULL, NULL, 'VIAMÃO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (554, true, 1, '2023-07-02 12:35:18.660582', NULL, NULL, 'BARRA DO CORDA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (555, true, 1, '2023-07-02 12:35:18.661931', NULL, NULL, 'PIRATININGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (556, true, 1, '2023-07-02 12:35:18.663245', NULL, NULL, 'AÇU', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (557, true, 1, '2023-07-02 12:35:18.664669', NULL, NULL, 'CARANGOLA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (558, true, 1, '2023-07-02 12:35:18.673684', NULL, NULL, 'JOÃO MONLEVADE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (559, true, 1, '2023-07-02 12:35:18.67514', NULL, NULL, 'GUARATUBA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (560, true, 1, '2023-07-02 12:35:18.676448', NULL, NULL, 'BATURITÉ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (561, true, 1, '2023-07-02 12:35:18.677786', NULL, NULL, 'SANTA CRUZ DO SUL', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (562, true, 1, '2023-07-02 12:35:18.679133', NULL, NULL, 'CAPITÃO LEÔNIDAS MARQUES', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (563, true, 1, '2023-07-02 12:35:18.680346', NULL, NULL, 'GOIOERÊ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (564, true, 1, '2023-07-02 12:35:18.687996', NULL, NULL, 'UBIRATÃ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (565, true, 1, '2023-07-02 12:35:18.690075', NULL, NULL, 'RIBEIRA DO POMBAL', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (566, true, 1, '2023-07-02 12:35:18.691679', NULL, NULL, 'LAGARTO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (567, true, 1, '2023-07-02 12:35:18.693079', NULL, NULL, 'CORONEL JOÃO SÁ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (568, true, 1, '2023-07-02 12:35:18.694387', NULL, NULL, 'SÃO MIGUEL', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (569, true, 1, '2023-07-02 12:35:18.69552', NULL, NULL, 'CORRENTE', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (570, true, 1, '2023-07-02 12:35:18.704588', NULL, NULL, 'CURRAIS NOVOS', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (571, true, 1, '2023-07-02 12:35:18.70601', NULL, NULL, 'MONTE SANTO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (572, true, 1, '2023-07-02 12:35:18.707349', NULL, NULL, 'MILHÃ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (573, true, 1, '2023-07-02 12:35:18.708685', NULL, NULL, 'TRINDADE', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (574, true, 1, '2023-07-02 12:35:18.709866', NULL, NULL, 'AFOGADOS DA INGAZEIRA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (575, true, 1, '2023-07-02 12:35:18.711252', NULL, NULL, 'CABROBÓ', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (576, true, 1, '2023-07-02 12:35:18.718426', NULL, NULL, 'PIRES DO RIO', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (577, true, 1, '2023-07-02 12:35:18.719765', NULL, NULL, 'JUARA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (578, true, 1, '2023-07-02 12:35:18.721131', NULL, NULL, 'VIRGINÓPOLIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (579, true, 1, '2023-07-02 12:35:18.722453', NULL, NULL, 'SURUBIM', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (580, true, 1, '2023-07-02 12:35:18.723783', NULL, NULL, 'ITAGUAÍ', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (581, true, 1, '2023-07-02 12:35:18.725183', NULL, NULL, 'FAZENDA RIO GRANDE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (582, true, 1, '2023-07-02 12:35:18.734234', NULL, NULL, 'COLOMBO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (583, true, 1, '2023-07-02 12:35:18.735662', NULL, NULL, 'MEDIANEIRA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (584, true, 1, '2023-07-02 12:35:18.737012', NULL, NULL, 'OLIVEIRA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (585, true, 1, '2023-07-02 12:35:18.738359', NULL, NULL, 'EMBU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (586, true, 1, '2023-07-02 12:35:18.739686', NULL, NULL, 'GUAIÚBA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (587, true, 1, '2023-07-02 12:35:18.740825', NULL, NULL, 'EUNÁPOLIS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (588, true, 1, '2023-07-02 12:35:18.74808', NULL, NULL, 'CANINDÉ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (589, true, 1, '2023-07-02 12:35:18.749562', NULL, NULL, 'PIMENTA BUENO', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (590, true, 1, '2023-07-02 12:35:18.750897', NULL, NULL, 'CÁCERES', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (591, true, 1, '2023-07-02 12:35:18.752245', NULL, NULL, 'IPIRÁ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (592, true, 1, '2023-07-02 12:35:18.753568', NULL, NULL, 'CERES', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (593, true, 1, '2023-07-02 12:35:18.754953', NULL, NULL, 'GOIANÉSIA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (594, true, 1, '2023-07-02 12:35:18.764069', NULL, NULL, 'JARAGUÁ', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (595, true, 1, '2023-07-02 12:35:18.765602', NULL, NULL, 'RUBIATABA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (596, true, 1, '2023-07-02 12:35:18.766947', NULL, NULL, 'COROATÁ', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (597, true, 1, '2023-07-02 12:35:18.768287', NULL, NULL, 'PAU DOS FERROS', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (598, true, 1, '2023-07-02 12:35:18.769603', NULL, NULL, 'ITAÚNA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (599, true, 1, '2023-07-02 12:35:18.770999', NULL, NULL, 'PARAMBU', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (600, true, 1, '2023-07-02 12:35:18.778194', NULL, NULL, 'BANDEIRANTES', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (601, true, 1, '2023-07-02 12:35:18.779521', NULL, NULL, 'PIUM', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (602, true, 1, '2023-07-02 12:35:18.780856', NULL, NULL, 'JAGUARIAÍVA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (603, true, 1, '2023-07-02 12:35:18.782185', NULL, NULL, 'ÁGUAS LINDAS DE GOIÁS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (604, true, 1, '2023-07-02 12:35:18.78351', NULL, NULL, 'CERQUILHO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (605, true, 1, '2023-07-02 12:35:18.784475', NULL, NULL, 'CIDADE OCIDENTAL', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (606, true, 1, '2023-07-02 12:35:18.793606', NULL, NULL, 'JANUÁRIA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (607, true, 1, '2023-07-02 12:35:18.794984', NULL, NULL, 'PEDERNEIRAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (608, true, 1, '2023-07-02 12:35:18.795685', NULL, NULL, 'CAMOCIM', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (609, true, 1, '2023-07-02 12:35:18.797424', NULL, NULL, 'SOUSA', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (610, true, 1, '2023-07-02 12:35:18.804622', NULL, NULL, 'GUARAÍ', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (611, true, 1, '2023-07-02 12:35:18.805942', NULL, NULL, 'ARAPONGAS', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (612, true, 1, '2023-07-02 12:35:18.807284', NULL, NULL, 'HORIZONTINA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (613, true, 1, '2023-07-02 12:35:18.808617', NULL, NULL, 'PIRAJU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (614, true, 1, '2023-07-02 12:35:18.809954', NULL, NULL, 'PORANGATU', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (615, true, 1, '2023-07-02 12:35:18.811352', NULL, NULL, 'LOANDA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (616, true, 1, '2023-07-02 12:35:18.820339', NULL, NULL, 'MANTENA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (617, true, 1, '2023-07-02 12:35:18.821687', NULL, NULL, 'IPAUSSU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (618, true, 1, '2023-07-02 12:35:18.823003', NULL, NULL, 'ITANHAÉM', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (619, true, 1, '2023-07-02 12:35:18.824334', NULL, NULL, 'ITAPURANGA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (620, true, 1, '2023-07-02 12:35:18.82566', NULL, NULL, 'SANTA QUITÉRIA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (621, true, 1, '2023-07-02 12:35:18.826791', NULL, NULL, 'QUIRINÓPOLIS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (622, true, 1, '2023-07-02 12:35:18.834026', NULL, NULL, 'ARUJÁ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (623, true, 1, '2023-07-02 12:35:18.835311', NULL, NULL, 'SÃO GONÇALO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (624, true, 1, '2023-07-02 12:35:18.836648', NULL, NULL, 'TIMBÓ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (625, true, 1, '2023-07-02 12:35:18.837986', NULL, NULL, 'PADRE BERNARDO', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (626, true, 1, '2023-07-02 12:35:18.839362', NULL, NULL, 'NOVO GAMA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (627, true, 1, '2023-07-02 12:35:18.840939', NULL, NULL, 'CARPINA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (628, true, 1, '2023-07-02 12:35:18.850043', NULL, NULL, 'SANTANA', NULL, 'AP', 'BRASIL');
INSERT INTO public.endereco VALUES (629, true, 1, '2023-07-02 12:35:18.851517', NULL, NULL, 'ITUIUTABA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (630, true, 1, '2023-07-02 12:35:18.852845', NULL, NULL, 'PARNARAMA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (631, true, 1, '2023-07-02 12:35:18.854208', NULL, NULL, 'SÃO MANUEL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (632, true, 1, '2023-07-02 12:35:18.855541', NULL, NULL, 'TUCUMÃ', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (633, true, 1, '2023-07-02 12:35:18.856916', NULL, NULL, 'XINGUARA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (634, true, 1, '2023-07-02 12:35:18.864239', NULL, NULL, 'CROATÁ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (635, true, 1, '2023-07-02 12:35:18.865674', NULL, NULL, 'COARI', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (636, true, 1, '2023-07-02 12:35:18.867007', NULL, NULL, 'DIAS D''ÁVILA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (637, true, 1, '2023-07-02 12:35:18.868346', NULL, NULL, 'ITACOATIARA', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (638, true, 1, '2023-07-02 12:35:18.869685', NULL, NULL, 'PARINTINS', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (639, true, 1, '2023-07-02 12:35:18.870778', NULL, NULL, 'TEFÉ', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (640, true, 1, '2023-07-02 12:35:18.879798', NULL, NULL, 'BREVES', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (641, true, 1, '2023-07-02 12:35:18.881125', NULL, NULL, 'IGARAPÉ-MIRI', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (642, true, 1, '2023-07-02 12:35:18.882465', NULL, NULL, 'MOJI MIRIM', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (643, true, 1, '2023-07-02 12:35:18.883843', NULL, NULL, 'PICOS', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (644, true, 1, '2023-07-02 12:35:18.885141', NULL, NULL, 'CANELA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (645, true, 1, '2023-07-02 12:35:18.886579', NULL, NULL, 'PALOTINA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (646, true, 1, '2023-07-02 12:35:18.893781', NULL, NULL, 'NOVA VENÉCIA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (647, true, 1, '2023-07-02 12:35:18.895261', NULL, NULL, 'CLEVELÂNDIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (648, true, 1, '2023-07-02 12:35:18.896588', NULL, NULL, 'NOVA ODESSA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (649, true, 1, '2023-07-02 12:35:18.897926', NULL, NULL, 'ITINGA DO MARANHÃO', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (650, true, 1, '2023-07-02 12:35:18.899248', NULL, NULL, 'IPOJUCA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (651, true, 1, '2023-07-02 12:35:18.90064', NULL, NULL, 'LENÇÓIS PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (652, true, 1, '2023-07-02 12:35:18.909866', NULL, NULL, 'CAPANEMA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (653, true, 1, '2023-07-02 12:35:18.911301', NULL, NULL, 'ROLÂNDIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (654, true, 1, '2023-07-02 12:35:18.912498', NULL, NULL, 'PEDRO LEOPOLDO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (655, true, 1, '2023-07-02 12:35:18.913804', NULL, NULL, 'PERUÍBE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (656, true, 1, '2023-07-02 12:35:18.915156', NULL, NULL, 'PINHALZINHO', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (657, true, 1, '2023-07-02 12:35:18.916284', NULL, NULL, 'CANINDÉ DE SÃO FRANCISCO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (658, true, 1, '2023-07-02 12:35:18.923587', NULL, NULL, 'TRÊS LAGOAS', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (659, true, 1, '2023-07-02 12:35:18.925017', NULL, NULL, 'BACABAL', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (660, true, 1, '2023-07-02 12:35:18.92635', NULL, NULL, 'BRUMADO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (661, true, 1, '2023-07-02 12:35:18.927677', NULL, NULL, 'PARANAGUÁ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (662, true, 1, '2023-07-02 12:35:18.929009', NULL, NULL, 'PORTO BELO', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (663, true, 1, '2023-07-02 12:35:18.930408', NULL, NULL, 'PORTO NACIONAL', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (664, true, 1, '2023-07-02 12:35:18.939512', NULL, NULL, 'AIMORÉS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (665, true, 1, '2023-07-02 12:35:18.941108', NULL, NULL, 'BAEPENDI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (666, true, 1, '2023-07-02 12:35:18.942461', NULL, NULL, 'BARÃO DE COCAIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (667, true, 1, '2023-07-02 12:35:18.943952', NULL, NULL, 'ITANHANDU', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (668, true, 1, '2023-07-02 12:35:18.945295', NULL, NULL, 'LAMBARI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (669, true, 1, '2023-07-02 12:35:18.946644', NULL, NULL, 'LEOPOLDINA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (670, true, 1, '2023-07-02 12:35:18.953837', NULL, NULL, 'SÃO JOÃO NEPOMUCENO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (671, true, 1, '2023-07-02 12:35:18.955207', NULL, NULL, 'VISCONDE DO RIO BRANCO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (672, true, 1, '2023-07-02 12:35:18.956561', NULL, NULL, 'PRESIDENTE DUTRA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (673, true, 1, '2023-07-02 12:35:18.957879', NULL, NULL, 'CRATEÚS', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (674, true, 1, '2023-07-02 12:35:18.959192', NULL, NULL, 'ALFENAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (675, true, 1, '2023-07-02 12:35:18.960355', NULL, NULL, 'JUNQUEIRÓPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (676, true, 1, '2023-07-02 12:35:18.969516', NULL, NULL, 'OSVALDO CRUZ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (677, true, 1, '2023-07-02 12:35:18.970792', NULL, NULL, 'REALEZA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (678, true, 1, '2023-07-02 12:35:18.972159', NULL, NULL, 'TUPI PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (679, true, 1, '2023-07-02 12:35:18.973465', NULL, NULL, 'CANDEIAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (680, true, 1, '2023-07-02 12:35:18.974804', NULL, NULL, 'BERTÓPOLIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (681, true, 1, '2023-07-02 12:35:18.976208', NULL, NULL, 'RIACHÃO DO JACUÍPE', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (682, true, 1, '2023-07-02 12:35:18.983405', NULL, NULL, 'UMBAÚBA', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (683, true, 1, '2023-07-02 12:35:18.984709', NULL, NULL, 'ALTO SANTO', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (684, true, 1, '2023-07-02 12:35:18.986107', NULL, NULL, 'PALMITOS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (685, true, 1, '2023-07-02 12:35:18.987418', NULL, NULL, 'PEDRO AFONSO', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (686, true, 1, '2023-07-02 12:35:18.988776', NULL, NULL, 'CORUMBÁ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (687, true, 1, '2023-07-02 12:35:18.990139', NULL, NULL, 'SANTA CRUZ DO CAPIBARIBE', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (688, true, 1, '2023-07-02 12:35:18.99919', NULL, NULL, 'PINHEIRO', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (689, true, 1, '2023-07-02 12:35:19.000627', NULL, NULL, 'NOVO HORIZONTE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (690, true, 1, '2023-07-02 12:35:19.001962', NULL, NULL, 'NAZARÉ DA MATA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (691, true, 1, '2023-07-02 12:35:19.003295', NULL, NULL, 'IPIAÚ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (692, true, 1, '2023-07-02 12:35:19.00464', NULL, NULL, 'CAÇAPAVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (693, true, 1, '2023-07-02 12:35:19.005968', NULL, NULL, 'QUEIMADAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (694, true, 1, '2023-07-02 12:35:19.013435', NULL, NULL, 'SANTOS DUMONT', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (695, true, 1, '2023-07-02 12:35:19.014995', NULL, NULL, 'TERRA BOA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (696, true, 1, '2023-07-02 12:35:19.016301', NULL, NULL, 'PÃO DE AÇÚCAR', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (697, true, 1, '2023-07-02 12:35:19.017624', NULL, NULL, 'IRATI', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (698, true, 1, '2023-07-02 12:35:19.018959', NULL, NULL, 'ARARANGUÁ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (699, true, 1, '2023-07-02 12:35:19.020348', NULL, NULL, 'CAÇADOR', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (700, true, 1, '2023-07-02 12:35:19.029427', NULL, NULL, 'SÃO MIGUEL DO OESTE', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (701, true, 1, '2023-07-02 12:35:19.030971', NULL, NULL, 'TUBARÃO', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (702, true, 1, '2023-07-02 12:35:19.032133', NULL, NULL, 'URUAÇU', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (703, true, 1, '2023-07-02 12:35:19.033468', NULL, NULL, 'SÃO LEOPOLDO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (704, true, 1, '2023-07-02 12:35:19.034842', NULL, NULL, 'SÃO PEDRO DO PIAUÍ', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (705, true, 1, '2023-07-02 12:35:19.036217', NULL, NULL, 'EUCLIDES DA CUNHA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (706, true, 1, '2023-07-02 12:35:19.043415', NULL, NULL, 'IRARÁ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (707, true, 1, '2023-07-02 12:35:19.044716', NULL, NULL, 'LAGO DA PEDRA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (708, true, 1, '2023-07-02 12:35:19.046061', NULL, NULL, 'URUÇUÍ', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (709, true, 1, '2023-07-02 12:35:19.047404', NULL, NULL, 'ARAPOTI', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (710, true, 1, '2023-07-02 12:35:19.048703', NULL, NULL, 'IBICARAÍ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (711, true, 1, '2023-07-02 12:35:19.049833', NULL, NULL, 'NAVEGANTES', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (712, true, 1, '2023-07-02 12:35:19.058945', NULL, NULL, 'OURO FINO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (713, true, 1, '2023-07-02 12:35:19.060511', NULL, NULL, 'CASSILÂNDIA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (714, true, 1, '2023-07-02 12:35:19.061847', NULL, NULL, 'DIAMANTINO', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (715, true, 1, '2023-07-02 12:35:19.063201', NULL, NULL, 'NAVIRAÍ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (716, true, 1, '2023-07-02 12:35:19.064535', NULL, NULL, 'PARANAÍBA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (717, true, 1, '2023-07-02 12:35:19.065914', NULL, NULL, 'TAGUAÍ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (718, true, 1, '2023-07-02 12:35:19.073118', NULL, NULL, 'TAQUARA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (719, true, 1, '2023-07-02 12:35:19.0744', NULL, NULL, 'SANTA ROSA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (720, true, 1, '2023-07-02 12:35:19.075741', NULL, NULL, 'PEREIRA BARRETO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (721, true, 1, '2023-07-02 12:35:19.077075', NULL, NULL, 'ITARARÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (722, true, 1, '2023-07-02 12:35:19.078249', NULL, NULL, 'ÁGUA BRANCA', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (723, true, 1, '2023-07-02 12:35:19.079671', NULL, NULL, 'SÃO BENTO', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (724, true, 1, '2023-07-02 12:35:19.088836', NULL, NULL, 'IÚNA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (725, true, 1, '2023-07-02 12:35:19.090326', NULL, NULL, 'ITAPORANGA', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (726, true, 1, '2023-07-02 12:35:19.091666', NULL, NULL, 'LIMOEIRO DO NORTE', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (727, true, 1, '2023-07-02 12:35:19.093013', NULL, NULL, 'IGREJINHA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (728, true, 1, '2023-07-02 12:35:19.094355', NULL, NULL, 'ALTO BOA VISTA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (729, true, 1, '2023-07-02 12:35:19.095468', NULL, NULL, 'TRÊS DE MAIO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (730, true, 1, '2023-07-02 12:35:19.102677', NULL, NULL, 'TRÊS PONTAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (731, true, 1, '2023-07-02 12:35:19.103973', NULL, NULL, 'CAMBUQUIRA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (732, true, 1, '2023-07-02 12:35:19.105325', NULL, NULL, 'CIANORTE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (733, true, 1, '2023-07-02 12:35:19.106668', NULL, NULL, 'ARARUAMA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (734, true, 1, '2023-07-02 12:35:19.107994', NULL, NULL, 'SÃO GONÇALO DO AMARANTE', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (735, true, 1, '2023-07-02 12:35:19.109326', NULL, NULL, 'PARAÍSO DO NORTE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (736, true, 1, '2023-07-02 12:35:19.119518', NULL, NULL, 'SÃO JOSÉ DOS QUATRO MARCOS', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (737, true, 1, '2023-07-02 12:35:19.121486', NULL, NULL, 'OURILÂNDIA DO NORTE', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (738, true, 1, '2023-07-02 12:35:19.129433', NULL, NULL, 'SÃO GABRIEL DA PALHA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (739, true, 1, '2023-07-02 12:35:19.130804', NULL, NULL, 'CAMPO VERDE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (740, true, 1, '2023-07-02 12:35:19.132128', NULL, NULL, 'MUNDO NOVO', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (741, true, 1, '2023-07-02 12:35:19.133462', NULL, NULL, 'CASCAVEL', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (742, true, 1, '2023-07-02 12:35:19.134789', NULL, NULL, 'TOBIAS BARRETO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (743, true, 1, '2023-07-02 12:35:19.135921', NULL, NULL, 'SÃO MIGUEL DO IGUAÇU', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (744, true, 1, '2023-07-02 12:35:19.144996', NULL, NULL, 'SÃO LOURENÇO DA MATA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (745, true, 1, '2023-07-02 12:35:19.146299', NULL, NULL, 'BARCARENA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (746, true, 1, '2023-07-02 12:35:19.147465', NULL, NULL, 'SERRINHA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (747, true, 1, '2023-07-02 12:35:19.14865', NULL, NULL, 'NOVA PORTEIRINHA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (748, true, 1, '2023-07-02 12:35:19.14997', NULL, NULL, 'SÃO JOSÉ DO EGITO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (749, true, 1, '2023-07-02 12:35:19.151368', NULL, NULL, 'ANCHIETA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (750, true, 1, '2023-07-02 12:35:19.158782', NULL, NULL, 'VENDA NOVA DO IMIGRANTE', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (751, true, 1, '2023-07-02 12:35:19.160176', NULL, NULL, 'MATO VERDE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (752, true, 1, '2023-07-02 12:35:19.16152', NULL, NULL, 'SOCORRO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (753, true, 1, '2023-07-02 12:35:19.162854', NULL, NULL, 'SANTA RITA DO SAPUCAÍ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (754, true, 1, '2023-07-02 12:35:19.164189', NULL, NULL, 'PIRASSUNUNGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (755, true, 1, '2023-07-02 12:35:19.165585', NULL, NULL, 'PORTEIRINHA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (756, true, 1, '2023-07-02 12:35:19.174645', NULL, NULL, 'CAARAPÓ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (757, true, 1, '2023-07-02 12:35:19.176044', NULL, NULL, 'CAPANEMA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (758, true, 1, '2023-07-02 12:35:19.177392', NULL, NULL, 'IPORÃ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (759, true, 1, '2023-07-02 12:35:19.178736', NULL, NULL, 'SERINGUEIRAS', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (760, true, 1, '2023-07-02 12:35:19.180062', NULL, NULL, 'MANDAGUARI', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (761, true, 1, '2023-07-02 12:35:19.181201', NULL, NULL, 'SABINÓPOLIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (762, true, 1, '2023-07-02 12:35:19.188871', NULL, NULL, 'PAÇO DO LUMIAR', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (763, true, 1, '2023-07-02 12:35:19.19036', NULL, NULL, 'CANTO DO BURITI', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (764, true, 1, '2023-07-02 12:35:19.191689', NULL, NULL, 'IVOTI', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (765, true, 1, '2023-07-02 12:35:19.193014', NULL, NULL, 'SANTANA DO IPANEMA', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (766, true, 1, '2023-07-02 12:35:19.194365', NULL, NULL, 'RIBEIRÃO BONITO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (767, true, 1, '2023-07-02 12:35:19.19576', NULL, NULL, 'BARRACÃO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (768, true, 1, '2023-07-02 12:35:19.205025', NULL, NULL, 'REDENÇÃO', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (769, true, 1, '2023-07-02 12:35:19.20636', NULL, NULL, 'CRUZ ALTA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (770, true, 1, '2023-07-02 12:35:19.207686', NULL, NULL, 'GURUPI', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (771, true, 1, '2023-07-02 12:35:19.209026', NULL, NULL, 'VASSOURAS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (772, true, 1, '2023-07-02 12:35:19.210343', NULL, NULL, 'MAFRA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (773, true, 1, '2023-07-02 12:35:19.21174', NULL, NULL, 'JOAÇABA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (774, true, 1, '2023-07-02 12:35:19.219117', NULL, NULL, 'LAJEADO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (775, true, 1, '2023-07-02 12:35:19.220439', NULL, NULL, 'JACAREZINHO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (776, true, 1, '2023-07-02 12:35:19.2218', NULL, NULL, 'OURO PRETO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (777, true, 1, '2023-07-02 12:35:19.223161', NULL, NULL, 'SÃO CRISTÓVÃO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (778, true, 1, '2023-07-02 12:35:19.224595', NULL, NULL, 'DIAMANTINA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (779, true, 1, '2023-07-02 12:35:19.22573', NULL, NULL, 'SEROPÉDICA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (780, true, 1, '2023-07-02 12:35:19.234684', NULL, NULL, 'NOVA IGUAÇU', NULL, 'RJ', 'BRASIL');


--
-- TOC entry 3729 (class 0 OID 142444)
-- Dependencies: 244
-- Data for Name: faixa_salarial; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.faixa_salarial VALUES (1, true, 1, '2023-07-02 12:35:25.324325', NULL, NULL, '1 salário mínimo');
INSERT INTO public.faixa_salarial VALUES (2, true, 1, '2023-07-02 12:35:25.325653', NULL, NULL, 'de 2 a 4 salários mínimos');
INSERT INTO public.faixa_salarial VALUES (3, true, 1, '2023-07-02 12:35:25.326822', NULL, NULL, 'de 5 a 10 salários mínimos');
INSERT INTO public.faixa_salarial VALUES (4, true, 1, '2023-07-02 12:35:25.328', NULL, NULL, '11 ou mais salários mínimos');


--
-- TOC entry 3731 (class 0 OID 142453)
-- Dependencies: 246
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genero VALUES (1, true, 1, '2023-07-02 12:35:25.329352', NULL, NULL, 'Masculino');
INSERT INTO public.genero VALUES (2, true, 1, '2023-07-02 12:35:25.330716', NULL, NULL, 'Feminino');
INSERT INTO public.genero VALUES (3, true, 1, '2023-07-02 12:35:25.332016', NULL, NULL, 'Não-binário');
INSERT INTO public.genero VALUES (4, true, 1, '2023-07-02 12:35:25.333348', NULL, NULL, 'Transsexual');
INSERT INTO public.genero VALUES (5, true, 1, '2023-07-02 12:35:25.334717', NULL, NULL, 'Não quero declarar');
INSERT INTO public.genero VALUES (6, true, 1, '2023-07-02 12:35:25.336024', NULL, NULL, 'Outros');


--
-- TOC entry 3732 (class 0 OID 142461)
-- Dependencies: 247
-- Data for Name: genero_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3734 (class 0 OID 142467)
-- Dependencies: 249
-- Data for Name: mensagem; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3736 (class 0 OID 142476)
-- Dependencies: 251
-- Data for Name: palestra; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3738 (class 0 OID 142485)
-- Dependencies: 253
-- Data for Name: recuperacao_senha; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3739 (class 0 OID 142492)
-- Dependencies: 254
-- Data for Name: revinfo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3741 (class 0 OID 142498)
-- Dependencies: 256
-- Data for Name: setor_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.setor_atuacao VALUES (1, true, 1, '2023-07-02 12:35:17.199308', NULL, NULL, 'Empresarial');
INSERT INTO public.setor_atuacao VALUES (2, true, 1, '2023-07-02 12:35:17.206535', NULL, NULL, 'Público');
INSERT INTO public.setor_atuacao VALUES (3, true, 1, '2023-07-02 12:35:17.208071', NULL, NULL, 'Terceiro setor');
INSERT INTO public.setor_atuacao VALUES (4, true, 1, '2023-07-02 12:35:17.209432', NULL, NULL, 'Magistério/Docência');
INSERT INTO public.setor_atuacao VALUES (5, true, 1, '2023-07-02 12:35:17.210753', NULL, NULL, 'Outros');


--
-- TOC entry 3743 (class 0 OID 142507)
-- Dependencies: 258
-- Data for Name: status_usuario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3745 (class 0 OID 142515)
-- Dependencies: 260
-- Data for Name: tipo_bolsa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipo_bolsa VALUES (1, true, 1, '2023-07-02 12:35:25.337379', NULL, NULL, 'PIBIC');
INSERT INTO public.tipo_bolsa VALUES (2, true, 1, '2023-07-02 12:35:25.338719', NULL, NULL, 'PROAD');
INSERT INTO public.tipo_bolsa VALUES (3, true, 1, '2023-07-02 12:35:25.339878', NULL, NULL, 'PROEX');
INSERT INTO public.tipo_bolsa VALUES (4, true, 1, '2023-07-02 12:35:25.341212', NULL, NULL, 'PROBAC');
INSERT INTO public.tipo_bolsa VALUES (5, true, 1, '2023-07-02 12:35:25.342555', NULL, NULL, 'PERMANÊNCIA');
INSERT INTO public.tipo_bolsa VALUES (6, true, 1, '2023-07-02 12:35:25.343749', NULL, NULL, 'CAPES/CNPQ');


--
-- TOC entry 3746 (class 0 OID 142523)
-- Dependencies: 261
-- Data for Name: tipo_bolsa_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3748 (class 0 OID 142529)
-- Dependencies: 263
-- Data for Name: titulacao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.titulacao VALUES (1, true, 1, '2023-07-02 12:35:25.345133', NULL, NULL, 'GRADUAÇÃO');
INSERT INTO public.titulacao VALUES (2, true, 1, '2023-07-02 12:35:25.34634', NULL, NULL, 'PÓS-GRADUAÇÃO');


--
-- TOC entry 3750 (class 0 OID 142538)
-- Dependencies: 265
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario VALUES (1, true, NULL, '2023-07-02 12:35:17.170411', NULL, NULL, 'admin@admin.com', true, 'ADMIN ADMIN', '{bcrypt}$2a$10$vh9/MkL4XQyd.fqkQdnWSelTUxPBpDb6qL5W2uWLxLUN0JR9vwRZm', 'ADMIN', true);
INSERT INTO public.usuario VALUES (2, true, NULL, '2023-07-02 12:35:17.175646', NULL, NULL, 'secretario@secretario.com', true, 'SECRETARIO SECRETARIO', '{bcrypt}$2a$10$biZwxymZqQDevuqWzB/wCe0jfC6Idr.SJRYO9oXBFPuusp9oA9hAy', 'SECRETARIO', true);
INSERT INTO public.usuario VALUES (3, true, NULL, '2023-07-02 12:35:17.177099', NULL, NULL, 'egresso@egresso.com', true, 'EGRESSO EGRESSO', '{bcrypt}$2a$10$Tas4Xjqxogotz3bSL08nHOZRUNF9WJZuPthj2qn3maJMjwI2/uHtO', 'EGRESSO', true);


--
-- TOC entry 3751 (class 0 OID 142548)
-- Dependencies: 266
-- Data for Name: usuario_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3752 (class 0 OID 142553)
-- Dependencies: 267
-- Data for Name: usuario_grupo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario_grupo VALUES (1, 'ADMIN');
INSERT INTO public.usuario_grupo VALUES (2, 'SECRETARIO');
INSERT INTO public.usuario_grupo VALUES (3, 'EGRESSO');


--
-- TOC entry 3753 (class 0 OID 142558)
-- Dependencies: 268
-- Data for Name: usuario_grupo_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 215
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.anuncio_id_anuncio_seq', 1, false);


--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.area_atuacao_id_area_atuacao_seq', 6, true);


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 219
-- Name: area_emprego_id_area_emprego_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.area_emprego_id_area_emprego_seq', 7, true);


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 221
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribuicao_id_contribuicao_seq', 1, false);


--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 223
-- Name: cota_id_cota_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cota_id_cota_seq', 5, true);


--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 226
-- Name: curso_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.curso_id_curso_seq', 1, true);


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 228
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.depoimento_id_depoimento_seq', 1, false);


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 230
-- Name: egresso_id_egresso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_id_egresso_seq', 1, false);


--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 237
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_valido_id_egresso_valido_seq', 1120, true);


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 239
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.empresa_id_empresa_seq', 3054, true);


--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 241
-- Name: endereco_id_endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.endereco_id_endereco_seq', 780, true);


--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 243
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faixa_salarial_id_faixa_salarial_seq', 4, true);


--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 245
-- Name: genero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genero_id_genero_seq', 6, true);


--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 248
-- Name: mensagem_id_mensagem_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mensagem_id_mensagem_seq', 1, false);


--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 250
-- Name: palestra_id_palestra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.palestra_id_palestra_seq', 1, false);


--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 252
-- Name: recuperacao_senha_id_recuperacao_senha_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recuperacao_senha_id_recuperacao_senha_seq', 1, false);


--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 214
-- Name: revinfo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.revinfo_seq', 1, false);


--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 255
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.setor_atuacao_id_setor_atuacao_seq', 5, true);


--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 257
-- Name: status_usuario_id_status_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.status_usuario_id_status_usuario_seq', 1, false);


--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 259
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_bolsa_id_tipo_bolsa_seq', 6, true);


--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 262
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.titulacao_id_titulacao_seq', 2, true);


--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 264
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 3, true);


--
-- TOC entry 3413 (class 2606 OID 142313)
-- Name: anuncio anuncio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT anuncio_pkey PRIMARY KEY (id_anuncio);


--
-- TOC entry 3415 (class 2606 OID 142322)
-- Name: area_atuacao area_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT area_atuacao_pkey PRIMARY KEY (id_area_atuacao);


--
-- TOC entry 3419 (class 2606 OID 142331)
-- Name: area_emprego area_emprego_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_emprego
    ADD CONSTRAINT area_emprego_pkey PRIMARY KEY (id_area_emprego);


--
-- TOC entry 3423 (class 2606 OID 142340)
-- Name: contribuicao contribuicao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT contribuicao_pkey PRIMARY KEY (id_contribuicao);


--
-- TOC entry 3431 (class 2606 OID 142354)
-- Name: cota_aud cota_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota_aud
    ADD CONSTRAINT cota_aud_pkey PRIMARY KEY (rev, id_cota);


--
-- TOC entry 3427 (class 2606 OID 142349)
-- Name: cota cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT cota_pkey PRIMARY KEY (id_cota);


--
-- TOC entry 3433 (class 2606 OID 142363)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 3437 (class 2606 OID 142372)
-- Name: depoimento depoimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT depoimento_pkey PRIMARY KEY (id_depoimento);


--
-- TOC entry 3451 (class 2606 OID 142391)
-- Name: egresso_aud egresso_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_aud
    ADD CONSTRAINT egresso_aud_pkey PRIMARY KEY (rev, id_egresso);


--
-- TOC entry 3455 (class 2606 OID 142401)
-- Name: egresso_cota_aud egresso_cota_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota_aud
    ADD CONSTRAINT egresso_cota_aud_pkey PRIMARY KEY (id_egresso, rev, id_cota);


--
-- TOC entry 3453 (class 2606 OID 142396)
-- Name: egresso_cota egresso_cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT egresso_cota_pkey PRIMARY KEY (id_cota, id_egresso);


--
-- TOC entry 3457 (class 2606 OID 142408)
-- Name: egresso_empresa egresso_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT egresso_empresa_pkey PRIMARY KEY (egresso_id_egresso, empresa_id_empresa, endereco_id_endereco);


--
-- TOC entry 3441 (class 2606 OID 142384)
-- Name: egresso egresso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT egresso_pkey PRIMARY KEY (id_egresso);


--
-- TOC entry 3461 (class 2606 OID 142415)
-- Name: egresso_titulacao egresso_titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT egresso_titulacao_pkey PRIMARY KEY (egresso_id_egresso, titulacao_id_titulacao);


--
-- TOC entry 3465 (class 2606 OID 142422)
-- Name: egresso_valido egresso_valido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT egresso_valido_pkey PRIMARY KEY (id_egresso_valido);


--
-- TOC entry 3471 (class 2606 OID 142431)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 3475 (class 2606 OID 142442)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 3477 (class 2606 OID 142594)
-- Name: endereco enderecosunicos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT enderecosunicos UNIQUE (cidade_endereco, estado_endereco, pais_endereco);


--
-- TOC entry 3479 (class 2606 OID 142451)
-- Name: faixa_salarial faixa_salarial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT faixa_salarial_pkey PRIMARY KEY (id_faixa_salarial);


--
-- TOC entry 3487 (class 2606 OID 142465)
-- Name: genero_aud genero_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero_aud
    ADD CONSTRAINT genero_aud_pkey PRIMARY KEY (rev, id_genero);


--
-- TOC entry 3483 (class 2606 OID 142460)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3489 (class 2606 OID 142474)
-- Name: mensagem mensagem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem
    ADD CONSTRAINT mensagem_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 3491 (class 2606 OID 142483)
-- Name: palestra palestra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT palestra_pkey PRIMARY KEY (id_palestra);


--
-- TOC entry 3495 (class 2606 OID 142491)
-- Name: recuperacao_senha recuperacao_senha_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recuperacao_senha
    ADD CONSTRAINT recuperacao_senha_pkey PRIMARY KEY (id_recuperacao_senha);


--
-- TOC entry 3499 (class 2606 OID 142496)
-- Name: revinfo revinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- TOC entry 3501 (class 2606 OID 142505)
-- Name: setor_atuacao setor_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT setor_atuacao_pkey PRIMARY KEY (id_setor_atuacao);


--
-- TOC entry 3505 (class 2606 OID 142513)
-- Name: status_usuario status_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status_usuario
    ADD CONSTRAINT status_usuario_pkey PRIMARY KEY (id_status_usuario);


--
-- TOC entry 3511 (class 2606 OID 142527)
-- Name: tipo_bolsa_aud tipo_bolsa_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa_aud
    ADD CONSTRAINT tipo_bolsa_aud_pkey PRIMARY KEY (rev, id_tipo_bolsa);


--
-- TOC entry 3507 (class 2606 OID 142522)
-- Name: tipo_bolsa tipo_bolsa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT tipo_bolsa_pkey PRIMARY KEY (id_tipo_bolsa);


--
-- TOC entry 3513 (class 2606 OID 142536)
-- Name: titulacao titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT titulacao_pkey PRIMARY KEY (id_titulacao);


--
-- TOC entry 3481 (class 2606 OID 142596)
-- Name: faixa_salarial uk_2bn1lsqed44xqtrtq17s7tjue; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT uk_2bn1lsqed44xqtrtq17s7tjue UNIQUE (faixa_faixa_salarial);


--
-- TOC entry 3493 (class 2606 OID 142600)
-- Name: palestra uk_2h2mxjetrwvc8sg1wx5ttyq07; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT uk_2h2mxjetrwvc8sg1wx5ttyq07 UNIQUE (egresso_id);


--
-- TOC entry 3467 (class 2606 OID 142590)
-- Name: egresso_valido uk_2jwojv1fccodf62r2wa6st1i1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_2jwojv1fccodf62r2wa6st1i1 UNIQUE (matricula_egresso_valido);


--
-- TOC entry 3443 (class 2606 OID 142582)
-- Name: egresso uk_3tmslc9ltmjdyy2mbstgpf1un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_3tmslc9ltmjdyy2mbstgpf1un UNIQUE (usuario_id);


--
-- TOC entry 3445 (class 2606 OID 142580)
-- Name: egresso uk_4datilmpr40t15bnmxyve5t0y; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_4datilmpr40t15bnmxyve5t0y UNIQUE (matricula_egresso);


--
-- TOC entry 3517 (class 2606 OID 142610)
-- Name: usuario uk_5171l57faosmj8myawaucatdw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email);


--
-- TOC entry 3485 (class 2606 OID 142598)
-- Name: genero uk_6xfypuejpx9h55hdouj112ocw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT uk_6xfypuejpx9h55hdouj112ocw UNIQUE (nome_genero);


--
-- TOC entry 3447 (class 2606 OID 142578)
-- Name: egresso uk_7wtwbdgn55nu31nx24ib5revf; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_7wtwbdgn55nu31nx24ib5revf UNIQUE (linkedin_egresso);


--
-- TOC entry 3519 (class 2606 OID 142612)
-- Name: usuario uk_8efax56av7vfdquauh0gyl9cx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_8efax56av7vfdquauh0gyl9cx UNIQUE (login_usuario);


--
-- TOC entry 3449 (class 2606 OID 142576)
-- Name: egresso uk_919oulldbx88ntvtrq5r6sdkt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_919oulldbx88ntvtrq5r6sdkt UNIQUE (lattes_egresso);


--
-- TOC entry 3429 (class 2606 OID 142570)
-- Name: cota uk_9k3kf2b9f2mjv11ksekdha97k; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT uk_9k3kf2b9f2mjv11ksekdha97k UNIQUE (nome_cota);


--
-- TOC entry 3473 (class 2606 OID 142592)
-- Name: empresa uk_bwgigp9epp6elsfohco9fetet; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT uk_bwgigp9epp6elsfohco9fetet UNIQUE (nome_empresa);


--
-- TOC entry 3463 (class 2606 OID 142586)
-- Name: egresso_titulacao uk_du19rk6x1k7pg5tmh7k2xphgd; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT uk_du19rk6x1k7pg5tmh7k2xphgd UNIQUE (egresso_id_egresso);


--
-- TOC entry 3421 (class 2606 OID 142566)
-- Name: area_emprego uk_hjp1enuotfpdwx9utf5n12iqc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_emprego
    ADD CONSTRAINT uk_hjp1enuotfpdwx9utf5n12iqc UNIQUE (nome_area_emprego);


--
-- TOC entry 3435 (class 2606 OID 142572)
-- Name: curso uk_i35k8uavr3s5cxr12aefe00e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT uk_i35k8uavr3s5cxr12aefe00e UNIQUE (nome_curso);


--
-- TOC entry 3503 (class 2606 OID 142604)
-- Name: setor_atuacao uk_j59f23omfkincud4bx0f8x3vp; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT uk_j59f23omfkincud4bx0f8x3vp UNIQUE (nome_setor_atuacao);


--
-- TOC entry 3509 (class 2606 OID 142606)
-- Name: tipo_bolsa uk_j6yqoqsrpie5ipmlh6c5jbrx1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT uk_j6yqoqsrpie5ipmlh6c5jbrx1 UNIQUE (nome_tipo_bolsa);


--
-- TOC entry 3417 (class 2606 OID 142564)
-- Name: area_atuacao uk_mu4kvuf03rl6w7vpqgvtt78pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT uk_mu4kvuf03rl6w7vpqgvtt78pk UNIQUE (nome_area_atuacao);


--
-- TOC entry 3497 (class 2606 OID 142602)
-- Name: recuperacao_senha uk_npbm5he227ci13xfxpe0irwmh; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recuperacao_senha
    ADD CONSTRAINT uk_npbm5he227ci13xfxpe0irwmh UNIQUE (token_recuperacao_senha);


--
-- TOC entry 3459 (class 2606 OID 142584)
-- Name: egresso_empresa uk_r0sm8hpv921bqw3nrmnnjt99x; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT uk_r0sm8hpv921bqw3nrmnnjt99x UNIQUE (egresso_id_egresso);


--
-- TOC entry 3439 (class 2606 OID 142574)
-- Name: depoimento uk_rpha5d7rfphcjvj0nbjb1nvxs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT uk_rpha5d7rfphcjvj0nbjb1nvxs UNIQUE (egresso_id);


--
-- TOC entry 3425 (class 2606 OID 142568)
-- Name: contribuicao uk_rpvny7ejlpmi3fk8mbwva6qjy; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT uk_rpvny7ejlpmi3fk8mbwva6qjy UNIQUE (egresso_id);


--
-- TOC entry 3515 (class 2606 OID 142608)
-- Name: titulacao uk_rvnwm2n5juoh0aj3qnssh52nm; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT uk_rvnwm2n5juoh0aj3qnssh52nm UNIQUE (nome_titulacao);


--
-- TOC entry 3469 (class 2606 OID 142588)
-- Name: egresso_valido uk_snrp717wd5d36lg78t56wefwt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_snrp717wd5d36lg78t56wefwt UNIQUE (email_egresso_valido);


--
-- TOC entry 3523 (class 2606 OID 142552)
-- Name: usuario_aud usuario_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_aud
    ADD CONSTRAINT usuario_aud_pkey PRIMARY KEY (rev, id_usuario);


--
-- TOC entry 3527 (class 2606 OID 142562)
-- Name: usuario_grupo_aud usuario_grupo_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo_aud
    ADD CONSTRAINT usuario_grupo_aud_pkey PRIMARY KEY (rev, id_usuario, grupo);


--
-- TOC entry 3525 (class 2606 OID 142557)
-- Name: usuario_grupo usuario_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT usuario_grupo_pkey PRIMARY KEY (id_usuario, grupo);


--
-- TOC entry 3521 (class 2606 OID 142547)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3550 (class 2606 OID 142723)
-- Name: genero_aud fk17rp3lhfxs5e5tb7ycn9v529; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero_aud
    ADD CONSTRAINT fk17rp3lhfxs5e5tb7ycn9v529 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3545 (class 2606 OID 142698)
-- Name: egresso_titulacao fk1bu3y46jwvfc24y707b8hr57s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk1bu3y46jwvfc24y707b8hr57s FOREIGN KEY (curso_id) REFERENCES public.curso(id_curso);


--
-- TOC entry 3529 (class 2606 OID 142618)
-- Name: contribuicao fk2ccawuj4bpvj1vk6mhrb6b0op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk2ccawuj4bpvj1vk6mhrb6b0op FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3546 (class 2606 OID 142703)
-- Name: egresso_titulacao fk2pj0kns83aqiewk5pf2wxj1n9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk2pj0kns83aqiewk5pf2wxj1n9 FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3536 (class 2606 OID 142658)
-- Name: egresso_cota fk2rs3m3oq3ujpj3nvgbyaqwata; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fk2rs3m3oq3ujpj3nvgbyaqwata FOREIGN KEY (id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3535 (class 2606 OID 142648)
-- Name: egresso_aud fk338edpeyd896a9x3br6lair7s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_aud
    ADD CONSTRAINT fk338edpeyd896a9x3br6lair7s FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3532 (class 2606 OID 142643)
-- Name: egresso fk3lb1ai4t6bvvsu9jc9qm0fisi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fk3lb1ai4t6bvvsu9jc9qm0fisi FOREIGN KEY (usuario_id) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3538 (class 2606 OID 142663)
-- Name: egresso_cota_aud fk5gpjbho9o3o9kwu64cybq5uqv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota_aud
    ADD CONSTRAINT fk5gpjbho9o3o9kwu64cybq5uqv FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3555 (class 2606 OID 142748)
-- Name: usuario_grupo fk9huj1upwjyabwkwnpnhnernnu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fk9huj1upwjyabwkwnpnhnernnu FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3537 (class 2606 OID 142653)
-- Name: egresso_cota fka58rgwpq37hoof2640cw7j2l1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fka58rgwpq37hoof2640cw7j2l1 FOREIGN KEY (id_cota) REFERENCES public.cota(id_cota);


--
-- TOC entry 3547 (class 2606 OID 142713)
-- Name: egresso_titulacao fkb7ankaa93u5fr4nmbmyw46kmc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkb7ankaa93u5fr4nmbmyw46kmc FOREIGN KEY (titulacao_id_titulacao) REFERENCES public.titulacao(id_titulacao);


--
-- TOC entry 3548 (class 2606 OID 142708)
-- Name: egresso_titulacao fkbympkqdq4ugh9r707xwyxmx0i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkbympkqdq4ugh9r707xwyxmx0i FOREIGN KEY (empresa_id) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3554 (class 2606 OID 142743)
-- Name: usuario_aud fkccqpbcawc1yublnm3f1c0q8ie; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_aud
    ADD CONSTRAINT fkccqpbcawc1yublnm3f1c0q8ie FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3533 (class 2606 OID 142633)
-- Name: egresso fkcqqxhbp7hpudbb1dcyouyaq79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkcqqxhbp7hpudbb1dcyouyaq79 FOREIGN KEY (tipo_bolsa_id) REFERENCES public.tipo_bolsa(id_tipo_bolsa);


--
-- TOC entry 3539 (class 2606 OID 142693)
-- Name: egresso_empresa fkdsaknoo0x7tq0wfqdwtluix5n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkdsaknoo0x7tq0wfqdwtluix5n FOREIGN KEY (setor_atuacao_id) REFERENCES public.setor_atuacao(id_setor_atuacao);


--
-- TOC entry 3540 (class 2606 OID 142688)
-- Name: egresso_empresa fkdut9kbfj1c87myf42xmao3aja; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkdut9kbfj1c87myf42xmao3aja FOREIGN KEY (faixa_salarial_id) REFERENCES public.faixa_salarial(id_faixa_salarial);


--
-- TOC entry 3528 (class 2606 OID 142613)
-- Name: anuncio fkgiwie4ydjwi1hi8a5rpwl8aop; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkgiwie4ydjwi1hi8a5rpwl8aop FOREIGN KEY (area_emprego_anuncio_id) REFERENCES public.area_emprego(id_area_emprego);


--
-- TOC entry 3556 (class 2606 OID 142753)
-- Name: usuario_grupo_aud fkhoxan1erm2mblwsmjeexepwa9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo_aud
    ADD CONSTRAINT fkhoxan1erm2mblwsmjeexepwa9 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3541 (class 2606 OID 142668)
-- Name: egresso_empresa fkjj09rwrjadvvdmkdo1ugyprxg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkjj09rwrjadvvdmkdo1ugyprxg FOREIGN KEY (area_atuacao_id) REFERENCES public.area_atuacao(id_area_atuacao);


--
-- TOC entry 3534 (class 2606 OID 142638)
-- Name: egresso fkk0wr6p5gu54r773ttv5iira6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkk0wr6p5gu54r773ttv5iira6f FOREIGN KEY (genero_id) REFERENCES public.genero(id_genero);


--
-- TOC entry 3551 (class 2606 OID 142728)
-- Name: palestra fkku18fu56mnqdkfwbukwah002; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT fkku18fu56mnqdkfwbukwah002 FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3531 (class 2606 OID 142628)
-- Name: depoimento fkmh11nyrmuejhtnlbo1tdxp88v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkmh11nyrmuejhtnlbo1tdxp88v FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3552 (class 2606 OID 142733)
-- Name: recuperacao_senha fkmrvoquu2f4flgys9dqbfu7oru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recuperacao_senha
    ADD CONSTRAINT fkmrvoquu2f4flgys9dqbfu7oru FOREIGN KEY (usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3553 (class 2606 OID 142738)
-- Name: tipo_bolsa_aud fknl8tvw4wnwgyijj1koumk6d8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa_aud
    ADD CONSTRAINT fknl8tvw4wnwgyijj1koumk6d8d FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3542 (class 2606 OID 142673)
-- Name: egresso_empresa fkrrdwo5y0sss2aq6r989sngy0g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkrrdwo5y0sss2aq6r989sngy0g FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3543 (class 2606 OID 142678)
-- Name: egresso_empresa fks0wngwsneahqe1p80rh1olamu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fks0wngwsneahqe1p80rh1olamu FOREIGN KEY (empresa_id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3549 (class 2606 OID 142718)
-- Name: empresa fks5bj6jkkca1s0d3jgw4wioi9g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fks5bj6jkkca1s0d3jgw4wioi9g FOREIGN KEY (endereco_empresa) REFERENCES public.endereco(id_endereco);


--
-- TOC entry 3530 (class 2606 OID 142623)
-- Name: cota_aud fks9hpicuwd9ta3y1emtrhuyuxf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota_aud
    ADD CONSTRAINT fks9hpicuwd9ta3y1emtrhuyuxf FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3544 (class 2606 OID 142683)
-- Name: egresso_empresa fksccjqcsggw6n2wurxynphgs5w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fksccjqcsggw6n2wurxynphgs5w FOREIGN KEY (endereco_id_endereco) REFERENCES public.endereco(id_endereco);


-- Completed on 2023-07-02 12:35:51 -03

--
-- PostgreSQL database dump complete
--

