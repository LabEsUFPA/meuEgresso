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
-- TOC entry 215 (class 1259 OID 83830)
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
-- TOC entry 3760 (class 0 OID 0)
-- Dependencies: 215
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.anuncio_id_anuncio_seq OWNED BY public.anuncio.id_anuncio;


--
-- TOC entry 218 (class 1259 OID 83842)
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
-- TOC entry 217 (class 1259 OID 83841)
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
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.area_atuacao_id_area_atuacao_seq OWNED BY public.area_atuacao.id_area_atuacao;


--
-- TOC entry 220 (class 1259 OID 83851)
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
-- TOC entry 219 (class 1259 OID 83850)
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
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 219
-- Name: area_emprego_id_area_emprego_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.area_emprego_id_area_emprego_seq OWNED BY public.area_emprego.id_area_emprego;


--
-- TOC entry 222 (class 1259 OID 83860)
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
-- TOC entry 221 (class 1259 OID 83859)
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
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 221
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contribuicao_id_contribuicao_seq OWNED BY public.contribuicao.id_contribuicao;


--
-- TOC entry 224 (class 1259 OID 83869)
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
-- TOC entry 225 (class 1259 OID 83877)
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
-- TOC entry 223 (class 1259 OID 83868)
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
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 223
-- Name: cota_id_cota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cota_id_cota_seq OWNED BY public.cota.id_cota;


--
-- TOC entry 227 (class 1259 OID 83883)
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
-- TOC entry 226 (class 1259 OID 83882)
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
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 226
-- Name: curso_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.curso_id_curso_seq OWNED BY public.curso.id_curso;


--
-- TOC entry 229 (class 1259 OID 83892)
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
-- TOC entry 228 (class 1259 OID 83891)
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
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 228
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.depoimento_id_depoimento_seq OWNED BY public.depoimento.id_depoimento;


--
-- TOC entry 231 (class 1259 OID 83901)
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
-- TOC entry 232 (class 1259 OID 83912)
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
-- TOC entry 233 (class 1259 OID 83919)
-- Name: egresso_cota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_cota (
    id_cota integer NOT NULL,
    id_egresso integer NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 83924)
-- Name: egresso_cota_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_cota_aud (
    rev integer NOT NULL,
    id_egresso integer NOT NULL,
    id_cota integer NOT NULL,
    revtype smallint
);


--
-- TOC entry 235 (class 1259 OID 83929)
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
-- TOC entry 230 (class 1259 OID 83900)
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
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 230
-- Name: egresso_id_egresso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.egresso_id_egresso_seq OWNED BY public.egresso.id_egresso;


--
-- TOC entry 236 (class 1259 OID 83936)
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
-- TOC entry 238 (class 1259 OID 83944)
-- Name: egresso_valido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.egresso_valido (
    id_egresso_valido integer NOT NULL,
    email_egresso_valido character varying(255),
    matricula_egresso_valido character varying(12),
    nome_egresso_valido character varying(100) NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 83943)
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
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 237
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.egresso_valido_id_egresso_valido_seq OWNED BY public.egresso_valido.id_egresso_valido;


--
-- TOC entry 240 (class 1259 OID 83951)
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
-- TOC entry 239 (class 1259 OID 83950)
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
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 239
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;


--
-- TOC entry 242 (class 1259 OID 83960)
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
-- TOC entry 241 (class 1259 OID 83959)
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
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 241
-- Name: endereco_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.endereco_id_endereco_seq OWNED BY public.endereco.id_endereco;


--
-- TOC entry 244 (class 1259 OID 83971)
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
-- TOC entry 243 (class 1259 OID 83970)
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
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 243
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.faixa_salarial_id_faixa_salarial_seq OWNED BY public.faixa_salarial.id_faixa_salarial;


--
-- TOC entry 246 (class 1259 OID 83980)
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
-- TOC entry 247 (class 1259 OID 83988)
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
-- TOC entry 245 (class 1259 OID 83979)
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
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 245
-- Name: genero_id_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genero_id_genero_seq OWNED BY public.genero.id_genero;


--
-- TOC entry 249 (class 1259 OID 83994)
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
-- TOC entry 248 (class 1259 OID 83993)
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
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 248
-- Name: mensagem_id_mensagem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mensagem_id_mensagem_seq OWNED BY public.mensagem.id_mensagem;


--
-- TOC entry 251 (class 1259 OID 84003)
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
-- TOC entry 250 (class 1259 OID 84002)
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
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 250
-- Name: palestra_id_palestra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.palestra_id_palestra_seq OWNED BY public.palestra.id_palestra;


--
-- TOC entry 253 (class 1259 OID 84012)
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
-- TOC entry 252 (class 1259 OID 84011)
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
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 252
-- Name: recuperacao_senha_id_recuperacao_senha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recuperacao_senha_id_recuperacao_senha_seq OWNED BY public.recuperacao_senha.id_recuperacao_senha;


--
-- TOC entry 254 (class 1259 OID 84019)
-- Name: revinfo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


--
-- TOC entry 214 (class 1259 OID 83829)
-- Name: revinfo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.revinfo_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 256 (class 1259 OID 84025)
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
-- TOC entry 255 (class 1259 OID 84024)
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
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 255
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.setor_atuacao_id_setor_atuacao_seq OWNED BY public.setor_atuacao.id_setor_atuacao;


--
-- TOC entry 258 (class 1259 OID 84034)
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
-- TOC entry 257 (class 1259 OID 84033)
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
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 257
-- Name: status_usuario_id_status_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.status_usuario_id_status_usuario_seq OWNED BY public.status_usuario.id_status_usuario;


--
-- TOC entry 260 (class 1259 OID 84042)
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
-- TOC entry 261 (class 1259 OID 84050)
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
-- TOC entry 259 (class 1259 OID 84041)
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
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 259
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_bolsa_id_tipo_bolsa_seq OWNED BY public.tipo_bolsa.id_tipo_bolsa;


--
-- TOC entry 263 (class 1259 OID 84056)
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
-- TOC entry 262 (class 1259 OID 84055)
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
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 262
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.titulacao_id_titulacao_seq OWNED BY public.titulacao.id_titulacao;


--
-- TOC entry 265 (class 1259 OID 84065)
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
-- TOC entry 266 (class 1259 OID 84075)
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
-- TOC entry 267 (class 1259 OID 84080)
-- Name: usuario_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_grupo (
    id_usuario integer NOT NULL,
    grupo character varying(10) NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 84085)
-- Name: usuario_grupo_aud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_grupo_aud (
    rev integer NOT NULL,
    id_usuario integer NOT NULL,
    grupo character varying(10) NOT NULL,
    revtype smallint
);


--
-- TOC entry 264 (class 1259 OID 84064)
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
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 264
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 3348 (class 2604 OID 83834)
-- Name: anuncio id_anuncio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio ALTER COLUMN id_anuncio SET DEFAULT nextval('public.anuncio_id_anuncio_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 83845)
-- Name: area_atuacao id_area_atuacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao ALTER COLUMN id_area_atuacao SET DEFAULT nextval('public.area_atuacao_id_area_atuacao_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 83854)
-- Name: area_emprego id_area_emprego; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_emprego ALTER COLUMN id_area_emprego SET DEFAULT nextval('public.area_emprego_id_area_emprego_seq'::regclass);


--
-- TOC entry 3357 (class 2604 OID 83863)
-- Name: contribuicao id_contribuicao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao ALTER COLUMN id_contribuicao SET DEFAULT nextval('public.contribuicao_id_contribuicao_seq'::regclass);


--
-- TOC entry 3360 (class 2604 OID 83872)
-- Name: cota id_cota; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota ALTER COLUMN id_cota SET DEFAULT nextval('public.cota_id_cota_seq'::regclass);


--
-- TOC entry 3363 (class 2604 OID 83886)
-- Name: curso id_curso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso ALTER COLUMN id_curso SET DEFAULT nextval('public.curso_id_curso_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 83895)
-- Name: depoimento id_depoimento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento ALTER COLUMN id_depoimento SET DEFAULT nextval('public.depoimento_id_depoimento_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 83904)
-- Name: egresso id_egresso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso ALTER COLUMN id_egresso SET DEFAULT nextval('public.egresso_id_egresso_seq'::regclass);


--
-- TOC entry 3376 (class 2604 OID 83947)
-- Name: egresso_valido id_egresso_valido; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido ALTER COLUMN id_egresso_valido SET DEFAULT nextval('public.egresso_valido_id_egresso_valido_seq'::regclass);


--
-- TOC entry 3377 (class 2604 OID 83954)
-- Name: empresa id_empresa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);


--
-- TOC entry 3380 (class 2604 OID 83963)
-- Name: endereco id_endereco; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id_endereco SET DEFAULT nextval('public.endereco_id_endereco_seq'::regclass);


--
-- TOC entry 3383 (class 2604 OID 83974)
-- Name: faixa_salarial id_faixa_salarial; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial ALTER COLUMN id_faixa_salarial SET DEFAULT nextval('public.faixa_salarial_id_faixa_salarial_seq'::regclass);


--
-- TOC entry 3386 (class 2604 OID 83983)
-- Name: genero id_genero; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero ALTER COLUMN id_genero SET DEFAULT nextval('public.genero_id_genero_seq'::regclass);


--
-- TOC entry 3389 (class 2604 OID 83997)
-- Name: mensagem id_mensagem; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem ALTER COLUMN id_mensagem SET DEFAULT nextval('public.mensagem_id_mensagem_seq'::regclass);


--
-- TOC entry 3390 (class 2604 OID 84006)
-- Name: palestra id_palestra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra ALTER COLUMN id_palestra SET DEFAULT nextval('public.palestra_id_palestra_seq'::regclass);


--
-- TOC entry 3393 (class 2604 OID 84015)
-- Name: recuperacao_senha id_recuperacao_senha; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recuperacao_senha ALTER COLUMN id_recuperacao_senha SET DEFAULT nextval('public.recuperacao_senha_id_recuperacao_senha_seq'::regclass);


--
-- TOC entry 3395 (class 2604 OID 84028)
-- Name: setor_atuacao id_setor_atuacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao ALTER COLUMN id_setor_atuacao SET DEFAULT nextval('public.setor_atuacao_id_setor_atuacao_seq'::regclass);


--
-- TOC entry 3398 (class 2604 OID 84037)
-- Name: status_usuario id_status_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status_usuario ALTER COLUMN id_status_usuario SET DEFAULT nextval('public.status_usuario_id_status_usuario_seq'::regclass);


--
-- TOC entry 3400 (class 2604 OID 84045)
-- Name: tipo_bolsa id_tipo_bolsa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa ALTER COLUMN id_tipo_bolsa SET DEFAULT nextval('public.tipo_bolsa_id_tipo_bolsa_seq'::regclass);


--
-- TOC entry 3403 (class 2604 OID 84059)
-- Name: titulacao id_titulacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao ALTER COLUMN id_titulacao SET DEFAULT nextval('public.titulacao_id_titulacao_seq'::regclass);


--
-- TOC entry 3406 (class 2604 OID 84068)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3701 (class 0 OID 83831)
-- Dependencies: 216
-- Data for Name: anuncio; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3703 (class 0 OID 83842)
-- Dependencies: 218
-- Data for Name: area_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.area_atuacao VALUES (1, true, 1, '2023-07-03 14:52:45.583985', NULL, NULL, 'Computação');
INSERT INTO public.area_atuacao VALUES (2, true, 1, '2023-07-03 14:52:45.585832', NULL, NULL, 'Pesquisa');
INSERT INTO public.area_atuacao VALUES (3, true, 1, '2023-07-03 14:52:45.587498', NULL, NULL, 'Desempregado');
INSERT INTO public.area_atuacao VALUES (4, true, 1, '2023-07-03 14:52:45.589031', NULL, NULL, 'Programador');
INSERT INTO public.area_atuacao VALUES (5, true, 1, '2023-07-03 14:52:45.590228', NULL, NULL, 'Analista');
INSERT INTO public.area_atuacao VALUES (6, true, 1, '2023-07-03 14:52:45.59136', NULL, NULL, 'Outros');


--
-- TOC entry 3705 (class 0 OID 83851)
-- Dependencies: 220
-- Data for Name: area_emprego; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.area_emprego VALUES (1, true, 1, '2023-07-03 14:52:50.706439', NULL, NULL, 'Engenharia de Software');
INSERT INTO public.area_emprego VALUES (2, true, 1, '2023-07-03 14:52:50.708381', NULL, NULL, 'Programação');
INSERT INTO public.area_emprego VALUES (3, true, 1, '2023-07-03 14:52:50.709632', NULL, NULL, 'Informática');
INSERT INTO public.area_emprego VALUES (4, true, 1, '2023-07-03 14:52:50.710904', NULL, NULL, 'Suporte a TI');
INSERT INTO public.area_emprego VALUES (5, true, 1, '2023-07-03 14:52:50.71208', NULL, NULL, 'Analista de Sistema');
INSERT INTO public.area_emprego VALUES (6, true, 1, '2023-07-03 14:52:50.713283', NULL, NULL, 'Analista de QA');
INSERT INTO public.area_emprego VALUES (7, true, 1, '2023-07-03 14:52:50.714589', NULL, NULL, 'Outros');


--
-- TOC entry 3707 (class 0 OID 83860)
-- Dependencies: 222
-- Data for Name: contribuicao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3709 (class 0 OID 83869)
-- Dependencies: 224
-- Data for Name: cota; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cota VALUES (1, true, 1, '2023-07-03 14:52:45.568948', NULL, NULL, 'Escola');
INSERT INTO public.cota VALUES (2, true, 1, '2023-07-03 14:52:45.570512', NULL, NULL, 'Renda');
INSERT INTO public.cota VALUES (3, true, 1, '2023-07-03 14:52:45.571722', NULL, NULL, 'Autodeclaração de Raça');
INSERT INTO public.cota VALUES (4, true, 1, '2023-07-03 14:52:45.572991', NULL, NULL, 'Quilombolas/Indígenas');
INSERT INTO public.cota VALUES (5, true, 1, '2023-07-03 14:52:45.574207', NULL, NULL, 'PCD');


--
-- TOC entry 3710 (class 0 OID 83877)
-- Dependencies: 225
-- Data for Name: cota_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3712 (class 0 OID 83883)
-- Dependencies: 227
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.curso VALUES (1, true, 1, '2023-07-03 14:52:45.575489', NULL, NULL, 'CIÊNCIA DA COMPUTAÇÃO');


--
-- TOC entry 3714 (class 0 OID 83892)
-- Dependencies: 229
-- Data for Name: depoimento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3716 (class 0 OID 83901)
-- Dependencies: 231
-- Data for Name: egresso; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3717 (class 0 OID 83912)
-- Dependencies: 232
-- Data for Name: egresso_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3718 (class 0 OID 83919)
-- Dependencies: 233
-- Data for Name: egresso_cota; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3719 (class 0 OID 83924)
-- Dependencies: 234
-- Data for Name: egresso_cota_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3720 (class 0 OID 83929)
-- Dependencies: 235
-- Data for Name: egresso_empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3721 (class 0 OID 83936)
-- Dependencies: 236
-- Data for Name: egresso_titulacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3723 (class 0 OID 83944)
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
-- TOC entry 3725 (class 0 OID 83951)
-- Dependencies: 240
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.empresa VALUES (1, true, 1, '2023-07-03 14:52:46.592943', NULL, NULL, false, 'ABEU - CENTRO UNIVERSITÁRIO (UNIABEU)', 1);
INSERT INTO public.empresa VALUES (2, true, 1, '2023-07-03 14:52:46.594661', NULL, NULL, false, 'ACADEMIA DE POLÍCIA MILITAR DE MINAS GERAIS (APM)', 2);
INSERT INTO public.empresa VALUES (3, true, 1, '2023-07-03 14:52:46.596061', NULL, NULL, false, 'ACADEMIA JUDICIAL DO TRIBUNAL DE JUSTIÇA DE SANTA CATARINA (AJ)', 3);
INSERT INTO public.empresa VALUES (4, true, 1, '2023-07-03 14:52:46.597829', NULL, NULL, false, 'ACADEMIA MILITAR DAS AGULHAS NEGRAS (AMAN)', 4);
INSERT INTO public.empresa VALUES (5, true, 1, '2023-07-03 14:52:46.599578', NULL, NULL, false, 'ACADEMIA NACIONAL DE POLÍCIA - ANP (ANP)', 5);
INSERT INTO public.empresa VALUES (6, true, 1, '2023-07-03 14:52:46.601421', NULL, NULL, false, 'AJES - FACULDADE DO VALE DO JURUENA (AJES)', 6);
INSERT INTO public.empresa VALUES (7, true, 1, '2023-07-03 14:52:46.603618', NULL, NULL, false, 'ALFA - FACULDADE DE TEÓFILO OTONI (ALFA - TO)', 7);
INSERT INTO public.empresa VALUES (8, true, 1, '2023-07-03 14:52:46.605191', NULL, NULL, false, 'BRAIN BUSINESS SCHOOL (BRAIN)', 8);
INSERT INTO public.empresa VALUES (9, true, 1, '2023-07-03 14:52:46.606686', NULL, NULL, false, 'CEDDU - CENTRO DE ENSINO SUPERIOR (CEDDU)', 9);
INSERT INTO public.empresa VALUES (10, true, 1, '2023-07-03 14:52:46.608044', NULL, NULL, false, 'CENAC - CENTRO DE ENSINO NACIONAL', 10);
INSERT INTO public.empresa VALUES (11, true, 1, '2023-07-03 14:52:46.609297', NULL, NULL, false, 'CENTRO DE EDUCAÇÃO TÉCNICA DA UTRAMIG (UTRAMIG)', 2);
INSERT INTO public.empresa VALUES (12, true, 1, '2023-07-03 14:52:46.610599', NULL, NULL, false, 'CENTRO DE EDUCAÇÃO TECNOLÓGICO DA FUNDAÇÃO INDAIATUBANA DE EDUCAÇÃO E CULTURA (FIEC)', 11);
INSERT INTO public.empresa VALUES (13, true, 1, '2023-07-03 14:52:46.611861', NULL, NULL, false, 'CENTRO DE ENSINO E PESQUISA DO PRÓ-CARDÍACO (PROCEP)', 12);
INSERT INTO public.empresa VALUES (14, true, 1, '2023-07-03 14:52:46.613154', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR CESUL (CESUL)', 13);
INSERT INTO public.empresa VALUES (15, true, 1, '2023-07-03 14:52:46.614458', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE ALTAMIRA', 14);
INSERT INTO public.empresa VALUES (16, true, 1, '2023-07-03 14:52:46.615854', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE ARCOVERDE (CESA)', 15);
INSERT INTO public.empresa VALUES (17, true, 1, '2023-07-03 14:52:46.617161', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE BACABEIRA (CESBA)', 16);
INSERT INTO public.empresa VALUES (18, true, 1, '2023-07-03 14:52:46.618443', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE CATALÃO', 17);
INSERT INTO public.empresa VALUES (19, true, 1, '2023-07-03 14:52:46.619831', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE CONSELHEIRO LAFAIETE (CES-CL)', 18);
INSERT INTO public.empresa VALUES (20, true, 1, '2023-07-03 14:52:46.621212', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE DIVINÓPOLIS', 19);
INSERT INTO public.empresa VALUES (21, true, 1, '2023-07-03 14:52:46.622508', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE ILHÉUS (CESUPI)', 20);
INSERT INTO public.empresa VALUES (22, true, 1, '2023-07-03 14:52:46.623868', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE JATAÍ (CESUT)', 21);
INSERT INTO public.empresa VALUES (23, true, 1, '2023-07-03 14:52:46.625228', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE LORENA', 22);
INSERT INTO public.empresa VALUES (24, true, 1, '2023-07-03 14:52:46.626489', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE PALMAS (CESUP)', 23);
INSERT INTO public.empresa VALUES (25, true, 1, '2023-07-03 14:52:46.627685', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE SERRA DOURADA', 22);
INSERT INTO public.empresa VALUES (26, true, 1, '2023-07-03 14:52:46.628835', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE SETE LAGOAS', 24);
INSERT INTO public.empresa VALUES (27, true, 1, '2023-07-03 14:52:46.630024', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DE VITÓRIA (CESV)', 25);
INSERT INTO public.empresa VALUES (28, true, 1, '2023-07-03 14:52:46.63127', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DO AMAPÁ (CEAP)', 26);
INSERT INTO public.empresa VALUES (29, true, 1, '2023-07-03 14:52:46.632489', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DO VALE DO PARNAÍBA (CESVALE)', 27);
INSERT INTO public.empresa VALUES (30, true, 1, '2023-07-03 14:52:46.633677', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR DO VALE SÃO FRANCISCO (CESVASF)', 28);
INSERT INTO public.empresa VALUES (31, true, 1, '2023-07-03 14:52:46.634859', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR RIOGRANDENSE (CESURG)', 29);
INSERT INTO public.empresa VALUES (32, true, 1, '2023-07-03 14:52:46.636083', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR RIOGRANDENSE GUAPORE (CESURG GUAPORE)', 30);
INSERT INTO public.empresa VALUES (33, true, 1, '2023-07-03 14:52:46.637321', NULL, NULL, false, 'CENTRO DE ENSINO SUPERIOR SOCIESC DE JARAGUÁ DO SUL', 31);
INSERT INTO public.empresa VALUES (34, true, 1, '2023-07-03 14:52:46.638501', NULL, NULL, false, 'CENTRO DE ENSINO UNIFICADO DO PIAUÍ (CEUPI)', 27);
INSERT INTO public.empresa VALUES (35, true, 1, '2023-07-03 14:52:46.639713', NULL, NULL, false, 'CENTRO DE ESTUDOS DE PESSOAL E FORTE DUQUE DE CAXIAS (CEP)', 12);
INSERT INTO public.empresa VALUES (36, true, 1, '2023-07-03 14:52:46.64099', NULL, NULL, false, 'CENTRO DE ESTUDOS EM DIREITO E NEGÓCIOS', 2);
INSERT INTO public.empresa VALUES (37, true, 1, '2023-07-03 14:52:46.642181', NULL, NULL, false, 'CENTRO DE ESTUDOS SUPERIORES APRENDIZ (CESA)', 32);
INSERT INTO public.empresa VALUES (38, true, 1, '2023-07-03 14:52:46.643326', NULL, NULL, false, 'CENTRO DE ESTUDOS SUPERIORES DE JATAÍ', 21);
INSERT INTO public.empresa VALUES (39, true, 1, '2023-07-03 14:52:46.644491', NULL, NULL, false, 'CENTRO DE FORMAÇÃO, TREINAMENTO E APERFEIÇOAMENTO (CEFOR)', 5);
INSERT INTO public.empresa VALUES (40, true, 1, '2023-07-03 14:52:46.64566', NULL, NULL, false, 'CENTRO DE INSTRUÇÃO DE AVIAÇÃO DO EXÉRCITO (CIAVEX)', 33);
INSERT INTO public.empresa VALUES (41, true, 1, '2023-07-03 14:52:46.646802', NULL, NULL, false, 'CENTRO DE INSTRUÇÃO DE GUERRA ELETRÔNICA (CIGE)', 5);
INSERT INTO public.empresa VALUES (42, true, 1, '2023-07-03 14:52:46.647995', NULL, NULL, false, 'CENTRO DE MEDICINA ESPECIALIZADA, PESQUISA E ENSINO (CEMEPE)', 2);
INSERT INTO public.empresa VALUES (43, true, 1, '2023-07-03 14:52:46.649265', NULL, NULL, false, 'CENTRO FEDERAL DE EDUCAÇÃO TECNOLÓGICA CELSO SUCKOW DA FONSECA (CEFET/RJ)', 12);
INSERT INTO public.empresa VALUES (44, true, 1, '2023-07-03 14:52:46.650553', NULL, NULL, false, 'CENTRO FEDERAL DE EDUCAÇÃO TECNOLÓGICA DE MINAS GERAIS (CEFET/MG)', 2);
INSERT INTO public.empresa VALUES (45, true, 1, '2023-07-03 14:52:46.652009', NULL, NULL, false, 'CENTRO REGIONAL UNIVERSITÁRIO DE ESPÍRITO SANTO DO PINHAL (UNIPINHAL)', 34);
INSERT INTO public.empresa VALUES (46, true, 1, '2023-07-03 14:52:46.653314', NULL, NULL, false, 'CENTRO SUPERIOR DE ENSINO E PESQUISA DE MACHADO (CESEP)', 35);
INSERT INTO public.empresa VALUES (47, true, 1, '2023-07-03 14:52:46.65465', NULL, NULL, false, 'CENTRO SUPERIOR DE ESTUDOS JURÍDICOS CARLOS DRUMMOND DE ANDRADE (CSEJCDA)', 8);
INSERT INTO public.empresa VALUES (48, true, 1, '2023-07-03 14:52:46.655907', NULL, NULL, false, 'CENTRO TÉCNICO-EDUCACIONAL SUPERIOR DO OESTE PARANAENSE (CTESOP)', 36);
INSERT INTO public.empresa VALUES (49, true, 1, '2023-07-03 14:52:46.657059', NULL, NULL, false, 'CENTRO UNIVERSIÁRIO UNIFTC', 37);
INSERT INTO public.empresa VALUES (50, true, 1, '2023-07-03 14:52:46.658151', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ACADEMIA (UNIACADEMIA)', 38);
INSERT INTO public.empresa VALUES (51, true, 1, '2023-07-03 14:52:46.659288', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ADVENTISTA DE SÃO PAULO (UNASP)', 8);
INSERT INTO public.empresa VALUES (52, true, 1, '2023-07-03 14:52:46.660487', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AESO - BARROS MELO (UNIAESO)', 39);
INSERT INTO public.empresa VALUES (53, true, 1, '2023-07-03 14:52:46.661619', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AGES (UNIAGES)', 40);
INSERT INTO public.empresa VALUES (54, true, 1, '2023-07-03 14:52:46.662912', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ALFREDO NASSER (UNIFAN)', 41);
INSERT INTO public.empresa VALUES (55, true, 1, '2023-07-03 14:52:46.664222', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ÁLVARES PENTEADO (FECAP)', 8);
INSERT INTO public.empresa VALUES (56, true, 1, '2023-07-03 14:52:46.665584', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ALVES FARIA (UNIALFA)', 42);
INSERT INTO public.empresa VALUES (57, true, 1, '2023-07-03 14:52:46.666908', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AMPARENSE (UNIFIA)', 43);
INSERT INTO public.empresa VALUES (58, true, 1, '2023-07-03 14:52:46.66824', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGÜERA (UNIFIAN)', 44);
INSERT INTO public.empresa VALUES (59, true, 1, '2023-07-03 14:52:46.669533', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA DE FORTALEZA (UNIPITÁGORAS)', 45);
INSERT INTO public.empresa VALUES (60, true, 1, '2023-07-03 14:52:46.670823', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA DE MARABÁ', 46);
INSERT INTO public.empresa VALUES (61, true, 1, '2023-07-03 14:52:46.672107', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA DE SÃO PAULO', 8);
INSERT INTO public.empresa VALUES (62, true, 1, '2023-07-03 14:52:46.673388', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS AMPLI', 47);
INSERT INTO public.empresa VALUES (63, true, 1, '2023-07-03 14:52:46.674761', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS UNOPAR DE CAMPO GRANDE', 48);
INSERT INTO public.empresa VALUES (64, true, 1, '2023-07-03 14:52:46.676136', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS UNOPAR DE NITERÓI (UNIAN-RJ)', 49);
INSERT INTO public.empresa VALUES (65, true, 1, '2023-07-03 14:52:46.67753', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ANTÔNIO EUFRÁSIO DE TOLEDO DE PRESIDENTE PRUDENTE - TOLEDO PRUDENTE (TOLEDO PRUDENTE)', 50);
INSERT INTO public.empresa VALUES (66, true, 1, '2023-07-03 14:52:46.6791', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO APARÍCIO CARVALHO', 51);
INSERT INTO public.empresa VALUES (67, true, 1, '2023-07-03 14:52:46.680532', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ARAGUAIA (UNIARAGUAIA)', 42);
INSERT INTO public.empresa VALUES (68, true, 1, '2023-07-03 14:52:46.681899', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ARMANDO ALVARES PENTEADO (FA-FAAP)', 8);
INSERT INTO public.empresa VALUES (69, true, 1, '2023-07-03 14:52:46.683238', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ARNALDO HORÁCIO FERREIRA', 52);
INSERT INTO public.empresa VALUES (70, true, 1, '2023-07-03 14:52:46.684868', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ARTHUR SÁ EARP NETO (UNIFASE)', 53);
INSERT INTO public.empresa VALUES (71, true, 1, '2023-07-03 14:52:46.686435', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ASSIS GURGACZ (FAG)', 54);
INSERT INTO public.empresa VALUES (72, true, 1, '2023-07-03 14:52:46.687839', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ASSUNÇÃO (UNIFAI)', 8);
INSERT INTO public.empresa VALUES (73, true, 1, '2023-07-03 14:52:46.689176', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ATENAS (UNIATENAS)', 55);
INSERT INTO public.empresa VALUES (74, true, 1, '2023-07-03 14:52:46.690525', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ATENEU', 45);
INSERT INTO public.empresa VALUES (75, true, 1, '2023-07-03 14:52:46.691919', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AUGUSTO MOTTA (UNISUAM)', 12);
INSERT INTO public.empresa VALUES (76, true, 1, '2023-07-03 14:52:46.693665', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO AUTÔNOMO DO BRASIL (UNIBRASIL)', 56);
INSERT INTO public.empresa VALUES (77, true, 1, '2023-07-03 14:52:46.69542', NULL, NULL, false, 'CENTRO UNIVERSITARIO AVANTIS (UNIAVAN)', 57);
INSERT INTO public.empresa VALUES (78, true, 1, '2023-07-03 14:52:46.697116', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BARÃO DE MAUÁ (CBM)', 58);
INSERT INTO public.empresa VALUES (79, true, 1, '2023-07-03 14:52:46.698893', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BARRIGA VERDE (UNIBAVE)', 59);
INSERT INTO public.empresa VALUES (80, true, 1, '2023-07-03 14:52:46.700319', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BELAS ARTES DE SÃO PAULO (FEBASP)', 8);
INSERT INTO public.empresa VALUES (81, true, 1, '2023-07-03 14:52:46.701739', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BRASILEIRO (UNIBRA)', 60);
INSERT INTO public.empresa VALUES (82, true, 1, '2023-07-03 14:52:46.703087', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BRASÍLIA DO ESTADO DE GOIÁS (UNIBRASÍLIA)', 61);
INSERT INTO public.empresa VALUES (83, true, 1, '2023-07-03 14:52:46.704567', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO BRAZ CUBAS', 62);
INSERT INTO public.empresa VALUES (84, true, 1, '2023-07-03 14:52:46.70581', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CAMBURY (UNICAMBURY)', 42);
INSERT INTO public.empresa VALUES (85, true, 1, '2023-07-03 14:52:46.706955', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CAMPO LIMPO PAULISTA ( UNIFACCAMP)', 63);
INSERT INTO public.empresa VALUES (86, true, 1, '2023-07-03 14:52:46.708142', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CAMPO REAL', 64);
INSERT INTO public.empresa VALUES (87, true, 1, '2023-07-03 14:52:46.709271', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CAMPOS DE ANDRADE (UNIANDRADE)', 56);
INSERT INTO public.empresa VALUES (88, true, 1, '2023-07-03 14:52:46.710415', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CARLOS DRUMMOND DE ANDRADE (UNIDRUMMOND)', 8);
INSERT INTO public.empresa VALUES (89, true, 1, '2023-07-03 14:52:46.711616', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CASTELO BRANCO (UNICB)', 65);
INSERT INTO public.empresa VALUES (90, true, 1, '2023-07-03 14:52:46.712796', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATHEDRAL', 66);
INSERT INTO public.empresa VALUES (91, true, 1, '2023-07-03 14:52:46.714158', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATÓLICA DE QUIXADÁ (UNICATÓLICA)', 67);
INSERT INTO public.empresa VALUES (92, true, 1, '2023-07-03 14:52:46.715551', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO - CATÓLICA DE SANTA CATARINA EM JARAGUÁ DO SUL (CATÓLICA EM JARAGUÁ )', 31);
INSERT INTO public.empresa VALUES (93, true, 1, '2023-07-03 14:52:46.716931', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO - CATÓLICA DE SANTA CATARINA EM JOINVILLE (CATÓLICA EM JOINVILE)', 68);
INSERT INTO public.empresa VALUES (94, true, 1, '2023-07-03 14:52:46.718283', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATÓLICA DO LESTE DE MINAS GERAIS (UNILESTE)', 69);
INSERT INTO public.empresa VALUES (95, true, 1, '2023-07-03 14:52:46.719741', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATÓLICA DO TOCANTINS (UNICATÓLICA)', 23);
INSERT INTO public.empresa VALUES (96, true, 1, '2023-07-03 14:52:46.721257', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CATÓLICO SALESIANO AUXILIUM (UNISALESIANO)', 70);
INSERT INTO public.empresa VALUES (97, true, 1, '2023-07-03 14:52:46.722768', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CELSO LISBOA (UCL)', 12);
INSERT INTO public.empresa VALUES (98, true, 1, '2023-07-03 14:52:46.724236', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CENECISTA DE OSÓRIO (UNICNEC)', 71);
INSERT INTO public.empresa VALUES (99, true, 1, '2023-07-03 14:52:46.725719', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CENTRAL PAULISTA (UNICEP)', 72);
INSERT INTO public.empresa VALUES (100, true, 1, '2023-07-03 14:52:46.727221', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CESMAC (CESMAC)', 73);
INSERT INTO public.empresa VALUES (101, true, 1, '2023-07-03 14:52:46.728755', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CESUCA', 74);
INSERT INTO public.empresa VALUES (102, true, 1, '2023-07-03 14:52:46.730145', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CEUNI - FAMETRO (FAMETRO)', 75);
INSERT INTO public.empresa VALUES (103, true, 1, '2023-07-03 14:52:46.73146', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CHRISTUS (UNICHRISTUS)', 45);
INSERT INTO public.empresa VALUES (104, true, 1, '2023-07-03 14:52:46.732804', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CIDADE VERDE (UNICV)', 76);
INSERT INTO public.empresa VALUES (105, true, 1, '2023-07-03 14:52:46.734137', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CNEC DE BENTO GONÇALVES', 77);
INSERT INTO public.empresa VALUES (106, true, 1, '2023-07-03 14:52:46.735383', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO CURITIBA (UNICURITIBA)', 56);
INSERT INTO public.empresa VALUES (107, true, 1, '2023-07-03 14:52:46.736629', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA AMAZÔNIA (UNAMA)', 78);
INSERT INTO public.empresa VALUES (108, true, 1, '2023-07-03 14:52:46.737899', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA AMAZÔNIA (UNIESAMAZ)', 79);
INSERT INTO public.empresa VALUES (109, true, 1, '2023-07-03 14:52:46.739246', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL DE BARRETOS (UNIFEB)', 80);
INSERT INTO public.empresa VALUES (110, true, 1, '2023-07-03 14:52:46.740497', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL GUAXUPÉ (UNIFEG)', 81);
INSERT INTO public.empresa VALUES (111, true, 1, '2023-07-03 14:52:46.741766', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL INACIANA PE SABÓIA DE MEDEIROS (FEI)', 82);
INSERT INTO public.empresa VALUES (112, true, 1, '2023-07-03 14:52:46.74306', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO HERMINIO OMETTO (FHO)', 83);
INSERT INTO public.empresa VALUES (113, true, 1, '2023-07-03 14:52:46.744395', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA GRANDE DOURADOS (UNIGRAN)', 84);
INSERT INTO public.empresa VALUES (114, true, 1, '2023-07-03 14:52:46.745659', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA GRANDE FORTALEZA (UNIGRANDE)', 45);
INSERT INTO public.empresa VALUES (115, true, 1, '2023-07-03 14:52:46.74686', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA INDÚSTRIA (UNINDUS)', 85);
INSERT INTO public.empresa VALUES (116, true, 1, '2023-07-03 14:52:46.74808', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA REGIÃO DA CAMPANHA', 86);
INSERT INTO public.empresa VALUES (117, true, 1, '2023-07-03 14:52:46.749283', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DAS AMÉRICAS (CAM)', 8);
INSERT INTO public.empresa VALUES (118, true, 1, '2023-07-03 14:52:46.750485', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA SERRA GAÚCHA (FSG)', 87);
INSERT INTO public.empresa VALUES (119, true, 1, '2023-07-03 14:52:46.751745', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DAS FACULDADES ASSOCIADAS DE ENSINO - FAE (UNIFAE)', 88);
INSERT INTO public.empresa VALUES (120, true, 1, '2023-07-03 14:52:46.752927', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DAS FACULDADES INTEGRADAS DE OURINHOS (UNIFIO)', 89);
INSERT INTO public.empresa VALUES (121, true, 1, '2023-07-03 14:52:46.754112', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DAS FACULDADES METROPOLITANAS UNIDAS (FMU)', 8);
INSERT INTO public.empresa VALUES (122, true, 1, '2023-07-03 14:52:46.755249', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DA VITÓRIA DE SANTO ANTÃO (UNIVISA)', 90);
INSERT INTO public.empresa VALUES (123, true, 1, '2023-07-03 14:52:46.756545', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ADAMANTINA (FAI)', 91);
INSERT INTO public.empresa VALUES (124, true, 1, '2023-07-03 14:52:46.757704', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ARARAS - (UNAR)', 83);
INSERT INTO public.empresa VALUES (125, true, 1, '2023-07-03 14:52:46.758847', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BARRA MANSA (UBM)', 92);
INSERT INTO public.empresa VALUES (126, true, 1, '2023-07-03 14:52:46.760023', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BAURU', 93);
INSERT INTO public.empresa VALUES (127, true, 1, '2023-07-03 14:52:46.761184', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BELO HORIZONTE (UNI-BH)', 2);
INSERT INTO public.empresa VALUES (128, true, 1, '2023-07-03 14:52:46.762432', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BRASÍLIA (UNICEUB)', 5);
INSERT INTO public.empresa VALUES (129, true, 1, '2023-07-03 14:52:46.763936', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE BRUSQUE (UNIFEBE)', 94);
INSERT INTO public.empresa VALUES (130, true, 1, '2023-07-03 14:52:46.765166', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE CARATINGA (UNEC)', 95);
INSERT INTO public.empresa VALUES (131, true, 1, '2023-07-03 14:52:46.766383', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE CIÊNCIAS E EMPREENDEDORISMO (UNIFACEMP)', 96);
INSERT INTO public.empresa VALUES (132, true, 1, '2023-07-03 14:52:46.767617', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE CIÊNCIAS E TECNOLOGIA DO MARANHÃO (UNIFACEMA)', 97);
INSERT INTO public.empresa VALUES (133, true, 1, '2023-07-03 14:52:46.76879', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE DESENVOLVIMENTO DO CENTRO OESTE (UNIDESC)', 98);
INSERT INTO public.empresa VALUES (134, true, 1, '2023-07-03 14:52:46.769953', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ENSINO, CIÊNCIA E TECNOLOGIA DO PARANÁ (UNIENSINO)', 56);
INSERT INTO public.empresa VALUES (135, true, 1, '2023-07-03 14:52:46.77108', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ENSINO SUPERIOR DO AMAZONAS (CIESA)', 75);
INSERT INTO public.empresa VALUES (632, true, 1, '2023-07-03 14:52:47.406028', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PALMAS', 23);
INSERT INTO public.empresa VALUES (136, true, 1, '2023-07-03 14:52:46.772217', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE EXCELÊNCIA (UNEX)', 99);
INSERT INTO public.empresa VALUES (137, true, 1, '2023-07-03 14:52:46.773362', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE EXCELÊNCIA ENIAC (ENIAC)', 100);
INSERT INTO public.empresa VALUES (138, true, 1, '2023-07-03 14:52:46.774481', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE FORMIGA (UNIFORMG)', 101);
INSERT INTO public.empresa VALUES (139, true, 1, '2023-07-03 14:52:46.775622', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE GOIÂNIA (UNICEUG)', 42);
INSERT INTO public.empresa VALUES (140, true, 1, '2023-07-03 14:52:46.776868', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE GOIÁS (UNIGOIÁS)', 42);
INSERT INTO public.empresa VALUES (141, true, 1, '2023-07-03 14:52:46.778037', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE GOIATUBA (UNICERRADO)', 102);
INSERT INTO public.empresa VALUES (142, true, 1, '2023-07-03 14:52:46.779099', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ITAJUBÁ (FEPI)', 103);
INSERT INTO public.empresa VALUES (143, true, 1, '2023-07-03 14:52:46.780257', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE ITAPIRA UNIESI (UNIESI)', 104);
INSERT INTO public.empresa VALUES (144, true, 1, '2023-07-03 14:52:46.781456', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE JAGUARIÚNA (UNIFAJ)', 105);
INSERT INTO public.empresa VALUES (145, true, 1, '2023-07-03 14:52:46.782681', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE JALES (UNIJALES)', 106);
INSERT INTO public.empresa VALUES (146, true, 1, '2023-07-03 14:52:46.783919', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE JOÃO PESSOA (UNIPÊ)', 107);
INSERT INTO public.empresa VALUES (147, true, 1, '2023-07-03 14:52:46.785392', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE LAVRAS (UNILAVRAS)', 108);
INSERT INTO public.empresa VALUES (148, true, 1, '2023-07-03 14:52:46.786902', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE LINS (UNILINS)', 70);
INSERT INTO public.empresa VALUES (149, true, 1, '2023-07-03 14:52:46.788451', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE MINEIROS (UNIFIMES)', 109);
INSERT INTO public.empresa VALUES (150, true, 1, '2023-07-03 14:52:46.789943', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE PATO BRANCO (UNIDEP)', 110);
INSERT INTO public.empresa VALUES (151, true, 1, '2023-07-03 14:52:46.791468', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE PATOS (UNIFIP)', 111);
INSERT INTO public.empresa VALUES (152, true, 1, '2023-07-03 14:52:46.792599', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE PATOS DE MINAS (UNIPAM)', 112);
INSERT INTO public.empresa VALUES (153, true, 1, '2023-07-03 14:52:46.793825', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE PAULÍNIA (UNIFACP)', 113);
INSERT INTO public.empresa VALUES (154, true, 1, '2023-07-03 14:52:46.794968', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE RIO PRETO (UNIRP)', 114);
INSERT INTO public.empresa VALUES (155, true, 1, '2023-07-03 14:52:46.796112', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE RONDÔNIA (UNESC)', 115);
INSERT INTO public.empresa VALUES (156, true, 1, '2023-07-03 14:52:46.797244', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE SALVADOR (UNICEUSA)', 116);
INSERT INTO public.empresa VALUES (157, true, 1, '2023-07-03 14:52:46.798475', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE SANTA FÉ DO SUL (UNIFUNEC)', 117);
INSERT INTO public.empresa VALUES (158, true, 1, '2023-07-03 14:52:46.799747', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE SETE LAGOAS (UNIFEMM)', 24);
INSERT INTO public.empresa VALUES (159, true, 1, '2023-07-03 14:52:46.801008', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE TALENTOS HUMANOS (UNIFACTHUS)', 118);
INSERT INTO public.empresa VALUES (160, true, 1, '2023-07-03 14:52:46.802261', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE TECNOLOGIA CARLOS DRUMMOND DE ANDRADE', 8);
INSERT INTO public.empresa VALUES (161, true, 1, '2023-07-03 14:52:46.803493', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE TECNOLOGIA DE CURITIBA (UNIFATEC)', 56);
INSERT INTO public.empresa VALUES (162, true, 1, '2023-07-03 14:52:46.804727', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE TECNOLOGIA E NEGÓCIOS CARLOS DRUMMOND DE ANDRADE (UNITEN CDA)', 8);
INSERT INTO public.empresa VALUES (163, true, 1, '2023-07-03 14:52:46.805925', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE UNIÃO DA VITÓRIA (UNIUV)', 119);
INSERT INTO public.empresa VALUES (164, true, 1, '2023-07-03 14:52:46.80715', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VALENÇA (UNIFAA)', 120);
INSERT INTO public.empresa VALUES (165, true, 1, '2023-07-03 14:52:46.80833', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VÁRZEA GRANDE (UNIVAG)', 121);
INSERT INTO public.empresa VALUES (166, true, 1, '2023-07-03 14:52:46.809508', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VIÇOSA (UNIVIÇOSA)', 122);
INSERT INTO public.empresa VALUES (167, true, 1, '2023-07-03 14:52:46.810649', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VOLTA REDONDA (UNIFOA)', 123);
INSERT INTO public.empresa VALUES (168, true, 1, '2023-07-03 14:52:46.81178', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DE VOTUPORANGA (UNIFEV)', 10);
INSERT INTO public.empresa VALUES (169, true, 1, '2023-07-03 14:52:46.812943', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DINÂMICA DAS CATARATAS (UDC)', 124);
INSERT INTO public.empresa VALUES (170, true, 1, '2023-07-03 14:52:46.814091', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO CERRADO-PATROCÍNIO (UNICERP)', 125);
INSERT INTO public.empresa VALUES (171, true, 1, '2023-07-03 14:52:46.815261', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOCTUM DE TEÓFILO OTONI (UNIDOCTUM)', 7);
INSERT INTO public.empresa VALUES (172, true, 1, '2023-07-03 14:52:46.816501', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO DISTRITO FEDERAL (UDF)', 5);
INSERT INTO public.empresa VALUES (173, true, 1, '2023-07-03 14:52:46.817637', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO ESPÍRITO SANTO (UNESC)', 65);
INSERT INTO public.empresa VALUES (174, true, 1, '2023-07-03 14:52:46.818885', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO ESTADO DO PARÁ (CESUPA)', 79);
INSERT INTO public.empresa VALUES (175, true, 1, '2023-07-03 14:52:46.820119', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO INSTITUTO DE EDUCAÇÃO SUPERIOR DE BRASÍLIA - IESB (IESB)', 5);
INSERT INTO public.empresa VALUES (176, true, 1, '2023-07-03 14:52:46.821342', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO INSTITUTO MAUÁ DE TECNOLOGIA (CEUN-IMT)', 126);
INSERT INTO public.empresa VALUES (177, true, 1, '2023-07-03 14:52:46.822516', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOM BOSCO DO RIO DE JANEIRO (UNIDOMBOSCO-RJ)', 4);
INSERT INTO public.empresa VALUES (178, true, 1, '2023-07-03 14:52:46.82369', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOM PEDRO II (UNIDOMPEDRO)', 116);
INSERT INTO public.empresa VALUES (179, true, 1, '2023-07-03 14:52:46.824839', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DON DOMÊNICO (UNIDON)', 127);
INSERT INTO public.empresa VALUES (180, true, 1, '2023-07-03 14:52:46.825982', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO NORTE (UNINORTE)', 75);
INSERT INTO public.empresa VALUES (181, true, 1, '2023-07-03 14:52:46.827162', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO NORTE DE MINAS (UNINORTE MINAS)', 128);
INSERT INTO public.empresa VALUES (182, true, 1, '2023-07-03 14:52:46.828331', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO NORTE DE SÃO PAULO (UNORTE)', 114);
INSERT INTO public.empresa VALUES (183, true, 1, '2023-07-03 14:52:46.829537', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO PARANÁ (UNIPA)', 56);
INSERT INTO public.empresa VALUES (184, true, 1, '2023-07-03 14:52:46.830802', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO PIAUÍ (UNIFAPI)', 27);
INSERT INTO public.empresa VALUES (185, true, 1, '2023-07-03 14:52:46.831989', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO PLANALTO CENTRAL APPARECIDO DOS SANTOS (UNICEPLAC)', 5);
INSERT INTO public.empresa VALUES (186, true, 1, '2023-07-03 14:52:46.833208', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO PLANALTO DE ARAXÁ (UNIARAXÁ)', 129);
INSERT INTO public.empresa VALUES (187, true, 1, '2023-07-03 14:52:46.834372', NULL, NULL, false, 'CENTRO UNIVERSITARIO DO RECIFE (UNIPESU)', 60);
INSERT INTO public.empresa VALUES (188, true, 1, '2023-07-03 14:52:46.835535', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO RIO DE JANEIRO (UNIRJ)', 12);
INSERT INTO public.empresa VALUES (189, true, 1, '2023-07-03 14:52:46.836692', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO RIO GRANDE DO NORTE (UNI-RN)', 130);
INSERT INTO public.empresa VALUES (190, true, 1, '2023-07-03 14:52:46.837856', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO RIO SÃO FRANCISCO UNIRIOS (UNIRIOS)', 131);
INSERT INTO public.empresa VALUES (191, true, 1, '2023-07-03 14:52:46.838999', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOS GUARARAPES (UNIFG)', 132);
INSERT INTO public.empresa VALUES (192, true, 1, '2023-07-03 14:52:46.840192', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO SUDESTE MINEIRO (UNICSUM)', 38);
INSERT INTO public.empresa VALUES (193, true, 1, '2023-07-03 14:52:46.841369', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO SUL DE MINAS (UNIS-MG)', 133);
INSERT INTO public.empresa VALUES (194, true, 1, '2023-07-03 14:52:46.842524', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO TRIÂNGULO (UNITRI)', 134);
INSERT INTO public.empresa VALUES (195, true, 1, '2023-07-03 14:52:46.84399', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DOUTOR LEÃO SAMPAIO (UNILEÃO)', 135);
INSERT INTO public.empresa VALUES (196, true, 1, '2023-07-03 14:52:46.845149', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO VALE DO ARAGUAIA (UNIVAR)', 66);
INSERT INTO public.empresa VALUES (197, true, 1, '2023-07-03 14:52:46.846393', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO VALE DO JAGUARIBE (UNIJAGUARIBE)', 136);
INSERT INTO public.empresa VALUES (198, true, 1, '2023-07-03 14:52:46.847661', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO DO VALE DO RIBEIRA (UNIVR)', 137);
INSERT INTO public.empresa VALUES (199, true, 1, '2023-07-03 14:52:46.848963', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESPÍRITO-SANTENSE/FAESA', 25);
INSERT INTO public.empresa VALUES (200, true, 1, '2023-07-03 14:52:46.850399', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DA AMAZÔNIA (ESTÁCIO AMAZÔNIA)', 138);
INSERT INTO public.empresa VALUES (201, true, 1, '2023-07-03 14:52:46.85176', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DA BAHIA (ESTÁCIO BAHIA)', 116);
INSERT INTO public.empresa VALUES (202, true, 1, '2023-07-03 14:52:46.85315', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE BELO HORIZONTE - ESTÁCIO BH (ESTÁCIO BH)', 2);
INSERT INTO public.empresa VALUES (274, true, 1, '2023-07-03 14:52:46.952216', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LUSÍADA (UNILUS)', 171);
INSERT INTO public.empresa VALUES (203, true, 1, '2023-07-03 14:52:46.854622', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE BRASÍLIA - ESTÁCIO BRASÍLIA (ESTÁCIO BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (204, true, 1, '2023-07-03 14:52:46.856031', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE GOIÁS (ESTÁCIO GOIÁS)', 42);
INSERT INTO public.empresa VALUES (205, true, 1, '2023-07-03 14:52:46.857337', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE JI-PARANÁ (ESTÁCIO UNIJIPA)', 139);
INSERT INTO public.empresa VALUES (206, true, 1, '2023-07-03 14:52:46.858575', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE RIBEIRÃO PRETO (ESTÁCIO RIBEIRÃO PRE)', 58);
INSERT INTO public.empresa VALUES (207, true, 1, '2023-07-03 14:52:46.859881', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE SANTA CATARINA - ESTÁCIO SANTA CATARINA', 140);
INSERT INTO public.empresa VALUES (208, true, 1, '2023-07-03 14:52:46.861261', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE SÃO LUÍS', 141);
INSERT INTO public.empresa VALUES (209, true, 1, '2023-07-03 14:52:46.862602', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE SÃO PAULO (ESTÁCIO SÃO PAULO)', 8);
INSERT INTO public.empresa VALUES (210, true, 1, '2023-07-03 14:52:46.863983', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DE SERGIPE', 142);
INSERT INTO public.empresa VALUES (211, true, 1, '2023-07-03 14:52:46.865339', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DO CEARÁ (ESTÁCIO CEARÁ)', 45);
INSERT INTO public.empresa VALUES (212, true, 1, '2023-07-03 14:52:46.866721', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO DO RECIFE', 60);
INSERT INTO public.empresa VALUES (213, true, 1, '2023-07-03 14:52:46.868082', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO JUIZ DE FORA - ESTÁCIO JUIZ DE FORA', 38);
INSERT INTO public.empresa VALUES (214, true, 1, '2023-07-03 14:52:46.869422', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ESTÁCIO META DE RIO BRANCO ESTÁCIO (UNIMETA)', 143);
INSERT INTO public.empresa VALUES (215, true, 1, '2023-07-03 14:52:46.870774', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ETEP', 144);
INSERT INTO public.empresa VALUES (216, true, 1, '2023-07-03 14:52:46.872267', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO EURÍPEDES DE MARÍLIA (UNIVEM)', 145);
INSERT INTO public.empresa VALUES (217, true, 1, '2023-07-03 14:52:46.873661', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO EURO-AMERICANO (UNIEURO)', 5);
INSERT INTO public.empresa VALUES (218, true, 1, '2023-07-03 14:52:46.875078', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACENS (UNIFACENS)', 146);
INSERT INTO public.empresa VALUES (219, true, 1, '2023-07-03 14:52:46.876521', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACEX (UNIFACEX)', 130);
INSERT INTO public.empresa VALUES (220, true, 1, '2023-07-03 14:52:46.878289', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACID WYDEN (UNIFACID WYDEN)', 27);
INSERT INTO public.empresa VALUES (221, true, 1, '2023-07-03 14:52:46.880066', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACISA (UNIFACISA)', 147);
INSERT INTO public.empresa VALUES (222, true, 1, '2023-07-03 14:52:46.881818', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACOL (UNIFACOL)', 90);
INSERT INTO public.empresa VALUES (223, true, 1, '2023-07-03 14:52:46.883618', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACUNICAMPS (FACUNICAMPS)', 42);
INSERT INTO public.empresa VALUES (224, true, 1, '2023-07-03 14:52:46.88503', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FACVEST (UNIFACVEST)', 148);
INSERT INTO public.empresa VALUES (225, true, 1, '2023-07-03 14:52:46.886431', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FADERGS (FADERGS)', 149);
INSERT INTO public.empresa VALUES (226, true, 1, '2023-07-03 14:52:46.887821', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAEL (UNIFAEL)', 150);
INSERT INTO public.empresa VALUES (227, true, 1, '2023-07-03 14:52:46.889128', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAEMA (UNIFAEMA)', 151);
INSERT INTO public.empresa VALUES (228, true, 1, '2023-07-03 14:52:46.89051', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAESA', 25);
INSERT INTO public.empresa VALUES (229, true, 1, '2023-07-03 14:52:46.891934', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAI', 152);
INSERT INTO public.empresa VALUES (230, true, 1, '2023-07-03 14:52:46.893248', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAMEC (UNIFAMEC)', 153);
INSERT INTO public.empresa VALUES (231, true, 1, '2023-07-03 14:52:46.894614', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAMETRO ( UNIFAMETRO)', 45);
INSERT INTO public.empresa VALUES (232, true, 1, '2023-07-03 14:52:46.895981', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAMINAS (UNIFAMINAS)', 154);
INSERT INTO public.empresa VALUES (233, true, 1, '2023-07-03 14:52:46.897276', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FANOR WYDEN (UNIFANOR WYDEN)', 45);
INSERT INTO public.empresa VALUES (234, true, 1, '2023-07-03 14:52:46.898607', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FARIAS BRITO', 45);
INSERT INTO public.empresa VALUES (235, true, 1, '2023-07-03 14:52:46.899983', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FASIPE', 155);
INSERT INTO public.empresa VALUES (236, true, 1, '2023-07-03 14:52:46.901288', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAVENI (UNIFAVENI)', 100);
INSERT INTO public.empresa VALUES (237, true, 1, '2023-07-03 14:52:46.902546', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FAVIP WYDEN (UNIFAVIP WYDEN)', 156);
INSERT INTO public.empresa VALUES (238, true, 1, '2023-07-03 14:52:46.903799', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FBV WYDEN (UNIFBV WYDEN)', 60);
INSERT INTO public.empresa VALUES (239, true, 1, '2023-07-03 14:52:46.905056', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FG (UNIFG)', 157);
INSERT INTO public.empresa VALUES (240, true, 1, '2023-07-03 14:52:46.906291', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FIBRA (UNIFIBRA)', 79);
INSERT INTO public.empresa VALUES (241, true, 1, '2023-07-03 14:52:46.907553', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FIEO (UNIFIEO)', 158);
INSERT INTO public.empresa VALUES (242, true, 1, '2023-07-03 14:52:46.908764', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FILADÉLFIA (UNIFIL)', 159);
INSERT INTO public.empresa VALUES (243, true, 1, '2023-07-03 14:52:46.910107', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FIP-MOC (UNIFIPMOC)', 128);
INSERT INTO public.empresa VALUES (244, true, 1, '2023-07-03 14:52:46.911449', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FLUMINENSE (UNIFLU)', 160);
INSERT INTO public.empresa VALUES (245, true, 1, '2023-07-03 14:52:46.912665', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FMABC (FMABC)', 47);
INSERT INTO public.empresa VALUES (246, true, 1, '2023-07-03 14:52:46.913811', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNCESI (UNIFUNCESI)', 161);
INSERT INTO public.empresa VALUES (247, true, 1, '2023-07-03 14:52:46.915226', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNDAÇÃO DE ENSINO OCTÁVIO BASTOS - FEOB (UNIFEOB)', 88);
INSERT INTO public.empresa VALUES (248, true, 1, '2023-07-03 14:52:46.916536', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNDAÇÃO SANTO ANDRÉ (CUFSA)', 47);
INSERT INTO public.empresa VALUES (249, true, 1, '2023-07-03 14:52:46.917973', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNORTE (UNIFUNORTE)', 128);
INSERT INTO public.empresa VALUES (250, true, 1, '2023-07-03 14:52:46.919392', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO FUNVIC (UNIFUNVIC)', 162);
INSERT INTO public.empresa VALUES (251, true, 1, '2023-07-03 14:52:46.921282', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GAMA E SOUZA', 12);
INSERT INTO public.empresa VALUES (252, true, 1, '2023-07-03 14:52:46.922713', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GERALDO DI BIASE (UGB)', 123);
INSERT INTO public.empresa VALUES (253, true, 1, '2023-07-03 14:52:46.924103', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GOVERNADOR OZANAM COELHO (UNIFAGOC)', 163);
INSERT INTO public.empresa VALUES (254, true, 1, '2023-07-03 14:52:46.925416', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GOYAZES (UNIGOYAZES)', 164);
INSERT INTO public.empresa VALUES (255, true, 1, '2023-07-03 14:52:46.926795', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO GUAIRACÁ (UNIGUAIRACÁ)', 64);
INSERT INTO public.empresa VALUES (256, true, 1, '2023-07-03 14:52:46.928086', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO IBMEC (IBMEC)', 12);
INSERT INTO public.empresa VALUES (257, true, 1, '2023-07-03 14:52:46.929348', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO IBMR', 12);
INSERT INTO public.empresa VALUES (258, true, 1, '2023-07-03 14:52:46.930632', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ICESP (UNICESP)', 5);
INSERT INTO public.empresa VALUES (259, true, 1, '2023-07-03 14:52:46.931973', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO IDEAU (UNIDEAU)', 165);
INSERT INTO public.empresa VALUES (260, true, 1, '2023-07-03 14:52:46.933342', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO IMEPAC - ARAGUARI', 166);
INSERT INTO public.empresa VALUES (261, true, 1, '2023-07-03 14:52:46.93488', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INGÁ (UNINGÁ)', 76);
INSERT INTO public.empresa VALUES (262, true, 1, '2023-07-03 14:52:46.936239', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INTA (UNINTA)', 167);
INSERT INTO public.empresa VALUES (263, true, 1, '2023-07-03 14:52:46.937591', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INTEGRADO DE CAMPO MOURÃO', 168);
INSERT INTO public.empresa VALUES (264, true, 1, '2023-07-03 14:52:46.938936', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INTERNACIONAL (UNINTER)', 56);
INSERT INTO public.empresa VALUES (265, true, 1, '2023-07-03 14:52:46.940282', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO INTERNACIONAL SIGNORELLI (UNISIGNORELLI)', 12);
INSERT INTO public.empresa VALUES (266, true, 1, '2023-07-03 14:52:46.94159', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ÍTALO-BRASILEIRO (UNIÍTALO)', 8);
INSERT INTO public.empresa VALUES (267, true, 1, '2023-07-03 14:52:46.942866', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO ITOP (UNITOP)', 23);
INSERT INTO public.empresa VALUES (268, true, 1, '2023-07-03 14:52:46.94423', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO JOAQUIM NABUCO DE RECIFE (UNINABUCO RECIFE)', 60);
INSERT INTO public.empresa VALUES (269, true, 1, '2023-07-03 14:52:46.945579', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO JORGE AMADO (UNIJORGE)', 116);
INSERT INTO public.empresa VALUES (270, true, 1, '2023-07-03 14:52:46.946964', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LA SALLE (UNILASALLE - LUCAS)', 169);
INSERT INTO public.empresa VALUES (271, true, 1, '2023-07-03 14:52:46.948291', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LA SALLE DO RIO DE JANEIRO (UNILASALLE/RJ)', 49);
INSERT INTO public.empresa VALUES (272, true, 1, '2023-07-03 14:52:46.949622', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LEONARDO DA VINCI (UNIASSELVI)', 170);
INSERT INTO public.empresa VALUES (273, true, 1, '2023-07-03 14:52:46.950927', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LS (UNILS)', 5);
INSERT INTO public.empresa VALUES (275, true, 1, '2023-07-03 14:52:46.953499', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LUTERANO DE MANAUS (CEULM/ULBRA)', 75);
INSERT INTO public.empresa VALUES (276, true, 1, '2023-07-03 14:52:46.954813', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LUTERANO DE PALMAS (CEULP)', 23);
INSERT INTO public.empresa VALUES (277, true, 1, '2023-07-03 14:52:46.956116', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO LUTERANO DE SANTARÉM (CEULS)', 78);
INSERT INTO public.empresa VALUES (278, true, 1, '2023-07-03 14:52:46.957442', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MARIA MILZA (UNIMAM)', 172);
INSERT INTO public.empresa VALUES (279, true, 1, '2023-07-03 14:52:46.958722', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MÁRIO PALMÉRIO (UNIFUCAMP)', 173);
INSERT INTO public.empresa VALUES (280, true, 1, '2023-07-03 14:52:46.960006', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MATER DEI', 110);
INSERT INTO public.empresa VALUES (281, true, 1, '2023-07-03 14:52:46.961279', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAUÁ DE BRASÍLIA (UNIMAUÁ)', 5);
INSERT INTO public.empresa VALUES (282, true, 1, '2023-07-03 14:52:46.96254', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU (UNINASSAU)', 60);
INSERT INTO public.empresa VALUES (283, true, 1, '2023-07-03 14:52:46.963887', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU ALIANÇA (UNINASSAU ALIANÇA)', 27);
INSERT INTO public.empresa VALUES (284, true, 1, '2023-07-03 14:52:46.965216', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURICIO DE NASSAU DE ARACAJU', 142);
INSERT INTO public.empresa VALUES (285, true, 1, '2023-07-03 14:52:46.966533', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE BARREIRAS (UNINASSAU)', 174);
INSERT INTO public.empresa VALUES (286, true, 1, '2023-07-03 14:52:46.967914', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE BELÉM', 79);
INSERT INTO public.empresa VALUES (287, true, 1, '2023-07-03 14:52:46.969299', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CACOAL (UNINASSAU)', 115);
INSERT INTO public.empresa VALUES (288, true, 1, '2023-07-03 14:52:46.970684', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CAMPINA GRANDE (UNINASSAU CPV)', 147);
INSERT INTO public.empresa VALUES (289, true, 1, '2023-07-03 14:52:46.972137', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CARUARU (UNINASSAU CARUARU)', 156);
INSERT INTO public.empresa VALUES (290, true, 1, '2023-07-03 14:52:46.973513', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE FORTALEZA (UNINASSAU FORTALEZA)', 45);
INSERT INTO public.empresa VALUES (291, true, 1, '2023-07-03 14:52:46.974867', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE JOÃO PESSOA', 107);
INSERT INTO public.empresa VALUES (292, true, 1, '2023-07-03 14:52:46.976503', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE JUAZEIRO DO NORTE (UNINASSAU)', 135);
INSERT INTO public.empresa VALUES (293, true, 1, '2023-07-03 14:52:46.978133', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE MACEIÓ (UNINASSAUMACEI?)', 73);
INSERT INTO public.empresa VALUES (294, true, 1, '2023-07-03 14:52:46.979834', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE NATAL (UNINASSAU)', 130);
INSERT INTO public.empresa VALUES (295, true, 1, '2023-07-03 14:52:46.981549', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE SALVADOR (UNINASSAU SALVADOR)', 116);
INSERT INTO public.empresa VALUES (296, true, 1, '2023-07-03 14:52:46.982866', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE SÃO LUÍS (UNINASSAU)', 141);
INSERT INTO public.empresa VALUES (297, true, 1, '2023-07-03 14:52:46.984133', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE TERESINA', 27);
INSERT INTO public.empresa VALUES (298, true, 1, '2023-07-03 14:52:46.985371', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DO RIO DE JANEIRO (UNINASSAU)', 12);
INSERT INTO public.empresa VALUES (299, true, 1, '2023-07-03 14:52:46.986627', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU PAULISTA (UNINASSAU PAULISTA)', 175);
INSERT INTO public.empresa VALUES (300, true, 1, '2023-07-03 14:52:46.987919', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAURÍCIO DE UNINASSAU DE PARNAÍBA (UNINASSAU PARNAÍBA)', 176);
INSERT INTO public.empresa VALUES (301, true, 1, '2023-07-03 14:52:46.989179', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MAX PLANCK (UNIMAX)', 11);
INSERT INTO public.empresa VALUES (302, true, 1, '2023-07-03 14:52:46.990438', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METODISTA (IPA)', 149);
INSERT INTO public.empresa VALUES (303, true, 1, '2023-07-03 14:52:46.991607', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METODISTA IZABELA HENDRIX (CEUNIH)', 2);
INSERT INTO public.empresa VALUES (304, true, 1, '2023-07-03 14:52:46.992752', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METROCAMP WYDEN (UNIMETROCAMP WYDEN)', 177);
INSERT INTO public.empresa VALUES (305, true, 1, '2023-07-03 14:52:46.99391', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METROPOLITANO DA AMAZÔNIA (UNIFAMAZ)', 79);
INSERT INTO public.empresa VALUES (306, true, 1, '2023-07-03 14:52:46.995099', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METROPOLITANO DE MARINGÁ (UNIFAMMA)', 76);
INSERT INTO public.empresa VALUES (307, true, 1, '2023-07-03 14:52:46.99627', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO METROPOLITANO DE SÃO PAULO (UNIMESP)', 100);
INSERT INTO public.empresa VALUES (308, true, 1, '2023-07-03 14:52:46.997483', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MÓDULO (MÓDULO)', 178);
INSERT INTO public.empresa VALUES (309, true, 1, '2023-07-03 14:52:46.998689', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MOURA LACERDA (CUML)', 58);
INSERT INTO public.empresa VALUES (310, true, 1, '2023-07-03 14:52:46.99989', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MULTIVIX VITÓRIA', 25);
INSERT INTO public.empresa VALUES (311, true, 1, '2023-07-03 14:52:47.001186', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MUNICIPAL DE FRANCA (UNI-FACEF)', 179);
INSERT INTO public.empresa VALUES (312, true, 1, '2023-07-03 14:52:47.002534', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO MUNICIPAL DE SÃO JOSÉ (USJ)', 140);
INSERT INTO public.empresa VALUES (313, true, 1, '2023-07-03 14:52:47.003912', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NATALENSE (UNICEUNA)', 130);
INSERT INTO public.empresa VALUES (314, true, 1, '2023-07-03 14:52:47.005208', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NEWTON PAIVA (NEWTON PAIVA)', 2);
INSERT INTO public.empresa VALUES (315, true, 1, '2023-07-03 14:52:47.006484', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NOBRE DE FEIRA DE SANTANA', 99);
INSERT INTO public.empresa VALUES (316, true, 1, '2023-07-03 14:52:47.007721', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NOSSA SENHORA APARECIDA (UNIFANAP)', 41);
INSERT INTO public.empresa VALUES (317, true, 1, '2023-07-03 14:52:47.008942', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO NOSSA SENHORA DO PATROCÍNIO (CEUNSP)', 180);
INSERT INTO public.empresa VALUES (318, true, 1, '2023-07-03 14:52:47.010237', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO OPET (UNIOPET)', 56);
INSERT INTO public.empresa VALUES (319, true, 1, '2023-07-03 14:52:47.011532', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PADRE ALBINO', 181);
INSERT INTO public.empresa VALUES (320, true, 1, '2023-07-03 14:52:47.012791', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PADRE ANCHIETA (UNIANCHIETA)', 182);
INSERT INTO public.empresa VALUES (321, true, 1, '2023-07-03 14:52:47.014023', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PARAÍSO', 135);
INSERT INTO public.empresa VALUES (322, true, 1, '2023-07-03 14:52:47.015304', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PARA O DESENVOLVIMENTO DO ALTO VALE DO ITAJAÍ (UNIDAVI)', 183);
INSERT INTO public.empresa VALUES (323, true, 1, '2023-07-03 14:52:47.016549', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PAULISTANA (UNIPAULISTANA)', 8);
INSERT INTO public.empresa VALUES (324, true, 1, '2023-07-03 14:52:47.017751', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PIAGET (UNIPIAGET)', 184);
INSERT INTO public.empresa VALUES (325, true, 1, '2023-07-03 14:52:47.018957', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PLANALTO DO DISTRITO FEDERAL - UNIPLAN (UNIPLAN)', 5);
INSERT INTO public.empresa VALUES (326, true, 1, '2023-07-03 14:52:47.020321', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PRESIDENTE ANTÔNIO CARLOS (UNIPAC)', 32);
INSERT INTO public.empresa VALUES (327, true, 1, '2023-07-03 14:52:47.021713', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PRESIDENTE TANCREDO DE ALMEIDA NEVES (UNIPTAN)', 185);
INSERT INTO public.empresa VALUES (328, true, 1, '2023-07-03 14:52:47.023096', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO PROCESSUS (UNIPROCESSUS)', 5);
INSERT INTO public.empresa VALUES (329, true, 1, '2023-07-03 14:52:47.024465', NULL, NULL, false, 'CENTRO UNIVERSITARIO PROJEÇÃO (UNIPROJEÇÃO)', 5);
INSERT INTO public.empresa VALUES (330, true, 1, '2023-07-03 14:52:47.025801', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO REDENTOR (FACREDENTOR)', 186);
INSERT INTO public.empresa VALUES (331, true, 1, '2023-07-03 14:52:47.027283', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO RITTER DOS REIS (UNIRITTER)', 149);
INSERT INTO public.empresa VALUES (332, true, 1, '2023-07-03 14:52:47.028599', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO RUY BARBOSA WYDEN (UNIRUY WYDEN)', 116);
INSERT INTO public.empresa VALUES (333, true, 1, '2023-07-03 14:52:47.029917', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SAGRADO CORAÇÃO (UNISAGRADO)', 93);
INSERT INTO public.empresa VALUES (334, true, 1, '2023-07-03 14:52:47.031277', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SALESIANO (UNISALES)', 25);
INSERT INTO public.empresa VALUES (335, true, 1, '2023-07-03 14:52:47.032632', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SALESIANO DE SÃO PAULO (UNISAL)', 187);
INSERT INTO public.empresa VALUES (336, true, 1, '2023-07-03 14:52:47.034036', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA AMÉLIA (SECAL)', 188);
INSERT INTO public.empresa VALUES (337, true, 1, '2023-07-03 14:52:47.035393', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA CECÍLIA (UNICEA)', 162);
INSERT INTO public.empresa VALUES (338, true, 1, '2023-07-03 14:52:47.03671', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA CRUZ DE CURITIBA (UNI SANTA CRUZ)', 56);
INSERT INTO public.empresa VALUES (339, true, 1, '2023-07-03 14:52:47.037999', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA MARIA (UNIFSM)', 189);
INSERT INTO public.empresa VALUES (340, true, 1, '2023-07-03 14:52:47.039307', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA MARIA DA GLÓRIA (UNISMG)', 76);
INSERT INTO public.empresa VALUES (341, true, 1, '2023-07-03 14:52:47.040736', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANT''ANNA (UNISANT''ANNA)', 8);
INSERT INTO public.empresa VALUES (342, true, 1, '2023-07-03 14:52:47.042023', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTA RITA (UNIFASAR)', 18);
INSERT INTO public.empresa VALUES (343, true, 1, '2023-07-03 14:52:47.043286', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SANTO AGOSTINHO (UNIFSA)', 27);
INSERT INTO public.empresa VALUES (344, true, 1, '2023-07-03 14:52:47.044606', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO CAMILO (SAO CAMILO)', 8);
INSERT INTO public.empresa VALUES (345, true, 1, '2023-07-03 14:52:47.045913', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO CAMILO - ESPÍRITO SANTO (SÃO CAMILO-ES)', 190);
INSERT INTO public.empresa VALUES (346, true, 1, '2023-07-03 14:52:47.047237', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO JOSÉ (UNISJ)', 12);
INSERT INTO public.empresa VALUES (347, true, 1, '2023-07-03 14:52:47.048499', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO JOSÉ DE ITAPERUNA', 186);
INSERT INTO public.empresa VALUES (348, true, 1, '2023-07-03 14:52:47.049771', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO JUDAS TADEU (CSJT)', 171);
INSERT INTO public.empresa VALUES (349, true, 1, '2023-07-03 14:52:47.051039', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO LUCAS JI-PARANÁ (UNISL)', 139);
INSERT INTO public.empresa VALUES (350, true, 1, '2023-07-03 14:52:47.052265', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO LUCAS PORTO VELHO (SÃO LUCAS PVH)', 51);
INSERT INTO public.empresa VALUES (351, true, 1, '2023-07-03 14:52:47.0535', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO MIGUEL (UNISÃOMIGUEL)', 60);
INSERT INTO public.empresa VALUES (352, true, 1, '2023-07-03 14:52:47.055155', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SÃO ROQUE (UNISÃO ROQUE)', 191);
INSERT INTO public.empresa VALUES (353, true, 1, '2023-07-03 14:52:47.056477', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SATC (UNISATC)', 192);
INSERT INTO public.empresa VALUES (354, true, 1, '2023-07-03 14:52:47.057827', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SENAC (RS)', 149);
INSERT INTO public.empresa VALUES (355, true, 1, '2023-07-03 14:52:47.059049', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SENAC (SENACSP)', 8);
INSERT INTO public.empresa VALUES (356, true, 1, '2023-07-03 14:52:47.060772', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SENAI BLUMENAU', 193);
INSERT INTO public.empresa VALUES (357, true, 1, '2023-07-03 14:52:47.062081', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SENAI CIMATEC (SENAI CIMATEC)', 116);
INSERT INTO public.empresa VALUES (358, true, 1, '2023-07-03 14:52:47.063306', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SERRA DOS ÓRGÃOS (UNIFESO)', 194);
INSERT INTO public.empresa VALUES (359, true, 1, '2023-07-03 14:52:47.064619', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SETE DE SETEMBRO (UNI7)', 45);
INSERT INTO public.empresa VALUES (360, true, 1, '2023-07-03 14:52:47.065853', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SOCIAL DA BAHIA (UNISBA)', 116);
INSERT INTO public.empresa VALUES (361, true, 1, '2023-07-03 14:52:47.067071', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SOCIESC', 68);
INSERT INTO public.empresa VALUES (362, true, 1, '2023-07-03 14:52:47.068299', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SOCIESC DE BLUMENAU', 193);
INSERT INTO public.empresa VALUES (363, true, 1, '2023-07-03 14:52:47.069549', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SUDOESTE PAULISTA (UNIFSP)', 195);
INSERT INTO public.empresa VALUES (364, true, 1, '2023-07-03 14:52:47.071142', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SUL-AMERICANA (UNIFASAM)', 42);
INSERT INTO public.empresa VALUES (365, true, 1, '2023-07-03 14:52:47.072784', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO SUMARÉ', 8);
INSERT INTO public.empresa VALUES (366, true, 1, '2023-07-03 14:52:47.074366', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TABOSA DE ALMEIDA (ASCES-UNITA)', 156);
INSERT INTO public.empresa VALUES (367, true, 1, '2023-07-03 14:52:47.075902', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TERESA D''ÁVILA (FATEA)', 22);
INSERT INTO public.empresa VALUES (368, true, 1, '2023-07-03 14:52:47.077304', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TIRADENTES (UNIT)', 73);
INSERT INTO public.empresa VALUES (369, true, 1, '2023-07-03 14:52:47.07863', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TIRADENTES DE PERNAMBUCO (UNIT PE)', 60);
INSERT INTO public.empresa VALUES (370, true, 1, '2023-07-03 14:52:47.079918', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TOCANTINENSE PRESIDENTE ANTÔNIO CARLOS (UNITPAC)', 196);
INSERT INTO public.empresa VALUES (371, true, 1, '2023-07-03 14:52:47.081192', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO TOLEDO WYDEN (UNITOLEDO WYDEN)', 197);
INSERT INTO public.empresa VALUES (372, true, 1, '2023-07-03 14:52:47.082468', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UFBRA (UFBRA)', 144);
INSERT INTO public.empresa VALUES (373, true, 1, '2023-07-03 14:52:47.083735', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA (UNA)', 2);
INSERT INTO public.empresa VALUES (374, true, 1, '2023-07-03 14:52:47.084928', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA DE BETIM', 198);
INSERT INTO public.empresa VALUES (375, true, 1, '2023-07-03 14:52:47.086191', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA DE BOM DESPACHO (UNA)', 199);
INSERT INTO public.empresa VALUES (376, true, 1, '2023-07-03 14:52:47.087355', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA DE CONTAGEM', 200);
INSERT INTO public.empresa VALUES (377, true, 1, '2023-07-03 14:52:47.088418', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNA DE UBERLÂNDIA', 134);
INSERT INTO public.empresa VALUES (378, true, 1, '2023-07-03 14:52:47.089554', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIÃO DAS AMÉRICAS DESCOMPLICA (UNIAMÉRICA )', 124);
INSERT INTO public.empresa VALUES (379, true, 1, '2023-07-03 14:52:47.090793', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIASSELVI DE BLUMENAU', 193);
INSERT INTO public.empresa VALUES (380, true, 1, '2023-07-03 14:52:47.091902', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIASSELVI DE BRUSQUE', 94);
INSERT INTO public.empresa VALUES (381, true, 1, '2023-07-03 14:52:47.093', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIASSELVI DE GUARAMIRIM', 201);
INSERT INTO public.empresa VALUES (382, true, 1, '2023-07-03 14:52:47.094122', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNI-BAN (UNI-BAN)', 8);
INSERT INTO public.empresa VALUES (383, true, 1, '2023-07-03 14:52:47.095283', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIBRAS DO SUDOESTE GOIANO (UNIBRAS)', 202);
INSERT INTO public.empresa VALUES (384, true, 1, '2023-07-03 14:52:47.096417', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIBTA', 8);
INSERT INTO public.empresa VALUES (385, true, 1, '2023-07-03 14:52:47.097525', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIC', 203);
INSERT INTO public.empresa VALUES (386, true, 1, '2023-07-03 14:52:47.098627', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNICARIOCA (UNICARIOCA)', 12);
INSERT INTO public.empresa VALUES (387, true, 1, '2023-07-03 14:52:47.099782', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNICURITIBA (UNICURITIBA)', 56);
INSERT INTO public.empresa VALUES (388, true, 1, '2023-07-03 14:52:47.100969', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIDADE DE ENSINO SUPERIOR DOM BOSCO (UNDB)', 141);
INSERT INTO public.empresa VALUES (389, true, 1, '2023-07-03 14:52:47.102221', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIDOM - BOSCO (UNIDOM - BOSCO)', 56);
INSERT INTO public.empresa VALUES (390, true, 1, '2023-07-03 14:52:47.103428', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO - UNIESP (UNIESP)', 204);
INSERT INTO public.empresa VALUES (391, true, 1, '2023-07-03 14:52:47.10477', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFAAT (UNIFAAT)', 205);
INSERT INTO public.empresa VALUES (392, true, 1, '2023-07-03 14:52:47.106081', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFACEAR', 206);
INSERT INTO public.empresa VALUES (393, true, 1, '2023-07-03 14:52:47.107359', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFACIG', 207);
INSERT INTO public.empresa VALUES (394, true, 1, '2023-07-03 14:52:47.10854', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFAFIBE (FAFIBE)', 208);
INSERT INTO public.empresa VALUES (395, true, 1, '2023-07-03 14:52:47.109872', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFAS', 209);
INSERT INTO public.empresa VALUES (396, true, 1, '2023-07-03 14:52:47.111205', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFATEB', 210);
INSERT INTO public.empresa VALUES (397, true, 1, '2023-07-03 14:52:47.112417', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFATECIE (UNIFATECIE)', 211);
INSERT INTO public.empresa VALUES (398, true, 1, '2023-07-03 14:52:47.113601', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFECAF', 212);
INSERT INTO public.empresa VALUES (399, true, 1, '2023-07-03 14:52:47.114766', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFTC', 116);
INSERT INTO public.empresa VALUES (400, true, 1, '2023-07-03 14:52:47.115835', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFTC SALVADOR', 116);
INSERT INTO public.empresa VALUES (401, true, 1, '2023-07-03 14:52:47.116958', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFTEC', 87);
INSERT INTO public.empresa VALUES (402, true, 1, '2023-07-03 14:52:47.118151', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIFTEC BENTO GONÇALVES', 77);
INSERT INTO public.empresa VALUES (403, true, 1, '2023-07-03 14:52:47.119619', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIGRAN CAPITAL', 48);
INSERT INTO public.empresa VALUES (404, true, 1, '2023-07-03 14:52:47.121163', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIHORIZONTES', 2);
INSERT INTO public.empresa VALUES (405, true, 1, '2023-07-03 14:52:47.122632', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNINORTE', 143);
INSERT INTO public.empresa VALUES (406, true, 1, '2023-07-03 14:52:47.124003', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNINOVAFAPI (UNINOVAFAPI)', 27);
INSERT INTO public.empresa VALUES (407, true, 1, '2023-07-03 14:52:47.125299', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNINOVO (UNINOVO)', 39);
INSERT INTO public.empresa VALUES (408, true, 1, '2023-07-03 14:52:47.126551', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIRB (UNIRB)', 116);
INSERT INTO public.empresa VALUES (409, true, 1, '2023-07-03 14:52:47.127994', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIRB - ALAGOINHAS', 213);
INSERT INTO public.empresa VALUES (410, true, 1, '2023-07-03 14:52:47.129263', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNISAN (UNISAN)', 8);
INSERT INTO public.empresa VALUES (411, true, 1, '2023-07-03 14:52:47.130574', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNISEP (CEUUN)', 214);
INSERT INTO public.empresa VALUES (412, true, 1, '2023-07-03 14:52:47.131944', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVEL', 54);
INSERT INTO public.empresa VALUES (413, true, 1, '2023-07-03 14:52:47.133191', NULL, NULL, false, 'CENTRO UNIVERSITARIO UNIVERSO BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (414, true, 1, '2023-07-03 14:52:47.134538', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVERSO GOIÂNIA', 42);
INSERT INTO public.empresa VALUES (415, true, 1, '2023-07-03 14:52:47.135922', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVERSO JUIZ DE FORA', 38);
INSERT INTO public.empresa VALUES (416, true, 1, '2023-07-03 14:52:47.137213', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVERSO RECIFE', 60);
INSERT INTO public.empresa VALUES (417, true, 1, '2023-07-03 14:52:47.138543', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVERSO SALVADOR', 116);
INSERT INTO public.empresa VALUES (418, true, 1, '2023-07-03 14:52:47.139809', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO UNIVINTE', 215);
INSERT INTO public.empresa VALUES (419, true, 1, '2023-07-03 14:52:47.141121', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO U:VERSE', 143);
INSERT INTO public.empresa VALUES (420, true, 1, '2023-07-03 14:52:47.142364', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO VALE DO CRICARÉ (UNIVC)', 216);
INSERT INTO public.empresa VALUES (421, true, 1, '2023-07-03 14:52:47.143598', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO VALE DO RIO VERDE', 217);
INSERT INTO public.empresa VALUES (422, true, 1, '2023-07-03 14:52:47.144887', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO VALE DO SALGADO', 218);
INSERT INTO public.empresa VALUES (423, true, 1, '2023-07-03 14:52:47.146163', NULL, NULL, false, 'CENTRO UNIVERSITÁRIO VÉRTICE (UNIVÉRTIX)', 219);
INSERT INTO public.empresa VALUES (424, true, 1, '2023-07-03 14:52:47.147375', NULL, NULL, false, 'CESREI FACULDADE', 147);
INSERT INTO public.empresa VALUES (425, true, 1, '2023-07-03 14:52:47.148547', NULL, NULL, false, 'CHRISTUS FACULDADE DO PIAUÍ (CHRISFAPI)', 220);
INSERT INTO public.empresa VALUES (426, true, 1, '2023-07-03 14:52:47.149784', NULL, NULL, false, 'CISNE - FACULDADE DE QUIXADÁ (CFQ)', 67);
INSERT INTO public.empresa VALUES (427, true, 1, '2023-07-03 14:52:47.151075', NULL, NULL, false, 'CISNE - FACULDADE TECNOLÓGICA DE QUIXADÁ (CFTQ)', 67);
INSERT INTO public.empresa VALUES (428, true, 1, '2023-07-03 14:52:47.152302', NULL, NULL, false, 'CLARETIANO - CENTRO UNIVERSITÁRIO (CLARETIANOBT)', 221);
INSERT INTO public.empresa VALUES (429, true, 1, '2023-07-03 14:52:47.153563', NULL, NULL, false, 'CLARETIANO - CENTRO UNIVERSITÁRIO', 222);
INSERT INTO public.empresa VALUES (430, true, 1, '2023-07-03 14:52:47.154769', NULL, NULL, false, 'CLARETIANO - FACULDADE DE BOA VISTA (CLARETIANOBV)', 138);
INSERT INTO public.empresa VALUES (431, true, 1, '2023-07-03 14:52:47.156066', NULL, NULL, false, 'COLÉGIO PEDRO II (CP II)', 12);
INSERT INTO public.empresa VALUES (432, true, 1, '2023-07-03 14:52:47.15734', NULL, NULL, false, 'COMPLEXO DE ENSINO SUPERIOR DE PALMAS (CESUP)', 23);
INSERT INTO public.empresa VALUES (433, true, 1, '2023-07-03 14:52:47.158529', NULL, NULL, false, 'CONSERVATÓRIO BRASILEIRO DE MÚSICA - CENTRO UNIVERSITÁRIO BRASILEIRO DE EDUCAÇÃO (CBM-UNICBE)', 12);
INSERT INTO public.empresa VALUES (434, true, 1, '2023-07-03 14:52:47.159673', NULL, NULL, false, 'DIRETORIA DE FORMAÇÃO E DESENVOLVIMENTO PROFISSIONAL (FUNDAJ)', 60);
INSERT INTO public.empresa VALUES (435, true, 1, '2023-07-03 14:52:47.160835', NULL, NULL, false, 'EJ - FACULDADE DE TECNOLOGIA EM AVIAÇÃO CIVIL (EJ)', 223);
INSERT INTO public.empresa VALUES (436, true, 1, '2023-07-03 14:52:47.162443', NULL, NULL, false, 'ENSINO SUPERIOR ALBERT SABIN JK (ESAS JK)', 5);
INSERT INTO public.empresa VALUES (437, true, 1, '2023-07-03 14:52:47.164094', NULL, NULL, false, 'EPGE ESCOLA BRASILEIRA DE ECONOMIA E FINANÇAS (FGV EPGE)', 12);
INSERT INTO public.empresa VALUES (438, true, 1, '2023-07-03 14:52:47.165711', NULL, NULL, false, 'ESCOLA BAHIANA DE MEDICINA E SAÚDE PÚBLICA (EBMSP)', 116);
INSERT INTO public.empresa VALUES (439, true, 1, '2023-07-03 14:52:47.167381', NULL, NULL, false, 'ESCOLA BRASILEIRA DE ADMINISTRAÇÃO PÚBLICA E DE EMPRESAS (EBAPE)', 12);
INSERT INTO public.empresa VALUES (440, true, 1, '2023-07-03 14:52:47.168612', NULL, NULL, false, 'ESCOLA BRASILEIRA DE MEDICINA CHINESA (EBRAMEC)', 8);
INSERT INTO public.empresa VALUES (441, true, 1, '2023-07-03 14:52:47.169753', NULL, NULL, false, 'ESCOLA DA ADVOCACIA-GERAL DA UNIÃO (EAGU)', 5);
INSERT INTO public.empresa VALUES (442, true, 1, '2023-07-03 14:52:47.170911', NULL, NULL, false, 'ESCOLA DA CIDADE - FACULDADE DE ARQUITETURA E URBANISMO (ESCOLA DA CIDADE)', 8);
INSERT INTO public.empresa VALUES (443, true, 1, '2023-07-03 14:52:47.172091', NULL, NULL, false, 'ESCOLA DE ADMINISTRAÇÃO DE EMPRESAS DE SÃO PAULO - FGV EAESP (FGV-EAESP)', 8);
INSERT INTO public.empresa VALUES (444, true, 1, '2023-07-03 14:52:47.173283', NULL, NULL, false, 'ESCOLA DE ADMINISTRAÇÃO E NEGÓCIOS (ESAD)', 5);
INSERT INTO public.empresa VALUES (445, true, 1, '2023-07-03 14:52:47.17459', NULL, NULL, false, 'ESCOLA DE ADMINISTRAÇÃO FAZENDÁRIA (ESAF)', 5);
INSERT INTO public.empresa VALUES (446, true, 1, '2023-07-03 14:52:47.1759', NULL, NULL, false, 'ESCOLA DE APERFEIÇOAMENTO DE OFICIAIS (ESAO)', 12);
INSERT INTO public.empresa VALUES (447, true, 1, '2023-07-03 14:52:47.177172', NULL, NULL, false, 'ESCOLA DE ARTILHARIA DE COSTA E ANTIAÉREA (ESCOSAAE)', 12);
INSERT INTO public.empresa VALUES (448, true, 1, '2023-07-03 14:52:47.178363', NULL, NULL, false, 'ESCOLA DE CIÊNCIAS SOCIAIS FGV CPDOC (FGV CPDOC)', 12);
INSERT INTO public.empresa VALUES (449, true, 1, '2023-07-03 14:52:47.17952', NULL, NULL, false, 'ESCOLA DE COMANDO E ESTADO-MAIOR DO EXÉRCITO (ECEME)', 12);
INSERT INTO public.empresa VALUES (450, true, 1, '2023-07-03 14:52:47.180668', NULL, NULL, false, 'ESCOLA DE COMUNICAÇÃO, MÍDIA E INFORMAÇÃO DA FUNDAÇÃO GETULIO VARGAS (FGV ECMI)', 12);
INSERT INTO public.empresa VALUES (451, true, 1, '2023-07-03 14:52:47.181859', NULL, NULL, false, 'ESCOLA DE COMUNICAÇÕES (ESCOM)', 5);
INSERT INTO public.empresa VALUES (452, true, 1, '2023-07-03 14:52:47.183144', NULL, NULL, false, 'ESCOLA DE CONTAS E CAPACITAÇÃO PROFESSOR PEDRO ALEIXO', 2);
INSERT INTO public.empresa VALUES (453, true, 1, '2023-07-03 14:52:47.184308', NULL, NULL, false, 'ESCOLA DE DIREITO DE SÃO PAULO - FGV DIREITO SP (FGV DIREITO SP)', 8);
INSERT INTO public.empresa VALUES (454, true, 1, '2023-07-03 14:52:47.185454', NULL, NULL, false, 'ESCOLA DE DIREITO DO RIO DE JANEIRO (DIREITO RIO)', 12);
INSERT INTO public.empresa VALUES (455, true, 1, '2023-07-03 14:52:47.186602', NULL, NULL, false, 'ESCOLA DE DIREITO FUCAPE (FUCAPE DIREITO)', 25);
INSERT INTO public.empresa VALUES (456, true, 1, '2023-07-03 14:52:47.187759', NULL, NULL, false, 'ESCOLA DE ECONOMIA DE SÃO PAULO (EESP)', 8);
INSERT INTO public.empresa VALUES (457, true, 1, '2023-07-03 14:52:47.189002', NULL, NULL, false, 'ESCOLA DE EDUCAÇÃO FÍSICA DO EXÉRCITO (ESEFEX)', 12);
INSERT INTO public.empresa VALUES (458, true, 1, '2023-07-03 14:52:47.190226', NULL, NULL, false, 'ESCOLA DE EDUCAÇÃO PERMANENTE (EEP)', 8);
INSERT INTO public.empresa VALUES (459, true, 1, '2023-07-03 14:52:47.191421', NULL, NULL, false, 'ESCOLA DE ENFERMAGEM DA FUNDAÇÃO TÉCNICO EDUCACIONAL SOUZA MARQUES (EEFTESM)', 12);
INSERT INTO public.empresa VALUES (460, true, 1, '2023-07-03 14:52:47.192542', NULL, NULL, false, 'ESCOLA DE ENGENHARIA DE PIRACICABA (EEP/FUMEP)', 224);
INSERT INTO public.empresa VALUES (461, true, 1, '2023-07-03 14:52:47.193768', NULL, NULL, false, 'ESCOLA DE ENGENHARIA KENNEDY (EEK)', 2);
INSERT INTO public.empresa VALUES (462, true, 1, '2023-07-03 14:52:47.194957', NULL, NULL, false, 'ESCOLA DE ENSINO SUPERIOR DA FIPE (FIPEEES)', 8);
INSERT INTO public.empresa VALUES (463, true, 1, '2023-07-03 14:52:47.196114', NULL, NULL, false, 'ESCOLA DE ENSINO SUPERIOR DO AGRESTE PARAIBANO (EESAP)', 225);
INSERT INTO public.empresa VALUES (464, true, 1, '2023-07-03 14:52:47.19721', NULL, NULL, false, 'ESCOLA DE EQUITAÇÃO DO EXÉRCITO (ESEQEX)', 12);
INSERT INTO public.empresa VALUES (465, true, 1, '2023-07-03 14:52:47.19834', NULL, NULL, false, 'ESCOLA DE GOVERNO PROFESSOR PAULO NEVES DE CARVALHO (EG)', 2);
INSERT INTO public.empresa VALUES (466, true, 1, '2023-07-03 14:52:47.199467', NULL, NULL, false, 'ESCOLA DE INSTRUÇÃO ESPECIALIZADA (ESIE)', 12);
INSERT INTO public.empresa VALUES (467, true, 1, '2023-07-03 14:52:47.200616', NULL, NULL, false, 'ESCOLA DE INTELIGÊNCIA - ESINT/ABIN (ESINT/ABIN)', 5);
INSERT INTO public.empresa VALUES (468, true, 1, '2023-07-03 14:52:47.201734', NULL, NULL, false, 'ESCOLA DE INTELIGÊNCIA MILITAR DO EXÉRCITO (ESIMEX)', 5);
INSERT INTO public.empresa VALUES (469, true, 1, '2023-07-03 14:52:47.20291', NULL, NULL, false, 'ESCOLA DE MATEMÁTICA APLICADA (EMAP-FGV)', 12);
INSERT INTO public.empresa VALUES (470, true, 1, '2023-07-03 14:52:47.204113', NULL, NULL, false, 'ESCOLA DE MEDICINA SOUZA MARQUES DA FUNDAÇÃO TÉCNICO-EDUCACIONAL SOUZA MARQUES (EMSM)', 12);
INSERT INTO public.empresa VALUES (471, true, 1, '2023-07-03 14:52:47.205286', NULL, NULL, false, 'ESCOLA DE POLÍTICAS PÚBLICAS E GOVERNO DA FUNDAÇÃO GETULIO VARGAS (FGV EPPG)', 5);
INSERT INTO public.empresa VALUES (472, true, 1, '2023-07-03 14:52:47.206433', NULL, NULL, false, 'ESCOLA DE SARGENTOS DAS ARMAS (ESA)', 217);
INSERT INTO public.empresa VALUES (473, true, 1, '2023-07-03 14:52:47.20757', NULL, NULL, false, 'ESCOLA DE SARGENTOS DE LOGÍSTICA (ESSLOG)', 12);
INSERT INTO public.empresa VALUES (474, true, 1, '2023-07-03 14:52:47.208689', NULL, NULL, false, 'ESCOLA DE SOCIOLOGIA E POLÍTICA DE SÃO PAULO (ESP)', 8);
INSERT INTO public.empresa VALUES (475, true, 1, '2023-07-03 14:52:47.209946', NULL, NULL, false, 'ESCOLA DIEESE DE CIÊNCIAS DO TRABALHO (DIEESE)', 8);
INSERT INTO public.empresa VALUES (476, true, 1, '2023-07-03 14:52:47.211275', NULL, NULL, false, 'ESCOLA MUNICIPAL DE GESTÃO DO LEGISLATIVO (EMUGLE)', 160);
INSERT INTO public.empresa VALUES (477, true, 1, '2023-07-03 14:52:47.212405', NULL, NULL, false, 'ESCOLA NACIONAL DE ADMINISTRAÇÃO PÚBLICA (ENAP)', 5);
INSERT INTO public.empresa VALUES (478, true, 1, '2023-07-03 14:52:47.213576', NULL, NULL, false, 'ESCOLA NACIONAL DE CIÊNCIAS ESTATÍSTICAS (ENCE)', 12);
INSERT INTO public.empresa VALUES (479, true, 1, '2023-07-03 14:52:47.214729', NULL, NULL, false, 'ESCOLA SAÚDE PÚBLICA - ESPMT (ESPMT)', 203);
INSERT INTO public.empresa VALUES (480, true, 1, '2023-07-03 14:52:47.215849', NULL, NULL, false, 'ESCOLA SUPERIOR ABERTA DO BRASIL (ESAB)', 226);
INSERT INTO public.empresa VALUES (481, true, 1, '2023-07-03 14:52:47.216993', NULL, NULL, false, 'ESCOLA SUPERIOR ASSOCIADA DE GOIÂNIA (ESUP)', 42);
INSERT INTO public.empresa VALUES (482, true, 1, '2023-07-03 14:52:47.218089', NULL, NULL, false, 'ESCOLA SUPERIOR BATISTA DO AMAZONAS (ESBAM)', 75);
INSERT INTO public.empresa VALUES (483, true, 1, '2023-07-03 14:52:47.219293', NULL, NULL, false, 'ESCOLA SUPERIOR DA AMAZÔNIA DE ABAETETUBA (ESAMAZ)', 227);
INSERT INTO public.empresa VALUES (484, true, 1, '2023-07-03 14:52:47.220467', NULL, NULL, false, 'ESCOLA SUPERIOR DE AGRONOMIA DE PARAGUAÇU PAULISTA (ESAPP)', 228);
INSERT INTO public.empresa VALUES (485, true, 1, '2023-07-03 14:52:47.221628', NULL, NULL, false, 'ESCOLA SUPERIOR DE ARTES CÉLIA HELENA', 8);
INSERT INTO public.empresa VALUES (486, true, 1, '2023-07-03 14:52:47.222811', NULL, NULL, false, 'ESCOLA SUPERIOR DE AVIAÇÃO CIVIL (ESAC)', 147);
INSERT INTO public.empresa VALUES (487, true, 1, '2023-07-03 14:52:47.223965', NULL, NULL, false, 'ESCOLA SUPERIOR DE CATALÃO', 17);
INSERT INTO public.empresa VALUES (488, true, 1, '2023-07-03 14:52:47.225083', NULL, NULL, false, 'ESCOLA SUPERIOR DE CIÊNCIAS DA SANTA CASA DE MISERICÓRDIA DE VITÓRIA (EMESCAM)', 25);
INSERT INTO public.empresa VALUES (489, true, 1, '2023-07-03 14:52:47.22622', NULL, NULL, false, 'ESCOLA SUPERIOR DE CIÊNCIAS DA SAÚDE (ESCS)', 5);
INSERT INTO public.empresa VALUES (490, true, 1, '2023-07-03 14:52:47.22734', NULL, NULL, false, 'ESCOLA SUPERIOR DE CRICIÚMA - ESUCRI (ESUCRI)', 192);
INSERT INTO public.empresa VALUES (491, true, 1, '2023-07-03 14:52:47.228492', NULL, NULL, false, 'ESCOLA SUPERIOR DE CRUZEIRO "PREFEITO HAMILTON VIEIRA MENDES" (ESEFIC)', 229);
INSERT INTO public.empresa VALUES (492, true, 1, '2023-07-03 14:52:47.229624', NULL, NULL, false, 'ESCOLA SUPERIOR DE EDUCAÇÃO (ESJUS)', 2);
INSERT INTO public.empresa VALUES (493, true, 1, '2023-07-03 14:52:47.23076', NULL, NULL, false, 'ESCOLA SUPERIOR DE EDUCAÇÃO CORPORATIVA (ESEC)', 140);
INSERT INTO public.empresa VALUES (494, true, 1, '2023-07-03 14:52:47.231895', NULL, NULL, false, 'ESCOLA SUPERIOR DE EDUCAÇÃO E NEGÓCIOS (ESN)', 145);
INSERT INTO public.empresa VALUES (495, true, 1, '2023-07-03 14:52:47.233074', NULL, NULL, false, 'ESCOLA SUPERIOR DE EDUCAÇÃO FÍSICA DE JUNDIAÍ (ESEFJ)', 182);
INSERT INTO public.empresa VALUES (496, true, 1, '2023-07-03 14:52:47.234276', NULL, NULL, false, 'ESCOLA SUPERIOR DE ENGENHARIA E GESTÃO DE SÃO PAULO - ESEG (ESEG)', 8);
INSERT INTO public.empresa VALUES (497, true, 1, '2023-07-03 14:52:47.235507', NULL, NULL, false, 'ESCOLA SUPERIOR DE ENSINO HELENA ANTIPOFF (ESEHA)', 49);
INSERT INTO public.empresa VALUES (498, true, 1, '2023-07-03 14:52:47.236853', NULL, NULL, false, 'ESCOLA SUPERIOR DE GESTÃO (ESGE)', 5);
INSERT INTO public.empresa VALUES (499, true, 1, '2023-07-03 14:52:47.23811', NULL, NULL, false, 'ESCOLA SUPERIOR DE GESTÃO COMERCIAL E MARKETING (ESIC)', 56);
INSERT INTO public.empresa VALUES (500, true, 1, '2023-07-03 14:52:47.239336', NULL, NULL, false, 'ESCOLA SUPERIOR DE ITABIRA', 161);
INSERT INTO public.empresa VALUES (501, true, 1, '2023-07-03 14:52:47.240515', NULL, NULL, false, 'ESCOLA SUPERIOR DE MARKETING (ESM)', 60);
INSERT INTO public.empresa VALUES (502, true, 1, '2023-07-03 14:52:47.241711', NULL, NULL, false, 'ESCOLA SUPERIOR DE POUSO ALEGRE', 230);
INSERT INTO public.empresa VALUES (503, true, 1, '2023-07-03 14:52:47.242931', NULL, NULL, false, 'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING (ESPM)', 8);
INSERT INTO public.empresa VALUES (504, true, 1, '2023-07-03 14:52:47.244083', NULL, NULL, false, 'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING DE PORTO ALEGRE (ESPM - POA)', 149);
INSERT INTO public.empresa VALUES (505, true, 1, '2023-07-03 14:52:47.245221', NULL, NULL, false, 'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING DO RIO DE JANEIRO (ESPM)', 12);
INSERT INTO public.empresa VALUES (506, true, 1, '2023-07-03 14:52:47.246383', NULL, NULL, false, 'ESCOLA SUPERIOR DE SAÚDE DE ARCOVERDE (ESSA)', 15);
INSERT INTO public.empresa VALUES (507, true, 1, '2023-07-03 14:52:47.24758', NULL, NULL, false, 'ESCOLA SUPERIOR DE TECNOLOGIA & GESTÃO DE SANTA CATARINA (EST&G)', 3);
INSERT INTO public.empresa VALUES (508, true, 1, '2023-07-03 14:52:47.249082', NULL, NULL, false, 'ESCOLA SUPERIOR DE TEOLOGIA E ESPIRITUALIDADE FRANCISCANA (ESTEF)', 149);
INSERT INTO public.empresa VALUES (509, true, 1, '2023-07-03 14:52:47.250576', NULL, NULL, false, 'ESCOLA SUPERIOR DO AR (EAR)', 100);
INSERT INTO public.empresa VALUES (510, true, 1, '2023-07-03 14:52:47.252131', NULL, NULL, false, 'ESCOLA SUPERIOR DOM HELDER CÂMARA (ESDHC)', 2);
INSERT INTO public.empresa VALUES (511, true, 1, '2023-07-03 14:52:47.253759', NULL, NULL, false, 'ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO (ESCOLAMP)', 5);
INSERT INTO public.empresa VALUES (512, true, 1, '2023-07-03 14:52:47.255044', NULL, NULL, false, 'ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO DA UNIÃO (ESMPU)', 5);
INSERT INTO public.empresa VALUES (513, true, 1, '2023-07-03 14:52:47.256297', NULL, NULL, false, 'ESCOLA SUPERIOR DO SUL DE SANTA CATARINA', 192);
INSERT INTO public.empresa VALUES (514, true, 1, '2023-07-03 14:52:47.25746', NULL, NULL, false, 'ESCOLA SUPERIOR EM MEIO AMBIENTE (ESMA)', 231);
INSERT INTO public.empresa VALUES (515, true, 1, '2023-07-03 14:52:47.258621', NULL, NULL, false, 'ESCOLA SUPERIOR MADRE CELESTE (ESMAC)', 232);
INSERT INTO public.empresa VALUES (516, true, 1, '2023-07-03 14:52:47.259777', NULL, NULL, false, 'ESCOLA SUPERIOR NACIONAL DE SEGUROS (ESNS)', 12);
INSERT INTO public.empresa VALUES (517, true, 1, '2023-07-03 14:52:47.261025', NULL, NULL, false, 'ESCOLA SUPERIOR NACIONAL DE SEGUROS DE SÃO PAULO (ESNS-SP)', 8);
INSERT INTO public.empresa VALUES (518, true, 1, '2023-07-03 14:52:47.262211', NULL, NULL, false, 'ESCOLA SUPERIOR SÃO FRANCISCO DE ASSIS (ESFA)', 233);
INSERT INTO public.empresa VALUES (519, true, 1, '2023-07-03 14:52:47.26339', NULL, NULL, false, 'ESCOLA SUPERIOR SÃO JUDAS DE GUARULHOS', 100);
INSERT INTO public.empresa VALUES (520, true, 1, '2023-07-03 14:52:47.26453', NULL, NULL, false, 'ESCOLA SUPERIOR SÃO JUDAS DE SÃO BERNARDO DO CAMPO', 82);
INSERT INTO public.empresa VALUES (521, true, 1, '2023-07-03 14:52:47.265682', NULL, NULL, false, 'ESCOLA SUPERIOR UNA DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (522, true, 1, '2023-07-03 14:52:47.266805', NULL, NULL, false, 'ESCOLA SUPERIOR UNA DE ITUMBIARA', 234);
INSERT INTO public.empresa VALUES (523, true, 1, '2023-07-03 14:52:47.267994', NULL, NULL, false, 'ESTÁCIO FATERN - FACULDADE ESTÁCIO DO RIO GRANDE DO NORTE (ESTÁCIO FATERN)', 130);
INSERT INTO public.empresa VALUES (524, true, 1, '2023-07-03 14:52:47.269328', NULL, NULL, false, 'FACITEN - FACULDADE DE CIÊNCIAS E TECNOLOGIAS DE NATAL (FACITEN)', 130);
INSERT INTO public.empresa VALUES (525, true, 1, '2023-07-03 14:52:47.270726', NULL, NULL, false, 'FACUDADE IEDUCARE - FIED (FIED)', 235);
INSERT INTO public.empresa VALUES (526, true, 1, '2023-07-03 14:52:47.272', NULL, NULL, false, 'FACUDADE UNINEVES', 107);
INSERT INTO public.empresa VALUES (527, true, 1, '2023-07-03 14:52:47.273265', NULL, NULL, false, 'FACULDADE 05 DE JULHO (F5)', 167);
INSERT INTO public.empresa VALUES (528, true, 1, '2023-07-03 14:52:47.274461', NULL, NULL, false, 'FACULDADE 2001', 60);
INSERT INTO public.empresa VALUES (529, true, 1, '2023-07-03 14:52:47.275672', NULL, NULL, false, 'FACULDADE 28 DE AGOSTO DE ENSINO E PESQUISA (28 DE AGOSTO)', 8);
INSERT INTO public.empresa VALUES (530, true, 1, '2023-07-03 14:52:47.276896', NULL, NULL, false, 'FACULDADE ABC DE GOIÂNIA (FABC)', 42);
INSERT INTO public.empresa VALUES (531, true, 1, '2023-07-03 14:52:47.278177', NULL, NULL, false, 'FACULDADE ABERTA DO TOCANTINS (FAT)', 236);
INSERT INTO public.empresa VALUES (532, true, 1, '2023-07-03 14:52:47.279437', NULL, NULL, false, 'FACULDADE ABRANGE ABC (FABRANGE)', 82);
INSERT INTO public.empresa VALUES (533, true, 1, '2023-07-03 14:52:47.280675', NULL, NULL, false, 'FACULDADE ADELINA MOURA - FAADEMA (FAADEMA)', 237);
INSERT INTO public.empresa VALUES (534, true, 1, '2023-07-03 14:52:47.281904', NULL, NULL, false, 'FACULDADE ADELMAR ROSADO (FAR)', 27);
INSERT INTO public.empresa VALUES (535, true, 1, '2023-07-03 14:52:47.283115', NULL, NULL, false, 'FACULDADE ADJETIVO CETEP (ADJETIVO-CETEP)', 238);
INSERT INTO public.empresa VALUES (536, true, 1, '2023-07-03 14:52:47.284262', NULL, NULL, false, 'FACULDADE ADVENTISTA DA AMAZÔNIA (FAAMA)', 239);
INSERT INTO public.empresa VALUES (537, true, 1, '2023-07-03 14:52:47.285432', NULL, NULL, false, 'FACULDADE ADVENTISTA DA BAHIA (FADBA)', 240);
INSERT INTO public.empresa VALUES (538, true, 1, '2023-07-03 14:52:47.286576', NULL, NULL, false, 'FACULDADE ADVENTISTA DO PARANÁ (FAP)', 241);
INSERT INTO public.empresa VALUES (539, true, 1, '2023-07-03 14:52:47.28776', NULL, NULL, false, 'FACULDADE AFONSO MAFRENSE (FAM)', 242);
INSERT INTO public.empresa VALUES (540, true, 1, '2023-07-03 14:52:47.288919', NULL, NULL, false, 'FACULDADE ÁGAPE DE SÃO FÉLIX', 243);
INSERT INTO public.empresa VALUES (541, true, 1, '2023-07-03 14:52:47.290111', NULL, NULL, false, 'FACULDADE AGES DE JACOBINA (FACULDADE AGES)', 244);
INSERT INTO public.empresa VALUES (542, true, 1, '2023-07-03 14:52:47.291277', NULL, NULL, false, 'FACULDADE AGES DE MEDICINA (FACULDADE AGES)', 244);
INSERT INTO public.empresa VALUES (543, true, 1, '2023-07-03 14:52:47.292491', NULL, NULL, false, 'FACULDADE AGES DE MEDICINA DE IRECÊ (FACULDADE AGES)', 245);
INSERT INTO public.empresa VALUES (544, true, 1, '2023-07-03 14:52:47.293661', NULL, NULL, false, 'FACULDADE AGES DE SENHOR DO BONFIM (FACULDADE AGES)', 246);
INSERT INTO public.empresa VALUES (545, true, 1, '2023-07-03 14:52:47.294841', NULL, NULL, false, 'FACULDADE AGES DE TUCANO (FACULDADE AGES)', 247);
INSERT INTO public.empresa VALUES (546, true, 1, '2023-07-03 14:52:47.296054', NULL, NULL, false, 'FACULDADE ÁGORA - ADMINISTRAÇÃO, EDUCAÇÃO E CULTURA (FAAEC)', 56);
INSERT INTO public.empresa VALUES (547, true, 1, '2023-07-03 14:52:47.297307', NULL, NULL, false, 'FACULDADE ÁGORA - FAG (FAG)', 248);
INSERT INTO public.empresa VALUES (548, true, 1, '2023-07-03 14:52:47.298457', NULL, NULL, false, 'FACULDADE AIEC (AIEC / FAAB)', 5);
INSERT INTO public.empresa VALUES (549, true, 1, '2023-07-03 14:52:47.299602', NULL, NULL, false, 'FACULDADE AJES (AJES)', 6);
INSERT INTO public.empresa VALUES (550, true, 1, '2023-07-03 14:52:47.300837', NULL, NULL, false, 'FACULDADE ALAGOANA DE ADMINISTRAÇÃO (FAA)', 73);
INSERT INTO public.empresa VALUES (551, true, 1, '2023-07-03 14:52:47.30218', NULL, NULL, false, 'FACULDADE ALBERT EINSTEIN (FALBE)', 5);
INSERT INTO public.empresa VALUES (552, true, 1, '2023-07-03 14:52:47.30335', NULL, NULL, false, 'FACULDADE ALDETE MARIA ALVES (FAMA)', 249);
INSERT INTO public.empresa VALUES (553, true, 1, '2023-07-03 14:52:47.304488', NULL, NULL, false, 'FACULDADE ALFA AMÉRICA', 250);
INSERT INTO public.empresa VALUES (554, true, 1, '2023-07-03 14:52:47.305629', NULL, NULL, false, 'FACULDADE ALFA DE TEÓFILO OTONI (ALFA)', 7);
INSERT INTO public.empresa VALUES (555, true, 1, '2023-07-03 14:52:47.306885', NULL, NULL, false, 'FACULDADE ALFA UMUARAMA (ALFA)', 251);
INSERT INTO public.empresa VALUES (556, true, 1, '2023-07-03 14:52:47.308077', NULL, NULL, false, 'FACULDADE ALFAUNIPAC DE ALMENARA', 252);
INSERT INTO public.empresa VALUES (557, true, 1, '2023-07-03 14:52:47.309251', NULL, NULL, false, 'FACULDADE ALFAUNIPAC DE ARAÇUAÍ', 253);
INSERT INTO public.empresa VALUES (558, true, 1, '2023-07-03 14:52:47.310466', NULL, NULL, false, 'FACULDADE ALFAUNIPAC DE CAPELINHA', 254);
INSERT INTO public.empresa VALUES (559, true, 1, '2023-07-03 14:52:47.311679', NULL, NULL, false, 'FACULDADE ALFAUNIPAC DE GUANHÃES', 255);
INSERT INTO public.empresa VALUES (560, true, 1, '2023-07-03 14:52:47.31288', NULL, NULL, false, 'FACULDADE ALFREDO NASSER DE CASA NOVA (FAN)', 256);
INSERT INTO public.empresa VALUES (561, true, 1, '2023-07-03 14:52:47.314082', NULL, NULL, false, 'FACULDADE ALFREDO NASSER DE PONTALINA', 257);
INSERT INTO public.empresa VALUES (562, true, 1, '2023-07-03 14:52:47.315218', NULL, NULL, false, 'FACULDADE ALFREDO NASSER DE REMANSO', 258);
INSERT INTO public.empresa VALUES (563, true, 1, '2023-07-03 14:52:47.316435', NULL, NULL, false, 'FACULDADE ALIANÇA DE ITABERAI', 259);
INSERT INTO public.empresa VALUES (564, true, 1, '2023-07-03 14:52:47.317852', NULL, NULL, false, 'FACULDADE ALIANÇA DO MARANHÃO (FAMAR)', 141);
INSERT INTO public.empresa VALUES (565, true, 1, '2023-07-03 14:52:47.319068', NULL, NULL, false, 'FACULDADE ALIANÇA EDUCACIONAL DO ESTADO DE SÃO PAULO', 260);
INSERT INTO public.empresa VALUES (566, true, 1, '2023-07-03 14:52:47.320262', NULL, NULL, false, 'FACULDADE ALIS DE ITABIRITO', 261);
INSERT INTO public.empresa VALUES (567, true, 1, '2023-07-03 14:52:47.321435', NULL, NULL, false, 'FACULDADE ALMEIDA RODRIGUES (FAR)', 202);
INSERT INTO public.empresa VALUES (568, true, 1, '2023-07-03 14:52:47.322864', NULL, NULL, false, 'FACULDADE ALPHA (ALPHA)', 60);
INSERT INTO public.empresa VALUES (569, true, 1, '2023-07-03 14:52:47.325187', NULL, NULL, false, 'FACULDADE ALPHAVILLE (FAVI)', 158);
INSERT INTO public.empresa VALUES (570, true, 1, '2023-07-03 14:52:47.327412', NULL, NULL, false, 'FACULDADE ALURA.TECH (ALURA.TECH)', 8);
INSERT INTO public.empresa VALUES (571, true, 1, '2023-07-03 14:52:47.329694', NULL, NULL, false, 'FACULDADE ÁLVARES DE AZEVEDO (FAATESP)', 8);
INSERT INTO public.empresa VALUES (572, true, 1, '2023-07-03 14:52:47.331232', NULL, NULL, false, 'FACULDADE ALVES LIMA (FAAL)', 5);
INSERT INTO public.empresa VALUES (573, true, 1, '2023-07-03 14:52:47.332379', NULL, NULL, false, 'FACULDADE AMADEUS (FAMA)', 142);
INSERT INTO public.empresa VALUES (574, true, 1, '2023-07-03 14:52:47.333462', NULL, NULL, false, 'FACULDADE AMAZONAS', 262);
INSERT INTO public.empresa VALUES (575, true, 1, '2023-07-03 14:52:47.334713', NULL, NULL, false, 'FACULDADE AMÉRICA (AMÉRICA)', 190);
INSERT INTO public.empresa VALUES (576, true, 1, '2023-07-03 14:52:47.336302', NULL, NULL, false, 'FACULDADE AMERICAS INTERNATIONAL COLLEGE (FAMG)', 8);
INSERT INTO public.empresa VALUES (577, true, 1, '2023-07-03 14:52:47.337896', NULL, NULL, false, 'FACULDADE ANA CAROLINA PUGA (FAPUGA)', 8);
INSERT INTO public.empresa VALUES (578, true, 1, '2023-07-03 14:52:47.339465', NULL, NULL, false, 'FACULDADE ANASPS (FANASPS)', 5);
INSERT INTO public.empresa VALUES (579, true, 1, '2023-07-03 14:52:47.341094', NULL, NULL, false, 'FACULDADE ANCHIETA DO RECIFE (FAR)', 60);
INSERT INTO public.empresa VALUES (580, true, 1, '2023-07-03 14:52:47.342326', NULL, NULL, false, 'FACULDADE ANCLIVEPA (ANCLIVEPA)', 8);
INSERT INTO public.empresa VALUES (581, true, 1, '2023-07-03 14:52:47.343596', NULL, NULL, false, 'FACULDADE ANCLIVEPA BRASÍLIA', 5);
INSERT INTO public.empresa VALUES (582, true, 1, '2023-07-03 14:52:47.344843', NULL, NULL, false, 'FACULDADE ANCLIVEPA DE GESTÃO E HUMANOLOGIA (FAGH)', 8);
INSERT INTO public.empresa VALUES (583, true, 1, '2023-07-03 14:52:47.346076', NULL, NULL, false, 'FACULDADE ANCLIVEPA DE NATAL', 130);
INSERT INTO public.empresa VALUES (584, true, 1, '2023-07-03 14:52:47.347282', NULL, NULL, false, 'FACULDADE ANCLIVEPA SÃO PAULO (ANCLIVEPA SP)', 8);
INSERT INTO public.empresa VALUES (585, true, 1, '2023-07-03 14:52:47.348636', NULL, NULL, false, 'FACULDADE ANDREOTTI DE MARINGÁ (FAM)', 76);
INSERT INTO public.empresa VALUES (586, true, 1, '2023-07-03 14:52:47.349905', NULL, NULL, false, 'FACULDADE ANGEL VIANNA (FAV)', 12);
INSERT INTO public.empresa VALUES (587, true, 1, '2023-07-03 14:52:47.35134', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ALAGOINHAS (FPA)', 213);
INSERT INTO public.empresa VALUES (588, true, 1, '2023-07-03 14:52:47.352736', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ALVORADA', 263);
INSERT INTO public.empresa VALUES (589, true, 1, '2023-07-03 14:52:47.354202', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ANÁPOLIS', 264);
INSERT INTO public.empresa VALUES (590, true, 1, '2023-07-03 14:52:47.355522', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE BAURU', 93);
INSERT INTO public.empresa VALUES (591, true, 1, '2023-07-03 14:52:47.356789', NULL, NULL, false, 'FACULDADE ANHANGUERA DE BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (592, true, 1, '2023-07-03 14:52:47.358083', NULL, NULL, false, 'FACULDADE ANHANGUERA DE BETIM', 198);
INSERT INTO public.empresa VALUES (593, true, 1, '2023-07-03 14:52:47.359419', NULL, NULL, false, 'FACULDADE ANHANGUERA DE BRASÍLIA (ANHANGUERA DF)', 5);
INSERT INTO public.empresa VALUES (594, true, 1, '2023-07-03 14:52:47.360727', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CACHOEIRO DE ITAPEMIRIM', 190);
INSERT INTO public.empresa VALUES (595, true, 1, '2023-07-03 14:52:47.362035', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CAMAÇARI', 153);
INSERT INTO public.empresa VALUES (596, true, 1, '2023-07-03 14:52:47.363307', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE CAMPINAS', 177);
INSERT INTO public.empresa VALUES (597, true, 1, '2023-07-03 14:52:47.364579', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CARUARU', 156);
INSERT INTO public.empresa VALUES (598, true, 1, '2023-07-03 14:52:47.365812', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CASCAVEL', 54);
INSERT INTO public.empresa VALUES (599, true, 1, '2023-07-03 14:52:47.367061', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CATANDUVA (FAC)', 181);
INSERT INTO public.empresa VALUES (600, true, 1, '2023-07-03 14:52:47.368277', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CAXIAS DO SUL', 87);
INSERT INTO public.empresa VALUES (601, true, 1, '2023-07-03 14:52:47.36947', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CIÊNCIAS JURÍDICAS, GERENCIAIS E EDUCAÇÃO DE SINOP', 155);
INSERT INTO public.empresa VALUES (602, true, 1, '2023-07-03 14:52:47.370632', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CIÊNCIAS SOCIAIS APLICADAS DE SINOP (FACISAS)', 155);
INSERT INTO public.empresa VALUES (603, true, 1, '2023-07-03 14:52:47.371826', NULL, NULL, false, 'FACULDADE ANHANGUERA DE CONTAGEM', 200);
INSERT INTO public.empresa VALUES (604, true, 1, '2023-07-03 14:52:47.373005', NULL, NULL, false, 'FACULDADE ANHANGUERA DE DIVINÓPOLIS', 19);
INSERT INTO public.empresa VALUES (605, true, 1, '2023-07-03 14:52:47.374233', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE DOURADOS', 84);
INSERT INTO public.empresa VALUES (606, true, 1, '2023-07-03 14:52:47.375544', NULL, NULL, false, 'FACULDADE ANHANGUERA DE FEIRA DE SANTANA', 99);
INSERT INTO public.empresa VALUES (607, true, 1, '2023-07-03 14:52:47.376808', NULL, NULL, false, 'FACULDADE ANHANGUERA DE GOIÂNIA', 42);
INSERT INTO public.empresa VALUES (608, true, 1, '2023-07-03 14:52:47.378074', NULL, NULL, false, 'FACULDADE ANHANGUERA DE GOVERNADOR VALADARES', 265);
INSERT INTO public.empresa VALUES (609, true, 1, '2023-07-03 14:52:47.379271', NULL, NULL, false, 'FACULDADE ANHANGUERA DE GUARAPARI', 266);
INSERT INTO public.empresa VALUES (610, true, 1, '2023-07-03 14:52:47.380589', NULL, NULL, false, 'FACULDADE ANHANGUERA DE GUARULHOS', 100);
INSERT INTO public.empresa VALUES (611, true, 1, '2023-07-03 14:52:47.381796', NULL, NULL, false, 'FACULDADE ANHANGUERA DE IMPERATRIZ', 267);
INSERT INTO public.empresa VALUES (612, true, 1, '2023-07-03 14:52:47.382931', NULL, NULL, false, 'FACULDADE ANHANGUERA DE INDAIATUBA', 11);
INSERT INTO public.empresa VALUES (613, true, 1, '2023-07-03 14:52:47.384056', NULL, NULL, false, 'FACULDADE ANHANGUERA DE IPATINGA', 268);
INSERT INTO public.empresa VALUES (614, true, 1, '2023-07-03 14:52:47.385163', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ITABUNA', 269);
INSERT INTO public.empresa VALUES (615, true, 1, '2023-07-03 14:52:47.386375', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ITAPECERICA DA SERRA', 270);
INSERT INTO public.empresa VALUES (616, true, 1, '2023-07-03 14:52:47.387593', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ITAPETININGA', 271);
INSERT INTO public.empresa VALUES (617, true, 1, '2023-07-03 14:52:47.388747', NULL, NULL, false, 'FACULDADE ANHANGUERA DE ITAPEVA (FAI)', 272);
INSERT INTO public.empresa VALUES (618, true, 1, '2023-07-03 14:52:47.389859', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JACAREÍ', 273);
INSERT INTO public.empresa VALUES (619, true, 1, '2023-07-03 14:52:47.391055', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JAÚ (FAJ)', 274);
INSERT INTO public.empresa VALUES (620, true, 1, '2023-07-03 14:52:47.392177', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JEQUIÉ (FPJ)', 275);
INSERT INTO public.empresa VALUES (621, true, 1, '2023-07-03 14:52:47.3934', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JOINVILLE', 68);
INSERT INTO public.empresa VALUES (622, true, 1, '2023-07-03 14:52:47.394548', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JUAZEIRO DO NORTE', 135);
INSERT INTO public.empresa VALUES (623, true, 1, '2023-07-03 14:52:47.395697', NULL, NULL, false, 'FACULDADE ANHANGUERA DE JUNDIAÍ', 182);
INSERT INTO public.empresa VALUES (624, true, 1, '2023-07-03 14:52:47.396837', NULL, NULL, false, 'FACULDADE ANHANGUERA DE LIMEIRA', 276);
INSERT INTO public.empresa VALUES (625, true, 1, '2023-07-03 14:52:47.397985', NULL, NULL, false, 'FACULDADE ANHANGUERA DE LINHARES', 277);
INSERT INTO public.empresa VALUES (626, true, 1, '2023-07-03 14:52:47.399116', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MACAPÁ', 26);
INSERT INTO public.empresa VALUES (627, true, 1, '2023-07-03 14:52:47.400248', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MACEIÓ', 73);
INSERT INTO public.empresa VALUES (628, true, 1, '2023-07-03 14:52:47.401388', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MARABÁ', 46);
INSERT INTO public.empresa VALUES (629, true, 1, '2023-07-03 14:52:47.40255', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MATÃO', 278);
INSERT INTO public.empresa VALUES (630, true, 1, '2023-07-03 14:52:47.403705', NULL, NULL, false, 'FACULDADE ANHANGUERA DE MOGI GUAÇU (FAMG)', 279);
INSERT INTO public.empresa VALUES (631, true, 1, '2023-07-03 14:52:47.404869', NULL, NULL, false, 'FACULDADE ANHANGUERA DE OSASCO', 158);
INSERT INTO public.empresa VALUES (633, true, 1, '2023-07-03 14:52:47.40716', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PARAGOMINAS (FPP)', 280);
INSERT INTO public.empresa VALUES (634, true, 1, '2023-07-03 14:52:47.408334', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PARAUAPEBAS', 281);
INSERT INTO public.empresa VALUES (635, true, 1, '2023-07-03 14:52:47.409463', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PASSO FUNDO', 282);
INSERT INTO public.empresa VALUES (636, true, 1, '2023-07-03 14:52:47.41068', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PELOTAS', 283);
INSERT INTO public.empresa VALUES (637, true, 1, '2023-07-03 14:52:47.411867', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PINDAMONHANGABA', 162);
INSERT INTO public.empresa VALUES (638, true, 1, '2023-07-03 14:52:47.413125', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE PIRACICABA', 224);
INSERT INTO public.empresa VALUES (639, true, 1, '2023-07-03 14:52:47.414557', NULL, NULL, false, 'FACULDADE ANHANGUERA DE POÇOS DE CALDAS', 284);
INSERT INTO public.empresa VALUES (640, true, 1, '2023-07-03 14:52:47.415921', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PONTA GROSSA', 188);
INSERT INTO public.empresa VALUES (641, true, 1, '2023-07-03 14:52:47.417284', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PORTO ALEGRE', 149);
INSERT INTO public.empresa VALUES (642, true, 1, '2023-07-03 14:52:47.418507', NULL, NULL, false, 'FACULDADE ANHANGUERA DE PRIMAVERA DO LESTE (FIPL)', 285);
INSERT INTO public.empresa VALUES (643, true, 1, '2023-07-03 14:52:47.419793', NULL, NULL, false, 'FACULDADE ANHANGUERA DE RIBEIRÃO DAS NEVES', 286);
INSERT INTO public.empresa VALUES (644, true, 1, '2023-07-03 14:52:47.421103', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE RIBEIRÃO PRETO', 58);
INSERT INTO public.empresa VALUES (645, true, 1, '2023-07-03 14:52:47.422347', NULL, NULL, false, 'FACULDADE ANHANGUERA DE RIO BRANCO', 143);
INSERT INTO public.empresa VALUES (646, true, 1, '2023-07-03 14:52:47.423509', NULL, NULL, false, 'FACULDADE ANHANGUERA DE RIO CLARO', 222);
INSERT INTO public.empresa VALUES (647, true, 1, '2023-07-03 14:52:47.424734', NULL, NULL, false, 'FACULDADE ANHANGUERA DE RONDONÓPOLIS (FAR)', 287);
INSERT INTO public.empresa VALUES (648, true, 1, '2023-07-03 14:52:47.426337', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SANTA BÁRBARA', 288);
INSERT INTO public.empresa VALUES (649, true, 1, '2023-07-03 14:52:47.428036', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SANTO ANTÔNIO DE JESUS', 96);
INSERT INTO public.empresa VALUES (650, true, 1, '2023-07-03 14:52:47.429732', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO BERNARDO', 82);
INSERT INTO public.empresa VALUES (651, true, 1, '2023-07-03 14:52:47.431352', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO JOÃO DE MERITI', 289);
INSERT INTO public.empresa VALUES (652, true, 1, '2023-07-03 14:52:47.432584', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE SÃO JOSÉ', 144);
INSERT INTO public.empresa VALUES (653, true, 1, '2023-07-03 14:52:47.433772', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO JOSÉ DO RIO PRETO (FASJRP)', 114);
INSERT INTO public.empresa VALUES (654, true, 1, '2023-07-03 14:52:47.434972', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO JOSÉ-SC (FASJ-SC)', 140);
INSERT INTO public.empresa VALUES (655, true, 1, '2023-07-03 14:52:47.43619', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SÃO LUIZ', 141);
INSERT INTO public.empresa VALUES (656, true, 1, '2023-07-03 14:52:47.437367', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SERRA (FPS)', 290);
INSERT INTO public.empresa VALUES (657, true, 1, '2023-07-03 14:52:47.438555', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SERTÃOZINHO (FASERT)', 291);
INSERT INTO public.empresa VALUES (658, true, 1, '2023-07-03 14:52:47.439806', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SOBRAL', 167);
INSERT INTO public.empresa VALUES (659, true, 1, '2023-07-03 14:52:47.441045', NULL, NULL, false, 'FACULDADE ANHANGÜERA DE SOROCABA (FSO)', 146);
INSERT INTO public.empresa VALUES (660, true, 1, '2023-07-03 14:52:47.442246', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SORRISO', 292);
INSERT INTO public.empresa VALUES (661, true, 1, '2023-07-03 14:52:47.44347', NULL, NULL, false, 'FACULDADE ANHANGUERA DE SUMARÉ (FACSUMARÉ)', 293);
INSERT INTO public.empresa VALUES (662, true, 1, '2023-07-03 14:52:47.444701', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TABOÃO DA SERRA (FATS)', 212);
INSERT INTO public.empresa VALUES (663, true, 1, '2023-07-03 14:52:47.44594', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TANGARÁ DA SERRA (FITS)', 294);
INSERT INTO public.empresa VALUES (664, true, 1, '2023-07-03 14:52:47.447141', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TAUBATÉ', 33);
INSERT INTO public.empresa VALUES (665, true, 1, '2023-07-03 14:52:47.448465', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TECNOLOGIA DE BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (666, true, 1, '2023-07-03 14:52:47.450038', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TECNOLOGIA DE JUNDIAÍ', 182);
INSERT INTO public.empresa VALUES (667, true, 1, '2023-07-03 14:52:47.451626', NULL, NULL, false, 'FACULDADE ANHANGUERA DE TEIXEIRA DE FREITAS', 295);
INSERT INTO public.empresa VALUES (668, true, 1, '2023-07-03 14:52:47.452953', NULL, NULL, false, 'FACULDADE ANHANGUERA DE UBERLÂNDIA', 134);
INSERT INTO public.empresa VALUES (669, true, 1, '2023-07-03 14:52:47.454187', NULL, NULL, false, 'FACULDADE ANHANGUERA DE VALINHOS', 296);
INSERT INTO public.empresa VALUES (670, true, 1, '2023-07-03 14:52:47.45545', NULL, NULL, false, 'FACULDADE ANHANGUERA DE VALPARAÍSO', 297);
INSERT INTO public.empresa VALUES (671, true, 1, '2023-07-03 14:52:47.456685', NULL, NULL, false, 'FACULDADE ANHANGUERA DE VITÓRIA DA CONQUISTA', 37);
INSERT INTO public.empresa VALUES (672, true, 1, '2023-07-03 14:52:47.457836', NULL, NULL, false, 'FACULDADE ANHANGUERA DO AMAZONAS', 75);
INSERT INTO public.empresa VALUES (673, true, 1, '2023-07-03 14:52:47.459', NULL, NULL, false, 'FACULDADE ANHANGUERA DO CEARÁ', 45);
INSERT INTO public.empresa VALUES (674, true, 1, '2023-07-03 14:52:47.460183', NULL, NULL, false, 'FACULDADE ANHANGUERA DO MARANHÃO', 141);
INSERT INTO public.empresa VALUES (675, true, 1, '2023-07-03 14:52:47.461416', NULL, NULL, false, 'FACULDADE ANHANGUERA DO RIO GRANDE', 298);
INSERT INTO public.empresa VALUES (676, true, 1, '2023-07-03 14:52:47.462578', NULL, NULL, false, 'FACULDADE ANHANGUERA FRANCA (FAF)', 179);
INSERT INTO public.empresa VALUES (677, true, 1, '2023-07-03 14:52:47.463784', NULL, NULL, false, 'FACULDADE ANHANGUERA ITABIRA', 161);
INSERT INTO public.empresa VALUES (678, true, 1, '2023-07-03 14:52:47.465025', NULL, NULL, false, 'FACULDADE ANHANGUERA JARAGUÁ DO SUL', 31);
INSERT INTO public.empresa VALUES (679, true, 1, '2023-07-03 14:52:47.466295', NULL, NULL, false, 'FACULDADE ANHANGUERA PITÁGORAS DE JUNDIAÍ', 182);
INSERT INTO public.empresa VALUES (680, true, 1, '2023-07-03 14:52:47.467532', NULL, NULL, false, 'FACULDADE ANHANGUERA PITÁGORAS VOTORANTIM (-)', 299);
INSERT INTO public.empresa VALUES (681, true, 1, '2023-07-03 14:52:47.468741', NULL, NULL, false, 'FACULDADE ANHANGUERA UNIDADE GUARAPARI', 266);
INSERT INTO public.empresa VALUES (682, true, 1, '2023-07-03 14:52:47.469946', NULL, NULL, false, 'FACULDADE ANHANGUERA UNIDADE PARAGOMINAS', 280);
INSERT INTO public.empresa VALUES (683, true, 1, '2023-07-03 14:52:47.471296', NULL, NULL, false, 'FACULDADE ANHANGUERA UNIDADE PARAUAPEBAS', 281);
INSERT INTO public.empresa VALUES (684, true, 1, '2023-07-03 14:52:47.472668', NULL, NULL, false, 'FACULDADE ANHANGUERA UNIME DE SALVADOR', 116);
INSERT INTO public.empresa VALUES (685, true, 1, '2023-07-03 14:52:47.473984', NULL, NULL, false, 'FACULDADE ANÍSIO TEIXEIRA DE FEIRA DE SANTANA (FAT)', 99);
INSERT INTO public.empresa VALUES (686, true, 1, '2023-07-03 14:52:47.475186', NULL, NULL, false, 'FACULDADE ANTÔNIO MENEGHETTI (AMF)', 300);
INSERT INTO public.empresa VALUES (687, true, 1, '2023-07-03 14:52:47.47644', NULL, NULL, false, 'FACULDADE APOGEU (APOGEU)', 5);
INSERT INTO public.empresa VALUES (688, true, 1, '2023-07-03 14:52:47.477629', NULL, NULL, false, 'FACULDADE ÁREA1 WYDEN (ÁREA1 WYDEN)', 116);
INSERT INTO public.empresa VALUES (689, true, 1, '2023-07-03 14:52:47.478895', NULL, NULL, false, 'FACULDADE ARIANO SUASSUNA - UNIVAS', 262);
INSERT INTO public.empresa VALUES (690, true, 1, '2023-07-03 14:52:47.480031', NULL, NULL, false, 'FACULDADE ARI DE SÁ (FAS)', 45);
INSERT INTO public.empresa VALUES (691, true, 1, '2023-07-03 14:52:47.481218', NULL, NULL, false, 'FACULDADE ARNALDO JANSSEN (FAJANSSEN)', 2);
INSERT INTO public.empresa VALUES (692, true, 1, '2023-07-03 14:52:47.482441', NULL, NULL, false, 'FACULDADE ARQUIDIOCESANA DE CURVELO (FAC)', 301);
INSERT INTO public.empresa VALUES (693, true, 1, '2023-07-03 14:52:47.483718', NULL, NULL, false, 'FACULDADE ARQUIDIOCESANA DE PIRAPORA (FAP)', 302);
INSERT INTO public.empresa VALUES (694, true, 1, '2023-07-03 14:52:47.484908', NULL, NULL, false, 'FACULDADE ASA DE BRUMADINHO (IECEMB - FAB)', 303);
INSERT INTO public.empresa VALUES (695, true, 1, '2023-07-03 14:52:47.486151', NULL, NULL, false, 'FACULDADE ASSEMBLEIANA DO BRASIL', 42);
INSERT INTO public.empresa VALUES (696, true, 1, '2023-07-03 14:52:47.487386', NULL, NULL, false, 'FACULDADE ASSIS GURGACZ (FAG TOLEDO)', 304);
INSERT INTO public.empresa VALUES (697, true, 1, '2023-07-03 14:52:47.488634', NULL, NULL, false, 'FACULDADE ASSOCIADA BRASIL (FAB)', 8);
INSERT INTO public.empresa VALUES (698, true, 1, '2023-07-03 14:52:47.489962', NULL, NULL, false, 'FACULDADE ASSOCIADA BRASIL - EAD', 8);
INSERT INTO public.empresa VALUES (699, true, 1, '2023-07-03 14:52:47.49133', NULL, NULL, false, 'FACULDADE ASTORGA (FAAST)', 305);
INSERT INTO public.empresa VALUES (700, true, 1, '2023-07-03 14:52:47.492642', NULL, NULL, false, 'FACULDADE ATAME (ATAME)', 5);
INSERT INTO public.empresa VALUES (701, true, 1, '2023-07-03 14:52:47.494076', NULL, NULL, false, 'FACULDADE ATENAS CENTRO DE MATO GROSSO', 292);
INSERT INTO public.empresa VALUES (702, true, 1, '2023-07-03 14:52:47.495431', NULL, NULL, false, 'FACULDADE ATENAS CENTRO DE MINAS', 24);
INSERT INTO public.empresa VALUES (703, true, 1, '2023-07-03 14:52:47.496755', NULL, NULL, false, 'FACULDADE ATENAS DO SUL BAIANO', 306);
INSERT INTO public.empresa VALUES (704, true, 1, '2023-07-03 14:52:47.498082', NULL, NULL, false, 'FACULDADE ATENAS PASSOS', 307);
INSERT INTO public.empresa VALUES (705, true, 1, '2023-07-03 14:52:47.499402', NULL, NULL, false, 'FACULDADE ATENAS PORTO SEGURO', 308);
INSERT INTO public.empresa VALUES (706, true, 1, '2023-07-03 14:52:47.500703', NULL, NULL, false, 'FACULDADE ATENAS SETE LAGOAS', 24);
INSERT INTO public.empresa VALUES (707, true, 1, '2023-07-03 14:52:47.502006', NULL, NULL, false, 'FACULDADE ATENAS SORRISO', 292);
INSERT INTO public.empresa VALUES (708, true, 1, '2023-07-03 14:52:47.503378', NULL, NULL, false, 'FACULDADE ATENAS SUL DE MINAS', 307);
INSERT INTO public.empresa VALUES (709, true, 1, '2023-07-03 14:52:47.504679', NULL, NULL, false, 'FACULDADE ATENAS VALENÇA', 306);
INSERT INTO public.empresa VALUES (710, true, 1, '2023-07-03 14:52:47.506155', NULL, NULL, false, 'FACULDADE ATITUDE DE EDUCAÇÃO CONTINUADA (FAEC)', 309);
INSERT INTO public.empresa VALUES (711, true, 1, '2023-07-03 14:52:47.507545', NULL, NULL, false, 'FACULDADE ATTICUS', 124);
INSERT INTO public.empresa VALUES (712, true, 1, '2023-07-03 14:52:47.508753', NULL, NULL, false, 'FACULDADE ATUALIZA (ATUALIZA)', 116);
INSERT INTO public.empresa VALUES (713, true, 1, '2023-07-03 14:52:47.509941', NULL, NULL, false, 'FACULDADE AUDEN EDUCACIONAL (FAED)', 8);
INSERT INTO public.empresa VALUES (714, true, 1, '2023-07-03 14:52:47.511238', NULL, NULL, false, 'FACULDADE AUTÔNOMA DE DIREITO (FADISP)', 8);
INSERT INTO public.empresa VALUES (715, true, 1, '2023-07-03 14:52:47.512525', NULL, NULL, false, 'FACULDADE AUTÔNOMA DO BRASIL - MACEIÓ (FBR MACEIÓ)', 73);
INSERT INTO public.empresa VALUES (716, true, 1, '2023-07-03 14:52:47.513753', NULL, NULL, false, 'FACULDADE BAHIANA DE ENGENHARIA E CIÊNCIAS SOCIAIS APLICADAS (FBE)', 116);
INSERT INTO public.empresa VALUES (717, true, 1, '2023-07-03 14:52:47.514948', NULL, NULL, false, 'FACULDADE BAIANA DE DIREITO E GESTÃO', 116);
INSERT INTO public.empresa VALUES (718, true, 1, '2023-07-03 14:52:47.516138', NULL, NULL, false, 'FACULDADE BAIANA DO SENHOR DO BONFIM (FABASB)', 246);
INSERT INTO public.empresa VALUES (719, true, 1, '2023-07-03 14:52:47.517414', NULL, NULL, false, 'FACULDADE BARÃO DE JEQUIRIÇA (FBJ DIGITAL)', 306);
INSERT INTO public.empresa VALUES (720, true, 1, '2023-07-03 14:52:47.519059', NULL, NULL, false, 'FACULDADE BARDDAL DE ARTES APLICADAS', 3);
INSERT INTO public.empresa VALUES (721, true, 1, '2023-07-03 14:52:47.520829', NULL, NULL, false, 'FACULDADE BARRETOS (FB)', 80);
INSERT INTO public.empresa VALUES (722, true, 1, '2023-07-03 14:52:47.522442', NULL, NULL, false, 'FACULDADE BARROS MELO RECIFE (UNIAESO)', 60);
INSERT INTO public.empresa VALUES (723, true, 1, '2023-07-03 14:52:47.524098', NULL, NULL, false, 'FACULDADE BATISTA BRASILEIRA (FBB)', 116);
INSERT INTO public.empresa VALUES (724, true, 1, '2023-07-03 14:52:47.525363', NULL, NULL, false, 'FACULDADE BATISTA DE MINAS GERAIS (FBMG)', 2);
INSERT INTO public.empresa VALUES (725, true, 1, '2023-07-03 14:52:47.526639', NULL, NULL, false, 'FACULDADE BATISTA DO CARIRI (FBC)', 310);
INSERT INTO public.empresa VALUES (726, true, 1, '2023-07-03 14:52:47.527966', NULL, NULL, false, 'FACULDADE BATISTA DO ESTADO DO RIO DE JANEIRO - FABERJ (FABERJ )', 160);
INSERT INTO public.empresa VALUES (727, true, 1, '2023-07-03 14:52:47.529171', NULL, NULL, false, 'FACULDADE BATISTA DO RIO DE JANEIRO (FABAT)', 12);
INSERT INTO public.empresa VALUES (728, true, 1, '2023-07-03 14:52:47.530382', NULL, NULL, false, 'FACULDADE BATISTA PIONEIRA', 311);
INSERT INTO public.empresa VALUES (729, true, 1, '2023-07-03 14:52:47.531595', NULL, NULL, false, 'FACULDADE BELA VISTA (FBV)', 8);
INSERT INTO public.empresa VALUES (730, true, 1, '2023-07-03 14:52:47.532798', NULL, NULL, false, 'FACULDADE BEM TE VI LTDA (FAC-BTV)', 56);
INSERT INTO public.empresa VALUES (731, true, 1, '2023-07-03 14:52:47.534014', NULL, NULL, false, 'FACULDADE BERTIOGA (FABE)', 312);
INSERT INTO public.empresa VALUES (732, true, 1, '2023-07-03 14:52:47.535265', NULL, NULL, false, 'FACULDADE BEZERRA DE ARAÚJO (FABA)', 12);
INSERT INTO public.empresa VALUES (733, true, 1, '2023-07-03 14:52:47.536537', NULL, NULL, false, 'FACULDADE BILAC DE SÃO JOSÉ DOS CAMPOS (BILAC)', 144);
INSERT INTO public.empresa VALUES (734, true, 1, '2023-07-03 14:52:47.537867', NULL, NULL, false, 'FACULDADE BIOPARK', 304);
INSERT INTO public.empresa VALUES (735, true, 1, '2023-07-03 14:52:47.539117', NULL, NULL, false, 'FACULDADE BIOPARK II (BIOPARK II)', 304);
INSERT INTO public.empresa VALUES (736, true, 1, '2023-07-03 14:52:47.540426', NULL, NULL, false, 'FACULDADE BIRIGUI (FABI)', 313);
INSERT INTO public.empresa VALUES (737, true, 1, '2023-07-03 14:52:47.541715', NULL, NULL, false, 'FACULDADE BOA ESPERANÇA (FABECA)', 314);
INSERT INTO public.empresa VALUES (738, true, 1, '2023-07-03 14:52:47.543045', NULL, NULL, false, 'FACULDADE BOAS NOVAS DE CIÊNCIAS TEOLÓGICAS, SOCIAIS E BIOTECNOLÓGICAS (FBNCTSB)', 75);
INSERT INTO public.empresa VALUES (739, true, 1, '2023-07-03 14:52:47.544324', NULL, NULL, false, 'FACULDADE BOOKPLAY', 10);
INSERT INTO public.empresa VALUES (740, true, 1, '2023-07-03 14:52:47.545661', NULL, NULL, false, 'FACULDADE BORGES DE MENDONÇA (FBM)', 3);
INSERT INTO public.empresa VALUES (741, true, 1, '2023-07-03 14:52:47.546979', NULL, NULL, false, 'FACULDADE BRASILEIRA CRISTÃ (FBC)', 290);
INSERT INTO public.empresa VALUES (742, true, 1, '2023-07-03 14:52:47.548267', NULL, NULL, false, 'FACULDADE BRASILEIRA DE CACHOEIRO', 190);
INSERT INTO public.empresa VALUES (743, true, 1, '2023-07-03 14:52:47.549526', NULL, NULL, false, 'FACULDADE BRASILEIRA DE EDUCAÇÃO E CULTURA (FABEC BRASIL)', 42);
INSERT INTO public.empresa VALUES (744, true, 1, '2023-07-03 14:52:47.550882', NULL, NULL, false, 'FACULDADE BRASILEIRA DE ENSINO, PESQUISA E EXTENSÃO (FABEX)', 107);
INSERT INTO public.empresa VALUES (745, true, 1, '2023-07-03 14:52:47.552122', NULL, NULL, false, 'FACULDADE BRASILEIRA DE ESTUDOS AVANÇADOS (FABEA)', 141);
INSERT INTO public.empresa VALUES (746, true, 1, '2023-07-03 14:52:47.55339', NULL, NULL, false, 'FACULDADE BRASILEIRA DE INOVAÇÃO (FABIN)', 149);
INSERT INTO public.empresa VALUES (747, true, 1, '2023-07-03 14:52:47.554586', NULL, NULL, false, 'FACULDADE BRASILEIRA DE NEGÓCIOS INOVADORES (FABRANI)', 315);
INSERT INTO public.empresa VALUES (748, true, 1, '2023-07-03 14:52:47.555719', NULL, NULL, false, 'FACULDADE BRASILEIRA DE TECNOLOGIA (FBT)', 99);
INSERT INTO public.empresa VALUES (749, true, 1, '2023-07-03 14:52:47.556865', NULL, NULL, false, 'FACULDADE BRASILEIRA DE TRIBUTAÇÃO (FBT)', 149);
INSERT INTO public.empresa VALUES (750, true, 1, '2023-07-03 14:52:47.558023', NULL, NULL, false, 'FACULDADE BRASILEIRA DIGITAL (FABRADI)', 8);
INSERT INTO public.empresa VALUES (751, true, 1, '2023-07-03 14:52:47.55919', NULL, NULL, false, 'FACULDADE BRASILEIRA DO RECÔNCAVO (FBBR)', 172);
INSERT INTO public.empresa VALUES (752, true, 1, '2023-07-03 14:52:47.560334', NULL, NULL, false, 'FACULDADE BRASIL EMPREENDER (FABEMP)', 134);
INSERT INTO public.empresa VALUES (753, true, 1, '2023-07-03 14:52:47.561469', NULL, NULL, false, 'FACULDADE BRASÍLIA (FBR)', 5);
INSERT INTO public.empresa VALUES (754, true, 1, '2023-07-03 14:52:47.5627', NULL, NULL, false, 'FACULDADE BRASIL NORTE (FABRAN)', 26);
INSERT INTO public.empresa VALUES (755, true, 1, '2023-07-03 14:52:47.563855', NULL, NULL, false, 'FACULDADE BRAVIUM (BRAVIUM)', 297);
INSERT INTO public.empresa VALUES (756, true, 1, '2023-07-03 14:52:47.565104', NULL, NULL, false, 'FACULDADE BSSP', 42);
INSERT INTO public.empresa VALUES (757, true, 1, '2023-07-03 14:52:47.566341', NULL, NULL, false, 'FACULDADE CALAFIORI (CALAFIORI)', 316);
INSERT INTO public.empresa VALUES (758, true, 1, '2023-07-03 14:52:47.567547', NULL, NULL, false, 'FACULDADE CAL DE ARTES CÊNICAS (FACULDADE CAL)', 12);
INSERT INTO public.empresa VALUES (759, true, 1, '2023-07-03 14:52:47.568717', NULL, NULL, false, 'FACULDADE CAMAQÜENSE DE CIÊNCIAS CONTÁBEIS E ADMINISTRATIVAS (FACCCA)', 317);
INSERT INTO public.empresa VALUES (760, true, 1, '2023-07-03 14:52:47.57016', NULL, NULL, false, 'FACULDADE CAMPOS BELOS (UNICAMPO)', 318);
INSERT INTO public.empresa VALUES (761, true, 1, '2023-07-03 14:52:47.571639', NULL, NULL, false, 'FACULDADE CAMPOS ELÍSEOS (FCE)', 8);
INSERT INTO public.empresa VALUES (762, true, 1, '2023-07-03 14:52:47.572897', NULL, NULL, false, 'FACULDADE CANADENSES NO BRASIL', 65);
INSERT INTO public.empresa VALUES (763, true, 1, '2023-07-03 14:52:47.574207', NULL, NULL, false, 'FACULDADE CANÇÃO NOVA (FCN)', 319);
INSERT INTO public.empresa VALUES (764, true, 1, '2023-07-03 14:52:47.575461', NULL, NULL, false, 'FACULDADE CÂNDIDO RONDON (FCR)', 203);
INSERT INTO public.empresa VALUES (765, true, 1, '2023-07-03 14:52:47.576672', NULL, NULL, false, 'FACULDADE CAPACITAR', 86);
INSERT INTO public.empresa VALUES (766, true, 1, '2023-07-03 14:52:47.577933', NULL, NULL, false, 'FACULDADE CASA BRANCA (FACAB)', 320);
INSERT INTO public.empresa VALUES (767, true, 1, '2023-07-03 14:52:47.579118', NULL, NULL, false, 'FACULDADE CASA DO ESTUDANTE (FACE)', 321);
INSERT INTO public.empresa VALUES (768, true, 1, '2023-07-03 14:52:47.580322', NULL, NULL, false, 'FACULDADE CÁSPER LÍBERO (FCL)', 8);
INSERT INTO public.empresa VALUES (769, true, 1, '2023-07-03 14:52:47.581585', NULL, NULL, false, 'FACULDADE CASTRO ALVES (FCA)', 116);
INSERT INTO public.empresa VALUES (770, true, 1, '2023-07-03 14:52:47.582951', NULL, NULL, false, 'FACULDADE CATHEDRAL (FACES)', 138);
INSERT INTO public.empresa VALUES (771, true, 1, '2023-07-03 14:52:47.584186', NULL, NULL, false, 'FACULDADE CATÓLICA CAVANIS DO SUDOESTE DO PARÁ (FCCSPA)', 322);
INSERT INTO public.empresa VALUES (772, true, 1, '2023-07-03 14:52:47.585435', NULL, NULL, false, 'FACULDADE CATÓLICA DA PARAÍBA', 189);
INSERT INTO public.empresa VALUES (773, true, 1, '2023-07-03 14:52:47.586634', NULL, NULL, false, 'FACULDADE CATÓLICA DE ABAETETUBA (FCAB)', 227);
INSERT INTO public.empresa VALUES (774, true, 1, '2023-07-03 14:52:47.587871', NULL, NULL, false, 'FACULDADE CATÓLICA DE ANÁPOLIS (CATÓLICA DE ANÁPOLIS)', 264);
INSERT INTO public.empresa VALUES (775, true, 1, '2023-07-03 14:52:47.589076', NULL, NULL, false, 'FACULDADE CATÓLICA DE BELÉM (FACBEL)', 232);
INSERT INTO public.empresa VALUES (776, true, 1, '2023-07-03 14:52:47.590273', NULL, NULL, false, 'FACULDADE CATÓLICA DE FEIRA DE SANTANA', 99);
INSERT INTO public.empresa VALUES (777, true, 1, '2023-07-03 14:52:47.59148', NULL, NULL, false, 'FACULDADE CATÓLICA DE FORTALEZA (FCF)', 45);
INSERT INTO public.empresa VALUES (778, true, 1, '2023-07-03 14:52:47.592712', NULL, NULL, false, 'FACULDADE CATÓLICA DE MATO GROSSO (FACC-MT)', 121);
INSERT INTO public.empresa VALUES (779, true, 1, '2023-07-03 14:52:47.593876', NULL, NULL, false, 'FACULDADE CATÓLICA DE POUSO ALEGRE (FACAPA)', 230);
INSERT INTO public.empresa VALUES (780, true, 1, '2023-07-03 14:52:47.595043', NULL, NULL, false, 'FACULDADE CATÓLICA DE RONDONIA (FCR)', 51);
INSERT INTO public.empresa VALUES (781, true, 1, '2023-07-03 14:52:47.596182', NULL, NULL, false, 'FACULDADE CATÓLICA DE SANTA CATARINA (FACASC)', 3);
INSERT INTO public.empresa VALUES (782, true, 1, '2023-07-03 14:52:47.597399', NULL, NULL, false, 'FACULDADE CATÓLICA DE SÃO JOSÉ DOS CAMPOS (CATÓLICA-SJC)', 144);
INSERT INTO public.empresa VALUES (783, true, 1, '2023-07-03 14:52:47.598563', NULL, NULL, false, 'FACULDADE CATÓLICA DE VÁRZEA GRANDE (FACC-VG)', 121);
INSERT INTO public.empresa VALUES (784, true, 1, '2023-07-03 14:52:47.599718', NULL, NULL, false, 'FACULDADE CATÓLICA DOM ORIONE (FACDO)', 196);
INSERT INTO public.empresa VALUES (785, true, 1, '2023-07-03 14:52:47.600869', NULL, NULL, false, 'FACULDADE CATÓLICA DO RIO GRANDE DO NORTE', 323);
INSERT INTO public.empresa VALUES (786, true, 1, '2023-07-03 14:52:47.602168', NULL, NULL, false, 'FACULDADE CATÓLICA IMACULADA CONCEIÇÃO DO RECIFE (CATÓLICA)', 60);
INSERT INTO public.empresa VALUES (787, true, 1, '2023-07-03 14:52:47.603431', NULL, NULL, false, 'FACULDADE CATÓLICA PAULISTA (FACAP)', 145);
INSERT INTO public.empresa VALUES (788, true, 1, '2023-07-03 14:52:47.604696', NULL, NULL, false, 'FACULDADE CATÓLICA RAINHA DA PAZ DE ARAPUTANGA (FCARP)', 324);
INSERT INTO public.empresa VALUES (789, true, 1, '2023-07-03 14:52:47.605927', NULL, NULL, false, 'FACULDADE CATÓLICA SALESIANA DE MACAÉ (FCSMA)', 325);
INSERT INTO public.empresa VALUES (790, true, 1, '2023-07-03 14:52:47.607205', NULL, NULL, false, 'FACULDADE CATÓLICA SANTA TERESINHA (FCST)', 326);
INSERT INTO public.empresa VALUES (791, true, 1, '2023-07-03 14:52:47.608374', NULL, NULL, false, 'FACULDADE CATUAÍ (ICES)', 327);
INSERT INTO public.empresa VALUES (792, true, 1, '2023-07-03 14:52:47.609903', NULL, NULL, false, 'FACULDADE CCI (FAC CCI)', 5);
INSERT INTO public.empresa VALUES (793, true, 1, '2023-07-03 14:52:47.611506', NULL, NULL, false, 'FACULDADE CDL', 45);
INSERT INTO public.empresa VALUES (794, true, 1, '2023-07-03 14:52:47.613105', NULL, NULL, false, 'FACULDADE CEAFI', 42);
INSERT INTO public.empresa VALUES (795, true, 1, '2023-07-03 14:52:47.614696', NULL, NULL, false, 'FACULDADE CEAM (CEAM)', 60);
INSERT INTO public.empresa VALUES (796, true, 1, '2023-07-03 14:52:47.61587', NULL, NULL, false, 'FACULDADE CEARENSE (FAC)', 45);
INSERT INTO public.empresa VALUES (797, true, 1, '2023-07-03 14:52:47.617073', NULL, NULL, false, 'FACULDADE CECAPE', 135);
INSERT INTO public.empresa VALUES (798, true, 1, '2023-07-03 14:52:47.618329', NULL, NULL, false, 'FACULDADE CEDIN (CEDIN)', 2);
INSERT INTO public.empresa VALUES (799, true, 1, '2023-07-03 14:52:47.619547', NULL, NULL, false, 'FACULDADE CENBRAP (CENBRAP)', 42);
INSERT INTO public.empresa VALUES (800, true, 1, '2023-07-03 14:52:47.620763', NULL, NULL, false, 'FACULDADE CENECISTA DE CAPIVARI (FACECAP)', 328);
INSERT INTO public.empresa VALUES (801, true, 1, '2023-07-03 14:52:47.621979', NULL, NULL, false, 'FACULDADE CENECISTA DE RIO BONITO (FACERB)', 329);
INSERT INTO public.empresa VALUES (802, true, 1, '2023-07-03 14:52:47.623252', NULL, NULL, false, 'FACULDADE CENECISTA DE SETE LAGOAS (FCSL)', 24);
INSERT INTO public.empresa VALUES (803, true, 1, '2023-07-03 14:52:47.624485', NULL, NULL, false, 'FACULDADE CENSUPEG', 68);
INSERT INTO public.empresa VALUES (804, true, 1, '2023-07-03 14:52:47.625648', NULL, NULL, false, 'FACULDADE CENTRAL DE CRISTALINA (FACEC)', 330);
INSERT INTO public.empresa VALUES (805, true, 1, '2023-07-03 14:52:47.6269', NULL, NULL, false, 'FACULDADE CENTRAL DO RECIFE CENTRO (FACENTRAL REC)', 60);
INSERT INTO public.empresa VALUES (806, true, 1, '2023-07-03 14:52:47.62824', NULL, NULL, false, 'FACULDADE CENTRO MATO-GROSSENSE', 292);
INSERT INTO public.empresa VALUES (807, true, 1, '2023-07-03 14:52:47.629481', NULL, NULL, false, 'FACULDADE CENTRO OESTE CATANDUVAS (FACOC)', 331);
INSERT INTO public.empresa VALUES (808, true, 1, '2023-07-03 14:52:47.630639', NULL, NULL, false, 'FACULDADE CENTRO PAULISTANO', 8);
INSERT INTO public.empresa VALUES (809, true, 1, '2023-07-03 14:52:47.631751', NULL, NULL, false, 'FACULDADE CENTRO SÃO PAULO (FACESP)', 8);
INSERT INTO public.empresa VALUES (810, true, 1, '2023-07-03 14:52:47.633055', NULL, NULL, false, 'FACULDADE CENTRO SUL', 332);
INSERT INTO public.empresa VALUES (811, true, 1, '2023-07-03 14:52:47.63435', NULL, NULL, false, 'FACULDADE CEPEP', 45);
INSERT INTO public.empresa VALUES (812, true, 1, '2023-07-03 14:52:47.635525', NULL, NULL, false, 'FACULDADE CERES (FACERES)', 114);
INSERT INTO public.empresa VALUES (813, true, 1, '2023-07-03 14:52:47.636714', NULL, NULL, false, 'FACULDADE CERRADO (FACE)', 5);
INSERT INTO public.empresa VALUES (814, true, 1, '2023-07-03 14:52:47.637904', NULL, NULL, false, 'FACULDADE CERS (CERS)', 60);
INSERT INTO public.empresa VALUES (815, true, 1, '2023-07-03 14:52:47.639258', NULL, NULL, false, 'FACULDADE CESAR (FCE)', 60);
INSERT INTO public.empresa VALUES (816, true, 1, '2023-07-03 14:52:47.640475', NULL, NULL, false, 'FACULDADE CESGRANRIO (FACESGRANRIO)', 12);
INSERT INTO public.empresa VALUES (817, true, 1, '2023-07-03 14:52:47.64169', NULL, NULL, false, 'FACULDADE CESMAC DO AGRESTE (CESMAC AGRESTE)', 333);
INSERT INTO public.empresa VALUES (818, true, 1, '2023-07-03 14:52:47.642897', NULL, NULL, false, 'FACULDADE CESMAC DO SERTÃO (CESMAC SERTÃO)', 334);
INSERT INTO public.empresa VALUES (819, true, 1, '2023-07-03 14:52:47.644043', NULL, NULL, false, 'FACULDADE CESMA DE MARACANAÚ (FACESMA)', 335);
INSERT INTO public.empresa VALUES (820, true, 1, '2023-07-03 14:52:47.64522', NULL, NULL, false, 'FACULDADE CESPU EUROPA BRASIL (FACCE)', 132);
INSERT INTO public.empresa VALUES (821, true, 1, '2023-07-03 14:52:47.646356', NULL, NULL, false, 'FACULDADE CESUMAR DE CAMPO GRANDE (FACCESUMAR)', 48);
INSERT INTO public.empresa VALUES (822, true, 1, '2023-07-03 14:52:47.647541', NULL, NULL, false, 'FACULDADE CESUMAR DE GUARAPUAVA (FAC-CESUMAR)', 64);
INSERT INTO public.empresa VALUES (823, true, 1, '2023-07-03 14:52:47.648834', NULL, NULL, false, 'FACULDADE CESUMAR DE LONDRINA (FAC-CESUMAR)', 159);
INSERT INTO public.empresa VALUES (824, true, 1, '2023-07-03 14:52:47.65009', NULL, NULL, false, 'FACULDADE CESUMAR DE PONTA GROSSA (FAC-CESUMAR)', 188);
INSERT INTO public.empresa VALUES (825, true, 1, '2023-07-03 14:52:47.651349', NULL, NULL, false, 'FACULDADE CESURG MARAU', 336);
INSERT INTO public.empresa VALUES (826, true, 1, '2023-07-03 14:52:47.652665', NULL, NULL, false, 'FACULDADE CESUSC', 3);
INSERT INTO public.empresa VALUES (827, true, 1, '2023-07-03 14:52:47.654039', NULL, NULL, false, 'FACULDADE CETRUS SANAR (CETRUS)', 8);
INSERT INTO public.empresa VALUES (828, true, 1, '2023-07-03 14:52:47.655338', NULL, NULL, false, 'FACULDADE CGESP GOIANIA (FAC CGESP)', 42);
INSERT INTO public.empresa VALUES (829, true, 1, '2023-07-03 14:52:47.656581', NULL, NULL, false, 'FACULDADE CHRISTUS (CHRISTUS EUSÉBIO)', 337);
INSERT INTO public.empresa VALUES (830, true, 1, '2023-07-03 14:52:47.657827', NULL, NULL, false, 'FACULDADE CIDADE DE APARECIDA DE GOIÂNIA (FACCIDADE)', 41);
INSERT INTO public.empresa VALUES (831, true, 1, '2023-07-03 14:52:47.659018', NULL, NULL, false, 'FACULDADE CIDADE DE COROMANDEL (FCC)', 338);
INSERT INTO public.empresa VALUES (832, true, 1, '2023-07-03 14:52:47.660183', NULL, NULL, false, 'FACULDADE CIDADE DE JOÃO PINHEIRO (FCJP)', 339);
INSERT INTO public.empresa VALUES (833, true, 1, '2023-07-03 14:52:47.661358', NULL, NULL, false, 'FACULDADE CIDADE DE PATOS DE MINAS (FPM)', 112);
INSERT INTO public.empresa VALUES (834, true, 1, '2023-07-03 14:52:47.662567', NULL, NULL, false, 'FACULDADE CIDADE LUZ (FACILUZ)', 340);
INSERT INTO public.empresa VALUES (835, true, 1, '2023-07-03 14:52:47.663807', NULL, NULL, false, 'FACULDADE CIDADE TEOLÓGICA PENTECOSTAL (FCTP)', 45);
INSERT INTO public.empresa VALUES (836, true, 1, '2023-07-03 14:52:47.665017', NULL, NULL, false, 'FACULDADE CIÊNCIAS DA VIDA (FCV)', 24);
INSERT INTO public.empresa VALUES (837, true, 1, '2023-07-03 14:52:47.666182', NULL, NULL, false, 'FACULDADE CLARETIANA DE BRASILIA (FCB)', 5);
INSERT INTO public.empresa VALUES (838, true, 1, '2023-07-03 14:52:47.667405', NULL, NULL, false, 'FACULDADE CLARETIANA DE TEOLOGIA', 56);
INSERT INTO public.empresa VALUES (839, true, 1, '2023-07-03 14:52:47.668657', NULL, NULL, false, 'FACULDADE CLEBER LEITE (FCL)', 47);
INSERT INTO public.empresa VALUES (840, true, 1, '2023-07-03 14:52:47.669913', NULL, NULL, false, 'FACULDADE CLEBER LEITE - EAD (FCL - EAD)', 47);
INSERT INTO public.empresa VALUES (841, true, 1, '2023-07-03 14:52:47.671086', NULL, NULL, false, 'FACULDADE CMB (CMB)', 149);
INSERT INTO public.empresa VALUES (842, true, 1, '2023-07-03 14:52:47.672284', NULL, NULL, false, 'FACULDADE CNEC ALBERTO TORRES', 341);
INSERT INTO public.empresa VALUES (843, true, 1, '2023-07-03 14:52:47.673497', NULL, NULL, false, 'FACULDADE CNEC CAMPO LARGO', 342);
INSERT INTO public.empresa VALUES (844, true, 1, '2023-07-03 14:52:47.674698', NULL, NULL, false, 'FACULDADE CNEC CAPITÃO LEMOS CUNHA', 12);
INSERT INTO public.empresa VALUES (845, true, 1, '2023-07-03 14:52:47.675943', NULL, NULL, false, 'FACULDADE CNEC DE EDUCAÇÃO DE UBERABA (FACEUB)', 118);
INSERT INTO public.empresa VALUES (846, true, 1, '2023-07-03 14:52:47.677242', NULL, NULL, false, 'FACULDADE CNEC FARROUPILHA', 343);
INSERT INTO public.empresa VALUES (847, true, 1, '2023-07-03 14:52:47.678484', NULL, NULL, false, 'FACULDADE CNEC GRAVATAÍ', 344);
INSERT INTO public.empresa VALUES (848, true, 1, '2023-07-03 14:52:47.679636', NULL, NULL, false, 'FACULDADE CNEC ITAJAÍ', 345);
INSERT INTO public.empresa VALUES (849, true, 1, '2023-07-03 14:52:47.680811', NULL, NULL, false, 'FACULDADE CNEC JOINVILLE', 68);
INSERT INTO public.empresa VALUES (850, true, 1, '2023-07-03 14:52:47.68205', NULL, NULL, false, 'FACULDADE CNEC NOVA PETRÓPOLIS', 346);
INSERT INTO public.empresa VALUES (851, true, 1, '2023-07-03 14:52:47.683261', NULL, NULL, false, 'FACULDADE CNEC RIO DAS OSTRAS', 347);
INSERT INTO public.empresa VALUES (852, true, 1, '2023-07-03 14:52:47.684505', NULL, NULL, false, 'FACULDADE CNEC SANTO ÂNGELO', 348);
INSERT INTO public.empresa VALUES (853, true, 1, '2023-07-03 14:52:47.68567', NULL, NULL, false, 'FACULDADE CNEC UNAÍ', 349);
INSERT INTO public.empresa VALUES (854, true, 1, '2023-07-03 14:52:47.686908', NULL, NULL, false, 'FACULDADE CNEC VARGINHA', 133);
INSERT INTO public.empresa VALUES (855, true, 1, '2023-07-03 14:52:47.688124', NULL, NULL, false, 'FACULDADE COELHO NETO (FACNET)', 267);
INSERT INTO public.empresa VALUES (856, true, 1, '2023-07-03 14:52:47.689302', NULL, NULL, false, 'FACULDADE COGNITIVO (COGNITIVO)', 3);
INSERT INTO public.empresa VALUES (857, true, 1, '2023-07-03 14:52:47.690578', NULL, NULL, false, 'FACULDADE CONCEITO EDUCACIONAL (FACCON)', 15);
INSERT INTO public.empresa VALUES (858, true, 1, '2023-07-03 14:52:47.691873', NULL, NULL, false, 'FACULDADE CONCÓRDIA (FACC)', 350);
INSERT INTO public.empresa VALUES (859, true, 1, '2023-07-03 14:52:47.693242', NULL, NULL, false, 'FACULDADE CONECTADA FACONNECT (FACONNECT)', 351);
INSERT INTO public.empresa VALUES (860, true, 1, '2023-07-03 14:52:47.69452', NULL, NULL, false, 'FACULDADE CONEXÃO (CONEXÃO)', 352);
INSERT INTO public.empresa VALUES (861, true, 1, '2023-07-03 14:52:47.695758', NULL, NULL, false, 'FACULDADE CONHECIMENTO & CIÊNCIA (FCC)', 79);
INSERT INTO public.empresa VALUES (862, true, 1, '2023-07-03 14:52:47.697051', NULL, NULL, false, 'FACULDADE COSMOPOLITA', 79);
INSERT INTO public.empresa VALUES (863, true, 1, '2023-07-03 14:52:47.698536', NULL, NULL, false, 'FACULDADE COTEMIG (COTEMIG)', 2);
INSERT INTO public.empresa VALUES (864, true, 1, '2023-07-03 14:52:47.700275', NULL, NULL, false, 'FACULDADE CRISTÃ DA CIDADE (FCC)', 144);
INSERT INTO public.empresa VALUES (865, true, 1, '2023-07-03 14:52:47.701991', NULL, NULL, false, 'FACULDADE CRISTÃ DE CURITIBA (FCC)', 56);
INSERT INTO public.empresa VALUES (866, true, 1, '2023-07-03 14:52:47.703761', NULL, NULL, false, 'FACULDADE CRISTO REI (FACCREI)', 353);
INSERT INTO public.empresa VALUES (867, true, 1, '2023-07-03 14:52:47.705435', NULL, NULL, false, 'FACULDADE CTA (CTA)', 8);
INSERT INTO public.empresa VALUES (868, true, 1, '2023-07-03 14:52:47.706723', NULL, NULL, false, 'FACULDADE CUIABÁ (FAUC)', 203);
INSERT INTO public.empresa VALUES (869, true, 1, '2023-07-03 14:52:47.708141', NULL, NULL, false, 'FACULDADE CULTURA INGLESA (FCI)', 8);
INSERT INTO public.empresa VALUES (870, true, 1, '2023-07-03 14:52:47.709437', NULL, NULL, false, 'FACULDADE CURITIBANA (FAC)', 56);
INSERT INTO public.empresa VALUES (871, true, 1, '2023-07-03 14:52:47.710674', NULL, NULL, false, 'FACULDADE DA ALTA PAULISTA (FAP)', 354);
INSERT INTO public.empresa VALUES (872, true, 1, '2023-07-03 14:52:47.711888', NULL, NULL, false, 'FACULDADE DA AMAZÔNIA (FAMA)', 355);
INSERT INTO public.empresa VALUES (873, true, 1, '2023-07-03 14:52:47.713195', NULL, NULL, false, 'FACULDADE DA AMAZÔNIA (FAAM)', 232);
INSERT INTO public.empresa VALUES (874, true, 1, '2023-07-03 14:52:47.714481', NULL, NULL, false, 'FACULDADE DA AMAZÔNIA DE PORTO VELHO', 51);
INSERT INTO public.empresa VALUES (875, true, 1, '2023-07-03 14:52:47.715758', NULL, NULL, false, 'FACULDADE DA AMAZÔNIA LEGAL (FAMA)', 356);
INSERT INTO public.empresa VALUES (876, true, 1, '2023-07-03 14:52:47.717007', NULL, NULL, false, 'FACULDADE DA ASSOCIAÇÃO BRASILIENSE DE EDUCAÇÃO (FABE)', 336);
INSERT INTO public.empresa VALUES (877, true, 1, '2023-07-03 14:52:47.718302', NULL, NULL, false, 'FACULDADE DA ASSOCIAÇÃO MÉDICA PAULISTA (APM)', 8);
INSERT INTO public.empresa VALUES (878, true, 1, '2023-07-03 14:52:47.719529', NULL, NULL, false, 'FACULDADE DA CIDADE DE MACEIÓ (FACIMA)', 73);
INSERT INTO public.empresa VALUES (879, true, 1, '2023-07-03 14:52:47.720798', NULL, NULL, false, 'FACULDADE DA CONSTRUÇÃO E DO TRABALHO (FACT)', 8);
INSERT INTO public.empresa VALUES (880, true, 1, '2023-07-03 14:52:47.72197', NULL, NULL, false, 'FACULDADE DA ESCADA (FAESC)', 357);
INSERT INTO public.empresa VALUES (881, true, 1, '2023-07-03 14:52:47.72316', NULL, NULL, false, 'FACULDADE DA FRATERNIDADE DE VALENÇA (FFV)', 306);
INSERT INTO public.empresa VALUES (882, true, 1, '2023-07-03 14:52:47.724368', NULL, NULL, false, 'FACULDADE DA FUNDAÇÃO EDUCACIONAL ARAÇATUBA (FAC-FEA)', 197);
INSERT INTO public.empresa VALUES (883, true, 1, '2023-07-03 14:52:47.725569', NULL, NULL, false, 'FACULDADE DAMA', 358);
INSERT INTO public.empresa VALUES (884, true, 1, '2023-07-03 14:52:47.726749', NULL, NULL, false, 'FACULDADE DAMAS DA INSTRUÇÃO CRISTÃ (FADIC)', 60);
INSERT INTO public.empresa VALUES (885, true, 1, '2023-07-03 14:52:47.727963', NULL, NULL, false, 'FACULDADE DAMÁSIO (DAMASIO)', 8);
INSERT INTO public.empresa VALUES (886, true, 1, '2023-07-03 14:52:47.729237', NULL, NULL, false, 'FACULDADE DAMÁSIO EDUCACIONAL (FDE)', 8);
INSERT INTO public.empresa VALUES (887, true, 1, '2023-07-03 14:52:47.730551', NULL, NULL, false, 'FACULDADE DA POLÍCIA MILITAR (FPM)', 42);
INSERT INTO public.empresa VALUES (888, true, 1, '2023-07-03 14:52:47.731817', NULL, NULL, false, 'FACULDADE DA POLÍCIA MILITAR DE SANTA CATARINA (FAPOM)', 3);
INSERT INTO public.empresa VALUES (889, true, 1, '2023-07-03 14:52:47.733066', NULL, NULL, false, 'FACULDADE DA REGIÃO DOS LAGOS (FERLAGOS)', 359);
INSERT INTO public.empresa VALUES (890, true, 1, '2023-07-03 14:52:47.734356', NULL, NULL, false, 'FACULDADE DA REGIÃO SERRANA (FARESE)', 360);
INSERT INTO public.empresa VALUES (891, true, 1, '2023-07-03 14:52:47.735717', NULL, NULL, false, 'FACULDADE DA REGIÃO SISALEIRA (FARESI)', 361);
INSERT INTO public.empresa VALUES (892, true, 1, '2023-07-03 14:52:47.737003', NULL, NULL, false, 'FACULDADE DAS ATIVIDADES EMPRESARIAIS DE TERESINA (FAETE)', 27);
INSERT INTO public.empresa VALUES (893, true, 1, '2023-07-03 14:52:47.738269', NULL, NULL, false, 'FACULDADE DA SAÚDE E ECOLOGIA HUMANA (FASEH)', 362);
INSERT INTO public.empresa VALUES (894, true, 1, '2023-07-03 14:52:47.739562', NULL, NULL, false, 'FACULDADE DA SERRA GAÚCHA DE BENTO GONÇALVES', 77);
INSERT INTO public.empresa VALUES (895, true, 1, '2023-07-03 14:52:47.740836', NULL, NULL, false, 'FACULDADE DA SEUNE (SEUNE)', 73);
INSERT INTO public.empresa VALUES (896, true, 1, '2023-07-03 14:52:47.742039', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO CIÊNCIAS ECON E CONTÁBEIS DE GUARATINGUETÁ (FACEAG)', 363);
INSERT INTO public.empresa VALUES (897, true, 1, '2023-07-03 14:52:47.743313', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO, COMÉRCIO E EMPREENDEDORISMO (FACEM)', 364);
INSERT INTO public.empresa VALUES (898, true, 1, '2023-07-03 14:52:47.744594', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE CAMPO BELO (FACAMP)', 365);
INSERT INTO public.empresa VALUES (899, true, 1, '2023-07-03 14:52:47.745783', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE CATAGUASES (UNIPACAT)', 366);
INSERT INTO public.empresa VALUES (900, true, 1, '2023-07-03 14:52:47.746971', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE CHAPADÃO DO SUL (FACHASUL)', 367);
INSERT INTO public.empresa VALUES (901, true, 1, '2023-07-03 14:52:47.74818', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE FÁTIMA DO SUL (FAFS)', 368);
INSERT INTO public.empresa VALUES (902, true, 1, '2023-07-03 14:52:47.749426', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE ITABIRITO (FAI)', 261);
INSERT INTO public.empresa VALUES (903, true, 1, '2023-07-03 14:52:47.750791', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE MARIANA (FAMA)', 238);
INSERT INTO public.empresa VALUES (904, true, 1, '2023-07-03 14:52:47.752086', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE NOVA ANDRADINA - FANOVA (FANOVA)', 369);
INSERT INTO public.empresa VALUES (905, true, 1, '2023-07-03 14:52:47.753518', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO DE SANTA CRUZ DO RIO PARDO (FASC)', 370);
INSERT INTO public.empresa VALUES (906, true, 1, '2023-07-03 14:52:47.754814', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO E ARTES DE LIMEIRA (FAAL)', 276);
INSERT INTO public.empresa VALUES (907, true, 1, '2023-07-03 14:52:47.75597', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO E NEGÓCIOS (FAN)', 73);
INSERT INTO public.empresa VALUES (908, true, 1, '2023-07-03 14:52:47.757142', NULL, NULL, false, 'FACULDADE DE ADMINISTRAÇÃO E NEGÓCIOS DE SERGIPE (FANESE)', 142);
INSERT INTO public.empresa VALUES (909, true, 1, '2023-07-03 14:52:47.758303', NULL, NULL, false, 'FACULDADE DE AGRONEGÓCIOS DE HOLAMBRA (FAAGROH)', 371);
INSERT INTO public.empresa VALUES (910, true, 1, '2023-07-03 14:52:47.759556', NULL, NULL, false, 'FACULDADE DE AGRONOMIA UNA DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (911, true, 1, '2023-07-03 14:52:47.760802', NULL, NULL, false, 'FACULDADE DE AGRONOMIA UNA DE ITUMBIARA', 234);
INSERT INTO public.empresa VALUES (912, true, 1, '2023-07-03 14:52:47.761945', NULL, NULL, false, 'FACULDADE DE AGUDOS (FAAG)', 372);
INSERT INTO public.empresa VALUES (913, true, 1, '2023-07-03 14:52:47.763085', NULL, NULL, false, 'FACULDADE DE ALTA FLORESTA (FAF)', 373);
INSERT INTO public.empresa VALUES (914, true, 1, '2023-07-03 14:52:47.764285', NULL, NULL, false, 'FACULDADE DE AMAMBAI (FIAMA)', 374);
INSERT INTO public.empresa VALUES (915, true, 1, '2023-07-03 14:52:47.765498', NULL, NULL, false, 'FACULDADE DE AMERICANA (FAM)', 187);
INSERT INTO public.empresa VALUES (916, true, 1, '2023-07-03 14:52:47.766709', NULL, NULL, false, 'FACULDADE DE AMPÉRE (FAMPER)', 375);
INSERT INTO public.empresa VALUES (917, true, 1, '2023-07-03 14:52:47.767887', NULL, NULL, false, 'FACULDADE DE ANICUNS (FA)', 376);
INSERT INTO public.empresa VALUES (918, true, 1, '2023-07-03 14:52:47.769066', NULL, NULL, false, 'FACULDADE DE APUCARANA (FAP)', 377);
INSERT INTO public.empresa VALUES (919, true, 1, '2023-07-03 14:52:47.770278', NULL, NULL, false, 'FACULDADE DE ARACAJU (FACAR)', 142);
INSERT INTO public.empresa VALUES (920, true, 1, '2023-07-03 14:52:47.771422', NULL, NULL, false, 'FACULDADE DE ARARAQUARA (FARA)', 378);
INSERT INTO public.empresa VALUES (921, true, 1, '2023-07-03 14:52:47.772593', NULL, NULL, false, 'FACULDADE DE ARTES DULCINA DE MORAES (FADM)', 5);
INSERT INTO public.empresa VALUES (922, true, 1, '2023-07-03 14:52:47.773908', NULL, NULL, false, 'FACULDADE DE ASSIS (FASS)', 379);
INSERT INTO public.empresa VALUES (923, true, 1, '2023-07-03 14:52:47.775144', NULL, NULL, false, 'FACULDADE DE BALSAS (UNIBALSAS)', 380);
INSERT INTO public.empresa VALUES (924, true, 1, '2023-07-03 14:52:47.776316', NULL, NULL, false, 'FACULDADE DE BARUERI (FCGB)', 381);
INSERT INTO public.empresa VALUES (925, true, 1, '2023-07-03 14:52:47.77755', NULL, NULL, false, 'FACULDADE DE BELÉM (FABEL)', 79);
INSERT INTO public.empresa VALUES (926, true, 1, '2023-07-03 14:52:47.778765', NULL, NULL, false, 'FACULDADE DE BELO HORIZONTE (FDR)', 2);
INSERT INTO public.empresa VALUES (927, true, 1, '2023-07-03 14:52:47.780107', NULL, NULL, false, 'FACULDADE DE BOITUVA (FIB)', 382);
INSERT INTO public.empresa VALUES (928, true, 1, '2023-07-03 14:52:47.78143', NULL, NULL, false, 'FACULDADE DE BOTUCATU (FDB)', 383);
INSERT INTO public.empresa VALUES (929, true, 1, '2023-07-03 14:52:47.782761', NULL, NULL, false, 'FACULDADE DE BRAGANÇA (FABRA)', 384);
INSERT INTO public.empresa VALUES (930, true, 1, '2023-07-03 14:52:47.784035', NULL, NULL, false, 'FACULDADE DE CAFELÂNDIA (FAC)', 385);
INSERT INTO public.empresa VALUES (931, true, 1, '2023-07-03 14:52:47.78522', NULL, NULL, false, 'FACULDADE DE CAIEIRAS', 386);
INSERT INTO public.empresa VALUES (932, true, 1, '2023-07-03 14:52:47.786357', NULL, NULL, false, 'FACULDADE DE CALDAS NOVAS (UNICALDAS)', 387);
INSERT INTO public.empresa VALUES (933, true, 1, '2023-07-03 14:52:47.787533', NULL, NULL, false, 'FACULDADE DE CAMPINA GRANDE (FAC-CG)', 147);
INSERT INTO public.empresa VALUES (934, true, 1, '2023-07-03 14:52:47.788764', NULL, NULL, false, 'FACULDADE DE CAMPINA GRANDE DO SUL (FACSUL)', 388);
INSERT INTO public.empresa VALUES (935, true, 1, '2023-07-03 14:52:47.789945', NULL, NULL, false, 'FACULDADE DE CARIACICA (FAC DE CARIACICA)', 389);
INSERT INTO public.empresa VALUES (936, true, 1, '2023-07-03 14:52:47.79149', NULL, NULL, false, 'FACULDADE DE CASTELO - MULTIVIX CASTELO (MULTIVIX CASTELO)', 390);
INSERT INTO public.empresa VALUES (937, true, 1, '2023-07-03 14:52:47.793089', NULL, NULL, false, 'FACULDADE DE CIÊNCIA E EDUCAÇÃO DO CAPARAÓ (FACEC)', 391);
INSERT INTO public.empresa VALUES (938, true, 1, '2023-07-03 14:52:47.79471', NULL, NULL, false, 'FACULDADE DE CIÊNCIA E TECNOLOGIA DE MONTES CLAROS (FACIT)', 128);
INSERT INTO public.empresa VALUES (939, true, 1, '2023-07-03 14:52:47.796229', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS AGRÁRIAS DE ANDRADINA (FCAA)', 392);
INSERT INTO public.empresa VALUES (940, true, 1, '2023-07-03 14:52:47.797484', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS AGRÁRIAS DE ARARIPINA (FACIAGRA)', 393);
INSERT INTO public.empresa VALUES (941, true, 1, '2023-07-03 14:52:47.798722', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS APLICADAS DE LIMOEIRO (FACAL)', 394);
INSERT INTO public.empresa VALUES (942, true, 1, '2023-07-03 14:52:47.799954', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS APLICADAS DE LIMOEIRO', 395);
INSERT INTO public.empresa VALUES (943, true, 1, '2023-07-03 14:52:47.80121', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS APLICADAS PIAUIENSE (FACAPI)', 396);
INSERT INTO public.empresa VALUES (944, true, 1, '2023-07-03 14:52:47.802426', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS BIOMÉDICAS DO ESPÍRITO SANTO (PIO XII - BIO)', 389);
INSERT INTO public.empresa VALUES (945, true, 1, '2023-07-03 14:52:47.803627', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS CONTÁBEIS (FACIC)', 116);
INSERT INTO public.empresa VALUES (946, true, 1, '2023-07-03 14:52:47.804813', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS CONTÁBEIS DE NOVA ANDRADINA - FACINAN (FACINAN)', 369);
INSERT INTO public.empresa VALUES (947, true, 1, '2023-07-03 14:52:47.805956', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS CONTÁBEIS E ADMINISTRATIVAS DE CACHOEIRO DO ITAPEMIRIM (FACCACI)', 190);
INSERT INTO public.empresa VALUES (948, true, 1, '2023-07-03 14:52:47.807225', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS CONTÁBEIS E DE ADMINISTRAÇÃO DE EMPRESAS (FCCAE)', 12);
INSERT INTO public.empresa VALUES (949, true, 1, '2023-07-03 14:52:47.808398', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA AMAZÔNIA (FCA)', 26);
INSERT INTO public.empresa VALUES (950, true, 1, '2023-07-03 14:52:47.809584', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA BAHIA - FACIBA (FACIBA)', 116);
INSERT INTO public.empresa VALUES (951, true, 1, '2023-07-03 14:52:47.810756', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA FUNDAÇÃO INSTITUTO TECNOLÓGICO DE OSASCO (FAC-FITO)', 158);
INSERT INTO public.empresa VALUES (952, true, 1, '2023-07-03 14:52:47.811932', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE (FACS)', 142);
INSERT INTO public.empresa VALUES (953, true, 1, '2023-07-03 14:52:47.813186', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE ARCHIMEDES THEODORO (FAC - SAUDE ARTHE)', 397);
INSERT INTO public.empresa VALUES (954, true, 1, '2023-07-03 14:52:47.814344', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DE BARRETOS DR. PAULO PRATA (FACISB)', 80);
INSERT INTO public.empresa VALUES (955, true, 1, '2023-07-03 14:52:47.815524', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DE SÃO PAULO (FACIS)', 8);
INSERT INTO public.empresa VALUES (956, true, 1, '2023-07-03 14:52:47.816711', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DE SERRA TALHADA (FACISST)', 398);
INSERT INTO public.empresa VALUES (957, true, 1, '2023-07-03 14:52:47.817922', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DE UNAÍ (FACISA)', 349);
INSERT INTO public.empresa VALUES (958, true, 1, '2023-07-03 14:52:47.819157', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE DO GRUPO HOSPITALAR CONCEIÇÃO (FACS - GHC)', 149);
INSERT INTO public.empresa VALUES (959, true, 1, '2023-07-03 14:52:47.820578', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE IGESP', 8);
INSERT INTO public.empresa VALUES (960, true, 1, '2023-07-03 14:52:47.82206', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE MOINHOS DE VENTO (FACSMV)', 149);
INSERT INTO public.empresa VALUES (961, true, 1, '2023-07-03 14:52:47.823496', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE PITÁGORAS DE CODÓ', 399);
INSERT INTO public.empresa VALUES (962, true, 1, '2023-07-03 14:52:47.824896', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DA SAÚDE SÍRIO-LIBANÊS (SÍRIO-LIBANÊS)', 8);
INSERT INTO public.empresa VALUES (963, true, 1, '2023-07-03 14:52:47.826144', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DE GOIANA (FCG)', 400);
INSERT INTO public.empresa VALUES (964, true, 1, '2023-07-03 14:52:47.827427', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DE TIMBAÚBA (FACET)', 401);
INSERT INTO public.empresa VALUES (965, true, 1, '2023-07-03 14:52:47.828678', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS DO TOCANTINS (FACIT)', 196);
INSERT INTO public.empresa VALUES (966, true, 1, '2023-07-03 14:52:47.830028', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS, EDUCAÇÃO E TEOLOGIA DO NORTE DO BRASIL (FACETEN)', 138);
INSERT INTO public.empresa VALUES (967, true, 1, '2023-07-03 14:52:47.831601', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS, EDUCAÇÃO, SAÚDE, PESQUISA E GESTÃO (FSF)', 402);
INSERT INTO public.empresa VALUES (968, true, 1, '2023-07-03 14:52:47.833013', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS EDUCACIONAIS DE CAPIM GROSSO (FCG)', 403);
INSERT INTO public.empresa VALUES (969, true, 1, '2023-07-03 14:52:47.834327', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS EDUCACIONAIS DO RIO GRANDE DO NORTE (FACERN)', 130);
INSERT INTO public.empresa VALUES (970, true, 1, '2023-07-03 14:52:47.835619', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS EDUCACIONAIS E EMPRESARIAIS DE NATAL (FACEN)', 130);
INSERT INTO public.empresa VALUES (971, true, 1, '2023-07-03 14:52:47.837026', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS EDUCACIONAIS E TECNOLOGIAS INTEGRADAS (FACETI)', 25);
INSERT INTO public.empresa VALUES (972, true, 1, '2023-07-03 14:52:47.838319', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E EDUCAÇÃO DO ESPÍRITO SANTO (UNIVES)', 25);
INSERT INTO public.empresa VALUES (973, true, 1, '2023-07-03 14:52:47.839612', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E EDUCAÇÃO EM SAÚDE (FACCESA)', 60);
INSERT INTO public.empresa VALUES (974, true, 1, '2023-07-03 14:52:47.840859', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E EDUCAÇÃO SENA AIRES (FACESA)', 297);
INSERT INTO public.empresa VALUES (975, true, 1, '2023-07-03 14:52:47.842084', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E LETRAS DE BRAGANÇA PAULISTA (FESB)', 404);
INSERT INTO public.empresa VALUES (976, true, 1, '2023-07-03 14:52:47.843324', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E SAÚDE EDUFOR (EDUFOR)', 141);
INSERT INTO public.empresa VALUES (977, true, 1, '2023-07-03 14:52:47.84463', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DA BAHIA (FACITE)', 405);
INSERT INTO public.empresa VALUES (978, true, 1, '2023-07-03 14:52:47.845804', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE BIRIGUI (FATEB)', 313);
INSERT INTO public.empresa VALUES (979, true, 1, '2023-07-03 14:52:47.847061', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE CHAPECÓ (FACITEC)', 406);
INSERT INTO public.empresa VALUES (980, true, 1, '2023-07-03 14:52:47.84834', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE JANAÚBA (FACITEC)', 407);
INSERT INTO public.empresa VALUES (981, true, 1, '2023-07-03 14:52:47.849644', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE TERESINA (FACET)', 27);
INSERT INTO public.empresa VALUES (982, true, 1, '2023-07-03 14:52:47.850791', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE UNAÍ - FACTU (FACTU)', 349);
INSERT INTO public.empresa VALUES (983, true, 1, '2023-07-03 14:52:47.851948', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA PASCHOAL DANTAS', 8);
INSERT INTO public.empresa VALUES (984, true, 1, '2023-07-03 14:52:47.853175', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIA PROFESSOR DIRSON MACIEL DE BARROS (FADIMAB)', 400);
INSERT INTO public.empresa VALUES (985, true, 1, '2023-07-03 14:52:47.854371', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS E TECNOLOGIAS DE CAMPOS GERAIS (FACICA)', 408);
INSERT INTO public.empresa VALUES (986, true, 1, '2023-07-03 14:52:47.855513', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS GERENCIAIS ALVES FORTES (FACE - ALFOR)', 397);
INSERT INTO public.empresa VALUES (987, true, 1, '2023-07-03 14:52:47.85666', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS GERENCIAIS DE SÃO GOTARDO (CESG)', 409);
INSERT INTO public.empresa VALUES (988, true, 1, '2023-07-03 14:52:47.857832', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS (IMENSU)', 410);
INSERT INTO public.empresa VALUES (989, true, 1, '2023-07-03 14:52:47.85903', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DE CURVELO (FACIC)', 301);
INSERT INTO public.empresa VALUES (990, true, 1, '2023-07-03 14:52:47.860166', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DE FORTALEZA (FCHFOR)', 45);
INSERT INTO public.empresa VALUES (991, true, 1, '2023-07-03 14:52:47.861295', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DE OLINDA (FACHO)', 39);
INSERT INTO public.empresa VALUES (992, true, 1, '2023-07-03 14:52:47.862489', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DE PERNAMBUCO (FCHPE)', 60);
INSERT INTO public.empresa VALUES (993, true, 1, '2023-07-03 14:52:47.863772', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DO ESTADO DE SÃO PAULO (FACIC)', 229);
INSERT INTO public.empresa VALUES (994, true, 1, '2023-07-03 14:52:47.864871', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS DO SERTÃO CENTRAL (FACHUSC)', 411);
INSERT INTO public.empresa VALUES (995, true, 1, '2023-07-03 14:52:47.866091', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E EXATAS DO SERTÃO DO SÃO FRANCISCO (FACESF)', 28);
INSERT INTO public.empresa VALUES (996, true, 1, '2023-07-03 14:52:47.867275', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS APLICADAS DO CABO DE SANTO AGOSTINHO (FACHUCA)', 412);
INSERT INTO public.empresa VALUES (997, true, 1, '2023-07-03 14:52:47.86849', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DE ARARIPINA - FACISA (FACISA)', 393);
INSERT INTO public.empresa VALUES (998, true, 1, '2023-07-03 14:52:47.869776', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DE IGARASSU (FACIG)', 413);
INSERT INTO public.empresa VALUES (999, true, 1, '2023-07-03 14:52:47.871026', NULL, NULL, false, 'FACULDADE DE CIENCIAS HUMANAS E SOCIAIS DE SERRA TALHADA (FACHUSST)', 398);
INSERT INTO public.empresa VALUES (1000, true, 1, '2023-07-03 14:52:47.872435', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DO XINGU E AMAZÔNIA (FACX)', 14);
INSERT INTO public.empresa VALUES (1001, true, 1, '2023-07-03 14:52:47.87376', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS ESUDA (FCHE)', 60);
INSERT INTO public.empresa VALUES (1002, true, 1, '2023-07-03 14:52:47.875009', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS HUMANAS,EXATAS E DA SAÚDE DO PIAUÍ (FAHESP)', 176);
INSERT INTO public.empresa VALUES (1003, true, 1, '2023-07-03 14:52:47.876206', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS ANHANGUERA DE ARAPIRACA', 333);
INSERT INTO public.empresa VALUES (1004, true, 1, '2023-07-03 14:52:47.877461', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE ALTAMIRA', 14);
INSERT INTO public.empresa VALUES (1005, true, 1, '2023-07-03 14:52:47.87873', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE ASSIS', 379);
INSERT INTO public.empresa VALUES (1006, true, 1, '2023-07-03 14:52:47.879925', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE BELO JARDIM', 395);
INSERT INTO public.empresa VALUES (1007, true, 1, '2023-07-03 14:52:47.881159', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE BOM JESUS DA LAPA', 414);
INSERT INTO public.empresa VALUES (1008, true, 1, '2023-07-03 14:52:47.882789', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE CAMPINA GRANDE', 147);
INSERT INTO public.empresa VALUES (1009, true, 1, '2023-07-03 14:52:47.884448', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE CRUZ DAS ALMAS', 172);
INSERT INTO public.empresa VALUES (1010, true, 1, '2023-07-03 14:52:47.886148', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE ERECHIM', 415);
INSERT INTO public.empresa VALUES (1011, true, 1, '2023-07-03 14:52:47.887833', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE ITUMBIARA', 234);
INSERT INTO public.empresa VALUES (1012, true, 1, '2023-07-03 14:52:47.889101', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE JABOATÃO DOS GUARARAPES', 132);
INSERT INTO public.empresa VALUES (1013, true, 1, '2023-07-03 14:52:47.890413', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE JACOBINA', 244);
INSERT INTO public.empresa VALUES (1014, true, 1, '2023-07-03 14:52:47.891652', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE LUZIÂNIA', 98);
INSERT INTO public.empresa VALUES (1015, true, 1, '2023-07-03 14:52:47.892853', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE PARAÍSO DO TOCANTINS (FCJP)', 416);
INSERT INTO public.empresa VALUES (1016, true, 1, '2023-07-03 14:52:47.894083', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE SANTA MARIA (UNISM)', 417);
INSERT INTO public.empresa VALUES (1017, true, 1, '2023-07-03 14:52:47.895319', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS JURÍDICAS DE TUCURUÍ', 418);
INSERT INTO public.empresa VALUES (1018, true, 1, '2023-07-03 14:52:47.896461', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS CEMEPE (CEMEPE)', 2);
INSERT INTO public.empresa VALUES (1019, true, 1, '2023-07-03 14:52:47.897606', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DA PARAÍBA (FCM-PB)', 107);
INSERT INTO public.empresa VALUES (1020, true, 1, '2023-07-03 14:52:47.899012', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DA SANTA CASA SÃO PAULO (FCMSCSP)', 8);
INSERT INTO public.empresa VALUES (1021, true, 1, '2023-07-03 14:52:47.900205', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DE MARICÁ (FACMAR)', 419);
INSERT INTO public.empresa VALUES (1022, true, 1, '2023-07-03 14:52:47.901468', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DE MINAS GERAIS (FCMMG)', 2);
INSERT INTO public.empresa VALUES (1023, true, 1, '2023-07-03 14:52:47.902806', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DE SÃO JOSÉ DOS CAMPOS', 144);
INSERT INTO public.empresa VALUES (1024, true, 1, '2023-07-03 14:52:47.904135', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DE TRÊS RIOS (FCM/TR)', 420);
INSERT INTO public.empresa VALUES (1025, true, 1, '2023-07-03 14:52:47.905306', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS DO PARÁ (FACIMPA)', 46);
INSERT INTO public.empresa VALUES (1026, true, 1, '2023-07-03 14:52:47.906448', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS E DA SAÚDE DE JUIZ DE FORA (FCMS/JF)', 38);
INSERT INTO public.empresa VALUES (1027, true, 1, '2023-07-03 14:52:47.907592', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS MÉDICAS E JURÍDICA (FACMED)', 421);
INSERT INTO public.empresa VALUES (1028, true, 1, '2023-07-03 14:52:47.908778', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS ODONTOLÓGICAS (FCO)', 128);
INSERT INTO public.empresa VALUES (1029, true, 1, '2023-07-03 14:52:47.916908', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS (FACISA)', 423);
INSERT INTO public.empresa VALUES (1030, true, 1, '2023-07-03 14:52:47.918273', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE BELO HORIZONTE (FACISABH)', 2);
INSERT INTO public.empresa VALUES (1031, true, 1, '2023-07-03 14:52:47.919587', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE EXTREMA (FAEX)', 424);
INSERT INTO public.empresa VALUES (1032, true, 1, '2023-07-03 14:52:47.920964', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE MARABÁ (FACIMAB)', 46);
INSERT INTO public.empresa VALUES (1033, true, 1, '2023-07-03 14:52:47.922284', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE MINAS GERAIS (FACISAMG)', 425);
INSERT INTO public.empresa VALUES (1034, true, 1, '2023-07-03 14:52:47.923528', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DO SUL DE MINAS - FACESM (FACESM)', 103);
INSERT INTO public.empresa VALUES (1035, true, 1, '2023-07-03 14:52:47.924796', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DO VALE DO SÃO LOURENÇO (EDUVALE)', 426);
INSERT INTO public.empresa VALUES (1036, true, 1, '2023-07-03 14:52:47.92619', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS E DE TECNOLOGIAS DE AGUA BOA (FACESA)', 427);
INSERT INTO public.empresa VALUES (1037, true, 1, '2023-07-03 14:52:47.927607', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS DOS PALMARES (FACIP)', 428);
INSERT INTO public.empresa VALUES (1038, true, 1, '2023-07-03 14:52:47.928944', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS SOCIAIS E AGRÁRIAS DE ITAPEVA (FAIT)', 272);
INSERT INTO public.empresa VALUES (1039, true, 1, '2023-07-03 14:52:47.930267', NULL, NULL, false, 'FACULDADE DE CIÊNCIAS TECNOLÓGICAS DE FORTALEZA (FCTFOR)', 45);
INSERT INTO public.empresa VALUES (1040, true, 1, '2023-07-03 14:52:47.931611', NULL, NULL, false, 'FACULDADE DECISION DE NEGÓCIOS', 149);
INSERT INTO public.empresa VALUES (1041, true, 1, '2023-07-03 14:52:47.932954', NULL, NULL, false, 'FACULDADE DE COLIDER (FACIDER)', 356);
INSERT INTO public.empresa VALUES (1042, true, 1, '2023-07-03 14:52:47.934172', NULL, NULL, false, 'FACULDADE DE COLINAS DO TOCANTINS', 429);
INSERT INTO public.empresa VALUES (1043, true, 1, '2023-07-03 14:52:47.935386', NULL, NULL, false, 'FACULDADE DE COMUNICAÇÃO ANHANGUERA UNIDADE GUARAPARI', 266);
INSERT INTO public.empresa VALUES (1044, true, 1, '2023-07-03 14:52:47.936705', NULL, NULL, false, 'FACULDADE DE COMUNICAÇÃO E DESIGN "OSWALDO CRUZ"', 8);
INSERT INTO public.empresa VALUES (1045, true, 1, '2023-07-03 14:52:47.938049', NULL, NULL, false, 'FACULDADE DE DESENVOLVIMENTO DO NORTE (FADENORTE)', 430);
INSERT INTO public.empresa VALUES (1046, true, 1, '2023-07-03 14:52:47.939212', NULL, NULL, false, 'FACULDADE DE DESENVOLVIMENTO SUSTENTÁVEL DE CRUZEIRO DO SUL (IEVAL)', 431);
INSERT INTO public.empresa VALUES (1047, true, 1, '2023-07-03 14:52:47.940481', NULL, NULL, false, 'FACULDADE DE DIREITO 8 DE JULHO', 142);
INSERT INTO public.empresa VALUES (1048, true, 1, '2023-07-03 14:52:47.941693', NULL, NULL, false, 'FACULDADE DE DIREITO ANHANGUERA UNIDADE GUARAPARI', 266);
INSERT INTO public.empresa VALUES (1049, true, 1, '2023-07-03 14:52:47.942914', NULL, NULL, false, 'FACULDADE DE DIREITO ATAME (ATAME)', 42);
INSERT INTO public.empresa VALUES (1050, true, 1, '2023-07-03 14:52:47.944101', NULL, NULL, false, 'FACULDADE DE DIREITO AVANTIS DE ITAPEMA (AVANTIS ITAPEMA)', 432);
INSERT INTO public.empresa VALUES (1051, true, 1, '2023-07-03 14:52:47.945227', NULL, NULL, false, 'FACULDADE DE DIREITO, CIÊNCIAS E TECNOLOGIA SANTA MARIA MADA (FADICT)', 73);
INSERT INTO public.empresa VALUES (1052, true, 1, '2023-07-03 14:52:47.946445', NULL, NULL, false, 'FACULDADE DE DIREITO DA FUNDAÇÃO ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO', 149);
INSERT INTO public.empresa VALUES (1053, true, 1, '2023-07-03 14:52:47.947724', NULL, NULL, false, 'FACULDADE DE DIREITO DE ALTA FLORESTA', 373);
INSERT INTO public.empresa VALUES (1054, true, 1, '2023-07-03 14:52:47.94889', NULL, NULL, false, 'FACULDADE DE DIREITO DE CACHOEIRO DO ITAPEMIRIM (FDCI)', 190);
INSERT INTO public.empresa VALUES (1055, true, 1, '2023-07-03 14:52:47.950139', NULL, NULL, false, 'FACULDADE DE DIREITO DE CONSELHEIRO LAFAIETE (FDCL)', 18);
INSERT INTO public.empresa VALUES (1056, true, 1, '2023-07-03 14:52:47.951384', NULL, NULL, false, 'FACULDADE DE DIREITO DE CONTAGEM (FDCON)', 200);
INSERT INTO public.empresa VALUES (1057, true, 1, '2023-07-03 14:52:47.952751', NULL, NULL, false, 'FACULDADE DE DIREITO DE FRANCA (FDF)', 179);
INSERT INTO public.empresa VALUES (1058, true, 1, '2023-07-03 14:52:47.954337', NULL, NULL, false, 'FACULDADE DE DIREITO DE IPATINGA (FADIPA)', 268);
INSERT INTO public.empresa VALUES (1059, true, 1, '2023-07-03 14:52:47.955643', NULL, NULL, false, 'FACULDADE DE DIREITO DE ITÚ (FADITU)', 180);
INSERT INTO public.empresa VALUES (1060, true, 1, '2023-07-03 14:52:47.956927', NULL, NULL, false, 'FACULDADE DE DIREITO DE SANTA MARIA (FADISMA)', 417);
INSERT INTO public.empresa VALUES (1061, true, 1, '2023-07-03 14:52:47.958117', NULL, NULL, false, 'FACULDADE DE DIREITO DE SÃO BERNARDO DO CAMPO (FDSBC)', 82);
INSERT INTO public.empresa VALUES (1062, true, 1, '2023-07-03 14:52:47.959284', NULL, NULL, false, 'FACULDADE DE DIREITO DE SOROCABA (FADI)', 146);
INSERT INTO public.empresa VALUES (1063, true, 1, '2023-07-03 14:52:47.960487', NULL, NULL, false, 'FACULDADE DE DIREITO DE URUGUAIANA - ANHANGUERA', 433);
INSERT INTO public.empresa VALUES (1064, true, 1, '2023-07-03 14:52:47.9617', NULL, NULL, false, 'FACULDADE DE DIREITO DE VARGINHA - FADIVA (FADIVA)', 133);
INSERT INTO public.empresa VALUES (1065, true, 1, '2023-07-03 14:52:47.962907', NULL, NULL, false, 'FACULDADE DE DIREITO DE VITÓRIA (FDV)', 25);
INSERT INTO public.empresa VALUES (1066, true, 1, '2023-07-03 14:52:47.964104', NULL, NULL, false, 'FACULDADE DE DIREITO DO SUL DE MINAS (FDSM)', 230);
INSERT INTO public.empresa VALUES (1067, true, 1, '2023-07-03 14:52:47.965314', NULL, NULL, false, 'FACULDADE DE DIREITO DO VALE DO RIO DOCE (FADIVALE)', 265);
INSERT INTO public.empresa VALUES (1068, true, 1, '2023-07-03 14:52:47.966618', NULL, NULL, false, 'FACULDADE DE DIREITO E CIÊNCIAS SOCIAIS DO LESTE DE MINAS - FADILESTE (FADILESTE)', 434);
INSERT INTO public.empresa VALUES (1069, true, 1, '2023-07-03 14:52:47.967915', NULL, NULL, false, 'FACULDADE DE DIREITO SERRA DOURADA', 14);
INSERT INTO public.empresa VALUES (1070, true, 1, '2023-07-03 14:52:47.969142', NULL, NULL, false, 'FACULDADE DE DIREITO TECH DE SÃO PAULO (FADITECH)', 8);
INSERT INTO public.empresa VALUES (1071, true, 1, '2023-07-03 14:52:47.970463', NULL, NULL, false, 'FACULDADE DE DRACENA', 435);
INSERT INTO public.empresa VALUES (1072, true, 1, '2023-07-03 14:52:47.971748', NULL, NULL, false, 'FACULDADE DE DUQUE DE CAXIAS (FDC)', 436);
INSERT INTO public.empresa VALUES (1073, true, 1, '2023-07-03 14:52:47.973019', NULL, NULL, false, 'FACULDADE DE ECONOMIA E PROCESSAMENTO DE DADOS DE FOZ DO IGUAÇU (FEPI)', 124);
INSERT INTO public.empresa VALUES (1074, true, 1, '2023-07-03 14:52:47.974189', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO ACRIANA EUCLIDES DA CUNHA (INEC)', 143);
INSERT INTO public.empresa VALUES (1075, true, 1, '2023-07-03 14:52:47.97548', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO CIÊNCIAS E ARTES DOM BOSCO DE MONTE APRAZÍVEL (FAECA DOM BOSCO)', 437);
INSERT INTO public.empresa VALUES (1076, true, 1, '2023-07-03 14:52:47.976729', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO CIÊNCIAS E LETRAS DE PARAÍSO (FECIPAR)', 416);
INSERT INTO public.empresa VALUES (1077, true, 1, '2023-07-03 14:52:47.977972', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DA IBIAPABA (FAEDI)', 438);
INSERT INTO public.empresa VALUES (1078, true, 1, '2023-07-03 14:52:47.979146', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE COSTA RICA (FECRA)', 439);
INSERT INTO public.empresa VALUES (1079, true, 1, '2023-07-03 14:52:47.980359', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE GUARATINGUETÁ (FACEG)', 363);
INSERT INTO public.empresa VALUES (1080, true, 1, '2023-07-03 14:52:47.981973', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE ITABORAÍ (FEITA)', 341);
INSERT INTO public.empresa VALUES (1081, true, 1, '2023-07-03 14:52:47.983612', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE JARU (UNICENTRO)', 440);
INSERT INTO public.empresa VALUES (1082, true, 1, '2023-07-03 14:52:47.98524', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE NOVA ANDRADINA (FENA)', 369);
INSERT INTO public.empresa VALUES (1083, true, 1, '2023-07-03 14:52:47.986871', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE PATOS DE MINAS (FAEP)', 112);
INSERT INTO public.empresa VALUES (1084, true, 1, '2023-07-03 14:52:47.988114', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE PORTO VELHO (UNIRON)', 51);
INSERT INTO public.empresa VALUES (1085, true, 1, '2023-07-03 14:52:47.989391', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE SANTA CATARINA (FAESC)', 3);
INSERT INTO public.empresa VALUES (1086, true, 1, '2023-07-03 14:52:47.990742', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE SÃO MATEUS', 441);
INSERT INTO public.empresa VALUES (1087, true, 1, '2023-07-03 14:52:47.99199', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DE TANGARÁ DA SERRA', 294);
INSERT INTO public.empresa VALUES (1088, true, 1, '2023-07-03 14:52:47.993195', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO DO PIAUÍ (FAEPI)', 27);
INSERT INTO public.empresa VALUES (1089, true, 1, '2023-07-03 14:52:47.994452', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E CULTURA DE JI-PARANÁ (FAJIPA)', 139);
INSERT INTO public.empresa VALUES (1090, true, 1, '2023-07-03 14:52:47.995688', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E ESTUDOS SOCIAIS DE UBERLÂNDIA (FEESU)', 134);
INSERT INTO public.empresa VALUES (1091, true, 1, '2023-07-03 14:52:47.996989', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO ELIÂ (FACEEL)', 442);
INSERT INTO public.empresa VALUES (1092, true, 1, '2023-07-03 14:52:47.998483', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO EM CIÊNCIAS DA SAÚDE (FECS)', 8);
INSERT INTO public.empresa VALUES (1093, true, 1, '2023-07-03 14:52:47.999872', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E TECNOLOGIA DA AMAZÔNIA (FAM)', 227);
INSERT INTO public.empresa VALUES (1094, true, 1, '2023-07-03 14:52:48.001206', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E TECNOLOGIA DO ESPÍRITO SANTO (FETES)', 290);
INSERT INTO public.empresa VALUES (1095, true, 1, '2023-07-03 14:52:48.002976', NULL, NULL, false, 'FACULDADE DE EDUCACAO E TECNOLOGIA DO PARA (FAETE)', 227);
INSERT INTO public.empresa VALUES (1096, true, 1, '2023-07-03 14:52:48.00437', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO E TECNOLOGIA IRACEMA (FAETI)', 8);
INSERT INTO public.empresa VALUES (1097, true, 1, '2023-07-03 14:52:48.005846', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO FÍSICA DA ASSOCIAÇÃO CRISTÃ DE MOÇOS DE SOROCABA (FEFISO)', 146);
INSERT INTO public.empresa VALUES (1098, true, 1, '2023-07-03 14:52:48.007227', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO FÍSICA DE FOZ DO IGUAÇU', 124);
INSERT INTO public.empresa VALUES (1099, true, 1, '2023-07-03 14:52:48.008662', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO MEMORIAL ADELAIDE FRANCO (FEMAF)', 443);
INSERT INTO public.empresa VALUES (1100, true, 1, '2023-07-03 14:52:48.009885', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO PAULISTANA (FAEP)', 8);
INSERT INTO public.empresa VALUES (1101, true, 1, '2023-07-03 14:52:48.011093', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SANTA TEREZINHA (FEST)', 267);
INSERT INTO public.empresa VALUES (1102, true, 1, '2023-07-03 14:52:48.012292', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SÃO FRANCISCO (FAESF)', 443);
INSERT INTO public.empresa VALUES (1103, true, 1, '2023-07-03 14:52:48.01349', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SÃO LUÍS (FESL)', 315);
INSERT INTO public.empresa VALUES (1104, true, 1, '2023-07-03 14:52:48.014731', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SOCIAL DA BAHIA (FAESB)', 306);
INSERT INTO public.empresa VALUES (1105, true, 1, '2023-07-03 14:52:48.01595', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUL DO PIAUÍ', 444);
INSERT INTO public.empresa VALUES (1106, true, 1, '2023-07-03 14:52:48.017103', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE CATALÃO', 17);
INSERT INTO public.empresa VALUES (1107, true, 1, '2023-07-03 14:52:48.018272', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE CHAPECÓ (FACESC)', 406);
INSERT INTO public.empresa VALUES (1108, true, 1, '2023-07-03 14:52:48.019588', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE DIVINÓPOLIS', 19);
INSERT INTO public.empresa VALUES (1109, true, 1, '2023-07-03 14:52:48.020859', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE PARAGOMINAS (FACESP)', 280);
INSERT INTO public.empresa VALUES (1110, true, 1, '2023-07-03 14:52:48.02205', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE PERNAMBUCO (FAESPE)', 445);
INSERT INTO public.empresa VALUES (1111, true, 1, '2023-07-03 14:52:48.023256', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE PERNAMBUCO (FACESP)', 445);
INSERT INTO public.empresa VALUES (1112, true, 1, '2023-07-03 14:52:48.024453', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE POUSO ALEGRE', 230);
INSERT INTO public.empresa VALUES (1113, true, 1, '2023-07-03 14:52:48.025728', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE SETE LAGOAS', 24);
INSERT INTO public.empresa VALUES (1114, true, 1, '2023-07-03 14:52:48.026946', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DE TANGARÁ DA SERRA (FAEST)', 294);
INSERT INTO public.empresa VALUES (1115, true, 1, '2023-07-03 14:52:48.028143', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR DO PARANÁ (FESPPR)', 56);
INSERT INTO public.empresa VALUES (1116, true, 1, '2023-07-03 14:52:48.029296', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO SUPERIOR IESLA (IESLA)', 2);
INSERT INTO public.empresa VALUES (1117, true, 1, '2023-07-03 14:52:48.03061', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA BARRA MANSA (FAETERJ B.MANSA)', 92);
INSERT INTO public.empresa VALUES (1118, true, 1, '2023-07-03 14:52:48.031775', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO (FAETERJ CAXIAS)', 436);
INSERT INTO public.empresa VALUES (1119, true, 1, '2023-07-03 14:52:48.032982', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO (FAETERJ PARACAMBI)', 446);
INSERT INTO public.empresa VALUES (1120, true, 1, '2023-07-03 14:52:48.03419', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ PETRÓPOLIS)', 53);
INSERT INTO public.empresa VALUES (1121, true, 1, '2023-07-03 14:52:48.03538', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ S ANT. PÁDUA)', 447);
INSERT INTO public.empresa VALUES (1122, true, 1, '2023-07-03 14:52:48.03659', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ ITAPERUNA)', 186);
INSERT INTO public.empresa VALUES (1123, true, 1, '2023-07-03 14:52:48.037755', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ BJ ITABAPOAN)', 448);
INSERT INTO public.empresa VALUES (1124, true, 1, '2023-07-03 14:52:48.038944', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ TRÊS RIOS)', 420);
INSERT INTO public.empresa VALUES (1125, true, 1, '2023-07-03 14:52:48.040131', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO FERNANDO MOTA (FAETERJ-RIO)', 12);
INSERT INTO public.empresa VALUES (1126, true, 1, '2023-07-03 14:52:48.04128', NULL, NULL, false, 'FACULDADE DE EDUCAÇÃO VALE DO PAJEÚ (FVP)', 449);
INSERT INTO public.empresa VALUES (1127, true, 1, '2023-07-03 14:52:48.042457', NULL, NULL, false, 'FACULDADE DE ELESBÃO VELOSO (FAEVE)', 450);
INSERT INTO public.empresa VALUES (1128, true, 1, '2023-07-03 14:52:48.04366', NULL, NULL, false, 'FACULDADE DE EMPREENDEDORISMO E CIÊNCIAS HUMANAS (FACULDADE FAECH)', 134);
INSERT INTO public.empresa VALUES (1129, true, 1, '2023-07-03 14:52:48.044847', NULL, NULL, false, 'FACULDADE DE ENFERMAGEM NOVA ESPERANÇA (FACENE)', 107);
INSERT INTO public.empresa VALUES (1130, true, 1, '2023-07-03 14:52:48.045935', NULL, NULL, false, 'FACULDADE DE ENFERMAGEM NOVA ESPERANÇA DE MOSSORÓ - FACENE/RN (FACENE/RN)', 323);
INSERT INTO public.empresa VALUES (1131, true, 1, '2023-07-03 14:52:48.047194', NULL, NULL, false, 'FACULDADE DE ENFERMAGEM SÃO VICENTE DE PAULA (FESVIP)', 107);
INSERT INTO public.empresa VALUES (1132, true, 1, '2023-07-03 14:52:48.048326', NULL, NULL, false, 'FACULDADE DE ENGENHARIA DE MINAS GERAIS - FEAMIG (FEAMIG)', 2);
INSERT INTO public.empresa VALUES (1133, true, 1, '2023-07-03 14:52:48.049497', NULL, NULL, false, 'FACULDADE DE ENGENHARIA DE RESENDE (FER)', 4);
INSERT INTO public.empresa VALUES (1134, true, 1, '2023-07-03 14:52:48.050636', NULL, NULL, false, 'FACULDADE DE ENGENHARIA E ADMINISTRAÇÃO PAULISTA (FEAP)', 195);
INSERT INTO public.empresa VALUES (1135, true, 1, '2023-07-03 14:52:48.05182', NULL, NULL, false, 'FACULDADE DE ENGENHARIA E AGRIMENSURA DE SÃO PAULO (FEASP)', 8);
INSERT INTO public.empresa VALUES (1136, true, 1, '2023-07-03 14:52:48.053014', NULL, NULL, false, 'FACULDADE DE ENGENHARIA SOUZA MARQUES (FESM)', 12);
INSERT INTO public.empresa VALUES (1137, true, 1, '2023-07-03 14:52:48.054213', NULL, NULL, false, 'FACULDADE DE ENSINO DE MINAS GERAIS (FACEMG)', 2);
INSERT INTO public.empresa VALUES (1138, true, 1, '2023-07-03 14:52:48.055352', NULL, NULL, false, 'FACULDADE DE ENSINO DE PESQUISA DO COOPERATIVISMO (FEPCOOP)', 203);
INSERT INTO public.empresa VALUES (1139, true, 1, '2023-07-03 14:52:48.056545', NULL, NULL, false, 'FACULDADE DE ENSINO E CULTURA DO CEARÁ (FAECE)', 45);
INSERT INTO public.empresa VALUES (1140, true, 1, '2023-07-03 14:52:48.057724', NULL, NULL, false, 'FACULDADE DE ENSINO JURÍDICO DE VITÓRIA (FEJ)', 25);
INSERT INTO public.empresa VALUES (1141, true, 1, '2023-07-03 14:52:48.058958', NULL, NULL, false, 'FACULDADE DE ENSINO PASCHOAL DANTAS (FEPD)', 8);
INSERT INTO public.empresa VALUES (1142, true, 1, '2023-07-03 14:52:48.060148', NULL, NULL, false, 'FACULDADE DE ENSINO PORTAL (FEP)', 451);
INSERT INTO public.empresa VALUES (1143, true, 1, '2023-07-03 14:52:48.061511', NULL, NULL, false, 'FACULDADE DE ENSINO REGIONAL ALTERNATIVA (FERA)', 333);
INSERT INTO public.empresa VALUES (1144, true, 1, '2023-07-03 14:52:48.062829', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR (FAES)', 134);
INSERT INTO public.empresa VALUES (1145, true, 1, '2023-07-03 14:52:48.064043', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR BRASILEIRA - FACULDADE FEBRAS (FEBRAS)', 226);
INSERT INTO public.empresa VALUES (1146, true, 1, '2023-07-03 14:52:48.065182', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DA AMAZÔNIA (FESAM)', 26);
INSERT INTO public.empresa VALUES (1147, true, 1, '2023-07-03 14:52:48.066375', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DA AMAZÔNIA REUNIDA (FESAR)', 452);
INSERT INTO public.empresa VALUES (1148, true, 1, '2023-07-03 14:52:48.067569', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DA CIDADE DE FEIRA DE SANTANA (FAESF/UNEF)', 99);
INSERT INTO public.empresa VALUES (1149, true, 1, '2023-07-03 14:52:48.068767', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DA PARAÍBA (FESP)', 107);
INSERT INTO public.empresa VALUES (1150, true, 1, '2023-07-03 14:52:48.069982', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DE FLORIANO (FAESF)', 453);
INSERT INTO public.empresa VALUES (1151, true, 1, '2023-07-03 14:52:48.071179', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DE LINHARES (FACELI)', 277);
INSERT INTO public.empresa VALUES (1152, true, 1, '2023-07-03 14:52:48.072702', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DE MARECHAL CÂNDIDO RONDON (ISEPE RONDON)', 454);
INSERT INTO public.empresa VALUES (1153, true, 1, '2023-07-03 14:52:48.074213', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DE PARNAÍBA (FAESPA)', 176);
INSERT INTO public.empresa VALUES (1154, true, 1, '2023-07-03 14:52:48.075712', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DO CENTRO DO PARANÁ (UCP)', 455);
INSERT INTO public.empresa VALUES (1155, true, 1, '2023-07-03 14:52:48.077213', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DO INTERIOR PAULISTA (FAIP)', 145);
INSERT INTO public.empresa VALUES (1156, true, 1, '2023-07-03 14:52:48.078323', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DO LAGO (FAESLA)', 456);
INSERT INTO public.empresa VALUES (1157, true, 1, '2023-07-03 14:52:48.079445', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DOM BOSCO (FACDOMBOSCO)', 353);
INSERT INTO public.empresa VALUES (1158, true, 1, '2023-07-03 14:52:48.080579', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR DO PIAUÍ (FAESPI)', 27);
INSERT INTO public.empresa VALUES (1159, true, 1, '2023-07-03 14:52:48.081692', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR E FORMAÇÃO INTEGRAL (FAEF)', 457);
INSERT INTO public.empresa VALUES (1160, true, 1, '2023-07-03 14:52:48.082844', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR PASCHOAL DANTAS', 8);
INSERT INTO public.empresa VALUES (1161, true, 1, '2023-07-03 14:52:48.083971', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR PELEGRINO CIPRIANI (FASPEC)', 203);
INSERT INTO public.empresa VALUES (1162, true, 1, '2023-07-03 14:52:48.085036', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR REFFERENCIAL (FAREFF)', 48);
INSERT INTO public.empresa VALUES (1163, true, 1, '2023-07-03 14:52:48.086276', NULL, NULL, false, 'FACULDADE DE ENSINO SUPERIOR SANTA BARBARA (FAESB)', 458);
INSERT INTO public.empresa VALUES (1164, true, 1, '2023-07-03 14:52:48.087365', NULL, NULL, false, 'FACULDADE DE ESTUDOS AVANÇADOS DO PARÁ (FEAPA)', 79);
INSERT INTO public.empresa VALUES (1165, true, 1, '2023-07-03 14:52:48.088466', NULL, NULL, false, 'FACULDADE DE ESTUDOS SOCIAIS APLICADOS DE VIANA (FESAV)', 459);
INSERT INTO public.empresa VALUES (1166, true, 1, '2023-07-03 14:52:48.089622', NULL, NULL, false, 'FACULDADE DE ESTUDOS SOCIAIS DO ESPÍRITO SANTO (PIO XII)', 389);
INSERT INTO public.empresa VALUES (1167, true, 1, '2023-07-03 14:52:48.090764', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE ALEGRE (FAFIA)', 460);
INSERT INTO public.empresa VALUES (1168, true, 1, '2023-07-03 14:52:48.091874', NULL, NULL, false, 'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE BOA ESPERANÇA (FAFIBE)', 314);
INSERT INTO public.empresa VALUES (1169, true, 1, '2023-07-03 14:52:48.09304', NULL, NULL, false, 'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE IBITINGA (FAIBI)', 461);
INSERT INTO public.empresa VALUES (1170, true, 1, '2023-07-03 14:52:48.094276', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE ITUVERAVA (FFCL)', 462);
INSERT INTO public.empresa VALUES (1171, true, 1, '2023-07-03 14:52:48.095443', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE MACAÉ (FAFIMA)', 325);
INSERT INTO public.empresa VALUES (1172, true, 1, '2023-07-03 14:52:48.096646', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE PENÁPOLIS (FAFIPE)', 463);
INSERT INTO public.empresa VALUES (1173, true, 1, '2023-07-03 14:52:48.097892', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE SÃO JOSÉ DO RIO PARDO (FFCL)', 464);
INSERT INTO public.empresa VALUES (1174, true, 1, '2023-07-03 14:52:48.098941', NULL, NULL, false, 'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DO ALTO SÃO FRANCISCO (FASF)', 465);
INSERT INTO public.empresa VALUES (1175, true, 1, '2023-07-03 14:52:48.100133', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DOM BOSCO (FFCLDB)', 4);
INSERT INTO public.empresa VALUES (1176, true, 1, '2023-07-03 14:52:48.101434', NULL, NULL, false, 'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS SOUZA MARQUES (FFCLSM)', 12);
INSERT INTO public.empresa VALUES (1177, true, 1, '2023-07-03 14:52:48.102781', NULL, NULL, false, 'FACULDADE DE FILOSOFIA E TEOLOGIA PAULO VI (FFTP)', 62);
INSERT INTO public.empresa VALUES (1178, true, 1, '2023-07-03 14:52:48.104036', NULL, NULL, false, 'FACULDADE DE FORMAÇÃO DE PROFESSORES DA MATA SUL (FAMASUL)', 428);
INSERT INTO public.empresa VALUES (1179, true, 1, '2023-07-03 14:52:48.105196', NULL, NULL, false, 'FACULDADE DE FORMAÇÃO DE PROFESSORES DE ARARIPINA (FAFOPA)', 393);
INSERT INTO public.empresa VALUES (1180, true, 1, '2023-07-03 14:52:48.106351', NULL, NULL, false, 'FACULDADE DE FORMAÇÃO DE PROFESSORES DE SERRA TALHADA (FAFOPST)', 398);
INSERT INTO public.empresa VALUES (1181, true, 1, '2023-07-03 14:52:48.107462', NULL, NULL, false, 'FACULDADE DE FORTALEZA (FAFOR)', 45);
INSERT INTO public.empresa VALUES (1182, true, 1, '2023-07-03 14:52:48.108522', NULL, NULL, false, 'FACULDADE DE FRUTAL (FAF)', 466);
INSERT INTO public.empresa VALUES (1183, true, 1, '2023-07-03 14:52:48.109805', NULL, NULL, false, 'FACULDADE DE GESTÃO, EDUCAÇÃO E DE SAÚDE (FGS)', 203);
INSERT INTO public.empresa VALUES (1184, true, 1, '2023-07-03 14:52:48.111017', NULL, NULL, false, 'FACULDADE DE GESTÃO E INOVAÇÃO (FGI)', 21);
INSERT INTO public.empresa VALUES (1185, true, 1, '2023-07-03 14:52:48.112075', NULL, NULL, false, 'FACULDADE DE GESTAO E NEGOCIOS DE CACHOEIRINHA (FGN CACHOEIRINH)', 74);
INSERT INTO public.empresa VALUES (1186, true, 1, '2023-07-03 14:52:48.113224', NULL, NULL, false, 'FACULDADE DE GESTAO E NEGOCIOS DE SALVADOR (FGN)', 116);
INSERT INTO public.empresa VALUES (1187, true, 1, '2023-07-03 14:52:48.11447', NULL, NULL, false, 'FACULDADE DE GESTAO E NEGOCIOS DE TERESINA (FGN TERESINA)', 27);
INSERT INTO public.empresa VALUES (1188, true, 1, '2023-07-03 14:52:48.115595', NULL, NULL, false, 'FACULDADE DE GOIANA (FAG)', 400);
INSERT INTO public.empresa VALUES (1189, true, 1, '2023-07-03 14:52:48.116697', NULL, NULL, false, 'FACULDADE DE GOVERNANÇA, ENGENHARIA E EDUCAÇÃO DE SÃO PAULO (FGE-SP)', 195);
INSERT INTO public.empresa VALUES (1190, true, 1, '2023-07-03 14:52:48.117836', NULL, NULL, false, 'FACULDADE DE GUARANTÃ DO NORTE ( UNIFAMA)', 467);
INSERT INTO public.empresa VALUES (1191, true, 1, '2023-07-03 14:52:48.119082', NULL, NULL, false, 'FACULDADE DE GUARULHOS (FAG)', 100);
INSERT INTO public.empresa VALUES (1192, true, 1, '2023-07-03 14:52:48.120306', NULL, NULL, false, 'FACULDADE DEHONIANA (DEHONIANA)', 33);
INSERT INTO public.empresa VALUES (1193, true, 1, '2023-07-03 14:52:48.121464', NULL, NULL, false, 'FACULDADE DE HORTOLÂNDIA (FACH)', 468);
INSERT INTO public.empresa VALUES (1194, true, 1, '2023-07-03 14:52:48.122578', NULL, NULL, false, 'FACULDADE DE IBAITI (FEATI)', 469);
INSERT INTO public.empresa VALUES (1195, true, 1, '2023-07-03 14:52:48.123752', NULL, NULL, false, 'FACULDADE DE ILHA SOLTEIRA (FAISA)', 340);
INSERT INTO public.empresa VALUES (1196, true, 1, '2023-07-03 14:52:48.124895', NULL, NULL, false, 'FACULDADE DE IMPERATRIZ WYDEN (FACIMP WYDEN)', 267);
INSERT INTO public.empresa VALUES (1197, true, 1, '2023-07-03 14:52:48.126177', NULL, NULL, false, 'FACULDADE DE INDIARA (FAIND)', 470);
INSERT INTO public.empresa VALUES (1198, true, 1, '2023-07-03 14:52:48.127383', NULL, NULL, false, 'FACULDADE DE INFORMÁTICA DE OURO PRETO DO OESTE (FIOURO)', 471);
INSERT INTO public.empresa VALUES (1199, true, 1, '2023-07-03 14:52:48.128591', NULL, NULL, false, 'FACULDADE DE INHUMAS - FAC-MAIS (FACMAIS)', 472);
INSERT INTO public.empresa VALUES (1200, true, 1, '2023-07-03 14:52:48.129728', NULL, NULL, false, 'FACULDADE DE INTEGRAÇÃO DO ENSINO SUPERIOR DO CONE SUL (FISUL)', 473);
INSERT INTO public.empresa VALUES (1201, true, 1, '2023-07-03 14:52:48.130871', NULL, NULL, false, 'FACULDADE DE INTEGRAÇÃO DO SERTÃO (FIS)', 398);
INSERT INTO public.empresa VALUES (1202, true, 1, '2023-07-03 14:52:48.132034', NULL, NULL, false, 'FACULDADE DE IPORÁ (FAI)', 474);
INSERT INTO public.empresa VALUES (1203, true, 1, '2023-07-03 14:52:48.13334', NULL, NULL, false, 'FACULDADE DE ITAITUBA (FAI)', 475);
INSERT INTO public.empresa VALUES (1204, true, 1, '2023-07-03 14:52:48.134599', NULL, NULL, false, 'FACULDADE DE ITÁPOLIS - FACITA (FACITA)', 223);
INSERT INTO public.empresa VALUES (1205, true, 1, '2023-07-03 14:52:48.135846', NULL, NULL, false, 'FACULDADE DE JABOTICABAL (FAJAB)', 315);
INSERT INTO public.empresa VALUES (1206, true, 1, '2023-07-03 14:52:48.137105', NULL, NULL, false, 'FACULDADE DE JACAREÍ', 273);
INSERT INTO public.empresa VALUES (1207, true, 1, '2023-07-03 14:52:48.138434', NULL, NULL, false, 'FACULDADE DE JANDAIA DO SUL (FAFIJAN)', 476);
INSERT INTO public.empresa VALUES (1208, true, 1, '2023-07-03 14:52:48.139719', NULL, NULL, false, 'FACULDADE DE JUSSARA (FAJ)', 477);
INSERT INTO public.empresa VALUES (1209, true, 1, '2023-07-03 14:52:48.14095', NULL, NULL, false, 'FACULDADE DELMIRO GOUVEIA (FDG)', 73);
INSERT INTO public.empresa VALUES (1210, true, 1, '2023-07-03 14:52:48.142127', NULL, NULL, false, 'FACULDADE DELTA (FACULDADE DELTA)', 42);
INSERT INTO public.empresa VALUES (1211, true, 1, '2023-07-03 14:52:48.143472', NULL, NULL, false, 'FACULDADE DE LUCAS DO RIO VERDE (UNIFAMA)', 169);
INSERT INTO public.empresa VALUES (1212, true, 1, '2023-07-03 14:52:48.14471', NULL, NULL, false, 'FACULDADE DE MARÍLIA (FAMAR)', 145);
INSERT INTO public.empresa VALUES (1213, true, 1, '2023-07-03 14:52:48.145867', NULL, NULL, false, 'FACULDADE DE MARTINÓPOLIS (FAMA)', 478);
INSERT INTO public.empresa VALUES (1214, true, 1, '2023-07-03 14:52:48.147061', NULL, NULL, false, 'FACULDADE DE MATO GROSSO (FAMAT)', 203);
INSERT INTO public.empresa VALUES (1215, true, 1, '2023-07-03 14:52:48.148266', NULL, NULL, false, 'FACULDADE DE MATUPÁ ( UNIFAMA)', 479);
INSERT INTO public.empresa VALUES (1216, true, 1, '2023-07-03 14:52:48.149434', NULL, NULL, false, 'FACULDADE DE MAUÁ - FAMA (FAMA)', 480);
INSERT INTO public.empresa VALUES (1217, true, 1, '2023-07-03 14:52:48.150775', NULL, NULL, false, 'FACULDADE DE MEDIAÇÃO ÍVIA CORNELI (FAMIC)', 481);
INSERT INTO public.empresa VALUES (1218, true, 1, '2023-07-03 14:52:48.152052', NULL, NULL, false, 'FACULDADE DE MEDICINA (ITPAC)', 196);
INSERT INTO public.empresa VALUES (1219, true, 1, '2023-07-03 14:52:48.15346', NULL, NULL, false, 'FACULDADE DE MEDICINA DE AÇAILÂNDIA', 482);
INSERT INTO public.empresa VALUES (1220, true, 1, '2023-07-03 14:52:48.154685', NULL, NULL, false, 'FACULDADE DE MEDICINA DE BARBACENA (FAME)', 32);
INSERT INTO public.empresa VALUES (1221, true, 1, '2023-07-03 14:52:48.155939', NULL, NULL, false, 'FACULDADE DE MEDICINA DE CAMPOS (FMC)', 160);
INSERT INTO public.empresa VALUES (1222, true, 1, '2023-07-03 14:52:48.157131', NULL, NULL, false, 'FACULDADE DE MEDICINA DE GARANHUNS (SUB JUDICE)', 483);
INSERT INTO public.empresa VALUES (1223, true, 1, '2023-07-03 14:52:48.158381', NULL, NULL, false, 'FACULDADE DE MEDICINA DE ITAJUBÁ (FMIT)', 103);
INSERT INTO public.empresa VALUES (1224, true, 1, '2023-07-03 14:52:48.160042', NULL, NULL, false, 'FACULDADE DE MEDICINA DE JI-PARANÁ', 139);
INSERT INTO public.empresa VALUES (1225, true, 1, '2023-07-03 14:52:48.161559', NULL, NULL, false, 'FACULDADE DE MEDICINA DE JUNDIAÍ (FMJ)', 182);
INSERT INTO public.empresa VALUES (1226, true, 1, '2023-07-03 14:52:48.163062', NULL, NULL, false, 'FACULDADE DE MEDICINA DE MARÍLIA (FAMEMA)', 145);
INSERT INTO public.empresa VALUES (1227, true, 1, '2023-07-03 14:52:48.164619', NULL, NULL, false, 'FACULDADE DE MEDICINA DE OLINDA (FMO)', 39);
INSERT INTO public.empresa VALUES (1228, true, 1, '2023-07-03 14:52:48.165836', NULL, NULL, false, 'FACULDADE DE MEDICINA DE PETRÓPOLIS (FMP)', 53);
INSERT INTO public.empresa VALUES (1229, true, 1, '2023-07-03 14:52:48.167064', NULL, NULL, false, 'FACULDADE DE MEDICINA DE SÃO JOSÉ DO RIO PRETO (FAMERP)', 114);
INSERT INTO public.empresa VALUES (1230, true, 1, '2023-07-03 14:52:48.168225', NULL, NULL, false, 'FACULDADE DE MEDICINA DO SERTÃO (FMS)', 15);
INSERT INTO public.empresa VALUES (1231, true, 1, '2023-07-03 14:52:48.169435', NULL, NULL, false, 'FACULDADE DE MEDICINA ESTÁCIO DE CASTANHAL (ESTÁCIO FMEC)', 484);
INSERT INTO public.empresa VALUES (1232, true, 1, '2023-07-03 14:52:48.170675', NULL, NULL, false, 'FACULDADE DE MEDICINA ESTÁCIO DE JUAZEIRO DO NORTE (ESTÁCIO FMJ)', 135);
INSERT INTO public.empresa VALUES (1233, true, 1, '2023-07-03 14:52:48.171892', NULL, NULL, false, 'FACULDADE DE MEDICINA NOVA ESPERANÇA (FAMENE)', 107);
INSERT INTO public.empresa VALUES (1234, true, 1, '2023-07-03 14:52:48.173115', NULL, NULL, false, 'FACULDADE DE MIGUEL PEREIRA (FAMIPE)', 485);
INSERT INTO public.empresa VALUES (1235, true, 1, '2023-07-03 14:52:48.17431', NULL, NULL, false, 'FACULDADE DE MINAS BH (FAMINAS-BH)', 2);
INSERT INTO public.empresa VALUES (1236, true, 1, '2023-07-03 14:52:48.175539', NULL, NULL, false, 'FACULDADE DE MIRASSOL', 486);
INSERT INTO public.empresa VALUES (1237, true, 1, '2023-07-03 14:52:48.176739', NULL, NULL, false, 'FACULDADE DE MÚSICA CARLOS GOMES (FMCG)', 8);
INSERT INTO public.empresa VALUES (1238, true, 1, '2023-07-03 14:52:48.17796', NULL, NULL, false, 'FACULDADE DE MÚSICA DO ESPÍRITO SANTO MAURÍCIO DE OLIVEIRA (FAMES)', 25);
INSERT INTO public.empresa VALUES (1239, true, 1, '2023-07-03 14:52:48.179117', NULL, NULL, false, 'FACULDADE DE MÚSICA SOUZA LIMA (FMSL)', 8);
INSERT INTO public.empresa VALUES (1240, true, 1, '2023-07-03 14:52:48.180271', NULL, NULL, false, 'FACULDADE DE NOVA MUTUM (UNIFAMA)', 487);
INSERT INTO public.empresa VALUES (1241, true, 1, '2023-07-03 14:52:48.181369', NULL, NULL, false, 'FACULDADE DE NOVA MUTUM', 487);
INSERT INTO public.empresa VALUES (1242, true, 1, '2023-07-03 14:52:48.18252', NULL, NULL, false, 'FACULDADE DE NOVA SERRANA (FANS)', 488);
INSERT INTO public.empresa VALUES (1243, true, 1, '2023-07-03 14:52:48.183667', NULL, NULL, false, 'FACULDADE DE ODONTOLOGIA DA APCD (FAOA)', 8);
INSERT INTO public.empresa VALUES (1244, true, 1, '2023-07-03 14:52:48.184824', NULL, NULL, false, 'FACULDADE DE ODONTOLOGIA DE MANAUS (FOM)', 75);
INSERT INTO public.empresa VALUES (1245, true, 1, '2023-07-03 14:52:48.186088', NULL, NULL, false, 'FACULDADE DE ODONTOLOGIA DO RECIFE (FOR)', 60);
INSERT INTO public.empresa VALUES (1246, true, 1, '2023-07-03 14:52:48.187423', NULL, NULL, false, 'FACULDADE DE OLÍMPIA', 489);
INSERT INTO public.empresa VALUES (1247, true, 1, '2023-07-03 14:52:48.188674', NULL, NULL, false, 'FACULDADE DE OSASCO (FCO)', 158);
INSERT INTO public.empresa VALUES (1248, true, 1, '2023-07-03 14:52:48.189935', NULL, NULL, false, 'FACULDADE DE PALMAS (FAPAL)', 23);
INSERT INTO public.empresa VALUES (1249, true, 1, '2023-07-03 14:52:48.19125', NULL, NULL, false, 'FACULDADE DE PALMEIRAS DE GOIÁS - FACMAIS (FACMAIS)', 490);
INSERT INTO public.empresa VALUES (1250, true, 1, '2023-07-03 14:52:48.19252', NULL, NULL, false, 'FACULDADE DE PARÁ DE MINAS (FAPAM)', 491);
INSERT INTO public.empresa VALUES (1251, true, 1, '2023-07-03 14:52:48.193719', NULL, NULL, false, 'FACULDADE DE PEDAGOGIA (ANAEC)', 369);
INSERT INTO public.empresa VALUES (1252, true, 1, '2023-07-03 14:52:48.194838', NULL, NULL, false, 'FACULDADE DE PENÁPOLIS', 463);
INSERT INTO public.empresa VALUES (1253, true, 1, '2023-07-03 14:52:48.196048', NULL, NULL, false, 'FACULDADE DE PENEDO (FAC-PENEDO)', 492);
INSERT INTO public.empresa VALUES (1254, true, 1, '2023-07-03 14:52:48.197212', NULL, NULL, false, 'FACULDADE DE PETROLINA (FACAPE)', 445);
INSERT INTO public.empresa VALUES (1255, true, 1, '2023-07-03 14:52:48.198372', NULL, NULL, false, 'FACULDADE DE PINHAIS (FAPI)', 493);
INSERT INTO public.empresa VALUES (1256, true, 1, '2023-07-03 14:52:48.199497', NULL, NULL, false, 'FACULDADE DE PIRACANJUBA (FAP)', 494);
INSERT INTO public.empresa VALUES (1257, true, 1, '2023-07-03 14:52:48.200697', NULL, NULL, false, 'FACULDADE DE PONTA PORÃ (FAP)', 495);
INSERT INTO public.empresa VALUES (1258, true, 1, '2023-07-03 14:52:48.20198', NULL, NULL, false, 'FACULDADE DE PORTO FELIZ', 496);
INSERT INTO public.empresa VALUES (1259, true, 1, '2023-07-03 14:52:48.203208', NULL, NULL, false, 'FACULDADE DE PRESIDENTE EPITÁCIO - FAPE (FAPE)', 497);
INSERT INTO public.empresa VALUES (1260, true, 1, '2023-07-03 14:52:48.204467', NULL, NULL, false, 'FACULDADE DE PRESIDENTE PRUDENTE (FAPEPE)', 50);
INSERT INTO public.empresa VALUES (1261, true, 1, '2023-07-03 14:52:48.205715', NULL, NULL, false, 'FACULDADE DE PRESIDENTE VENCESLAU (FAPREV)', 498);
INSERT INTO public.empresa VALUES (1262, true, 1, '2023-07-03 14:52:48.206991', NULL, NULL, false, 'FACULDADE DE PRIMAVERA (CESPRI)', 499);
INSERT INTO public.empresa VALUES (1263, true, 1, '2023-07-03 14:52:48.208263', NULL, NULL, false, 'FACULDADE DE QUIXERAMOBIM (UNIQ)', 500);
INSERT INTO public.empresa VALUES (1264, true, 1, '2023-07-03 14:52:48.209571', NULL, NULL, false, 'FACULDADE DE RANCHARIA', 501);
INSERT INTO public.empresa VALUES (1265, true, 1, '2023-07-03 14:52:48.210859', NULL, NULL, false, 'FACULDADE DE RIBEIRÃO PIRES', 502);
INSERT INTO public.empresa VALUES (1266, true, 1, '2023-07-03 14:52:48.212089', NULL, NULL, false, 'FACULDADE DE RIBEIRÃO PRETO (AFARP)', 58);
INSERT INTO public.empresa VALUES (1267, true, 1, '2023-07-03 14:52:48.213456', NULL, NULL, false, 'FACULDADE DE RIO CLARO (CBTA)', 222);
INSERT INTO public.empresa VALUES (1268, true, 1, '2023-07-03 14:52:48.214931', NULL, NULL, false, 'FACULDADE DE ROLIM DE MOURA (FAROL)', 503);
INSERT INTO public.empresa VALUES (1269, true, 1, '2023-07-03 14:52:48.216145', NULL, NULL, false, 'FACULDADE DE RONDÔNIA (FARO)', 51);
INSERT INTO public.empresa VALUES (1270, true, 1, '2023-07-03 14:52:48.217353', NULL, NULL, false, 'FACULDADE DE ROSEIRA (FARO)', 504);
INSERT INTO public.empresa VALUES (1271, true, 1, '2023-07-03 14:52:48.21874', NULL, NULL, false, 'FACULDADE DE SABARÁ (SOECS)', 505);
INSERT INTO public.empresa VALUES (1272, true, 1, '2023-07-03 14:52:48.219973', NULL, NULL, false, 'FACULDADE DE SANTA BÁRBARA D''OESTE (FAP)', 288);
INSERT INTO public.empresa VALUES (1273, true, 1, '2023-07-03 14:52:48.2211', NULL, NULL, false, 'FACULDADE DE SANTA CATARINA (FASC)', 140);
INSERT INTO public.empresa VALUES (1274, true, 1, '2023-07-03 14:52:48.222295', NULL, NULL, false, 'FACULDADE DE SANTA CRUZ DA BAHIA (FSC)', 506);
INSERT INTO public.empresa VALUES (1275, true, 1, '2023-07-03 14:52:48.223542', NULL, NULL, false, 'FACULDADE DE SANTA INÊS (FSI)', 507);
INSERT INTO public.empresa VALUES (1276, true, 1, '2023-07-03 14:52:48.224778', NULL, NULL, false, 'FACULDADE DE SANTA LUZIA (FACSAL)', 508);
INSERT INTO public.empresa VALUES (1277, true, 1, '2023-07-03 14:52:48.225945', NULL, NULL, false, 'FACULDADE DE SANTANA DE PARNAÍBA (FASP)', 509);
INSERT INTO public.empresa VALUES (1278, true, 1, '2023-07-03 14:52:48.227176', NULL, NULL, false, 'FACULDADE DE SANTO ANDRÉ', 47);
INSERT INTO public.empresa VALUES (1279, true, 1, '2023-07-03 14:52:48.228442', NULL, NULL, false, 'FACULDADE DE SANTO ÂNGELO (FASA)', 348);
INSERT INTO public.empresa VALUES (1280, true, 1, '2023-07-03 14:52:48.229752', NULL, NULL, false, 'FACULDADE DE SANTO ANTONIO DA PLATINA', 510);
INSERT INTO public.empresa VALUES (1281, true, 1, '2023-07-03 14:52:48.231175', NULL, NULL, false, 'FACULDADE DE SÃO BENTO (FSB)', 8);
INSERT INTO public.empresa VALUES (1282, true, 1, '2023-07-03 14:52:48.232524', NULL, NULL, false, 'FACULDADE DE SÃO BERNARDO DO CAMPO (FAPAN)', 82);
INSERT INTO public.empresa VALUES (1283, true, 1, '2023-07-03 14:52:48.23388', NULL, NULL, false, 'FACULDADE DE SÃO BERNARDO DO CAMPO - FASB (FASB I)', 82);
INSERT INTO public.empresa VALUES (1284, true, 1, '2023-07-03 14:52:48.235181', NULL, NULL, false, 'FACULDADE DE SÃO CAETANO DO SUL', 126);
INSERT INTO public.empresa VALUES (1285, true, 1, '2023-07-03 14:52:48.236537', NULL, NULL, false, 'FACULDADE DE SÃO CARLOS (FASC)', 72);
INSERT INTO public.empresa VALUES (1286, true, 1, '2023-07-03 14:52:48.23781', NULL, NULL, false, 'FACULDADE DE SÃO LOURENÇO (FASAMA)', 511);
INSERT INTO public.empresa VALUES (1287, true, 1, '2023-07-03 14:52:48.239122', NULL, NULL, false, 'FACULDADE DE SÃO MARCOS (FACSM)', 512);
INSERT INTO public.empresa VALUES (1288, true, 1, '2023-07-03 14:52:48.240465', NULL, NULL, false, 'FACULDADE DE SÃO PAULO (FASP)', 8);
INSERT INTO public.empresa VALUES (1289, true, 1, '2023-07-03 14:52:48.241631', NULL, NULL, false, 'FACULDADE DE SÃO ROQUE (FASAR)', 191);
INSERT INTO public.empresa VALUES (1290, true, 1, '2023-07-03 14:52:48.242824', NULL, NULL, false, 'FACULDADE DE SÃO VICENTE (FSV)', 513);
INSERT INTO public.empresa VALUES (1291, true, 1, '2023-07-03 14:52:48.244164', NULL, NULL, false, 'FACULDADE DE SAÚDE, CIÊNCIAS E TECNOLOGIA - FACESB (FACESB)', 514);
INSERT INTO public.empresa VALUES (1292, true, 1, '2023-07-03 14:52:48.245417', NULL, NULL, false, 'FACULDADE DE SAÚDE DO SERTÃO DE PERNAMBUCO (FASPE)', 515);
INSERT INTO public.empresa VALUES (1293, true, 1, '2023-07-03 14:52:48.246685', NULL, NULL, false, 'FACULDADE DE SAÚDE E HUMANIDADES IBITURUNA (FASI)', 128);
INSERT INTO public.empresa VALUES (1294, true, 1, '2023-07-03 14:52:48.247865', NULL, NULL, false, 'FACULDADE DE SAÚDE SANTO AGOSTINHO DE VITÓRIA DA CONQUISTA (FASA)', 37);
INSERT INTO public.empresa VALUES (1295, true, 1, '2023-07-03 14:52:48.24993', NULL, NULL, false, 'FACULDADE DESCOMPLICA', 12);
INSERT INTO public.empresa VALUES (1296, true, 1, '2023-07-03 14:52:48.251636', NULL, NULL, false, 'FACULDADE DE SERTÃOZINHO', 291);
INSERT INTO public.empresa VALUES (1297, true, 1, '2023-07-03 14:52:48.253239', NULL, NULL, false, 'FACULDADE DE SOBRAL (FASOL)', 167);
INSERT INTO public.empresa VALUES (1298, true, 1, '2023-07-03 14:52:48.254797', NULL, NULL, false, 'FACULDADE DE SOROCABA', 146);
INSERT INTO public.empresa VALUES (1299, true, 1, '2023-07-03 14:52:48.256363', NULL, NULL, false, 'FACULDADE DE SUZANO (UNISUZ)', 184);
INSERT INTO public.empresa VALUES (1300, true, 1, '2023-07-03 14:52:48.2576', NULL, NULL, false, 'FACULDADE DE TAPEJARA (FAT)', 516);
INSERT INTO public.empresa VALUES (1301, true, 1, '2023-07-03 14:52:48.258813', NULL, NULL, false, 'FACULDADE DE TAQUARITINGA (FTGA)', 517);
INSERT INTO public.empresa VALUES (1302, true, 1, '2023-07-03 14:52:48.259958', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA AEROTD (AEROTD)', 3);
INSERT INTO public.empresa VALUES (1303, true, 1, '2023-07-03 14:52:48.261185', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ALCIDES MAYA (AMTEC)', 149);
INSERT INTO public.empresa VALUES (1304, true, 1, '2023-07-03 14:52:48.262355', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ALPHA CHANNEL (FATAC)', 8);
INSERT INTO public.empresa VALUES (1305, true, 1, '2023-07-03 14:52:48.263516', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ALTO MÉDIO SÃO FRANCISCO (FAC FUNAM)', 302);
INSERT INTO public.empresa VALUES (1306, true, 1, '2023-07-03 14:52:48.26469', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ASSESSORITEC', 68);
INSERT INTO public.empresa VALUES (1307, true, 1, '2023-07-03 14:52:48.265879', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA AVANÇADA', 264);
INSERT INTO public.empresa VALUES (1308, true, 1, '2023-07-03 14:52:48.267042', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA BANDEIRANTES (BANDTEC)', 8);
INSERT INTO public.empresa VALUES (1309, true, 1, '2023-07-03 14:52:48.268187', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA CACHOEIRO DE ITAPEMIRIM (FACI)', 190);
INSERT INTO public.empresa VALUES (1310, true, 1, '2023-07-03 14:52:48.269326', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA CENTEC - CARIRI (CENTEC)', 135);
INSERT INTO public.empresa VALUES (1311, true, 1, '2023-07-03 14:52:48.270503', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA CENTEC - SERTÃO CENTRAL (FTC SERTÃO CENTRAL)', 500);
INSERT INTO public.empresa VALUES (1312, true, 1, '2023-07-03 14:52:48.271844', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA CNA (FATECNA)', 5);
INSERT INTO public.empresa VALUES (1313, true, 1, '2023-07-03 14:52:48.273087', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA COESP (FCOESP)', 107);
INSERT INTO public.empresa VALUES (1314, true, 1, '2023-07-03 14:52:48.274275', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DA AMAZÔNIA (FATEC)', 75);
INSERT INTO public.empresa VALUES (1315, true, 1, '2023-07-03 14:52:48.275415', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DA PARAÍBA (FATECPB)', 204);
INSERT INTO public.empresa VALUES (1316, true, 1, '2023-07-03 14:52:48.276595', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ADAMANTINA', 91);
INSERT INTO public.empresa VALUES (1317, true, 1, '2023-07-03 14:52:48.277733', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE AMERICANA "MINISTRO RALPH BIASI" (FATEC-AM)', 187);
INSERT INTO public.empresa VALUES (1318, true, 1, '2023-07-03 14:52:48.27897', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ARAÇATUBA (FATEC ARAÇATUBA)', 197);
INSERT INTO public.empresa VALUES (1319, true, 1, '2023-07-03 14:52:48.280274', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ARARAQUARA (FATEC ARQ)', 378);
INSERT INTO public.empresa VALUES (1320, true, 1, '2023-07-03 14:52:48.281432', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ARARAS', 83);
INSERT INTO public.empresa VALUES (1321, true, 1, '2023-07-03 14:52:48.282557', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ASSIS (FATEC ASSIS)', 379);
INSERT INTO public.empresa VALUES (1322, true, 1, '2023-07-03 14:52:48.283789', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE BARUERI (FATEC BARUERI)', 381);
INSERT INTO public.empresa VALUES (1323, true, 1, '2023-07-03 14:52:48.28495', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE BAURU (FATEC)', 93);
INSERT INTO public.empresa VALUES (1324, true, 1, '2023-07-03 14:52:48.28618', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE BOTUCATU (FATEC BT)', 383);
INSERT INTO public.empresa VALUES (1325, true, 1, '2023-07-03 14:52:48.287448', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE BRAGANÇA PAULISTA', 404);
INSERT INTO public.empresa VALUES (1326, true, 1, '2023-07-03 14:52:48.288648', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CAMPINAS (FATEC CAMPINAS)', 177);
INSERT INTO public.empresa VALUES (1327, true, 1, '2023-07-03 14:52:48.289801', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CAPÃO BONITO (FATEC-CB)', 518);
INSERT INTO public.empresa VALUES (1328, true, 1, '2023-07-03 14:52:48.290961', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CARAPICUIBA (FATEC)', 519);
INSERT INTO public.empresa VALUES (1329, true, 1, '2023-07-03 14:52:48.292141', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CATANDUVA (FATEC CATANDUVA)', 181);
INSERT INTO public.empresa VALUES (1330, true, 1, '2023-07-03 14:52:48.293302', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE COTIA (FATEC COTIA)', 520);
INSERT INTO public.empresa VALUES (1331, true, 1, '2023-07-03 14:52:48.294553', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE CRUZEIRO DO OESTE (FACO)', 521);
INSERT INTO public.empresa VALUES (1332, true, 1, '2023-07-03 14:52:48.295731', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE DIADEMA LUIGI PAPAIZ (FATEC DIADEMA)', 522);
INSERT INTO public.empresa VALUES (1333, true, 1, '2023-07-03 14:52:48.29695', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE FERRAZ DE VASCONCELOS', 523);
INSERT INTO public.empresa VALUES (1334, true, 1, '2023-07-03 14:52:48.298125', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE FRANCO DA ROCHA', 524);
INSERT INTO public.empresa VALUES (1335, true, 1, '2023-07-03 14:52:48.299252', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE GARÇA (FATECGA)', 457);
INSERT INTO public.empresa VALUES (1336, true, 1, '2023-07-03 14:52:48.300452', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE GUARATINGUETÁ (FATEC GT)', 363);
INSERT INTO public.empresa VALUES (1337, true, 1, '2023-07-03 14:52:48.301663', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE GUARULHOS (FATEC GR)', 100);
INSERT INTO public.empresa VALUES (1338, true, 1, '2023-07-03 14:52:48.302831', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE HORIZONTE (FATHOR)', 525);
INSERT INTO public.empresa VALUES (1339, true, 1, '2023-07-03 14:52:48.303978', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE INDAIATUBA (FATEC-ID)', 11);
INSERT INTO public.empresa VALUES (1340, true, 1, '2023-07-03 14:52:48.305077', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITAPETININGA - PROF.ANTÔNIO BELIZANDRO BARBOSA REZENDE (FATEC - ITAPETININGA)', 271);
INSERT INTO public.empresa VALUES (1341, true, 1, '2023-07-03 14:52:48.306269', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITAPIRA (FATEC ITAPIRA)', 104);
INSERT INTO public.empresa VALUES (1342, true, 1, '2023-07-03 14:52:48.307535', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITAQUAQUECETUBA (FATEC ITAQUA)', 526);
INSERT INTO public.empresa VALUES (1343, true, 1, '2023-07-03 14:52:48.308742', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITAQUERA (FATEC ITAQUERA)', 8);
INSERT INTO public.empresa VALUES (1344, true, 1, '2023-07-03 14:52:48.309896', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE ITATIBA (FATEC ITATIBA)', 527);
INSERT INTO public.empresa VALUES (1345, true, 1, '2023-07-03 14:52:48.311084', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE JACAREÍ (FATEC JACAREÍ)', 273);
INSERT INTO public.empresa VALUES (1346, true, 1, '2023-07-03 14:52:48.312253', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE JAHU (FATEC-JAHU)', 274);
INSERT INTO public.empresa VALUES (1347, true, 1, '2023-07-03 14:52:48.313406', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE JALES (FATEC JALES)', 106);
INSERT INTO public.empresa VALUES (1348, true, 1, '2023-07-03 14:52:48.314578', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE JUNDIAÍ (FATEC/JD)', 182);
INSERT INTO public.empresa VALUES (1349, true, 1, '2023-07-03 14:52:48.315743', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE MATÃO', 278);
INSERT INTO public.empresa VALUES (1350, true, 1, '2023-07-03 14:52:48.31687', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE MAUÁ (FATEC MAUÁ)', 480);
INSERT INTO public.empresa VALUES (1351, true, 1, '2023-07-03 14:52:48.31812', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE MOCOCA (FATEC)', 528);
INSERT INTO public.empresa VALUES (1352, true, 1, '2023-07-03 14:52:48.319335', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE MOGI DAS CRUZES (FATEC-MC)', 62);
INSERT INTO public.empresa VALUES (1353, true, 1, '2023-07-03 14:52:48.320471', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE OSASCO - PREFEITO HIRANT SANAZAR (FATEC OSASCO)', 158);
INSERT INTO public.empresa VALUES (1354, true, 1, '2023-07-03 14:52:48.321601', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE OURINHOS (FATEC)', 89);
INSERT INTO public.empresa VALUES (1355, true, 1, '2023-07-03 14:52:48.322727', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PINDAMONHANGABA (FATEC PI)', 162);
INSERT INTO public.empresa VALUES (1356, true, 1, '2023-07-03 14:52:48.323892', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PIRACICABA (FATEC PIRACICABA)', 224);
INSERT INTO public.empresa VALUES (1357, true, 1, '2023-07-03 14:52:48.325065', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PIRACICABA (FATEP)', 224);
INSERT INTO public.empresa VALUES (1358, true, 1, '2023-07-03 14:52:48.326251', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE POMPEIA - SHUNJI NISHIMURA (FATEC POMPEIA)', 529);
INSERT INTO public.empresa VALUES (1359, true, 1, '2023-07-03 14:52:48.327517', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PONTA PORÃ (FATEP)', 495);
INSERT INTO public.empresa VALUES (1360, true, 1, '2023-07-03 14:52:48.328773', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PRAIA GRANDE (FATECPG)', 250);
INSERT INTO public.empresa VALUES (1361, true, 1, '2023-07-03 14:52:48.330037', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE PRESIDENTE PRUDENTE (FATEC)', 50);
INSERT INTO public.empresa VALUES (1362, true, 1, '2023-07-03 14:52:48.331346', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SANTANA DE PARNAÍBA (FATEC-SPB)', 509);
INSERT INTO public.empresa VALUES (1363, true, 1, '2023-07-03 14:52:48.332583', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO BERNARDO DO CAMPO (FATEC-SB)', 82);
INSERT INTO public.empresa VALUES (1364, true, 1, '2023-07-03 14:52:48.333917', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO CAETANO DO SUL (FATEC SCS)', 126);
INSERT INTO public.empresa VALUES (1365, true, 1, '2023-07-03 14:52:48.335141', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO CARLOS (FATEC SÃO CARLO)', 72);
INSERT INTO public.empresa VALUES (1366, true, 1, '2023-07-03 14:52:48.336406', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO JOSÉ DO RIO PRETO (FATECRP)', 114);
INSERT INTO public.empresa VALUES (1367, true, 1, '2023-07-03 14:52:48.337714', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO JOSÉ DOS CAMPOS - JESSEN VIDAL (FATECSJCAMPOS)', 144);
INSERT INTO public.empresa VALUES (1368, true, 1, '2023-07-03 14:52:48.339242', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO PAULO (FATEC-SP)', 8);
INSERT INTO public.empresa VALUES (1369, true, 1, '2023-07-03 14:52:48.340802', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO ROQUE (FATEC-SR)', 191);
INSERT INTO public.empresa VALUES (1370, true, 1, '2023-07-03 14:52:48.342421', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO SEBASTIÃO (FATEC SS)', 530);
INSERT INTO public.empresa VALUES (1371, true, 1, '2023-07-03 14:52:48.344076', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SÃO VICENTE (FATEF)', 513);
INSERT INTO public.empresa VALUES (1372, true, 1, '2023-07-03 14:52:48.345269', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SERTÃOZINHO (FATEC SERTÃOZINHO)', 291);
INSERT INTO public.empresa VALUES (1373, true, 1, '2023-07-03 14:52:48.346395', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SINOP (FASTECH)', 155);
INSERT INTO public.empresa VALUES (1374, true, 1, '2023-07-03 14:52:48.347526', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SOROCABA (FATEC SO)', 146);
INSERT INTO public.empresa VALUES (1375, true, 1, '2023-07-03 14:52:48.34878', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE SUMARÉ (FATEC DE SUMARÉ)', 293);
INSERT INTO public.empresa VALUES (1376, true, 1, '2023-07-03 14:52:48.349853', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE TAQUARITINGA (FATEC/TQ)', 517);
INSERT INTO public.empresa VALUES (1377, true, 1, '2023-07-03 14:52:48.351003', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE TATUÍ - PROF. WILSON ROBERTO RIBEIRO DE CAMARGO (FATEC TATUÍ)', 458);
INSERT INTO public.empresa VALUES (1378, true, 1, '2023-07-03 14:52:48.352171', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE TAUBATÉ (FATEC TAUBATÉ)', 33);
INSERT INTO public.empresa VALUES (1379, true, 1, '2023-07-03 14:52:48.353387', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DE TERESINA (FACULDADE CET)', 27);
INSERT INTO public.empresa VALUES (1380, true, 1, '2023-07-03 14:52:48.354548', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO AMAPÁ (META)', 26);
INSERT INTO public.empresa VALUES (1381, true, 1, '2023-07-03 14:52:48.355667', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO BRASIL (FAT BRASIL)', 531);
INSERT INTO public.empresa VALUES (1382, true, 1, '2023-07-03 14:52:48.356793', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO COOPERATIVISMO', 149);
INSERT INTO public.empresa VALUES (1383, true, 1, '2023-07-03 14:52:48.357956', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO IPIRANGA (FATECIPI)', 8);
INSERT INTO public.empresa VALUES (1384, true, 1, '2023-07-03 14:52:48.359128', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DOM AMAURY CASTANHO (FATEC ITU)', 180);
INSERT INTO public.empresa VALUES (1385, true, 1, '2023-07-03 14:52:48.3603', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO NORDESTE (FATENE)', 45);
INSERT INTO public.empresa VALUES (1386, true, 1, '2023-07-03 14:52:48.361461', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO PIAUÍ (FATEPI)', 27);
INSERT INTO public.empresa VALUES (1387, true, 1, '2023-07-03 14:52:48.36276', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO TATUAPÉ (FATEC-TT)', 8);
INSERT INTO public.empresa VALUES (1388, true, 1, '2023-07-03 14:52:48.363857', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DO VALE DO IVAÍ (FATEC-IVAI)', 532);
INSERT INTO public.empresa VALUES (1389, true, 1, '2023-07-03 14:52:48.365112', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA DR. THOMAZ NOVELINO (FATEC FRANCA)', 179);
INSERT INTO public.empresa VALUES (1390, true, 1, '2023-07-03 14:52:48.366306', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E ADMINISTRAÇÃO EDUFOR (EDUFOR)', 141);
INSERT INTO public.empresa VALUES (1391, true, 1, '2023-07-03 14:52:48.367566', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS (FTC JUAZEIRO)', 533);
INSERT INTO public.empresa VALUES (1392, true, 1, '2023-07-03 14:52:48.36878', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DA BAHIA (FATEC/BA)', 213);
INSERT INTO public.empresa VALUES (1393, true, 1, '2023-07-03 14:52:48.369957', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE CAMPINA GRANDE (FTC CAMP GRANDE)', 147);
INSERT INTO public.empresa VALUES (1394, true, 1, '2023-07-03 14:52:48.371259', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE ITABUNA (FTC)', 269);
INSERT INTO public.empresa VALUES (1395, true, 1, '2023-07-03 14:52:48.372781', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE JEQUIÉ (FTC)', 275);
INSERT INTO public.empresa VALUES (1396, true, 1, '2023-07-03 14:52:48.373967', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE TERESINA (FTC TERESINA)', 27);
INSERT INTO public.empresa VALUES (1397, true, 1, '2023-07-03 14:52:48.37512', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS DO ALTO PARANAÍBA (FATAP)', 125);
INSERT INTO public.empresa VALUES (1398, true, 1, '2023-07-03 14:52:48.376328', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CAMAÇARI (FTC CAMAÇARI)', 153);
INSERT INTO public.empresa VALUES (1399, true, 1, '2023-07-03 14:52:48.377558', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CARUARU (FTC - CARUARU)', 156);
INSERT INTO public.empresa VALUES (1400, true, 1, '2023-07-03 14:52:48.378702', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CAUCAIA (FTC CAUCAIA)', 534);
INSERT INTO public.empresa VALUES (1401, true, 1, '2023-07-03 14:52:48.379892', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC ITAPIPOCA (FTC ITAPIPOCA)', 535);
INSERT INTO public.empresa VALUES (1402, true, 1, '2023-07-03 14:52:48.381082', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC JUAZEIRO DO NORTE (FTC JUAZEIRO CE)', 135);
INSERT INTO public.empresa VALUES (1403, true, 1, '2023-07-03 14:52:48.382341', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC N. SRA. DO SOCORRO (FTC N S SOCORRO)', 536);
INSERT INTO public.empresa VALUES (1404, true, 1, '2023-07-03 14:52:48.38353', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC PARNAMIRIM (FTC PARNAMIRIM)', 537);
INSERT INTO public.empresa VALUES (1405, true, 1, '2023-07-03 14:52:48.384667', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC PETROLINA (FTC PETROLINA)', 445);
INSERT INTO public.empresa VALUES (1406, true, 1, '2023-07-03 14:52:48.385799', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC TEIXEIRA DE FREITAS (FTC)', 295);
INSERT INTO public.empresa VALUES (1407, true, 1, '2023-07-03 14:52:48.387046', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E DESENVOLVIMENTO DE COMPETÊNCIAS (FDC)', 79);
INSERT INTO public.empresa VALUES (1408, true, 1, '2023-07-03 14:52:48.388147', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA, EDUCAÇÃO SUPERIOR E PROFISSIONAL (FATESP)', 27);
INSERT INTO public.empresa VALUES (1409, true, 1, '2023-07-03 14:52:48.389269', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E EDUCAÇÃO DE GOIÁS (FATEG)', 538);
INSERT INTO public.empresa VALUES (1410, true, 1, '2023-07-03 14:52:48.39055', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E EDUCAÇÃO SUPERIOR E PROFISSIONALIZ (FATESP)', 539);
INSERT INTO public.empresa VALUES (1411, true, 1, '2023-07-03 14:52:48.39179', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EGÍDIO JOSÉ DA SILVA (FATEGIDIO)', 7);
INSERT INTO public.empresa VALUES (1412, true, 1, '2023-07-03 14:52:48.392972', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E INOVAÇÃO SENAC DF', 5);
INSERT INTO public.empresa VALUES (1413, true, 1, '2023-07-03 14:52:48.394113', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EM HOTELARIA, GASTRONOMIA E TURISMO DE SÃO PAULO (HOTEC)', 8);
INSERT INTO public.empresa VALUES (1414, true, 1, '2023-07-03 14:52:48.395242', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EM SAÚDE (FATESA)', 58);
INSERT INTO public.empresa VALUES (1415, true, 1, '2023-07-03 14:52:48.396421', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EM SAÚDE CIEPH (FACTES)', 3);
INSERT INTO public.empresa VALUES (1416, true, 1, '2023-07-03 14:52:48.397539', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA EM SAÚDE - IAHCS (FATESA)', 149);
INSERT INTO public.empresa VALUES (1417, true, 1, '2023-07-03 14:52:48.398714', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA E NEGÓCIOS DE CATALÃO (FATENC)', 17);
INSERT INTO public.empresa VALUES (1418, true, 1, '2023-07-03 14:52:48.399835', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ESTÁCIO DE CURITIBA (FATEC ESTÁC CURITIBA)', 56);
INSERT INTO public.empresa VALUES (1419, true, 1, '2023-07-03 14:52:48.401147', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ESTUDANTE RAFAEL ALMEIDA CAMARINHA - MARILIA (FATEC MARILIA)', 145);
INSERT INTO public.empresa VALUES (1420, true, 1, '2023-07-03 14:52:48.402423', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FAESA (CET-FAESA)', 25);
INSERT INTO public.empresa VALUES (1421, true, 1, '2023-07-03 14:52:48.403563', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA - FATEC DE RIBEIRÃO PRETO', 58);
INSERT INTO public.empresa VALUES (1422, true, 1, '2023-07-03 14:52:48.404833', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FRANCISCO MORATO (FFRAMO)', 540);
INSERT INTO public.empresa VALUES (1423, true, 1, '2023-07-03 14:52:48.406012', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FTEC (FTEC NOVO HAMBURGO)', 541);
INSERT INTO public.empresa VALUES (1424, true, 1, '2023-07-03 14:52:48.407118', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FTEC DE PORTO ALEGRE (FTEC PORTO ALEGRE)', 149);
INSERT INTO public.empresa VALUES (1425, true, 1, '2023-07-03 14:52:48.408261', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA FUTURO (FATEC FUTURO)', 56);
INSERT INTO public.empresa VALUES (1426, true, 1, '2023-07-03 14:52:48.409427', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA GAP (GAP)', 264);
INSERT INTO public.empresa VALUES (1427, true, 1, '2023-07-03 14:52:48.410588', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IBRATE (FAITEC)', 56);
INSERT INTO public.empresa VALUES (1428, true, 1, '2023-07-03 14:52:48.411683', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ÍCONE (FACTI)', 5);
INSERT INTO public.empresa VALUES (1429, true, 1, '2023-07-03 14:52:48.412835', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA INFORMÁTICA (FATI)', 45);
INSERT INTO public.empresa VALUES (1430, true, 1, '2023-07-03 14:52:48.414022', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IPANEMA', 146);
INSERT INTO public.empresa VALUES (1431, true, 1, '2023-07-03 14:52:48.41525', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IPEP DE CAMPINAS (FATEC CAMPINAS)', 177);
INSERT INTO public.empresa VALUES (1432, true, 1, '2023-07-03 14:52:48.416457', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IPPEO (IPPEO)', 56);
INSERT INTO public.empresa VALUES (1433, true, 1, '2023-07-03 14:52:48.417557', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA IPUC (FATIPUC)', 542);
INSERT INTO public.empresa VALUES (1434, true, 1, '2023-07-03 14:52:48.418701', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA JARDIM (FATEJ)', 47);
INSERT INTO public.empresa VALUES (1435, true, 1, '2023-07-03 14:52:48.419933', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA JORGE CARAM SABBAG (FATEC BEBEDOURO)', 208);
INSERT INTO public.empresa VALUES (1436, true, 1, '2023-07-03 14:52:48.421037', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA LA SALLE - ESTRELA (FACSALLE)', 543);
INSERT INTO public.empresa VALUES (1437, true, 1, '2023-07-03 14:52:48.422217', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA NILO DE STÉFANI - JABOTICABAL (FATEC JBL)', 315);
INSERT INTO public.empresa VALUES (1438, true, 1, '2023-07-03 14:52:48.423368', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA NOVA PALHOÇA (FATENP)', 544);
INSERT INTO public.empresa VALUES (1439, true, 1, '2023-07-03 14:52:48.424564', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA OSWALDO CRUZ (FATEC OSWALDO CRUZ)', 8);
INSERT INTO public.empresa VALUES (1440, true, 1, '2023-07-03 14:52:48.426079', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PAULISTA', 545);
INSERT INTO public.empresa VALUES (1441, true, 1, '2023-07-03 14:52:48.427633', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PENTÁGONO (FATEP)', 47);
INSERT INTO public.empresa VALUES (1442, true, 1, '2023-07-03 14:52:48.429182', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PORTO DAS MONÇÕES (FAMO)', 496);
INSERT INTO public.empresa VALUES (1443, true, 1, '2023-07-03 14:52:48.430716', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PORTO SUL (FAPS)', 250);
INSERT INTO public.empresa VALUES (1444, true, 1, '2023-07-03 14:52:48.431863', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA PROFESSOR ANTÔNIO SEABRA (FATEC LINS)', 70);
INSERT INTO public.empresa VALUES (1445, true, 1, '2023-07-03 14:52:48.433033', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA RUBENS LARA (FATEC-BS)', 171);
INSERT INTO public.empresa VALUES (1446, true, 1, '2023-07-03 14:52:48.434168', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SAINT PAUL', 8);
INSERT INTO public.empresa VALUES (1447, true, 1, '2023-07-03 14:52:48.435362', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SANTO ANDRÉ (FATEC-SA)', 47);
INSERT INTO public.empresa VALUES (1448, true, 1, '2023-07-03 14:52:48.436518', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SEBRAE (FATEC SEBRAE)', 8);
INSERT INTO public.empresa VALUES (1449, true, 1, '2023-07-03 14:52:48.437661', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC AMAZONAS', 75);
INSERT INTO public.empresa VALUES (1450, true, 1, '2023-07-03 14:52:48.438814', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC CASCAVEL', 54);
INSERT INTO public.empresa VALUES (1451, true, 1, '2023-07-03 14:52:48.440007', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC CURITIBA', 56);
INSERT INTO public.empresa VALUES (1452, true, 1, '2023-07-03 14:52:48.44116', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC CURITIBA PORTÃO', 56);
INSERT INTO public.empresa VALUES (1453, true, 1, '2023-07-03 14:52:48.442324', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC MARINGÁ', 76);
INSERT INTO public.empresa VALUES (1454, true, 1, '2023-07-03 14:52:48.443465', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC MINAS - UNIDADE BARBACENA', 32);
INSERT INTO public.empresa VALUES (1455, true, 1, '2023-07-03 14:52:48.444655', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC MINAS - UNIDADE BELO HORIZONTE (FTS)', 2);
INSERT INTO public.empresa VALUES (1456, true, 1, '2023-07-03 14:52:48.445803', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC PELOTAS (FATEC SENAC PELOTAS)', 283);
INSERT INTO public.empresa VALUES (1457, true, 1, '2023-07-03 14:52:48.446953', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC PONTA GROSSA', 188);
INSERT INTO public.empresa VALUES (1458, true, 1, '2023-07-03 14:52:48.4481', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAC RIO (FATEC)', 12);
INSERT INTO public.empresa VALUES (1459, true, 1, '2023-07-03 14:52:48.449284', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI ANTÔNIO ADOLPHO LOBBE', 72);
INSERT INTO public.empresa VALUES (1460, true, 1, '2023-07-03 14:52:48.450502', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI CAMPO GRANDE', 48);
INSERT INTO public.empresa VALUES (1461, true, 1, '2023-07-03 14:52:48.451754', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI CHAPECÓ (SENAI)', 406);
INSERT INTO public.empresa VALUES (1462, true, 1, '2023-07-03 14:52:48.453135', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI CIC', 56);
INSERT INTO public.empresa VALUES (1463, true, 1, '2023-07-03 14:52:48.454704', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI CURITIBA', 56);
INSERT INTO public.empresa VALUES (1464, true, 1, '2023-07-03 14:52:48.45601', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI DE DESENVOLVIMENTO GERENCIAL (FATESG)', 42);
INSERT INTO public.empresa VALUES (1465, true, 1, '2023-07-03 14:52:48.457262', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI DOURADOS (FATEC DOURADOS)', 84);
INSERT INTO public.empresa VALUES (1466, true, 1, '2023-07-03 14:52:48.458479', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI FELIX GUISARD', 33);
INSERT INTO public.empresa VALUES (1467, true, 1, '2023-07-03 14:52:48.459705', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI FLORIANÓPOLIS (SENAI -SC - CTAI)', 3);
INSERT INTO public.empresa VALUES (1468, true, 1, '2023-07-03 14:52:48.460972', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI GASPAR RICARDO JUNIOR', 146);
INSERT INTO public.empresa VALUES (1469, true, 1, '2023-07-03 14:52:48.462125', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI ÍTALO BOLOGNA (FATECIB)', 42);
INSERT INTO public.empresa VALUES (1470, true, 1, '2023-07-03 14:52:48.463348', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI JARAGUÁ DO SUL (FATEC)', 31);
INSERT INTO public.empresa VALUES (1471, true, 1, '2023-07-03 14:52:48.4646', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI JOINVILLE (SENAI DE JOINVILLE)', 68);
INSERT INTO public.empresa VALUES (1472, true, 1, '2023-07-03 14:52:48.465834', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI LONDRINA', 159);
INSERT INTO public.empresa VALUES (1473, true, 1, '2023-07-03 14:52:48.466999', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI MARIO AMATO (SENAI)', 82);
INSERT INTO public.empresa VALUES (1474, true, 1, '2023-07-03 14:52:48.468173', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI MATO GROSSO (FATEC SENAI MT)', 203);
INSERT INTO public.empresa VALUES (1475, true, 1, '2023-07-03 14:52:48.469328', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI NADIR DIAS DE FIGUEIREDO', 158);
INSERT INTO public.empresa VALUES (1476, true, 1, '2023-07-03 14:52:48.470443', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI PERNAMBUCO', 60);
INSERT INTO public.empresa VALUES (1477, true, 1, '2023-07-03 14:52:48.471738', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI PORTO ALEGRE (FATEC SENAI)', 149);
INSERT INTO public.empresa VALUES (1478, true, 1, '2023-07-03 14:52:48.472945', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI ROBERTO MANGE', 177);
INSERT INTO public.empresa VALUES (1479, true, 1, '2023-07-03 14:52:48.474125', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA SENAI ROBERTO MANGE (FATEC SENAI RM)', 264);
INSERT INTO public.empresa VALUES (1480, true, 1, '2023-07-03 14:52:48.475318', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA TUPY DE SÃO BENTO DO SUL (FTT-SBS)', 546);
INSERT INTO public.empresa VALUES (1481, true, 1, '2023-07-03 14:52:48.476435', NULL, NULL, false, 'FACULDADE DE TECNOLOGIA ZONA LESTE (FATEC-ZL)', 8);
INSERT INTO public.empresa VALUES (1482, true, 1, '2023-07-03 14:52:48.477571', NULL, NULL, false, 'FACULDADE DE TECONOLOGIA DA ZONA SUL (FATEC ZONASUL)', 8);
INSERT INTO public.empresa VALUES (1483, true, 1, '2023-07-03 14:52:48.478746', NULL, NULL, false, 'FACULDADE DE TEODORO SAMPAIO (FTS)', 547);
INSERT INTO public.empresa VALUES (1484, true, 1, '2023-07-03 14:52:48.479894', NULL, NULL, false, 'FACULDADE DE TEOLOGIA DA ARQUIDIOCESE DE BRASÍLIA (FATEO)', 5);
INSERT INTO public.empresa VALUES (1485, true, 1, '2023-07-03 14:52:48.481029', NULL, NULL, false, 'FACULDADE DE TEOLOGIA DE SÃO PAULO DA IGREJA PRESBITERIANA INDEPENDENTE DO BRASIL', 8);
INSERT INTO public.empresa VALUES (1486, true, 1, '2023-07-03 14:52:48.482196', NULL, NULL, false, 'FACULDADE DE TEOLOGIA E CIÊNCIAS HUMANAS (FATECH)', 26);
INSERT INTO public.empresa VALUES (1487, true, 1, '2023-07-03 14:52:48.483375', NULL, NULL, false, 'FACULDADE DE TEOLOGIA E CIÊNCIAS HUMANAS (ITEPAFACULDADES)', 282);
INSERT INTO public.empresa VALUES (1488, true, 1, '2023-07-03 14:52:48.484521', NULL, NULL, false, 'FACULDADE DE TEOLOGIA EVANGÉLICA EM CURITIBA - FATEV (FATEV)', 56);
INSERT INTO public.empresa VALUES (1489, true, 1, '2023-07-03 14:52:48.485662', NULL, NULL, false, 'FACULDADE DE TEOLOGIA, FILOSOFIA E CIÊNCIAS HUMANAS GAMALIEL (FATEFIG)', 418);
INSERT INTO public.empresa VALUES (1490, true, 1, '2023-07-03 14:52:48.486841', NULL, NULL, false, 'FACULDADE DE TEOLOGIA FORTALEZA - FATEFOR (FATEFOR)', 45);
INSERT INTO public.empresa VALUES (1491, true, 1, '2023-07-03 14:52:48.488011', NULL, NULL, false, 'FACULDADE DE TEOLOGIA INTEGRADA (FATIN)', 413);
INSERT INTO public.empresa VALUES (1492, true, 1, '2023-07-03 14:52:48.489153', NULL, NULL, false, 'FACULDADE DE TIETÊ', 548);
INSERT INTO public.empresa VALUES (1493, true, 1, '2023-07-03 14:52:48.490313', NULL, NULL, false, 'FACULDADE DE TUPÃ', 354);
INSERT INTO public.empresa VALUES (1494, true, 1, '2023-07-03 14:52:48.491472', NULL, NULL, false, 'FACULDADE DE VIÇOSA (FDV)', 122);
INSERT INTO public.empresa VALUES (1495, true, 1, '2023-07-03 14:52:48.492665', NULL, NULL, false, 'FACULDADE DE VITÓRIA', 25);
INSERT INTO public.empresa VALUES (1496, true, 1, '2023-07-03 14:52:48.493804', NULL, NULL, false, 'FACULDADE DIADEMA (FAD)', 522);
INSERT INTO public.empresa VALUES (1497, true, 1, '2023-07-03 14:52:48.494952', NULL, NULL, false, 'FACULDADE DINÂMICA (FACDIN)', 549);
INSERT INTO public.empresa VALUES (1498, true, 1, '2023-07-03 14:52:48.496121', NULL, NULL, false, 'FACULDADE DINÂMICA DO VALE DO PIRANGA (FADIP)', 550);
INSERT INTO public.empresa VALUES (1499, true, 1, '2023-07-03 14:52:48.497298', NULL, NULL, false, 'FACULDADE DIOCESANA SÃO JOSÉ (FADISI)', 143);
INSERT INTO public.empresa VALUES (1500, true, 1, '2023-07-03 14:52:48.498415', NULL, NULL, false, 'FACULDADE DO AMAZONAS (IAES)', 75);
INSERT INTO public.empresa VALUES (1501, true, 1, '2023-07-03 14:52:48.499612', NULL, NULL, false, 'FACULDADE DO AMAZONAS DE ENSINO, PESQUISA E INOVAÇÃO (FAMEPI)', 75);
INSERT INTO public.empresa VALUES (1502, true, 1, '2023-07-03 14:52:48.50074', NULL, NULL, false, 'FACULDADE DO BAIXO PARNAÍBA (FAP)', 551);
INSERT INTO public.empresa VALUES (1503, true, 1, '2023-07-03 14:52:48.501904', NULL, NULL, false, 'FACULDADE DO BELO JARDIM (FBJ)', 395);
INSERT INTO public.empresa VALUES (1504, true, 1, '2023-07-03 14:52:48.503031', NULL, NULL, false, 'FACULDADE DO CARIRI PARAIBANO (UNICIR)', 552);
INSERT INTO public.empresa VALUES (1505, true, 1, '2023-07-03 14:52:48.504165', NULL, NULL, false, 'FACULDADE DO CEFI (FACEFI)', 149);
INSERT INTO public.empresa VALUES (1506, true, 1, '2023-07-03 14:52:48.505319', NULL, NULL, false, 'FACULDADE DO CENTRO EDUCACIONAL MINEIRO - FACEM (FACEM-BH)', 2);
INSERT INTO public.empresa VALUES (1507, true, 1, '2023-07-03 14:52:48.506518', NULL, NULL, false, 'FACULDADE DO CENTRO EDUCACIONAL SANTA ISABEL (FACESI)', 553);
INSERT INTO public.empresa VALUES (1508, true, 1, '2023-07-03 14:52:48.507657', NULL, NULL, false, 'FACULDADE DO CENTRO LESTE (UCL)', 290);
INSERT INTO public.empresa VALUES (1509, true, 1, '2023-07-03 14:52:48.508806', NULL, NULL, false, 'FACULDADE DO CENTRO MARANHENSE (FCMA)', 554);
INSERT INTO public.empresa VALUES (1510, true, 1, '2023-07-03 14:52:48.509945', NULL, NULL, false, 'FACULDADE DO CENTRO OESTE PAULISTA (FACOP)', 555);
INSERT INTO public.empresa VALUES (1511, true, 1, '2023-07-03 14:52:48.51112', NULL, NULL, false, 'FACULDADE DOCKTOR (FADOCKTOR)', 154);
INSERT INTO public.empresa VALUES (1512, true, 1, '2023-07-03 14:52:48.512641', NULL, NULL, false, 'FACULDADE DO CLUBE NÁUTICO MOGIANO (FCNM)', 62);
INSERT INTO public.empresa VALUES (1513, true, 1, '2023-07-03 14:52:48.514137', NULL, NULL, false, 'FACULDADE DO COMÉRCIO DE SÃO PAULO (FAC-SP)', 8);
INSERT INTO public.empresa VALUES (1514, true, 1, '2023-07-03 14:52:48.515686', NULL, NULL, false, 'FACULDADE DO COMPLEXO EDUCACIONAL SANTO ANDRÉ (FACESA)', 556);
INSERT INTO public.empresa VALUES (1515, true, 1, '2023-07-03 14:52:48.517239', NULL, NULL, false, 'FACULDADE DOCTUM DA ZONA NORTE DE JUIZ DE FORA (DOCTUM)', 38);
INSERT INTO public.empresa VALUES (1516, true, 1, '2023-07-03 14:52:48.518367', NULL, NULL, false, 'FACULDADE DOCTUM DE ALMENARA (DOCTUM)', 252);
INSERT INTO public.empresa VALUES (1517, true, 1, '2023-07-03 14:52:48.519516', NULL, NULL, false, 'FACULDADE DOCTUM DE CARANGOLA (DOCTUM)', 557);
INSERT INTO public.empresa VALUES (1518, true, 1, '2023-07-03 14:52:48.520646', NULL, NULL, false, 'FACULDADE DOCTUM DE JOÃO MONLEVADE (DOCTUM)', 558);
INSERT INTO public.empresa VALUES (1519, true, 1, '2023-07-03 14:52:48.52185', NULL, NULL, false, 'FACULDADE DOCTUM DE JUIZ DE FORA (DOCTUM)', 38);
INSERT INTO public.empresa VALUES (1520, true, 1, '2023-07-03 14:52:48.522957', NULL, NULL, false, 'FACULDADE DOCTUM DE MANHUAÇU - DOCTUM (FCM)', 207);
INSERT INTO public.empresa VALUES (1521, true, 1, '2023-07-03 14:52:48.524049', NULL, NULL, false, 'FACULDADE DOCTUM DE SERRA (DOCTUM)', 290);
INSERT INTO public.empresa VALUES (1522, true, 1, '2023-07-03 14:52:48.525197', NULL, NULL, false, 'FACULDADE DOCTUM DE SETE LAGOAS (DOCTUM)', 24);
INSERT INTO public.empresa VALUES (1523, true, 1, '2023-07-03 14:52:48.526347', NULL, NULL, false, 'FACULDADE DOCTUM DE VILA VELHA (DOCTUM)', 226);
INSERT INTO public.empresa VALUES (1524, true, 1, '2023-07-03 14:52:48.527447', NULL, NULL, false, 'FACULDADE DOCTUM DE VITÓRIA (DOCTUM)', 25);
INSERT INTO public.empresa VALUES (1525, true, 1, '2023-07-03 14:52:48.528603', NULL, NULL, false, 'FACULDADE DO EDUCADOR (FEDUC)', 8);
INSERT INTO public.empresa VALUES (1526, true, 1, '2023-07-03 14:52:48.529746', NULL, NULL, false, 'FACULDADE DO ESTADO DE SÃO PAULO (ESP)', 197);
INSERT INTO public.empresa VALUES (1527, true, 1, '2023-07-03 14:52:48.530947', NULL, NULL, false, 'FACULDADE DO ESTADO DO MARANHÃO (FACEM)', 141);
INSERT INTO public.empresa VALUES (1528, true, 1, '2023-07-03 14:52:48.532014', NULL, NULL, false, 'FACULDADE DO ESTADO DO RIO DE JANEIRO (FAERJ)', 160);
INSERT INTO public.empresa VALUES (1529, true, 1, '2023-07-03 14:52:48.533148', NULL, NULL, false, 'FACULDADE DO FUTURO (FAF)', 207);
INSERT INTO public.empresa VALUES (1530, true, 1, '2023-07-03 14:52:48.534322', NULL, NULL, false, 'FACULDADE DO GUARUJÁ (FAGU)', 127);
INSERT INTO public.empresa VALUES (1531, true, 1, '2023-07-03 14:52:48.535447', NULL, NULL, false, 'FACULDADE DO INSTITUTO BRASIL (FIBRA)', 264);
INSERT INTO public.empresa VALUES (1532, true, 1, '2023-07-03 14:52:48.536614', NULL, NULL, false, 'FACULDADE DO INSTITUTO NACIONAL DE PÓS-GRADUAÇÃO DE SÃO JOSÉ DOS CAMPOS (FACULDADE INPG - SJC)', 144);
INSERT INTO public.empresa VALUES (1533, true, 1, '2023-07-03 14:52:48.537683', NULL, NULL, false, 'FACULDADE DO INSTITUTO PANAMERICANO (FACIPAN)', 203);
INSERT INTO public.empresa VALUES (1534, true, 1, '2023-07-03 14:52:48.538929', NULL, NULL, false, 'FACULDADE DOIS DE JULHO (F2J)', 116);
INSERT INTO public.empresa VALUES (1535, true, 1, '2023-07-03 14:52:48.540067', NULL, NULL, false, 'FACULDADE DO LITORAL PARANAENSE (FLP)', 559);
INSERT INTO public.empresa VALUES (1536, true, 1, '2023-07-03 14:52:48.541205', NULL, NULL, false, 'FACULDADE DO LITORAL SUL PAULISTA (FALS)', 250);
INSERT INTO public.empresa VALUES (1537, true, 1, '2023-07-03 14:52:48.542307', NULL, NULL, false, 'FACULDADE DO MACIÇO DO BATURITÉ (FMB)', 560);
INSERT INTO public.empresa VALUES (1538, true, 1, '2023-07-03 14:52:48.543493', NULL, NULL, false, 'FACULDADE DOM ADELIO TOMASIN (FADAT)', 67);
INSERT INTO public.empresa VALUES (1539, true, 1, '2023-07-03 14:52:48.544625', NULL, NULL, false, 'FACULDADE DOM ALBERTO (FDA)', 561);
INSERT INTO public.empresa VALUES (1540, true, 1, '2023-07-03 14:52:48.545758', NULL, NULL, false, 'FACULDADE DO MARANHÃO (FACAM-MA)', 141);
INSERT INTO public.empresa VALUES (1541, true, 1, '2023-07-03 14:52:48.54694', NULL, NULL, false, 'FACULDADE DOM BOSCO (DOM BOSCO)', 54);
INSERT INTO public.empresa VALUES (1542, true, 1, '2023-07-03 14:52:48.548126', NULL, NULL, false, 'FACULDADE DOM BOSCO DE CAPITÃO LEÔNIDAS MARQUES', 562);
INSERT INTO public.empresa VALUES (1543, true, 1, '2023-07-03 14:52:48.54942', NULL, NULL, false, 'FACULDADE DOM BOSCO DE GOIOERÊ (DOM BOSCO GOIOERÊ)', 563);
INSERT INTO public.empresa VALUES (1544, true, 1, '2023-07-03 14:52:48.550629', NULL, NULL, false, 'FACULDADE DOM BOSCO DE MARINGA (DOM BOSCO)', 76);
INSERT INTO public.empresa VALUES (1545, true, 1, '2023-07-03 14:52:48.551858', NULL, NULL, false, 'FACULDADE DOM BOSCO DE PORTO ALEGRE (FDB)', 149);
INSERT INTO public.empresa VALUES (1546, true, 1, '2023-07-03 14:52:48.553074', NULL, NULL, false, 'FACULDADE DOM BOSCO DE UBIRATÃ (DOM BOSCO UBIRATÃ)', 564);
INSERT INTO public.empresa VALUES (1547, true, 1, '2023-07-03 14:52:48.554211', NULL, NULL, false, 'FACULDADE DOM BOSCO PARANÁ (DOM BOSCO PARANÁ)', 159);
INSERT INTO public.empresa VALUES (1548, true, 1, '2023-07-03 14:52:48.555346', NULL, NULL, false, 'FACULDADE DOMINIUS (FAD)', 157);
INSERT INTO public.empresa VALUES (1549, true, 1, '2023-07-03 14:52:48.556448', NULL, NULL, false, 'FACULDADE DOM LUCIANO MENDES (FDLM)', 238);
INSERT INTO public.empresa VALUES (1550, true, 1, '2023-07-03 14:52:48.557679', NULL, NULL, false, 'FACULDADE DOM LUIS DE ORLEANS E BRAGANÇA (FDL)', 565);
INSERT INTO public.empresa VALUES (1551, true, 1, '2023-07-03 14:52:48.558928', NULL, NULL, false, 'FACULDADE DOM PEDRO II DE SERGIPE (DP II SERGIPE)', 566);
INSERT INTO public.empresa VALUES (1552, true, 1, '2023-07-03 14:52:48.560093', NULL, NULL, false, 'FACULDADE DOM PEDRO II DE TECNOLOGIA (FDP II TEC)', 116);
INSERT INTO public.empresa VALUES (1553, true, 1, '2023-07-03 14:52:48.561244', NULL, NULL, false, 'FACULDADE DOM RICARDO (FDR)', 100);
INSERT INTO public.empresa VALUES (1554, true, 1, '2023-07-03 14:52:48.562382', NULL, NULL, false, 'FACULDADE DOMUS SAPIENS (FDS)', 533);
INSERT INTO public.empresa VALUES (1555, true, 1, '2023-07-03 14:52:48.563575', NULL, NULL, false, 'FACULDADE DO NORDESTE DA BAHIA (FANEB)', 567);
INSERT INTO public.empresa VALUES (1556, true, 1, '2023-07-03 14:52:48.564729', NULL, NULL, false, 'FACULDADE DO NOROESTE DE MINAS (FINOM)', 55);
INSERT INTO public.empresa VALUES (1557, true, 1, '2023-07-03 14:52:48.565859', NULL, NULL, false, 'FACULDADE DO NORTE DE MATO GROSSO (AJES)', 467);
INSERT INTO public.empresa VALUES (1558, true, 1, '2023-07-03 14:52:48.567049', NULL, NULL, false, 'FACULDADE DO NORTE NOVO DE APUCARANA (FACNOPAR)', 377);
INSERT INTO public.empresa VALUES (1559, true, 1, '2023-07-03 14:52:48.568298', NULL, NULL, false, 'FACULDADE DO OESTE POTIGUAR (FAOP)', 568);
INSERT INTO public.empresa VALUES (1560, true, 1, '2023-07-03 14:52:48.569435', NULL, NULL, false, 'FACULDADE DO PLANALTO CENTRAL (FAPLAC)', 539);
INSERT INTO public.empresa VALUES (1561, true, 1, '2023-07-03 14:52:48.57055', NULL, NULL, false, 'FACULDADE DO RECIFE (FAREC)', 60);
INSERT INTO public.empresa VALUES (1562, true, 1, '2023-07-03 14:52:48.571711', NULL, NULL, false, 'FACULDADE DO RIO DE JANEIRO', 12);
INSERT INTO public.empresa VALUES (1563, true, 1, '2023-07-03 14:52:48.572878', NULL, NULL, false, 'FACULDADE DOS CARAJÁS', 46);
INSERT INTO public.empresa VALUES (1564, true, 1, '2023-07-03 14:52:48.574025', NULL, NULL, false, 'FACULDADE DOS CERRADOS PIAUIENSES (FCP)', 569);
INSERT INTO public.empresa VALUES (1565, true, 1, '2023-07-03 14:52:48.575236', NULL, NULL, false, 'FACULDADE DO SERIDÓ (FAS)', 570);
INSERT INTO public.empresa VALUES (1566, true, 1, '2023-07-03 14:52:48.576442', NULL, NULL, false, 'FACULDADE DO SERTÃO BAIANO (FASBE)', 571);
INSERT INTO public.empresa VALUES (1567, true, 1, '2023-07-03 14:52:48.577662', NULL, NULL, false, 'FACULDADE DO SERTÃO CENTRAL (FASEC)', 572);
INSERT INTO public.empresa VALUES (1568, true, 1, '2023-07-03 14:52:48.578911', NULL, NULL, false, 'FACULDADE DO SERTÃO CENTRAL EAD (FASEC EAD)', 572);
INSERT INTO public.empresa VALUES (1569, true, 1, '2023-07-03 14:52:48.580242', NULL, NULL, false, 'FACULDADE DO SERTÃO DO ARARIPE (FASA)', 573);
INSERT INTO public.empresa VALUES (1570, true, 1, '2023-07-03 14:52:48.581671', NULL, NULL, false, 'FACULDADE DO SERTÃO DO PAJEÚ (FASP)', 574);
INSERT INTO public.empresa VALUES (1571, true, 1, '2023-07-03 14:52:48.582954', NULL, NULL, false, 'FACULDADE DO SERTÃO DO SÃO FRANCISCO (FASF)', 575);
INSERT INTO public.empresa VALUES (1572, true, 1, '2023-07-03 14:52:48.584142', NULL, NULL, false, 'FACULDADE DOS GÊNIOS (FAGENIUS)', 268);
INSERT INTO public.empresa VALUES (1573, true, 1, '2023-07-03 14:52:48.585264', NULL, NULL, false, 'FACULDADE DOS PALMARES (FAP)', 428);
INSERT INTO public.empresa VALUES (1574, true, 1, '2023-07-03 14:52:48.586456', NULL, NULL, false, 'FACULDADE DO SUDESTE GOIANO (FASUG)', 576);
INSERT INTO public.empresa VALUES (1575, true, 1, '2023-07-03 14:52:48.58757', NULL, NULL, false, 'FACULDADE DO SUL DA BAHIA (FASB)', 295);
INSERT INTO public.empresa VALUES (1576, true, 1, '2023-07-03 14:52:48.588652', NULL, NULL, false, 'FACULDADE DO TAPAJÓS (FAT)', 475);
INSERT INTO public.empresa VALUES (1577, true, 1, '2023-07-03 14:52:48.589845', NULL, NULL, false, 'FACULDADE DO TRABALHO (FATRA)', 134);
INSERT INTO public.empresa VALUES (1578, true, 1, '2023-07-03 14:52:48.590964', NULL, NULL, false, 'FACULDADE DOURADO (FD)', 8);
INSERT INTO public.empresa VALUES (1579, true, 1, '2023-07-03 14:52:48.592211', NULL, NULL, false, 'FACULDADE DOUTOR FRANCISCO MAEDA (FAFRAM)', 462);
INSERT INTO public.empresa VALUES (1580, true, 1, '2023-07-03 14:52:48.593345', NULL, NULL, false, 'FACULDADE DO VALE (FAV)', 452);
INSERT INTO public.empresa VALUES (1581, true, 1, '2023-07-03 14:52:48.594482', NULL, NULL, false, 'FACULDADE DO VALE DO CAJU (FVC)', 451);
INSERT INTO public.empresa VALUES (1582, true, 1, '2023-07-03 14:52:48.595608', NULL, NULL, false, 'FACULDADE DO VALE DO ITAPECURÚ (FAI)', 97);
INSERT INTO public.empresa VALUES (1583, true, 1, '2023-07-03 14:52:48.597125', NULL, NULL, false, 'FACULDADE DO VALE DO JAGUARIBE MOSSORÓ (FVJ MOSSORÓ)', 323);
INSERT INTO public.empresa VALUES (1584, true, 1, '2023-07-03 14:52:48.598686', NULL, NULL, false, 'FACULDADE DO VALE DO RIO ARINOS (AJES)', 577);
INSERT INTO public.empresa VALUES (1585, true, 1, '2023-07-03 14:52:48.600186', NULL, NULL, false, 'FACULDADE DO VALE ELVIRA DAYRELL - FAVED (FAVED)', 578);
INSERT INTO public.empresa VALUES (1586, true, 1, '2023-07-03 14:52:48.601782', NULL, NULL, false, 'FACULDADE DUARTE COELHO (FDC)', 579);
INSERT INTO public.empresa VALUES (1587, true, 1, '2023-07-03 14:52:48.603435', NULL, NULL, false, 'FACULDADE DYNAMUS DE CAMPINAS (FADYC)', 177);
INSERT INTO public.empresa VALUES (1588, true, 1, '2023-07-03 14:52:48.604674', NULL, NULL, false, 'FACULDADE EASE BRASIL (EASE)', 45);
INSERT INTO public.empresa VALUES (1589, true, 1, '2023-07-03 14:52:48.605869', NULL, NULL, false, 'FACULDADE EDUCABRASIL NOEL DE MELLO', 580);
INSERT INTO public.empresa VALUES (1590, true, 1, '2023-07-03 14:52:48.607102', NULL, NULL, false, 'FACULDADE EDUCACIONAL ARAUCÁRIA (FACEAR)', 56);
INSERT INTO public.empresa VALUES (1591, true, 1, '2023-07-03 14:52:48.608265', NULL, NULL, false, 'FACULDADE EDUCACIONAL DE COLOMBO (FAEC)', 582);
INSERT INTO public.empresa VALUES (1592, true, 1, '2023-07-03 14:52:48.609388', NULL, NULL, false, 'FACULDADE EDUCACIONAL DE MEDIANEIRA (UDC MEDIANEIRA)', 583);
INSERT INTO public.empresa VALUES (1593, true, 1, '2023-07-03 14:52:48.610487', NULL, NULL, false, 'FACULDADE EDUCACIONAL JURÍDICA E GERENCIAL DE OLIVEIRA (FEJUGO)', 584);
INSERT INTO public.empresa VALUES (1594, true, 1, '2023-07-03 14:52:48.611671', NULL, NULL, false, 'FACULDADE EDUCAMAIS (EDUCA+)', 8);
INSERT INTO public.empresa VALUES (1595, true, 1, '2023-07-03 14:52:48.612866', NULL, NULL, false, 'FACULDADE EDUCAREMT (EDUCARE)', 203);
INSERT INTO public.empresa VALUES (1596, true, 1, '2023-07-03 14:52:48.614097', NULL, NULL, false, 'FACULDADE EDUFOR (EDUFOR)', 141);
INSERT INTO public.empresa VALUES (1597, true, 1, '2023-07-03 14:52:48.615311', NULL, NULL, false, 'FACULDADE EDUFOR DE SALVADOR (EDUFOR)', 116);
INSERT INTO public.empresa VALUES (1598, true, 1, '2023-07-03 14:52:48.61652', NULL, NULL, false, 'FACULDADE EDUVALE DE AVARÉ (EDUVALE)', 195);
INSERT INTO public.empresa VALUES (1599, true, 1, '2023-07-03 14:52:48.617779', NULL, NULL, false, 'FACULDADE EFICAZ (EFICAZ)', 76);
INSERT INTO public.empresa VALUES (1600, true, 1, '2023-07-03 14:52:48.618999', NULL, NULL, false, 'FACULDADE EGAS MONIZ (FEM)', 60);
INSERT INTO public.empresa VALUES (1601, true, 1, '2023-07-03 14:52:48.620262', NULL, NULL, false, 'FACULDADE EINSTEIN', 116);
INSERT INTO public.empresa VALUES (1602, true, 1, '2023-07-03 14:52:48.621549', NULL, NULL, false, 'FACULDADE ELO (FAELO)', 60);
INSERT INTO public.empresa VALUES (1603, true, 1, '2023-07-03 14:52:48.622781', NULL, NULL, false, 'FACULDADE EMBU DAS ARTES (FAEM)', 585);
INSERT INTO public.empresa VALUES (1604, true, 1, '2023-07-03 14:52:48.623883', NULL, NULL, false, 'FACULDADE EMPRESARIAL DE CHAPECÓ (FAEM)', 406);
INSERT INTO public.empresa VALUES (1605, true, 1, '2023-07-03 14:52:48.625026', NULL, NULL, false, 'FACULDADE ENAU (FACENAU)', 502);
INSERT INTO public.empresa VALUES (1606, true, 1, '2023-07-03 14:52:48.626189', NULL, NULL, false, 'FACULDADE ENDEX (ENDEX)', 230);
INSERT INTO public.empresa VALUES (1607, true, 1, '2023-07-03 14:52:48.627314', NULL, NULL, false, 'FACULDADE ENERGIA', 3);
INSERT INTO public.empresa VALUES (1608, true, 1, '2023-07-03 14:52:48.628469', NULL, NULL, false, 'FACULDADE ENGENHEIRO SALVADOR ARENA (FESA)', 82);
INSERT INTO public.empresa VALUES (1609, true, 1, '2023-07-03 14:52:48.629601', NULL, NULL, false, 'FACULDADE ENSIN.E (ENSIN.E)', 38);
INSERT INTO public.empresa VALUES (1610, true, 1, '2023-07-03 14:52:48.630747', NULL, NULL, false, 'FACULDADE ERICH FROMM (FACEF)', 5);
INSERT INTO public.empresa VALUES (1611, true, 1, '2023-07-03 14:52:48.631908', NULL, NULL, false, 'FACULDADE ESAMC CAMPINAS (ESAMC)', 177);
INSERT INTO public.empresa VALUES (1612, true, 1, '2023-07-03 14:52:48.633042', NULL, NULL, false, 'FACULDADE ESAMC FRANCA (ESAMC FRANCA)', 179);
INSERT INTO public.empresa VALUES (1613, true, 1, '2023-07-03 14:52:48.634149', NULL, NULL, false, 'FACULDADE ESAMC GOIÂNIA (ESAMC GOIÂNIA)', 42);
INSERT INTO public.empresa VALUES (1614, true, 1, '2023-07-03 14:52:48.635352', NULL, NULL, false, 'FACULDADE ESAMC JUNDIAÍ (ESAMC)', 182);
INSERT INTO public.empresa VALUES (1615, true, 1, '2023-07-03 14:52:48.636467', NULL, NULL, false, 'FACULDADE ESAMC SANTOS (ESAMC)', 171);
INSERT INTO public.empresa VALUES (1616, true, 1, '2023-07-03 14:52:48.63763', NULL, NULL, false, 'FACULDADE ESAMC SÃO PAULO - ESAMC (ESAMC)', 8);
INSERT INTO public.empresa VALUES (1617, true, 1, '2023-07-03 14:52:48.638699', NULL, NULL, false, 'FACULDADE ESAMC SOROCABA (ESAMC)', 146);
INSERT INTO public.empresa VALUES (1618, true, 1, '2023-07-03 14:52:48.639874', NULL, NULL, false, 'FACULDADE ESAMC UBERLÂNDIA (ESAMC)', 134);
INSERT INTO public.empresa VALUES (1619, true, 1, '2023-07-03 14:52:48.641', NULL, NULL, false, 'FACULDADE ESCOLA DE AYURVEDA (FAESDA)', 149);
INSERT INTO public.empresa VALUES (1620, true, 1, '2023-07-03 14:52:48.64215', NULL, NULL, false, 'FACULDADE ESCOLA DE NEGÓCIOS EXCELLENCE (FAENE)', 141);
INSERT INTO public.empresa VALUES (1621, true, 1, '2023-07-03 14:52:48.643256', NULL, NULL, false, 'FACULDADE ESCOLA PAULISTA DE DIREITO (FACEPD)', 8);
INSERT INTO public.empresa VALUES (1622, true, 1, '2023-07-03 14:52:48.644403', NULL, NULL, false, 'FACULDADE ESCOLA POLITÉCNICA DE INOVAÇÃO E CONHECIMENTO APLICADO (ÉPICA)', 193);
INSERT INTO public.empresa VALUES (1623, true, 1, '2023-07-03 14:52:48.645603', NULL, NULL, false, 'FACULDADE ESCOLA SOBRAL DE OLIVEIRA (FAESDO)', 586);
INSERT INTO public.empresa VALUES (1624, true, 1, '2023-07-03 14:52:48.646678', NULL, NULL, false, 'FACULDADE ESPECIALIZADA NA ÁREA DE SAÚDE DO RIO GRANDE DO SUL (FASURGS)', 282);
INSERT INTO public.empresa VALUES (1625, true, 1, '2023-07-03 14:52:48.647748', NULL, NULL, false, 'FACULDADE ÉSPER (ÉSPER)', 42);
INSERT INTO public.empresa VALUES (1626, true, 1, '2023-07-03 14:52:48.648895', NULL, NULL, false, 'FACULDADE ESPÍRITO SANTENSE (UNICAPE)', 389);
INSERT INTO public.empresa VALUES (1627, true, 1, '2023-07-03 14:52:48.650046', NULL, NULL, false, 'FACULDADE ESPÍRITO SANTENSE DE CIÊNCIAS JURÍDICAS (PIO XII - DIR)', 389);
INSERT INTO public.empresa VALUES (1628, true, 1, '2023-07-03 14:52:48.651229', NULL, NULL, false, 'FACULDADE ESPÍRITO SANTO (FAES)', 587);
INSERT INTO public.empresa VALUES (1629, true, 1, '2023-07-03 14:52:48.652441', NULL, NULL, false, 'FACULDADE ESSA EDUCACAO PROFISSIONAL (UNIESSA)', 8);
INSERT INTO public.empresa VALUES (1630, true, 1, '2023-07-03 14:52:48.653634', NULL, NULL, false, 'FACULDADE ESTÁCIO DA PARAÍBA (ESTACIO PARAIBA)', 107);
INSERT INTO public.empresa VALUES (1631, true, 1, '2023-07-03 14:52:48.654723', NULL, NULL, false, 'FACULDADE ESTÁCIO DE ALAGOAS - ESTÁCIO FAL (ESTÁCIO FAL)', 73);
INSERT INTO public.empresa VALUES (1632, true, 1, '2023-07-03 14:52:48.65581', NULL, NULL, false, 'FACULDADE ESTÁCIO DE ALAGOINHAS', 213);
INSERT INTO public.empresa VALUES (1633, true, 1, '2023-07-03 14:52:48.656988', NULL, NULL, false, 'FACULDADE ESTÁCIO DE ANANINDEUA', 232);
INSERT INTO public.empresa VALUES (1707, true, 1, '2023-07-03 14:52:48.755232', NULL, NULL, false, 'FACULDADE FERNÃO DIAS (FAFE)', 158);
INSERT INTO public.empresa VALUES (1634, true, 1, '2023-07-03 14:52:48.658184', NULL, NULL, false, 'FACULDADE ESTÁCIO DE BELÉM - ESTÁCIO BELÉM (ESTÁCIO BELÉM)', 79);
INSERT INTO public.empresa VALUES (1635, true, 1, '2023-07-03 14:52:48.65939', NULL, NULL, false, 'FACULDADE ESTÁCIO DE CANINDÉ (ESTÁCIO CANINDÉ)', 588);
INSERT INTO public.empresa VALUES (1636, true, 1, '2023-07-03 14:52:48.660428', NULL, NULL, false, 'FACULDADE ESTÁCIO DE CARAPICUÍBA (ESTÁCIO CARAPICUÍBA)', 519);
INSERT INTO public.empresa VALUES (1637, true, 1, '2023-07-03 14:52:48.66156', NULL, NULL, false, 'FACULDADE ESTÁCIO DE CASTANHAL (ESTÁCIO CASTANHAL)', 484);
INSERT INTO public.empresa VALUES (1638, true, 1, '2023-07-03 14:52:48.662721', NULL, NULL, false, 'FACULDADE ESTÁCIO DE COTIA (ESTACIO COTIA)', 520);
INSERT INTO public.empresa VALUES (1639, true, 1, '2023-07-03 14:52:48.663861', NULL, NULL, false, 'FACULDADE ESTÁCIO DE CURITIBA (ESTÁCIO CURITIBA)', 56);
INSERT INTO public.empresa VALUES (1640, true, 1, '2023-07-03 14:52:48.665009', NULL, NULL, false, 'FACULDADE ESTÁCIO DE FEIRA DE SANTANA (ESTÁCIO FEIRA DE SAN)', 99);
INSERT INTO public.empresa VALUES (1641, true, 1, '2023-07-03 14:52:48.666148', NULL, NULL, false, 'FACULDADE ESTÁCIO DE FLORIANÓPOLIS - ESTÁCIO FLORIANÓPOLIS', 3);
INSERT INTO public.empresa VALUES (1642, true, 1, '2023-07-03 14:52:48.667358', NULL, NULL, false, 'FACULDADE ESTÁCIO DE JARAGUÁ DO SUL (ESTÁCIO JARAGUÁ)', 31);
INSERT INTO public.empresa VALUES (1643, true, 1, '2023-07-03 14:52:48.66852', NULL, NULL, false, 'FACULDADE ESTÁCIO DE JUAZEIRO (ESTÁCIOJUAZEIRO)', 533);
INSERT INTO public.empresa VALUES (1644, true, 1, '2023-07-03 14:52:48.66975', NULL, NULL, false, 'FACULDADE ESTÁCIO DE NATAL (ESTACIO NATAL)', 130);
INSERT INTO public.empresa VALUES (1645, true, 1, '2023-07-03 14:52:48.670914', NULL, NULL, false, 'FACULDADE ESTÁCIO DE PIMENTA BUENO (ESTÁCIO FAP)', 589);
INSERT INTO public.empresa VALUES (1646, true, 1, '2023-07-03 14:52:48.671999', NULL, NULL, false, 'FACULDADE ESTÁCIO DE RIO PRETO (ESTÁCIO RIO PRETO)', 114);
INSERT INTO public.empresa VALUES (1647, true, 1, '2023-07-03 14:52:48.673133', NULL, NULL, false, 'FACULDADE ESTÁCIO DE SÁ DE OURINHOS (FAESO)', 89);
INSERT INTO public.empresa VALUES (1648, true, 1, '2023-07-03 14:52:48.674347', NULL, NULL, false, 'FACULDADE ESTÁCIO DE SÁ DE VILA VELHA (FESVV)', 226);
INSERT INTO public.empresa VALUES (1649, true, 1, '2023-07-03 14:52:48.675431', NULL, NULL, false, 'FACULDADE ESTÁCIO DE SÁ DE VITÓRIA (FESV)', 25);
INSERT INTO public.empresa VALUES (1650, true, 1, '2023-07-03 14:52:48.676575', NULL, NULL, false, 'FACULDADE ESTÁCIO DE SANTO ANDRÉ (ESTÁCIO SANTO ANDRÉ)', 47);
INSERT INTO public.empresa VALUES (1651, true, 1, '2023-07-03 14:52:48.67772', NULL, NULL, false, 'FACULDADE ESTÁCIO DE TERESINA (ESTÁCIO TERESINA)', 27);
INSERT INTO public.empresa VALUES (1652, true, 1, '2023-07-03 14:52:48.678869', NULL, NULL, false, 'FACULDADE ESTÁCIO DO AMAPÁ - ESTÁCIO AMAPÁ (ESTÁCIO AMAPÁ)', 26);
INSERT INTO public.empresa VALUES (1653, true, 1, '2023-07-03 14:52:48.680011', NULL, NULL, false, 'FACULDADE ESTÁCIO DO AMAZONAS - ESTÁCIO AMAZONAS (ESTÁCIO AMAZONAS)', 75);
INSERT INTO public.empresa VALUES (1654, true, 1, '2023-07-03 14:52:48.681173', NULL, NULL, false, 'FACULDADE ESTÁCIO DO PANTANAL (ESTÁCIO FAPAN)', 590);
INSERT INTO public.empresa VALUES (1655, true, 1, '2023-07-03 14:52:48.682302', NULL, NULL, false, 'FACULDADE ESTÁCIO DO PARÁ - ESTÁCIO FAP (ESTÁCIO FAP)', 79);
INSERT INTO public.empresa VALUES (1656, true, 1, '2023-07-03 14:52:48.683843', NULL, NULL, false, 'FACULDADE ESTÁCIO DO RIO GRANDE DO SUL - ESTÁCIO FARGS (ESTÁCIO FARGS)', 149);
INSERT INTO public.empresa VALUES (1657, true, 1, '2023-07-03 14:52:48.685345', NULL, NULL, false, 'FACULDADE ESTÁCIO MACAPÁ - ESTÁCIO MACAPÁ (ESTÁCIO MACAPÁ)', 26);
INSERT INTO public.empresa VALUES (1658, true, 1, '2023-07-03 14:52:48.686981', NULL, NULL, false, 'FACULDADE ESTÁCIO SÃO PAULO DE RONDÔNIA (ESTÁCIO FSP)', 503);
INSERT INTO public.empresa VALUES (1659, true, 1, '2023-07-03 14:52:48.688504', NULL, NULL, false, 'FACULDADE ESTRATEGO (ESTRATEGO)', 79);
INSERT INTO public.empresa VALUES (1660, true, 1, '2023-07-03 14:52:48.689559', NULL, NULL, false, 'FACULDADE EUGÊNIO GOMES (FEG)', 591);
INSERT INTO public.empresa VALUES (1661, true, 1, '2023-07-03 14:52:48.69076', NULL, NULL, false, 'FACULDADE EUROPÉIA DE TECNOLOGIA E CIÊNCIAS HUMANAS - EUROTECH (EUROTECH)', 132);
INSERT INTO public.empresa VALUES (1662, true, 1, '2023-07-03 14:52:48.691813', NULL, NULL, false, 'FACULDADE EUROPÉIA DE VITÓRIA (FAEV)', 389);
INSERT INTO public.empresa VALUES (1663, true, 1, '2023-07-03 14:52:48.69309', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE CERES (FACER)', 592);
INSERT INTO public.empresa VALUES (1664, true, 1, '2023-07-03 14:52:48.69434', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE GOIANÉSIA (FACEG)', 593);
INSERT INTO public.empresa VALUES (1665, true, 1, '2023-07-03 14:52:48.695547', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE JARAGUÁ (FEJA)', 594);
INSERT INTO public.empresa VALUES (1666, true, 1, '2023-07-03 14:52:48.696668', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE RUBIATABA (FER)', 595);
INSERT INTO public.empresa VALUES (1667, true, 1, '2023-07-03 14:52:48.69784', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE SALVADOR (FACESA)', 116);
INSERT INTO public.empresa VALUES (1668, true, 1, '2023-07-03 14:52:48.698938', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE SÃO PAULO', 8);
INSERT INTO public.empresa VALUES (1669, true, 1, '2023-07-03 14:52:48.700112', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE SENADOR CANEDO (FESCAN)', 538);
INSERT INTO public.empresa VALUES (1670, true, 1, '2023-07-03 14:52:48.701263', NULL, NULL, false, 'FACULDADE EVANGÉLICA DE TECNOLOGIA, CIÊNCIAS E BIOTECNOLOGIA DA CGADB (FAECAD)', 12);
INSERT INTO public.empresa VALUES (1671, true, 1, '2023-07-03 14:52:48.702514', NULL, NULL, false, 'FACULDADE EVANGÉLICA DO MEIO NORTE (FAEME)', 596);
INSERT INTO public.empresa VALUES (1672, true, 1, '2023-07-03 14:52:48.703898', NULL, NULL, false, 'FACULDADE EVANGÉLICA MACKENZIE DO PARANÁ (FEMPAR)', 56);
INSERT INTO public.empresa VALUES (1673, true, 1, '2023-07-03 14:52:48.705226', NULL, NULL, false, 'FACULDADE EVANGÉLICA RAÍZES (RAÍZES)', 264);
INSERT INTO public.empresa VALUES (1674, true, 1, '2023-07-03 14:52:48.706547', NULL, NULL, false, 'FACULDADE EVOLUÇÃO (FAEV)', 8);
INSERT INTO public.empresa VALUES (1675, true, 1, '2023-07-03 14:52:48.708056', NULL, NULL, false, 'FACULDADE EVOLUÇÃO ALTO OESTE POTIGUAR (FACEP)', 597);
INSERT INTO public.empresa VALUES (1676, true, 1, '2023-07-03 14:52:48.709585', NULL, NULL, false, 'FACULDADE EVOLUIR (FAEV)', 45);
INSERT INTO public.empresa VALUES (1677, true, 1, '2023-07-03 14:52:48.711058', NULL, NULL, false, 'FACULDADE EXATA EDUCACIONAL (FEE)', 56);
INSERT INTO public.empresa VALUES (1678, true, 1, '2023-07-03 14:52:48.712581', NULL, NULL, false, 'FACULDADE FABAD (FABAD)', 162);
INSERT INTO public.empresa VALUES (1679, true, 1, '2023-07-03 14:52:48.714194', NULL, NULL, false, 'FACULDADE FACCAT (FACCAT)', 354);
INSERT INTO public.empresa VALUES (1680, true, 1, '2023-07-03 14:52:48.715647', NULL, NULL, false, 'FACULDADE FACIENCIA (FACIENCIA)', 56);
INSERT INTO public.empresa VALUES (1681, true, 1, '2023-07-03 14:52:48.717125', NULL, NULL, false, 'FACULDADE FACMIL', 114);
INSERT INTO public.empresa VALUES (1682, true, 1, '2023-07-03 14:52:48.718583', NULL, NULL, false, 'FACULDADE FACTUM (FACTUM)', 149);
INSERT INTO public.empresa VALUES (1683, true, 1, '2023-07-03 14:52:48.720086', NULL, NULL, false, 'FACULDADE FACUMINAS DE PÓS-GRADUAÇÃO EAD (FACUMINAS EAD)', 8);
INSERT INTO public.empresa VALUES (1684, true, 1, '2023-07-03 14:52:48.721505', NULL, NULL, false, 'FACULDADE FADAM (FADAM)', 45);
INSERT INTO public.empresa VALUES (1685, true, 1, '2023-07-03 14:52:48.723052', NULL, NULL, false, 'FACULDADE FADAM DE MARACANAÚ (FADAM)', 45);
INSERT INTO public.empresa VALUES (1686, true, 1, '2023-07-03 14:52:48.724594', NULL, NULL, false, 'FACULDADE FAIPE', 203);
INSERT INTO public.empresa VALUES (1687, true, 1, '2023-07-03 14:52:48.726146', NULL, NULL, false, 'FACULDADE FAMART', 598);
INSERT INTO public.empresa VALUES (1688, true, 1, '2023-07-03 14:52:48.727609', NULL, NULL, false, 'FACULDADE FAMEP - UNIDADE PARAMBU - CE (FAMEP)', 599);
INSERT INTO public.empresa VALUES (1689, true, 1, '2023-07-03 14:52:48.729099', NULL, NULL, false, 'FACULDADE FAMERCOSUL (FSUL)', 149);
INSERT INTO public.empresa VALUES (1690, true, 1, '2023-07-03 14:52:48.730677', NULL, NULL, false, 'FACULDADE FANORPI BANDEIRANTES (FANORPI)', 600);
INSERT INTO public.empresa VALUES (1691, true, 1, '2023-07-03 14:52:48.732179', NULL, NULL, false, 'FACULDADE FAPAF (FAPAF)', 601);
INSERT INTO public.empresa VALUES (1692, true, 1, '2023-07-03 14:52:48.733635', NULL, NULL, false, 'FACULDADE FARUS (FARUS)', 488);
INSERT INTO public.empresa VALUES (1693, true, 1, '2023-07-03 14:52:48.735128', NULL, NULL, false, 'FACULDADE FASIPE CUIABÁ (FFC)', 203);
INSERT INTO public.empresa VALUES (1694, true, 1, '2023-07-03 14:52:48.736701', NULL, NULL, false, 'FACULDADE FASIPE DE PRIMAVERA (FFP)', 285);
INSERT INTO public.empresa VALUES (1695, true, 1, '2023-07-03 14:52:48.738324', NULL, NULL, false, 'FACULDADE FASIPE DE RONDONÓPOLIS (FFR)', 287);
INSERT INTO public.empresa VALUES (1696, true, 1, '2023-07-03 14:52:48.739843', NULL, NULL, false, 'FACULDADE FASIPE DE SORRISO (FFS)', 292);
INSERT INTO public.empresa VALUES (1697, true, 1, '2023-07-03 14:52:48.741387', NULL, NULL, false, 'FACULDADE FASIPE DF (FACDF)', 5);
INSERT INTO public.empresa VALUES (1698, true, 1, '2023-07-03 14:52:48.742915', NULL, NULL, false, 'FACULDADE FASIPE MATO GROSSO (FFMT)', 203);
INSERT INTO public.empresa VALUES (1699, true, 1, '2023-07-03 14:52:48.744432', NULL, NULL, false, 'FACULDADE FASIPE PANTANAL (FASIPE)', 203);
INSERT INTO public.empresa VALUES (1700, true, 1, '2023-07-03 14:52:48.745858', NULL, NULL, false, 'FACULDADE FASUP (FASUP)', 175);
INSERT INTO public.empresa VALUES (1701, true, 1, '2023-07-03 14:52:48.747286', NULL, NULL, false, 'FACULDADE FATIFAJAR JAGUARIAÍVA (FAJAR)', 602);
INSERT INTO public.empresa VALUES (1702, true, 1, '2023-07-03 14:52:48.74856', NULL, NULL, false, 'FACULDADE FAVENI GUARULHOS (FAVENI - GUARULHOS)', 100);
INSERT INTO public.empresa VALUES (1703, true, 1, '2023-07-03 14:52:48.74982', NULL, NULL, false, 'FACULDADE FAVOO COOP', 355);
INSERT INTO public.empresa VALUES (1704, true, 1, '2023-07-03 14:52:48.751172', NULL, NULL, false, 'FACULDADE FECOMERCIO RORAIMA (FACORR)', 138);
INSERT INTO public.empresa VALUES (1705, true, 1, '2023-07-03 14:52:48.752558', NULL, NULL, false, 'FACULDADE FEITEP (FEITEP)', 76);
INSERT INTO public.empresa VALUES (1706, true, 1, '2023-07-03 14:52:48.753885', NULL, NULL, false, 'FACULDADE FERNANDA BICCHIERI', 1);
INSERT INTO public.empresa VALUES (1708, true, 1, '2023-07-03 14:52:48.756435', NULL, NULL, false, 'FACULDADE FIA DE ADMINISTRAÇÃO E NEGÓCIOS (FFIA)', 8);
INSERT INTO public.empresa VALUES (1709, true, 1, '2023-07-03 14:52:48.757673', NULL, NULL, false, 'FACULDADE FIDELIS (FF)', 56);
INSERT INTO public.empresa VALUES (1710, true, 1, '2023-07-03 14:52:48.759011', NULL, NULL, false, 'FACULDADE FIGUEIREDO COSTA - FIC', 73);
INSERT INTO public.empresa VALUES (1711, true, 1, '2023-07-03 14:52:48.760214', NULL, NULL, false, 'FACULDADE FILADELFIA DE TECNOLOGIA (FAFILTEC)', 345);
INSERT INTO public.empresa VALUES (1712, true, 1, '2023-07-03 14:52:48.761297', NULL, NULL, false, 'FACULDADE FILOS', 603);
INSERT INTO public.empresa VALUES (1713, true, 1, '2023-07-03 14:52:48.762431', NULL, NULL, false, 'FACULDADE FINACI (FINACI)', 8);
INSERT INTO public.empresa VALUES (1714, true, 1, '2023-07-03 14:52:48.763559', NULL, NULL, false, 'FACULDADE FINOM DE PATOS DE MINAS (FINOM)', 112);
INSERT INTO public.empresa VALUES (1715, true, 1, '2023-07-03 14:52:48.764767', NULL, NULL, false, 'FACULDADE FIPECAFI (FIPECAFI)', 8);
INSERT INTO public.empresa VALUES (1716, true, 1, '2023-07-03 14:52:48.765917', NULL, NULL, false, 'FACULDADE FISEPE (FISEPE)', 282);
INSERT INTO public.empresa VALUES (1717, true, 1, '2023-07-03 14:52:48.76717', NULL, NULL, false, 'FACULDADE FLAMINGO', 8);
INSERT INTO public.empresa VALUES (1718, true, 1, '2023-07-03 14:52:48.768314', NULL, NULL, false, 'FACULDADE FLEMING CERQUILHO (FAC CERQUILHO)', 604);
INSERT INTO public.empresa VALUES (1719, true, 1, '2023-07-03 14:52:48.769447', NULL, NULL, false, 'FACULDADE FLEMING DE OSASCO (A. FLEMING)', 158);
INSERT INTO public.empresa VALUES (1720, true, 1, '2023-07-03 14:52:48.770566', NULL, NULL, false, 'FACULDADE FOCUS (FOCUS)', 54);
INSERT INTO public.empresa VALUES (1721, true, 1, '2023-07-03 14:52:48.771588', NULL, NULL, false, 'FACULDADE FOZ DO IGUAÇU (FAFIG)', 124);
INSERT INTO public.empresa VALUES (1722, true, 1, '2023-07-03 14:52:48.772839', NULL, NULL, false, 'FACULDADE FRACTAL (FRACTAL)', 42);
INSERT INTO public.empresa VALUES (1723, true, 1, '2023-07-03 14:52:48.774109', NULL, NULL, false, 'FACULDADE FRAGA DE INTEGRAÇÃO DA CULTURA EDUCAÇÃO E PESQUISA (FICEPE)', 605);
INSERT INTO public.empresa VALUES (1724, true, 1, '2023-07-03 14:52:48.775203', NULL, NULL, false, 'FACULDADE FRASSINETTI DO RECIFE (FAFIRE)', 60);
INSERT INTO public.empresa VALUES (1725, true, 1, '2023-07-03 14:52:48.776324', NULL, NULL, false, 'FACULDADE FREIRE DE ENSINO (FFE)', 540);
INSERT INTO public.empresa VALUES (1726, true, 1, '2023-07-03 14:52:48.777472', NULL, NULL, false, 'FACULDADE FUCAPE (FUCAPE)', 25);
INSERT INTO public.empresa VALUES (1727, true, 1, '2023-07-03 14:52:48.778571', NULL, NULL, false, 'FACULDADE FUNORTE DE JANAÚBA', 407);
INSERT INTO public.empresa VALUES (1728, true, 1, '2023-07-03 14:52:48.780204', NULL, NULL, false, 'FACULDADE FUNORTE DE JANUÁRIA', 606);
INSERT INTO public.empresa VALUES (1729, true, 1, '2023-07-03 14:52:48.781727', NULL, NULL, false, 'FACULDADE FUTURA', 10);
INSERT INTO public.empresa VALUES (1730, true, 1, '2023-07-03 14:52:48.783344', NULL, NULL, false, 'FACULDADE G8 (FG8)', 8);
INSERT INTO public.empresa VALUES (1731, true, 1, '2023-07-03 14:52:48.78498', NULL, NULL, false, 'FACULDADE GALILEU (FG)', 383);
INSERT INTO public.empresa VALUES (1732, true, 1, '2023-07-03 14:52:48.786053', NULL, NULL, false, 'FACULDADE GARÇA BRANCA PANTANAL (FGB)', 203);
INSERT INTO public.empresa VALUES (1733, true, 1, '2023-07-03 14:52:48.787138', NULL, NULL, false, 'FACULDADE GENNARI E PEARTREE (FGP)', 607);
INSERT INTO public.empresa VALUES (1734, true, 1, '2023-07-03 14:52:48.788248', NULL, NULL, false, 'FACULDADE GEORGINA (FAGEO)', 608);
INSERT INTO public.empresa VALUES (1735, true, 1, '2023-07-03 14:52:48.789301', NULL, NULL, false, 'FACULDADE GIANNA BERETTA', 141);
INSERT INTO public.empresa VALUES (1736, true, 1, '2023-07-03 14:52:48.790639', NULL, NULL, false, 'FACULDADE GIL GAL (GILGAL)', 609);
INSERT INTO public.empresa VALUES (1737, true, 1, '2023-07-03 14:52:48.79177', NULL, NULL, false, 'FACULDADE GRAN TIETÊ (FGT)', 531);
INSERT INTO public.empresa VALUES (1738, true, 1, '2023-07-03 14:52:48.792852', NULL, NULL, false, 'FACULDADE GRAU S ENSINO SUPERIOR (GRAU)', 60);
INSERT INTO public.empresa VALUES (1739, true, 1, '2023-07-03 14:52:48.794066', NULL, NULL, false, 'FACULDADE GUARAÍ (FAG)', 610);
INSERT INTO public.empresa VALUES (1740, true, 1, '2023-07-03 14:52:48.795164', NULL, NULL, false, 'FACULDADE GUARAPUAVA (FG)', 64);
INSERT INTO public.empresa VALUES (1741, true, 1, '2023-07-03 14:52:48.796177', NULL, NULL, false, 'FACULDADE GUERRA (FAG)', 5);
INSERT INTO public.empresa VALUES (1742, true, 1, '2023-07-03 14:52:48.797416', NULL, NULL, false, 'FACULDADE GUILHERME GUIMBALA (FGG)', 68);
INSERT INTO public.empresa VALUES (1743, true, 1, '2023-07-03 14:52:48.79855', NULL, NULL, false, 'FACULDADE HÉLIO ROCHA (FHR)', 116);
INSERT INTO public.empresa VALUES (1744, true, 1, '2023-07-03 14:52:48.799582', NULL, NULL, false, 'FACULDADE HERRERO (FATEC)', 56);
INSERT INTO public.empresa VALUES (1745, true, 1, '2023-07-03 14:52:48.800688', NULL, NULL, false, 'FACULDADE HOLÍSTICA (FAHOL)', 56);
INSERT INTO public.empresa VALUES (1746, true, 1, '2023-07-03 14:52:48.801943', NULL, NULL, false, 'FACULDADE HONPAR', 611);
INSERT INTO public.empresa VALUES (1747, true, 1, '2023-07-03 14:52:48.802977', NULL, NULL, false, 'FACULDADE HORIZONTE (FACHORIZONTE)', 5);
INSERT INTO public.empresa VALUES (1748, true, 1, '2023-07-03 14:52:48.804189', NULL, NULL, false, 'FACULDADE HORIZONTINA (FAHOR)', 612);
INSERT INTO public.empresa VALUES (1749, true, 1, '2023-07-03 14:52:48.805324', NULL, NULL, false, 'FACULDADE HOSPITAL SÃO PAULO DE MURIAÉ (FAMEHSP)', 154);
INSERT INTO public.empresa VALUES (1750, true, 1, '2023-07-03 14:52:48.806373', NULL, NULL, false, 'FACULDADE IBAM', 12);
INSERT INTO public.empresa VALUES (1751, true, 1, '2023-07-03 14:52:48.807616', NULL, NULL, false, 'FACULDADE IBECO (IBECO)', 8);
INSERT INTO public.empresa VALUES (1752, true, 1, '2023-07-03 14:52:48.808876', NULL, NULL, false, 'FACULDADE IBERO AMERICANA DE SÃO PAULO (FIASP)', 613);
INSERT INTO public.empresa VALUES (1753, true, 1, '2023-07-03 14:52:48.810076', NULL, NULL, false, 'FACULDADE IBG (IBG)', 287);
INSERT INTO public.empresa VALUES (1754, true, 1, '2023-07-03 14:52:48.811281', NULL, NULL, false, 'FACULDADE IBGEN', 149);
INSERT INTO public.empresa VALUES (1755, true, 1, '2023-07-03 14:52:48.812339', NULL, NULL, false, 'FACULDADE IBIAPABA', 235);
INSERT INTO public.empresa VALUES (1756, true, 1, '2023-07-03 14:52:48.813454', NULL, NULL, false, 'FACULDADE IBMEC (IBMEC)', 2);
INSERT INTO public.empresa VALUES (1757, true, 1, '2023-07-03 14:52:48.814454', NULL, NULL, false, 'FACULDADE IBMEC DE BRASÍLIA (IBMEC BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (1758, true, 1, '2023-07-03 14:52:48.815704', NULL, NULL, false, 'FACULDADE IBMEC SÃO PAULO (IBMEC SP)', 8);
INSERT INTO public.empresa VALUES (1759, true, 1, '2023-07-03 14:52:48.816735', NULL, NULL, false, 'FACULDADE IBRA DA GRANDE SÃO PAULO (FACULDADE FAGRAN)', 8);
INSERT INTO public.empresa VALUES (1760, true, 1, '2023-07-03 14:52:48.817887', NULL, NULL, false, 'FACULDADE IBRA DE BRASÍLIA (FACULDADE FABRAS)', 5);
INSERT INTO public.empresa VALUES (1761, true, 1, '2023-07-03 14:52:48.818984', NULL, NULL, false, 'FACULDADE IBRA DE MINAS GERAIS (FACULDADE FIBMG)', 268);
INSERT INTO public.empresa VALUES (1762, true, 1, '2023-07-03 14:52:48.820248', NULL, NULL, false, 'FACULDADE IBRA DE TECNOLOGIA (FACULDADE FITEC)', 144);
INSERT INTO public.empresa VALUES (1763, true, 1, '2023-07-03 14:52:48.821419', NULL, NULL, false, 'FACULDADE IBRA DOS VALES (FACULDADE FADIVALES)', 273);
INSERT INTO public.empresa VALUES (1764, true, 1, '2023-07-03 14:52:48.822644', NULL, NULL, false, 'FACULDADE IBS (IBS)', 2);
INSERT INTO public.empresa VALUES (1765, true, 1, '2023-07-03 14:52:48.823972', NULL, NULL, false, 'FACULDADE ICESP (ICESP)', 5);
INSERT INTO public.empresa VALUES (1766, true, 1, '2023-07-03 14:52:48.825397', NULL, NULL, false, 'FACULDADE ICTQ/PGE (ICTQ/PGE)', 264);
INSERT INTO public.empresa VALUES (1767, true, 1, '2023-07-03 14:52:48.826758', NULL, NULL, false, 'FACULDADE IDD (IDD)', 56);
INSERT INTO public.empresa VALUES (1768, true, 1, '2023-07-03 14:52:48.828159', NULL, NULL, false, 'FACULDADE IDEAL WYDEN (FACI WYDEN)', 79);
INSERT INTO public.empresa VALUES (1769, true, 1, '2023-07-03 14:52:48.829659', NULL, NULL, false, 'FACULDADE IDEAU DE BAGÉ (IDEAU)', 86);
INSERT INTO public.empresa VALUES (1770, true, 1, '2023-07-03 14:52:48.831179', NULL, NULL, false, 'FACULDADE IDEAU DE CAXIAS DO SUL (IDEAU)', 87);
INSERT INTO public.empresa VALUES (1771, true, 1, '2023-07-03 14:52:48.832648', NULL, NULL, false, 'FACULDADE IDEAU DE PASSO FUNDO (IDEAU)', 282);
INSERT INTO public.empresa VALUES (1772, true, 1, '2023-07-03 14:52:48.833988', NULL, NULL, false, 'FACULDADE IDOR DE CIÊNCIAS MÉDICAS (FACULDADE IDOR)', 12);
INSERT INTO public.empresa VALUES (1773, true, 1, '2023-07-03 14:52:48.835296', NULL, NULL, false, 'FACULDADE ILAPEO (ILAPEO)', 56);
INSERT INTO public.empresa VALUES (1774, true, 1, '2023-07-03 14:52:48.836691', NULL, NULL, false, 'FACULDADE IMEPAC DE ITUMBIARA (IMEPAC ITUMBIAR)', 234);
INSERT INTO public.empresa VALUES (1775, true, 1, '2023-07-03 14:52:48.838213', NULL, NULL, false, 'FACULDADE IMES (IMES)', 265);
INSERT INTO public.empresa VALUES (1776, true, 1, '2023-07-03 14:52:48.839669', NULL, NULL, false, 'FACULDADE IMESP MONITOR (IMESP)', 8);
INSERT INTO public.empresa VALUES (1777, true, 1, '2023-07-03 14:52:48.84112', NULL, NULL, false, 'FACULDADE IMPACTA (IMPACTA)', 8);
INSERT INTO public.empresa VALUES (1778, true, 1, '2023-07-03 14:52:48.84264', NULL, NULL, false, 'FACULDADE IMPACTO', 73);
INSERT INTO public.empresa VALUES (1779, true, 1, '2023-07-03 14:52:48.844045', NULL, NULL, false, 'FACULDADE IMPACTO DE PORANGATU (FIP)', 614);
INSERT INTO public.empresa VALUES (1780, true, 1, '2023-07-03 14:52:48.845347', NULL, NULL, false, 'FACULDADE IMPACTOS - FACI (FACI)', 203);
INSERT INTO public.empresa VALUES (1781, true, 1, '2023-07-03 14:52:48.84664', NULL, NULL, false, 'FACULDADE INBEC (INBEC)', 45);
INSERT INTO public.empresa VALUES (1782, true, 1, '2023-07-03 14:52:48.847917', NULL, NULL, false, 'FACULDADE INDEPENDENTE DO NORDESTE (FAINOR)', 37);
INSERT INTO public.empresa VALUES (1783, true, 1, '2023-07-03 14:52:48.849181', NULL, NULL, false, 'FACULDADE INESP - INSTITUTO NACIONAL DE ENSINO E PESQUISA (INESP)', 273);
INSERT INTO public.empresa VALUES (1784, true, 1, '2023-07-03 14:52:48.850463', NULL, NULL, false, 'FACULDADE INNOVARE (FACINN)', 8);
INSERT INTO public.empresa VALUES (1785, true, 1, '2023-07-03 14:52:48.851752', NULL, NULL, false, 'FACULDADE INNOVATE DE ANÁPOLIS (INNOVATE)', 264);
INSERT INTO public.empresa VALUES (1786, true, 1, '2023-07-03 14:52:48.85325', NULL, NULL, false, 'FACULDADE INOVA MAIS DE SÃO PAULO (FIMSP)', 8);
INSERT INTO public.empresa VALUES (1787, true, 1, '2023-07-03 14:52:48.854765', NULL, NULL, false, 'FACULDADE INPG DE BLUMENAU (FACINPG)', 193);
INSERT INTO public.empresa VALUES (1788, true, 1, '2023-07-03 14:52:48.856193', NULL, NULL, false, 'FACULDADE INPRO (FACINPRO)', 42);
INSERT INTO public.empresa VALUES (1789, true, 1, '2023-07-03 14:52:48.857541', NULL, NULL, false, 'FACULDADE INSPIRAR (INSPIRAR)', 56);
INSERT INTO public.empresa VALUES (1790, true, 1, '2023-07-03 14:52:48.858823', NULL, NULL, false, 'FACULDADE INSTED', 48);
INSERT INTO public.empresa VALUES (1791, true, 1, '2023-07-03 14:52:48.86028', NULL, NULL, false, 'FACULDADE INSTITUTO BRASILEIRO DE ENSINO (FACIBE)', 2);
INSERT INTO public.empresa VALUES (1792, true, 1, '2023-07-03 14:52:48.861643', NULL, NULL, false, 'FACULDADE INSTITUTO DE ENSINO SUPERIOR (FACIES)', 42);
INSERT INTO public.empresa VALUES (1793, true, 1, '2023-07-03 14:52:48.862921', NULL, NULL, false, 'FACULDADE INSTITUTO PAULISTA DE ENSINO (FIPEN)', 158);
INSERT INTO public.empresa VALUES (1794, true, 1, '2023-07-03 14:52:48.864254', NULL, NULL, false, 'FACULDADE INSTITUTO RIO DE JANEIRO (FIURJ)', 12);
INSERT INTO public.empresa VALUES (1795, true, 1, '2023-07-03 14:52:48.865549', NULL, NULL, false, 'FACULDADE INSTITUTO SUPERIOR DE EDUCAÇÃO DO PARANÁ - FAINSEP (FAINSEP)', 76);
INSERT INTO public.empresa VALUES (1796, true, 1, '2023-07-03 14:52:48.866944', NULL, NULL, false, 'FACULDADE INTEGRAÇÃO (FI)', 8);
INSERT INTO public.empresa VALUES (1797, true, 1, '2023-07-03 14:52:48.868403', NULL, NULL, false, 'FACULDADE INTEGRADA CARAJÁS (FIC)', 452);
INSERT INTO public.empresa VALUES (1798, true, 1, '2023-07-03 14:52:48.869863', NULL, NULL, false, 'FACULDADE INTEGRADA CESUMAR DE CURITIBA (CESUMAR)', 56);
INSERT INTO public.empresa VALUES (1799, true, 1, '2023-07-03 14:52:48.871328', NULL, NULL, false, 'FACULDADE INTEGRADA CETE (FIC)', 483);
INSERT INTO public.empresa VALUES (1800, true, 1, '2023-07-03 14:52:48.873081', NULL, NULL, false, 'FACULDADE INTEGRADA DA AMAZÔNIA (FINAMA)', 79);
INSERT INTO public.empresa VALUES (1801, true, 1, '2023-07-03 14:52:48.874761', NULL, NULL, false, 'FACULDADE INTEGRADA DAS CATARATAS EJOVEM (EJOVEM)', 124);
INSERT INTO public.empresa VALUES (1802, true, 1, '2023-07-03 14:52:48.876581', NULL, NULL, false, 'FACULDADE INTEGRADA DE ADVOCACIA DA AMAZÔNIA (FINAMA)', 79);
INSERT INTO public.empresa VALUES (1803, true, 1, '2023-07-03 14:52:48.878412', NULL, NULL, false, 'FACULDADE INTEGRADA DE GESTÃO E MEIO AMBIENTE (FACIGMA)', 60);
INSERT INTO public.empresa VALUES (1804, true, 1, '2023-07-03 14:52:48.879897', NULL, NULL, false, 'FACULDADE INTEGRADA DE PALMEIRAS DE GOIÁS (FAI)', 490);
INSERT INTO public.empresa VALUES (1805, true, 1, '2023-07-03 14:52:48.881375', NULL, NULL, false, 'FACULDADE INTEGRADA DE SANTA MARIA (FISMA)', 417);
INSERT INTO public.empresa VALUES (1806, true, 1, '2023-07-03 14:52:48.882905', NULL, NULL, false, 'FACULDADE INTEGRADA DE TAUBATÉ (FACULDADE FITAU)', 33);
INSERT INTO public.empresa VALUES (1807, true, 1, '2023-07-03 14:52:48.884435', NULL, NULL, false, 'FACULDADE INTEGRADA INSTITUTO SOUZA (FASOUZA)', 268);
INSERT INTO public.empresa VALUES (1808, true, 1, '2023-07-03 14:52:48.885741', NULL, NULL, false, 'FACULDADE INTEGRAL CANTAREIRA (F.I.C.)', 8);
INSERT INTO public.empresa VALUES (1809, true, 1, '2023-07-03 14:52:48.887133', NULL, NULL, false, 'FACULDADE INTEGRAL DE JABOATÃO DOS GUARARAPES (FIJ)', 132);
INSERT INTO public.empresa VALUES (1810, true, 1, '2023-07-03 14:52:48.888584', NULL, NULL, false, 'FACULDADE INTELLECTUS (FACINTEL)', 176);
INSERT INTO public.empresa VALUES (1811, true, 1, '2023-07-03 14:52:48.890173', NULL, NULL, false, 'FACULDADE INTERAMERICANA DE PORTO VELHO (UNIRON)', 51);
INSERT INTO public.empresa VALUES (1812, true, 1, '2023-07-03 14:52:48.891837', NULL, NULL, false, 'FACULDADE INTERATIVA DE SÃO PAULO (FAISP)', 8);
INSERT INTO public.empresa VALUES (1813, true, 1, '2023-07-03 14:52:48.89321', NULL, NULL, false, 'FACULDADE INTERCONTINENTAL (FAICON)', 299);
INSERT INTO public.empresa VALUES (1814, true, 1, '2023-07-03 14:52:48.894453', NULL, NULL, false, 'FACULDADE INTERCULTURAL DA AMAZONIA (FIAMA)', 79);
INSERT INTO public.empresa VALUES (1815, true, 1, '2023-07-03 14:52:48.895713', NULL, NULL, false, 'FACULDADE INTERMUNICIPAL DO NOROESTE DO PARANÁ (FACINOR)', 615);
INSERT INTO public.empresa VALUES (1816, true, 1, '2023-07-03 14:52:48.896936', NULL, NULL, false, 'FACULDADE INTERNACIONAL CIDADE VIVA', 107);
INSERT INTO public.empresa VALUES (1817, true, 1, '2023-07-03 14:52:48.898126', NULL, NULL, false, 'FACULDADE INTERNACIONAL DA PARAÍBA (FPB)', 107);
INSERT INTO public.empresa VALUES (1818, true, 1, '2023-07-03 14:52:48.899354', NULL, NULL, false, 'FACULDADE INTERNACIONAL DE SÃO LUÍS (ISL)', 141);
INSERT INTO public.empresa VALUES (1819, true, 1, '2023-07-03 14:52:48.900611', NULL, NULL, false, 'FACULDADE INTERNACIONAL DE SÃO PAULO (FINSP)', 8);
INSERT INTO public.empresa VALUES (1820, true, 1, '2023-07-03 14:52:48.901846', NULL, NULL, false, 'FACULDADE INTERVALE (INTERVALE)', 616);
INSERT INTO public.empresa VALUES (1821, true, 1, '2023-07-03 14:52:48.903108', NULL, NULL, false, 'FACULDADE INTESP (INTESP)', 617);
INSERT INTO public.empresa VALUES (1822, true, 1, '2023-07-03 14:52:48.904366', NULL, NULL, false, 'FACULDADE INVEST DE CIÊNCIAS E TECNOLOGIA (INVEST)', 203);
INSERT INTO public.empresa VALUES (1823, true, 1, '2023-07-03 14:52:48.905642', NULL, NULL, false, 'FACULDADE INVICTUS (FIRP)', 114);
INSERT INTO public.empresa VALUES (1824, true, 1, '2023-07-03 14:52:48.906846', NULL, NULL, false, 'FACULDADE IPEMED DE CIÊNCIAS MÉDICAS (IPEMED)', 2);
INSERT INTO public.empresa VALUES (1825, true, 1, '2023-07-03 14:52:48.908045', NULL, NULL, false, 'FACULDADE IPESSP (IPESSP)', 8);
INSERT INTO public.empresa VALUES (1826, true, 1, '2023-07-03 14:52:48.909277', NULL, NULL, false, 'FACULDADE IRECÊ (FAI)', 245);
INSERT INTO public.empresa VALUES (1827, true, 1, '2023-07-03 14:52:48.91065', NULL, NULL, false, 'FACULDADE ISAE BRASIL (ISAE)', 56);
INSERT INTO public.empresa VALUES (1828, true, 1, '2023-07-03 14:52:48.911904', NULL, NULL, false, 'FACULDADE ISEIB DE BELO HORIZONTE (FIBH)', 2);
INSERT INTO public.empresa VALUES (1829, true, 1, '2023-07-03 14:52:48.913106', NULL, NULL, false, 'FACULDADE ISEIB DE BETIM (FISBE)', 198);
INSERT INTO public.empresa VALUES (1830, true, 1, '2023-07-03 14:52:48.91439', NULL, NULL, false, 'FACULDADE ISMD (ISMD)', 8);
INSERT INTO public.empresa VALUES (1831, true, 1, '2023-07-03 14:52:48.915816', NULL, NULL, false, 'FACULDADE ISRAELITA DE CIÊNCIAS DA SAÚDE ALBERT EINSTEIN (FICSAE)', 8);
INSERT INTO public.empresa VALUES (1832, true, 1, '2023-07-03 14:52:48.91725', NULL, NULL, false, 'FACULDADE ITA EDUCACIONAL PAULISTA', 531);
INSERT INTO public.empresa VALUES (1833, true, 1, '2023-07-03 14:52:48.918676', NULL, NULL, false, 'FACULDADE ITANHAÉM (FAITA)', 618);
INSERT INTO public.empresa VALUES (1834, true, 1, '2023-07-03 14:52:48.920263', NULL, NULL, false, 'FACULDADE ITAPURANGA', 619);
INSERT INTO public.empresa VALUES (1835, true, 1, '2023-07-03 14:52:48.921882', NULL, NULL, false, 'FACULDADE ITAQUÁ (UNEITAQUÁ)', 526);
INSERT INTO public.empresa VALUES (1836, true, 1, '2023-07-03 14:52:48.923267', NULL, NULL, false, 'FACULDADE ITATAIA (FACIT)', 620);
INSERT INTO public.empresa VALUES (1837, true, 1, '2023-07-03 14:52:48.924594', NULL, NULL, false, 'FACULDADE ITEANA DE BOTUCATU (FITB)', 383);
INSERT INTO public.empresa VALUES (1838, true, 1, '2023-07-03 14:52:48.925973', NULL, NULL, false, 'FACULDADE ITEC', 111);
INSERT INTO public.empresa VALUES (1839, true, 1, '2023-07-03 14:52:48.927366', NULL, NULL, false, 'FACULDADE ITH (ITH)', 42);
INSERT INTO public.empresa VALUES (1840, true, 1, '2023-07-03 14:52:48.928782', NULL, NULL, false, 'FACULDADE ITPAC ABAETETUBA (ITPAC ABAET)', 227);
INSERT INTO public.empresa VALUES (1841, true, 1, '2023-07-03 14:52:48.930134', NULL, NULL, false, 'FACULDADE ITPAC BRAGANÇA (ITPAC BRAGANÇA)', 384);
INSERT INTO public.empresa VALUES (1842, true, 1, '2023-07-03 14:52:48.931557', NULL, NULL, false, 'FACULDADE ITPAC SANTA INES (ITPAC SANTA INÊS)', 507);
INSERT INTO public.empresa VALUES (1843, true, 1, '2023-07-03 14:52:48.933089', NULL, NULL, false, 'FACULDADE JAGUAR INDAIÁ (FJI)', 11);
INSERT INTO public.empresa VALUES (1844, true, 1, '2023-07-03 14:52:48.934476', NULL, NULL, false, 'FACULDADE JARDINS (FACJARDINS)', 142);
INSERT INTO public.empresa VALUES (1845, true, 1, '2023-07-03 14:52:48.935897', NULL, NULL, false, 'FACULDADE JESUÍTA DE FILOSOFIA E TEOLOGIA (FAJE)', 2);
INSERT INTO public.empresa VALUES (1846, true, 1, '2023-07-03 14:52:48.937403', NULL, NULL, false, 'FACULDADE JK BRASÍLIA - RECANTO DAS EMAS (JK BSB RE)', 5);
INSERT INTO public.empresa VALUES (1847, true, 1, '2023-07-03 14:52:48.938914', NULL, NULL, false, 'FACULDADE JK DE TECNOLOGIA (FACJK)', 5);
INSERT INTO public.empresa VALUES (1848, true, 1, '2023-07-03 14:52:48.94041', NULL, NULL, false, 'FACULDADE JK - GUARÁ (JK)', 5);
INSERT INTO public.empresa VALUES (1849, true, 1, '2023-07-03 14:52:48.941823', NULL, NULL, false, 'FACULDADE JK - UNIDADE I - GAMA', 5);
INSERT INTO public.empresa VALUES (1850, true, 1, '2023-07-03 14:52:48.943385', NULL, NULL, false, 'FACULDADE JK - UNIDADE II - GAMA', 5);
INSERT INTO public.empresa VALUES (1851, true, 1, '2023-07-03 14:52:48.944934', NULL, NULL, false, 'FACULDADE JOÃO PAULO II (FAJOP)', 621);
INSERT INTO public.empresa VALUES (1852, true, 1, '2023-07-03 14:52:48.946355', NULL, NULL, false, 'FACULDADE KENNEDY DE BELO HORIZONTE (FKBH)', 2);
INSERT INTO public.empresa VALUES (1853, true, 1, '2023-07-03 14:52:48.947774', NULL, NULL, false, 'FACULDADE KENNEDY DE IPATINGA (FKIPATINGA)', 268);
INSERT INTO public.empresa VALUES (1854, true, 1, '2023-07-03 14:52:48.949405', NULL, NULL, false, 'FACULDADE KENNEDY DE MINAS GERAIS - FKMG (FKMG)', 2);
INSERT INTO public.empresa VALUES (1855, true, 1, '2023-07-03 14:52:48.950999', NULL, NULL, false, 'FACULDADE LABORO (LABORO)', 141);
INSERT INTO public.empresa VALUES (1856, true, 1, '2023-07-03 14:52:48.952524', NULL, NULL, false, 'FACULDADE LA SALLE', 75);
INSERT INTO public.empresa VALUES (1857, true, 1, '2023-07-03 14:52:48.954095', NULL, NULL, false, 'FACULDADE LATINO-AMERICANA (FLAM)', 622);
INSERT INTO public.empresa VALUES (1858, true, 1, '2023-07-03 14:52:48.955604', NULL, NULL, false, 'FACULDADE LEGALE (LEGALE)', 8);
INSERT INTO public.empresa VALUES (1859, true, 1, '2023-07-03 14:52:48.957107', NULL, NULL, false, 'FACULDADE LEONARDO DA VINCI DE BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (1860, true, 1, '2023-07-03 14:52:48.958551', NULL, NULL, false, 'FACULDADE LEONARDO DA VINCI DE SÃO GONÇALO', 623);
INSERT INTO public.empresa VALUES (1861, true, 1, '2023-07-03 14:52:48.959972', NULL, NULL, false, 'FACULDADE LEONARDO DA VINCI - SANTA CATARINA (FAVINCI)', 624);
INSERT INTO public.empresa VALUES (1862, true, 1, '2023-07-03 14:52:48.961457', NULL, NULL, false, 'FACULDADE LIBER DE PORANGATU (FACLIBER)', 614);
INSERT INTO public.empresa VALUES (1863, true, 1, '2023-07-03 14:52:48.962906', NULL, NULL, false, 'FACULDADE LIFE (FACLIFE)', 625);
INSERT INTO public.empresa VALUES (1864, true, 1, '2023-07-03 14:52:48.964458', NULL, NULL, false, 'FACULDADE LIFE UNIC EDUCATION (LI)', 68);
INSERT INTO public.empresa VALUES (1865, true, 1, '2023-07-03 14:52:48.966019', NULL, NULL, false, 'FACULDADE LIONS (FAC-LIONS)', 42);
INSERT INTO public.empresa VALUES (1866, true, 1, '2023-07-03 14:52:48.967503', NULL, NULL, false, 'FACULDADE LOGOS (FALOG)', 626);
INSERT INTO public.empresa VALUES (1867, true, 1, '2023-07-03 14:52:48.968981', NULL, NULL, false, 'FACULDADE LUCIANO FEIJÃO (FLF)', 167);
INSERT INTO public.empresa VALUES (1868, true, 1, '2023-07-03 14:52:48.970358', NULL, NULL, false, 'FACULDADE LUIZ EDUARDO MAGALHÃES (FILEM)', 52);
INSERT INTO public.empresa VALUES (1869, true, 1, '2023-07-03 14:52:48.971699', NULL, NULL, false, 'FACULDADE LUIZ MÁRIO MOUTINHO (FLMM)', 60);
INSERT INTO public.empresa VALUES (1870, true, 1, '2023-07-03 14:52:48.973374', NULL, NULL, false, 'FACULDADE LUSITANA DE PERNAMBUCO (FALUP)', 627);
INSERT INTO public.empresa VALUES (1871, true, 1, '2023-07-03 14:52:48.975043', NULL, NULL, false, 'FACULDADE LUSO-BRASILEIRA (FALUB)', 627);
INSERT INTO public.empresa VALUES (1872, true, 1, '2023-07-03 14:52:48.976995', NULL, NULL, false, 'FACULDADE LUSÓFONA DA BAHIA (FL-BA)', 116);
INSERT INTO public.empresa VALUES (1873, true, 1, '2023-07-03 14:52:48.979183', NULL, NULL, false, 'FACULDADE LUSÓFONA DE SÃO PAULO (FL-SP)', 520);
INSERT INTO public.empresa VALUES (1874, true, 1, '2023-07-03 14:52:48.981043', NULL, NULL, false, 'FACULDADE LUSÓFONA DO RIO DE JANEIRO (FL-RJ)', 623);
INSERT INTO public.empresa VALUES (1875, true, 1, '2023-07-03 14:52:48.982989', NULL, NULL, false, 'FACULDADE LUTERANA DE TEOLOGIA (FLT)', 546);
INSERT INTO public.empresa VALUES (1876, true, 1, '2023-07-03 14:52:48.984428', NULL, NULL, false, 'FACULDADE LUTERANA SÃO MARCOS (FALSM)', 263);
INSERT INTO public.empresa VALUES (1877, true, 1, '2023-07-03 14:52:48.985878', NULL, NULL, false, 'FACULDADE MACÊDO DE AMORIM (FAMAM)', 90);
INSERT INTO public.empresa VALUES (1878, true, 1, '2023-07-03 14:52:48.987461', NULL, NULL, false, 'FACULDADE MACHADO DE ASSIS (FAMA)', 12);
INSERT INTO public.empresa VALUES (1879, true, 1, '2023-07-03 14:52:48.988998', NULL, NULL, false, 'FACULDADE MACHADO SOBRINHO (FMS)', 38);
INSERT INTO public.empresa VALUES (1880, true, 1, '2023-07-03 14:52:48.990541', NULL, NULL, false, 'FACULDADE MADALENA SOFIA (FMS)', 56);
INSERT INTO public.empresa VALUES (1881, true, 1, '2023-07-03 14:52:48.992011', NULL, NULL, false, 'FACULDADE MADRE TEREZA (FAMAT)', 628);
INSERT INTO public.empresa VALUES (1882, true, 1, '2023-07-03 14:52:48.993548', NULL, NULL, false, 'FACULDADE MADRE THAIS (FMT)', 20);
INSERT INTO public.empresa VALUES (1883, true, 1, '2023-07-03 14:52:48.995006', NULL, NULL, false, 'FACULDADE MAIS DE ITUIUTABA (FACMAIS)', 629);
INSERT INTO public.empresa VALUES (1884, true, 1, '2023-07-03 14:52:48.996421', NULL, NULL, false, 'FACULDADE MALTA (FACMA)', 27);
INSERT INTO public.empresa VALUES (1885, true, 1, '2023-07-03 14:52:48.997852', NULL, NULL, false, 'FACULDADE MARANATHA (FAMAH)', 27);
INSERT INTO public.empresa VALUES (1886, true, 1, '2023-07-03 14:52:48.999622', NULL, NULL, false, 'FACULDADE MARANHENSE (FAM)', 630);
INSERT INTO public.empresa VALUES (1887, true, 1, '2023-07-03 14:52:49.001138', NULL, NULL, false, 'FACULDADE MARANHENSE SÃO JOSÉ DOS COCAIS (FSJ)', 456);
INSERT INTO public.empresa VALUES (1888, true, 1, '2023-07-03 14:52:49.002646', NULL, NULL, false, 'FACULDADE MARECHAL RONDON', 355);
INSERT INTO public.empresa VALUES (1889, true, 1, '2023-07-03 14:52:49.004246', NULL, NULL, false, 'FACULDADE MARECHAL RONDON (FMR)', 631);
INSERT INTO public.empresa VALUES (1890, true, 1, '2023-07-03 14:52:49.005767', NULL, NULL, false, 'FACULDADE MARECHAL RONDON DE BAURU (FMR-BAURU)', 93);
INSERT INTO public.empresa VALUES (1891, true, 1, '2023-07-03 14:52:49.007384', NULL, NULL, false, 'FACULDADE MARECHAL RONDON DE GUARULHOS (FMR-GUARULHOS)', 100);
INSERT INTO public.empresa VALUES (1892, true, 1, '2023-07-03 14:52:49.008918', NULL, NULL, false, 'FACULDADE MARECHAL RONDON DE MAUÁ (FMR-MAUÁ)', 480);
INSERT INTO public.empresa VALUES (1893, true, 1, '2023-07-03 14:52:49.010442', NULL, NULL, false, 'FACULDADE MARIA THEREZA (FAMATH)', 49);
INSERT INTO public.empresa VALUES (1894, true, 1, '2023-07-03 14:52:49.012025', NULL, NULL, false, 'FACULDADE MARINGÁ (CESPAR)', 76);
INSERT INTO public.empresa VALUES (1895, true, 1, '2023-07-03 14:52:49.013645', NULL, NULL, false, 'FACULDADE MÁRIO QUINTANA (FAMAQUI)', 149);
INSERT INTO public.empresa VALUES (1896, true, 1, '2023-07-03 14:52:49.015244', NULL, NULL, false, 'FACULDADE MARQUÊS DE OLINDA (FMO)', 127);
INSERT INTO public.empresa VALUES (1897, true, 1, '2023-07-03 14:52:49.016714', NULL, NULL, false, 'FACULDADE MARTHA FALCÃO WYDEN (FMF WYDEN)', 75);
INSERT INTO public.empresa VALUES (1898, true, 1, '2023-07-03 14:52:49.018255', NULL, NULL, false, 'FACULDADE MASTER DE PARAUAPEBAS - FAMAP (FAMAP)', 281);
INSERT INTO public.empresa VALUES (1899, true, 1, '2023-07-03 14:52:49.019705', NULL, NULL, false, 'FACULDADE MASTER DO PARÁ - FAMAP TUCUMÃ (FAMAP)', 632);
INSERT INTO public.empresa VALUES (1900, true, 1, '2023-07-03 14:52:49.021216', NULL, NULL, false, 'FACULDADE MASTER DO PARÁ - FAMAP XINGUARA (FAMAP)', 633);
INSERT INTO public.empresa VALUES (1901, true, 1, '2023-07-03 14:52:49.022811', NULL, NULL, false, 'FACULDADE MATO GROSSO DO SUL (FACSUL)', 48);
INSERT INTO public.empresa VALUES (1902, true, 1, '2023-07-03 14:52:49.024517', NULL, NULL, false, 'FACULDADE MAUÁ DE GOIÁS', 603);
INSERT INTO public.empresa VALUES (1903, true, 1, '2023-07-03 14:52:49.026219', NULL, NULL, false, 'FACULDADE MAURÍCIO DE NASSAU DE IMPETRATRIZ (FMN IMPERATRIZ)', 267);
INSERT INTO public.empresa VALUES (1904, true, 1, '2023-07-03 14:52:49.027965', NULL, NULL, false, 'FACULDADE MAURÍCIO DE NASSAU SERRA TALHADA (FMN SERRA)', 398);
INSERT INTO public.empresa VALUES (1905, true, 1, '2023-07-03 14:52:49.029548', NULL, NULL, false, 'FACULDADE M-EDUCAR (FAMED)', 634);
INSERT INTO public.empresa VALUES (1906, true, 1, '2023-07-03 14:52:49.031151', NULL, NULL, false, 'FACULDADE MEGA (MEGA)', 2);
INSERT INTO public.empresa VALUES (1907, true, 1, '2023-07-03 14:52:49.032681', NULL, NULL, false, 'FACULDADE MÉLIÈS (MÉLIÈS)', 8);
INSERT INTO public.empresa VALUES (1908, true, 1, '2023-07-03 14:52:49.034134', NULL, NULL, false, 'FACULDADE MENINO DEUS (FAMED)', 149);
INSERT INTO public.empresa VALUES (1909, true, 1, '2023-07-03 14:52:49.035599', NULL, NULL, false, 'FACULDADE MENNA BARRETO (FMB)', 206);
INSERT INTO public.empresa VALUES (1910, true, 1, '2023-07-03 14:52:49.037137', NULL, NULL, false, 'FACULDADE MERIDIONAL (IMED)', 282);
INSERT INTO public.empresa VALUES (1911, true, 1, '2023-07-03 14:52:49.038678', NULL, NULL, false, 'FACULDADE MERIDIONAL DE IJUÍ (IMED)', 311);
INSERT INTO public.empresa VALUES (1912, true, 1, '2023-07-03 14:52:49.04024', NULL, NULL, false, 'FACULDADE MERIDIONAL DE PORTO ALEGRE (IMED)', 149);
INSERT INTO public.empresa VALUES (1913, true, 1, '2023-07-03 14:52:49.041832', NULL, NULL, false, 'FACULDADE MERIDIONAL RS (IMED )', 149);
INSERT INTO public.empresa VALUES (1914, true, 1, '2023-07-03 14:52:49.043416', NULL, NULL, false, 'FACULDADE MESSIANICA', 8);
INSERT INTO public.empresa VALUES (1915, true, 1, '2023-07-03 14:52:49.045047', NULL, NULL, false, 'FACULDADE METODISTA CENTENÁRIO (FMC)', 417);
INSERT INTO public.empresa VALUES (1916, true, 1, '2023-07-03 14:52:49.046542', NULL, NULL, false, 'FACULDADE METODISTA CONEXIONAL (FACO)', 467);
INSERT INTO public.empresa VALUES (1917, true, 1, '2023-07-03 14:52:49.048037', NULL, NULL, false, 'FACULDADE METODISTA DE CIÊNCIAS HUMANAS E EXATAS (METODISTA)', 313);
INSERT INTO public.empresa VALUES (1918, true, 1, '2023-07-03 14:52:49.049569', NULL, NULL, false, 'FACULDADE METODISTA GRANBERY (FMG)', 38);
INSERT INTO public.empresa VALUES (1919, true, 1, '2023-07-03 14:52:49.051119', NULL, NULL, false, 'FACULDADE MÉTODO DE SÃO PAULO (FAMESP)', 8);
INSERT INTO public.empresa VALUES (1920, true, 1, '2023-07-03 14:52:49.052566', NULL, NULL, false, 'FACULDADE METROPOLITANA (UNNESA)', 51);
INSERT INTO public.empresa VALUES (1921, true, 1, '2023-07-03 14:52:49.0541', NULL, NULL, false, 'FACULDADE METROPOLITANA DA GRANDE RECIFE (UNESJ)', 132);
INSERT INTO public.empresa VALUES (1922, true, 1, '2023-07-03 14:52:49.055686', NULL, NULL, false, 'FACULDADE METROPOLITANA DE ANÁPOLIS (FAMA)', 264);
INSERT INTO public.empresa VALUES (1923, true, 1, '2023-07-03 14:52:49.057219', NULL, NULL, false, 'FACULDADE METROPOLITANA DE CIENCIAS E TECNOLOGIA (FAMEC)', 537);
INSERT INTO public.empresa VALUES (1924, true, 1, '2023-07-03 14:52:49.058685', NULL, NULL, false, 'FACULDADE METROPOLITANA DE COARI (FAMETRO)', 635);
INSERT INTO public.empresa VALUES (1925, true, 1, '2023-07-03 14:52:49.060172', NULL, NULL, false, 'FACULDADE METROPOLITANA DE DIAS D''ÀVILA (FACD''ÀVILA)', 636);
INSERT INTO public.empresa VALUES (1926, true, 1, '2023-07-03 14:52:49.061783', NULL, NULL, false, 'FACULDADE METROPOLITANA DE FLORIANÓPOLIS (FAMEFLORIPA)', 3);
INSERT INTO public.empresa VALUES (1927, true, 1, '2023-07-03 14:52:49.063308', NULL, NULL, false, 'FACULDADE METROPOLITANA DE FRANCA (FAMEF)', 179);
INSERT INTO public.empresa VALUES (1928, true, 1, '2023-07-03 14:52:49.064839', NULL, NULL, false, 'FACULDADE METROPOLITANA DE HORIZONTE (FMH)', 525);
INSERT INTO public.empresa VALUES (1929, true, 1, '2023-07-03 14:52:49.066218', NULL, NULL, false, 'FACULDADE METROPOLITANA DE ITACOATIARA (FAMETRO)', 637);
INSERT INTO public.empresa VALUES (1930, true, 1, '2023-07-03 14:52:49.067609', NULL, NULL, false, 'FACULDADE METROPOLITANA DE ITAJAÍ (FIMT)', 345);
INSERT INTO public.empresa VALUES (1931, true, 1, '2023-07-03 14:52:49.068947', NULL, NULL, false, 'FACULDADE METROPOLITANA DE JOINVILLE (FAMEVILLE)', 68);
INSERT INTO public.empresa VALUES (1932, true, 1, '2023-07-03 14:52:49.070468', NULL, NULL, false, 'FACULDADE METROPOLITANA DE LAGES (FAMELAGES)', 148);
INSERT INTO public.empresa VALUES (1933, true, 1, '2023-07-03 14:52:49.072008', NULL, NULL, false, 'FACULDADE METROPOLITANA DE PALHOÇA (FAMEPALHOÇA)', 544);
INSERT INTO public.empresa VALUES (1934, true, 1, '2023-07-03 14:52:49.07363', NULL, NULL, false, 'FACULDADE METROPOLITANA DE PARINTINS (FAMETRO)', 638);
INSERT INTO public.empresa VALUES (1935, true, 1, '2023-07-03 14:52:49.075242', NULL, NULL, false, 'FACULDADE METROPOLITANA DE RIO DO SUL (FAMESUL)', 183);
INSERT INTO public.empresa VALUES (1936, true, 1, '2023-07-03 14:52:49.076777', NULL, NULL, false, 'FACULDADE METROPOLITANA DE TEFÉ (FAMETRO)', 639);
INSERT INTO public.empresa VALUES (1937, true, 1, '2023-07-03 14:52:49.078442', NULL, NULL, false, 'FACULDADE METROPOLITANA DE TERESINA', 27);
INSERT INTO public.empresa VALUES (1938, true, 1, '2023-07-03 14:52:49.080267', NULL, NULL, false, 'FACULDADE METROPOLITANA DO CARIRI (FAMEC)', 310);
INSERT INTO public.empresa VALUES (1939, true, 1, '2023-07-03 14:52:49.082111', NULL, NULL, false, 'FACULDADE METROPOLITANA DO CEARÁ (FAMEC)', 45);
INSERT INTO public.empresa VALUES (1940, true, 1, '2023-07-03 14:52:49.083894', NULL, NULL, false, 'FACULDADE METROPOLITANA DO ESTADO DE SÃO PAULO (FAMEESP)', 58);
INSERT INTO public.empresa VALUES (1941, true, 1, '2023-07-03 14:52:49.085822', NULL, NULL, false, 'FACULDADE METROPOLITANA DO MARAJÓ (FAMMA)', 640);
INSERT INTO public.empresa VALUES (1942, true, 1, '2023-07-03 14:52:49.087711', NULL, NULL, false, 'FACULDADE METROPOLITANA DO PARÁ (FAMETRO)', 78);
INSERT INTO public.empresa VALUES (1943, true, 1, '2023-07-03 14:52:49.089288', NULL, NULL, false, 'FACULDADE METROPOLITANA DO PLANALTO NORTE (FAMEPLAN)', 358);
INSERT INTO public.empresa VALUES (1944, true, 1, '2023-07-03 14:52:49.091231', NULL, NULL, false, 'FACULDADE METROPOLITANA NORTE RIOGRANDENSE (FAMEN)', 130);
INSERT INTO public.empresa VALUES (1945, true, 1, '2023-07-03 14:52:49.093045', NULL, NULL, false, 'FACULDADE METROPOLITANA SÃO CARLOS BJI (FAMESC-BJI)', 448);
INSERT INTO public.empresa VALUES (1946, true, 1, '2023-07-03 14:52:49.09508', NULL, NULL, false, 'FACULDADE MICROLINS (FAMIC)', 181);
INSERT INTO public.empresa VALUES (1947, true, 1, '2023-07-03 14:52:49.096931', NULL, NULL, false, 'FACULDADE MILTON CAMPOS (FMC)', 481);
INSERT INTO public.empresa VALUES (1948, true, 1, '2023-07-03 14:52:49.098386', NULL, NULL, false, 'FACULDADE MINAS GERAIS (FAMIG)', 2);
INSERT INTO public.empresa VALUES (1949, true, 1, '2023-07-03 14:52:49.099794', NULL, NULL, false, 'FACULDADE MIRIENSE', 641);
INSERT INTO public.empresa VALUES (1950, true, 1, '2023-07-03 14:52:49.10125', NULL, NULL, false, 'FACULDADE MODAL (MODAL)', 2);
INSERT INTO public.empresa VALUES (1951, true, 1, '2023-07-03 14:52:49.102767', NULL, NULL, false, 'FACULDADE MODELO (FACIMOD)', 56);
INSERT INTO public.empresa VALUES (1952, true, 1, '2023-07-03 14:52:49.104323', NULL, NULL, false, 'FACULDADE MOGIANA (FAMOGI)', 642);
INSERT INTO public.empresa VALUES (1953, true, 1, '2023-07-03 14:52:49.105904', NULL, NULL, false, 'FACULDADE MOGIANA DO ESTADO DE SÃO PAULO (FMG)', 279);
INSERT INTO public.empresa VALUES (1954, true, 1, '2023-07-03 14:52:49.107508', NULL, NULL, false, 'FACULDADE MONSENHOR HIPOLITO (FMH)', 643);
INSERT INTO public.empresa VALUES (1955, true, 1, '2023-07-03 14:52:49.109043', NULL, NULL, false, 'FACULDADE MONTE PASCOAL (FMP)', 644);
INSERT INTO public.empresa VALUES (1956, true, 1, '2023-07-03 14:52:49.110573', NULL, NULL, false, 'FACULDADE MONTES CLAROS (FACULMONTES)', 128);
INSERT INTO public.empresa VALUES (1957, true, 1, '2023-07-03 14:52:49.112093', NULL, NULL, false, 'FACULDADE MONTESSORIANO DE SALVADOR (FAMA)', 116);
INSERT INTO public.empresa VALUES (1958, true, 1, '2023-07-03 14:52:49.113648', NULL, NULL, false, 'FACULDADE MORGANA POTRICH (FAMP)', 109);
INSERT INTO public.empresa VALUES (1959, true, 1, '2023-07-03 14:52:49.115244', NULL, NULL, false, 'FACULDADE MORUMBI (FAMOR)', 8);
INSERT INTO public.empresa VALUES (1960, true, 1, '2023-07-03 14:52:49.11695', NULL, NULL, false, 'FACULDADE MOZARTEUM DE SÃO PAULO (FAMOSP)', 8);
INSERT INTO public.empresa VALUES (1961, true, 1, '2023-07-03 14:52:49.118457', NULL, NULL, false, 'FACULDADE MULTIVERSA (MULTIVERSA)', 124);
INSERT INTO public.empresa VALUES (1962, true, 1, '2023-07-03 14:52:49.119996', NULL, NULL, false, 'FACULDADE MULTIVERSA DE FORTALEZA', 45);
INSERT INTO public.empresa VALUES (1963, true, 1, '2023-07-03 14:52:49.121514', NULL, NULL, false, 'FACULDADE MULTIVERSA DE PALOTINA (MULTIVERSA)', 645);
INSERT INTO public.empresa VALUES (1964, true, 1, '2023-07-03 14:52:49.123053', NULL, NULL, false, 'FACULDADE MULTIVERSA DE TECNOLOGIA', 45);
INSERT INTO public.empresa VALUES (1965, true, 1, '2023-07-03 14:52:49.124621', NULL, NULL, false, 'FACULDADE MULTIVIX CARIACICA (MULTIVIX CARIAC)', 389);
INSERT INTO public.empresa VALUES (1966, true, 1, '2023-07-03 14:52:49.1262', NULL, NULL, false, 'FACULDADE MULTIVIX DE CACHOEIRO (MULTIVIX CACHOEIRO)', 190);
INSERT INTO public.empresa VALUES (1967, true, 1, '2023-07-03 14:52:49.12777', NULL, NULL, false, 'FACULDADE MULTIVIX NOVA VENÉCIA (MULTIVIX NOVA VENÉCI)', 646);
INSERT INTO public.empresa VALUES (1968, true, 1, '2023-07-03 14:52:49.129407', NULL, NULL, false, 'FACULDADE MULTIVIX SÃO MATEUS (MULTIVIX SÃO MATEUS)', 216);
INSERT INTO public.empresa VALUES (1969, true, 1, '2023-07-03 14:52:49.130937', NULL, NULL, false, 'FACULDADE MULTIVIX SERRA (MULTIVIX SERRA)', 290);
INSERT INTO public.empresa VALUES (1970, true, 1, '2023-07-03 14:52:49.132634', NULL, NULL, false, 'FACULDADE MULTIVIX VILA VELHA (MULTIVIX VILA V)', 226);
INSERT INTO public.empresa VALUES (1971, true, 1, '2023-07-03 14:52:49.13427', NULL, NULL, false, 'FACULDADE MUNICIPAL DE EDUCAÇÃO E MEIO AMBIENTE (FAMA)', 647);
INSERT INTO public.empresa VALUES (1972, true, 1, '2023-07-03 14:52:49.135834', NULL, NULL, false, 'FACULDADE MUNICIPAL DE PALHOÇA (FMP)', 544);
INSERT INTO public.empresa VALUES (1973, true, 1, '2023-07-03 14:52:49.137436', NULL, NULL, false, 'FACULDADE MUNICIPAL PROFESSOR FRANCO MONTORO DE MOGI GUAÇU (FMPFM)', 279);
INSERT INTO public.empresa VALUES (1974, true, 1, '2023-07-03 14:52:49.139037', NULL, NULL, false, 'FACULDADE MURIALDO (FAMUR)', 87);
INSERT INTO public.empresa VALUES (1975, true, 1, '2023-07-03 14:52:49.140713', NULL, NULL, false, 'FACULDADE NACIONAL (FANAC)', 60);
INSERT INTO public.empresa VALUES (1976, true, 1, '2023-07-03 14:52:49.142167', NULL, NULL, false, 'FACULDADE NACIONAL DE NATUROPATIA ADMINISTRAÇÃO E PEDAGOGIA (FANNAP)', 541);
INSERT INTO public.empresa VALUES (1977, true, 1, '2023-07-03 14:52:49.143663', NULL, NULL, false, 'FACULDADE NAZARENA DO BRASIL (FNB)', 177);
INSERT INTO public.empresa VALUES (1978, true, 1, '2023-07-03 14:52:49.145212', NULL, NULL, false, 'FACULDADE NETCOM (FANET)', 141);
INSERT INTO public.empresa VALUES (1979, true, 1, '2023-07-03 14:52:49.146707', NULL, NULL, false, 'FACULDADE NETWORK (NWK)', 648);
INSERT INTO public.empresa VALUES (1980, true, 1, '2023-07-03 14:52:49.148205', NULL, NULL, false, 'FACULDADE NIP DE CIÊNCIAS APLICADAS (FANIP)', 60);
INSERT INTO public.empresa VALUES (1981, true, 1, '2023-07-03 14:52:49.149708', NULL, NULL, false, 'FACULDADE NOROESTE (FAN)', 42);
INSERT INTO public.empresa VALUES (1982, true, 1, '2023-07-03 14:52:49.151216', NULL, NULL, false, 'FACULDADE NORTE E NORDESTE DO BRASIL (FANOR - BRASIL)', 649);
INSERT INTO public.empresa VALUES (1983, true, 1, '2023-07-03 14:52:49.152866', NULL, NULL, false, 'FACULDADE NORTE-SUL (FANS)', 183);
INSERT INTO public.empresa VALUES (1984, true, 1, '2023-07-03 14:52:49.15457', NULL, NULL, false, 'FACULDADE NOSSA SENHORA APARECIDA (FNSA)', 98);
INSERT INTO public.empresa VALUES (1985, true, 1, '2023-07-03 14:52:49.156393', NULL, NULL, false, 'FACULDADE NOSSA SENHORA DA CONCEIÇÃO (FSC)', 142);
INSERT INTO public.empresa VALUES (1986, true, 1, '2023-07-03 14:52:49.158128', NULL, NULL, false, 'FACULDADE NOSSA SENHORA DE FÁTIMA (FACULDADE FÁTIMA)', 87);
INSERT INTO public.empresa VALUES (1987, true, 1, '2023-07-03 14:52:49.15982', NULL, NULL, false, 'FACULDADE NOSSA SENHORA DE LOURDES (FNSL)', 308);
INSERT INTO public.empresa VALUES (1988, true, 1, '2023-07-03 14:52:49.161363', NULL, NULL, false, 'FACULDADE NOVA ROMA (FNR)', 60);
INSERT INTO public.empresa VALUES (1989, true, 1, '2023-07-03 14:52:49.162829', NULL, NULL, false, 'FACULDADE NOVA ROMA CARUARU (FNR CARUARU)', 156);
INSERT INTO public.empresa VALUES (1990, true, 1, '2023-07-03 14:52:49.164271', NULL, NULL, false, 'FACULDADE NOVA ROMA DE CAMPO GRANDE (FNR - CAMPO GRANDE)', 48);
INSERT INTO public.empresa VALUES (1991, true, 1, '2023-07-03 14:52:49.165628', NULL, NULL, false, 'FACULDADE NOVE DE JULHO DE BAURU (NOVE-BAURU)', 93);
INSERT INTO public.empresa VALUES (1992, true, 1, '2023-07-03 14:52:49.167206', NULL, NULL, false, 'FACULDADE NOVE DE JULHO DE BOTUCATU (NOVE-BOTUCATU)', 383);
INSERT INTO public.empresa VALUES (1993, true, 1, '2023-07-03 14:52:49.168675', NULL, NULL, false, 'FACULDADE NOVE DE JULHO DE OSASCO (NOVE-OSASCO)', 158);
INSERT INTO public.empresa VALUES (1994, true, 1, '2023-07-03 14:52:49.17012', NULL, NULL, false, 'FACULDADE NOVE DE JULHO DE SÃO BERNARDO DO CAMPO (NOVE-SBC)', 82);
INSERT INTO public.empresa VALUES (1995, true, 1, '2023-07-03 14:52:49.171531', NULL, NULL, false, 'FACULDADE NOVE DE JULHO GUARULHOS (NOVE-GUARULHOS)', 100);
INSERT INTO public.empresa VALUES (1996, true, 1, '2023-07-03 14:52:49.172923', NULL, NULL, false, 'FACULDADE NOVE DE JULHO MAUÁ (NOVE_MAUÁ)', 480);
INSERT INTO public.empresa VALUES (1997, true, 1, '2023-07-03 14:52:49.174478', NULL, NULL, false, 'FACULDADE NOVOESTE (NOVOESTE)', 48);
INSERT INTO public.empresa VALUES (1998, true, 1, '2023-07-03 14:52:49.176069', NULL, NULL, false, 'FACULDADE NOVO HAMBURGO (FACULDADE IENH)', 541);
INSERT INTO public.empresa VALUES (1999, true, 1, '2023-07-03 14:52:49.177612', NULL, NULL, false, 'FACULDADE NOVO HORIZONTE (FNH)', 90);
INSERT INTO public.empresa VALUES (2000, true, 1, '2023-07-03 14:52:49.179043', NULL, NULL, false, 'FACULDADE NOVO HORIZONTE DE IPOJUCA (FNH)', 650);
INSERT INTO public.empresa VALUES (2001, true, 1, '2023-07-03 14:52:49.18055', NULL, NULL, false, 'FACULDADE NOVO MILÊNIO (FNM)', 226);
INSERT INTO public.empresa VALUES (2002, true, 1, '2023-07-03 14:52:49.182141', NULL, NULL, false, 'FACULDADE OLGA METTIG (FAMETTIG)', 116);
INSERT INTO public.empresa VALUES (2003, true, 1, '2023-07-03 14:52:49.183677', NULL, NULL, false, 'FACULDADE ONE LEARNING', 566);
INSERT INTO public.empresa VALUES (2004, true, 1, '2023-07-03 14:52:49.185199', NULL, NULL, false, 'FACULDADE OPUS 365', 8);
INSERT INTO public.empresa VALUES (2005, true, 1, '2023-07-03 14:52:49.186769', NULL, NULL, false, 'FACULDADE ORÍGENES LESSA (FACOL)', 651);
INSERT INTO public.empresa VALUES (2006, true, 1, '2023-07-03 14:52:49.188313', NULL, NULL, false, 'FACULDADE PADRÃO (PADRAO)', 42);
INSERT INTO public.empresa VALUES (2007, true, 1, '2023-07-03 14:52:49.18986', NULL, NULL, false, 'FACULDADE PADRÃO (-)', 41);
INSERT INTO public.empresa VALUES (2008, true, 1, '2023-07-03 14:52:49.191392', NULL, NULL, false, 'FACULDADE PADRAO DE SENADOR CANEDO (FAPSC)', 538);
INSERT INTO public.empresa VALUES (2009, true, 1, '2023-07-03 14:52:49.193027', NULL, NULL, false, 'FACULDADE PAIVA ANDRADE (FPA)', 45);
INSERT INTO public.empresa VALUES (2010, true, 1, '2023-07-03 14:52:49.19471', NULL, NULL, false, 'FACULDADE PALOTINA (FAPAS)', 417);
INSERT INTO public.empresa VALUES (2011, true, 1, '2023-07-03 14:52:49.196386', NULL, NULL, false, 'FACULDADE PAN AMAZÔNICA (FAPAN)', 79);
INSERT INTO public.empresa VALUES (2012, true, 1, '2023-07-03 14:52:49.197926', NULL, NULL, false, 'FACULDADE PAN AMERICANA (FPA)', 652);
INSERT INTO public.empresa VALUES (2013, true, 1, '2023-07-03 14:52:49.199457', NULL, NULL, false, 'FACULDADE PAN-AMERICANA DE ADMINISTRAÇÃO E DIREITO (FAPAD)', 56);
INSERT INTO public.empresa VALUES (2014, true, 1, '2023-07-03 14:52:49.201033', NULL, NULL, false, 'FACULDADE PARAENSE DE ENSINO (FAPEN)', 79);
INSERT INTO public.empresa VALUES (2015, true, 1, '2023-07-03 14:52:49.202625', NULL, NULL, false, 'FACULDADE PARAÍSO ARARIPINA (FAP)', 393);
INSERT INTO public.empresa VALUES (2016, true, 1, '2023-07-03 14:52:49.204711', NULL, NULL, false, 'FACULDADE PARAÍSO FORTALEZA (FAP)', 45);
INSERT INTO public.empresa VALUES (2017, true, 1, '2023-07-03 14:52:49.206859', NULL, NULL, false, 'FACULDADE PARANÁ (FAP)', 327);
INSERT INTO public.empresa VALUES (2018, true, 1, '2023-07-03 14:52:49.208955', NULL, NULL, false, 'FACULDADE PARANAENSE (FACCAR)', 653);
INSERT INTO public.empresa VALUES (2019, true, 1, '2023-07-03 14:52:49.210927', NULL, NULL, false, 'FACULDADE PARANAENSE (FAPAR)', 56);
INSERT INTO public.empresa VALUES (2020, true, 1, '2023-07-03 14:52:49.212628', NULL, NULL, false, 'FACULDADE PARA O DESENVOLVIMENTO SUSTENTÁVEL DA AMAZÔNIA (FADESA)', 281);
INSERT INTO public.empresa VALUES (2021, true, 1, '2023-07-03 14:52:49.214361', NULL, NULL, false, 'FACULDADE PARQUE (FAP)', 116);
INSERT INTO public.empresa VALUES (2022, true, 1, '2023-07-03 14:52:49.216122', NULL, NULL, false, 'FACULDADE PASCHOAL DANTAS (FPD)', 8);
INSERT INTO public.empresa VALUES (2023, true, 1, '2023-07-03 14:52:49.217865', NULL, NULL, false, 'FACULDADE PASCHOAL DANTAS EAD (FPD - EAD)', 8);
INSERT INTO public.empresa VALUES (2024, true, 1, '2023-07-03 14:52:49.219588', NULL, NULL, false, 'FACULDADE PAULISTA DE ARTES (FPA)', 8);
INSERT INTO public.empresa VALUES (2025, true, 1, '2023-07-03 14:52:49.221355', NULL, NULL, false, 'FACULDADE PAULISTA DE BEM ESTAR E SAÚDE', 8);
INSERT INTO public.empresa VALUES (2026, true, 1, '2023-07-03 14:52:49.222932', NULL, NULL, false, 'FACULDADE PAULISTA DE CIÊNCIAS DA SAÚDE (FPCS)', 8);
INSERT INTO public.empresa VALUES (2027, true, 1, '2023-07-03 14:52:49.224542', NULL, NULL, false, 'FACULDADE PAULISTA DE COMUNICAÇÃO (FEPAC)', 8);
INSERT INTO public.empresa VALUES (2028, true, 1, '2023-07-03 14:52:49.22614', NULL, NULL, false, 'FACULDADE PAULISTA DE GESTÃO E SAÚDE', 8);
INSERT INTO public.empresa VALUES (2029, true, 1, '2023-07-03 14:52:49.227847', NULL, NULL, false, 'FACULDADE PAULISTA DE SERVIÇO SOCIAL DE SÃO CAETANO DO SUL (FAPSS)', 126);
INSERT INTO public.empresa VALUES (2030, true, 1, '2023-07-03 14:52:49.229535', NULL, NULL, false, 'FACULDADE PAULO PICANÇO (FACPP)', 45);
INSERT INTO public.empresa VALUES (2031, true, 1, '2023-07-03 14:52:49.231232', NULL, NULL, false, 'FACULDADE PAULUS DE TECNOLOGIA E COMUNICAÇÃO (FAPCOM)', 8);
INSERT INTO public.empresa VALUES (2032, true, 1, '2023-07-03 14:52:49.232814', NULL, NULL, false, 'FACULDADE PECEGE (PECEGE)', 224);
INSERT INTO public.empresa VALUES (2033, true, 1, '2023-07-03 14:52:49.234385', NULL, NULL, false, 'FACULDADE PEDRO II (FAPE2)', 2);
INSERT INTO public.empresa VALUES (2034, true, 1, '2023-07-03 14:52:49.236001', NULL, NULL, false, 'FACULDADE PEDRO LEOPOLDO (FPL)', 654);
INSERT INTO public.empresa VALUES (2035, true, 1, '2023-07-03 14:52:49.237616', NULL, NULL, false, 'FACULDADE PENTÁGONO - FAPEN (FAPEN)', 47);
INSERT INTO public.empresa VALUES (2036, true, 1, '2023-07-03 14:52:49.239165', NULL, NULL, false, 'FACULDADE PERNAMBUCANA DE SAÚDE (FPS)', 60);
INSERT INTO public.empresa VALUES (2037, true, 1, '2023-07-03 14:52:49.240797', NULL, NULL, false, 'FACULDADE PERUIBE (FPBE)', 655);
INSERT INTO public.empresa VALUES (2038, true, 1, '2023-07-03 14:52:49.242316', NULL, NULL, false, 'FACULDADE PESTALOZZI DE FRANCA (FAPESF)', 179);
INSERT INTO public.empresa VALUES (2039, true, 1, '2023-07-03 14:52:49.243782', NULL, NULL, false, 'FACULDADE PETRUS (FAPETRUS)', 141);
INSERT INTO public.empresa VALUES (2040, true, 1, '2023-07-03 14:52:49.245321', NULL, NULL, false, 'FACULDADE PHORTE DE EDUCAÇÃO E TECNOLOGIA', 8);
INSERT INTO public.empresa VALUES (2041, true, 1, '2023-07-03 14:52:49.246875', NULL, NULL, false, 'FACULDADE PHYSIO CURSOS (FACPHYSIO)', 8);
INSERT INTO public.empresa VALUES (2042, true, 1, '2023-07-03 14:52:49.248407', NULL, NULL, false, 'FACULDADE PIAUIENSE DE PROCESSAMENTO DE DADOS (FPPD)', 27);
INSERT INTO public.empresa VALUES (2043, true, 1, '2023-07-03 14:52:49.249866', NULL, NULL, false, 'FACULDADE PINHALZINHO (HORUS)', 656);
INSERT INTO public.empresa VALUES (2044, true, 1, '2023-07-03 14:52:49.251288', NULL, NULL, false, 'FACULDADE PINHEIRO GUIMARÃES (FAPG)', 12);
INSERT INTO public.empresa VALUES (2045, true, 1, '2023-07-03 14:52:49.252934', NULL, NULL, false, 'FACULDADE PIO DÉCIMO (FPD)', 142);
INSERT INTO public.empresa VALUES (2046, true, 1, '2023-07-03 14:52:49.254521', NULL, NULL, false, 'FACULDADE PIO DECIMO DE CANINDE DO SAO FRANCISCO (FAPIDE)', 657);
INSERT INTO public.empresa VALUES (2047, true, 1, '2023-07-03 14:52:49.256007', NULL, NULL, false, 'FACULDADE PITÁGORAS ANHANGUERA DE TERESINA', 27);
INSERT INTO public.empresa VALUES (2048, true, 1, '2023-07-03 14:52:49.257474', NULL, NULL, false, 'FACULDADE PITAGORAS ANHANGUERA DE TRÊS LAGOAS', 658);
INSERT INTO public.empresa VALUES (2049, true, 1, '2023-07-03 14:52:49.258944', NULL, NULL, false, 'FACULDADE PITÁGORAS BACABAL MEARIM', 659);
INSERT INTO public.empresa VALUES (2050, true, 1, '2023-07-03 14:52:49.2606', NULL, NULL, false, 'FACULDADE PITÁGORAS DE ALTAMIRA', 14);
INSERT INTO public.empresa VALUES (2051, true, 1, '2023-07-03 14:52:49.262156', NULL, NULL, false, 'FACULDADE PITÁGORAS DE BACABAL', 659);
INSERT INTO public.empresa VALUES (2052, true, 1, '2023-07-03 14:52:49.263697', NULL, NULL, false, 'FACULDADE PITÁGORAS DE BELÉM', 79);
INSERT INTO public.empresa VALUES (2053, true, 1, '2023-07-03 14:52:49.265353', NULL, NULL, false, 'FACULDADE PITÁGORAS DE BRUMADO', 660);
INSERT INTO public.empresa VALUES (2054, true, 1, '2023-07-03 14:52:49.266898', NULL, NULL, false, 'FACULDADE PITÁGORAS DE CONCÓRDIA', 350);
INSERT INTO public.empresa VALUES (2055, true, 1, '2023-07-03 14:52:49.268486', NULL, NULL, false, 'FACULDADE PITAGORAS DE EUNAPOLIS (FPE)', 587);
INSERT INTO public.empresa VALUES (2056, true, 1, '2023-07-03 14:52:49.270086', NULL, NULL, false, 'FACULDADE PITÁGORAS DE IRECÊ (FPI)', 245);
INSERT INTO public.empresa VALUES (2057, true, 1, '2023-07-03 14:52:49.271696', NULL, NULL, false, 'FACULDADE PITÁGORAS DE JUIZ DE FORA (FPJF)', 38);
INSERT INTO public.empresa VALUES (2058, true, 1, '2023-07-03 14:52:49.273285', NULL, NULL, false, 'FACULDADE PITÁGORAS DE LUIS EDUARDO MAGALHÃES', 52);
INSERT INTO public.empresa VALUES (2059, true, 1, '2023-07-03 14:52:49.274888', NULL, NULL, false, 'FACULDADE PITÁGORAS DE MEDICINA DE EUNÁPOLIS', 587);
INSERT INTO public.empresa VALUES (2060, true, 1, '2023-07-03 14:52:49.276479', NULL, NULL, false, 'FACULDADE PITÁGORAS DE MOSSORÓ', 323);
INSERT INTO public.empresa VALUES (2061, true, 1, '2023-07-03 14:52:49.278083', NULL, NULL, false, 'FACULDADE PITÁGORAS DE PARANAGUÁ', 661);
INSERT INTO public.empresa VALUES (2062, true, 1, '2023-07-03 14:52:49.279547', NULL, NULL, false, 'FACULDADE PITÁGORAS DE PENÁPOLIS', 463);
INSERT INTO public.empresa VALUES (2063, true, 1, '2023-07-03 14:52:49.281006', NULL, NULL, false, 'FACULDADE PITÁGORAS DE POUSO ALEGRE (FPPA)', 230);
INSERT INTO public.empresa VALUES (2064, true, 1, '2023-07-03 14:52:49.2824', NULL, NULL, false, 'FACULDADE PITÁGORAS DE RIO VERDE', 202);
INSERT INTO public.empresa VALUES (2065, true, 1, '2023-07-03 14:52:49.283772', NULL, NULL, false, 'FACULDADE PITÁGORAS DE TUCURUÍ', 418);
INSERT INTO public.empresa VALUES (2066, true, 1, '2023-07-03 14:52:49.285011', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR ANHANGUERA DE LONDRINA', 159);
INSERT INTO public.empresa VALUES (2067, true, 1, '2023-07-03 14:52:49.286285', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE BRUMADO', 660);
INSERT INTO public.empresa VALUES (2068, true, 1, '2023-07-03 14:52:49.287583', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE CALDAS NOVAS', 387);
INSERT INTO public.empresa VALUES (2069, true, 1, '2023-07-03 14:52:49.288817', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE CANINDÉ', 588);
INSERT INTO public.empresa VALUES (2070, true, 1, '2023-07-03 14:52:49.289997', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE CHAPECÓ', 406);
INSERT INTO public.empresa VALUES (2071, true, 1, '2023-07-03 14:52:49.291226', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE GUANAMBI (FPG)', 157);
INSERT INTO public.empresa VALUES (2072, true, 1, '2023-07-03 14:52:49.292472', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE ITAJUBÁ', 103);
INSERT INTO public.empresa VALUES (2073, true, 1, '2023-07-03 14:52:49.293592', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE JOÃO PESSOA', 107);
INSERT INTO public.empresa VALUES (2074, true, 1, '2023-07-03 14:52:49.29478', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE MURIAÉ', 154);
INSERT INTO public.empresa VALUES (2075, true, 1, '2023-07-03 14:52:49.295961', NULL, NULL, false, 'FACULDADE PITÁGORAS UNOPAR DE QUIXERAMOBIM', 500);
INSERT INTO public.empresa VALUES (2076, true, 1, '2023-07-03 14:52:49.29715', NULL, NULL, false, 'FACULDADE PLUS (PLUS)', 45);
INSERT INTO public.empresa VALUES (2077, true, 1, '2023-07-03 14:52:49.298344', NULL, NULL, false, 'FACULDADE POLIENSINO - FP', 203);
INSERT INTO public.empresa VALUES (2078, true, 1, '2023-07-03 14:52:49.299526', NULL, NULL, false, 'FACULDADE PÓLIS CIVITAS', 56);
INSERT INTO public.empresa VALUES (2079, true, 1, '2023-07-03 14:52:49.30071', NULL, NULL, false, 'FACULDADE POLITÉCNICA DE CAMPINAS (POLICAMP)', 177);
INSERT INTO public.empresa VALUES (2080, true, 1, '2023-07-03 14:52:49.301956', NULL, NULL, false, 'FACULDADE POLITÉCNICA DE CAMPO GRANDE (POLITÉCNICA)', 48);
INSERT INTO public.empresa VALUES (2081, true, 1, '2023-07-03 14:52:49.303117', NULL, NULL, false, 'FACULDADE PORTO DAS ÁGUAS (FAPAG)', 662);
INSERT INTO public.empresa VALUES (2082, true, 1, '2023-07-03 14:52:49.304289', NULL, NULL, false, 'FACULDADE PORTO UNIÃO (FPU)', 8);
INSERT INTO public.empresa VALUES (2083, true, 1, '2023-07-03 14:52:49.305471', NULL, NULL, false, 'FACULDADE POSITIVO LONDRINA (FPL)', 159);
INSERT INTO public.empresa VALUES (2084, true, 1, '2023-07-03 14:52:49.306645', NULL, NULL, false, 'FACULDADE PRAIA GRANDE (FPG)', 250);
INSERT INTO public.empresa VALUES (2085, true, 1, '2023-07-03 14:52:49.307901', NULL, NULL, false, 'FACULDADE PREMIER (PREMIER)', 42);
INSERT INTO public.empresa VALUES (2086, true, 1, '2023-07-03 14:52:49.309151', NULL, NULL, false, 'FACULDADE PRESBITERIANA GAMMON (FAGAMMON)', 108);
INSERT INTO public.empresa VALUES (2087, true, 1, '2023-07-03 14:52:49.310814', NULL, NULL, false, 'FACULDADE PRESBITERIANA MACKENZIE BRASILIA (FPMB)', 5);
INSERT INTO public.empresa VALUES (2088, true, 1, '2023-07-03 14:52:49.312355', NULL, NULL, false, 'FACULDADE PRESBITERIANA MACKENZIE RIO', 12);
INSERT INTO public.empresa VALUES (2089, true, 1, '2023-07-03 14:52:49.313899', NULL, NULL, false, 'FACULDADE PRESBITERIANA QUINZE DE NOVEMBRO', 483);
INSERT INTO public.empresa VALUES (2090, true, 1, '2023-07-03 14:52:49.315624', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS (FAPAC)', 663);
INSERT INTO public.empresa VALUES (2091, true, 1, '2023-07-03 14:52:49.316969', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE AIMORÉS', 664);
INSERT INTO public.empresa VALUES (2092, true, 1, '2023-07-03 14:52:49.318414', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE BAEPENDI (FAPAC BAEPENDI)', 665);
INSERT INTO public.empresa VALUES (2093, true, 1, '2023-07-03 14:52:49.319889', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE BARÃO DE COCAIS', 666);
INSERT INTO public.empresa VALUES (2094, true, 1, '2023-07-03 14:52:49.321303', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (2095, true, 1, '2023-07-03 14:52:49.32269', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE GOVERNADOR VALADARES (FAPAC - GV )', 265);
INSERT INTO public.empresa VALUES (2096, true, 1, '2023-07-03 14:52:49.324093', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE ITABIRITO', 261);
INSERT INTO public.empresa VALUES (2097, true, 1, '2023-07-03 14:52:49.325526', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE ITANHANDU (FAPACI)', 667);
INSERT INTO public.empresa VALUES (2098, true, 1, '2023-07-03 14:52:49.326919', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE LAMBARI (FAPAC LAMBARI)', 668);
INSERT INTO public.empresa VALUES (2099, true, 1, '2023-07-03 14:52:49.328295', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE LEOPOLDINA', 669);
INSERT INTO public.empresa VALUES (2100, true, 1, '2023-07-03 14:52:49.329644', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE MARIANA (FAPAM)', 238);
INSERT INTO public.empresa VALUES (2101, true, 1, '2023-07-03 14:52:49.331157', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE NOVA LIMA', 481);
INSERT INTO public.empresa VALUES (2102, true, 1, '2023-07-03 14:52:49.332777', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE PONTE NOVA', 550);
INSERT INTO public.empresa VALUES (2103, true, 1, '2023-07-03 14:52:49.334282', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE SABARÁ (FUNEES SABARÁ)', 505);
INSERT INTO public.empresa VALUES (2104, true, 1, '2023-07-03 14:52:49.335714', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE SÃO JOÃO NEPOMUCENO', 670);
INSERT INTO public.empresa VALUES (2105, true, 1, '2023-07-03 14:52:49.337305', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE TEÓFILO OTONI', 7);
INSERT INTO public.empresa VALUES (2106, true, 1, '2023-07-03 14:52:49.338808', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBÁ', 163);
INSERT INTO public.empresa VALUES (2107, true, 1, '2023-07-03 14:52:49.340431', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBERABA', 118);
INSERT INTO public.empresa VALUES (2108, true, 1, '2023-07-03 14:52:49.341903', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBERLÂNDIA', 134);
INSERT INTO public.empresa VALUES (2109, true, 1, '2023-07-03 14:52:49.343639', NULL, NULL, false, 'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE VISCONDE DO RIO BRANCO', 671);
INSERT INTO public.empresa VALUES (2110, true, 1, '2023-07-03 14:52:49.345257', NULL, NULL, false, 'FACULDADE PRESIDENTE DUTRA (FAP)', 672);
INSERT INTO public.empresa VALUES (2111, true, 1, '2023-07-03 14:52:49.346816', NULL, NULL, false, 'FACULDADE PRIME (FAPRIME)', 48);
INSERT INTO public.empresa VALUES (2112, true, 1, '2023-07-03 14:52:49.348529', NULL, NULL, false, 'FACULDADE PRIMEIRO DE JANEIRO (FPJ)', 673);
INSERT INTO public.empresa VALUES (2113, true, 1, '2023-07-03 14:52:49.350115', NULL, NULL, false, 'FACULDADE PRIMUM (PRIMUM)', 8);
INSERT INTO public.empresa VALUES (2114, true, 1, '2023-07-03 14:52:49.351744', NULL, NULL, false, 'FACULDADE PRINCESA DO OESTE (FPO)', 673);
INSERT INTO public.empresa VALUES (2115, true, 1, '2023-07-03 14:52:49.353281', NULL, NULL, false, 'FACULDADE PRISMA DE APUCARANA (FPA)', 377);
INSERT INTO public.empresa VALUES (2116, true, 1, '2023-07-03 14:52:49.354836', NULL, NULL, false, 'FACULDADE PROFESSOR DALTRO', 12);
INSERT INTO public.empresa VALUES (2117, true, 1, '2023-07-03 14:52:49.356415', NULL, NULL, false, 'FACULDADE PROFESSOR MIGUEL ÂNGELO DA SILVA SANTOS (FEMASS)', 325);
INSERT INTO public.empresa VALUES (2118, true, 1, '2023-07-03 14:52:49.35798', NULL, NULL, false, 'FACULDADE PROFISSIONAL (FAPRO)', 56);
INSERT INTO public.empresa VALUES (2119, true, 1, '2023-07-03 14:52:49.359517', NULL, NULL, false, 'FACULDADE PROF. LUÍZ MÁRIO D''AVILA (FADAVILA)', 80);
INSERT INTO public.empresa VALUES (2120, true, 1, '2023-07-03 14:52:49.361077', NULL, NULL, false, 'FACULDADE PROF. WLADEMIR DOS SANTOS (WLASAN)', 146);
INSERT INTO public.empresa VALUES (2121, true, 1, '2023-07-03 14:52:49.36261', NULL, NULL, false, 'FACULDADE PROGRESSO (FAP)', 100);
INSERT INTO public.empresa VALUES (2122, true, 1, '2023-07-03 14:52:49.364153', NULL, NULL, false, 'FACULDADE PROJEÇÃO DE CEILÂNDIA (FAPRO)', 5);
INSERT INTO public.empresa VALUES (2123, true, 1, '2023-07-03 14:52:49.365701', NULL, NULL, false, 'FACULDADE PROJEÇÃO DE SOBRADINHO (FAPRO)', 5);
INSERT INTO public.empresa VALUES (2124, true, 1, '2023-07-03 14:52:49.367338', NULL, NULL, false, 'FACULDADE PROJEÇÃO DE TAGUATINGA NORTE (FAPRO)', 5);
INSERT INTO public.empresa VALUES (2125, true, 1, '2023-07-03 14:52:49.369058', NULL, NULL, false, 'FACULDADE PROJEÇÃO DO GUARÁ', 5);
INSERT INTO public.empresa VALUES (2126, true, 1, '2023-07-03 14:52:49.370834', NULL, NULL, false, 'FACULDADE PROMINAS DE CONTAGEM (PROMINAS)', 200);
INSERT INTO public.empresa VALUES (2127, true, 1, '2023-07-03 14:52:49.372583', NULL, NULL, false, 'FACULDADE PROMINAS DE MONTES CLAROS (PROMINAS)', 128);
INSERT INTO public.empresa VALUES (2128, true, 1, '2023-07-03 14:52:49.374277', NULL, NULL, false, 'FACULDADE PROMINAS DE TIMÓTEO (PROMINAS)', 352);
INSERT INTO public.empresa VALUES (2129, true, 1, '2023-07-03 14:52:49.375981', NULL, NULL, false, 'FACULDADE PROMOVE DE ALFENAS', 674);
INSERT INTO public.empresa VALUES (2130, true, 1, '2023-07-03 14:52:49.377821', NULL, NULL, false, 'FACULDADE PROMOVE DE BELO HORIZONTE (PROMOVE)', 2);
INSERT INTO public.empresa VALUES (2131, true, 1, '2023-07-03 14:52:49.379485', NULL, NULL, false, 'FACULDADE PROMOVE DE CURVELO (FACURVELO)', 301);
INSERT INTO public.empresa VALUES (2132, true, 1, '2023-07-03 14:52:49.381106', NULL, NULL, false, 'FACULDADE PROMOVE DE MINAS GERAIS (PROMOVE)', 2);
INSERT INTO public.empresa VALUES (2133, true, 1, '2023-07-03 14:52:49.382784', NULL, NULL, false, 'FACULDADE PROMOVE DE SÃO PAULO (FPSP)', 8);
INSERT INTO public.empresa VALUES (2134, true, 1, '2023-07-03 14:52:49.384451', NULL, NULL, false, 'FACULDADE PROMOVE DE SETE LAGOAS (FSLMG)', 24);
INSERT INTO public.empresa VALUES (2135, true, 1, '2023-07-03 14:52:49.394961', NULL, NULL, false, 'FACULDADE PROMOVE DE TECNOLOGIA (FPTEC)', 2);
INSERT INTO public.empresa VALUES (2136, true, 1, '2023-07-03 14:52:49.396231', NULL, NULL, false, 'FACULDADE PSICOLOG (FAPSI)', 58);
INSERT INTO public.empresa VALUES (2137, true, 1, '2023-07-03 14:52:49.397549', NULL, NULL, false, 'FACULDADE QI BRASIL (FAQI)', 344);
INSERT INTO public.empresa VALUES (2138, true, 1, '2023-07-03 14:52:49.398861', NULL, NULL, false, 'FACULDADE QUALITTAS (QUALITTAS)', 8);
INSERT INTO public.empresa VALUES (2139, true, 1, '2023-07-03 14:52:49.40003', NULL, NULL, false, 'FACULDADE QUALITTAS - EAD', 8);
INSERT INTO public.empresa VALUES (2140, true, 1, '2023-07-03 14:52:49.401121', NULL, NULL, false, 'FACULDADE QUIRINÓPOLIS (FAQUI)', 621);
INSERT INTO public.empresa VALUES (2141, true, 1, '2023-07-03 14:52:49.402306', NULL, NULL, false, 'FACULDADE RACHEL DE QUEIROZ (FAQ)', 188);
INSERT INTO public.empresa VALUES (2142, true, 1, '2023-07-03 14:52:49.403653', NULL, NULL, false, 'FACULDADE RAIMUNDO MARINHO (FRM)', 73);
INSERT INTO public.empresa VALUES (2143, true, 1, '2023-07-03 14:52:49.404857', NULL, NULL, false, 'FACULDADE RAIMUNDO MARINHO DE PENEDO', 492);
INSERT INTO public.empresa VALUES (2144, true, 1, '2023-07-03 14:52:49.406077', NULL, NULL, false, 'FACULDADE REALIZA', 41);
INSERT INTO public.empresa VALUES (2145, true, 1, '2023-07-03 14:52:49.407295', NULL, NULL, false, 'FACULDADE REBOUÇAS DE CAMPINA GRANDE (FRCG)', 147);
INSERT INTO public.empresa VALUES (2146, true, 1, '2023-07-03 14:52:49.4085', NULL, NULL, false, 'FACULDADE RECONHECER (FR)', 42);
INSERT INTO public.empresa VALUES (2147, true, 1, '2023-07-03 14:52:49.409695', NULL, NULL, false, 'FACULDADE REFIDIM (REFIDIM)', 68);
INSERT INTO public.empresa VALUES (2148, true, 1, '2023-07-03 14:52:49.41091', NULL, NULL, false, 'FACULDADE REGES DE DRACENA', 435);
INSERT INTO public.empresa VALUES (2149, true, 1, '2023-07-03 14:52:49.412156', NULL, NULL, false, 'FACULDADE REGES DE JUNQUEIRÓPOLIS', 675);
INSERT INTO public.empresa VALUES (2150, true, 1, '2023-07-03 14:52:49.413377', NULL, NULL, false, 'FACULDADE REGES DE OSVALDO CRUZ', 676);
INSERT INTO public.empresa VALUES (2151, true, 1, '2023-07-03 14:52:49.414563', NULL, NULL, false, 'FACULDADE REGES DE REALEZA', 677);
INSERT INTO public.empresa VALUES (2152, true, 1, '2023-07-03 14:52:49.415775', NULL, NULL, false, 'FACULDADE REGES DE RIBEIRÃO PRETO', 58);
INSERT INTO public.empresa VALUES (2153, true, 1, '2023-07-03 14:52:49.417009', NULL, NULL, false, 'FACULDADE REGES DE TUPI PAULISTA', 678);
INSERT INTO public.empresa VALUES (2154, true, 1, '2023-07-03 14:52:49.418245', NULL, NULL, false, 'FACULDADE REGIONAL DE FILOSOFIA, CIÊNCIAS E LETRAS DE CANDEIAS (FAC)', 679);
INSERT INTO public.empresa VALUES (2155, true, 1, '2023-07-03 14:52:49.419436', NULL, NULL, false, 'FACULDADE REGIONAL DE LEOPOLDINA', 669);
INSERT INTO public.empresa VALUES (2156, true, 1, '2023-07-03 14:52:49.420602', NULL, NULL, false, 'FACULDADE REGIONAL DE MINAS GERAIS (FACMINAS)', 680);
INSERT INTO public.empresa VALUES (2157, true, 1, '2023-07-03 14:52:49.421808', NULL, NULL, false, 'FACULDADE REGIONAL DE RIACHÃO DO JACUÍPE (FARJ)', 681);
INSERT INTO public.empresa VALUES (2158, true, 1, '2023-07-03 14:52:49.423017', NULL, NULL, false, 'FACULDADE REGIONAL DO AMAZONAS (FAM)', 75);
INSERT INTO public.empresa VALUES (2159, true, 1, '2023-07-03 14:52:49.424593', NULL, NULL, false, 'FACULDADE REGIONAL DO CENTRO SUL DE SERGIPE (FARSUL)', 682);
INSERT INTO public.empresa VALUES (2160, true, 1, '2023-07-03 14:52:49.42613', NULL, NULL, false, 'FACULDADE REGIONAL DO JACUÍPE (FARJ)', 403);
INSERT INTO public.empresa VALUES (2161, true, 1, '2023-07-03 14:52:49.427721', NULL, NULL, false, 'FACULDADE REGIONAL JAGUARIBANA (FRJ)', 683);
INSERT INTO public.empresa VALUES (2162, true, 1, '2023-07-03 14:52:49.429287', NULL, NULL, false, 'FACULDADE REGIONAL PALMITOS (FAP)', 684);
INSERT INTO public.empresa VALUES (2163, true, 1, '2023-07-03 14:52:49.430462', NULL, NULL, false, 'FACULDADE REHAGRO (REHAGRO)', 2);
INSERT INTO public.empresa VALUES (2164, true, 1, '2023-07-03 14:52:49.431602', NULL, NULL, false, 'FACULDADE REPUBLICANA', 5);
INSERT INTO public.empresa VALUES (2165, true, 1, '2023-07-03 14:52:49.432829', NULL, NULL, false, 'FACULDADE RESULTADOS (FR)', 48);
INSERT INTO public.empresa VALUES (2166, true, 1, '2023-07-03 14:52:49.434011', NULL, NULL, false, 'FACULDADE RHEMA (FACUR)', 611);
INSERT INTO public.empresa VALUES (2167, true, 1, '2023-07-03 14:52:49.435179', NULL, NULL, false, 'FACULDADE RIO GUARIBAS (FARG)', 643);
INSERT INTO public.empresa VALUES (2168, true, 1, '2023-07-03 14:52:49.436342', NULL, NULL, false, 'FACULDADE RIO PARNAÍBA (FARP)', 456);
INSERT INTO public.empresa VALUES (2169, true, 1, '2023-07-03 14:52:49.437602', NULL, NULL, false, 'FACULDADE RIO SONO (RISO)', 685);
INSERT INTO public.empresa VALUES (2170, true, 1, '2023-07-03 14:52:49.438898', NULL, NULL, false, 'FACULDADE ROBERTO MIRANDA (FRM SP)', 8);
INSERT INTO public.empresa VALUES (2171, true, 1, '2023-07-03 14:52:49.440094', NULL, NULL, false, 'FACULDADE RODOLFO TEÓFILO (FRT)', 45);
INSERT INTO public.empresa VALUES (2172, true, 1, '2023-07-03 14:52:49.441292', NULL, NULL, false, 'FACULDADE RUDOLF STEINER (FRS)', 8);
INSERT INTO public.empresa VALUES (2173, true, 1, '2023-07-03 14:52:49.442565', NULL, NULL, false, 'FACULDADE SABERES (SABERES)', 25);
INSERT INTO public.empresa VALUES (2174, true, 1, '2023-07-03 14:52:49.443817', NULL, NULL, false, 'FACULDADES AGGEU MAGALHÃES (FAMA)', 398);
INSERT INTO public.empresa VALUES (2175, true, 1, '2023-07-03 14:52:49.445018', NULL, NULL, false, 'FACULDADE SAGRADA FAMÍLIA (FASF)', 188);
INSERT INTO public.empresa VALUES (2176, true, 1, '2023-07-03 14:52:49.446219', NULL, NULL, false, 'FACULDADE SALESIANA DE SANTA TERESA (FSST)', 686);
INSERT INTO public.empresa VALUES (2177, true, 1, '2023-07-03 14:52:49.447457', NULL, NULL, false, 'FACULDADE SALESIANA DOM BOSCO (FSDB)', 75);
INSERT INTO public.empresa VALUES (2178, true, 1, '2023-07-03 14:52:49.448669', NULL, NULL, false, 'FACULDADE SALESIANA DO NORDESTE (FASNE)', 60);
INSERT INTO public.empresa VALUES (2179, true, 1, '2023-07-03 14:52:49.449845', NULL, NULL, false, 'FACULDADE SANAR (SANAR)', 116);
INSERT INTO public.empresa VALUES (2180, true, 1, '2023-07-03 14:52:49.451141', NULL, NULL, false, 'FACULDADE SANTA CASA (FSC)', 116);
INSERT INTO public.empresa VALUES (2181, true, 1, '2023-07-03 14:52:49.452402', NULL, NULL, false, 'FACULDADE SANTA CASA DE BELO HORIZONTE (FSCBH)', 2);
INSERT INTO public.empresa VALUES (2182, true, 1, '2023-07-03 14:52:49.453758', NULL, NULL, false, 'FACULDADE SANTA CRUZ (FACRUZ)', 687);
INSERT INTO public.empresa VALUES (2183, true, 1, '2023-07-03 14:52:49.455253', NULL, NULL, false, 'FACULDADE SANTA FÉ (CESSF)', 141);
INSERT INTO public.empresa VALUES (2184, true, 1, '2023-07-03 14:52:49.456828', NULL, NULL, false, 'FACULDADE SANTA HELENA (FSH)', 60);
INSERT INTO public.empresa VALUES (2185, true, 1, '2023-07-03 14:52:49.458164', NULL, NULL, false, 'FACULDADE SANTA LÚCIA (FCACSL)', 642);
INSERT INTO public.empresa VALUES (2186, true, 1, '2023-07-03 14:52:49.459436', NULL, NULL, false, 'FACULDADE SANTA LUZIA (FSL)', 507);
INSERT INTO public.empresa VALUES (2187, true, 1, '2023-07-03 14:52:49.460678', NULL, NULL, false, 'FACULDADE SANTA MARCELINA (FASM)', 8);
INSERT INTO public.empresa VALUES (2188, true, 1, '2023-07-03 14:52:49.461862', NULL, NULL, false, 'FACULDADE SANTA MARCELINA MURIAÉ - FASM (FASM)', 154);
INSERT INTO public.empresa VALUES (2189, true, 1, '2023-07-03 14:52:49.463057', NULL, NULL, false, 'FACULDADE SANTA MARIA (FASAMP)', 688);
INSERT INTO public.empresa VALUES (2190, true, 1, '2023-07-03 14:52:49.464227', NULL, NULL, false, 'FACULDADE SANTANA', 242);
INSERT INTO public.empresa VALUES (2191, true, 1, '2023-07-03 14:52:49.465353', NULL, NULL, false, 'FACULDADE SANT ANA (IESSA)', 188);
INSERT INTO public.empresa VALUES (2192, true, 1, '2023-07-03 14:52:49.466512', NULL, NULL, false, 'FACULDADE SANTA RITA (FASAR)', 689);
INSERT INTO public.empresa VALUES (2193, true, 1, '2023-07-03 14:52:49.467747', NULL, NULL, false, 'FACULDADE SANTA RITA DE CÁSSIA (IFASC)', 234);
INSERT INTO public.empresa VALUES (2194, true, 1, '2023-07-03 14:52:49.46901', NULL, NULL, false, 'FACULDADE SANTA RITA DE CHAPECÓ', 406);
INSERT INTO public.empresa VALUES (2195, true, 1, '2023-07-03 14:52:49.470252', NULL, NULL, false, 'FACULDADE SANTA TERESA', 75);
INSERT INTO public.empresa VALUES (2196, true, 1, '2023-07-03 14:52:49.471477', NULL, NULL, false, 'FACULDADE SANTA TEREZINHA (CEST)', 141);
INSERT INTO public.empresa VALUES (2197, true, 1, '2023-07-03 14:52:49.472748', NULL, NULL, false, 'FACULDADE SANTISSIMA TRINDADE (FAST)', 690);
INSERT INTO public.empresa VALUES (2198, true, 1, '2023-07-03 14:52:49.474018', NULL, NULL, false, 'FACULDADE SANTÍSSIMO SACRAMENTO (FSSS)', 213);
INSERT INTO public.empresa VALUES (2199, true, 1, '2023-07-03 14:52:49.475216', NULL, NULL, false, 'FACULDADE SANTO AGOSTINHO (FACSA)', 691);
INSERT INTO public.empresa VALUES (2200, true, 1, '2023-07-03 14:52:49.47641', NULL, NULL, false, 'FACULDADE SANTO AGOSTINHO DE ITABUNA (FASAI)', 269);
INSERT INTO public.empresa VALUES (2201, true, 1, '2023-07-03 14:52:49.477664', NULL, NULL, false, 'FACULDADE SANTO AGOSTINHO DE SETE LAGOAS (FASASETE)', 24);
INSERT INTO public.empresa VALUES (2202, true, 1, '2023-07-03 14:52:49.478899', NULL, NULL, false, 'FACULDADE SANTO AGOSTINHO DE VITÓRIA DA CONQUISTA (FASAVIC)', 37);
INSERT INTO public.empresa VALUES (2203, true, 1, '2023-07-03 14:52:49.480111', NULL, NULL, false, 'FACULDADE SANTO ANDRÉ (FASA)', 355);
INSERT INTO public.empresa VALUES (2204, true, 1, '2023-07-03 14:52:49.4813', NULL, NULL, false, 'FACULDADE SANTO ANTONIO (FSA)', 213);
INSERT INTO public.empresa VALUES (2205, true, 1, '2023-07-03 14:52:49.482511', NULL, NULL, false, 'FACULDADE SANTO ANTÔNIO (FSA)', 692);
INSERT INTO public.empresa VALUES (2206, true, 1, '2023-07-03 14:52:49.483791', NULL, NULL, false, 'FACULDADE SANTO ANTÔNIO DE FEIRA DE SANTANA (FSAF)', 99);
INSERT INTO public.empresa VALUES (2207, true, 1, '2023-07-03 14:52:49.485009', NULL, NULL, false, 'FACULDADE SANTO ANTONIO DE ITABUNA (FSAI)', 269);
INSERT INTO public.empresa VALUES (2208, true, 1, '2023-07-03 14:52:49.486241', NULL, NULL, false, 'FACULDADE SANTO ANTÔNIO DE PÁDUA (FASAP)', 447);
INSERT INTO public.empresa VALUES (2209, true, 1, '2023-07-03 14:52:49.487484', NULL, NULL, false, 'FACULDADE SANTO ANTONIO DE QUEIMADAS (FSAQ)', 693);
INSERT INTO public.empresa VALUES (2210, true, 1, '2023-07-03 14:52:49.488683', NULL, NULL, false, 'FACULDADE SANTO ANTÔNIO - SJC (FSA)', 144);
INSERT INTO public.empresa VALUES (2211, true, 1, '2023-07-03 14:52:49.489856', NULL, NULL, false, 'FACULDADE SANTOS DUMONT (FSD)', 694);
INSERT INTO public.empresa VALUES (2212, true, 1, '2023-07-03 14:52:49.491037', NULL, NULL, false, 'FACULDADE SÃO BASÍLIO MAGNO (FASBAM)', 56);
INSERT INTO public.empresa VALUES (2213, true, 1, '2023-07-03 14:52:49.492235', NULL, NULL, false, 'FACULDADE SÃO BENTO DA BAHIA (FSBB)', 116);
INSERT INTO public.empresa VALUES (2214, true, 1, '2023-07-03 14:52:49.493445', NULL, NULL, false, 'FACULDADE SÃO BENTO DO RIO DE JANEIRO (FSB/RJ)', 12);
INSERT INTO public.empresa VALUES (2215, true, 1, '2023-07-03 14:52:49.494725', NULL, NULL, false, 'FACULDADE SÃO CAMILO (FASC)', 12);
INSERT INTO public.empresa VALUES (2216, true, 1, '2023-07-03 14:52:49.495907', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DA PARAÍBA (FASP)', 189);
INSERT INTO public.empresa VALUES (2217, true, 1, '2023-07-03 14:52:49.497168', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DA PARAÍBA CAMPINA GRANDE', 147);
INSERT INTO public.empresa VALUES (2218, true, 1, '2023-07-03 14:52:49.498327', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DE ASSIS (FSFA)', 149);
INSERT INTO public.empresa VALUES (2219, true, 1, '2023-07-03 14:52:49.499474', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DE CAJAZEIRAS (FSF)', 189);
INSERT INTO public.empresa VALUES (2220, true, 1, '2023-07-03 14:52:49.500665', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DO CEARÁ (FASC)', 332);
INSERT INTO public.empresa VALUES (2221, true, 1, '2023-07-03 14:52:49.501877', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO DO CEARÁ - CRATO (FASC)', 310);
INSERT INTO public.empresa VALUES (2222, true, 1, '2023-07-03 14:52:49.50313', NULL, NULL, false, 'FACULDADE SÃO FRANCISCO XAVIER (FACSFX)', 268);
INSERT INTO public.empresa VALUES (2223, true, 1, '2023-07-03 14:52:49.504363', NULL, NULL, false, 'FACULDADE SÃO JOAQUIM DA BARRA', 514);
INSERT INTO public.empresa VALUES (2224, true, 1, '2023-07-03 14:52:49.505681', NULL, NULL, false, 'FACULDADE SÃO JUDAS DE GUARULHOS', 100);
INSERT INTO public.empresa VALUES (2225, true, 1, '2023-07-03 14:52:49.507016', NULL, NULL, false, 'FACULDADE SÃO JUDAS DE SÃO BERNARDO DO CAMPO', 82);
INSERT INTO public.empresa VALUES (2226, true, 1, '2023-07-03 14:52:49.508318', NULL, NULL, false, 'FACULDADE SÃO JUDAS DE TERRA BOA (FSJ)', 695);
INSERT INTO public.empresa VALUES (2227, true, 1, '2023-07-03 14:52:49.509523', NULL, NULL, false, 'FACULDADE SÃO JUDAS TADEU (FSJT)', 12);
INSERT INTO public.empresa VALUES (2228, true, 1, '2023-07-03 14:52:49.510722', NULL, NULL, false, 'FACULDADE SÃO LEOPOLDO MANDIC', 177);
INSERT INTO public.empresa VALUES (2229, true, 1, '2023-07-03 14:52:49.51195', NULL, NULL, false, 'FACULDADE SÃO LEOPOLDO MANDIC DE ARARAS (SLMANDIC-ARARAS)', 83);
INSERT INTO public.empresa VALUES (2230, true, 1, '2023-07-03 14:52:49.513189', NULL, NULL, false, 'FACULDADE SÃO LEOPOLDO MANDIC DE LIMEIRA (SLM LIMEIRA)', 276);
INSERT INTO public.empresa VALUES (2231, true, 1, '2023-07-03 14:52:49.514752', NULL, NULL, false, 'FACULDADE SÃO LUÍS (FSL)', 94);
INSERT INTO public.empresa VALUES (2232, true, 1, '2023-07-03 14:52:49.516389', NULL, NULL, false, 'FACULDADE SÃO LUÍS DE FRANÇA (FSLF)', 142);
INSERT INTO public.empresa VALUES (2233, true, 1, '2023-07-03 14:52:49.517882', NULL, NULL, false, 'FACULDADE SÃO MARCOS (FASAMAR)', 663);
INSERT INTO public.empresa VALUES (2234, true, 1, '2023-07-03 14:52:49.519524', NULL, NULL, false, 'FACULDADE SÃO PAULO DE PRESIDENTE VENCESLAU (FASPREV)', 498);
INSERT INTO public.empresa VALUES (2235, true, 1, '2023-07-03 14:52:49.520637', NULL, NULL, false, 'FACULDADE SÃO SALVADOR (FSS)', 116);
INSERT INTO public.empresa VALUES (2236, true, 1, '2023-07-03 14:52:49.521762', NULL, NULL, false, 'FACULDADE SÃO SEBASTIÃO', 530);
INSERT INTO public.empresa VALUES (2237, true, 1, '2023-07-03 14:52:49.523073', NULL, NULL, false, 'FACULDADE SÃO TOMÁS DE AQUINO (FACESTA)', 334);
INSERT INTO public.empresa VALUES (2238, true, 1, '2023-07-03 14:52:49.524389', NULL, NULL, false, 'FACULDADE SÃO TOMÁS DE AQUINO DE NOVA LIMA (FACTAN)', 481);
INSERT INTO public.empresa VALUES (2239, true, 1, '2023-07-03 14:52:49.525706', NULL, NULL, false, 'FACULDADE SÃO TOMAZ DE AQUINO (FSTA)', 116);
INSERT INTO public.empresa VALUES (2240, true, 1, '2023-07-03 14:52:49.52695', NULL, NULL, false, 'FACULDADE SÃO VICENTE (FASVIPA)', 696);
INSERT INTO public.empresa VALUES (2241, true, 1, '2023-07-03 14:52:49.528117', NULL, NULL, false, 'FACULDADE SÃO VICENTE DE IRATI (FASVI)', 697);
INSERT INTO public.empresa VALUES (2242, true, 1, '2023-07-03 14:52:49.52928', NULL, NULL, false, 'FACULDADE SAPIENS (SAPIENS)', 51);
INSERT INTO public.empresa VALUES (2243, true, 1, '2023-07-03 14:52:49.530514', NULL, NULL, false, 'FACULDADES ASSOCIADAS DE UBERABA - FAZU (FAZU)', 118);
INSERT INTO public.empresa VALUES (2244, true, 1, '2023-07-03 14:52:49.531714', NULL, NULL, false, 'FACULDADES BATISTA DO PARANÁ (FABAPAR)', 56);
INSERT INTO public.empresa VALUES (2245, true, 1, '2023-07-03 14:52:49.532876', NULL, NULL, false, 'FACULDADES DE CAMPINAS (FACAMP)', 177);
INSERT INTO public.empresa VALUES (2246, true, 1, '2023-07-03 14:52:49.534116', NULL, NULL, false, 'FACULDADES DE CIÊNCIAS E TECNOLOGIA DO NORDESTE LTDA (FACINE)', 45);
INSERT INTO public.empresa VALUES (2247, true, 1, '2023-07-03 14:52:49.535222', NULL, NULL, false, 'FACULDADES DE DRACENA', 435);
INSERT INTO public.empresa VALUES (2248, true, 1, '2023-07-03 14:52:49.536393', NULL, NULL, false, 'FACULDADES DE INOVAÇÃO E TECNOLOGIA DE MINAS GERAIS (FIT MG)', 307);
INSERT INTO public.empresa VALUES (2249, true, 1, '2023-07-03 14:52:49.537497', NULL, NULL, false, 'FACULDADES DOCTUM DE CARATINGA (DOCTUM )', 95);
INSERT INTO public.empresa VALUES (2250, true, 1, '2023-07-03 14:52:49.538705', NULL, NULL, false, 'FACULDADES DOCTUM DE GUARAPARI (DOCTUM)', 266);
INSERT INTO public.empresa VALUES (2251, true, 1, '2023-07-03 14:52:49.539834', NULL, NULL, false, 'FACULDADES DOCTUM DE IPATINGA', 268);
INSERT INTO public.empresa VALUES (2252, true, 1, '2023-07-03 14:52:49.541214', NULL, NULL, false, 'FACULDADES DO VALE DO ARARANGUA - FVA (FVA)', 698);
INSERT INTO public.empresa VALUES (2253, true, 1, '2023-07-03 14:52:49.542398', NULL, NULL, false, 'FACULDADE SEB DE RIBEIRÃO PRETO (SEBRP)', 58);
INSERT INTO public.empresa VALUES (2254, true, 1, '2023-07-03 14:52:49.543581', NULL, NULL, false, 'FACULDADE SEB LAFAIETE (SEBLF)', 58);
INSERT INTO public.empresa VALUES (2255, true, 1, '2023-07-03 14:52:49.544742', NULL, NULL, false, 'FACULDADE SEBRAE', 8);
INSERT INTO public.empresa VALUES (2256, true, 1, '2023-07-03 14:52:49.545896', NULL, NULL, false, 'FACULDADE SENAC BLUMENAU (SENAC)', 193);
INSERT INTO public.empresa VALUES (2257, true, 1, '2023-07-03 14:52:49.547039', NULL, NULL, false, 'FACULDADE SENAC CAÇADOR (SENAC)', 699);
INSERT INTO public.empresa VALUES (2258, true, 1, '2023-07-03 14:52:49.548216', NULL, NULL, false, 'FACULDADE SENAC CEARA (SENACCE)', 45);
INSERT INTO public.empresa VALUES (2259, true, 1, '2023-07-03 14:52:49.549355', NULL, NULL, false, 'FACULDADE SENAC CHAPECÓ (SENAC)', 406);
INSERT INTO public.empresa VALUES (2260, true, 1, '2023-07-03 14:52:49.55052', NULL, NULL, false, 'FACULDADE SENAC CONCÓRDIA', 350);
INSERT INTO public.empresa VALUES (2261, true, 1, '2023-07-03 14:52:49.551647', NULL, NULL, false, 'FACULDADE SENAC CRICIÚMA (SENAC CRICIÚMA)', 192);
INSERT INTO public.empresa VALUES (2262, true, 1, '2023-07-03 14:52:49.552846', NULL, NULL, false, 'FACULDADE SENAC FLORIANÓPOLIS (SENAC FLORIANÓPOLIS)', 3);
INSERT INTO public.empresa VALUES (2263, true, 1, '2023-07-03 14:52:49.554012', NULL, NULL, false, 'FACULDADE SENAC GOIÁS (FACSENACGO)', 42);
INSERT INTO public.empresa VALUES (2264, true, 1, '2023-07-03 14:52:49.55522', NULL, NULL, false, 'FACULDADE SENAC JARAGUÁ DO SUL', 31);
INSERT INTO public.empresa VALUES (2265, true, 1, '2023-07-03 14:52:49.556513', NULL, NULL, false, 'FACULDADE SENAC MINAS (FSM)', 200);
INSERT INTO public.empresa VALUES (2266, true, 1, '2023-07-03 14:52:49.557771', NULL, NULL, false, 'FACULDADE SENAC PALHOÇA (SENAC PALHOÇA)', 544);
INSERT INTO public.empresa VALUES (2267, true, 1, '2023-07-03 14:52:49.558907', NULL, NULL, false, 'FACULDADE SENAC PERNAMBUCO (SENACPE)', 60);
INSERT INTO public.empresa VALUES (2268, true, 1, '2023-07-03 14:52:49.560042', NULL, NULL, false, 'FACULDADE SENAC SÃO MIGUEL DO OESTE', 700);
INSERT INTO public.empresa VALUES (2269, true, 1, '2023-07-03 14:52:49.561206', NULL, NULL, false, 'FACULDADE SENAC TUBARÃO', 701);
INSERT INTO public.empresa VALUES (2270, true, 1, '2023-07-03 14:52:49.56241', NULL, NULL, false, 'FACULDADE SENAI-CETIQT (SENAI-CETIQT)', 12);
INSERT INTO public.empresa VALUES (2271, true, 1, '2023-07-03 14:52:49.563511', NULL, NULL, false, 'FACULDADE SENAI DA PARAÍBA', 107);
INSERT INTO public.empresa VALUES (2272, true, 1, '2023-07-03 14:52:49.564653', NULL, NULL, false, 'FACULDADE SENAI DE CONSTRUÇÃO', 48);
INSERT INTO public.empresa VALUES (2273, true, 1, '2023-07-03 14:52:49.565799', NULL, NULL, false, 'FACULDADE SENAI DE TECNOLOGIA MECATRÔNICA (SENAI)', 126);
INSERT INTO public.empresa VALUES (2274, true, 1, '2023-07-03 14:52:49.566994', NULL, NULL, false, 'FACULDADE SENAI RIO', 12);
INSERT INTO public.empresa VALUES (2275, true, 1, '2023-07-03 14:52:49.568145', NULL, NULL, false, 'FACULDADE SENAI SÃO PAULO (SENAI SP)', 8);
INSERT INTO public.empresa VALUES (2276, true, 1, '2023-07-03 14:52:49.569288', NULL, NULL, false, 'FACULDADE SENSU (FAS)', 42);
INSERT INTO public.empresa VALUES (2277, true, 1, '2023-07-03 14:52:49.570491', NULL, NULL, false, 'FACULDADE SEQÜENCIAL', 8);
INSERT INTO public.empresa VALUES (2278, true, 1, '2023-07-03 14:52:49.571775', NULL, NULL, false, 'FACULDADE SERGIPANA (FASER)', 142);
INSERT INTO public.empresa VALUES (2279, true, 1, '2023-07-03 14:52:49.573156', NULL, NULL, false, 'FACULDADE SERRA DA MESA (FASEM)', 702);
INSERT INTO public.empresa VALUES (2280, true, 1, '2023-07-03 14:52:49.574356', NULL, NULL, false, 'FACULDADE SERRA DO CARMO (FASEC)', 23);
INSERT INTO public.empresa VALUES (2281, true, 1, '2023-07-03 14:52:49.575546', NULL, NULL, false, 'FACULDADE SERRA DOURADA', 14);
INSERT INTO public.empresa VALUES (2282, true, 1, '2023-07-03 14:52:49.576784', NULL, NULL, false, 'FACULDADE SERRA GERAL (FASG)', 407);
INSERT INTO public.empresa VALUES (2283, true, 1, '2023-07-03 14:52:49.578002', NULL, NULL, false, 'FACULDADE SESI-SP DE EDUCAÇÃO (FASESP)', 8);
INSERT INTO public.empresa VALUES (2284, true, 1, '2023-07-03 14:52:49.579189', NULL, NULL, false, 'FACULDADES EST (EST)', 703);
INSERT INTO public.empresa VALUES (2285, true, 1, '2023-07-03 14:52:49.580351', NULL, NULL, false, 'FACULDADE SETE LAGOAS (FACSETE)', 24);
INSERT INTO public.empresa VALUES (2286, true, 1, '2023-07-03 14:52:49.581594', NULL, NULL, false, 'FACULDADES EVANGÉLICAS INTEGRADAS CANTARES DE SALOMÃO (FEICS)', 203);
INSERT INTO public.empresa VALUES (2287, true, 1, '2023-07-03 14:52:49.582825', NULL, NULL, false, 'FACULDADES FAMEP (FAMEP)', 704);
INSERT INTO public.empresa VALUES (2288, true, 1, '2023-07-03 14:52:49.583958', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE EUCLIDES DA CUNHA - BA (FAMEP)', 705);
INSERT INTO public.empresa VALUES (2289, true, 1, '2023-07-03 14:52:49.58511', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE FORTALEZA CE (FAMEP)', 45);
INSERT INTO public.empresa VALUES (2290, true, 1, '2023-07-03 14:52:49.586349', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE IRARÁ - BA (FAMEP)', 706);
INSERT INTO public.empresa VALUES (2291, true, 1, '2023-07-03 14:52:49.587486', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE LAGO DA PEDRA - MA (FAMEP)', 707);
INSERT INTO public.empresa VALUES (2292, true, 1, '2023-07-03 14:52:49.588691', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE PARNAÍBA - PI (FAMEP)', 176);
INSERT INTO public.empresa VALUES (2293, true, 1, '2023-07-03 14:52:49.589864', NULL, NULL, false, 'FACULDADES FAMEP UNIDADE TERESINA - P (FAMEP)', 27);
INSERT INTO public.empresa VALUES (2294, true, 1, '2023-07-03 14:52:49.591121', NULL, NULL, false, 'FACULDADES FAMEP - UNIDADE URUÇUI - PI (FAMEP)', 708);
INSERT INTO public.empresa VALUES (2295, true, 1, '2023-07-03 14:52:49.592276', NULL, NULL, false, 'FACULDADES FATIFAJAR - FATIFAJAR ARAPOTI', 709);
INSERT INTO public.empresa VALUES (2296, true, 1, '2023-07-03 14:52:49.593473', NULL, NULL, false, 'FACULDADES IDAAM (IDAAM)', 75);
INSERT INTO public.empresa VALUES (2297, true, 1, '2023-07-03 14:52:49.594672', NULL, NULL, false, 'FACULDADE SIGMA (SIGMA EAD)', 710);
INSERT INTO public.empresa VALUES (2298, true, 1, '2023-07-03 14:52:49.595872', NULL, NULL, false, 'FACULDADE SILVA NETO (FASINE)', 5);
INSERT INTO public.empresa VALUES (2299, true, 1, '2023-07-03 14:52:49.597015', NULL, NULL, false, 'FACULDADES IMPACTOS BRASIL (FACIB)', 203);
INSERT INTO public.empresa VALUES (2300, true, 1, '2023-07-03 14:52:49.598165', NULL, NULL, false, 'FACULDADE SINERGIA (SINERGIA)', 711);
INSERT INTO public.empresa VALUES (2301, true, 1, '2023-07-03 14:52:49.599282', NULL, NULL, false, 'FACULDADE SINOP (FASIP)', 155);
INSERT INTO public.empresa VALUES (2302, true, 1, '2023-07-03 14:52:49.600936', NULL, NULL, false, 'FACULDADE SINPAIN (SINPAIN)', 8);
INSERT INTO public.empresa VALUES (2303, true, 1, '2023-07-03 14:52:49.602465', NULL, NULL, false, 'FACULDADES INTEGRADAS ADVENTISTAS DE MINAS GERAIS (FADMINAS)', 108);
INSERT INTO public.empresa VALUES (2304, true, 1, '2023-07-03 14:52:49.60394', NULL, NULL, false, 'FACULDADES INTEGRADAS APARÍCIO CARVALHO VILHENA (FIMCAVILHENA)', 355);
INSERT INTO public.empresa VALUES (2305, true, 1, '2023-07-03 14:52:49.605492', NULL, NULL, false, 'FACULDADES INTEGRADAS ASMEC (ASMEC)', 712);
INSERT INTO public.empresa VALUES (2306, true, 1, '2023-07-03 14:52:49.60703', NULL, NULL, false, 'FACULDADES INTEGRADAS CAMÕES (FICA)', 56);
INSERT INTO public.empresa VALUES (2307, true, 1, '2023-07-03 14:52:49.608103', NULL, NULL, false, 'FACULDADES INTEGRADAS CAMPO-GRANDENSES (FIC)', 12);
INSERT INTO public.empresa VALUES (2308, true, 1, '2023-07-03 14:52:49.609207', NULL, NULL, false, 'FACULDADES INTEGRADAS CAMPOS SALLES (FICS)', 8);
INSERT INTO public.empresa VALUES (2309, true, 1, '2023-07-03 14:52:49.610435', NULL, NULL, false, 'FACULDADES INTEGRADAS CESUMAR DE ARAPONGAS (CESUMAR)', 611);
INSERT INTO public.empresa VALUES (2310, true, 1, '2023-07-03 14:52:49.611668', NULL, NULL, false, 'FACULDADES INTEGRADAS DA AMÉRICA DO SUL (FAC INTEGRA)', 387);
INSERT INTO public.empresa VALUES (2311, true, 1, '2023-07-03 14:52:49.612747', NULL, NULL, false, 'FACULDADES INTEGRADAS DA UPIS (UPIS)', 5);
INSERT INTO public.empresa VALUES (2312, true, 1, '2023-07-03 14:52:49.613851', NULL, NULL, false, 'FACULDADES INTEGRADAS DE ARACRUZ (FAACZ)', 321);
INSERT INTO public.empresa VALUES (2313, true, 1, '2023-07-03 14:52:49.615006', NULL, NULL, false, 'FACULDADES INTEGRADAS DE ARARAQUARA (FIAR)', 378);
INSERT INTO public.empresa VALUES (2314, true, 1, '2023-07-03 14:52:49.616184', NULL, NULL, false, 'FACULDADES INTEGRADAS DE BAURU (FIB)', 93);
INSERT INTO public.empresa VALUES (2315, true, 1, '2023-07-03 14:52:49.617339', NULL, NULL, false, 'FACULDADES INTEGRADAS DE BOTUCATU', 383);
INSERT INTO public.empresa VALUES (2316, true, 1, '2023-07-03 14:52:49.618486', NULL, NULL, false, 'FACULDADES INTEGRADAS DE CASSILÂNDIA (FIC)', 713);
INSERT INTO public.empresa VALUES (2317, true, 1, '2023-07-03 14:52:49.619672', NULL, NULL, false, 'FACULDADES INTEGRADAS DE CATAGUASES (FIC)', 366);
INSERT INTO public.empresa VALUES (2318, true, 1, '2023-07-03 14:52:49.620876', NULL, NULL, false, 'FACULDADES INTEGRADAS DE CIÊNCIAS HUMANAS, SAÚDE E EDUCAÇÃO DE GUARULHOS (FG)', 100);
INSERT INTO public.empresa VALUES (2319, true, 1, '2023-07-03 14:52:49.622013', NULL, NULL, false, 'FACULDADES INTEGRADAS DE DIAMANTINO (FID)', 714);
INSERT INTO public.empresa VALUES (2320, true, 1, '2023-07-03 14:52:49.623149', NULL, NULL, false, 'FACULDADES INTEGRADAS DE FERNANDÓPOLIS (FIFE)', 309);
INSERT INTO public.empresa VALUES (2321, true, 1, '2023-07-03 14:52:49.624328', NULL, NULL, false, 'FACULDADES INTEGRADAS DE GARANHUNS (FACIGA)', 483);
INSERT INTO public.empresa VALUES (2322, true, 1, '2023-07-03 14:52:49.625492', NULL, NULL, false, 'FACULDADES INTEGRADAS DE ITAPETININGA (FII)', 271);
INSERT INTO public.empresa VALUES (2323, true, 1, '2023-07-03 14:52:49.626646', NULL, NULL, false, 'FACULDADES INTEGRADAS DE JACAREPAGUÁ (FIJ)', 12);
INSERT INTO public.empresa VALUES (2324, true, 1, '2023-07-03 14:52:49.627786', NULL, NULL, false, 'FACULDADES INTEGRADAS DE JAHU (FIJ)', 274);
INSERT INTO public.empresa VALUES (2325, true, 1, '2023-07-03 14:52:49.628978', NULL, NULL, false, 'FACULDADES INTEGRADAS DE NAVIRAÍ (FINAV)', 715);
INSERT INTO public.empresa VALUES (2326, true, 1, '2023-07-03 14:52:49.630168', NULL, NULL, false, 'FACULDADES INTEGRADAS DE PARANAÍBA - FIPAR (FIPAR)', 716);
INSERT INTO public.empresa VALUES (2327, true, 1, '2023-07-03 14:52:49.631306', NULL, NULL, false, 'FACULDADES INTEGRADAS DE PATOS (FIP)', 147);
INSERT INTO public.empresa VALUES (2328, true, 1, '2023-07-03 14:52:49.632434', NULL, NULL, false, 'FACULDADES INTEGRADAS DE RONDONÓPOLIS (FAIR)', 287);
INSERT INTO public.empresa VALUES (2329, true, 1, '2023-07-03 14:52:49.633643', NULL, NULL, false, 'FACULDADES INTEGRADAS DE SAÚDE E EDUCAÇÃO DO BRASIL (FISEB)', 203);
INSERT INTO public.empresa VALUES (2330, true, 1, '2023-07-03 14:52:49.634881', NULL, NULL, false, 'FACULDADES INTEGRADAS DE TAGUAÍ (FIT)', 717);
INSERT INTO public.empresa VALUES (2331, true, 1, '2023-07-03 14:52:49.636072', NULL, NULL, false, 'FACULDADES INTEGRADAS DE TAQUARA (FACCAT)', 718);
INSERT INTO public.empresa VALUES (2332, true, 1, '2023-07-03 14:52:49.637253', NULL, NULL, false, 'FACULDADES INTEGRADAS DE TRÊS LAGOAS (AEMS)', 658);
INSERT INTO public.empresa VALUES (2333, true, 1, '2023-07-03 14:52:49.638486', NULL, NULL, false, 'FACULDADES INTEGRADAS DO BRASIL UNIFUTURO (FACULDADE UNIFUTURO)', 107);
INSERT INTO public.empresa VALUES (2334, true, 1, '2023-07-03 14:52:49.639798', NULL, NULL, false, 'FACULDADES INTEGRADAS DO EXTREMO SUL DA BAHIA (UNESULBAHIA)', 587);
INSERT INTO public.empresa VALUES (2335, true, 1, '2023-07-03 14:52:49.64099', NULL, NULL, false, 'FACULDADES INTEGRADAS DOM PEDRO II (DOMPEDRO)', 114);
INSERT INTO public.empresa VALUES (2336, true, 1, '2023-07-03 14:52:49.642183', NULL, NULL, false, 'FACULDADES INTEGRADAS DOS CAMPOS GERAIS (CESCAGE)', 188);
INSERT INTO public.empresa VALUES (2337, true, 1, '2023-07-03 14:52:49.643344', NULL, NULL, false, 'FACULDADES INTEGRADAS DO SUL DE MINAS - FISMINAS', 2);
INSERT INTO public.empresa VALUES (2338, true, 1, '2023-07-03 14:52:49.644543', NULL, NULL, false, 'FACULDADES INTEGRADAS DO VALE DO IVAÍ', 532);
INSERT INTO public.empresa VALUES (2339, true, 1, '2023-07-03 14:52:49.645689', NULL, NULL, false, 'FACULDADES INTEGRADAS EINSTEIN DE LIMEIRA (FIEL)', 276);
INSERT INTO public.empresa VALUES (2340, true, 1, '2023-07-03 14:52:49.646897', NULL, NULL, false, 'FACULDADES INTEGRADAS ESPÍRITA (FIES)', 56);
INSERT INTO public.empresa VALUES (2341, true, 1, '2023-07-03 14:52:49.648077', NULL, NULL, false, 'FACULDADES INTEGRADAS HÉLIO ALONSO (FACHA)', 12);
INSERT INTO public.empresa VALUES (2342, true, 1, '2023-07-03 14:52:49.649214', NULL, NULL, false, 'FACULDADES INTEGRADAS IESGO (IESGO)', 539);
INSERT INTO public.empresa VALUES (2343, true, 1, '2023-07-03 14:52:49.650294', NULL, NULL, false, 'FACULDADES INTEGRADAS IPEP (FIPEP)', 8);
INSERT INTO public.empresa VALUES (2344, true, 1, '2023-07-03 14:52:49.651432', NULL, NULL, false, 'FACULDADES INTEGRADAS IPITANGA (FACIIP)', 209);
INSERT INTO public.empresa VALUES (2345, true, 1, '2023-07-03 14:52:49.652595', NULL, NULL, false, 'FACULDADES INTEGRADAS MACHADO DE ASSIS (FEMA)', 719);
INSERT INTO public.empresa VALUES (2346, true, 1, '2023-07-03 14:52:49.653735', NULL, NULL, false, 'FACULDADES INTEGRADAS MARIA IMACULADA (FIMI)', 279);
INSERT INTO public.empresa VALUES (2347, true, 1, '2023-07-03 14:52:49.654858', NULL, NULL, false, 'FACULDADES INTEGRADAS OSWALDO CRUZ', 23);
INSERT INTO public.empresa VALUES (2348, true, 1, '2023-07-03 14:52:49.655958', NULL, NULL, false, 'FACULDADES INTEGRADAS PADRÃO (FIP GUANAMBI)', 157);
INSERT INTO public.empresa VALUES (2349, true, 1, '2023-07-03 14:52:49.657091', NULL, NULL, false, 'FACULDADES INTEGRADAS PAULISTA (FIP)', 8);
INSERT INTO public.empresa VALUES (2350, true, 1, '2023-07-03 14:52:49.658233', NULL, NULL, false, 'FACULDADES INTEGRADAS POTENCIAL (FIP)', 520);
INSERT INTO public.empresa VALUES (2351, true, 1, '2023-07-03 14:52:49.659382', NULL, NULL, false, 'FACULDADES INTEGRADAS QUALIS (FIQ)', 225);
INSERT INTO public.empresa VALUES (2352, true, 1, '2023-07-03 14:52:49.660465', NULL, NULL, false, 'FACULDADES INTEGRADAS REGIONAIS DE AVARÉ (FIRA)', 195);
INSERT INTO public.empresa VALUES (2353, true, 1, '2023-07-03 14:52:49.661597', NULL, NULL, false, 'FACULDADES INTEGRADAS RIO BRANCO (FRB)', 8);
INSERT INTO public.empresa VALUES (2354, true, 1, '2023-07-03 14:52:49.662778', NULL, NULL, false, 'FACULDADES INTEGRADAS RIO BRANCO GRANJA VIANNA (FRB-GV)', 520);
INSERT INTO public.empresa VALUES (2355, true, 1, '2023-07-03 14:52:49.66385', NULL, NULL, false, 'FACULDADES INTEGRADAS RUI BARBOSA (FIRB)', 392);
INSERT INTO public.empresa VALUES (2356, true, 1, '2023-07-03 14:52:49.664982', NULL, NULL, false, 'FACULDADES INTEGRADAS SÃO JUDAS TADEU (SJT)', 149);
INSERT INTO public.empresa VALUES (2357, true, 1, '2023-07-03 14:52:49.666124', NULL, NULL, false, 'FACULDADES INTEGRADAS SILVA E SOUZA (FAU)', 12);
INSERT INTO public.empresa VALUES (2358, true, 1, '2023-07-03 14:52:49.667228', NULL, NULL, false, 'FACULDADES INTEGRADAS SIMONSEN (FIS)', 12);
INSERT INTO public.empresa VALUES (2359, true, 1, '2023-07-03 14:52:49.668325', NULL, NULL, false, 'FACULDADES INTEGRADAS SOARES DE OLIVEIRA (FISO)', 80);
INSERT INTO public.empresa VALUES (2360, true, 1, '2023-07-03 14:52:49.669432', NULL, NULL, false, 'FACULDADES INTEGRADAS STELLA MARIS DE ANDRADINA (FISMA)', 392);
INSERT INTO public.empresa VALUES (2361, true, 1, '2023-07-03 14:52:49.670612', NULL, NULL, false, 'FACULDADES INTEGRADAS URUBUPUNGÁ (FIU)', 720);
INSERT INTO public.empresa VALUES (2362, true, 1, '2023-07-03 14:52:49.671786', NULL, NULL, false, 'FACULDADES INTEGRADAS VALE DO RIO VERDE (FIVAR)', 721);
INSERT INTO public.empresa VALUES (2363, true, 1, '2023-07-03 14:52:49.672848', NULL, NULL, false, 'FACULDADES INTEGRADAS VIANNA JÚNIOR (FIVJ)', 38);
INSERT INTO public.empresa VALUES (2364, true, 1, '2023-07-03 14:52:49.674026', NULL, NULL, false, 'FACULDADES INTEGRADAS VITAL BRAZIL (FVB)', 12);
INSERT INTO public.empresa VALUES (2365, true, 1, '2023-07-03 14:52:49.675255', NULL, NULL, false, 'FACULDADES INTEGRADAS ZONA DA MATA (FIZM)', 38);
INSERT INTO public.empresa VALUES (2366, true, 1, '2023-07-03 14:52:49.676477', NULL, NULL, false, 'FACULDADES IPEDE (IPEDE)', 399);
INSERT INTO public.empresa VALUES (2367, true, 1, '2023-07-03 14:52:49.677633', NULL, NULL, false, 'FACULDADES ITECNE DE CASCAVEL (ITECNE)', 54);
INSERT INTO public.empresa VALUES (2368, true, 1, '2023-07-03 14:52:49.67878', NULL, NULL, false, 'FACULDADES JOÃO PAULO II (FJP)', 282);
INSERT INTO public.empresa VALUES (2369, true, 1, '2023-07-03 14:52:49.679974', NULL, NULL, false, 'FACULDADES JOÃO PAULO II - CAMPUS PORTO ALEGRE (FJP)', 149);
INSERT INTO public.empresa VALUES (2370, true, 1, '2023-07-03 14:52:49.681162', NULL, NULL, false, 'FACULDADES JOÃO PAULO II - PELOTAS (FJP -PELOTAS)', 283);
INSERT INTO public.empresa VALUES (2371, true, 1, '2023-07-03 14:52:49.682322', NULL, NULL, false, 'FACULDADES JOÃO PAULO II - RIO GRANDE (FJP)', 298);
INSERT INTO public.empresa VALUES (2372, true, 1, '2023-07-03 14:52:49.683443', NULL, NULL, false, 'FACULDADE SKEMA BUSINESS SCHOOL (SKEMA)', 2);
INSERT INTO public.empresa VALUES (2373, true, 1, '2023-07-03 14:52:49.684611', NULL, NULL, false, 'FACULDADES LONDRINA', 159);
INSERT INTO public.empresa VALUES (2374, true, 1, '2023-07-03 14:52:49.685821', NULL, NULL, false, 'FACULDADES MAGSUL (FAMAG)', 495);
INSERT INTO public.empresa VALUES (2375, true, 1, '2023-07-03 14:52:49.687326', NULL, NULL, false, 'FACULDADES METROPOLITANAS DE CUIABÁ (FAMEC)', 203);
INSERT INTO public.empresa VALUES (2376, true, 1, '2023-07-03 14:52:49.688831', NULL, NULL, false, 'FACULDADE SNA DIGITAL (SNA DIGITAL)', 12);
INSERT INTO public.empresa VALUES (2377, true, 1, '2023-07-03 14:52:49.690406', NULL, NULL, false, 'FACULDADES NETWORK - CAMPUS SUMARÉ', 293);
INSERT INTO public.empresa VALUES (2378, true, 1, '2023-07-03 14:52:49.691957', NULL, NULL, false, 'FACULDADE SOBERANA DE ARAPIRACA (SOBERANA)', 333);
INSERT INTO public.empresa VALUES (2379, true, 1, '2023-07-03 14:52:49.693098', NULL, NULL, false, 'FACULDADE SOBERANA DE CACHOEIRO DO ITAPEMIRIM (SOBERANA)', 190);
INSERT INTO public.empresa VALUES (2380, true, 1, '2023-07-03 14:52:49.694251', NULL, NULL, false, 'FACULDADE SOBERANA DE JACOBINA (SOBERANA)', 244);
INSERT INTO public.empresa VALUES (2381, true, 1, '2023-07-03 14:52:49.695355', NULL, NULL, false, 'FACULDADE SOCIESC DE EDUCAÇÃO DE JARAGUÁ DO SUL', 31);
INSERT INTO public.empresa VALUES (2382, true, 1, '2023-07-03 14:52:49.69654', NULL, NULL, false, 'FACULDADE SOCIESC DE EDUCAÇÃO DE SÃO BENTO DO SUL', 546);
INSERT INTO public.empresa VALUES (2383, true, 1, '2023-07-03 14:52:49.697636', NULL, NULL, false, 'FACULDADE SOCIESC DE JARAGUÁ DO SUL (SOCIESC)', 31);
INSERT INTO public.empresa VALUES (2384, true, 1, '2023-07-03 14:52:49.698711', NULL, NULL, false, 'FACULDADE SOGIPA DE EDUCAÇÃO FÍSICA', 149);
INSERT INTO public.empresa VALUES (2385, true, 1, '2023-07-03 14:52:49.699815', NULL, NULL, false, 'FACULDADE SOLIDÁRIA DE SOBRADINHO (FASOL)', 5);
INSERT INTO public.empresa VALUES (2386, true, 1, '2023-07-03 14:52:49.700952', NULL, NULL, false, 'FACULDADE SOLIDARIA DO OESTE PAULISTA (FASOL)', 50);
INSERT INTO public.empresa VALUES (2387, true, 1, '2023-07-03 14:52:49.702139', NULL, NULL, false, 'FACULDADES OSWALDO CRUZ (FOC)', 8);
INSERT INTO public.empresa VALUES (2388, true, 1, '2023-07-03 14:52:49.703297', NULL, NULL, false, 'FACULDADES PEQUENO PRÍNCIPE (FPP)', 56);
INSERT INTO public.empresa VALUES (2389, true, 1, '2023-07-03 14:52:49.704378', NULL, NULL, false, 'FACULDADES PLANALTO CENTRAL (FPC)', 5);
INSERT INTO public.empresa VALUES (2390, true, 1, '2023-07-03 14:52:49.705521', NULL, NULL, false, 'FACULDADES REUNIDAS DA ASCE (FRASCE)', 12);
INSERT INTO public.empresa VALUES (2391, true, 1, '2023-07-03 14:52:49.706624', NULL, NULL, false, 'FACULDADES SULAMÉRICA BAHIA', 52);
INSERT INTO public.empresa VALUES (2392, true, 1, '2023-07-03 14:52:49.707728', NULL, NULL, false, 'FACULDADE STBNB', 60);
INSERT INTO public.empresa VALUES (2393, true, 1, '2023-07-03 14:52:49.708878', NULL, NULL, false, 'FACULDADE STELLA MARIS - FSM (FSM)', 45);
INSERT INTO public.empresa VALUES (2394, true, 1, '2023-07-03 14:52:49.710068', NULL, NULL, false, 'FACULDADE SUCESSO (FAS)', 722);
INSERT INTO public.empresa VALUES (2395, true, 1, '2023-07-03 14:52:49.711131', NULL, NULL, false, 'FACULDADE SUCESSO (FACSU)', 723);
INSERT INTO public.empresa VALUES (2396, true, 1, '2023-07-03 14:52:49.71224', NULL, NULL, false, 'FACULDADE SUDAMÉRICA (SUDAMÉRICA)', 366);
INSERT INTO public.empresa VALUES (2397, true, 1, '2023-07-03 14:52:49.713446', NULL, NULL, false, 'FACULDADE SUDOESTE (FASU)', 37);
INSERT INTO public.empresa VALUES (2398, true, 1, '2023-07-03 14:52:49.714632', NULL, NULL, false, 'FACULDADE SULAMÉRICA BRASÍLIA', 5);
INSERT INTO public.empresa VALUES (2399, true, 1, '2023-07-03 14:52:49.715825', NULL, NULL, false, 'FACULDADE SUL DA AMÉRICA (SULDAMÉRICA)', 41);
INSERT INTO public.empresa VALUES (2400, true, 1, '2023-07-03 14:52:49.71689', NULL, NULL, false, 'FACULDADE SUL FLUMINENSE (FASF)', 123);
INSERT INTO public.empresa VALUES (2401, true, 1, '2023-07-03 14:52:49.718006', NULL, NULL, false, 'FACULDADE SUL PAULISTA DE ITANHAÉM (FASUPI)', 618);
INSERT INTO public.empresa VALUES (2402, true, 1, '2023-07-03 14:52:49.719143', NULL, NULL, false, 'FACULDADES UNIDAS DE PESQUISA, CIÊNCIAS E SAÚDE LTDA (FAPEC)', 275);
INSERT INTO public.empresa VALUES (2403, true, 1, '2023-07-03 14:52:49.720232', NULL, NULL, false, 'FACULDADES UNIFICADAS DE CATAGUASES (FUC)', 366);
INSERT INTO public.empresa VALUES (2404, true, 1, '2023-07-03 14:52:49.721329', NULL, NULL, false, 'FACULDADES UNIFICADAS DE FOZ DO IGUAÇU (UNIFOZ)', 124);
INSERT INTO public.empresa VALUES (2405, true, 1, '2023-07-03 14:52:49.722474', NULL, NULL, false, 'FACULDADES UNIFICADAS DE IÚNA (FUI)', 724);
INSERT INTO public.empresa VALUES (2406, true, 1, '2023-07-03 14:52:49.72374', NULL, NULL, false, 'FACULDADES UNIFICADAS DE LEOPOLDINA (FUL)', 669);
INSERT INTO public.empresa VALUES (2407, true, 1, '2023-07-03 14:52:49.724835', NULL, NULL, false, 'FACULDADE SUPREMO (SUPREMO)', 2);
INSERT INTO public.empresa VALUES (2408, true, 1, '2023-07-03 14:52:49.725949', NULL, NULL, false, 'FACULDADE SUPREMO REDENTOR (FACSUR)', 688);
INSERT INTO public.empresa VALUES (2409, true, 1, '2023-07-03 14:52:49.727102', NULL, NULL, false, 'FACULDADES VALE DO PIANCÓ (FAVAP)', 725);
INSERT INTO public.empresa VALUES (2410, true, 1, '2023-07-03 14:52:49.728244', NULL, NULL, false, 'FACULDADE TECNOLOGICA ANTHROPOS (FATAN)', 235);
INSERT INTO public.empresa VALUES (2411, true, 1, '2023-07-03 14:52:49.729375', NULL, NULL, false, 'FACULDADE TECNOLÓGICA DE LIMOEIRO DO NORTE: LADISLAU PEREIRA (FTLN)', 726);
INSERT INTO public.empresa VALUES (2412, true, 1, '2023-07-03 14:52:49.73052', NULL, NULL, false, 'FACULDADE TECNOLÓGICA DENTAL CEEO (ESD-CEEO)', 727);
INSERT INTO public.empresa VALUES (2413, true, 1, '2023-07-03 14:52:49.731647', NULL, NULL, false, 'FACULDADE TECNOLÓGICA DE PERNAMBUCO (FATEPE)', 39);
INSERT INTO public.empresa VALUES (2414, true, 1, '2023-07-03 14:52:49.732793', NULL, NULL, false, 'FACULDADE TECNOLÓGICA FALCÃO (FTF)', 42);
INSERT INTO public.empresa VALUES (2415, true, 1, '2023-07-03 14:52:49.733947', NULL, NULL, false, 'FACULDADE TECNOLÓGICA INAP (FAT- INAP)', 2);
INSERT INTO public.empresa VALUES (2416, true, 1, '2023-07-03 14:52:49.735096', NULL, NULL, false, 'FACULDADE TECNOLÓGICA LATINO AMERICANA (FATLA)', 149);
INSERT INTO public.empresa VALUES (2417, true, 1, '2023-07-03 14:52:49.736218', NULL, NULL, false, 'FACULDADE TECSOMA (FATEC)', 55);
INSERT INTO public.empresa VALUES (2418, true, 1, '2023-07-03 14:52:49.737357', NULL, NULL, false, 'FACULDADE TELOS DE CAMPINAS (FATELOS)', 177);
INSERT INTO public.empresa VALUES (2419, true, 1, '2023-07-03 14:52:49.738502', NULL, NULL, false, 'FACULDADE TEOLÓGICA BATISTA DE BRASÍLIA (FTBB)', 5);
INSERT INTO public.empresa VALUES (2420, true, 1, '2023-07-03 14:52:49.739698', NULL, NULL, false, 'FACULDADE TEOLÓGICA BATISTA DE SÃO PAULO (FTBSP)', 8);
INSERT INTO public.empresa VALUES (2421, true, 1, '2023-07-03 14:52:49.740853', NULL, NULL, false, 'FACULDADE TEOLÓGICA BATISTA EQUATORIAL (FATEBE)', 79);
INSERT INTO public.empresa VALUES (2422, true, 1, '2023-07-03 14:52:49.742025', NULL, NULL, false, 'FACULDADE TEOLÓGICA BETÂNIA (FATEBE)', 56);
INSERT INTO public.empresa VALUES (2423, true, 1, '2023-07-03 14:52:49.743176', NULL, NULL, false, 'FACULDADE TEOLÓGICA DE CIÊNCIAS HUMANAS E SOCIAIS LOGOS (FAETEL)', 8);
INSERT INTO public.empresa VALUES (2424, true, 1, '2023-07-03 14:52:49.744334', NULL, NULL, false, 'FACULDADE TEOLÓGICA SUL AMERICANA (FTSA)', 159);
INSERT INTO public.empresa VALUES (2425, true, 1, '2023-07-03 14:52:49.745504', NULL, NULL, false, 'FACULDADE TERCEIRA VISÃO (F3V)', 473);
INSERT INTO public.empresa VALUES (2426, true, 1, '2023-07-03 14:52:49.746623', NULL, NULL, false, 'FACULDADE TERRA BRASILIS', 728);
INSERT INTO public.empresa VALUES (2427, true, 1, '2023-07-03 14:52:49.747874', NULL, NULL, false, 'FACULDADE TERRA NORDESTE (FATENE)', 534);
INSERT INTO public.empresa VALUES (2428, true, 1, '2023-07-03 14:52:49.748979', NULL, NULL, false, 'FACULDADE TERZIUS (TERZIUS)', 177);
INSERT INTO public.empresa VALUES (2429, true, 1, '2023-07-03 14:52:49.750059', NULL, NULL, false, 'FACULDADE TIRADENTES DE GOIANA (FITS)', 400);
INSERT INTO public.empresa VALUES (2430, true, 1, '2023-07-03 14:52:49.75118', NULL, NULL, false, 'FACULDADE TIRADENTES DE JABOATÃO DOS GUARARAPES', 132);
INSERT INTO public.empresa VALUES (2431, true, 1, '2023-07-03 14:52:49.752316', NULL, NULL, false, 'FACULDADE TRÊS DE MAIO (SETREM)', 729);
INSERT INTO public.empresa VALUES (2432, true, 1, '2023-07-03 14:52:49.753467', NULL, NULL, false, 'FACULDADE TRÊS MARIAS (FTM)', 107);
INSERT INTO public.empresa VALUES (2433, true, 1, '2023-07-03 14:52:49.754605', NULL, NULL, false, 'FACULDADE TRÊS PONTAS (FATEP)', 730);
INSERT INTO public.empresa VALUES (2434, true, 1, '2023-07-03 14:52:49.755796', NULL, NULL, false, 'FACULDADE TRILÓGICA KEPPE & PACHECO (KEPPE & PACHECO)', 731);
INSERT INTO public.empresa VALUES (2435, true, 1, '2023-07-03 14:52:49.756914', NULL, NULL, false, 'FACULDADE TRILÓGICA NOSSA SENHORA DE TODOS OS POVOS (FATRI EAD)', 8);
INSERT INTO public.empresa VALUES (2436, true, 1, '2023-07-03 14:52:49.758027', NULL, NULL, false, 'FACULDADE TUCURUÍ (FATUC)', 418);
INSERT INTO public.empresa VALUES (2437, true, 1, '2023-07-03 14:52:49.759159', NULL, NULL, false, 'FACULDADE UBERLANDENSE DE NÚCLEOS INTEGRADOS DE ENSINO, SERVIÇO SOCIAL E APRENDIZAGEM (FAESSA)', 134);
INSERT INTO public.empresa VALUES (2438, true, 1, '2023-07-03 14:52:49.760375', NULL, NULL, false, 'FACULDADE UBS (FACULDADE UBS)', 8);
INSERT INTO public.empresa VALUES (2439, true, 1, '2023-07-03 14:52:49.761525', NULL, NULL, false, 'FACULDADE UMFG (UMFG)', 732);
INSERT INTO public.empresa VALUES (2440, true, 1, '2023-07-03 14:52:49.762639', NULL, NULL, false, 'FACULDADE UNA DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (2441, true, 1, '2023-07-03 14:52:49.763794', NULL, NULL, false, 'FACULDADE UNA DE DIVINÓPOLIS (UNA DIVINOPOLIS)', 19);
INSERT INTO public.empresa VALUES (2442, true, 1, '2023-07-03 14:52:49.764959', NULL, NULL, false, 'FACULDADE UNA DE ITABIRA (UNA)', 161);
INSERT INTO public.empresa VALUES (2443, true, 1, '2023-07-03 14:52:49.766118', NULL, NULL, false, 'FACULDADE UNA DE ITUMBIARA', 234);
INSERT INTO public.empresa VALUES (2444, true, 1, '2023-07-03 14:52:49.767245', NULL, NULL, false, 'FACULDADE UNA DE JATAÍ (UNA)', 21);
INSERT INTO public.empresa VALUES (2445, true, 1, '2023-07-03 14:52:49.768422', NULL, NULL, false, 'FACULDADE UNA DE POUSO ALEGRE (UNA POUSOALEGRE)', 230);
INSERT INTO public.empresa VALUES (2446, true, 1, '2023-07-03 14:52:49.769597', NULL, NULL, false, 'FACULDADE UNA DE SETE LAGOAS (UNASET)', 24);
INSERT INTO public.empresa VALUES (2447, true, 1, '2023-07-03 14:52:49.77117', NULL, NULL, false, 'FACULDADE UNESC-UNAMA', 51);
INSERT INTO public.empresa VALUES (2448, true, 1, '2023-07-03 14:52:49.772796', NULL, NULL, false, 'FACULDADE UNEX (UNEX)', 308);
INSERT INTO public.empresa VALUES (2449, true, 1, '2023-07-03 14:52:49.774336', NULL, NULL, false, 'FACULDADE UNIABA (FAC UNIABA)', 5);
INSERT INTO public.empresa VALUES (2450, true, 1, '2023-07-03 14:52:49.77584', NULL, NULL, false, 'FACULDADE UNIÃO ARARUAMA DE ENSINO S/S LTDA. (FAC-UNILAGOS)', 733);
INSERT INTO public.empresa VALUES (2451, true, 1, '2023-07-03 14:52:49.777004', NULL, NULL, false, 'FACULDADE UNIÃO CULTURAL DO ESTADO DE SÃO PAULO (UCESP)', 197);
INSERT INTO public.empresa VALUES (2452, true, 1, '2023-07-03 14:52:49.778176', NULL, NULL, false, 'FACULDADE UNIÃO DE CAMPO MOURÃO', 168);
INSERT INTO public.empresa VALUES (2453, true, 1, '2023-07-03 14:52:49.779302', NULL, NULL, false, 'FACULDADE UNIÃO DE GOYAZES FORMOSA (FUG)', 539);
INSERT INTO public.empresa VALUES (2454, true, 1, '2023-07-03 14:52:49.780435', NULL, NULL, false, 'FACULDADE UNIÃO PAULISTANA (FAUP)', 8);
INSERT INTO public.empresa VALUES (2455, true, 1, '2023-07-03 14:52:49.781565', NULL, NULL, false, 'FACULDADE UNIATENEU (FATE)', 734);
INSERT INTO public.empresa VALUES (2456, true, 1, '2023-07-03 14:52:49.782732', NULL, NULL, false, 'FACULDADE UNIAVAN RIO DO SUL (UNIAVAN)', 183);
INSERT INTO public.empresa VALUES (2457, true, 1, '2023-07-03 14:52:49.783983', NULL, NULL, false, 'FACULDADE UNIBF', 735);
INSERT INTO public.empresa VALUES (2458, true, 1, '2023-07-03 14:52:49.785133', NULL, NULL, false, 'FACULDADE UNIBRAS DA BAHIA (FACBRAS)', 533);
INSERT INTO public.empresa VALUES (2459, true, 1, '2023-07-03 14:52:49.786265', NULL, NULL, false, 'FACULDADE UNIBRAS DO MARANHÃO (FACBRAS)', 507);
INSERT INTO public.empresa VALUES (2460, true, 1, '2023-07-03 14:52:49.787432', NULL, NULL, false, 'FACULDADE UNIBRAS DO MATO GROSSO (FACBRAS)', 736);
INSERT INTO public.empresa VALUES (2461, true, 1, '2023-07-03 14:52:49.788665', NULL, NULL, false, 'FACULDADE UNIBRAS DO NORTE GOIANO (FACBRAS)', 614);
INSERT INTO public.empresa VALUES (2462, true, 1, '2023-07-03 14:52:49.789777', NULL, NULL, false, 'FACULDADE UNIBRAS DO PARÁ (FACBRAS)', 737);
INSERT INTO public.empresa VALUES (2463, true, 1, '2023-07-03 14:52:49.790985', NULL, NULL, false, 'FACULDADE UNIBRASÍLIA (BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (2464, true, 1, '2023-07-03 14:52:49.792241', NULL, NULL, false, 'FACULDADE UNIBRASÍLIA DE CIÊNCIAS ECONÔMICAS DE MINAS GERAIS (BRASÍLIA)', 118);
INSERT INTO public.empresa VALUES (2465, true, 1, '2023-07-03 14:52:49.79349', NULL, NULL, false, 'FACULDADE UNIBRASÍLIA DE MINAS GERAIS (BRASÍLIA)', 118);
INSERT INTO public.empresa VALUES (2466, true, 1, '2023-07-03 14:52:49.794889', NULL, NULL, false, 'FACULDADE UNIBRASÍLIA SUL (BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (2467, true, 1, '2023-07-03 14:52:49.796177', NULL, NULL, false, 'FACULDADE ÚNICA DE FORMAÇÃO E ENSINO (FUNIFE)', 738);
INSERT INTO public.empresa VALUES (2468, true, 1, '2023-07-03 14:52:49.797596', NULL, NULL, false, 'FACULDADE ÚNICA DE IPATINGA (FUNIP)', 268);
INSERT INTO public.empresa VALUES (2469, true, 1, '2023-07-03 14:52:49.798724', NULL, NULL, false, 'FACULDADE UNICENTRAL', 739);
INSERT INTO public.empresa VALUES (2470, true, 1, '2023-07-03 14:52:49.800045', NULL, NULL, false, 'FACULDADE UNICESUMAR DE CORUMBÁ', 686);
INSERT INTO public.empresa VALUES (2471, true, 1, '2023-07-03 14:52:49.80118', NULL, NULL, false, 'FACULDADE UNICPO (FACULDADE UNICPO)', 299);
INSERT INTO public.empresa VALUES (2472, true, 1, '2023-07-03 14:52:49.80221', NULL, NULL, false, 'FACULDADE UNIDA DE CAMPINAS GOIÂNIA - FACUNICAMPS GOIÂNIA (FACUNICAMPS)', 42);
INSERT INTO public.empresa VALUES (2473, true, 1, '2023-07-03 14:52:49.803498', NULL, NULL, false, 'FACULDADE UNIDA DE SÃO PAULO (FAUSP)', 8);
INSERT INTO public.empresa VALUES (2474, true, 1, '2023-07-03 14:52:49.804698', NULL, NULL, false, 'FACULDADE UNIDA DE SÃO PAULO - EAD (FAUSP - EAD)', 8);
INSERT INTO public.empresa VALUES (2475, true, 1, '2023-07-03 14:52:49.805939', NULL, NULL, false, 'FACULDADE UNIDA DE VITÓRIA (FACULDADE UNIDA)', 25);
INSERT INTO public.empresa VALUES (2476, true, 1, '2023-07-03 14:52:49.807046', NULL, NULL, false, 'FACULDADE UNIEDUCAR', 45);
INSERT INTO public.empresa VALUES (2477, true, 1, '2023-07-03 14:52:49.808206', NULL, NULL, false, 'FACULDADE UNIFAEL CURITIBA (FAEL CURITIBA)', 56);
INSERT INTO public.empresa VALUES (2478, true, 1, '2023-07-03 14:52:49.809621', NULL, NULL, false, 'FACULDADE UNIFAEL PORTO ALEGRE (FAEL POA)', 149);
INSERT INTO public.empresa VALUES (2479, true, 1, '2023-07-03 14:52:49.811177', NULL, NULL, false, 'FACULDADE UNIFAHE', 740);
INSERT INTO public.empresa VALUES (2480, true, 1, '2023-07-03 14:52:49.812641', NULL, NULL, false, 'FACULDADE UNIFAMETRO CASCAVEL', 741);
INSERT INTO public.empresa VALUES (2481, true, 1, '2023-07-03 14:52:49.814113', NULL, NULL, false, 'FACULDADE UNIFAMETRO MARACANAÚ', 335);
INSERT INTO public.empresa VALUES (2482, true, 1, '2023-07-03 14:52:49.815674', NULL, NULL, false, 'FACULDADE UNIFICADA DO ESTADO DE SÃO PAULO (FAUESP - ONLINE)', 480);
INSERT INTO public.empresa VALUES (2483, true, 1, '2023-07-03 14:52:49.81743', NULL, NULL, false, 'FACULDADE UNIFICADA DO ESTADO DE SÃO PAULO (FAUESP)', 480);
INSERT INTO public.empresa VALUES (2484, true, 1, '2023-07-03 14:52:49.818975', NULL, NULL, false, 'FACULDADE UNIFTB', 742);
INSERT INTO public.empresa VALUES (2485, true, 1, '2023-07-03 14:52:49.820573', NULL, NULL, false, 'FACULDADE UNIGUAÇU (FAC UNIGUAÇU)', 743);
INSERT INTO public.empresa VALUES (2486, true, 1, '2023-07-03 14:52:49.822123', NULL, NULL, false, 'FACULDADE UNIMED', 2);
INSERT INTO public.empresa VALUES (2487, true, 1, '2023-07-03 14:52:49.823809', NULL, NULL, false, 'FACULDADE UNIME DE CIÊNCIAS EXATAS E TECNOLÓGICAS (FCT)', 209);
INSERT INTO public.empresa VALUES (2488, true, 1, '2023-07-03 14:52:49.825489', NULL, NULL, false, 'FACULDADE UNIME DE CIÊNCIAS JURÍDICAS (FCJ)', 209);
INSERT INTO public.empresa VALUES (2489, true, 1, '2023-07-03 14:52:49.827203', NULL, NULL, false, 'FACULDADE UNIME DE CIÊNCIAS SOCIAIS (FCS)', 209);
INSERT INTO public.empresa VALUES (2490, true, 1, '2023-07-03 14:52:49.829009', NULL, NULL, false, 'FACULDADE UNIME DE EDUCAÇÃO E COMUNICAÇÃO (FEC)', 209);
INSERT INTO public.empresa VALUES (2491, true, 1, '2023-07-03 14:52:49.830749', NULL, NULL, false, 'FACULDADE UNINA', 56);
INSERT INTO public.empresa VALUES (2492, true, 1, '2023-07-03 14:52:49.832392', NULL, NULL, false, 'FACULDADE UNINABUCO SÃO LOURENÇO DA MATA', 744);
INSERT INTO public.empresa VALUES (2493, true, 1, '2023-07-03 14:52:49.833982', NULL, NULL, false, 'FACULDADE UNINASSAU ARAPIRACA', 333);
INSERT INTO public.empresa VALUES (2494, true, 1, '2023-07-03 14:52:49.835515', NULL, NULL, false, 'FACULDADE UNINASSAU BELO HORIZONTE', 2);
INSERT INTO public.empresa VALUES (2495, true, 1, '2023-07-03 14:52:49.837318', NULL, NULL, false, 'FACULDADE UNINASSAU BRASÍLIA (NASSAU BRASÍLIA)', 5);
INSERT INTO public.empresa VALUES (2496, true, 1, '2023-07-03 14:52:49.839039', NULL, NULL, false, 'FACULDADE UNINASSAU CABO', 412);
INSERT INTO public.empresa VALUES (2497, true, 1, '2023-07-03 14:52:49.840909', NULL, NULL, false, 'FACULDADE UNINASSAU CUIABÁ (NASSAU CUIABÁ)', 203);
INSERT INTO public.empresa VALUES (2498, true, 1, '2023-07-03 14:52:49.842577', NULL, NULL, false, 'FACULDADE UNINASSAU FEIRA DE SANTANA', 99);
INSERT INTO public.empresa VALUES (2499, true, 1, '2023-07-03 14:52:49.844352', NULL, NULL, false, 'FACULDADE UNINASSAU GARANHUNS (NASSAU GARANHUNS)', 483);
INSERT INTO public.empresa VALUES (2500, true, 1, '2023-07-03 14:52:49.846063', NULL, NULL, false, 'FACULDADE UNINASSAU JABOATÃO DOS GUARARAPES (UNINASSAU)', 132);
INSERT INTO public.empresa VALUES (2501, true, 1, '2023-07-03 14:52:49.847755', NULL, NULL, false, 'FACULDADE UNINASSAU LAURO DE FREITAS', 209);
INSERT INTO public.empresa VALUES (2502, true, 1, '2023-07-03 14:52:49.84939', NULL, NULL, false, 'FACULDADE UNINASSAU MARACANAÚ', 335);
INSERT INTO public.empresa VALUES (2503, true, 1, '2023-07-03 14:52:49.85096', NULL, NULL, false, 'FACULDADE UNINASSAU MOSSORÓ', 323);
INSERT INTO public.empresa VALUES (2504, true, 1, '2023-07-03 14:52:49.852488', NULL, NULL, false, 'FACULDADE UNINASSAU OLINDA - NASSAU OLINDA', 39);
INSERT INTO public.empresa VALUES (2505, true, 1, '2023-07-03 14:52:49.8542', NULL, NULL, false, 'FACULDADE UNINASSAU PALMAS (NASSAU PALMAS)', 23);
INSERT INTO public.empresa VALUES (2506, true, 1, '2023-07-03 14:52:49.855929', NULL, NULL, false, 'FACULDADE UNINASSAU PARNAMIRIM', 537);
INSERT INTO public.empresa VALUES (2507, true, 1, '2023-07-03 14:52:49.857691', NULL, NULL, false, 'FACULDADE UNINASSAU PETROLINA', 445);
INSERT INTO public.empresa VALUES (2508, true, 1, '2023-07-03 14:52:49.859433', NULL, NULL, false, 'FACULDADE UNINASSAU SOBRAL', 167);
INSERT INTO public.empresa VALUES (2509, true, 1, '2023-07-03 14:52:49.861172', NULL, NULL, false, 'FACULDADE UNINASSAU VILHENA', 355);
INSERT INTO public.empresa VALUES (2510, true, 1, '2023-07-03 14:52:49.862862', NULL, NULL, false, 'FACULDADE UNINASSAU VITÓRIA DA CONQUISTA', 37);
INSERT INTO public.empresa VALUES (2511, true, 1, '2023-07-03 14:52:49.86449', NULL, NULL, false, 'FACULDADE - UNINORTE ALTAMIRA', 14);
INSERT INTO public.empresa VALUES (2512, true, 1, '2023-07-03 14:52:49.866146', NULL, NULL, false, 'FACULDADE - UNINORTE BARCARENA', 745);
INSERT INTO public.empresa VALUES (2513, true, 1, '2023-07-03 14:52:49.867904', NULL, NULL, false, 'FACULDADE UNINORTE MARABÁ (UNINORTE MARABÁ)', 46);
INSERT INTO public.empresa VALUES (2514, true, 1, '2023-07-03 14:52:49.869682', NULL, NULL, false, 'FACULDADE UNINORTE TAILÂNDIA (UNINORTE)', 442);
INSERT INTO public.empresa VALUES (2515, true, 1, '2023-07-03 14:52:49.871426', NULL, NULL, false, 'FACULDADE UNINTA FORTALEZA', 45);
INSERT INTO public.empresa VALUES (2516, true, 1, '2023-07-03 14:52:49.873101', NULL, NULL, false, 'FACULDADE UNINTA FORTALEZA - GESTÃO E NEGÓCIOS', 45);
INSERT INTO public.empresa VALUES (2517, true, 1, '2023-07-03 14:52:49.874885', NULL, NULL, false, 'FACULDADE UNINTA IGUATU', 332);
INSERT INTO public.empresa VALUES (2518, true, 1, '2023-07-03 14:52:49.876719', NULL, NULL, false, 'FACULDADE UNINTA TIANGUA', 235);
INSERT INTO public.empresa VALUES (2519, true, 1, '2023-07-03 14:52:49.878855', NULL, NULL, false, 'FACULDADE UNÍNTESE', 348);
INSERT INTO public.empresa VALUES (2520, true, 1, '2023-07-03 14:52:49.881051', NULL, NULL, false, 'FACULDADE UNIRB - ALAGOAS (F. UNIRB)', 73);
INSERT INTO public.empresa VALUES (2521, true, 1, '2023-07-03 14:52:49.883169', NULL, NULL, false, 'FACULDADE UNIRB - ARACAJU (F. UNIRB)', 142);
INSERT INTO public.empresa VALUES (2522, true, 1, '2023-07-03 14:52:49.885292', NULL, NULL, false, 'FACULDADE UNIRB - ARAPIRACA (F. UNIRB)', 333);
INSERT INTO public.empresa VALUES (2523, true, 1, '2023-07-03 14:52:49.887018', NULL, NULL, false, 'FACULDADE UNIRB - BARREIRAS (F. UNIRB)', 174);
INSERT INTO public.empresa VALUES (2524, true, 1, '2023-07-03 14:52:49.888767', NULL, NULL, false, 'FACULDADE UNIRB - CAMAÇARI (FACULDADE UNIRB)', 153);
INSERT INTO public.empresa VALUES (2525, true, 1, '2023-07-03 14:52:49.89064', NULL, NULL, false, 'FACULDADE UNIRB CEARÁ (F.CEARÁ)', 45);
INSERT INTO public.empresa VALUES (2526, true, 1, '2023-07-03 14:52:49.892535', NULL, NULL, false, 'FACULDADE UNIRB - CIDADE DE FORTALEZA (F. UNIRB)', 45);
INSERT INTO public.empresa VALUES (2527, true, 1, '2023-07-03 14:52:49.894352', NULL, NULL, false, 'FACULDADE UNIRB - FEIRA DE SANTANA (F. UNIRB)', 99);
INSERT INTO public.empresa VALUES (2528, true, 1, '2023-07-03 14:52:49.896171', NULL, NULL, false, 'FACULDADE UNIRB - FORTALEZA (F. UNIRB)', 45);
INSERT INTO public.empresa VALUES (2529, true, 1, '2023-07-03 14:52:49.897946', NULL, NULL, false, 'FACULDADE UNIRB JOÃO PESSOA (F.UNIRB)', 107);
INSERT INTO public.empresa VALUES (2530, true, 1, '2023-07-03 14:52:49.899798', NULL, NULL, false, 'FACULDADE UNIRB - JUAZEIRO (FACULDADE UNIRB)', 533);
INSERT INTO public.empresa VALUES (2531, true, 1, '2023-07-03 14:52:49.901592', NULL, NULL, false, 'FACULDADE UNIRB - MACEIO (FACULDADE UNIRB)', 73);
INSERT INTO public.empresa VALUES (2532, true, 1, '2023-07-03 14:52:49.903202', NULL, NULL, false, 'FACULDADE UNIRB - MOSSORÓ (F. UNIRB)', 323);
INSERT INTO public.empresa VALUES (2533, true, 1, '2023-07-03 14:52:49.904762', NULL, NULL, false, 'FACULDADE UNIRB - NATAL (F. UNIRB)', 130);
INSERT INTO public.empresa VALUES (2534, true, 1, '2023-07-03 14:52:49.906367', NULL, NULL, false, 'FACULDADE UNIRB - PARNAÍBA (F. UNIRB)', 176);
INSERT INTO public.empresa VALUES (2535, true, 1, '2023-07-03 14:52:49.908117', NULL, NULL, false, 'FACULDADE UNIRB PARNAMIRIM (F.UNIRB)', 537);
INSERT INTO public.empresa VALUES (2536, true, 1, '2023-07-03 14:52:49.909805', NULL, NULL, false, 'FACULDADE UNIRB - PIAUÍ (F. UNIRB)', 27);
INSERT INTO public.empresa VALUES (2537, true, 1, '2023-07-03 14:52:49.911611', NULL, NULL, false, 'FACULDADE UNIRB - SALVADOR (FACULDADE UNIRB)', 116);
INSERT INTO public.empresa VALUES (2538, true, 1, '2023-07-03 14:52:49.913421', NULL, NULL, false, 'FACULDADE UNIRB - SERRINHA (FACULDADE UNIRB)', 746);
INSERT INTO public.empresa VALUES (2539, true, 1, '2023-07-03 14:52:49.915175', NULL, NULL, false, 'FACULDADE UNIRB - TERESINA (F. UNIRB)', 27);
INSERT INTO public.empresa VALUES (2540, true, 1, '2023-07-03 14:52:49.916876', NULL, NULL, false, 'FACULDADE UNIRIO', 51);
INSERT INTO public.empresa VALUES (2541, true, 1, '2023-07-03 14:52:49.918627', NULL, NULL, false, 'FACULDADE UNISE', 342);
INSERT INTO public.empresa VALUES (2542, true, 1, '2023-07-03 14:52:49.92041', NULL, NULL, false, 'FACULDADE UNIS POUSO ALEGRE', 230);
INSERT INTO public.empresa VALUES (2543, true, 1, '2023-07-03 14:52:49.922085', NULL, NULL, false, 'FACULDADE UNIS SÃO LOURENÇO', 511);
INSERT INTO public.empresa VALUES (2544, true, 1, '2023-07-03 14:52:49.924023', NULL, NULL, false, 'FACULDADE UNISUL DE BALNEÁRIO CAMBORIÚ', 57);
INSERT INTO public.empresa VALUES (2545, true, 1, '2023-07-03 14:52:49.926029', NULL, NULL, false, 'FACULDADE UNISUL DE EDUCAÇÃO DE ITAJAÍ', 345);
INSERT INTO public.empresa VALUES (2546, true, 1, '2023-07-03 14:52:49.92802', NULL, NULL, false, 'FACULDADE UNISUL DE FLORIANÓPOLIS', 3);
INSERT INTO public.empresa VALUES (2547, true, 1, '2023-07-03 14:52:49.929798', NULL, NULL, false, 'FACULDADE UNISUL DE ITAJAÍ', 345);
INSERT INTO public.empresa VALUES (2548, true, 1, '2023-07-03 14:52:49.931494', NULL, NULL, false, 'FACULDADE UNITÀ (UNITÀ)', 177);
INSERT INTO public.empresa VALUES (2549, true, 1, '2023-07-03 14:52:49.933109', NULL, NULL, false, 'FACULDADE UNITERP (FACTERP)', 114);
INSERT INTO public.empresa VALUES (2550, true, 1, '2023-07-03 14:52:49.934799', NULL, NULL, false, 'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE CAMPO GRANDE', 48);
INSERT INTO public.empresa VALUES (2551, true, 1, '2023-07-03 14:52:49.936294', NULL, NULL, false, 'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE GOIÂNIA (VERITAS GOIÂNIA)', 42);
INSERT INTO public.empresa VALUES (2552, true, 1, '2023-07-03 14:52:49.937855', NULL, NULL, false, 'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE PIRACICABA (UNIVERITAS PCBA)', 224);
INSERT INTO public.empresa VALUES (2553, true, 1, '2023-07-03 14:52:49.939546', NULL, NULL, false, 'FACULDADE UNIVERSALIS (FACSALIS)', 142);
INSERT INTO public.empresa VALUES (2554, true, 1, '2023-07-03 14:52:49.941269', NULL, NULL, false, 'FACULDADE UNIVERSO BRASÍLIA', 5);
INSERT INTO public.empresa VALUES (2555, true, 1, '2023-07-03 14:52:49.942926', NULL, NULL, false, 'FACULDADE UNIVEST DE EDUCAÇÃO (UNIVEST)', 203);
INSERT INTO public.empresa VALUES (2556, true, 1, '2023-07-03 14:52:49.944628', NULL, NULL, false, 'FACULDADE UNOPAR DE CIÊNCIAS JURÍDICAS DE PETROLINA', 445);
INSERT INTO public.empresa VALUES (2557, true, 1, '2023-07-03 14:52:49.946278', NULL, NULL, false, 'FACULDADE UNOPAR DE CIÊNCIAS JURÍDICAS DE SETE LAGOAS', 24);
INSERT INTO public.empresa VALUES (2558, true, 1, '2023-07-03 14:52:49.947892', NULL, NULL, false, 'FACULDADE UNYLEYA', 12);
INSERT INTO public.empresa VALUES (2559, true, 1, '2023-07-03 14:52:49.949399', NULL, NULL, false, 'FACULDADE UNYPUBLICA', 56);
INSERT INTO public.empresa VALUES (2560, true, 1, '2023-07-03 14:52:49.950851', NULL, NULL, false, 'FACULDADE URIEL DE ALMEIDA LEITÃO', 95);
INSERT INTO public.empresa VALUES (2561, true, 1, '2023-07-03 14:52:49.952314', NULL, NULL, false, 'FACULDADE VALE DO AÇO (FAVALE)', 482);
INSERT INTO public.empresa VALUES (2562, true, 1, '2023-07-03 14:52:49.954216', NULL, NULL, false, 'FACULDADE VALE DO GORUTUBA (FAVAG)', 747);
INSERT INTO public.empresa VALUES (2563, true, 1, '2023-07-03 14:52:49.955932', NULL, NULL, false, 'FACULDADE VALE DO PAJEU (FVP)', 748);
INSERT INTO public.empresa VALUES (2564, true, 1, '2023-07-03 14:52:49.957697', NULL, NULL, false, 'FACULDADE VALE DOS CARAJÁS (FVC)', 281);
INSERT INTO public.empresa VALUES (2565, true, 1, '2023-07-03 14:52:49.959729', NULL, NULL, false, 'FACULDADE VALE DO SORRISO (UNIVALE)', 609);
INSERT INTO public.empresa VALUES (2566, true, 1, '2023-07-03 14:52:49.961641', NULL, NULL, false, 'FACULDADE VAN GOGH (FVG)', 8);
INSERT INTO public.empresa VALUES (2567, true, 1, '2023-07-03 14:52:49.963268', NULL, NULL, false, 'FACULDADE VANGUARDA', 144);
INSERT INTO public.empresa VALUES (2568, true, 1, '2023-07-03 14:52:49.964906', NULL, NULL, false, 'FACULDADE VASCONCELLOS & SOUZA', 749);
INSERT INTO public.empresa VALUES (2569, true, 1, '2023-07-03 14:52:49.966526', NULL, NULL, false, 'FACULDADE VENDA NOVA DO IMIGRANTE (FAVENI)', 750);
INSERT INTO public.empresa VALUES (2570, true, 1, '2023-07-03 14:52:49.968235', NULL, NULL, false, 'FACULDADE VERBO EDUCACIONAL (VERBOEDU)', 149);
INSERT INTO public.empresa VALUES (2571, true, 1, '2023-07-03 14:52:49.969864', NULL, NULL, false, 'FACULDADE VERDE NORTE (FAVENORTE)', 751);
INSERT INTO public.empresa VALUES (2572, true, 1, '2023-07-03 14:52:49.971531', NULL, NULL, false, 'FACULDADE VÉRTIX TRIRRIENSE (FVT)', 420);
INSERT INTO public.empresa VALUES (2573, true, 1, '2023-07-03 14:52:49.973145', NULL, NULL, false, 'FACULDADE VIA SAPIENS (FVS)', 235);
INSERT INTO public.empresa VALUES (2574, true, 1, '2023-07-03 14:52:49.974748', NULL, NULL, false, 'FACULDADE VICENTINA - FAVI (FAVI)', 56);
INSERT INTO public.empresa VALUES (2575, true, 1, '2023-07-03 14:52:49.976318', NULL, NULL, false, 'FACULDADE VIDAL (FAVILI)', 726);
INSERT INTO public.empresa VALUES (2576, true, 1, '2023-07-03 14:52:49.977939', NULL, NULL, false, 'FACULDADE VINCIT (VINCIT)', 76);
INSERT INTO public.empresa VALUES (2577, true, 1, '2023-07-03 14:52:49.979536', NULL, NULL, false, 'FACULDADE VIRTUAL DO BRASIL (FVB)', 8);
INSERT INTO public.empresa VALUES (2578, true, 1, '2023-07-03 14:52:49.98142', NULL, NULL, false, 'FACULDADE VISCONDE DE CAIRÚ (FAVIC)', 116);
INSERT INTO public.empresa VALUES (2579, true, 1, '2023-07-03 14:52:49.983358', NULL, NULL, false, 'FACULDADE VITÓRIA EM CRISTO (FVC)', 12);
INSERT INTO public.empresa VALUES (2580, true, 1, '2023-07-03 14:52:49.985369', NULL, NULL, false, 'FACULDADE VIVA VITÓRIA (FAVIVA)', 25);
INSERT INTO public.empresa VALUES (2581, true, 1, '2023-07-03 14:52:49.987326', NULL, NULL, false, 'FACULDADE VOLPE MIELE (FVM)', 58);
INSERT INTO public.empresa VALUES (2582, true, 1, '2023-07-03 14:52:49.989243', NULL, NULL, false, 'FACULDADE VP (VP)', 41);
INSERT INTO public.empresa VALUES (2583, true, 1, '2023-07-03 14:52:49.991245', NULL, NULL, false, 'FACULDADE WENCESLAU BRAZ', 103);
INSERT INTO public.empresa VALUES (2584, true, 1, '2023-07-03 14:52:49.993052', NULL, NULL, false, 'FACULDADE WOLI', 129);
INSERT INTO public.empresa VALUES (2585, true, 1, '2023-07-03 14:52:49.994759', NULL, NULL, false, 'FACULDADE XP EDUCAÇÃO - IGTI (XPE)', 2);
INSERT INTO public.empresa VALUES (2586, true, 1, '2023-07-03 14:52:49.996479', NULL, NULL, false, 'FACULDADE XV DE AGOSTO (FAQ)', 752);
INSERT INTO public.empresa VALUES (2587, true, 1, '2023-07-03 14:52:49.998393', NULL, NULL, false, 'FACULDADE ZACARIAS DE GÓES (FAZAG)', 306);
INSERT INTO public.empresa VALUES (2588, true, 1, '2023-07-03 14:52:50.000001', NULL, NULL, false, 'FACULDADE ZUMBI DOS PALMARES (FAZP)', 8);
INSERT INTO public.empresa VALUES (2589, true, 1, '2023-07-03 14:52:50.001698', NULL, NULL, false, 'FACUMINAS FACULDADE (FACUMINAS)', 128);
INSERT INTO public.empresa VALUES (2590, true, 1, '2023-07-03 14:52:50.003486', NULL, NULL, false, 'FAE CENTRO UNIVERSITÁRIO', 56);
INSERT INTO public.empresa VALUES (2591, true, 1, '2023-07-03 14:52:50.005648', NULL, NULL, false, 'FAI - CENTRO DE ENSINO SUPERIOR EM GESTÃO, TECNOLOGIA E EDUCAÇÃO', 753);
INSERT INTO public.empresa VALUES (2592, true, 1, '2023-07-03 14:52:50.00778', NULL, NULL, false, 'FAJOPA - FACULDADE JOÃO PAULO II (FAJOPA)', 145);
INSERT INTO public.empresa VALUES (2593, true, 1, '2023-07-03 14:52:50.00977', NULL, NULL, false, 'FANEESP - FACULDADE NACIONAL DE EDUCAÇÃO E ENSINO SUPERIOR DO PARANÁ (FANEESP)', 206);
INSERT INTO public.empresa VALUES (2594, true, 1, '2023-07-03 14:52:50.011658', NULL, NULL, false, 'FASUL EDUCACIONAL EAD (FASUL EDUCACIONAL)', 511);
INSERT INTO public.empresa VALUES (2595, true, 1, '2023-07-03 14:52:50.013278', NULL, NULL, false, 'FATEC ARTHUR AZEVEDO - MOGI MIRIM (FATECMM)', 642);
INSERT INTO public.empresa VALUES (2596, true, 1, '2023-07-03 14:52:50.014938', NULL, NULL, false, 'FATEC CRUZEIRO - PROF. WALDOMIRO MAY', 229);
INSERT INTO public.empresa VALUES (2597, true, 1, '2023-07-03 14:52:50.016666', NULL, NULL, false, 'FATECE - FACULDADE DE TECNOLOGIA, CIÊNCIAS E EDUCAÇÃO (FATECE)', 754);
INSERT INTO public.empresa VALUES (2598, true, 1, '2023-07-03 14:52:50.018489', NULL, NULL, false, 'FATEC - FACULDADE DE TEOLOGIA E CIÊNCIAS DE VOTUPORANGA (FATEC)', 10);
INSERT INTO public.empresa VALUES (2599, true, 1, '2023-07-03 14:52:50.020136', NULL, NULL, false, 'FAVENORTE DE PORTEIRINHA (FAVEPORT)', 755);
INSERT INTO public.empresa VALUES (2600, true, 1, '2023-07-03 14:52:50.021701', NULL, NULL, false, 'FETAC - FACULDADE DE EDUCAÇÃO, TECNOLOGIA E ADMINISTRAÇÃO DE CAARAPÓ (FETAC)', 756);
INSERT INTO public.empresa VALUES (2601, true, 1, '2023-07-03 14:52:50.023279', NULL, NULL, false, 'FG FACULDADE GLOBAL (FG)', 149);
INSERT INTO public.empresa VALUES (2602, true, 1, '2023-07-03 14:52:50.02484', NULL, NULL, false, 'FGV / ESCOLA DE RELAÇÕES INTERNACIONAIS (FGV/RI)', 8);
INSERT INTO public.empresa VALUES (2603, true, 1, '2023-07-03 14:52:50.026683', NULL, NULL, false, 'FIAM-FAAM - CENTRO UNIVERSITÁRIO (UNIFIAM-FAAM)', 8);
INSERT INTO public.empresa VALUES (2604, true, 1, '2023-07-03 14:52:50.028459', NULL, NULL, false, 'FIAP - CENTRO UNIVERSITÁRIO', 8);
INSERT INTO public.empresa VALUES (2605, true, 1, '2023-07-03 14:52:50.030606', NULL, NULL, false, 'FIEP - FACULDADE INTERNACIONAL DE EVOLUÇÃO PROFISSIONAL (FIEP)', 116);
INSERT INTO public.empresa VALUES (2606, true, 1, '2023-07-03 14:52:50.032413', NULL, NULL, false, 'FI - FACULDADE IGUAÇU (FI)', 757);
INSERT INTO public.empresa VALUES (2607, true, 1, '2023-07-03 14:52:50.034197', NULL, NULL, false, 'FIP - FACULDADE DE IPORÃ PARANÁ (FIP)', 758);
INSERT INTO public.empresa VALUES (2608, true, 1, '2023-07-03 14:52:50.035916', NULL, NULL, false, 'FOCCA - FACULDADE DE OLINDA (FOCCA)', 39);
INSERT INTO public.empresa VALUES (2609, true, 1, '2023-07-03 14:52:50.037732', NULL, NULL, false, 'FORMAÇÃO FACULDADE INTEGRADA (FFI)', 141);
INSERT INTO public.empresa VALUES (2610, true, 1, '2023-07-03 14:52:50.039543', NULL, NULL, false, 'FRANKLINCOVEY BUSINESS SCHOOL (FCBS)', 8);
INSERT INTO public.empresa VALUES (2611, true, 1, '2023-07-03 14:52:50.041285', NULL, NULL, false, 'FTRB - FACULDADE TEOLÓGICA REFORMADA DE BRASÍLIA', 5);
INSERT INTO public.empresa VALUES (2612, true, 1, '2023-07-03 14:52:50.043316', NULL, NULL, false, 'FUNDAÇÃO DOM CABRAL', 481);
INSERT INTO public.empresa VALUES (2613, true, 1, '2023-07-03 14:52:50.044893', NULL, NULL, false, 'FUNDAÇÃO DOM CABRAL - ENSINO SUPERIOR (FDC)', 481);
INSERT INTO public.empresa VALUES (2614, true, 1, '2023-07-03 14:52:50.046461', NULL, NULL, false, 'FUNDAÇÃO ESCOLA LINCE KEMPIM (FELK)', 759);
INSERT INTO public.empresa VALUES (2615, true, 1, '2023-07-03 14:52:50.047938', NULL, NULL, false, 'FUNDAÇÃO FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE MANDAGUARI (FAFIMAN)', 760);
INSERT INTO public.empresa VALUES (2616, true, 1, '2023-07-03 14:52:50.049272', NULL, NULL, false, 'FUNDAÇÃO FACULDADE PARA AS ARTES, EDUCAÇÃO E COMUNICAÇÃO (FUNDAEC)', 8);
INSERT INTO public.empresa VALUES (2617, true, 1, '2023-07-03 14:52:50.050565', NULL, NULL, false, 'FUNDAÇÃO OSWALDO CRUZ (FIOCRUZ)', 12);
INSERT INTO public.empresa VALUES (2618, true, 1, '2023-07-03 14:52:50.051834', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE DO ESTADO DE SANTA CATARINA (UDESC)', 3);
INSERT INTO public.empresa VALUES (2619, true, 1, '2023-07-03 14:52:50.053102', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DA GRANDE DOURADOS (UFGD)', 84);
INSERT INTO public.empresa VALUES (2620, true, 1, '2023-07-03 14:52:50.054364', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DE CIÊNCIAS DA SAÚDE DE PORTO ALEGRE (UFCSPA)', 149);
INSERT INTO public.empresa VALUES (2621, true, 1, '2023-07-03 14:52:50.05569', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DE RONDÔNIA (UNIR)', 51);
INSERT INTO public.empresa VALUES (2622, true, 1, '2023-07-03 14:52:50.057068', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DO ABC (UFABC)', 47);
INSERT INTO public.empresa VALUES (2623, true, 1, '2023-07-03 14:52:50.058568', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DO PAMPA - UNIPAMPA (UNIPAMPA)', 86);
INSERT INTO public.empresa VALUES (2624, true, 1, '2023-07-03 14:52:50.05994', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DO TOCANTINS (UFT)', 23);
INSERT INTO public.empresa VALUES (2625, true, 1, '2023-07-03 14:52:50.061408', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE FEDERAL DO VALE DO SÃO FRANCISCO (UNIVASF)', 445);
INSERT INTO public.empresa VALUES (2626, true, 1, '2023-07-03 14:52:50.062967', NULL, NULL, false, 'FUNDAÇÃO UNIVERSIDADE VIRTUAL DO ESTADO DE SÃO PAULO (UNIVESP)', 8);
INSERT INTO public.empresa VALUES (2627, true, 1, '2023-07-03 14:52:50.064417', NULL, NULL, false, 'FUNVIC - FACULDADE FUNVIC DE MOCOCA', 528);
INSERT INTO public.empresa VALUES (2628, true, 1, '2023-07-03 14:52:50.065802', NULL, NULL, false, 'GAIA (GAIA)', 146);
INSERT INTO public.empresa VALUES (2629, true, 1, '2023-07-03 14:52:50.067208', NULL, NULL, false, 'GRAN CENTRO UNIVERSITÁRIO (GRAN)', 56);
INSERT INTO public.empresa VALUES (2630, true, 1, '2023-07-03 14:52:50.068617', NULL, NULL, false, 'GRUPO DE NUTRIÇÃO HUMANA (GANEP)', 8);
INSERT INTO public.empresa VALUES (2631, true, 1, '2023-07-03 14:52:50.069879', NULL, NULL, false, 'IBPTECH FACULDADE DE CIÊNCIAS FORENSES E TECNOLOGIA', 8);
INSERT INTO public.empresa VALUES (2632, true, 1, '2023-07-03 14:52:50.071169', NULL, NULL, false, 'ICEV - INSTITUTO DE ENSINO SUPERIOR', 27);
INSERT INTO public.empresa VALUES (2633, true, 1, '2023-07-03 14:52:50.072464', NULL, NULL, false, 'ILUM ESCOLA DE CIÊNCIA', 177);
INSERT INTO public.empresa VALUES (2634, true, 1, '2023-07-03 14:52:50.073862', NULL, NULL, false, 'INSIDE - INSTITUTO SUPERIOR PARA INTEGRAÇÃO, DESENVOLVIMENTO E EDUCAÇÃO (INSIDE)', 5);
INSERT INTO public.empresa VALUES (2635, true, 1, '2023-07-03 14:52:50.075128', NULL, NULL, false, 'INSPER INSTITUTO DE ENSINO E PESQUISA', 8);
INSERT INTO public.empresa VALUES (2636, true, 1, '2023-07-03 14:52:50.076432', NULL, NULL, false, 'INSTITUIÇÃO DE ENSINO SUPERIOR DE CACOAL (FANORTE CACOAL)', 115);
INSERT INTO public.empresa VALUES (2637, true, 1, '2023-07-03 14:52:50.077716', NULL, NULL, false, 'INSTITUTO AMAZÔNICO DE ENSINO SUPERIOR (IAMES)', 75);
INSERT INTO public.empresa VALUES (2638, true, 1, '2023-07-03 14:52:50.079014', NULL, NULL, false, 'INSTITUTO APHONSIANO DE ENSINO SUPERIOR (IAESUP)', 164);
INSERT INTO public.empresa VALUES (2639, true, 1, '2023-07-03 14:52:50.08023', NULL, NULL, false, 'INSTITUTO ARIA', 5);
INSERT INTO public.empresa VALUES (2640, true, 1, '2023-07-03 14:52:50.08145', NULL, NULL, false, 'INSTITUTO BELO HORIZONTE DE ENSINO SUPERIOR (IBHES)', 2);
INSERT INTO public.empresa VALUES (2641, true, 1, '2023-07-03 14:52:50.082705', NULL, NULL, false, 'INSTITUTO BRASIL DE ENSINO SUPERIOR (IBRAS)', 188);
INSERT INTO public.empresa VALUES (2642, true, 1, '2023-07-03 14:52:50.08393', NULL, NULL, false, 'INSTITUTO BRASILEIRO DE COACHING (IBC)', 42);
INSERT INTO public.empresa VALUES (2643, true, 1, '2023-07-03 14:52:50.085075', NULL, NULL, false, 'INSTITUTO BRASILEIRO DE ENSINO, DESENVOLVIMENTO E PESQUISA DE BRASÍLIA (IDP-BSB)', 5);
INSERT INTO public.empresa VALUES (2644, true, 1, '2023-07-03 14:52:50.086241', NULL, NULL, false, 'INSTITUTO BRASILEIRO DE ENSINO, DESENVOLVIMENTO E PESQUISA DE SÃO PAULO (IDP-SP)', 8);
INSERT INTO public.empresa VALUES (2645, true, 1, '2023-07-03 14:52:50.087448', NULL, NULL, false, 'INSTITUTO CATÓLICO DE ESTUDOS SUPERIORES DO PIAUÍ (ICESPI)', 27);
INSERT INTO public.empresa VALUES (2646, true, 1, '2023-07-03 14:52:50.088658', NULL, NULL, false, 'INSTITUTO CUIABÁ DE ENSINO E CULTURA (ICEC)', 203);
INSERT INTO public.empresa VALUES (2647, true, 1, '2023-07-03 14:52:50.089805', NULL, NULL, false, 'INSTITUTO DE ASSISTÊNCIA MÉDICA AO SERVIDOR PÚBLICO ESTADUAL (IAMSPE)', 8);
INSERT INTO public.empresa VALUES (2648, true, 1, '2023-07-03 14:52:50.090962', NULL, NULL, false, 'INSTITUTO DE CIÊNCIAS SOCIAIS E HUMANAS (ICSH)', 297);
INSERT INTO public.empresa VALUES (2649, true, 1, '2023-07-03 14:52:50.092109', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO E APRENDIZAGEM - IDEA DIREITO (IDEA DIREITO)', 141);
INSERT INTO public.empresa VALUES (2650, true, 1, '2023-07-03 14:52:50.093309', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO E APRENDIZAGEM - IDEA SÃO LUIZ (IDEA SÃO LUIZ)', 141);
INSERT INTO public.empresa VALUES (2651, true, 1, '2023-07-03 14:52:50.094463', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO EDUCACIONAL (IDE)', 60);
INSERT INTO public.empresa VALUES (2652, true, 1, '2023-07-03 14:52:50.095607', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO EDUCACIONAL DA AMAZÔNIA (IDEA)', 267);
INSERT INTO public.empresa VALUES (2653, true, 1, '2023-07-03 14:52:50.096758', NULL, NULL, false, 'INSTITUTO DE DESENVOLVIMENTO TECNOLÓGICO DA FGV (FGV/IDT)', 12);
INSERT INTO public.empresa VALUES (2654, true, 1, '2023-07-03 14:52:50.098062', NULL, NULL, false, 'INSTITUTO DE DIREITO DO NORTE - IDN MANAUS (IDN MANAUS)', 75);
INSERT INTO public.empresa VALUES (2655, true, 1, '2023-07-03 14:52:50.099248', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO E ENSINO SUPERIOR DE CAMPINAS (IESCAMP)', 177);
INSERT INTO public.empresa VALUES (2656, true, 1, '2023-07-03 14:52:50.100419', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO E INOVAÇÃO (IEDI)', 138);
INSERT INTO public.empresa VALUES (2657, true, 1, '2023-07-03 14:52:50.101544', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR DE POUSO ALEGRE', 230);
INSERT INTO public.empresa VALUES (2658, true, 1, '2023-07-03 14:52:50.102747', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR E INOVAÇÃO INVENIO (INVENIO)', 8);
INSERT INTO public.empresa VALUES (2659, true, 1, '2023-07-03 14:52:50.103827', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR E INOVAÇÃO PERSONA', 8);
INSERT INTO public.empresa VALUES (2660, true, 1, '2023-07-03 14:52:50.105002', NULL, NULL, false, 'INSTITUTO DE EDUCACAO SUPERIOR LATINOAMERICANO (SIGLA IESLA)', 2);
INSERT INTO public.empresa VALUES (2661, true, 1, '2023-07-03 14:52:50.106179', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR PRESIDENTE KENNEDY - CENTRO DE FORMAÇÃO DE PROFISSIONAIS DE EDUCAÇÃO (IFESP)', 130);
INSERT INTO public.empresa VALUES (2662, true, 1, '2023-07-03 14:52:50.107312', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR RAIMUNDO SÁ (IESRSA)', 643);
INSERT INTO public.empresa VALUES (2663, true, 1, '2023-07-03 14:52:50.108897', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR UNISUL DE ITAJAÍ', 345);
INSERT INTO public.empresa VALUES (2664, true, 1, '2023-07-03 14:52:50.110438', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO SUPERIOR UNYAHNA DE SALVADOR (IESUS)', 116);
INSERT INTO public.empresa VALUES (2665, true, 1, '2023-07-03 14:52:50.111975', NULL, NULL, false, 'INSTITUTO DE EDUCAÇÃO TECNOLÓGICA EIRELI (IETEC)', 2);
INSERT INTO public.empresa VALUES (2666, true, 1, '2023-07-03 14:52:50.113517', NULL, NULL, false, 'INSTITUTO DE ENSINO E PESQUISA DO HOSPITAL SÍRIO-LIBANÊS (IEP/HSL)', 8);
INSERT INTO public.empresa VALUES (2667, true, 1, '2023-07-03 14:52:50.114716', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR AGOSTINIANO CASA GAIA', 200);
INSERT INTO public.empresa VALUES (2668, true, 1, '2023-07-03 14:52:50.11591', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR BLAURO CARDOSO DE MATTOS (FASERRA)', 290);
INSERT INTO public.empresa VALUES (2669, true, 1, '2023-07-03 14:52:50.11712', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR BRASILEIRO (ESB)', 75);
INSERT INTO public.empresa VALUES (2670, true, 1, '2023-07-03 14:52:50.118309', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR CAPIXABA (IESCAPI)', 290);
INSERT INTO public.empresa VALUES (2671, true, 1, '2023-07-03 14:52:50.119496', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DA FUPESP (IESF)', 113);
INSERT INTO public.empresa VALUES (2672, true, 1, '2023-07-03 14:52:50.120679', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DA GRANDE FLORIANÓPOLIS (IESGF)', 140);
INSERT INTO public.empresa VALUES (2673, true, 1, '2023-07-03 14:52:50.121953', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE ALAGOAS (IESA)', 73);
INSERT INTO public.empresa VALUES (2674, true, 1, '2023-07-03 14:52:50.123165', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE AMERICANA (IESA)', 187);
INSERT INTO public.empresa VALUES (2675, true, 1, '2023-07-03 14:52:50.124355', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE BAURU (IESB)', 93);
INSERT INTO public.empresa VALUES (2676, true, 1, '2023-07-03 14:52:50.12559', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE CUIABÁ', 203);
INSERT INTO public.empresa VALUES (2677, true, 1, '2023-07-03 14:52:50.126892', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE FORTALEZA (IESF)', 45);
INSERT INTO public.empresa VALUES (2678, true, 1, '2023-07-03 14:52:50.128156', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE FOZ DO IGUAÇU (IESFI)', 124);
INSERT INTO public.empresa VALUES (2679, true, 1, '2023-07-03 14:52:50.129425', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE LONDRINA - INESUL (INESUL)', 159);
INSERT INTO public.empresa VALUES (2680, true, 1, '2023-07-03 14:52:50.130631', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE MINAS GERAIS (IESMIG)', 761);
INSERT INTO public.empresa VALUES (2681, true, 1, '2023-07-03 14:52:50.13188', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE OLINDA (IESO)', 39);
INSERT INTO public.empresa VALUES (2682, true, 1, '2023-07-03 14:52:50.133053', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE RONDÔNIA (IESUR)', 151);
INSERT INTO public.empresa VALUES (2683, true, 1, '2023-07-03 14:52:50.134253', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DE TERESINA (IEST)', 27);
INSERT INTO public.empresa VALUES (2684, true, 1, '2023-07-03 14:52:50.135427', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DO AMAPÁ (IESAP)', 26);
INSERT INTO public.empresa VALUES (2685, true, 1, '2023-07-03 14:52:50.136688', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR DO SUL DO MARANHÃO (IESMA)', 267);
INSERT INTO public.empresa VALUES (2686, true, 1, '2023-07-03 14:52:50.138279', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR E FORMAÇÃO AVANÇADA DE VITÓRIA (IESFAVI)', 25);
INSERT INTO public.empresa VALUES (2687, true, 1, '2023-07-03 14:52:50.139602', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR FRANCISCANO (IESF)', 762);
INSERT INTO public.empresa VALUES (2688, true, 1, '2023-07-03 14:52:50.140817', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR FUCAPI (CESF)', 75);
INSERT INTO public.empresa VALUES (2689, true, 1, '2023-07-03 14:52:50.141962', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR INTEGRADO-IESI (FENORD)', 7);
INSERT INTO public.empresa VALUES (2690, true, 1, '2023-07-03 14:52:50.143184', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR MATERDEI (IES-MATERDEI)', 75);
INSERT INTO public.empresa VALUES (2691, true, 1, '2023-07-03 14:52:50.144364', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR MÚLTIPLO (IESM)', 456);
INSERT INTO public.empresa VALUES (2692, true, 1, '2023-07-03 14:52:50.145541', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR PLANALTO (IESPLAN)', 5);
INSERT INTO public.empresa VALUES (2693, true, 1, '2023-07-03 14:52:50.146765', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR SANTA CECÍLIA (IESC)', 333);
INSERT INTO public.empresa VALUES (2694, true, 1, '2023-07-03 14:52:50.147999', NULL, NULL, false, 'INSTITUTO DE ENSINO SUPERIOR SANTO ANTÔNIO (INESA)', 68);
INSERT INTO public.empresa VALUES (2695, true, 1, '2023-07-03 14:52:50.149209', NULL, NULL, false, 'INSTITUTO DE ESTUDOS SUPERIORES DO MARANHÃO (IESMA)', 141);
INSERT INTO public.empresa VALUES (2696, true, 1, '2023-07-03 14:52:50.150427', NULL, NULL, false, 'INSTITUTO DE FILOSOFIA E TEOLOGIA DE GOIÁS (IFITEG)', 42);
INSERT INTO public.empresa VALUES (2697, true, 1, '2023-07-03 14:52:50.151627', NULL, NULL, false, 'INSTITUTO DE PESQUISAS, ENSINO E GESTÃO EM SAÚDE (IPGS)', 149);
INSERT INTO public.empresa VALUES (2698, true, 1, '2023-07-03 14:52:50.152889', NULL, NULL, false, 'INSTITUTO DE PÓS-GRADUAÇÃO E ATUALIZAÇÃO EM ODONTOLOGIA (IPENO)', 3);
INSERT INTO public.empresa VALUES (2699, true, 1, '2023-07-03 14:52:50.154134', NULL, NULL, false, 'INSTITUTO DE SERRA DOURADA', 22);
INSERT INTO public.empresa VALUES (2700, true, 1, '2023-07-03 14:52:50.155288', NULL, NULL, false, 'INSTITUTO DE TECNOLOGIA E LIDERANÇA (INTELI)', 8);
INSERT INTO public.empresa VALUES (2701, true, 1, '2023-07-03 14:52:50.156618', NULL, NULL, false, 'INSTITUTO DO SUL DE SANTA CATARINA', 192);
INSERT INTO public.empresa VALUES (2702, true, 1, '2023-07-03 14:52:50.157902', NULL, NULL, false, 'INSTITUTO EDUCACIONAL DAS AMÉRICAS (IEA EDUCACIONAL)', 149);
INSERT INTO public.empresa VALUES (2703, true, 1, '2023-07-03 14:52:50.159168', NULL, NULL, false, 'INSTITUTO EDUCACIONAL MONTE PASCOAL', 42);
INSERT INTO public.empresa VALUES (2704, true, 1, '2023-07-03 14:52:50.160386', NULL, NULL, false, 'INSTITUTO ESPERANÇA DE ENSINO SUPERIOR (IESPES)', 78);
INSERT INTO public.empresa VALUES (2705, true, 1, '2023-07-03 14:52:50.161626', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA BAIANO (IFBAIANO)', 116);
INSERT INTO public.empresa VALUES (2706, true, 1, '2023-07-03 14:52:50.162838', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA CATARINENSE (IF CATARINENSE)', 193);
INSERT INTO public.empresa VALUES (2707, true, 1, '2023-07-03 14:52:50.164032', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DA BAHIA (IFBA)', 116);
INSERT INTO public.empresa VALUES (2708, true, 1, '2023-07-03 14:52:50.165249', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DA PARAÍBA (IFPB)', 107);
INSERT INTO public.empresa VALUES (2709, true, 1, '2023-07-03 14:52:50.166545', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE ALAGOAS (IFAL)', 73);
INSERT INTO public.empresa VALUES (2710, true, 1, '2023-07-03 14:52:50.167748', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIENCIA E TECNOLOGIA DE BRASILIA (IFB)', 5);
INSERT INTO public.empresa VALUES (2711, true, 1, '2023-07-03 14:52:50.168973', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE GOIÁS (IFG)', 42);
INSERT INTO public.empresa VALUES (2712, true, 1, '2023-07-03 14:52:50.1701', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MATO GROSSO (IFMT)', 203);
INSERT INTO public.empresa VALUES (2713, true, 1, '2023-07-03 14:52:50.171395', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MATO GROSSO DO SUL (IFMS)', 48);
INSERT INTO public.empresa VALUES (2714, true, 1, '2023-07-03 14:52:50.172621', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MINAS GERAIS (IFMG)', 2);
INSERT INTO public.empresa VALUES (2715, true, 1, '2023-07-03 14:52:50.173844', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE PERNAMBUCO (IFPE)', 60);
INSERT INTO public.empresa VALUES (2716, true, 1, '2023-07-03 14:52:50.17505', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO CIÊNCIA E TECNOLOGIA DE RONDÔNIA (IFRO)', 51);
INSERT INTO public.empresa VALUES (2717, true, 1, '2023-07-03 14:52:50.176228', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE RORAIMA (IFRR)', 138);
INSERT INTO public.empresa VALUES (2718, true, 1, '2023-07-03 14:52:50.177406', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SANTA CATARINA (IFSC)', 3);
INSERT INTO public.empresa VALUES (2719, true, 1, '2023-07-03 14:52:50.178609', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SÃO PAULO (IFSP)', 8);
INSERT INTO public.empresa VALUES (2720, true, 1, '2023-07-03 14:52:50.179812', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SERGIPE (IFS)', 142);
INSERT INTO public.empresa VALUES (2721, true, 1, '2023-07-03 14:52:50.18098', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO ACRE (IFAC)', 143);
INSERT INTO public.empresa VALUES (2722, true, 1, '2023-07-03 14:52:50.1822', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO AMAPÁ (IFAP)', 26);
INSERT INTO public.empresa VALUES (2723, true, 1, '2023-07-03 14:52:50.183376', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO AMAZONAS (IFAM)', 75);
INSERT INTO public.empresa VALUES (2724, true, 1, '2023-07-03 14:52:50.18455', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO CEARÁ (IFCE)', 45);
INSERT INTO public.empresa VALUES (2725, true, 1, '2023-07-03 14:52:50.185762', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO ESPÍRITO SANTO (IFES)', 25);
INSERT INTO public.empresa VALUES (2726, true, 1, '2023-07-03 14:52:50.186972', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO MARANHÃO (IFMA)', 141);
INSERT INTO public.empresa VALUES (2727, true, 1, '2023-07-03 14:52:50.188138', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO NORTE DE MINAS GERAIS (IFNMG)', 128);
INSERT INTO public.empresa VALUES (2728, true, 1, '2023-07-03 14:52:50.189362', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PARÁ (IFPA)', 79);
INSERT INTO public.empresa VALUES (2729, true, 1, '2023-07-03 14:52:50.190538', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PARANÁ (IFPR)', 56);
INSERT INTO public.empresa VALUES (2730, true, 1, '2023-07-03 14:52:50.191702', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PIAUÍ (IFPI)', 27);
INSERT INTO public.empresa VALUES (2731, true, 1, '2023-07-03 14:52:50.192916', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO DE JANEIRO (IFRJ)', 12);
INSERT INTO public.empresa VALUES (2732, true, 1, '2023-07-03 14:52:50.194077', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO GRANDE DO NORTE (IFRN)', 130);
INSERT INTO public.empresa VALUES (2733, true, 1, '2023-07-03 14:52:50.19531', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO GRANDE DO SUL (IFRS)', 77);
INSERT INTO public.empresa VALUES (2734, true, 1, '2023-07-03 14:52:50.196493', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SERTÃO PERNAMBUCANO (IF SERTÃO)', 445);
INSERT INTO public.empresa VALUES (2735, true, 1, '2023-07-03 14:52:50.198001', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SUDESTE DE MINAS GERAIS (IFSEMG)', 38);
INSERT INTO public.empresa VALUES (2736, true, 1, '2023-07-03 14:52:50.199529', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SUL DE MINAS GERAIS (IF SUL DE MINAS)', 230);
INSERT INTO public.empresa VALUES (2737, true, 1, '2023-07-03 14:52:50.20104', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO TOCANTINS (IFTO)', 23);
INSERT INTO public.empresa VALUES (2738, true, 1, '2023-07-03 14:52:50.202593', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO TRIÂNGULO MINEIRO (IFTM)', 118);
INSERT INTO public.empresa VALUES (2739, true, 1, '2023-07-03 14:52:50.203875', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA FARROUPILHA (IFFARROUPILHA)', 417);
INSERT INTO public.empresa VALUES (2740, true, 1, '2023-07-03 14:52:50.205108', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA FLUMINENSE (IF FLUMINENSE)', 160);
INSERT INTO public.empresa VALUES (2741, true, 1, '2023-07-03 14:52:50.206359', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA GOIANO (IF GOIANO)', 42);
INSERT INTO public.empresa VALUES (2742, true, 1, '2023-07-03 14:52:50.207622', NULL, NULL, false, 'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA SUL-RIO-GRANDENSE (IFSUL)', 283);
INSERT INTO public.empresa VALUES (2743, true, 1, '2023-07-03 14:52:50.208831', NULL, NULL, false, 'INSTITUTO FLORENCE DE ENSINO SUPERIOR (IFES)', 141);
INSERT INTO public.empresa VALUES (2744, true, 1, '2023-07-03 14:52:50.210082', NULL, NULL, false, 'INSTITUTO FRIBURGO DE ENSINO SUPERIOR (IFES)', 8);
INSERT INTO public.empresa VALUES (2745, true, 1, '2023-07-03 14:52:50.211302', NULL, NULL, false, 'INSTITUTO GOIANO DE DIREITO (IGD)', 42);
INSERT INTO public.empresa VALUES (2746, true, 1, '2023-07-03 14:52:50.212518', NULL, NULL, false, 'INSTITUTO INFNET RIO DE JANEIRO (INFNET)', 12);
INSERT INTO public.empresa VALUES (2747, true, 1, '2023-07-03 14:52:50.213735', NULL, NULL, false, 'INSTITUTO INTERNACIONAL DE ESTUDOS EM SAUDE (IIESAU)', 58);
INSERT INTO public.empresa VALUES (2748, true, 1, '2023-07-03 14:52:50.214905', NULL, NULL, false, 'INSTITUTO ITAPETININGANO DE ENSINO SUPERIOR (IIES)', 271);
INSERT INTO public.empresa VALUES (2749, true, 1, '2023-07-03 14:52:50.216098', NULL, NULL, false, 'INSTITUTO LEGISLATIVO BRASILEIRO (ILB)', 5);
INSERT INTO public.empresa VALUES (2750, true, 1, '2023-07-03 14:52:50.217251', NULL, NULL, false, 'INSTITUTO LEYA DE EDUCAÇÃO SUPERIOR (LEYA)', 5);
INSERT INTO public.empresa VALUES (2751, true, 1, '2023-07-03 14:52:50.218478', NULL, NULL, false, 'INSTITUTO LUTERANO DE ENSINO SUPERIOR DE ITUMBIARA (ILES)', 234);
INSERT INTO public.empresa VALUES (2752, true, 1, '2023-07-03 14:52:50.219634', NULL, NULL, false, 'INSTITUTO MACAPAENSE DE ENSINO SUPERIOR (IMMES)', 26);
INSERT INTO public.empresa VALUES (2753, true, 1, '2023-07-03 14:52:50.220822', NULL, NULL, false, 'INSTITUTO MACHADENSE DE ENSINO SUPERIOR (IMES)', 35);
INSERT INTO public.empresa VALUES (2754, true, 1, '2023-07-03 14:52:50.222026', NULL, NULL, false, 'INSTITUTO MARANHENSE DE ENSINO E CULTURA (IMEC)', 141);
INSERT INTO public.empresa VALUES (2755, true, 1, '2023-07-03 14:52:50.223266', NULL, NULL, false, 'INSTITUTO MATONENSE MUNICIPAL DE ENSINO SUPERIOR (IMMES)', 278);
INSERT INTO public.empresa VALUES (2756, true, 1, '2023-07-03 14:52:50.224438', NULL, NULL, false, 'INSTITUTO METROPOLITANO DE ENSINO SUPERIOR (IMES)', 268);
INSERT INTO public.empresa VALUES (2757, true, 1, '2023-07-03 14:52:50.2257', NULL, NULL, false, 'INSTITUTO MILITAR DE ENGENHARIA (IME)', 12);
INSERT INTO public.empresa VALUES (2758, true, 1, '2023-07-03 14:52:50.226865', NULL, NULL, false, 'INSTITUTO MOINHOS DE VENTO', 149);
INSERT INTO public.empresa VALUES (2759, true, 1, '2023-07-03 14:52:50.228127', NULL, NULL, false, 'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE ASSIS (IMESA)', 379);
INSERT INTO public.empresa VALUES (2760, true, 1, '2023-07-03 14:52:50.229397', NULL, NULL, false, 'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE BEBEDOURO VICTÓRIO CARDASSI (IMESB)', 208);
INSERT INTO public.empresa VALUES (2761, true, 1, '2023-07-03 14:52:50.230599', NULL, NULL, false, 'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE CATANDUVA (IMES CATANDUVA)', 181);
INSERT INTO public.empresa VALUES (2762, true, 1, '2023-07-03 14:52:50.231748', NULL, NULL, false, 'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE SÃO MANUEL (IMESSM)', 631);
INSERT INTO public.empresa VALUES (2763, true, 1, '2023-07-03 14:52:50.232991', NULL, NULL, false, 'INSTITUTO NACIONAL DE EDUCAÇÃO DE SURDOS (INES)', 12);
INSERT INTO public.empresa VALUES (2764, true, 1, '2023-07-03 14:52:50.234166', NULL, NULL, false, 'INSTITUTO NACIONAL DE ENSINO SUPERIOR E PÓS-GRADUAÇÃO PADRE GERVÁSIO (INAPÓS)', 230);
INSERT INTO public.empresa VALUES (2765, true, 1, '2023-07-03 14:52:50.235418', NULL, NULL, false, 'INSTITUTO NACIONAL DE TELECOMUNICAÇÕES (INATEL)', 753);
INSERT INTO public.empresa VALUES (2766, true, 1, '2023-07-03 14:52:50.236599', NULL, NULL, false, 'INSTITUTO PARAIBANO DE ENSINO RENOVADO (INPER)', 107);
INSERT INTO public.empresa VALUES (2767, true, 1, '2023-07-03 14:52:50.238047', NULL, NULL, false, 'INSTITUTO PLENITUDE EDUCAÇÃO (IPLENI)', 8);
INSERT INTO public.empresa VALUES (2768, true, 1, '2023-07-03 14:52:50.239149', NULL, NULL, false, 'INSTITUTO POLITÉCNICO DOCTUM DE VITÓRIA', 25);
INSERT INTO public.empresa VALUES (2769, true, 1, '2023-07-03 14:52:50.240472', NULL, NULL, false, 'INSTITUTO PROFESSOR FLÁVIO VELLINI', 8);
INSERT INTO public.empresa VALUES (2770, true, 1, '2023-07-03 14:52:50.241736', NULL, NULL, false, 'INSTITUTO RACINE DE EDUCAÇÃO SUPERIOR (RACINE)', 278);
INSERT INTO public.empresa VALUES (2771, true, 1, '2023-07-03 14:52:50.243247', NULL, NULL, false, 'INSTITUTO SALVADOR DE ENSINO E CULTURA (ISEC)', 116);
INSERT INTO public.empresa VALUES (2772, true, 1, '2023-07-03 14:52:50.244779', NULL, NULL, false, 'INSTITUTO SANTO TOMÁS DE AQUINO (ISTA)', 2);
INSERT INTO public.empresa VALUES (2773, true, 1, '2023-07-03 14:52:50.246253', NULL, NULL, false, 'INSTITUTO SÃO PAULO DE ESTUDOS SUPERIORES (ITESP)', 8);
INSERT INTO public.empresa VALUES (2774, true, 1, '2023-07-03 14:52:50.247725', NULL, NULL, false, 'INSTITUTO SERRA DOURADA', 14);
INSERT INTO public.empresa VALUES (2775, true, 1, '2023-07-03 14:52:50.249186', NULL, NULL, false, 'INSTITUTO SERZEDELLO CORRÊA (ISC-TCU)', 5);
INSERT INTO public.empresa VALUES (2776, true, 1, '2023-07-03 14:52:50.250559', NULL, NULL, false, 'INSTITUTO SOCIESC DE JARAGUÁ DO SUL (SOCIESC)', 31);
INSERT INTO public.empresa VALUES (2777, true, 1, '2023-07-03 14:52:50.25192', NULL, NULL, false, 'INSTITUTO SUPERIOR DA AFAC (ISAFAC)', 49);
INSERT INTO public.empresa VALUES (2778, true, 1, '2023-07-03 14:52:50.253142', NULL, NULL, false, 'INSTITUTO SUPERIOR DA CONVENÇÃO NAC. DAS ASSEMBLEIAS DE DEUS (ISCON)', 5);
INSERT INTO public.empresa VALUES (2779, true, 1, '2023-07-03 14:52:50.254335', NULL, NULL, false, 'INSTITUTO SUPERIOR DE CIÊNCIAS APLICADAS - ISCA (ISCA)', 276);
INSERT INTO public.empresa VALUES (2780, true, 1, '2023-07-03 14:52:50.255589', NULL, NULL, false, 'INSTITUTO SUPERIOR DE CIÊNCIAS DA SAÚDE CARLOS CHAGAS (IPGMCC)', 12);
INSERT INTO public.empresa VALUES (2781, true, 1, '2023-07-03 14:52:50.256855', NULL, NULL, false, 'INSTITUTO SUPERIOR DE CIÊNCIAS HUMANAS E SOCIAIS ANÍSIO TEIXEIRA (ISAT)', 623);
INSERT INTO public.empresa VALUES (2782, true, 1, '2023-07-03 14:52:50.258272', NULL, NULL, false, 'INSTITUTO SUPERIOR DE CIENCIAS POLICIAIS (ISCP)', 5);
INSERT INTO public.empresa VALUES (2783, true, 1, '2023-07-03 14:52:50.259631', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ALBERT EINSTEIN (ISALBE)', 5);
INSERT INTO public.empresa VALUES (2784, true, 1, '2023-07-03 14:52:50.261191', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ALMEIDA RODRIGUES (ISEAR)', 202);
INSERT INTO public.empresa VALUES (2785, true, 1, '2023-07-03 14:52:50.262647', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ANTONINO FREIRE - ISEAF (ISEAF)', 27);
INSERT INTO public.empresa VALUES (2786, true, 1, '2023-07-03 14:52:50.264089', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ATENEU (ISEAT)', 226);
INSERT INTO public.empresa VALUES (2787, true, 1, '2023-07-03 14:52:50.265503', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO CERES (ISE-CERES)', 114);
INSERT INTO public.empresa VALUES (2788, true, 1, '2023-07-03 14:52:50.266862', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DA ZONA OESTE (ISE ZONA OESTE)', 12);
INSERT INTO public.empresa VALUES (2789, true, 1, '2023-07-03 14:52:50.268155', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE BARRETOS (ISEB)', 80);
INSERT INTO public.empresa VALUES (2790, true, 1, '2023-07-03 14:52:50.269398', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE CAXIAS (ISEC)', 97);
INSERT INTO public.empresa VALUES (2791, true, 1, '2023-07-03 14:52:50.270587', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE GOIANA (I.S.E.G.)', 400);
INSERT INTO public.empresa VALUES (2792, true, 1, '2023-07-03 14:52:50.271966', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE GUARATUBA (ISEPE GUARATUBA)', 559);
INSERT INTO public.empresa VALUES (2793, true, 1, '2023-07-03 14:52:50.273772', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DE SÃO PAULO (SINGULARIDADES/ISESP)', 8);
INSERT INTO public.empresa VALUES (2794, true, 1, '2023-07-03 14:52:50.275681', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO CECAP (ISCECAP)', 5);
INSERT INTO public.empresa VALUES (2795, true, 1, '2023-07-03 14:52:50.277442', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO CENTRO EDUCACIONAL NOSSA SENHORA AUXILIADORA (ISECENSA)', 160);
INSERT INTO public.empresa VALUES (2796, true, 1, '2023-07-03 14:52:50.279041', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO MUNICÍPIO DE ITAPERUNA (ISEMI)', 186);
INSERT INTO public.empresa VALUES (2797, true, 1, '2023-07-03 14:52:50.28065', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO RIO DE JANEIRO (ISERJ)', 12);
INSERT INTO public.empresa VALUES (2798, true, 1, '2023-07-03 14:52:50.282169', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO SERTÃO DO PAJEÚ (ISESP)', 574);
INSERT INTO public.empresa VALUES (2799, true, 1, '2023-07-03 14:52:50.283671', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO DO SUL DO PIAUÍ (ISESPI)', 763);
INSERT INTO public.empresa VALUES (2800, true, 1, '2023-07-03 14:52:50.285274', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO ELVIRA DAYRELL (ISEED)', 578);
INSERT INTO public.empresa VALUES (2801, true, 1, '2023-07-03 14:52:50.286992', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO IBITURUNA', 128);
INSERT INTO public.empresa VALUES (2802, true, 1, '2023-07-03 14:52:50.288647', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO IVOTI (ISEI)', 764);
INSERT INTO public.empresa VALUES (2803, true, 1, '2023-07-03 14:52:50.290327', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO OCIDENTE (OCIDEMNTE)', 116);
INSERT INTO public.empresa VALUES (2804, true, 1, '2023-07-03 14:52:50.291985', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO PROFESSOR ALDO MUYLAERT (ISEPAM)', 160);
INSERT INTO public.empresa VALUES (2805, true, 1, '2023-07-03 14:52:50.29376', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO PROFESSORA NAIR FORTES ABU-MERHY (ISEFOR)', 397);
INSERT INTO public.empresa VALUES (2806, true, 1, '2023-07-03 14:52:50.295663', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO PRÓ-SABER (ISEPS)', 12);
INSERT INTO public.empresa VALUES (2807, true, 1, '2023-07-03 14:52:50.297798', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO SANTA CRUZ (ISED)', 687);
INSERT INTO public.empresa VALUES (2808, true, 1, '2023-07-03 14:52:50.299845', NULL, NULL, false, 'INSTITUTO SUPERIOR DE EDUCAÇÃO VERA CRUZ (ISE VERA CRUZ)', 8);
INSERT INTO public.empresa VALUES (2809, true, 1, '2023-07-03 14:52:50.30186', NULL, NULL, false, 'INSTITUTO SUPERIOR DE FILOSOFIA BERTHIER (IFIBE)', 282);
INSERT INTO public.empresa VALUES (2810, true, 1, '2023-07-03 14:52:50.304015', NULL, NULL, false, 'INSTITUTO SUPERIOR DE TECNOLOGIA EM HORTICULTURA (ISTHORTICULTURA)', 160);
INSERT INTO public.empresa VALUES (2811, true, 1, '2023-07-03 14:52:50.305804', NULL, NULL, false, 'INSTITUTO SUPERIOR DO LITORAL DO PARANÁ (ISULPAR)', 661);
INSERT INTO public.empresa VALUES (2812, true, 1, '2023-07-03 14:52:50.307497', NULL, NULL, false, 'INSTITUTO SUPERIOR DO MINISTERIO PUBLICO (ISMP)', 12);
INSERT INTO public.empresa VALUES (2813, true, 1, '2023-07-03 14:52:50.309015', NULL, NULL, false, 'INSTITUTO SUPERIOR E CENTRO EDUCACIONAL LUTERANO - BOM JESUS - IELUSC (BOM JESUS/IELUSC)', 68);
INSERT INTO public.empresa VALUES (2814, true, 1, '2023-07-03 14:52:50.310567', NULL, NULL, false, 'INSTITUTO TAQUARITINGUENSE DE ENSINO SUPERIOR DR. ARISTIDES DE CARVALHO SCHLOBACH (ITES)', 517);
INSERT INTO public.empresa VALUES (2815, true, 1, '2023-07-03 14:52:50.312118', NULL, NULL, false, 'INSTITUTO TAUBATÉ DE ENSINO SUPERIOR (I.T.E.S.)', 33);
INSERT INTO public.empresa VALUES (2816, true, 1, '2023-07-03 14:52:50.313617', NULL, NULL, false, 'INSTITUTO TECNOLÓGICO DE AERONÁUTICA (ITA)', 144);
INSERT INTO public.empresa VALUES (2817, true, 1, '2023-07-03 14:52:50.315098', NULL, NULL, false, 'INSTITUTO TECNOLÓGICO E DAS CIÊNCIAS SOCIAIS APLICADAS E DA SAÚDE DO CENTRO EDUC. N. SRª AUXILIADORA (ITCSAS/CENSA)', 160);
INSERT INTO public.empresa VALUES (2818, true, 1, '2023-07-03 14:52:50.316597', NULL, NULL, false, 'INSTITUTO TEOLÓGICO FRANCISCANO (ITF)', 53);
INSERT INTO public.empresa VALUES (2819, true, 1, '2023-07-03 14:52:50.318071', NULL, NULL, false, 'INSTITUTO TOCANTINENSE PRESIDENTE ANTONIO CARLOS (ITPAC)', 23);
INSERT INTO public.empresa VALUES (2820, true, 1, '2023-07-03 14:52:50.319575', NULL, NULL, false, 'INSTITUTO UNA DE ITABIRA (UNA)', 161);
INSERT INTO public.empresa VALUES (2821, true, 1, '2023-07-03 14:52:50.321384', NULL, NULL, false, 'INSTITUTO UNIVERSITÁRIO SÃO JUDAS DE GUARULHOS', 100);
INSERT INTO public.empresa VALUES (2822, true, 1, '2023-07-03 14:52:50.323018', NULL, NULL, false, 'INSTITUTO UNIVERSITÁRIO SÃO JUDAS DE SÃO BERNARDO DO CAMPO', 82);
INSERT INTO public.empresa VALUES (2823, true, 1, '2023-07-03 14:52:50.324713', NULL, NULL, false, 'INSTITUTO UNIVERSITÁRIO UNA DE CATALÃO (CATALANA)', 17);
INSERT INTO public.empresa VALUES (2824, true, 1, '2023-07-03 14:52:50.326378', NULL, NULL, false, 'INSTITUTO UNIVERSITÁRIO UNA DE CONSELHEIRO LAFAIETE', 18);
INSERT INTO public.empresa VALUES (2825, true, 1, '2023-07-03 14:52:50.328136', NULL, NULL, false, 'INTERNATIONAL OROFACIAL ACADEMY RP (IOA RP)', 58);
INSERT INTO public.empresa VALUES (2826, true, 1, '2023-07-03 14:52:50.329757', NULL, NULL, false, 'IPD INSTITUTO DE PROFISSIONALIZAÇÃO DIGITAL (IPD)', 8);
INSERT INTO public.empresa VALUES (2827, true, 1, '2023-07-03 14:52:50.331521', NULL, NULL, false, 'IPOG - INSTITUTO DE PÓS-GRADUAÇÃO & GRADUAÇÃO (IPOG)', 42);
INSERT INTO public.empresa VALUES (2828, true, 1, '2023-07-03 14:52:50.333132', NULL, NULL, false, 'ISTITUTO EUROPEO DI DESIGN (IED SP)', 8);
INSERT INTO public.empresa VALUES (2829, true, 1, '2023-07-03 14:52:50.334631', NULL, NULL, false, 'ITPAC CRUZEIRO DO SUL (ITPAC - CZ)', 431);
INSERT INTO public.empresa VALUES (2830, true, 1, '2023-07-03 14:52:50.336086', NULL, NULL, false, 'ITPAC ITACOATIARA (ITPAC ITA)', 637);
INSERT INTO public.empresa VALUES (2831, true, 1, '2023-07-03 14:52:50.337605', NULL, NULL, false, 'ITPAC MANACAPURU (ITPAC MANACA)', 262);
INSERT INTO public.empresa VALUES (2832, true, 1, '2023-07-03 14:52:50.339092', NULL, NULL, false, 'L2 LABOR (L2 LABOR)', 765);
INSERT INTO public.empresa VALUES (2833, true, 1, '2023-07-03 14:52:50.340805', NULL, NULL, false, 'LIBERTAS - FACULDADES INTEGRADAS (LIBERTAS)', 316);
INSERT INTO public.empresa VALUES (2834, true, 1, '2023-07-03 14:52:50.342374', NULL, NULL, false, 'LINK SCHOOL OF BUSINESS (LSB)', 8);
INSERT INTO public.empresa VALUES (2835, true, 1, '2023-07-03 14:52:50.343997', NULL, NULL, false, 'NOVA FACULDADE (NF)', 200);
INSERT INTO public.empresa VALUES (2836, true, 1, '2023-07-03 14:52:50.345557', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE CAMPINAS (PUC-CAMPINAS)', 177);
INSERT INTO public.empresa VALUES (2837, true, 1, '2023-07-03 14:52:50.347135', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE GOIÁS (PUC GOIÁS)', 42);
INSERT INTO public.empresa VALUES (2838, true, 1, '2023-07-03 14:52:50.348704', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE MINAS GERAIS (PUC MINAS)', 2);
INSERT INTO public.empresa VALUES (2839, true, 1, '2023-07-03 14:52:50.350464', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE SÃO PAULO (PUCSP)', 8);
INSERT INTO public.empresa VALUES (2840, true, 1, '2023-07-03 14:52:50.352214', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO PARANÁ (PUCPR)', 56);
INSERT INTO public.empresa VALUES (2841, true, 1, '2023-07-03 14:52:50.353813', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO RIO DE JANEIRO (PUC-RIO)', 12);
INSERT INTO public.empresa VALUES (2842, true, 1, '2023-07-03 14:52:50.355325', NULL, NULL, false, 'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO RIO GRANDE DO SUL (PUCRS)', 149);
INSERT INTO public.empresa VALUES (2843, true, 1, '2023-07-03 14:52:50.356869', NULL, NULL, false, 'PROFESSOR EDSON ANTÔNIO VELANO (UNIFENAS)', 674);
INSERT INTO public.empresa VALUES (2844, true, 1, '2023-07-03 14:52:50.358484', NULL, NULL, false, 'RATIO - FACULDADE TEOLÓGICA E FILOSÓFICA (RATIO)', 45);
INSERT INTO public.empresa VALUES (2845, true, 1, '2023-07-03 14:52:50.360241', NULL, NULL, false, 'REAL FACULDADE DE BRASÍLIA (FU)', 5);
INSERT INTO public.empresa VALUES (2846, true, 1, '2023-07-03 14:52:50.361941', NULL, NULL, false, 'SINAL FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS (SINAL)', 143);
INSERT INTO public.empresa VALUES (2847, true, 1, '2023-07-03 14:52:50.363652', NULL, NULL, false, 'SIRIUS ESCOLA SUPERIOR DE TECNOLOGIA (SIRIUS)', 2);
INSERT INTO public.empresa VALUES (2848, true, 1, '2023-07-03 14:52:50.365485', NULL, NULL, false, 'SISTEMA EDUCACIONAL CORPORATIVO DA PETROBRAS', 12);
INSERT INTO public.empresa VALUES (2849, true, 1, '2023-07-03 14:52:50.367057', NULL, NULL, false, 'SISTEMAS DE ENSINO EM CIÊNCIAS E TECNOLOGIAS (SECTRAS)', 107);
INSERT INTO public.empresa VALUES (2850, true, 1, '2023-07-03 14:52:50.368628', NULL, NULL, false, 'SOBERANA FACULDADE DE SAÚDE DE PETROLINA (SOBERANA)', 445);
INSERT INTO public.empresa VALUES (2851, true, 1, '2023-07-03 14:52:50.370244', NULL, NULL, false, 'SOBRESP - FACULDADE DE CIÊNCIAS DA SAÚDE (SOBRESP)', 417);
INSERT INTO public.empresa VALUES (2852, true, 1, '2023-07-03 14:52:50.371768', NULL, NULL, false, 'STRONG BUSINESS SCHOOL', 47);
INSERT INTO public.empresa VALUES (2853, true, 1, '2023-07-03 14:52:50.373223', NULL, NULL, false, 'STRONG BUSINESS SCHOOL BS', 171);
INSERT INTO public.empresa VALUES (2854, true, 1, '2023-07-03 14:52:50.374716', NULL, NULL, false, 'SUSTENTARE ESCOLA DE NEGÓCIOS (SUSTENTARE)', 68);
INSERT INTO public.empresa VALUES (2855, true, 1, '2023-07-03 14:52:50.376259', NULL, NULL, false, 'SVT FACULDADE DE ENSINO SUPERIOR (SVT)', 141);
INSERT INTO public.empresa VALUES (2856, true, 1, '2023-07-03 14:52:50.377891', NULL, NULL, false, 'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS (TREVISAN)', 8);
INSERT INTO public.empresa VALUES (2857, true, 1, '2023-07-03 14:52:50.379474', NULL, NULL, false, 'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS', 12);
INSERT INTO public.empresa VALUES (2858, true, 1, '2023-07-03 14:52:50.381094', NULL, NULL, false, 'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS- (TEN)', 766);
INSERT INTO public.empresa VALUES (2859, true, 1, '2023-07-03 14:52:50.382627', NULL, NULL, false, 'UGV CENTRO UNIVERSITÁRIO', 119);
INSERT INTO public.empresa VALUES (2860, true, 1, '2023-07-03 14:52:50.384203', NULL, NULL, false, 'UNAMA FACULDADE DA AMAZÔNIA DE BOA VISTA (UNAMA)', 138);
INSERT INTO public.empresa VALUES (2861, true, 1, '2023-07-03 14:52:50.385669', NULL, NULL, false, 'UNAMA FACULDADE DA AMAZÔNIA DE MACAPÁ', 26);
INSERT INTO public.empresa VALUES (2862, true, 1, '2023-07-03 14:52:50.387327', NULL, NULL, false, 'UNAMA FACULDADE DA AMAZÔNIA DE RIO BRANCO (FMN RIO BRANCO)', 143);
INSERT INTO public.empresa VALUES (2863, true, 1, '2023-07-03 14:52:50.388983', NULL, NULL, false, 'UNETRI FACULDADES (UNETRI)', 767);
INSERT INTO public.empresa VALUES (2864, true, 1, '2023-07-03 14:52:50.390567', NULL, NULL, false, 'UNIÃO DAS FACULDADES DOS GRANDES LAGOS (UNILAGO)', 114);
INSERT INTO public.empresa VALUES (2865, true, 1, '2023-07-03 14:52:50.392081', NULL, NULL, false, 'UNICORP FACULDADES (UNICORP)', 107);
INSERT INTO public.empresa VALUES (2866, true, 1, '2023-07-03 14:52:50.393665', NULL, NULL, false, 'UNIVERSIDADE ALTO VALE DO RIO DO PEIXE (UNIARP)', 699);
INSERT INTO public.empresa VALUES (2867, true, 1, '2023-07-03 14:52:50.395159', NULL, NULL, false, 'UNIVERSIDADE ANHANGUERA (UNIDERP)', 48);
INSERT INTO public.empresa VALUES (2868, true, 1, '2023-07-03 14:52:50.396766', NULL, NULL, false, 'UNIVERSIDADE ANHANGUERA DE SÃO PAULO (UNIAN - SP)', 8);
INSERT INTO public.empresa VALUES (2869, true, 1, '2023-07-03 14:52:50.398436', NULL, NULL, false, 'UNIVERSIDADE ANHEMBI MORUMBI (UAM)', 8);
INSERT INTO public.empresa VALUES (2870, true, 1, '2023-07-03 14:52:50.400125', NULL, NULL, false, 'UNIVERSIDADE BRASIL (UB)', 8);
INSERT INTO public.empresa VALUES (2871, true, 1, '2023-07-03 14:52:50.401829', NULL, NULL, false, 'UNIVERSIDADE CÂNDIDO MENDES (UCAM)', 12);
INSERT INTO public.empresa VALUES (2872, true, 1, '2023-07-03 14:52:50.403521', NULL, NULL, false, 'UNIVERSIDADE CASTELO BRANCO (UCB)', 12);
INSERT INTO public.empresa VALUES (2873, true, 1, '2023-07-03 14:52:50.405236', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE BRASÍLIA (UCB)', 5);
INSERT INTO public.empresa VALUES (2874, true, 1, '2023-07-03 14:52:50.40695', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE PELOTAS (UCPEL)', 283);
INSERT INTO public.empresa VALUES (2875, true, 1, '2023-07-03 14:52:50.4089', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE PERNAMBUCO (UNICAP)', 60);
INSERT INTO public.empresa VALUES (2876, true, 1, '2023-07-03 14:52:50.410883', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE PETRÓPOLIS (UCP)', 53);
INSERT INTO public.empresa VALUES (2877, true, 1, '2023-07-03 14:52:50.412534', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DE SANTOS (UNISANTOS)', 171);
INSERT INTO public.empresa VALUES (2878, true, 1, '2023-07-03 14:52:50.414278', NULL, NULL, false, 'UNIVERSIDADE CATÓLICA DOM BOSCO (UCDB)', 48);
INSERT INTO public.empresa VALUES (2879, true, 1, '2023-07-03 14:52:50.416393', NULL, NULL, false, 'UNIVERSIDADE CESUMAR (UNICESUMAR)', 76);
INSERT INTO public.empresa VALUES (2880, true, 1, '2023-07-03 14:52:50.418471', NULL, NULL, false, 'UNIVERSIDADE CEUMA (UNICEUMA)', 141);
INSERT INTO public.empresa VALUES (2881, true, 1, '2023-07-03 14:52:50.42047', NULL, NULL, false, 'UNIVERSIDADE CIDADE DE SÃO PAULO (UNICID)', 8);
INSERT INTO public.empresa VALUES (2882, true, 1, '2023-07-03 14:52:50.422366', NULL, NULL, false, 'UNIVERSIDADE COMUNITÁRIA DA REGIÃO DE CHAPECÓ (UNOCHAPECÓ)', 406);
INSERT INTO public.empresa VALUES (2883, true, 1, '2023-07-03 14:52:50.424004', NULL, NULL, false, 'UNIVERSIDADE CRUZEIRO DO SUL (UNICSUL)', 8);
INSERT INTO public.empresa VALUES (2884, true, 1, '2023-07-03 14:52:50.425602', NULL, NULL, false, 'UNIVERSIDADE DA AMAZÔNIA (UNAMA)', 79);
INSERT INTO public.empresa VALUES (2885, true, 1, '2023-07-03 14:52:50.427373', NULL, NULL, false, 'UNIVERSIDADE DA INTEGRAÇÃO INTERNACIONAL DA LUSOFONIA AFRO-BRASILEIRA (UNILAB)', 768);
INSERT INTO public.empresa VALUES (2886, true, 1, '2023-07-03 14:52:50.429082', NULL, NULL, false, 'UNIVERSIDADE DA REGIÃO DE JOINVILLE (UNIVILLE)', 68);
INSERT INTO public.empresa VALUES (2887, true, 1, '2023-07-03 14:52:50.430937', NULL, NULL, false, 'UNIVERSIDADE DE ARARAQUARA (UNIARA)', 378);
INSERT INTO public.empresa VALUES (2888, true, 1, '2023-07-03 14:52:50.432623', NULL, NULL, false, 'UNIVERSIDADE DE BRASÍLIA (UNB)', 5);
INSERT INTO public.empresa VALUES (2889, true, 1, '2023-07-03 14:52:50.434175', NULL, NULL, false, 'UNIVERSIDADE DE CAXIAS DO SUL (UCS)', 87);
INSERT INTO public.empresa VALUES (2890, true, 1, '2023-07-03 14:52:50.435766', NULL, NULL, false, 'UNIVERSIDADE DE CRUZ ALTA (UNICRUZ)', 769);
INSERT INTO public.empresa VALUES (2891, true, 1, '2023-07-03 14:52:50.437281', NULL, NULL, false, 'UNIVERSIDADE DE CUIABÁ (UNIC/UNIME)', 203);
INSERT INTO public.empresa VALUES (2892, true, 1, '2023-07-03 14:52:50.438794', NULL, NULL, false, 'UNIVERSIDADE DE FORTALEZA (UNIFOR)', 45);
INSERT INTO public.empresa VALUES (2893, true, 1, '2023-07-03 14:52:50.440421', NULL, NULL, false, 'UNIVERSIDADE DE FRANCA (UNIFRAN)', 179);
INSERT INTO public.empresa VALUES (2894, true, 1, '2023-07-03 14:52:50.442176', NULL, NULL, false, 'UNIVERSIDADE DE GURUPI (UNIRG)', 770);
INSERT INTO public.empresa VALUES (2895, true, 1, '2023-07-03 14:52:50.443929', NULL, NULL, false, 'UNIVERSIDADE DE ITAÚNA (UI)', 598);
INSERT INTO public.empresa VALUES (2896, true, 1, '2023-07-03 14:52:50.445635', NULL, NULL, false, 'UNIVERSIDADE DE MARÍLIA (UNIMAR)', 145);
INSERT INTO public.empresa VALUES (2897, true, 1, '2023-07-03 14:52:50.447185', NULL, NULL, false, 'UNIVERSIDADE DE MOGI DAS CRUZES (UMC)', 62);
INSERT INTO public.empresa VALUES (2898, true, 1, '2023-07-03 14:52:50.448753', NULL, NULL, false, 'UNIVERSIDADE DE PASSO FUNDO (UPF)', 282);
INSERT INTO public.empresa VALUES (2899, true, 1, '2023-07-03 14:52:50.450494', NULL, NULL, false, 'UNIVERSIDADE DE PERNAMBUCO (UPE)', 60);
INSERT INTO public.empresa VALUES (2900, true, 1, '2023-07-03 14:52:50.452131', NULL, NULL, false, 'UNIVERSIDADE DE RIBEIRÃO PRETO (UNAERP)', 58);
INSERT INTO public.empresa VALUES (2901, true, 1, '2023-07-03 14:52:50.453625', NULL, NULL, false, 'UNIVERSIDADE DE RIO VERDE (FESURV)', 202);
INSERT INTO public.empresa VALUES (2902, true, 1, '2023-07-03 14:52:50.455223', NULL, NULL, false, 'UNIVERSIDADE DE SANTA CRUZ DO SUL (UNISC)', 561);
INSERT INTO public.empresa VALUES (2903, true, 1, '2023-07-03 14:52:50.456911', NULL, NULL, false, 'UNIVERSIDADE DE SÃO PAULO (USP)', 8);
INSERT INTO public.empresa VALUES (2904, true, 1, '2023-07-03 14:52:50.458993', NULL, NULL, false, 'UNIVERSIDADE DE SOROCABA (UNISO)', 146);
INSERT INTO public.empresa VALUES (2905, true, 1, '2023-07-03 14:52:50.460987', NULL, NULL, false, 'UNIVERSIDADE DE TAUBATÉ (UNITAU)', 33);
INSERT INTO public.empresa VALUES (2906, true, 1, '2023-07-03 14:52:50.462947', NULL, NULL, false, 'UNIVERSIDADE DE UBERABA (UNIUBE)', 118);
INSERT INTO public.empresa VALUES (2907, true, 1, '2023-07-03 14:52:50.465005', NULL, NULL, false, 'UNIVERSIDADE DE VASSOURAS (UNIVASSOURAS)', 771);
INSERT INTO public.empresa VALUES (2908, true, 1, '2023-07-03 14:52:50.466807', NULL, NULL, false, 'UNIVERSIDADE DO CONTESTADO (UNC)', 772);
INSERT INTO public.empresa VALUES (2909, true, 1, '2023-07-03 14:52:50.468758', NULL, NULL, false, 'UNIVERSIDADE DO DISTRITO FEDERAL (UNDF)', 5);
INSERT INTO public.empresa VALUES (2910, true, 1, '2023-07-03 14:52:50.470905', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DA BAHIA (UNEB)', 116);
INSERT INTO public.empresa VALUES (2911, true, 1, '2023-07-03 14:52:50.472492', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DE MATO GROSSO CARLOS ALBERTO REYES MALDONADO - UNEMAT (UNEMAT)', 590);
INSERT INTO public.empresa VALUES (2912, true, 1, '2023-07-03 14:52:50.47416', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DE MINAS GERAIS (UEMG)', 2);
INSERT INTO public.empresa VALUES (2913, true, 1, '2023-07-03 14:52:50.475799', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO AMAPÁ (UEAP)', 26);
INSERT INTO public.empresa VALUES (2914, true, 1, '2023-07-03 14:52:50.477457', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO AMAZONAS (UEA)', 75);
INSERT INTO public.empresa VALUES (2915, true, 1, '2023-07-03 14:52:50.479073', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO PARÁ (UEPA)', 79);
INSERT INTO public.empresa VALUES (2916, true, 1, '2023-07-03 14:52:50.480695', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO (UERJ)', 12);
INSERT INTO public.empresa VALUES (2917, true, 1, '2023-07-03 14:52:50.482302', NULL, NULL, false, 'UNIVERSIDADE DO ESTADO DO RIO GRANDE DO NORTE (UERN)', 323);
INSERT INTO public.empresa VALUES (2918, true, 1, '2023-07-03 14:52:50.483854', NULL, NULL, false, 'UNIVERSIDADE DO EXTREMO SUL CATARINENSE (UNESC)', 192);
INSERT INTO public.empresa VALUES (2919, true, 1, '2023-07-03 14:52:50.485384', NULL, NULL, false, 'UNIVERSIDADE DO GRANDE RIO PROFESSOR JOSÉ DE SOUZA HERDY (UNIGRANRIO)', 436);
INSERT INTO public.empresa VALUES (2920, true, 1, '2023-07-03 14:52:50.487001', NULL, NULL, false, 'UNIVERSIDADE DO OESTE DE SANTA CATARINA (UNOESC)', 773);
INSERT INTO public.empresa VALUES (2921, true, 1, '2023-07-03 14:52:50.488593', NULL, NULL, false, 'UNIVERSIDADE DO OESTE PAULISTA (UNOESTE)', 50);
INSERT INTO public.empresa VALUES (2922, true, 1, '2023-07-03 14:52:50.490286', NULL, NULL, false, 'UNIVERSIDADE DO PLANALTO CATARINENSE (UNIPLAC)', 148);
INSERT INTO public.empresa VALUES (2923, true, 1, '2023-07-03 14:52:50.491999', NULL, NULL, false, 'UNIVERSIDADE DO SUL DE SANTA CATARINA (UNISUL)', 701);
INSERT INTO public.empresa VALUES (2924, true, 1, '2023-07-03 14:52:50.493706', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO ITAJAÍ (UNIVALI)', 345);
INSERT INTO public.empresa VALUES (2925, true, 1, '2023-07-03 14:52:50.495384', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO PARAÍBA (UNIVAP)', 144);
INSERT INTO public.empresa VALUES (2926, true, 1, '2023-07-03 14:52:50.497319', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO RIO DOS SINOS (UNISINOS)', 703);
INSERT INTO public.empresa VALUES (2927, true, 1, '2023-07-03 14:52:50.499372', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO SAPUCAÍ (UNIVÁS)', 230);
INSERT INTO public.empresa VALUES (2928, true, 1, '2023-07-03 14:52:50.501308', NULL, NULL, false, 'UNIVERSIDADE DO VALE DO TAQUARI (UNIVATES)', 774);
INSERT INTO public.empresa VALUES (2929, true, 1, '2023-07-03 14:52:50.502992', NULL, NULL, false, 'UNIVERSIDADE ESTÁCIO DE SÁ (UNESA)', 12);
INSERT INTO public.empresa VALUES (2930, true, 1, '2023-07-03 14:52:50.504687', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DA PARAÍBA (UEPB)', 147);
INSERT INTO public.empresa VALUES (2931, true, 1, '2023-07-03 14:52:50.506466', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DA REGIÃO TOCANTINA DO MARANHÃO (UEMASUL)', 267);
INSERT INTO public.empresa VALUES (2932, true, 1, '2023-07-03 14:52:50.508098', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE ALAGOAS - UNEAL (UNEAL)', 333);
INSERT INTO public.empresa VALUES (2933, true, 1, '2023-07-03 14:52:50.509634', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE CAMPINAS (UNICAMP)', 177);
INSERT INTO public.empresa VALUES (2934, true, 1, '2023-07-03 14:52:50.511255', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE CIÊNCIAS DA SAÚDE DE ALAGOAS - UNCISAL (UNCISAL)', 73);
INSERT INTO public.empresa VALUES (2935, true, 1, '2023-07-03 14:52:50.512841', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE FEIRA DE SANTANA (UEFS)', 99);
INSERT INTO public.empresa VALUES (2936, true, 1, '2023-07-03 14:52:50.514435', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE GOIÁS (UEG)', 264);
INSERT INTO public.empresa VALUES (2937, true, 1, '2023-07-03 14:52:50.515917', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE LONDRINA (UEL)', 159);
INSERT INTO public.empresa VALUES (2938, true, 1, '2023-07-03 14:52:50.517488', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE MARINGÁ (UEM)', 76);
INSERT INTO public.empresa VALUES (2939, true, 1, '2023-07-03 14:52:50.518976', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE MATO GROSSO DO SUL (UEMS)', 84);
INSERT INTO public.empresa VALUES (2940, true, 1, '2023-07-03 14:52:50.520538', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE MONTES CLAROS (UNIMONTES)', 128);
INSERT INTO public.empresa VALUES (2941, true, 1, '2023-07-03 14:52:50.522035', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE PONTA GROSSA (UEPG)', 188);
INSERT INTO public.empresa VALUES (2942, true, 1, '2023-07-03 14:52:50.523637', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE RORAIMA (UERR)', 138);
INSERT INTO public.empresa VALUES (2943, true, 1, '2023-07-03 14:52:50.525263', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DE SANTA CRUZ (UESC)', 20);
INSERT INTO public.empresa VALUES (2944, true, 1, '2023-07-03 14:52:50.526871', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO CEARÁ (UECE)', 45);
INSERT INTO public.empresa VALUES (2945, true, 1, '2023-07-03 14:52:50.528289', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO CENTRO OESTE (UNICENTRO)', 64);
INSERT INTO public.empresa VALUES (2946, true, 1, '2023-07-03 14:52:50.529802', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO MARANHÃO (UEMA)', 141);
INSERT INTO public.empresa VALUES (2947, true, 1, '2023-07-03 14:52:50.531443', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO NORTE DO PARANÁ (UENP)', 775);
INSERT INTO public.empresa VALUES (2948, true, 1, '2023-07-03 14:52:50.532962', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO NORTE FLUMINENSE DARCY RIBEIRO (UENF)', 160);
INSERT INTO public.empresa VALUES (2949, true, 1, '2023-07-03 14:52:50.534567', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO OESTE DO PARANÁ (UNIOESTE)', 54);
INSERT INTO public.empresa VALUES (2950, true, 1, '2023-07-03 14:52:50.536181', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO PARANÁ (UNESPAR)', 211);
INSERT INTO public.empresa VALUES (2951, true, 1, '2023-07-03 14:52:50.538334', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO PIAUÍ (UESPI)', 27);
INSERT INTO public.empresa VALUES (2952, true, 1, '2023-07-03 14:52:50.540477', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO RIO GRANDE DO SUL (UERGS)', 149);
INSERT INTO public.empresa VALUES (2953, true, 1, '2023-07-03 14:52:50.542538', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO SUDOESTE DA BAHIA (UESB)', 37);
INSERT INTO public.empresa VALUES (2954, true, 1, '2023-07-03 14:52:50.544449', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL DO TOCANTINS (UNITINS)', 23);
INSERT INTO public.empresa VALUES (2955, true, 1, '2023-07-03 14:52:50.545904', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL PAULISTA JÚLIO DE MESQUITA FILHO (UNESP)', 8);
INSERT INTO public.empresa VALUES (2956, true, 1, '2023-07-03 14:52:50.5477', NULL, NULL, false, 'UNIVERSIDADE ESTADUAL VALE DO ACARAÚ (UVA)', 167);
INSERT INTO public.empresa VALUES (2957, true, 1, '2023-07-03 14:52:50.549558', NULL, NULL, false, 'UNIVERSIDADE EVANGÉLICA DE GOIÁS (UNIEVANGÉLICA)', 264);
INSERT INTO public.empresa VALUES (2958, true, 1, '2023-07-03 14:52:50.551541', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DA BAHIA (UFBA)', 116);
INSERT INTO public.empresa VALUES (2959, true, 1, '2023-07-03 14:52:50.553327', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DA FRONTEIRA SUL (UFFS)', 406);
INSERT INTO public.empresa VALUES (2960, true, 1, '2023-07-03 14:52:50.555064', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DA INTEGRAÇÃO LATINO-AMERICANA (UNILA)', 124);
INSERT INTO public.empresa VALUES (2961, true, 1, '2023-07-03 14:52:50.556781', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DA PARAÍBA (UFPB)', 107);
INSERT INTO public.empresa VALUES (2962, true, 1, '2023-07-03 14:52:50.558491', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE ALAGOAS (UFAL)', 73);
INSERT INTO public.empresa VALUES (2963, true, 1, '2023-07-03 14:52:50.560318', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE ALFENAS (UNIFAL-MG)', 674);
INSERT INTO public.empresa VALUES (2964, true, 1, '2023-07-03 14:52:50.561869', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE CAMPINA GRANDE (UFCG)', 147);
INSERT INTO public.empresa VALUES (2965, true, 1, '2023-07-03 14:52:50.563526', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE CATALÃO (UFCAT)', 17);
INSERT INTO public.empresa VALUES (2966, true, 1, '2023-07-03 14:52:50.565392', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE GOIÁS (UFG)', 42);
INSERT INTO public.empresa VALUES (2967, true, 1, '2023-07-03 14:52:50.567279', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE ITAJUBÁ - UNIFEI (UNIFEI)', 103);
INSERT INTO public.empresa VALUES (2968, true, 1, '2023-07-03 14:52:50.569176', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE JATAÍ (UFJ)', 21);
INSERT INTO public.empresa VALUES (2969, true, 1, '2023-07-03 14:52:50.57117', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE JUIZ DE FORA (UFJF)', 38);
INSERT INTO public.empresa VALUES (2970, true, 1, '2023-07-03 14:52:50.573088', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE LAVRAS (UFLA)', 108);
INSERT INTO public.empresa VALUES (2971, true, 1, '2023-07-03 14:52:50.575085', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE MATO GROSSO (UFMT)', 203);
INSERT INTO public.empresa VALUES (2972, true, 1, '2023-07-03 14:52:50.577135', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE MATO GROSSO DO SUL (UFMS)', 48);
INSERT INTO public.empresa VALUES (2973, true, 1, '2023-07-03 14:52:50.578993', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE MINAS GERAIS (UFMG)', 2);
INSERT INTO public.empresa VALUES (2974, true, 1, '2023-07-03 14:52:50.580995', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE OURO PRETO (UFOP)', 776);
INSERT INTO public.empresa VALUES (2975, true, 1, '2023-07-03 14:52:50.582461', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE PELOTAS (UFPEL)', 283);
INSERT INTO public.empresa VALUES (2976, true, 1, '2023-07-03 14:52:50.584044', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE PERNAMBUCO (UFPE)', 60);
INSERT INTO public.empresa VALUES (2977, true, 1, '2023-07-03 14:52:50.585628', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE RONDONÓPOLIS (UFR)', 287);
INSERT INTO public.empresa VALUES (2978, true, 1, '2023-07-03 14:52:50.587187', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE RORAIMA (UFRR)', 138);
INSERT INTO public.empresa VALUES (2979, true, 1, '2023-07-03 14:52:50.588555', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SANTA CATARINA (UFSC)', 3);
INSERT INTO public.empresa VALUES (2980, true, 1, '2023-07-03 14:52:50.589994', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SANTA MARIA (UFSM)', 417);
INSERT INTO public.empresa VALUES (2981, true, 1, '2023-07-03 14:52:50.591391', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SÃO CARLOS (UFSCAR)', 72);
INSERT INTO public.empresa VALUES (2982, true, 1, '2023-07-03 14:52:50.59267', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SÃO JOÃO DEL REI (UFSJ)', 185);
INSERT INTO public.empresa VALUES (2983, true, 1, '2023-07-03 14:52:50.593948', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SÃO PAULO (UNIFESP)', 8);
INSERT INTO public.empresa VALUES (2984, true, 1, '2023-07-03 14:52:50.595216', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE SERGIPE (UFS)', 777);
INSERT INTO public.empresa VALUES (2985, true, 1, '2023-07-03 14:52:50.596476', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE UBERLÂNDIA (UFU)', 134);
INSERT INTO public.empresa VALUES (2986, true, 1, '2023-07-03 14:52:50.597679', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DE VIÇOSA (UFV)', 122);
INSERT INTO public.empresa VALUES (2987, true, 1, '2023-07-03 14:52:50.598913', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO ACRE (UFAC)', 143);
INSERT INTO public.empresa VALUES (2988, true, 1, '2023-07-03 14:52:50.600189', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO AGRESTE DE PERNAMBUCO (UFAPE )', 483);
INSERT INTO public.empresa VALUES (2989, true, 1, '2023-07-03 14:52:50.60132', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO AMAPÁ (UNIFAP)', 26);
INSERT INTO public.empresa VALUES (2990, true, 1, '2023-07-03 14:52:50.602457', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO AMAZONAS (UFAM)', 75);
INSERT INTO public.empresa VALUES (2991, true, 1, '2023-07-03 14:52:50.603625', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO CARIRI (UFCA)', 135);
INSERT INTO public.empresa VALUES (2992, true, 1, '2023-07-03 14:52:50.604734', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO CEARÁ (UFC)', 45);
INSERT INTO public.empresa VALUES (2993, true, 1, '2023-07-03 14:52:50.605849', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO DELTA DO PARNAIBA (UFDPAR)', 176);
INSERT INTO public.empresa VALUES (2994, true, 1, '2023-07-03 14:52:50.60703', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO ESPÍRITO SANTO (UFES)', 25);
INSERT INTO public.empresa VALUES (2995, true, 1, '2023-07-03 14:52:50.608175', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO ESTADO DO RIO DE JANEIRO (UNIRIO)', 12);
INSERT INTO public.empresa VALUES (2996, true, 1, '2023-07-03 14:52:50.609438', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO MARANHÃO (UFMA)', 141);
INSERT INTO public.empresa VALUES (2997, true, 1, '2023-07-03 14:52:50.610596', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO OESTE DA BAHIA (UFOB)', 174);
INSERT INTO public.empresa VALUES (2998, true, 1, '2023-07-03 14:52:50.611732', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO OESTE DO PARÁ (UFOPA)', 78);
INSERT INTO public.empresa VALUES (2999, true, 1, '2023-07-03 14:52:50.612842', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO PARÁ (UFPA)', 79);
INSERT INTO public.empresa VALUES (3000, true, 1, '2023-07-03 14:52:50.614027', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO PARANÁ (UFPR)', 56);
INSERT INTO public.empresa VALUES (3001, true, 1, '2023-07-03 14:52:50.615172', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO PIAUÍ (UFPI)', 27);
INSERT INTO public.empresa VALUES (3002, true, 1, '2023-07-03 14:52:50.616188', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RECÔNCAVO DA BAHIA (UFRB)', 172);
INSERT INTO public.empresa VALUES (3003, true, 1, '2023-07-03 14:52:50.617347', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RIO DE JANEIRO (UFRJ)', 12);
INSERT INTO public.empresa VALUES (3004, true, 1, '2023-07-03 14:52:50.618484', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RIO GRANDE (FURG)', 298);
INSERT INTO public.empresa VALUES (3005, true, 1, '2023-07-03 14:52:50.619596', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RIO GRANDE DO NORTE (UFRN)', 130);
INSERT INTO public.empresa VALUES (3006, true, 1, '2023-07-03 14:52:50.620779', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL (UFRGS)', 149);
INSERT INTO public.empresa VALUES (3007, true, 1, '2023-07-03 14:52:50.621905', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO SUL DA BAHIA (UFSB)', 269);
INSERT INTO public.empresa VALUES (3008, true, 1, '2023-07-03 14:52:50.623028', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO SUL E SUDESTE DO PARÁ (UNIFESSPA)', 46);
INSERT INTO public.empresa VALUES (3009, true, 1, '2023-07-03 14:52:50.624132', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DOS VALES DO JEQUITINHONHA E MUCURI (UFVJM)', 778);
INSERT INTO public.empresa VALUES (3010, true, 1, '2023-07-03 14:52:50.625343', NULL, NULL, false, 'UNIVERSIDADE FEDERAL DO TRIÂNGULO MINEIRO (UFTM)', 118);
INSERT INTO public.empresa VALUES (3011, true, 1, '2023-07-03 14:52:50.626405', NULL, NULL, false, 'UNIVERSIDADE FEDERAL FLUMINENSE (UFF)', 49);
INSERT INTO public.empresa VALUES (3012, true, 1, '2023-07-03 14:52:50.62765', NULL, NULL, false, 'UNIVERSIDADE FEDERAL RURAL DA AMAZÔNIA (UFRA)', 79);
INSERT INTO public.empresa VALUES (3013, true, 1, '2023-07-03 14:52:50.628804', NULL, NULL, false, 'UNIVERSIDADE FEDERAL RURAL DE PERNAMBUCO (UFRPE)', 60);
INSERT INTO public.empresa VALUES (3014, true, 1, '2023-07-03 14:52:50.62985', NULL, NULL, false, 'UNIVERSIDADE FEDERAL RURAL DO RIO DE JANEIRO (UFRRJ)', 779);
INSERT INTO public.empresa VALUES (3015, true, 1, '2023-07-03 14:52:50.631091', NULL, NULL, false, 'UNIVERSIDADE FEDERAL RURAL DO SEMI-ÁRIDO (UFERSA)', 323);
INSERT INTO public.empresa VALUES (3016, true, 1, '2023-07-03 14:52:50.632153', NULL, NULL, false, 'UNIVERSIDADE FEEVALE (FEEVALE)', 541);
INSERT INTO public.empresa VALUES (3017, true, 1, '2023-07-03 14:52:50.633381', NULL, NULL, false, 'UNIVERSIDADE FRANCISCANA (UFN)', 417);
INSERT INTO public.empresa VALUES (3018, true, 1, '2023-07-03 14:52:50.63438', NULL, NULL, false, 'UNIVERSIDADE FUMEC (FUMEC)', 2);
INSERT INTO public.empresa VALUES (3019, true, 1, '2023-07-03 14:52:50.635618', NULL, NULL, false, 'UNIVERSIDADE IBIRAPUERA (UNIB)', 8);
INSERT INTO public.empresa VALUES (3020, true, 1, '2023-07-03 14:52:50.636862', NULL, NULL, false, 'UNIVERSIDADE IGUAÇU (UNIG)', 780);
INSERT INTO public.empresa VALUES (3021, true, 1, '2023-07-03 14:52:50.637975', NULL, NULL, false, 'UNIVERSIDADE LA SALLE (UNILASALLE)', 542);
INSERT INTO public.empresa VALUES (3022, true, 1, '2023-07-03 14:52:50.639645', NULL, NULL, false, 'UNIVERSIDADE LUTERANA DO BRASIL (ULBRA)', 542);
INSERT INTO public.empresa VALUES (3023, true, 1, '2023-07-03 14:52:50.641234', NULL, NULL, false, 'UNIVERSIDADE METODISTA DE PIRACICABA (UNIMEP)', 224);
INSERT INTO public.empresa VALUES (3024, true, 1, '2023-07-03 14:52:50.642771', NULL, NULL, false, 'UNIVERSIDADE METODISTA DE SÃO PAULO (UMESP)', 82);
INSERT INTO public.empresa VALUES (3025, true, 1, '2023-07-03 14:52:50.644124', NULL, NULL, false, 'UNIVERSIDADE METROPOLITANA DE SANTOS (UNIMES)', 171);
INSERT INTO public.empresa VALUES (3026, true, 1, '2023-07-03 14:52:50.64609', NULL, NULL, false, 'UNIVERSIDADE MUNICIPAL DE SÃO CAETANO DO SUL (USCS)', 126);
INSERT INTO public.empresa VALUES (3027, true, 1, '2023-07-03 14:52:50.647439', NULL, NULL, false, 'UNIVERSIDADE NILTON LINS (UNINILTONLINS)', 75);
INSERT INTO public.empresa VALUES (3028, true, 1, '2023-07-03 14:52:50.648705', NULL, NULL, false, 'UNIVERSIDADE NOVE DE JULHO (UNINOVE)', 8);
INSERT INTO public.empresa VALUES (3029, true, 1, '2023-07-03 14:52:50.649717', NULL, NULL, false, 'UNIVERSIDADE PARANAENSE (UNIPAR)', 251);
INSERT INTO public.empresa VALUES (3030, true, 1, '2023-07-03 14:52:50.650939', NULL, NULL, false, 'UNIVERSIDADE PAULISTA (UNIP)', 8);
INSERT INTO public.empresa VALUES (3031, true, 1, '2023-07-03 14:52:50.652091', NULL, NULL, false, 'UNIVERSIDADE PITÁGORAS UNOPAR ANHANGUERA', 159);
INSERT INTO public.empresa VALUES (3032, true, 1, '2023-07-03 14:52:50.653258', NULL, NULL, false, 'UNIVERSIDADE POSITIVO (UP)', 56);
INSERT INTO public.empresa VALUES (3033, true, 1, '2023-07-03 14:52:50.654337', NULL, NULL, false, 'UNIVERSIDADE POTIGUAR (UNP)', 130);
INSERT INTO public.empresa VALUES (3034, true, 1, '2023-07-03 14:52:50.655719', NULL, NULL, false, 'UNIVERSIDADE PRESBITERIANA MACKENZIE (MACKENZIE)', 8);
INSERT INTO public.empresa VALUES (3035, true, 1, '2023-07-03 14:52:50.656805', NULL, NULL, false, 'UNIVERSIDADE REGIONAL DE BLUMENAU (FURB)', 193);
INSERT INTO public.empresa VALUES (3036, true, 1, '2023-07-03 14:52:50.657989', NULL, NULL, false, 'UNIVERSIDADE REGIONAL DO CARIRI (URCA)', 310);
INSERT INTO public.empresa VALUES (3037, true, 1, '2023-07-03 14:52:50.659187', NULL, NULL, false, 'UNIVERSIDADE REGIONAL DO NOROESTE DO ESTADO DO RIO GRANDE DO SUL (UNIJUI)', 311);
INSERT INTO public.empresa VALUES (3038, true, 1, '2023-07-03 14:52:50.660338', NULL, NULL, false, 'UNIVERSIDADE REGIONAL INTEGRADA DO ALTO URUGUAI E DAS MISSÕES (URI)', 415);
INSERT INTO public.empresa VALUES (3039, true, 1, '2023-07-03 14:52:50.661544', NULL, NULL, false, 'UNIVERSIDADE SALGADO DE OLIVEIRA (UNIVERSO)', 623);
INSERT INTO public.empresa VALUES (3040, true, 1, '2023-07-03 14:52:50.662742', NULL, NULL, false, 'UNIVERSIDADE SALVADOR (UNIFACS)', 116);
INSERT INTO public.empresa VALUES (3041, true, 1, '2023-07-03 14:52:50.664015', NULL, NULL, false, 'UNIVERSIDADE SANTA CECÍLIA (UNISANTA)', 171);
INSERT INTO public.empresa VALUES (3042, true, 1, '2023-07-03 14:52:50.665269', NULL, NULL, false, 'UNIVERSIDADE SANTA ÚRSULA (USU)', 12);
INSERT INTO public.empresa VALUES (3043, true, 1, '2023-07-03 14:52:50.666516', NULL, NULL, false, 'UNIVERSIDADE SANTO AMARO (UNISA)', 8);
INSERT INTO public.empresa VALUES (3044, true, 1, '2023-07-03 14:52:50.667683', NULL, NULL, false, 'UNIVERSIDADE SÃO FRANCISCO (USF)', 404);
INSERT INTO public.empresa VALUES (3045, true, 1, '2023-07-03 14:52:50.668857', NULL, NULL, false, 'UNIVERSIDADE SÃO JUDAS TADEU (USJT)', 8);
INSERT INTO public.empresa VALUES (3046, true, 1, '2023-07-03 14:52:50.670162', NULL, NULL, false, 'UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ (UTFPR)', 56);
INSERT INTO public.empresa VALUES (3047, true, 1, '2023-07-03 14:52:50.67142', NULL, NULL, false, 'UNIVERSIDADE TIRADENTES (UNIT)', 142);
INSERT INTO public.empresa VALUES (3048, true, 1, '2023-07-03 14:52:50.672648', NULL, NULL, false, 'UNIVERSIDADE TUIUTI DO PARANÁ (UTP)', 56);
INSERT INTO public.empresa VALUES (3049, true, 1, '2023-07-03 14:52:50.674039', NULL, NULL, false, 'UNIVERSIDADE UNIVERSUS VERITAS GUARULHOS (UNIVERITAS UNG)', 100);
INSERT INTO public.empresa VALUES (3050, true, 1, '2023-07-03 14:52:50.675334', NULL, NULL, false, 'UNIVERSIDADE VALE DO RIO DOCE (UNIVALE)', 265);
INSERT INTO public.empresa VALUES (3051, true, 1, '2023-07-03 14:52:50.67689', NULL, NULL, false, 'UNIVERSIDADE VEIGA DE ALMEIDA (UVA)', 12);
INSERT INTO public.empresa VALUES (3052, true, 1, '2023-07-03 14:52:50.678572', NULL, NULL, false, 'UNIVERSIDADE VILA VELHA (UVV)', 226);
INSERT INTO public.empresa VALUES (3053, true, 1, '2023-07-03 14:52:50.680256', NULL, NULL, false, 'UNIVERSIDADE VIRTUAL DO ESTADO DO MARANHÃO (UNIVIMA)', 141);
INSERT INTO public.empresa VALUES (3054, true, 1, '2023-07-03 14:52:50.681946', NULL, NULL, false, 'VOAS - INSTITUTO DE APRENDIZAGEM SUPERIOR (VOAS)', 116);


--
-- TOC entry 3727 (class 0 OID 83960)
-- Dependencies: 242
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.endereco VALUES (1, true, 1, '2023-07-03 14:52:45.592457', NULL, NULL, 'BELFORD ROXO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (2, true, 1, '2023-07-03 14:52:45.593816', NULL, NULL, 'BELO HORIZONTE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (3, true, 1, '2023-07-03 14:52:45.595015', NULL, NULL, 'FLORIANÓPOLIS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (4, true, 1, '2023-07-03 14:52:45.596248', NULL, NULL, 'RESENDE', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (5, true, 1, '2023-07-03 14:52:45.597508', NULL, NULL, 'BRASÍLIA', NULL, 'DF', 'BRASIL');
INSERT INTO public.endereco VALUES (6, true, 1, '2023-07-03 14:52:45.598846', NULL, NULL, 'JUÍNA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (7, true, 1, '2023-07-03 14:52:45.600256', NULL, NULL, 'TEÓFILO OTONI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (8, true, 1, '2023-07-03 14:52:45.601675', NULL, NULL, 'SÃO PAULO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (9, true, 1, '2023-07-03 14:52:45.602981', NULL, NULL, 'CACIMBINHAS', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (10, true, 1, '2023-07-03 14:52:45.604225', NULL, NULL, 'VOTUPORANGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (11, true, 1, '2023-07-03 14:52:45.605716', NULL, NULL, 'INDAIATUBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (12, true, 1, '2023-07-03 14:52:45.606959', NULL, NULL, 'RIO DE JANEIRO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (13, true, 1, '2023-07-03 14:52:45.608161', NULL, NULL, 'FRANCISCO BELTRÃO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (14, true, 1, '2023-07-03 14:52:45.609393', NULL, NULL, 'ALTAMIRA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (15, true, 1, '2023-07-03 14:52:45.610625', NULL, NULL, 'ARCOVERDE', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (16, true, 1, '2023-07-03 14:52:45.611818', NULL, NULL, 'BACABEIRA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (17, true, 1, '2023-07-03 14:52:45.612965', NULL, NULL, 'CATALÃO', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (18, true, 1, '2023-07-03 14:52:45.615654', NULL, NULL, 'CONSELHEIRO LAFAIETE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (19, true, 1, '2023-07-03 14:52:45.61707', NULL, NULL, 'DIVINÓPOLIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (20, true, 1, '2023-07-03 14:52:45.618419', NULL, NULL, 'ILHÉUS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (21, true, 1, '2023-07-03 14:52:45.61974', NULL, NULL, 'JATAÍ', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (22, true, 1, '2023-07-03 14:52:45.620989', NULL, NULL, 'LORENA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (23, true, 1, '2023-07-03 14:52:45.622186', NULL, NULL, 'PALMAS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (24, true, 1, '2023-07-03 14:52:45.623368', NULL, NULL, 'SETE LAGOAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (25, true, 1, '2023-07-03 14:52:45.624513', NULL, NULL, 'VITÓRIA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (26, true, 1, '2023-07-03 14:52:45.625627', NULL, NULL, 'MACAPÁ', NULL, 'AP', 'BRASIL');
INSERT INTO public.endereco VALUES (27, true, 1, '2023-07-03 14:52:45.626746', NULL, NULL, 'TERESINA', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (28, true, 1, '2023-07-03 14:52:45.627894', NULL, NULL, 'BELÉM DE SÃO FRANCISCO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (29, true, 1, '2023-07-03 14:52:45.629157', NULL, NULL, 'SARANDI', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (30, true, 1, '2023-07-03 14:52:45.630443', NULL, NULL, 'GUAPORÉ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (31, true, 1, '2023-07-03 14:52:45.631624', NULL, NULL, 'JARAGUÁ DO SUL', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (32, true, 1, '2023-07-03 14:52:45.632828', NULL, NULL, 'BARBACENA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (33, true, 1, '2023-07-03 14:52:45.634118', NULL, NULL, 'TAUBATÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (34, true, 1, '2023-07-03 14:52:45.635297', NULL, NULL, 'ESPÍRITO SANTO DO PINHAL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (35, true, 1, '2023-07-03 14:52:45.636514', NULL, NULL, 'MACHADO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (36, true, 1, '2023-07-03 14:52:45.63772', NULL, NULL, 'ASSIS CHATEAUBRIAND', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (37, true, 1, '2023-07-03 14:52:45.639022', NULL, NULL, 'VITÓRIA DA CONQUISTA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (38, true, 1, '2023-07-03 14:52:45.640399', NULL, NULL, 'JUIZ DE FORA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (39, true, 1, '2023-07-03 14:52:45.641696', NULL, NULL, 'OLINDA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (40, true, 1, '2023-07-03 14:52:45.642976', NULL, NULL, 'PARIPIRANGA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (41, true, 1, '2023-07-03 14:52:45.64445', NULL, NULL, 'APARECIDA DE GOIÂNIA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (42, true, 1, '2023-07-03 14:52:45.645817', NULL, NULL, 'GOIÂNIA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (43, true, 1, '2023-07-03 14:52:45.647153', NULL, NULL, 'AMPARO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (44, true, 1, '2023-07-03 14:52:45.648456', NULL, NULL, 'LEME', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (45, true, 1, '2023-07-03 14:52:45.649718', NULL, NULL, 'FORTALEZA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (46, true, 1, '2023-07-03 14:52:45.651088', NULL, NULL, 'MARABÁ', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (47, true, 1, '2023-07-03 14:52:45.652509', NULL, NULL, 'SANTO ANDRÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (48, true, 1, '2023-07-03 14:52:45.653667', NULL, NULL, 'CAMPO GRANDE', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (49, true, 1, '2023-07-03 14:52:45.654918', NULL, NULL, 'NITERÓI', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (50, true, 1, '2023-07-03 14:52:45.656259', NULL, NULL, 'PRESIDENTE PRUDENTE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (51, true, 1, '2023-07-03 14:52:45.657561', NULL, NULL, 'PORTO VELHO', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (52, true, 1, '2023-07-03 14:52:45.65885', NULL, NULL, 'LUÍS EDUARDO MAGALHÃES', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (53, true, 1, '2023-07-03 14:52:45.660322', NULL, NULL, 'PETRÓPOLIS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (54, true, 1, '2023-07-03 14:52:45.661568', NULL, NULL, 'CASCAVEL', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (55, true, 1, '2023-07-03 14:52:45.662781', NULL, NULL, 'PARACATU', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (56, true, 1, '2023-07-03 14:52:45.663976', NULL, NULL, 'CURITIBA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (57, true, 1, '2023-07-03 14:52:45.665315', NULL, NULL, 'BALNEÁRIO CAMBORIÚ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (58, true, 1, '2023-07-03 14:52:45.666549', NULL, NULL, 'RIBEIRÃO PRETO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (59, true, 1, '2023-07-03 14:52:45.667756', NULL, NULL, 'ORLEANS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (60, true, 1, '2023-07-03 14:52:45.669026', NULL, NULL, 'RECIFE', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (61, true, 1, '2023-07-03 14:52:45.670261', NULL, NULL, 'SÃO LUÍS DE MONTES BELOS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (62, true, 1, '2023-07-03 14:52:45.671475', NULL, NULL, 'MOGI DAS CRUZES', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (63, true, 1, '2023-07-03 14:52:45.672649', NULL, NULL, 'CAMPO LIMPO PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (64, true, 1, '2023-07-03 14:52:45.673822', NULL, NULL, 'GUARAPUAVA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (65, true, 1, '2023-07-03 14:52:45.674979', NULL, NULL, 'COLATINA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (66, true, 1, '2023-07-03 14:52:45.676614', NULL, NULL, 'BARRA DO GARÇAS', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (67, true, 1, '2023-07-03 14:52:45.678317', NULL, NULL, 'QUIXADÁ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (68, true, 1, '2023-07-03 14:52:45.679892', NULL, NULL, 'JOINVILLE', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (69, true, 1, '2023-07-03 14:52:45.681405', NULL, NULL, 'CORONEL FABRICIANO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (70, true, 1, '2023-07-03 14:52:45.683014', NULL, NULL, 'LINS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (71, true, 1, '2023-07-03 14:52:45.684221', NULL, NULL, 'OSÓRIO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (72, true, 1, '2023-07-03 14:52:45.685387', NULL, NULL, 'SÃO CARLOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (73, true, 1, '2023-07-03 14:52:45.686546', NULL, NULL, 'MACEIÓ', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (74, true, 1, '2023-07-03 14:52:45.68775', NULL, NULL, 'CACHOEIRINHA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (75, true, 1, '2023-07-03 14:52:45.688909', NULL, NULL, 'MANAUS', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (76, true, 1, '2023-07-03 14:52:45.69012', NULL, NULL, 'MARINGÁ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (77, true, 1, '2023-07-03 14:52:45.691337', NULL, NULL, 'BENTO GONÇALVES', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (78, true, 1, '2023-07-03 14:52:45.692524', NULL, NULL, 'SANTARÉM', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (79, true, 1, '2023-07-03 14:52:45.693758', NULL, NULL, 'BELÉM', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (80, true, 1, '2023-07-03 14:52:45.694957', NULL, NULL, 'BARRETOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (81, true, 1, '2023-07-03 14:52:45.696149', NULL, NULL, 'GUAXUPÉ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (82, true, 1, '2023-07-03 14:52:45.697328', NULL, NULL, 'SÃO BERNARDO DO CAMPO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (83, true, 1, '2023-07-03 14:52:45.698453', NULL, NULL, 'ARARAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (84, true, 1, '2023-07-03 14:52:45.699614', NULL, NULL, 'DOURADOS', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (85, true, 1, '2023-07-03 14:52:45.700784', NULL, NULL, 'SÃO JOSÉ DOS PINHAIS', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (86, true, 1, '2023-07-03 14:52:45.701983', NULL, NULL, 'BAGÉ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (87, true, 1, '2023-07-03 14:52:45.703239', NULL, NULL, 'CAXIAS DO SUL', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (88, true, 1, '2023-07-03 14:52:45.704448', NULL, NULL, 'SÃO JOÃO DA BOA VISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (89, true, 1, '2023-07-03 14:52:45.705684', NULL, NULL, 'OURINHOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (90, true, 1, '2023-07-03 14:52:45.70711', NULL, NULL, 'VITÓRIA DE SANTO ANTÃO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (91, true, 1, '2023-07-03 14:52:45.708577', NULL, NULL, 'ADAMANTINA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (92, true, 1, '2023-07-03 14:52:45.709917', NULL, NULL, 'BARRA MANSA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (93, true, 1, '2023-07-03 14:52:45.711239', NULL, NULL, 'BAURU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (94, true, 1, '2023-07-03 14:52:45.712541', NULL, NULL, 'BRUSQUE', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (95, true, 1, '2023-07-03 14:52:45.713764', NULL, NULL, 'CARATINGA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (96, true, 1, '2023-07-03 14:52:45.715143', NULL, NULL, 'SANTO ANTÔNIO DE JESUS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (97, true, 1, '2023-07-03 14:52:45.716348', NULL, NULL, 'CAXIAS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (98, true, 1, '2023-07-03 14:52:45.717548', NULL, NULL, 'LUZIÂNIA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (99, true, 1, '2023-07-03 14:52:45.718754', NULL, NULL, 'FEIRA DE SANTANA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (100, true, 1, '2023-07-03 14:52:45.719913', NULL, NULL, 'GUARULHOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (101, true, 1, '2023-07-03 14:52:45.721062', NULL, NULL, 'FORMIGA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (102, true, 1, '2023-07-03 14:52:45.722237', NULL, NULL, 'GOIATUBA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (103, true, 1, '2023-07-03 14:52:45.723419', NULL, NULL, 'ITAJUBÁ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (104, true, 1, '2023-07-03 14:52:45.724595', NULL, NULL, 'ITAPIRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (105, true, 1, '2023-07-03 14:52:45.725759', NULL, NULL, 'JAGUARIÚNA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (106, true, 1, '2023-07-03 14:52:45.72696', NULL, NULL, 'JALES', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (107, true, 1, '2023-07-03 14:52:45.728173', NULL, NULL, 'JOÃO PESSOA', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (108, true, 1, '2023-07-03 14:52:45.729432', NULL, NULL, 'LAVRAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (109, true, 1, '2023-07-03 14:52:45.730634', NULL, NULL, 'MINEIROS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (110, true, 1, '2023-07-03 14:52:45.731834', NULL, NULL, 'PATO BRANCO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (111, true, 1, '2023-07-03 14:52:45.733037', NULL, NULL, 'PATOS', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (112, true, 1, '2023-07-03 14:52:45.734224', NULL, NULL, 'PATOS DE MINAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (113, true, 1, '2023-07-03 14:52:45.735377', NULL, NULL, 'PAULÍNIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (114, true, 1, '2023-07-03 14:52:45.737741', NULL, NULL, 'SÃO JOSÉ DO RIO PRETO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (115, true, 1, '2023-07-03 14:52:45.73904', NULL, NULL, 'CACOAL', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (116, true, 1, '2023-07-03 14:52:45.740298', NULL, NULL, 'SALVADOR', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (117, true, 1, '2023-07-03 14:52:45.741535', NULL, NULL, 'SANTA FÉ DO SUL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (118, true, 1, '2023-07-03 14:52:45.7428', NULL, NULL, 'UBERABA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (119, true, 1, '2023-07-03 14:52:45.744036', NULL, NULL, 'UNIÃO DA VITÓRIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (120, true, 1, '2023-07-03 14:52:45.745382', NULL, NULL, 'VALENÇA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (121, true, 1, '2023-07-03 14:52:45.746655', NULL, NULL, 'VÁRZEA GRANDE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (122, true, 1, '2023-07-03 14:52:45.747923', NULL, NULL, 'VIÇOSA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (123, true, 1, '2023-07-03 14:52:45.749194', NULL, NULL, 'VOLTA REDONDA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (124, true, 1, '2023-07-03 14:52:45.750474', NULL, NULL, 'FOZ DO IGUAÇU', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (125, true, 1, '2023-07-03 14:52:45.751695', NULL, NULL, 'PATROCÍNIO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (126, true, 1, '2023-07-03 14:52:45.752904', NULL, NULL, 'SÃO CAETANO DO SUL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (127, true, 1, '2023-07-03 14:52:45.754121', NULL, NULL, 'GUARUJÁ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (128, true, 1, '2023-07-03 14:52:45.755337', NULL, NULL, 'MONTES CLAROS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (129, true, 1, '2023-07-03 14:52:45.756846', NULL, NULL, 'ARAXÁ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (130, true, 1, '2023-07-03 14:52:45.758169', NULL, NULL, 'NATAL', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (131, true, 1, '2023-07-03 14:52:45.759508', NULL, NULL, 'PAULO AFONSO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (132, true, 1, '2023-07-03 14:52:45.760936', NULL, NULL, 'JABOATÃO DOS GUARARAPES', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (133, true, 1, '2023-07-03 14:52:45.762289', NULL, NULL, 'VARGINHA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (134, true, 1, '2023-07-03 14:52:45.76363', NULL, NULL, 'UBERLÂNDIA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (135, true, 1, '2023-07-03 14:52:45.764862', NULL, NULL, 'JUAZEIRO DO NORTE', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (136, true, 1, '2023-07-03 14:52:45.766066', NULL, NULL, 'ARACATI', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (137, true, 1, '2023-07-03 14:52:45.767257', NULL, NULL, 'REGISTRO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (138, true, 1, '2023-07-03 14:52:45.76841', NULL, NULL, 'BOA VISTA', NULL, 'RR', 'BRASIL');
INSERT INTO public.endereco VALUES (139, true, 1, '2023-07-03 14:52:45.769951', NULL, NULL, 'JI-PARANÁ', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (140, true, 1, '2023-07-03 14:52:45.771586', NULL, NULL, 'SÃO JOSÉ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (141, true, 1, '2023-07-03 14:52:45.773209', NULL, NULL, 'SÃO LUÍS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (142, true, 1, '2023-07-03 14:52:45.774809', NULL, NULL, 'ARACAJU', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (143, true, 1, '2023-07-03 14:52:45.775979', NULL, NULL, 'RIO BRANCO', NULL, 'AC', 'BRASIL');
INSERT INTO public.endereco VALUES (144, true, 1, '2023-07-03 14:52:45.777206', NULL, NULL, 'SÃO JOSÉ DOS CAMPOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (145, true, 1, '2023-07-03 14:52:45.778464', NULL, NULL, 'MARÍLIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (146, true, 1, '2023-07-03 14:52:45.779765', NULL, NULL, 'SOROCABA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (147, true, 1, '2023-07-03 14:52:45.781027', NULL, NULL, 'CAMPINA GRANDE', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (148, true, 1, '2023-07-03 14:52:45.782314', NULL, NULL, 'LAGES', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (149, true, 1, '2023-07-03 14:52:45.783672', NULL, NULL, 'PORTO ALEGRE', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (150, true, 1, '2023-07-03 14:52:45.784939', NULL, NULL, 'LAPA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (151, true, 1, '2023-07-03 14:52:45.786223', NULL, NULL, 'ARIQUEMES', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (152, true, 1, '2023-07-03 14:52:45.787495', NULL, NULL, 'ITAPIRANGA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (153, true, 1, '2023-07-03 14:52:45.788662', NULL, NULL, 'CAMAÇARI', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (154, true, 1, '2023-07-03 14:52:45.789914', NULL, NULL, 'MURIAÉ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (155, true, 1, '2023-07-03 14:52:45.791288', NULL, NULL, 'SINOP', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (156, true, 1, '2023-07-03 14:52:45.792667', NULL, NULL, 'CARUARU', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (157, true, 1, '2023-07-03 14:52:45.794064', NULL, NULL, 'GUANAMBI', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (158, true, 1, '2023-07-03 14:52:45.795377', NULL, NULL, 'OSASCO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (159, true, 1, '2023-07-03 14:52:45.796697', NULL, NULL, 'LONDRINA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (160, true, 1, '2023-07-03 14:52:45.798091', NULL, NULL, 'CAMPOS DOS GOYTACAZES', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (161, true, 1, '2023-07-03 14:52:45.799456', NULL, NULL, 'ITABIRA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (162, true, 1, '2023-07-03 14:52:45.802156', NULL, NULL, 'PINDAMONHANGABA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (163, true, 1, '2023-07-03 14:52:45.803613', NULL, NULL, 'UBÁ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (164, true, 1, '2023-07-03 14:52:45.80487', NULL, NULL, 'TRINDADE', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (165, true, 1, '2023-07-03 14:52:45.806165', NULL, NULL, 'GETÚLIO VARGAS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (166, true, 1, '2023-07-03 14:52:45.807559', NULL, NULL, 'ARAGUARI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (167, true, 1, '2023-07-03 14:52:45.808829', NULL, NULL, 'SOBRAL', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (168, true, 1, '2023-07-03 14:52:45.810135', NULL, NULL, 'CAMPO MOURÃO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (169, true, 1, '2023-07-03 14:52:45.811522', NULL, NULL, 'LUCAS DO RIO VERDE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (170, true, 1, '2023-07-03 14:52:45.812878', NULL, NULL, 'INDAIAL', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (171, true, 1, '2023-07-03 14:52:45.814233', NULL, NULL, 'SANTOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (172, true, 1, '2023-07-03 14:52:45.815591', NULL, NULL, 'CRUZ DAS ALMAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (173, true, 1, '2023-07-03 14:52:45.816871', NULL, NULL, 'MONTE CARMELO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (174, true, 1, '2023-07-03 14:52:45.818489', NULL, NULL, 'BARREIRAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (175, true, 1, '2023-07-03 14:52:45.819924', NULL, NULL, 'PAULISTA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (176, true, 1, '2023-07-03 14:52:45.821182', NULL, NULL, 'PARNAÍBA', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (177, true, 1, '2023-07-03 14:52:45.822363', NULL, NULL, 'CAMPINAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (178, true, 1, '2023-07-03 14:52:45.823558', NULL, NULL, 'CARAGUATATUBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (179, true, 1, '2023-07-03 14:52:45.824753', NULL, NULL, 'FRANCA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (180, true, 1, '2023-07-03 14:52:45.826064', NULL, NULL, 'ITU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (181, true, 1, '2023-07-03 14:52:45.827424', NULL, NULL, 'CATANDUVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (182, true, 1, '2023-07-03 14:52:45.828933', NULL, NULL, 'JUNDIAÍ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (183, true, 1, '2023-07-03 14:52:45.830339', NULL, NULL, 'RIO DO SUL', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (184, true, 1, '2023-07-03 14:52:45.831838', NULL, NULL, 'SUZANO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (185, true, 1, '2023-07-03 14:52:45.833335', NULL, NULL, 'SÃO JOÃO DEL REI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (186, true, 1, '2023-07-03 14:52:45.834661', NULL, NULL, 'ITAPERUNA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (187, true, 1, '2023-07-03 14:52:45.835907', NULL, NULL, 'AMERICANA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (188, true, 1, '2023-07-03 14:52:45.837269', NULL, NULL, 'PONTA GROSSA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (189, true, 1, '2023-07-03 14:52:45.838617', NULL, NULL, 'CAJAZEIRAS', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (190, true, 1, '2023-07-03 14:52:45.839931', NULL, NULL, 'CACHOEIRO DE ITAPEMIRIM', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (191, true, 1, '2023-07-03 14:52:45.841259', NULL, NULL, 'SÃO ROQUE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (192, true, 1, '2023-07-03 14:52:45.842459', NULL, NULL, 'CRICIÚMA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (193, true, 1, '2023-07-03 14:52:45.843679', NULL, NULL, 'BLUMENAU', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (194, true, 1, '2023-07-03 14:52:45.844896', NULL, NULL, 'TERESÓPOLIS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (195, true, 1, '2023-07-03 14:52:45.846222', NULL, NULL, 'AVARÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (196, true, 1, '2023-07-03 14:52:45.847511', NULL, NULL, 'ARAGUAÍNA', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (197, true, 1, '2023-07-03 14:52:45.848762', NULL, NULL, 'ARAÇATUBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (198, true, 1, '2023-07-03 14:52:45.850118', NULL, NULL, 'BETIM', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (199, true, 1, '2023-07-03 14:52:45.851448', NULL, NULL, 'BOM DESPACHO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (200, true, 1, '2023-07-03 14:52:45.852751', NULL, NULL, 'CONTAGEM', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (201, true, 1, '2023-07-03 14:52:45.854002', NULL, NULL, 'GUARAMIRIM', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (202, true, 1, '2023-07-03 14:52:45.855161', NULL, NULL, 'RIO VERDE', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (203, true, 1, '2023-07-03 14:52:45.856375', NULL, NULL, 'CUIABÁ', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (204, true, 1, '2023-07-03 14:52:45.857734', NULL, NULL, 'CABEDELO', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (205, true, 1, '2023-07-03 14:52:45.859082', NULL, NULL, 'ATIBAIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (206, true, 1, '2023-07-03 14:52:45.861091', NULL, NULL, 'ARAUCÁRIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (207, true, 1, '2023-07-03 14:52:45.862522', NULL, NULL, 'MANHUAÇU', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (208, true, 1, '2023-07-03 14:52:45.86386', NULL, NULL, 'BEBEDOURO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (209, true, 1, '2023-07-03 14:52:45.865282', NULL, NULL, 'LAURO DE FREITAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (210, true, 1, '2023-07-03 14:52:45.86816', NULL, NULL, 'TELÊMACO BORBA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (211, true, 1, '2023-07-03 14:52:45.869687', NULL, NULL, 'PARANAVAÍ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (212, true, 1, '2023-07-03 14:52:45.871365', NULL, NULL, 'TABOÃO DA SERRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (213, true, 1, '2023-07-03 14:52:45.87317', NULL, NULL, 'ALAGOINHAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (214, true, 1, '2023-07-03 14:52:45.874755', NULL, NULL, 'DOIS VIZINHOS', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (215, true, 1, '2023-07-03 14:52:45.876', NULL, NULL, 'CAPIVARI DE BAIXO', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (216, true, 1, '2023-07-03 14:52:45.877278', NULL, NULL, 'SÃO MATEUS', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (217, true, 1, '2023-07-03 14:52:45.878743', NULL, NULL, 'TRÊS CORAÇÕES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (218, true, 1, '2023-07-03 14:52:45.88001', NULL, NULL, 'ICÓ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (219, true, 1, '2023-07-03 14:52:45.881293', NULL, NULL, 'MATIPÓ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (220, true, 1, '2023-07-03 14:52:45.882574', NULL, NULL, 'PIRIPIRI', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (221, true, 1, '2023-07-03 14:52:45.883841', NULL, NULL, 'BATATAIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (222, true, 1, '2023-07-03 14:52:45.885092', NULL, NULL, 'RIO CLARO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (223, true, 1, '2023-07-03 14:52:45.88628', NULL, NULL, 'ITÁPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (224, true, 1, '2023-07-03 14:52:45.887493', NULL, NULL, 'PIRACICABA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (225, true, 1, '2023-07-03 14:52:45.888677', NULL, NULL, 'GUARABIRA', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (226, true, 1, '2023-07-03 14:52:45.889855', NULL, NULL, 'VILA VELHA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (227, true, 1, '2023-07-03 14:52:45.891047', NULL, NULL, 'ABAETETUBA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (228, true, 1, '2023-07-03 14:52:45.892239', NULL, NULL, 'PARAGUAÇU PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (229, true, 1, '2023-07-03 14:52:45.893423', NULL, NULL, 'CRUZEIRO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (230, true, 1, '2023-07-03 14:52:45.89463', NULL, NULL, 'POUSO ALEGRE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (231, true, 1, '2023-07-03 14:52:45.895786', NULL, NULL, 'IGUATAMA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (232, true, 1, '2023-07-03 14:52:45.896953', NULL, NULL, 'ANANINDEUA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (233, true, 1, '2023-07-03 14:52:45.898102', NULL, NULL, 'SANTA TERESA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (234, true, 1, '2023-07-03 14:52:45.899278', NULL, NULL, 'ITUMBIARA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (235, true, 1, '2023-07-03 14:52:45.900438', NULL, NULL, 'TIANGUÁ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (236, true, 1, '2023-07-03 14:52:45.901563', NULL, NULL, 'ARAGUATINS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (237, true, 1, '2023-07-03 14:52:45.902738', NULL, NULL, 'BURITICUPU', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (238, true, 1, '2023-07-03 14:52:45.90403', NULL, NULL, 'MARIANA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (239, true, 1, '2023-07-03 14:52:45.905195', NULL, NULL, 'BENEVIDES', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (240, true, 1, '2023-07-03 14:52:45.906346', NULL, NULL, 'CACHOEIRA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (241, true, 1, '2023-07-03 14:52:45.907577', NULL, NULL, 'IVATUBA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (242, true, 1, '2023-07-03 14:52:45.9088', NULL, NULL, 'SÃO RAIMUNDO NONATO', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (243, true, 1, '2023-07-03 14:52:45.910014', NULL, NULL, 'SÃO FÉLIX DO XINGU', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (244, true, 1, '2023-07-03 14:52:45.91131', NULL, NULL, 'JACOBINA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (245, true, 1, '2023-07-03 14:52:45.9125', NULL, NULL, 'IRECÊ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (246, true, 1, '2023-07-03 14:52:45.913727', NULL, NULL, 'SENHOR DO BONFIM', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (247, true, 1, '2023-07-03 14:52:45.915372', NULL, NULL, 'TUCANO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (248, true, 1, '2023-07-03 14:52:45.916812', NULL, NULL, 'CAMPO NOVO DO PARECIS', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (249, true, 1, '2023-07-03 14:52:45.918186', NULL, NULL, 'ITURAMA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (250, true, 1, '2023-07-03 14:52:45.919425', NULL, NULL, 'PRAIA GRANDE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (251, true, 1, '2023-07-03 14:52:45.920811', NULL, NULL, 'UMUARAMA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (252, true, 1, '2023-07-03 14:52:45.92207', NULL, NULL, 'ALMENARA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (253, true, 1, '2023-07-03 14:52:45.923322', NULL, NULL, 'ARAÇUAÍ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (254, true, 1, '2023-07-03 14:52:45.924591', NULL, NULL, 'CAPELINHA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (255, true, 1, '2023-07-03 14:52:45.925864', NULL, NULL, 'GUANHÃES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (256, true, 1, '2023-07-03 14:52:45.927146', NULL, NULL, 'CASA NOVA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (257, true, 1, '2023-07-03 14:52:45.928394', NULL, NULL, 'PONTALINA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (258, true, 1, '2023-07-03 14:52:45.929685', NULL, NULL, 'REMANSO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (259, true, 1, '2023-07-03 14:52:45.930927', NULL, NULL, 'ITABERAÍ', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (260, true, 1, '2023-07-03 14:52:45.932143', NULL, NULL, 'ITAPEVI', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (261, true, 1, '2023-07-03 14:52:45.933402', NULL, NULL, 'ITABIRITO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (262, true, 1, '2023-07-03 14:52:45.934643', NULL, NULL, 'MANACAPURU', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (263, true, 1, '2023-07-03 14:52:45.935933', NULL, NULL, 'ALVORADA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (264, true, 1, '2023-07-03 14:52:45.937255', NULL, NULL, 'ANÁPOLIS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (265, true, 1, '2023-07-03 14:52:45.938535', NULL, NULL, 'GOVERNADOR VALADARES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (266, true, 1, '2023-07-03 14:52:45.939801', NULL, NULL, 'GUARAPARI', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (267, true, 1, '2023-07-03 14:52:45.941114', NULL, NULL, 'IMPERATRIZ', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (268, true, 1, '2023-07-03 14:52:45.942367', NULL, NULL, 'IPATINGA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (269, true, 1, '2023-07-03 14:52:45.943627', NULL, NULL, 'ITABUNA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (270, true, 1, '2023-07-03 14:52:45.944858', NULL, NULL, 'ITAPECERICA DA SERRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (271, true, 1, '2023-07-03 14:52:45.946116', NULL, NULL, 'ITAPETININGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (272, true, 1, '2023-07-03 14:52:45.947362', NULL, NULL, 'ITAPEVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (273, true, 1, '2023-07-03 14:52:45.948589', NULL, NULL, 'JACAREÍ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (274, true, 1, '2023-07-03 14:52:45.949788', NULL, NULL, 'JAÚ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (275, true, 1, '2023-07-03 14:52:45.951058', NULL, NULL, 'JEQUIÉ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (276, true, 1, '2023-07-03 14:52:45.952312', NULL, NULL, 'LIMEIRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (277, true, 1, '2023-07-03 14:52:45.953609', NULL, NULL, 'LINHARES', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (278, true, 1, '2023-07-03 14:52:45.954901', NULL, NULL, 'MATÃO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (279, true, 1, '2023-07-03 14:52:45.956175', NULL, NULL, 'MOGI GUAÇU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (280, true, 1, '2023-07-03 14:52:45.957764', NULL, NULL, 'PARAGOMINAS', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (281, true, 1, '2023-07-03 14:52:45.959427', NULL, NULL, 'PARAUAPEBAS', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (282, true, 1, '2023-07-03 14:52:45.961201', NULL, NULL, 'PASSO FUNDO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (283, true, 1, '2023-07-03 14:52:45.962871', NULL, NULL, 'PELOTAS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (284, true, 1, '2023-07-03 14:52:45.964233', NULL, NULL, 'POÇOS DE CALDAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (285, true, 1, '2023-07-03 14:52:45.965468', NULL, NULL, 'PRIMAVERA DO LESTE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (286, true, 1, '2023-07-03 14:52:45.966724', NULL, NULL, 'RIBEIRÃO DAS NEVES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (287, true, 1, '2023-07-03 14:52:45.968082', NULL, NULL, 'RONDONÓPOLIS', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (288, true, 1, '2023-07-03 14:52:45.969385', NULL, NULL, 'SANTA BÁRBARA D''OESTE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (289, true, 1, '2023-07-03 14:52:45.970648', NULL, NULL, 'SÃO JOÃO DE MERITI', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (290, true, 1, '2023-07-03 14:52:45.971908', NULL, NULL, 'SERRA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (291, true, 1, '2023-07-03 14:52:45.973339', NULL, NULL, 'SERTÃOZINHO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (292, true, 1, '2023-07-03 14:52:45.974709', NULL, NULL, 'SORRISO', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (293, true, 1, '2023-07-03 14:52:45.975997', NULL, NULL, 'SUMARÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (294, true, 1, '2023-07-03 14:52:45.977211', NULL, NULL, 'TANGARÁ DA SERRA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (295, true, 1, '2023-07-03 14:52:45.978484', NULL, NULL, 'TEIXEIRA DE FREITAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (296, true, 1, '2023-07-03 14:52:45.979794', NULL, NULL, 'VALINHOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (297, true, 1, '2023-07-03 14:52:45.981113', NULL, NULL, 'VALPARAÍSO DE GOIÁS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (298, true, 1, '2023-07-03 14:52:45.982422', NULL, NULL, 'RIO GRANDE', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (299, true, 1, '2023-07-03 14:52:45.983725', NULL, NULL, 'VOTORANTIM', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (300, true, 1, '2023-07-03 14:52:45.985005', NULL, NULL, 'RESTINGA SECA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (301, true, 1, '2023-07-03 14:52:45.986267', NULL, NULL, 'CURVELO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (302, true, 1, '2023-07-03 14:52:45.987608', NULL, NULL, 'PIRAPORA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (303, true, 1, '2023-07-03 14:52:45.988918', NULL, NULL, 'BRUMADINHO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (304, true, 1, '2023-07-03 14:52:45.990172', NULL, NULL, 'TOLEDO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (305, true, 1, '2023-07-03 14:52:45.991382', NULL, NULL, 'ASTORGA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (306, true, 1, '2023-07-03 14:52:45.992585', NULL, NULL, 'VALENÇA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (307, true, 1, '2023-07-03 14:52:45.993893', NULL, NULL, 'PASSOS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (308, true, 1, '2023-07-03 14:52:45.99513', NULL, NULL, 'PORTO SEGURO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (309, true, 1, '2023-07-03 14:52:45.996377', NULL, NULL, 'FERNANDÓPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (310, true, 1, '2023-07-03 14:52:45.99763', NULL, NULL, 'CRATO', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (311, true, 1, '2023-07-03 14:52:45.998954', NULL, NULL, 'IJUÍ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (312, true, 1, '2023-07-03 14:52:46.00032', NULL, NULL, 'BERTIOGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (313, true, 1, '2023-07-03 14:52:46.001801', NULL, NULL, 'BIRIGUI', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (314, true, 1, '2023-07-03 14:52:46.003152', NULL, NULL, 'BOA ESPERANÇA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (315, true, 1, '2023-07-03 14:52:46.004626', NULL, NULL, 'JABOTICABAL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (316, true, 1, '2023-07-03 14:52:46.005936', NULL, NULL, 'SÃO SEBASTIÃO DO PARAÍSO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (317, true, 1, '2023-07-03 14:52:46.007232', NULL, NULL, 'CAMAQUÃ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (318, true, 1, '2023-07-03 14:52:46.008608', NULL, NULL, 'CAMPO ERÊ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (319, true, 1, '2023-07-03 14:52:46.009988', NULL, NULL, 'CACHOEIRA PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (320, true, 1, '2023-07-03 14:52:46.011295', NULL, NULL, 'CASA BRANCA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (321, true, 1, '2023-07-03 14:52:46.012602', NULL, NULL, 'ARACRUZ', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (322, true, 1, '2023-07-03 14:52:46.013949', NULL, NULL, 'NOVO PROGRESSO', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (323, true, 1, '2023-07-03 14:52:46.015146', NULL, NULL, 'MOSSORÓ', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (324, true, 1, '2023-07-03 14:52:46.016324', NULL, NULL, 'ARAPUTANGA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (325, true, 1, '2023-07-03 14:52:46.017448', NULL, NULL, 'MACAÉ', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (326, true, 1, '2023-07-03 14:52:46.018611', NULL, NULL, 'CAICÓ', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (327, true, 1, '2023-07-03 14:52:46.019853', NULL, NULL, 'CAMBÉ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (328, true, 1, '2023-07-03 14:52:46.021049', NULL, NULL, 'CAPIVARI', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (329, true, 1, '2023-07-03 14:52:46.022238', NULL, NULL, 'RIO BONITO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (330, true, 1, '2023-07-03 14:52:46.023438', NULL, NULL, 'CRISTALINA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (331, true, 1, '2023-07-03 14:52:46.02471', NULL, NULL, 'CATANDUVAS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (332, true, 1, '2023-07-03 14:52:46.025916', NULL, NULL, 'IGUATU', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (333, true, 1, '2023-07-03 14:52:46.027137', NULL, NULL, 'ARAPIRACA', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (334, true, 1, '2023-07-03 14:52:46.028347', NULL, NULL, 'PALMEIRA DOS ÍNDIOS', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (335, true, 1, '2023-07-03 14:52:46.02964', NULL, NULL, 'MARACANAÚ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (336, true, 1, '2023-07-03 14:52:46.030862', NULL, NULL, 'MARAU', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (337, true, 1, '2023-07-03 14:52:46.032036', NULL, NULL, 'EUSÉBIO', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (338, true, 1, '2023-07-03 14:52:46.033219', NULL, NULL, 'COROMANDEL', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (339, true, 1, '2023-07-03 14:52:46.034376', NULL, NULL, 'JOÃO PINHEIRO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (340, true, 1, '2023-07-03 14:52:46.03553', NULL, NULL, 'ILHA SOLTEIRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (341, true, 1, '2023-07-03 14:52:46.036688', NULL, NULL, 'ITABORAÍ', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (342, true, 1, '2023-07-03 14:52:46.037861', NULL, NULL, 'CAMPO LARGO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (343, true, 1, '2023-07-03 14:52:46.039', NULL, NULL, 'FARROUPILHA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (344, true, 1, '2023-07-03 14:52:46.040134', NULL, NULL, 'GRAVATAÍ', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (345, true, 1, '2023-07-03 14:52:46.041254', NULL, NULL, 'ITAJAÍ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (346, true, 1, '2023-07-03 14:52:46.042379', NULL, NULL, 'NOVA PETRÓPOLIS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (347, true, 1, '2023-07-03 14:52:46.043602', NULL, NULL, 'RIO DAS OSTRAS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (348, true, 1, '2023-07-03 14:52:46.044872', NULL, NULL, 'SANTO ÂNGELO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (349, true, 1, '2023-07-03 14:52:46.046208', NULL, NULL, 'UNAÍ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (350, true, 1, '2023-07-03 14:52:46.047415', NULL, NULL, 'CONCÓRDIA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (351, true, 1, '2023-07-03 14:52:46.050461', NULL, NULL, 'CONCHAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (352, true, 1, '2023-07-03 14:52:46.052057', NULL, NULL, 'TIMÓTEO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (353, true, 1, '2023-07-03 14:52:46.053635', NULL, NULL, 'CORNÉLIO PROCÓPIO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (354, true, 1, '2023-07-03 14:52:46.055179', NULL, NULL, 'TUPÃ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (355, true, 1, '2023-07-03 14:52:46.056788', NULL, NULL, 'VILHENA', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (356, true, 1, '2023-07-03 14:52:46.05791', NULL, NULL, 'COLÍDER', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (357, true, 1, '2023-07-03 14:52:46.059035', NULL, NULL, 'ESCADA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (358, true, 1, '2023-07-03 14:52:46.060332', NULL, NULL, 'CANOINHAS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (359, true, 1, '2023-07-03 14:52:46.061557', NULL, NULL, 'CABO FRIO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (360, true, 1, '2023-07-03 14:52:46.06286', NULL, NULL, 'SANTA MARIA DE JETIBÁ', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (361, true, 1, '2023-07-03 14:52:46.064188', NULL, NULL, 'CONCEIÇÃO DO COITÉ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (362, true, 1, '2023-07-03 14:52:46.065414', NULL, NULL, 'VESPASIANO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (363, true, 1, '2023-07-03 14:52:46.066618', NULL, NULL, 'GUARATINGUETÁ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (364, true, 1, '2023-07-03 14:52:46.067811', NULL, NULL, 'SIDROLÂNDIA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (365, true, 1, '2023-07-03 14:52:46.068946', NULL, NULL, 'CAMPO BELO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (366, true, 1, '2023-07-03 14:52:46.070074', NULL, NULL, 'CATAGUASES', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (367, true, 1, '2023-07-03 14:52:46.071222', NULL, NULL, 'CHAPADÃO DO SUL', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (368, true, 1, '2023-07-03 14:52:46.072368', NULL, NULL, 'FÁTIMA DO SUL', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (369, true, 1, '2023-07-03 14:52:46.073527', NULL, NULL, 'NOVA ANDRADINA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (370, true, 1, '2023-07-03 14:52:46.074674', NULL, NULL, 'SANTA CRUZ DO RIO PARDO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (371, true, 1, '2023-07-03 14:52:46.075847', NULL, NULL, 'HOLAMBRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (372, true, 1, '2023-07-03 14:52:46.077017', NULL, NULL, 'AGUDOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (373, true, 1, '2023-07-03 14:52:46.078161', NULL, NULL, 'ALTA FLORESTA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (374, true, 1, '2023-07-03 14:52:46.079346', NULL, NULL, 'AMAMBAÍ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (375, true, 1, '2023-07-03 14:52:46.080503', NULL, NULL, 'AMPÉRE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (376, true, 1, '2023-07-03 14:52:46.081712', NULL, NULL, 'ANICUNS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (377, true, 1, '2023-07-03 14:52:46.082851', NULL, NULL, 'APUCARANA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (378, true, 1, '2023-07-03 14:52:46.083967', NULL, NULL, 'ARARAQUARA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (379, true, 1, '2023-07-03 14:52:46.085117', NULL, NULL, 'ASSIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (380, true, 1, '2023-07-03 14:52:46.086286', NULL, NULL, 'BALSAS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (381, true, 1, '2023-07-03 14:52:46.087428', NULL, NULL, 'BARUERI', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (382, true, 1, '2023-07-03 14:52:46.088582', NULL, NULL, 'BOITUVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (383, true, 1, '2023-07-03 14:52:46.089725', NULL, NULL, 'BOTUCATU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (384, true, 1, '2023-07-03 14:52:46.090836', NULL, NULL, 'BRAGANÇA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (385, true, 1, '2023-07-03 14:52:46.091951', NULL, NULL, 'CAFELÂNDIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (386, true, 1, '2023-07-03 14:52:46.093063', NULL, NULL, 'CAIEIRAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (387, true, 1, '2023-07-03 14:52:46.09417', NULL, NULL, 'CALDAS NOVAS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (388, true, 1, '2023-07-03 14:52:46.095373', NULL, NULL, 'CAMPINA GRANDE DO SUL', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (389, true, 1, '2023-07-03 14:52:46.096615', NULL, NULL, 'CARIACICA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (390, true, 1, '2023-07-03 14:52:46.097834', NULL, NULL, 'CASTELO', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (391, true, 1, '2023-07-03 14:52:46.099005', NULL, NULL, 'GUAÇUÍ', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (392, true, 1, '2023-07-03 14:52:46.100165', NULL, NULL, 'ANDRADINA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (393, true, 1, '2023-07-03 14:52:46.101296', NULL, NULL, 'ARARIPINA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (394, true, 1, '2023-07-03 14:52:46.102414', NULL, NULL, 'LIMOEIRO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (395, true, 1, '2023-07-03 14:52:46.103595', NULL, NULL, 'BELO JARDIM', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (396, true, 1, '2023-07-03 14:52:46.104745', NULL, NULL, 'CAMPO MAIOR', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (397, true, 1, '2023-07-03 14:52:46.105959', NULL, NULL, 'ALÉM PARAÍBA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (398, true, 1, '2023-07-03 14:52:46.107176', NULL, NULL, 'SERRA TALHADA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (399, true, 1, '2023-07-03 14:52:46.110017', NULL, NULL, 'CODÓ', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (400, true, 1, '2023-07-03 14:52:46.111178', NULL, NULL, 'GOIANA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (401, true, 1, '2023-07-03 14:52:46.112266', NULL, NULL, 'TIMBAÚBA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (402, true, 1, '2023-07-03 14:52:46.11339', NULL, NULL, 'SÃO FIDÉLIS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (403, true, 1, '2023-07-03 14:52:46.11449', NULL, NULL, 'CAPIM GROSSO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (404, true, 1, '2023-07-03 14:52:46.115617', NULL, NULL, 'BRAGANÇA PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (405, true, 1, '2023-07-03 14:52:46.116757', NULL, NULL, 'SANTA MARIA DA VITÓRIA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (406, true, 1, '2023-07-03 14:52:46.117949', NULL, NULL, 'CHAPECÓ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (407, true, 1, '2023-07-03 14:52:46.119187', NULL, NULL, 'JANAÚBA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (408, true, 1, '2023-07-03 14:52:46.120474', NULL, NULL, 'CAMPOS GERAIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (409, true, 1, '2023-07-03 14:52:46.121935', NULL, NULL, 'SÃO GOTARDO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (410, true, 1, '2023-07-03 14:52:46.123141', NULL, NULL, 'MAIRIPORÃ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (411, true, 1, '2023-07-03 14:52:46.124336', NULL, NULL, 'SALGUEIRO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (412, true, 1, '2023-07-03 14:52:46.125615', NULL, NULL, 'CABO DE SANTO AGOSTINHO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (413, true, 1, '2023-07-03 14:52:46.126862', NULL, NULL, 'IGARASSU', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (414, true, 1, '2023-07-03 14:52:46.128064', NULL, NULL, 'BOM JESUS DA LAPA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (415, true, 1, '2023-07-03 14:52:46.129245', NULL, NULL, 'ERECHIM', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (416, true, 1, '2023-07-03 14:52:46.13052', NULL, NULL, 'PARAÍSO DO TOCANTINS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (417, true, 1, '2023-07-03 14:52:46.132458', NULL, NULL, 'SANTA MARIA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (418, true, 1, '2023-07-03 14:52:46.133746', NULL, NULL, 'TUCURUÍ', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (419, true, 1, '2023-07-03 14:52:46.135407', NULL, NULL, 'MARICÁ', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (420, true, 1, '2023-07-03 14:52:46.137484', NULL, NULL, 'TRÊS RIOS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (421, true, 1, '2023-07-03 14:52:46.138737', NULL, NULL, 'AUGUSTINÓPOLIS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (422, true, 1, '2023-07-03 14:52:46.139982', NULL, NULL, 'ITAMARAJU', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (423, true, 1, '2023-07-03 14:52:46.142432', NULL, NULL, 'XAXIM', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (424, true, 1, '2023-07-03 14:52:46.144172', NULL, NULL, 'EXTREMA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (425, true, 1, '2023-07-03 14:52:46.14578', NULL, NULL, 'JUATUBA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (426, true, 1, '2023-07-03 14:52:46.147449', NULL, NULL, 'JACIARA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (427, true, 1, '2023-07-03 14:52:46.149067', NULL, NULL, 'ÁGUA BOA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (428, true, 1, '2023-07-03 14:52:46.150323', NULL, NULL, 'PALMARES', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (429, true, 1, '2023-07-03 14:52:46.151514', NULL, NULL, 'COLINAS DO TOCANTINS', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (430, true, 1, '2023-07-03 14:52:46.152638', NULL, NULL, 'SÃO FRANCISCO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (431, true, 1, '2023-07-03 14:52:46.153889', NULL, NULL, 'CRUZEIRO DO SUL', NULL, 'AC', 'BRASIL');
INSERT INTO public.endereco VALUES (432, true, 1, '2023-07-03 14:52:46.155143', NULL, NULL, 'ITAPEMA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (433, true, 1, '2023-07-03 14:52:46.156485', NULL, NULL, 'URUGUAIANA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (434, true, 1, '2023-07-03 14:52:46.157714', NULL, NULL, 'REDUTO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (435, true, 1, '2023-07-03 14:52:46.159166', NULL, NULL, 'DRACENA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (436, true, 1, '2023-07-03 14:52:46.160523', NULL, NULL, 'DUQUE DE CAXIAS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (437, true, 1, '2023-07-03 14:52:46.16182', NULL, NULL, 'MONTE APRAZÍVEL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (438, true, 1, '2023-07-03 14:52:46.163057', NULL, NULL, 'IPU', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (439, true, 1, '2023-07-03 14:52:46.164428', NULL, NULL, 'COSTA RICA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (440, true, 1, '2023-07-03 14:52:46.165695', NULL, NULL, 'JARU', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (441, true, 1, '2023-07-03 14:52:46.166926', NULL, NULL, 'SÃO MATEUS DO MARANHÃO', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (442, true, 1, '2023-07-03 14:52:46.168183', NULL, NULL, 'TAILÂNDIA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (443, true, 1, '2023-07-03 14:52:46.169446', NULL, NULL, 'PEDREIRAS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (444, true, 1, '2023-07-03 14:52:46.170649', NULL, NULL, 'SÃO JOÃO DO PIAUÍ', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (445, true, 1, '2023-07-03 14:52:46.171861', NULL, NULL, 'PETROLINA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (446, true, 1, '2023-07-03 14:52:46.173055', NULL, NULL, 'PARACAMBI', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (447, true, 1, '2023-07-03 14:52:46.174202', NULL, NULL, 'SANTO ANTÔNIO DE PÁDUA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (448, true, 1, '2023-07-03 14:52:46.175388', NULL, NULL, 'BOM JESUS DO ITABAPOANA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (449, true, 1, '2023-07-03 14:52:46.176701', NULL, NULL, 'BEZERROS', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (450, true, 1, '2023-07-03 14:52:46.178', NULL, NULL, 'ELESBÃO VELOSO', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (451, true, 1, '2023-07-03 14:52:46.179222', NULL, NULL, 'PACAJUS', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (452, true, 1, '2023-07-03 14:52:46.180448', NULL, NULL, 'REDENÇÃO', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (453, true, 1, '2023-07-03 14:52:46.181564', NULL, NULL, 'FLORIANO', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (454, true, 1, '2023-07-03 14:52:46.182785', NULL, NULL, 'MARECHAL CÂNDIDO RONDON', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (455, true, 1, '2023-07-03 14:52:46.184049', NULL, NULL, 'PITANGA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (456, true, 1, '2023-07-03 14:52:46.185284', NULL, NULL, 'TIMON', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (457, true, 1, '2023-07-03 14:52:46.186455', NULL, NULL, 'GARÇA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (458, true, 1, '2023-07-03 14:52:46.187663', NULL, NULL, 'TATUÍ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (459, true, 1, '2023-07-03 14:52:46.188829', NULL, NULL, 'VIANA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (460, true, 1, '2023-07-03 14:52:46.189946', NULL, NULL, 'ALEGRE', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (461, true, 1, '2023-07-03 14:52:46.191082', NULL, NULL, 'IBITINGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (462, true, 1, '2023-07-03 14:52:46.192207', NULL, NULL, 'ITUVERAVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (463, true, 1, '2023-07-03 14:52:46.193345', NULL, NULL, 'PENÁPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (464, true, 1, '2023-07-03 14:52:46.194641', NULL, NULL, 'SÃO JOSÉ DO RIO PARDO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (465, true, 1, '2023-07-03 14:52:46.196131', NULL, NULL, 'LUZ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (466, true, 1, '2023-07-03 14:52:46.197399', NULL, NULL, 'FRUTAL', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (467, true, 1, '2023-07-03 14:52:46.198735', NULL, NULL, 'GUARANTÃ DO NORTE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (468, true, 1, '2023-07-03 14:52:46.200056', NULL, NULL, 'HORTOLÂNDIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (469, true, 1, '2023-07-03 14:52:46.201341', NULL, NULL, 'IBAITI', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (470, true, 1, '2023-07-03 14:52:46.202645', NULL, NULL, 'INDIARA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (471, true, 1, '2023-07-03 14:52:46.203833', NULL, NULL, 'OURO PRETO DO OESTE', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (472, true, 1, '2023-07-03 14:52:46.20502', NULL, NULL, 'INHUMAS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (473, true, 1, '2023-07-03 14:52:46.206435', NULL, NULL, 'GARIBALDI', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (474, true, 1, '2023-07-03 14:52:46.207692', NULL, NULL, 'IPORÁ', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (475, true, 1, '2023-07-03 14:52:46.208883', NULL, NULL, 'ITAITUBA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (476, true, 1, '2023-07-03 14:52:46.210055', NULL, NULL, 'JANDAIA DO SUL', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (477, true, 1, '2023-07-03 14:52:46.21127', NULL, NULL, 'JUSSARA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (478, true, 1, '2023-07-03 14:52:46.212404', NULL, NULL, 'MARTINÓPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (479, true, 1, '2023-07-03 14:52:46.213532', NULL, NULL, 'MATUPÁ', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (480, true, 1, '2023-07-03 14:52:46.214652', NULL, NULL, 'MAUÁ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (481, true, 1, '2023-07-03 14:52:46.215768', NULL, NULL, 'NOVA LIMA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (482, true, 1, '2023-07-03 14:52:46.216894', NULL, NULL, 'AÇAILÂNDIA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (483, true, 1, '2023-07-03 14:52:46.217981', NULL, NULL, 'GARANHUNS', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (484, true, 1, '2023-07-03 14:52:46.219097', NULL, NULL, 'CASTANHAL', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (485, true, 1, '2023-07-03 14:52:46.220231', NULL, NULL, 'MIGUEL PEREIRA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (486, true, 1, '2023-07-03 14:52:46.221452', NULL, NULL, 'MIRASSOL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (487, true, 1, '2023-07-03 14:52:46.222567', NULL, NULL, 'NOVA MUTUM', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (488, true, 1, '2023-07-03 14:52:46.223692', NULL, NULL, 'NOVA SERRANA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (489, true, 1, '2023-07-03 14:52:46.224806', NULL, NULL, 'OLÍMPIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (490, true, 1, '2023-07-03 14:52:46.225933', NULL, NULL, 'PALMEIRAS DE GOIÁS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (491, true, 1, '2023-07-03 14:52:46.227056', NULL, NULL, 'PARÁ DE MINAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (492, true, 1, '2023-07-03 14:52:46.228168', NULL, NULL, 'PENEDO', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (493, true, 1, '2023-07-03 14:52:46.229276', NULL, NULL, 'PINHAIS', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (494, true, 1, '2023-07-03 14:52:46.230412', NULL, NULL, 'PIRACANJUBA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (495, true, 1, '2023-07-03 14:52:46.232173', NULL, NULL, 'PONTA PORÃ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (496, true, 1, '2023-07-03 14:52:46.233721', NULL, NULL, 'PORTO FELIZ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (497, true, 1, '2023-07-03 14:52:46.235226', NULL, NULL, 'PRESIDENTE EPITÁCIO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (498, true, 1, '2023-07-03 14:52:46.236741', NULL, NULL, 'PRESIDENTE VENCESLAU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (499, true, 1, '2023-07-03 14:52:46.238241', NULL, NULL, 'ROSANA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (500, true, 1, '2023-07-03 14:52:46.239346', NULL, NULL, 'QUIXERAMOBIM', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (501, true, 1, '2023-07-03 14:52:46.240473', NULL, NULL, 'RANCHARIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (502, true, 1, '2023-07-03 14:52:46.241596', NULL, NULL, 'RIBEIRÃO PIRES', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (503, true, 1, '2023-07-03 14:52:46.242848', NULL, NULL, 'ROLIM DE MOURA', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (504, true, 1, '2023-07-03 14:52:46.243954', NULL, NULL, 'ROSEIRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (505, true, 1, '2023-07-03 14:52:46.245113', NULL, NULL, 'SABARÁ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (506, true, 1, '2023-07-03 14:52:46.246295', NULL, NULL, 'ITABERABA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (507, true, 1, '2023-07-03 14:52:46.247516', NULL, NULL, 'SANTA INÊS', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (508, true, 1, '2023-07-03 14:52:46.248641', NULL, NULL, 'SANTA LUZIA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (509, true, 1, '2023-07-03 14:52:46.249751', NULL, NULL, 'SANTANA DE PARNAÍBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (510, true, 1, '2023-07-03 14:52:46.251184', NULL, NULL, 'SANTO ANTÔNIO DA PLATINA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (511, true, 1, '2023-07-03 14:52:46.252767', NULL, NULL, 'SÃO LOURENÇO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (512, true, 1, '2023-07-03 14:52:46.254254', NULL, NULL, 'SÃO MARCOS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (513, true, 1, '2023-07-03 14:52:46.255496', NULL, NULL, 'SÃO VICENTE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (514, true, 1, '2023-07-03 14:52:46.256697', NULL, NULL, 'SÃO JOAQUIM DA BARRA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (515, true, 1, '2023-07-03 14:52:46.257888', NULL, NULL, 'FLORESTA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (516, true, 1, '2023-07-03 14:52:46.259052', NULL, NULL, 'TAPEJARA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (517, true, 1, '2023-07-03 14:52:46.260158', NULL, NULL, 'TAQUARITINGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (518, true, 1, '2023-07-03 14:52:46.261342', NULL, NULL, 'CAPÃO BONITO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (519, true, 1, '2023-07-03 14:52:46.262569', NULL, NULL, 'CARAPICUÍBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (520, true, 1, '2023-07-03 14:52:46.263974', NULL, NULL, 'COTIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (521, true, 1, '2023-07-03 14:52:46.265154', NULL, NULL, 'CRUZEIRO DO OESTE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (522, true, 1, '2023-07-03 14:52:46.266418', NULL, NULL, 'DIADEMA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (523, true, 1, '2023-07-03 14:52:46.267591', NULL, NULL, 'FERRAZ DE VASCONCELOS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (524, true, 1, '2023-07-03 14:52:46.268825', NULL, NULL, 'FRANCO DA ROCHA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (525, true, 1, '2023-07-03 14:52:46.270284', NULL, NULL, 'HORIZONTE', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (526, true, 1, '2023-07-03 14:52:46.271527', NULL, NULL, 'ITAQUAQUECETUBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (527, true, 1, '2023-07-03 14:52:46.272797', NULL, NULL, 'ITATIBA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (528, true, 1, '2023-07-03 14:52:46.274073', NULL, NULL, 'MOCOCA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (529, true, 1, '2023-07-03 14:52:46.275235', NULL, NULL, 'POMPÉIA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (530, true, 1, '2023-07-03 14:52:46.276407', NULL, NULL, 'SÃO SEBASTIÃO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (531, true, 1, '2023-07-03 14:52:46.277717', NULL, NULL, 'BARRA BONITA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (532, true, 1, '2023-07-03 14:52:46.27893', NULL, NULL, 'IVAIPORÃ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (533, true, 1, '2023-07-03 14:52:46.280099', NULL, NULL, 'JUAZEIRO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (534, true, 1, '2023-07-03 14:52:46.281261', NULL, NULL, 'CAUCAIA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (535, true, 1, '2023-07-03 14:52:46.282411', NULL, NULL, 'ITAPIPOCA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (536, true, 1, '2023-07-03 14:52:46.283606', NULL, NULL, 'NOSSA SENHORA DO SOCORRO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (537, true, 1, '2023-07-03 14:52:46.284793', NULL, NULL, 'PARNAMIRIM', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (538, true, 1, '2023-07-03 14:52:46.285967', NULL, NULL, 'SENADOR CANEDO', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (539, true, 1, '2023-07-03 14:52:46.2872', NULL, NULL, 'FORMOSA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (540, true, 1, '2023-07-03 14:52:46.288492', NULL, NULL, 'FRANCISCO MORATO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (541, true, 1, '2023-07-03 14:52:46.289922', NULL, NULL, 'NOVO HAMBURGO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (542, true, 1, '2023-07-03 14:52:46.291164', NULL, NULL, 'CANOAS', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (543, true, 1, '2023-07-03 14:52:46.292301', NULL, NULL, 'ESTRELA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (544, true, 1, '2023-07-03 14:52:46.293501', NULL, NULL, 'PALHOÇA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (545, true, 1, '2023-07-03 14:52:46.294774', NULL, NULL, 'LUPÉRCIO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (546, true, 1, '2023-07-03 14:52:46.295978', NULL, NULL, 'SÃO BENTO DO SUL', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (547, true, 1, '2023-07-03 14:52:46.29725', NULL, NULL, 'TEODORO SAMPAIO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (548, true, 1, '2023-07-03 14:52:46.298443', NULL, NULL, 'TIETÊ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (549, true, 1, '2023-07-03 14:52:46.299869', NULL, NULL, 'SANTA TEREZINHA DE GOIÁS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (550, true, 1, '2023-07-03 14:52:46.301106', NULL, NULL, 'PONTE NOVA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (551, true, 1, '2023-07-03 14:52:46.302302', NULL, NULL, 'CHAPADINHA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (552, true, 1, '2023-07-03 14:52:46.303534', NULL, NULL, 'SUMÉ', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (553, true, 1, '2023-07-03 14:52:46.304746', NULL, NULL, 'VIAMÃO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (554, true, 1, '2023-07-03 14:52:46.305851', NULL, NULL, 'BARRA DO CORDA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (555, true, 1, '2023-07-03 14:52:46.306969', NULL, NULL, 'PIRATININGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (556, true, 1, '2023-07-03 14:52:46.308095', NULL, NULL, 'AÇU', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (557, true, 1, '2023-07-03 14:52:46.309328', NULL, NULL, 'CARANGOLA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (558, true, 1, '2023-07-03 14:52:46.310655', NULL, NULL, 'JOÃO MONLEVADE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (559, true, 1, '2023-07-03 14:52:46.312026', NULL, NULL, 'GUARATUBA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (560, true, 1, '2023-07-03 14:52:46.313148', NULL, NULL, 'BATURITÉ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (561, true, 1, '2023-07-03 14:52:46.314314', NULL, NULL, 'SANTA CRUZ DO SUL', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (562, true, 1, '2023-07-03 14:52:46.315502', NULL, NULL, 'CAPITÃO LEÔNIDAS MARQUES', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (563, true, 1, '2023-07-03 14:52:46.316787', NULL, NULL, 'GOIOERÊ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (564, true, 1, '2023-07-03 14:52:46.317936', NULL, NULL, 'UBIRATÃ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (565, true, 1, '2023-07-03 14:52:46.31903', NULL, NULL, 'RIBEIRA DO POMBAL', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (566, true, 1, '2023-07-03 14:52:46.320169', NULL, NULL, 'LAGARTO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (567, true, 1, '2023-07-03 14:52:46.321318', NULL, NULL, 'CORONEL JOÃO SÁ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (568, true, 1, '2023-07-03 14:52:46.322912', NULL, NULL, 'SÃO MIGUEL', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (569, true, 1, '2023-07-03 14:52:46.324539', NULL, NULL, 'CORRENTE', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (570, true, 1, '2023-07-03 14:52:46.326196', NULL, NULL, 'CURRAIS NOVOS', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (571, true, 1, '2023-07-03 14:52:46.327842', NULL, NULL, 'MONTE SANTO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (572, true, 1, '2023-07-03 14:52:46.329063', NULL, NULL, 'MILHÃ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (573, true, 1, '2023-07-03 14:52:46.330265', NULL, NULL, 'TRINDADE', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (574, true, 1, '2023-07-03 14:52:46.33143', NULL, NULL, 'AFOGADOS DA INGAZEIRA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (575, true, 1, '2023-07-03 14:52:46.332577', NULL, NULL, 'CABROBÓ', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (576, true, 1, '2023-07-03 14:52:46.333796', NULL, NULL, 'PIRES DO RIO', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (577, true, 1, '2023-07-03 14:52:46.334972', NULL, NULL, 'JUARA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (578, true, 1, '2023-07-03 14:52:46.336159', NULL, NULL, 'VIRGINÓPOLIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (579, true, 1, '2023-07-03 14:52:46.337382', NULL, NULL, 'SURUBIM', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (580, true, 1, '2023-07-03 14:52:46.338578', NULL, NULL, 'ITAGUAÍ', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (581, true, 1, '2023-07-03 14:52:46.339792', NULL, NULL, 'FAZENDA RIO GRANDE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (582, true, 1, '2023-07-03 14:52:46.341047', NULL, NULL, 'COLOMBO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (583, true, 1, '2023-07-03 14:52:46.342266', NULL, NULL, 'MEDIANEIRA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (584, true, 1, '2023-07-03 14:52:46.343398', NULL, NULL, 'OLIVEIRA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (585, true, 1, '2023-07-03 14:52:46.344516', NULL, NULL, 'EMBU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (586, true, 1, '2023-07-03 14:52:46.345678', NULL, NULL, 'GUAIÚBA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (587, true, 1, '2023-07-03 14:52:46.346863', NULL, NULL, 'EUNÁPOLIS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (588, true, 1, '2023-07-03 14:52:46.348007', NULL, NULL, 'CANINDÉ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (589, true, 1, '2023-07-03 14:52:46.349184', NULL, NULL, 'PIMENTA BUENO', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (590, true, 1, '2023-07-03 14:52:46.350362', NULL, NULL, 'CÁCERES', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (591, true, 1, '2023-07-03 14:52:46.351637', NULL, NULL, 'IPIRÁ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (592, true, 1, '2023-07-03 14:52:46.353339', NULL, NULL, 'CERES', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (593, true, 1, '2023-07-03 14:52:46.355152', NULL, NULL, 'GOIANÉSIA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (594, true, 1, '2023-07-03 14:52:46.356602', NULL, NULL, 'JARAGUÁ', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (595, true, 1, '2023-07-03 14:52:46.357919', NULL, NULL, 'RUBIATABA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (596, true, 1, '2023-07-03 14:52:46.359176', NULL, NULL, 'COROATÁ', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (597, true, 1, '2023-07-03 14:52:46.360393', NULL, NULL, 'PAU DOS FERROS', NULL, 'RN', 'BRASIL');
INSERT INTO public.endereco VALUES (598, true, 1, '2023-07-03 14:52:46.361524', NULL, NULL, 'ITAÚNA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (599, true, 1, '2023-07-03 14:52:46.362715', NULL, NULL, 'PARAMBU', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (600, true, 1, '2023-07-03 14:52:46.363957', NULL, NULL, 'BANDEIRANTES', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (601, true, 1, '2023-07-03 14:52:46.365049', NULL, NULL, 'PIUM', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (602, true, 1, '2023-07-03 14:52:46.36616', NULL, NULL, 'JAGUARIAÍVA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (603, true, 1, '2023-07-03 14:52:46.367368', NULL, NULL, 'ÁGUAS LINDAS DE GOIÁS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (604, true, 1, '2023-07-03 14:52:46.368762', NULL, NULL, 'CERQUILHO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (605, true, 1, '2023-07-03 14:52:46.370039', NULL, NULL, 'CIDADE OCIDENTAL', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (606, true, 1, '2023-07-03 14:52:46.371235', NULL, NULL, 'JANUÁRIA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (607, true, 1, '2023-07-03 14:52:46.372405', NULL, NULL, 'PEDERNEIRAS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (608, true, 1, '2023-07-03 14:52:46.37353', NULL, NULL, 'CAMOCIM', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (609, true, 1, '2023-07-03 14:52:46.374683', NULL, NULL, 'SOUSA', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (610, true, 1, '2023-07-03 14:52:46.375809', NULL, NULL, 'GUARAÍ', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (611, true, 1, '2023-07-03 14:52:46.376981', NULL, NULL, 'ARAPONGAS', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (612, true, 1, '2023-07-03 14:52:46.378093', NULL, NULL, 'HORIZONTINA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (613, true, 1, '2023-07-03 14:52:46.379249', NULL, NULL, 'PIRAJU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (614, true, 1, '2023-07-03 14:52:46.380549', NULL, NULL, 'PORANGATU', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (615, true, 1, '2023-07-03 14:52:46.381783', NULL, NULL, 'LOANDA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (616, true, 1, '2023-07-03 14:52:46.382934', NULL, NULL, 'MANTENA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (617, true, 1, '2023-07-03 14:52:46.384091', NULL, NULL, 'IPAUSSU', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (618, true, 1, '2023-07-03 14:52:46.385269', NULL, NULL, 'ITANHAÉM', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (619, true, 1, '2023-07-03 14:52:46.386483', NULL, NULL, 'ITAPURANGA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (620, true, 1, '2023-07-03 14:52:46.387633', NULL, NULL, 'SANTA QUITÉRIA', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (621, true, 1, '2023-07-03 14:52:46.388799', NULL, NULL, 'QUIRINÓPOLIS', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (622, true, 1, '2023-07-03 14:52:46.390103', NULL, NULL, 'ARUJÁ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (623, true, 1, '2023-07-03 14:52:46.391507', NULL, NULL, 'SÃO GONÇALO', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (624, true, 1, '2023-07-03 14:52:46.392817', NULL, NULL, 'TIMBÓ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (625, true, 1, '2023-07-03 14:52:46.394124', NULL, NULL, 'PADRE BERNARDO', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (626, true, 1, '2023-07-03 14:52:46.395361', NULL, NULL, 'NOVO GAMA', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (627, true, 1, '2023-07-03 14:52:46.396649', NULL, NULL, 'CARPINA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (628, true, 1, '2023-07-03 14:52:46.397915', NULL, NULL, 'SANTANA', NULL, 'AP', 'BRASIL');
INSERT INTO public.endereco VALUES (629, true, 1, '2023-07-03 14:52:46.39945', NULL, NULL, 'ITUIUTABA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (630, true, 1, '2023-07-03 14:52:46.401036', NULL, NULL, 'PARNARAMA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (631, true, 1, '2023-07-03 14:52:46.402737', NULL, NULL, 'SÃO MANUEL', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (632, true, 1, '2023-07-03 14:52:46.404271', NULL, NULL, 'TUCUMÃ', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (633, true, 1, '2023-07-03 14:52:46.405614', NULL, NULL, 'XINGUARA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (634, true, 1, '2023-07-03 14:52:46.406924', NULL, NULL, 'CROATÁ', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (635, true, 1, '2023-07-03 14:52:46.408375', NULL, NULL, 'COARI', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (636, true, 1, '2023-07-03 14:52:46.409728', NULL, NULL, 'DIAS D''ÁVILA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (637, true, 1, '2023-07-03 14:52:46.411052', NULL, NULL, 'ITACOATIARA', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (638, true, 1, '2023-07-03 14:52:46.412663', NULL, NULL, 'PARINTINS', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (639, true, 1, '2023-07-03 14:52:46.414384', NULL, NULL, 'TEFÉ', NULL, 'AM', 'BRASIL');
INSERT INTO public.endereco VALUES (640, true, 1, '2023-07-03 14:52:46.416125', NULL, NULL, 'BREVES', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (641, true, 1, '2023-07-03 14:52:46.417856', NULL, NULL, 'IGARAPÉ-MIRI', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (642, true, 1, '2023-07-03 14:52:46.419576', NULL, NULL, 'MOJI MIRIM', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (643, true, 1, '2023-07-03 14:52:46.421302', NULL, NULL, 'PICOS', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (644, true, 1, '2023-07-03 14:52:46.422716', NULL, NULL, 'CANELA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (645, true, 1, '2023-07-03 14:52:46.424053', NULL, NULL, 'PALOTINA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (646, true, 1, '2023-07-03 14:52:46.425267', NULL, NULL, 'NOVA VENÉCIA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (647, true, 1, '2023-07-03 14:52:46.426454', NULL, NULL, 'CLEVELÂNDIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (648, true, 1, '2023-07-03 14:52:46.427634', NULL, NULL, 'NOVA ODESSA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (649, true, 1, '2023-07-03 14:52:46.428762', NULL, NULL, 'ITINGA DO MARANHÃO', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (650, true, 1, '2023-07-03 14:52:46.429902', NULL, NULL, 'IPOJUCA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (651, true, 1, '2023-07-03 14:52:46.431066', NULL, NULL, 'LENÇÓIS PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (652, true, 1, '2023-07-03 14:52:46.432316', NULL, NULL, 'CAPANEMA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (653, true, 1, '2023-07-03 14:52:46.433514', NULL, NULL, 'ROLÂNDIA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (654, true, 1, '2023-07-03 14:52:46.43472', NULL, NULL, 'PEDRO LEOPOLDO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (655, true, 1, '2023-07-03 14:52:46.436029', NULL, NULL, 'PERUÍBE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (656, true, 1, '2023-07-03 14:52:46.437295', NULL, NULL, 'PINHALZINHO', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (657, true, 1, '2023-07-03 14:52:46.438535', NULL, NULL, 'CANINDÉ DE SÃO FRANCISCO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (658, true, 1, '2023-07-03 14:52:46.439846', NULL, NULL, 'TRÊS LAGOAS', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (659, true, 1, '2023-07-03 14:52:46.44115', NULL, NULL, 'BACABAL', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (660, true, 1, '2023-07-03 14:52:46.44243', NULL, NULL, 'BRUMADO', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (661, true, 1, '2023-07-03 14:52:46.443639', NULL, NULL, 'PARANAGUÁ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (662, true, 1, '2023-07-03 14:52:46.444801', NULL, NULL, 'PORTO BELO', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (663, true, 1, '2023-07-03 14:52:46.446188', NULL, NULL, 'PORTO NACIONAL', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (664, true, 1, '2023-07-03 14:52:46.447635', NULL, NULL, 'AIMORÉS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (665, true, 1, '2023-07-03 14:52:46.449843', NULL, NULL, 'BAEPENDI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (666, true, 1, '2023-07-03 14:52:46.45119', NULL, NULL, 'BARÃO DE COCAIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (667, true, 1, '2023-07-03 14:52:46.452594', NULL, NULL, 'ITANHANDU', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (668, true, 1, '2023-07-03 14:52:46.453826', NULL, NULL, 'LAMBARI', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (669, true, 1, '2023-07-03 14:52:46.455186', NULL, NULL, 'LEOPOLDINA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (670, true, 1, '2023-07-03 14:52:46.456445', NULL, NULL, 'SÃO JOÃO NEPOMUCENO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (671, true, 1, '2023-07-03 14:52:46.457757', NULL, NULL, 'VISCONDE DO RIO BRANCO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (672, true, 1, '2023-07-03 14:52:46.459005', NULL, NULL, 'PRESIDENTE DUTRA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (673, true, 1, '2023-07-03 14:52:46.460151', NULL, NULL, 'CRATEÚS', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (674, true, 1, '2023-07-03 14:52:46.461247', NULL, NULL, 'ALFENAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (675, true, 1, '2023-07-03 14:52:46.462376', NULL, NULL, 'JUNQUEIRÓPOLIS', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (676, true, 1, '2023-07-03 14:52:46.463546', NULL, NULL, 'OSVALDO CRUZ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (677, true, 1, '2023-07-03 14:52:46.464664', NULL, NULL, 'REALEZA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (678, true, 1, '2023-07-03 14:52:46.465787', NULL, NULL, 'TUPI PAULISTA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (679, true, 1, '2023-07-03 14:52:46.467046', NULL, NULL, 'CANDEIAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (680, true, 1, '2023-07-03 14:52:46.468306', NULL, NULL, 'BERTÓPOLIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (681, true, 1, '2023-07-03 14:52:46.469834', NULL, NULL, 'RIACHÃO DO JACUÍPE', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (682, true, 1, '2023-07-03 14:52:46.471116', NULL, NULL, 'UMBAÚBA', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (683, true, 1, '2023-07-03 14:52:46.472312', NULL, NULL, 'ALTO SANTO', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (684, true, 1, '2023-07-03 14:52:46.473487', NULL, NULL, 'PALMITOS', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (685, true, 1, '2023-07-03 14:52:46.47461', NULL, NULL, 'PEDRO AFONSO', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (686, true, 1, '2023-07-03 14:52:46.475719', NULL, NULL, 'CORUMBÁ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (687, true, 1, '2023-07-03 14:52:46.477224', NULL, NULL, 'SANTA CRUZ DO CAPIBARIBE', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (688, true, 1, '2023-07-03 14:52:46.478332', NULL, NULL, 'PINHEIRO', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (689, true, 1, '2023-07-03 14:52:46.47951', NULL, NULL, 'NOVO HORIZONTE', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (690, true, 1, '2023-07-03 14:52:46.480708', NULL, NULL, 'NAZARÉ DA MATA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (691, true, 1, '2023-07-03 14:52:46.481882', NULL, NULL, 'IPIAÚ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (692, true, 1, '2023-07-03 14:52:46.483072', NULL, NULL, 'CAÇAPAVA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (693, true, 1, '2023-07-03 14:52:46.484229', NULL, NULL, 'QUEIMADAS', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (694, true, 1, '2023-07-03 14:52:46.485344', NULL, NULL, 'SANTOS DUMONT', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (695, true, 1, '2023-07-03 14:52:46.48648', NULL, NULL, 'TERRA BOA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (696, true, 1, '2023-07-03 14:52:46.487596', NULL, NULL, 'PÃO DE AÇÚCAR', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (697, true, 1, '2023-07-03 14:52:46.488697', NULL, NULL, 'IRATI', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (698, true, 1, '2023-07-03 14:52:46.48984', NULL, NULL, 'ARARANGUÁ', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (699, true, 1, '2023-07-03 14:52:46.490998', NULL, NULL, 'CAÇADOR', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (700, true, 1, '2023-07-03 14:52:46.492144', NULL, NULL, 'SÃO MIGUEL DO OESTE', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (701, true, 1, '2023-07-03 14:52:46.493266', NULL, NULL, 'TUBARÃO', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (702, true, 1, '2023-07-03 14:52:46.494362', NULL, NULL, 'URUAÇU', NULL, 'GO', 'BRASIL');
INSERT INTO public.endereco VALUES (703, true, 1, '2023-07-03 14:52:46.49554', NULL, NULL, 'SÃO LEOPOLDO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (704, true, 1, '2023-07-03 14:52:46.496932', NULL, NULL, 'SÃO PEDRO DO PIAUÍ', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (705, true, 1, '2023-07-03 14:52:46.498324', NULL, NULL, 'EUCLIDES DA CUNHA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (706, true, 1, '2023-07-03 14:52:46.499753', NULL, NULL, 'IRARÁ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (707, true, 1, '2023-07-03 14:52:46.501188', NULL, NULL, 'LAGO DA PEDRA', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (708, true, 1, '2023-07-03 14:52:46.502458', NULL, NULL, 'URUÇUÍ', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (709, true, 1, '2023-07-03 14:52:46.503594', NULL, NULL, 'ARAPOTI', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (710, true, 1, '2023-07-03 14:52:46.504734', NULL, NULL, 'IBICARAÍ', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (711, true, 1, '2023-07-03 14:52:46.505887', NULL, NULL, 'NAVEGANTES', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (712, true, 1, '2023-07-03 14:52:46.50747', NULL, NULL, 'OURO FINO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (713, true, 1, '2023-07-03 14:52:46.509013', NULL, NULL, 'CASSILÂNDIA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (714, true, 1, '2023-07-03 14:52:46.510591', NULL, NULL, 'DIAMANTINO', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (715, true, 1, '2023-07-03 14:52:46.512173', NULL, NULL, 'NAVIRAÍ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (716, true, 1, '2023-07-03 14:52:46.513411', NULL, NULL, 'PARANAÍBA', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (717, true, 1, '2023-07-03 14:52:46.514603', NULL, NULL, 'TAGUAÍ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (718, true, 1, '2023-07-03 14:52:46.515798', NULL, NULL, 'TAQUARA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (719, true, 1, '2023-07-03 14:52:46.517271', NULL, NULL, 'SANTA ROSA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (720, true, 1, '2023-07-03 14:52:46.518587', NULL, NULL, 'PEREIRA BARRETO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (721, true, 1, '2023-07-03 14:52:46.519765', NULL, NULL, 'ITARARÉ', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (722, true, 1, '2023-07-03 14:52:46.520901', NULL, NULL, 'ÁGUA BRANCA', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (723, true, 1, '2023-07-03 14:52:46.52207', NULL, NULL, 'SÃO BENTO', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (724, true, 1, '2023-07-03 14:52:46.523234', NULL, NULL, 'IÚNA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (725, true, 1, '2023-07-03 14:52:46.524379', NULL, NULL, 'ITAPORANGA', NULL, 'PB', 'BRASIL');
INSERT INTO public.endereco VALUES (726, true, 1, '2023-07-03 14:52:46.525559', NULL, NULL, 'LIMOEIRO DO NORTE', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (727, true, 1, '2023-07-03 14:52:46.526751', NULL, NULL, 'IGREJINHA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (728, true, 1, '2023-07-03 14:52:46.52805', NULL, NULL, 'ALTO BOA VISTA', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (729, true, 1, '2023-07-03 14:52:46.529336', NULL, NULL, 'TRÊS DE MAIO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (730, true, 1, '2023-07-03 14:52:46.530578', NULL, NULL, 'TRÊS PONTAS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (731, true, 1, '2023-07-03 14:52:46.531871', NULL, NULL, 'CAMBUQUIRA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (732, true, 1, '2023-07-03 14:52:46.533001', NULL, NULL, 'CIANORTE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (733, true, 1, '2023-07-03 14:52:46.53417', NULL, NULL, 'ARARUAMA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (734, true, 1, '2023-07-03 14:52:46.535359', NULL, NULL, 'SÃO GONÇALO DO AMARANTE', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (735, true, 1, '2023-07-03 14:52:46.537008', NULL, NULL, 'PARAÍSO DO NORTE', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (736, true, 1, '2023-07-03 14:52:46.538387', NULL, NULL, 'SÃO JOSÉ DOS QUATRO MARCOS', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (737, true, 1, '2023-07-03 14:52:46.539636', NULL, NULL, 'OURILÂNDIA DO NORTE', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (738, true, 1, '2023-07-03 14:52:46.540781', NULL, NULL, 'SÃO GABRIEL DA PALHA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (739, true, 1, '2023-07-03 14:52:46.541992', NULL, NULL, 'CAMPO VERDE', NULL, 'MT', 'BRASIL');
INSERT INTO public.endereco VALUES (740, true, 1, '2023-07-03 14:52:46.543281', NULL, NULL, 'MUNDO NOVO', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (741, true, 1, '2023-07-03 14:52:46.544497', NULL, NULL, 'CASCAVEL', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (742, true, 1, '2023-07-03 14:52:46.545632', NULL, NULL, 'TOBIAS BARRETO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (743, true, 1, '2023-07-03 14:52:46.546764', NULL, NULL, 'SÃO MIGUEL DO IGUAÇU', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (744, true, 1, '2023-07-03 14:52:46.547935', NULL, NULL, 'SÃO LOURENÇO DA MATA', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (745, true, 1, '2023-07-03 14:52:46.549057', NULL, NULL, 'BARCARENA', NULL, 'PA', 'BRASIL');
INSERT INTO public.endereco VALUES (746, true, 1, '2023-07-03 14:52:46.550247', NULL, NULL, 'SERRINHA', NULL, 'BA', 'BRASIL');
INSERT INTO public.endereco VALUES (747, true, 1, '2023-07-03 14:52:46.551431', NULL, NULL, 'NOVA PORTEIRINHA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (748, true, 1, '2023-07-03 14:52:46.552663', NULL, NULL, 'SÃO JOSÉ DO EGITO', NULL, 'PE', 'BRASIL');
INSERT INTO public.endereco VALUES (749, true, 1, '2023-07-03 14:52:46.553886', NULL, NULL, 'ANCHIETA', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (750, true, 1, '2023-07-03 14:52:46.555075', NULL, NULL, 'VENDA NOVA DO IMIGRANTE', NULL, 'ES', 'BRASIL');
INSERT INTO public.endereco VALUES (751, true, 1, '2023-07-03 14:52:46.556297', NULL, NULL, 'MATO VERDE', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (752, true, 1, '2023-07-03 14:52:46.557518', NULL, NULL, 'SOCORRO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (753, true, 1, '2023-07-03 14:52:46.558728', NULL, NULL, 'SANTA RITA DO SAPUCAÍ', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (754, true, 1, '2023-07-03 14:52:46.559942', NULL, NULL, 'PIRASSUNUNGA', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (755, true, 1, '2023-07-03 14:52:46.561188', NULL, NULL, 'PORTEIRINHA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (756, true, 1, '2023-07-03 14:52:46.562453', NULL, NULL, 'CAARAPÓ', NULL, 'MS', 'BRASIL');
INSERT INTO public.endereco VALUES (757, true, 1, '2023-07-03 14:52:46.563691', NULL, NULL, 'CAPANEMA', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (758, true, 1, '2023-07-03 14:52:46.564934', NULL, NULL, 'IPORÃ', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (759, true, 1, '2023-07-03 14:52:46.566368', NULL, NULL, 'SERINGUEIRAS', NULL, 'RO', 'BRASIL');
INSERT INTO public.endereco VALUES (760, true, 1, '2023-07-03 14:52:46.567723', NULL, NULL, 'MANDAGUARI', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (761, true, 1, '2023-07-03 14:52:46.569024', NULL, NULL, 'SABINÓPOLIS', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (762, true, 1, '2023-07-03 14:52:46.570259', NULL, NULL, 'PAÇO DO LUMIAR', NULL, 'MA', 'BRASIL');
INSERT INTO public.endereco VALUES (763, true, 1, '2023-07-03 14:52:46.571457', NULL, NULL, 'CANTO DO BURITI', NULL, 'PI', 'BRASIL');
INSERT INTO public.endereco VALUES (764, true, 1, '2023-07-03 14:52:46.572863', NULL, NULL, 'IVOTI', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (765, true, 1, '2023-07-03 14:52:46.574163', NULL, NULL, 'SANTANA DO IPANEMA', NULL, 'AL', 'BRASIL');
INSERT INTO public.endereco VALUES (766, true, 1, '2023-07-03 14:52:46.575478', NULL, NULL, 'RIBEIRÃO BONITO', NULL, 'SP', 'BRASIL');
INSERT INTO public.endereco VALUES (767, true, 1, '2023-07-03 14:52:46.576627', NULL, NULL, 'BARRACÃO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (768, true, 1, '2023-07-03 14:52:46.577763', NULL, NULL, 'REDENÇÃO', NULL, 'CE', 'BRASIL');
INSERT INTO public.endereco VALUES (769, true, 1, '2023-07-03 14:52:46.578907', NULL, NULL, 'CRUZ ALTA', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (770, true, 1, '2023-07-03 14:52:46.580063', NULL, NULL, 'GURUPI', NULL, 'TO', 'BRASIL');
INSERT INTO public.endereco VALUES (771, true, 1, '2023-07-03 14:52:46.581237', NULL, NULL, 'VASSOURAS', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (772, true, 1, '2023-07-03 14:52:46.582424', NULL, NULL, 'MAFRA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (773, true, 1, '2023-07-03 14:52:46.583581', NULL, NULL, 'JOAÇABA', NULL, 'SC', 'BRASIL');
INSERT INTO public.endereco VALUES (774, true, 1, '2023-07-03 14:52:46.584671', NULL, NULL, 'LAJEADO', NULL, 'RS', 'BRASIL');
INSERT INTO public.endereco VALUES (775, true, 1, '2023-07-03 14:52:46.585898', NULL, NULL, 'JACAREZINHO', NULL, 'PR', 'BRASIL');
INSERT INTO public.endereco VALUES (776, true, 1, '2023-07-03 14:52:46.587142', NULL, NULL, 'OURO PRETO', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (777, true, 1, '2023-07-03 14:52:46.588356', NULL, NULL, 'SÃO CRISTÓVÃO', NULL, 'SE', 'BRASIL');
INSERT INTO public.endereco VALUES (778, true, 1, '2023-07-03 14:52:46.589519', NULL, NULL, 'DIAMANTINA', NULL, 'MG', 'BRASIL');
INSERT INTO public.endereco VALUES (779, true, 1, '2023-07-03 14:52:46.59065', NULL, NULL, 'SEROPÉDICA', NULL, 'RJ', 'BRASIL');
INSERT INTO public.endereco VALUES (780, true, 1, '2023-07-03 14:52:46.591799', NULL, NULL, 'NOVA IGUAÇU', NULL, 'RJ', 'BRASIL');


--
-- TOC entry 3729 (class 0 OID 83971)
-- Dependencies: 244
-- Data for Name: faixa_salarial; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.faixa_salarial VALUES (1, true, 1, '2023-07-03 14:52:50.683263', NULL, NULL, '1 salário mínimo');
INSERT INTO public.faixa_salarial VALUES (2, true, 1, '2023-07-03 14:52:50.684966', NULL, NULL, 'de 2 a 4 salários mínimos');
INSERT INTO public.faixa_salarial VALUES (3, true, 1, '2023-07-03 14:52:50.686211', NULL, NULL, 'de 5 a 10 salários mínimos');
INSERT INTO public.faixa_salarial VALUES (4, true, 1, '2023-07-03 14:52:50.687519', NULL, NULL, '11 ou mais salários mínimos');


--
-- TOC entry 3731 (class 0 OID 83980)
-- Dependencies: 246
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genero VALUES (1, true, 1, '2023-07-03 14:52:50.688725', NULL, NULL, 'Masculino');
INSERT INTO public.genero VALUES (2, true, 1, '2023-07-03 14:52:50.690265', NULL, NULL, 'Feminino');
INSERT INTO public.genero VALUES (3, true, 1, '2023-07-03 14:52:50.691414', NULL, NULL, 'Não-binário');
INSERT INTO public.genero VALUES (4, true, 1, '2023-07-03 14:52:50.692562', NULL, NULL, 'Transsexual');
INSERT INTO public.genero VALUES (5, true, 1, '2023-07-03 14:52:50.693786', NULL, NULL, 'Não quero declarar');
INSERT INTO public.genero VALUES (6, true, 1, '2023-07-03 14:52:50.694913', NULL, NULL, 'Outros');


--
-- TOC entry 3732 (class 0 OID 83988)
-- Dependencies: 247
-- Data for Name: genero_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3734 (class 0 OID 83994)
-- Dependencies: 249
-- Data for Name: mensagem; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3736 (class 0 OID 84003)
-- Dependencies: 251
-- Data for Name: palestra; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3738 (class 0 OID 84012)
-- Dependencies: 253
-- Data for Name: recuperacao_senha; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3739 (class 0 OID 84019)
-- Dependencies: 254
-- Data for Name: revinfo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3741 (class 0 OID 84025)
-- Dependencies: 256
-- Data for Name: setor_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.setor_atuacao VALUES (1, true, 1, '2023-07-03 14:52:45.576985', NULL, NULL, 'Empresarial');
INSERT INTO public.setor_atuacao VALUES (2, true, 1, '2023-07-03 14:52:45.578426', NULL, NULL, 'Público');
INSERT INTO public.setor_atuacao VALUES (3, true, 1, '2023-07-03 14:52:45.579716', NULL, NULL, 'Terceiro setor');
INSERT INTO public.setor_atuacao VALUES (4, true, 1, '2023-07-03 14:52:45.581035', NULL, NULL, 'Magistério/Docência');
INSERT INTO public.setor_atuacao VALUES (5, true, 1, '2023-07-03 14:52:45.582369', NULL, NULL, 'Outros');


--
-- TOC entry 3743 (class 0 OID 84034)
-- Dependencies: 258
-- Data for Name: status_usuario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3745 (class 0 OID 84042)
-- Dependencies: 260
-- Data for Name: tipo_bolsa; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipo_bolsa VALUES (1, true, 1, '2023-07-03 14:52:50.696084', NULL, NULL, 'PIBIC');
INSERT INTO public.tipo_bolsa VALUES (2, true, 1, '2023-07-03 14:52:50.697497', NULL, NULL, 'PROAD');
INSERT INTO public.tipo_bolsa VALUES (3, true, 1, '2023-07-03 14:52:50.698669', NULL, NULL, 'PROEX');
INSERT INTO public.tipo_bolsa VALUES (4, true, 1, '2023-07-03 14:52:50.69987', NULL, NULL, 'PROBAC');
INSERT INTO public.tipo_bolsa VALUES (5, true, 1, '2023-07-03 14:52:50.701029', NULL, NULL, 'PERMANÊNCIA');
INSERT INTO public.tipo_bolsa VALUES (6, true, 1, '2023-07-03 14:52:50.702202', NULL, NULL, 'CAPES/CNPQ');


--
-- TOC entry 3746 (class 0 OID 84050)
-- Dependencies: 261
-- Data for Name: tipo_bolsa_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3748 (class 0 OID 84056)
-- Dependencies: 263
-- Data for Name: titulacao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.titulacao VALUES (1, true, 1, '2023-07-03 14:52:50.703512', NULL, NULL, 'GRADUAÇÃO');
INSERT INTO public.titulacao VALUES (2, true, 1, '2023-07-03 14:52:50.705064', NULL, NULL, 'PÓS-GRADUAÇÃO');


--
-- TOC entry 3750 (class 0 OID 84065)
-- Dependencies: 265
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario VALUES (1, true, NULL, '2023-07-03 14:52:45.56118', NULL, NULL, 'admin@admin.com', true, 'ADMIN ADMIN', '{bcrypt}$2a$10$vh9/MkL4XQyd.fqkQdnWSelTUxPBpDb6qL5W2uWLxLUN0JR9vwRZm', 'ADMIN', true);
INSERT INTO public.usuario VALUES (2, true, NULL, '2023-07-03 14:52:45.564435', NULL, NULL, 'secretario@secretario.com', true, 'SECRETARIO SECRETARIO', '{bcrypt}$2a$10$biZwxymZqQDevuqWzB/wCe0jfC6Idr.SJRYO9oXBFPuusp9oA9hAy', 'SECRETARIO', true);


--
-- TOC entry 3751 (class 0 OID 84075)
-- Dependencies: 266
-- Data for Name: usuario_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3752 (class 0 OID 84080)
-- Dependencies: 267
-- Data for Name: usuario_grupo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuario_grupo VALUES (1, 'ADMIN');
INSERT INTO public.usuario_grupo VALUES (2, 'SECRETARIO');


--
-- TOC entry 3753 (class 0 OID 84085)
-- Dependencies: 268
-- Data for Name: usuario_grupo_aud; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 215
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.anuncio_id_anuncio_seq', 1, false);


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.area_atuacao_id_area_atuacao_seq', 6, true);


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 219
-- Name: area_emprego_id_area_emprego_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.area_emprego_id_area_emprego_seq', 7, true);


--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 221
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribuicao_id_contribuicao_seq', 1, false);


--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 223
-- Name: cota_id_cota_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cota_id_cota_seq', 5, true);


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 226
-- Name: curso_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.curso_id_curso_seq', 1, true);


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 228
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.depoimento_id_depoimento_seq', 1, false);


--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 230
-- Name: egresso_id_egresso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_id_egresso_seq', 1, false);


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 237
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_valido_id_egresso_valido_seq', 1120, true);


--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 239
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.empresa_id_empresa_seq', 3054, true);


--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 241
-- Name: endereco_id_endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.endereco_id_endereco_seq', 780, true);


--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 243
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faixa_salarial_id_faixa_salarial_seq', 4, true);


--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 245
-- Name: genero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genero_id_genero_seq', 6, true);


--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 248
-- Name: mensagem_id_mensagem_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mensagem_id_mensagem_seq', 1, false);


--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 250
-- Name: palestra_id_palestra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.palestra_id_palestra_seq', 1, false);


--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 252
-- Name: recuperacao_senha_id_recuperacao_senha_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recuperacao_senha_id_recuperacao_senha_seq', 1, false);


--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 214
-- Name: revinfo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.revinfo_seq', 1, false);


--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 255
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.setor_atuacao_id_setor_atuacao_seq', 5, true);


--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 257
-- Name: status_usuario_id_status_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.status_usuario_id_status_usuario_seq', 1, false);


--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 259
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_bolsa_id_tipo_bolsa_seq', 6, true);


--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 262
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.titulacao_id_titulacao_seq', 2, true);


--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 264
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 2, true);


--
-- TOC entry 3413 (class 2606 OID 83840)
-- Name: anuncio anuncio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT anuncio_pkey PRIMARY KEY (id_anuncio);


--
-- TOC entry 3415 (class 2606 OID 83849)
-- Name: area_atuacao area_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT area_atuacao_pkey PRIMARY KEY (id_area_atuacao);


--
-- TOC entry 3419 (class 2606 OID 83858)
-- Name: area_emprego area_emprego_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_emprego
    ADD CONSTRAINT area_emprego_pkey PRIMARY KEY (id_area_emprego);


--
-- TOC entry 3423 (class 2606 OID 83867)
-- Name: contribuicao contribuicao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT contribuicao_pkey PRIMARY KEY (id_contribuicao);


--
-- TOC entry 3431 (class 2606 OID 83881)
-- Name: cota_aud cota_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota_aud
    ADD CONSTRAINT cota_aud_pkey PRIMARY KEY (rev, id_cota);


--
-- TOC entry 3427 (class 2606 OID 83876)
-- Name: cota cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT cota_pkey PRIMARY KEY (id_cota);


--
-- TOC entry 3433 (class 2606 OID 83890)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 3437 (class 2606 OID 83899)
-- Name: depoimento depoimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT depoimento_pkey PRIMARY KEY (id_depoimento);


--
-- TOC entry 3451 (class 2606 OID 83918)
-- Name: egresso_aud egresso_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_aud
    ADD CONSTRAINT egresso_aud_pkey PRIMARY KEY (rev, id_egresso);


--
-- TOC entry 3455 (class 2606 OID 83928)
-- Name: egresso_cota_aud egresso_cota_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota_aud
    ADD CONSTRAINT egresso_cota_aud_pkey PRIMARY KEY (id_egresso, rev, id_cota);


--
-- TOC entry 3453 (class 2606 OID 83923)
-- Name: egresso_cota egresso_cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT egresso_cota_pkey PRIMARY KEY (id_cota, id_egresso);


--
-- TOC entry 3457 (class 2606 OID 83935)
-- Name: egresso_empresa egresso_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT egresso_empresa_pkey PRIMARY KEY (egresso_id_egresso, empresa_id_empresa, endereco_id_endereco);


--
-- TOC entry 3441 (class 2606 OID 83911)
-- Name: egresso egresso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT egresso_pkey PRIMARY KEY (id_egresso);


--
-- TOC entry 3461 (class 2606 OID 83942)
-- Name: egresso_titulacao egresso_titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT egresso_titulacao_pkey PRIMARY KEY (egresso_id_egresso, titulacao_id_titulacao);


--
-- TOC entry 3465 (class 2606 OID 83949)
-- Name: egresso_valido egresso_valido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT egresso_valido_pkey PRIMARY KEY (id_egresso_valido);


--
-- TOC entry 3471 (class 2606 OID 83958)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 3475 (class 2606 OID 83969)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 3477 (class 2606 OID 84121)
-- Name: endereco enderecosunicos; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT enderecosunicos UNIQUE (cidade_endereco, estado_endereco, pais_endereco);


--
-- TOC entry 3479 (class 2606 OID 83978)
-- Name: faixa_salarial faixa_salarial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT faixa_salarial_pkey PRIMARY KEY (id_faixa_salarial);


--
-- TOC entry 3487 (class 2606 OID 83992)
-- Name: genero_aud genero_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero_aud
    ADD CONSTRAINT genero_aud_pkey PRIMARY KEY (rev, id_genero);


--
-- TOC entry 3483 (class 2606 OID 83987)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3489 (class 2606 OID 84001)
-- Name: mensagem mensagem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mensagem
    ADD CONSTRAINT mensagem_pkey PRIMARY KEY (id_mensagem);


--
-- TOC entry 3491 (class 2606 OID 84010)
-- Name: palestra palestra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT palestra_pkey PRIMARY KEY (id_palestra);


--
-- TOC entry 3495 (class 2606 OID 84018)
-- Name: recuperacao_senha recuperacao_senha_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recuperacao_senha
    ADD CONSTRAINT recuperacao_senha_pkey PRIMARY KEY (id_recuperacao_senha);


--
-- TOC entry 3499 (class 2606 OID 84023)
-- Name: revinfo revinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- TOC entry 3501 (class 2606 OID 84032)
-- Name: setor_atuacao setor_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT setor_atuacao_pkey PRIMARY KEY (id_setor_atuacao);


--
-- TOC entry 3505 (class 2606 OID 84040)
-- Name: status_usuario status_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status_usuario
    ADD CONSTRAINT status_usuario_pkey PRIMARY KEY (id_status_usuario);


--
-- TOC entry 3511 (class 2606 OID 84054)
-- Name: tipo_bolsa_aud tipo_bolsa_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa_aud
    ADD CONSTRAINT tipo_bolsa_aud_pkey PRIMARY KEY (rev, id_tipo_bolsa);


--
-- TOC entry 3507 (class 2606 OID 84049)
-- Name: tipo_bolsa tipo_bolsa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT tipo_bolsa_pkey PRIMARY KEY (id_tipo_bolsa);


--
-- TOC entry 3513 (class 2606 OID 84063)
-- Name: titulacao titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT titulacao_pkey PRIMARY KEY (id_titulacao);


--
-- TOC entry 3481 (class 2606 OID 84123)
-- Name: faixa_salarial uk_2bn1lsqed44xqtrtq17s7tjue; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT uk_2bn1lsqed44xqtrtq17s7tjue UNIQUE (faixa_faixa_salarial);


--
-- TOC entry 3493 (class 2606 OID 84127)
-- Name: palestra uk_2h2mxjetrwvc8sg1wx5ttyq07; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT uk_2h2mxjetrwvc8sg1wx5ttyq07 UNIQUE (egresso_id);


--
-- TOC entry 3467 (class 2606 OID 84117)
-- Name: egresso_valido uk_2jwojv1fccodf62r2wa6st1i1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_2jwojv1fccodf62r2wa6st1i1 UNIQUE (matricula_egresso_valido);


--
-- TOC entry 3443 (class 2606 OID 84109)
-- Name: egresso uk_3tmslc9ltmjdyy2mbstgpf1un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_3tmslc9ltmjdyy2mbstgpf1un UNIQUE (usuario_id);


--
-- TOC entry 3445 (class 2606 OID 84107)
-- Name: egresso uk_4datilmpr40t15bnmxyve5t0y; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_4datilmpr40t15bnmxyve5t0y UNIQUE (matricula_egresso);


--
-- TOC entry 3517 (class 2606 OID 84137)
-- Name: usuario uk_5171l57faosmj8myawaucatdw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email);


--
-- TOC entry 3485 (class 2606 OID 84125)
-- Name: genero uk_6xfypuejpx9h55hdouj112ocw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT uk_6xfypuejpx9h55hdouj112ocw UNIQUE (nome_genero);


--
-- TOC entry 3447 (class 2606 OID 84105)
-- Name: egresso uk_7wtwbdgn55nu31nx24ib5revf; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_7wtwbdgn55nu31nx24ib5revf UNIQUE (linkedin_egresso);


--
-- TOC entry 3519 (class 2606 OID 84139)
-- Name: usuario uk_8efax56av7vfdquauh0gyl9cx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_8efax56av7vfdquauh0gyl9cx UNIQUE (login_usuario);


--
-- TOC entry 3449 (class 2606 OID 84103)
-- Name: egresso uk_919oulldbx88ntvtrq5r6sdkt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_919oulldbx88ntvtrq5r6sdkt UNIQUE (lattes_egresso);


--
-- TOC entry 3429 (class 2606 OID 84097)
-- Name: cota uk_9k3kf2b9f2mjv11ksekdha97k; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT uk_9k3kf2b9f2mjv11ksekdha97k UNIQUE (nome_cota);


--
-- TOC entry 3473 (class 2606 OID 84119)
-- Name: empresa uk_bwgigp9epp6elsfohco9fetet; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT uk_bwgigp9epp6elsfohco9fetet UNIQUE (nome_empresa);


--
-- TOC entry 3463 (class 2606 OID 84113)
-- Name: egresso_titulacao uk_du19rk6x1k7pg5tmh7k2xphgd; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT uk_du19rk6x1k7pg5tmh7k2xphgd UNIQUE (egresso_id_egresso);


--
-- TOC entry 3421 (class 2606 OID 84093)
-- Name: area_emprego uk_hjp1enuotfpdwx9utf5n12iqc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_emprego
    ADD CONSTRAINT uk_hjp1enuotfpdwx9utf5n12iqc UNIQUE (nome_area_emprego);


--
-- TOC entry 3435 (class 2606 OID 84099)
-- Name: curso uk_i35k8uavr3s5cxr12aefe00e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT uk_i35k8uavr3s5cxr12aefe00e UNIQUE (nome_curso);


--
-- TOC entry 3503 (class 2606 OID 84131)
-- Name: setor_atuacao uk_j59f23omfkincud4bx0f8x3vp; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT uk_j59f23omfkincud4bx0f8x3vp UNIQUE (nome_setor_atuacao);


--
-- TOC entry 3509 (class 2606 OID 84133)
-- Name: tipo_bolsa uk_j6yqoqsrpie5ipmlh6c5jbrx1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT uk_j6yqoqsrpie5ipmlh6c5jbrx1 UNIQUE (nome_tipo_bolsa);


--
-- TOC entry 3417 (class 2606 OID 84091)
-- Name: area_atuacao uk_mu4kvuf03rl6w7vpqgvtt78pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT uk_mu4kvuf03rl6w7vpqgvtt78pk UNIQUE (nome_area_atuacao);


--
-- TOC entry 3497 (class 2606 OID 84129)
-- Name: recuperacao_senha uk_npbm5he227ci13xfxpe0irwmh; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recuperacao_senha
    ADD CONSTRAINT uk_npbm5he227ci13xfxpe0irwmh UNIQUE (token_recuperacao_senha);


--
-- TOC entry 3459 (class 2606 OID 84111)
-- Name: egresso_empresa uk_r0sm8hpv921bqw3nrmnnjt99x; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT uk_r0sm8hpv921bqw3nrmnnjt99x UNIQUE (egresso_id_egresso);


--
-- TOC entry 3439 (class 2606 OID 84101)
-- Name: depoimento uk_rpha5d7rfphcjvj0nbjb1nvxs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT uk_rpha5d7rfphcjvj0nbjb1nvxs UNIQUE (egresso_id);


--
-- TOC entry 3425 (class 2606 OID 84095)
-- Name: contribuicao uk_rpvny7ejlpmi3fk8mbwva6qjy; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT uk_rpvny7ejlpmi3fk8mbwva6qjy UNIQUE (egresso_id);


--
-- TOC entry 3515 (class 2606 OID 84135)
-- Name: titulacao uk_rvnwm2n5juoh0aj3qnssh52nm; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT uk_rvnwm2n5juoh0aj3qnssh52nm UNIQUE (nome_titulacao);


--
-- TOC entry 3469 (class 2606 OID 84115)
-- Name: egresso_valido uk_snrp717wd5d36lg78t56wefwt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_snrp717wd5d36lg78t56wefwt UNIQUE (email_egresso_valido);


--
-- TOC entry 3523 (class 2606 OID 84079)
-- Name: usuario_aud usuario_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_aud
    ADD CONSTRAINT usuario_aud_pkey PRIMARY KEY (rev, id_usuario);


--
-- TOC entry 3527 (class 2606 OID 84089)
-- Name: usuario_grupo_aud usuario_grupo_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo_aud
    ADD CONSTRAINT usuario_grupo_aud_pkey PRIMARY KEY (rev, id_usuario, grupo);


--
-- TOC entry 3525 (class 2606 OID 84084)
-- Name: usuario_grupo usuario_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT usuario_grupo_pkey PRIMARY KEY (id_usuario, grupo);


--
-- TOC entry 3521 (class 2606 OID 84074)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3550 (class 2606 OID 84250)
-- Name: genero_aud fk17rp3lhfxs5e5tb7ycn9v529; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero_aud
    ADD CONSTRAINT fk17rp3lhfxs5e5tb7ycn9v529 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3545 (class 2606 OID 84225)
-- Name: egresso_titulacao fk1bu3y46jwvfc24y707b8hr57s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk1bu3y46jwvfc24y707b8hr57s FOREIGN KEY (curso_id) REFERENCES public.curso(id_curso);


--
-- TOC entry 3529 (class 2606 OID 84145)
-- Name: contribuicao fk2ccawuj4bpvj1vk6mhrb6b0op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk2ccawuj4bpvj1vk6mhrb6b0op FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3546 (class 2606 OID 84230)
-- Name: egresso_titulacao fk2pj0kns83aqiewk5pf2wxj1n9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk2pj0kns83aqiewk5pf2wxj1n9 FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3536 (class 2606 OID 84185)
-- Name: egresso_cota fk2rs3m3oq3ujpj3nvgbyaqwata; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fk2rs3m3oq3ujpj3nvgbyaqwata FOREIGN KEY (id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3535 (class 2606 OID 84175)
-- Name: egresso_aud fk338edpeyd896a9x3br6lair7s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_aud
    ADD CONSTRAINT fk338edpeyd896a9x3br6lair7s FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3532 (class 2606 OID 84170)
-- Name: egresso fk3lb1ai4t6bvvsu9jc9qm0fisi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fk3lb1ai4t6bvvsu9jc9qm0fisi FOREIGN KEY (usuario_id) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3538 (class 2606 OID 84190)
-- Name: egresso_cota_aud fk5gpjbho9o3o9kwu64cybq5uqv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota_aud
    ADD CONSTRAINT fk5gpjbho9o3o9kwu64cybq5uqv FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3555 (class 2606 OID 84275)
-- Name: usuario_grupo fk9huj1upwjyabwkwnpnhnernnu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fk9huj1upwjyabwkwnpnhnernnu FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3537 (class 2606 OID 84180)
-- Name: egresso_cota fka58rgwpq37hoof2640cw7j2l1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fka58rgwpq37hoof2640cw7j2l1 FOREIGN KEY (id_cota) REFERENCES public.cota(id_cota);


--
-- TOC entry 3547 (class 2606 OID 84240)
-- Name: egresso_titulacao fkb7ankaa93u5fr4nmbmyw46kmc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkb7ankaa93u5fr4nmbmyw46kmc FOREIGN KEY (titulacao_id_titulacao) REFERENCES public.titulacao(id_titulacao);


--
-- TOC entry 3548 (class 2606 OID 84235)
-- Name: egresso_titulacao fkbympkqdq4ugh9r707xwyxmx0i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkbympkqdq4ugh9r707xwyxmx0i FOREIGN KEY (empresa_id) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3554 (class 2606 OID 84270)
-- Name: usuario_aud fkccqpbcawc1yublnm3f1c0q8ie; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_aud
    ADD CONSTRAINT fkccqpbcawc1yublnm3f1c0q8ie FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3533 (class 2606 OID 84160)
-- Name: egresso fkcqqxhbp7hpudbb1dcyouyaq79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkcqqxhbp7hpudbb1dcyouyaq79 FOREIGN KEY (tipo_bolsa_id) REFERENCES public.tipo_bolsa(id_tipo_bolsa);


--
-- TOC entry 3539 (class 2606 OID 84220)
-- Name: egresso_empresa fkdsaknoo0x7tq0wfqdwtluix5n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkdsaknoo0x7tq0wfqdwtluix5n FOREIGN KEY (setor_atuacao_id) REFERENCES public.setor_atuacao(id_setor_atuacao);


--
-- TOC entry 3540 (class 2606 OID 84215)
-- Name: egresso_empresa fkdut9kbfj1c87myf42xmao3aja; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkdut9kbfj1c87myf42xmao3aja FOREIGN KEY (faixa_salarial_id) REFERENCES public.faixa_salarial(id_faixa_salarial);


--
-- TOC entry 3528 (class 2606 OID 84140)
-- Name: anuncio fkgiwie4ydjwi1hi8a5rpwl8aop; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkgiwie4ydjwi1hi8a5rpwl8aop FOREIGN KEY (area_emprego_anuncio_id) REFERENCES public.area_emprego(id_area_emprego);


--
-- TOC entry 3556 (class 2606 OID 84280)
-- Name: usuario_grupo_aud fkhoxan1erm2mblwsmjeexepwa9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo_aud
    ADD CONSTRAINT fkhoxan1erm2mblwsmjeexepwa9 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3541 (class 2606 OID 84195)
-- Name: egresso_empresa fkjj09rwrjadvvdmkdo1ugyprxg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkjj09rwrjadvvdmkdo1ugyprxg FOREIGN KEY (area_atuacao_id) REFERENCES public.area_atuacao(id_area_atuacao);


--
-- TOC entry 3534 (class 2606 OID 84165)
-- Name: egresso fkk0wr6p5gu54r773ttv5iira6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkk0wr6p5gu54r773ttv5iira6f FOREIGN KEY (genero_id) REFERENCES public.genero(id_genero);


--
-- TOC entry 3551 (class 2606 OID 84255)
-- Name: palestra fkku18fu56mnqdkfwbukwah002; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT fkku18fu56mnqdkfwbukwah002 FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3531 (class 2606 OID 84155)
-- Name: depoimento fkmh11nyrmuejhtnlbo1tdxp88v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkmh11nyrmuejhtnlbo1tdxp88v FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3552 (class 2606 OID 84260)
-- Name: recuperacao_senha fkmrvoquu2f4flgys9dqbfu7oru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recuperacao_senha
    ADD CONSTRAINT fkmrvoquu2f4flgys9dqbfu7oru FOREIGN KEY (usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3553 (class 2606 OID 84265)
-- Name: tipo_bolsa_aud fknl8tvw4wnwgyijj1koumk6d8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa_aud
    ADD CONSTRAINT fknl8tvw4wnwgyijj1koumk6d8d FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3542 (class 2606 OID 84200)
-- Name: egresso_empresa fkrrdwo5y0sss2aq6r989sngy0g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkrrdwo5y0sss2aq6r989sngy0g FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3543 (class 2606 OID 84205)
-- Name: egresso_empresa fks0wngwsneahqe1p80rh1olamu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fks0wngwsneahqe1p80rh1olamu FOREIGN KEY (empresa_id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3549 (class 2606 OID 84245)
-- Name: empresa fks5bj6jkkca1s0d3jgw4wioi9g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fks5bj6jkkca1s0d3jgw4wioi9g FOREIGN KEY (endereco_empresa) REFERENCES public.endereco(id_endereco);


--
-- TOC entry 3530 (class 2606 OID 84150)
-- Name: cota_aud fks9hpicuwd9ta3y1emtrhuyuxf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota_aud
    ADD CONSTRAINT fks9hpicuwd9ta3y1emtrhuyuxf FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- TOC entry 3544 (class 2606 OID 84210)
-- Name: egresso_empresa fksccjqcsggw6n2wurxynphgs5w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fksccjqcsggw6n2wurxynphgs5w FOREIGN KEY (endereco_id_endereco) REFERENCES public.endereco(id_endereco);


-- Completed on 2023-07-03 14:52:58 -03

--
-- PostgreSQL database dump complete
--
