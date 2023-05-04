
CREATE TABLE IF NOT EXISTS public.anuncio (
    id_anuncio integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_anuncio oid NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 236 (class 1259 OID 23144)
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.anuncio_id_anuncio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 236
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.anuncio_id_anuncio_seq OWNED BY public.anuncio.id_anuncio;


--
-- TOC entry 230 (class 1259 OID 17927)
-- Name: anuncio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.anuncio_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 239 (class 1259 OID 23154)
-- Name: area_atuacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.area_atuacao (
    id_area_atuacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_area_atuacao character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 238 (class 1259 OID 23153)
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.area_atuacao_id_area_atuacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 238
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.area_atuacao_id_area_atuacao_seq OWNED BY public.area_atuacao.id_area_atuacao;


--
-- TOC entry 223 (class 1259 OID 17552)
-- Name: colacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.colacao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 241 (class 1259 OID 23163)
-- Name: comentario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.comentario (
    id_comentario integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_comentario character varying(255) NOT NULL,
    created_by integer,
    last_modified_by integer,
    anuncio_id integer NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 23162)
-- Name: comentario_id_comentario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.comentario_id_comentario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 240
-- Name: comentario_id_comentario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comentario_id_comentario_seq OWNED BY public.comentario.id_comentario;


--
-- TOC entry 231 (class 1259 OID 17936)
-- Name: comentario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.comentario_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 243 (class 1259 OID 23172)
-- Name: contribuicao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.contribuicao (
    id_contribuicao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_contribuicao oid NOT NULL,
    created_by integer,
    last_modified_by integer,
    egresso_id integer NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 23171)
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.contribuicao_id_contribuicao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 242
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contribuicao_id_contribuicao_seq OWNED BY public.contribuicao.id_contribuicao;


--
-- TOC entry 216 (class 1259 OID 17300)
-- Name: contribuicao_model_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.contribuicao_model_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 222 (class 1259 OID 17533)
-- Name: contribuicao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.contribuicao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 245 (class 1259 OID 23181)
-- Name: cota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.cota (
    id_cota integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_cota character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 244 (class 1259 OID 23180)
-- Name: cota_id_cota_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.cota_id_cota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 244
-- Name: cota_id_cota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cota_id_cota_seq OWNED BY public.cota.id_cota;


--
-- TOC entry 232 (class 1259 OID 19524)
-- Name: cota_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.cota_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 247 (class 1259 OID 23190)
-- Name: curso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.curso (
    id_curso integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_curso character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 246 (class 1259 OID 23189)
-- Name: curso_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.curso_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 246
-- Name: curso_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.curso_id_curso_seq OWNED BY public.curso.id_curso;


--
-- TOC entry 224 (class 1259 OID 17583)
-- Name: curso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.curso_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 249 (class 1259 OID 23199)
-- Name: depoimento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.depoimento (
    id_depoimento integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    descricao_depoimento oid NOT NULL,
    created_by integer,
    last_modified_by integer,
    egresso_id integer NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 23198)
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.depoimento_id_depoimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 248
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.depoimento_id_depoimento_seq OWNED BY public.depoimento.id_depoimento;


--
-- TOC entry 217 (class 1259 OID 17301)
-- Name: depoimento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.depoimento_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 251 (class 1259 OID 23208)
-- Name: egresso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso (
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


--
-- TOC entry 252 (class 1259 OID 23218)
-- Name: egresso_area_atuacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_area_atuacao (
    id_area_atuacao integer NOT NULL,
    id_egresso integer NOT NULL
);


--
-- TOC entry 253 (class 1259 OID 23223)
-- Name: egresso_cota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_cota (
    id_egresso integer NOT NULL,
    id_cota integer NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 23228)
-- Name: egresso_empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_empresa (
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    empresa_id_empresa integer NOT NULL,
    egresso_id_egresso integer NOT NULL,
    created_by integer,
    last_modified_by integer,
    faixa_salarial_id integer NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 23207)
-- Name: egresso_id_egresso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.egresso_id_egresso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 250
-- Name: egresso_id_egresso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.egresso_id_egresso_seq OWNED BY public.egresso.id_egresso;


--
-- TOC entry 218 (class 1259 OID 17302)
-- Name: egresso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.egresso_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 255 (class 1259 OID 23235)
-- Name: egresso_titulacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_titulacao (
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


--
-- TOC entry 257 (class 1259 OID 23243)
-- Name: egresso_valido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.egresso_valido (
    id_egresso_valido integer NOT NULL,
    email_egresso_valido character varying(255),
    matricula_egresso_valido character varying(12),
    nome_egresso_valido character varying(100) NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 23242)
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.egresso_valido_id_egresso_valido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 256
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.egresso_valido_id_egresso_valido_seq OWNED BY public.egresso_valido.id_egresso_valido;


--
-- TOC entry 235 (class 1259 OID 20065)
-- Name: egresso_valido_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.egresso_valido_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 233 (class 1259 OID 19525)
-- Name: egressos_validos_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.egressos_validos_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 259 (class 1259 OID 23250)
-- Name: empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.empresa (
    id_empresa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_empresa character varying(130) NOT NULL,
    created_by integer,
    last_modified_by integer,
    endereco_empresa integer
);


--
-- TOC entry 258 (class 1259 OID 23249)
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 258
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;


--
-- TOC entry 221 (class 1259 OID 17348)
-- Name: empresa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.empresa_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 261 (class 1259 OID 23259)
-- Name: endereco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.endereco (
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


--
-- TOC entry 260 (class 1259 OID 23258)
-- Name: endereco_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.endereco_id_endereco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 260
-- Name: endereco_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.endereco_id_endereco_seq OWNED BY public.endereco.id_endereco;


--
-- TOC entry 220 (class 1259 OID 17332)
-- Name: endereco_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.endereco_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 226 (class 1259 OID 17622)
-- Name: etnia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.etnia_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 263 (class 1259 OID 23270)
-- Name: faixa_salarial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.faixa_salarial (
    id_faixa_salarial integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    faixa_faixa_salarial character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 262 (class 1259 OID 23269)
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.faixa_salarial_id_faixa_salarial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 262
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.faixa_salarial_id_faixa_salarial_seq OWNED BY public.faixa_salarial.id_faixa_salarial;


--
-- TOC entry 227 (class 1259 OID 17642)
-- Name: faixa_salarial_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.faixa_salarial_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 265 (class 1259 OID 23279)
-- Name: genero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.genero (
    id_genero integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_genero character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 264 (class 1259 OID 23278)
-- Name: genero_id_genero_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.genero_id_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 264
-- Name: genero_id_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genero_id_genero_seq OWNED BY public.genero.id_genero;


--
-- TOC entry 225 (class 1259 OID 17609)
-- Name: genero_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.genero_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 267 (class 1259 OID 23288)
-- Name: grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.grupo (
    id_grupo integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_grupo character varying(50) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 266 (class 1259 OID 23287)
-- Name: grupo_id_grupo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.grupo_id_grupo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 266
-- Name: grupo_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grupo_id_grupo_seq OWNED BY public.grupo.id_grupo;


--
-- TOC entry 214 (class 1259 OID 17250)
-- Name: grupo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.grupo_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 269 (class 1259 OID 23297)
-- Name: palestra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.palestra (
    id_palestra integer NOT NULL,
    nome_palestra oid NOT NULL,
    egresso_id integer NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 23296)
-- Name: palestra_id_palestra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.palestra_id_palestra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 268
-- Name: palestra_id_palestra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.palestra_id_palestra_seq OWNED BY public.palestra.id_palestra;


--
-- TOC entry 234 (class 1259 OID 19526)
-- Name: pesquisa_cientifica_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.pesquisa_cientifica_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 271 (class 1259 OID 23304)
-- Name: setor_atuacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.setor_atuacao (
    id_setor_atuacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_setor_atuacao character varying(60) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 272 (class 1259 OID 23312)
-- Name: setor_atuacao_empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.setor_atuacao_empresa (
    id_setor_atuacao integer NOT NULL,
    id_empresa integer NOT NULL
);


--
-- TOC entry 270 (class 1259 OID 23303)
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.setor_atuacao_id_setor_atuacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 270
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.setor_atuacao_id_setor_atuacao_seq OWNED BY public.setor_atuacao.id_setor_atuacao;


--
-- TOC entry 274 (class 1259 OID 23318)
-- Name: tipo_bolsa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.tipo_bolsa (
    id_tipo_bolsa integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_tipo_bolsa character varying(100) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 273 (class 1259 OID 23317)
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.tipo_bolsa_id_tipo_bolsa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 273
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_bolsa_id_tipo_bolsa_seq OWNED BY public.tipo_bolsa.id_tipo_bolsa;


--
-- TOC entry 228 (class 1259 OID 17892)
-- Name: tipo_bolsa_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.tipo_bolsa_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 276 (class 1259 OID 23327)
-- Name: titulacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.titulacao (
    id_titulacao integer NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    created_date timestamp(6) without time zone DEFAULT now(),
    last_modified_date timestamp(6) without time zone,
    nome_titulacao character varying(30) NOT NULL,
    created_by integer,
    last_modified_by integer
);


--
-- TOC entry 275 (class 1259 OID 23326)
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.titulacao_id_titulacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 275
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.titulacao_id_titulacao_seq OWNED BY public.titulacao.id_titulacao;


--
-- TOC entry 229 (class 1259 OID 17913)
-- Name: titulacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.titulacao_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 219 (class 1259 OID 17303)
-- Name: trabalho_publicado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.trabalho_publicado_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 278 (class 1259 OID 23336)
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.usuario (
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


--
-- TOC entry 279 (class 1259 OID 23344)
-- Name: usuario_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.usuario_grupo (
    id_usuario integer NOT NULL,
    id_grupo integer NOT NULL
);


--
-- TOC entry 277 (class 1259 OID 23335)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 277
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 215 (class 1259 OID 17251)
-- Name: usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS public.usuario_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3337 (class 2604 OID 23148)
-- Name: anuncio id_anuncio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio ALTER COLUMN id_anuncio SET DEFAULT nextval('public.anuncio_id_anuncio_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 23157)
-- Name: area_atuacao id_area_atuacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao ALTER COLUMN id_area_atuacao SET DEFAULT nextval('public.area_atuacao_id_area_atuacao_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 23166)
-- Name: comentario id_comentario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario ALTER COLUMN id_comentario SET DEFAULT nextval('public.comentario_id_comentario_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 23175)
-- Name: contribuicao id_contribuicao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao ALTER COLUMN id_contribuicao SET DEFAULT nextval('public.contribuicao_id_contribuicao_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 23184)
-- Name: cota id_cota; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota ALTER COLUMN id_cota SET DEFAULT nextval('public.cota_id_cota_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 23193)
-- Name: curso id_curso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso ALTER COLUMN id_curso SET DEFAULT nextval('public.curso_id_curso_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 23202)
-- Name: depoimento id_depoimento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento ALTER COLUMN id_depoimento SET DEFAULT nextval('public.depoimento_id_depoimento_seq'::regclass);


--
-- TOC entry 3358 (class 2604 OID 23211)
-- Name: egresso id_egresso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso ALTER COLUMN id_egresso SET DEFAULT nextval('public.egresso_id_egresso_seq'::regclass);


--
-- TOC entry 3365 (class 2604 OID 23246)
-- Name: egresso_valido id_egresso_valido; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido ALTER COLUMN id_egresso_valido SET DEFAULT nextval('public.egresso_valido_id_egresso_valido_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 23253)
-- Name: empresa id_empresa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 23262)
-- Name: endereco id_endereco; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id_endereco SET DEFAULT nextval('public.endereco_id_endereco_seq'::regclass);


--
-- TOC entry 3372 (class 2604 OID 23273)
-- Name: faixa_salarial id_faixa_salarial; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial ALTER COLUMN id_faixa_salarial SET DEFAULT nextval('public.faixa_salarial_id_faixa_salarial_seq'::regclass);


--
-- TOC entry 3375 (class 2604 OID 23282)
-- Name: genero id_genero; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero ALTER COLUMN id_genero SET DEFAULT nextval('public.genero_id_genero_seq'::regclass);


--
-- TOC entry 3378 (class 2604 OID 23291)
-- Name: grupo id_grupo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id_grupo SET DEFAULT nextval('public.grupo_id_grupo_seq'::regclass);


--
-- TOC entry 3381 (class 2604 OID 23300)
-- Name: palestra id_palestra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra ALTER COLUMN id_palestra SET DEFAULT nextval('public.palestra_id_palestra_seq'::regclass);


--
-- TOC entry 3382 (class 2604 OID 23307)
-- Name: setor_atuacao id_setor_atuacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao ALTER COLUMN id_setor_atuacao SET DEFAULT nextval('public.setor_atuacao_id_setor_atuacao_seq'::regclass);


--
-- TOC entry 3385 (class 2604 OID 23321)
-- Name: tipo_bolsa id_tipo_bolsa; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa ALTER COLUMN id_tipo_bolsa SET DEFAULT nextval('public.tipo_bolsa_id_tipo_bolsa_seq'::regclass);


--
-- TOC entry 3388 (class 2604 OID 23330)
-- Name: titulacao id_titulacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao ALTER COLUMN id_titulacao SET DEFAULT nextval('public.titulacao_id_titulacao_seq'::regclass);


--
-- TOC entry 3391 (class 2604 OID 23339)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3714 (class 0 OID 23145)
-- Dependencies: 237
-- Data for Name: anuncio; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3716 (class 0 OID 23154)
-- Dependencies: 239
-- Data for Name: area_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3718 (class 0 OID 23163)
-- Dependencies: 241
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3720 (class 0 OID 23172)
-- Dependencies: 243
-- Data for Name: contribuicao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3722 (class 0 OID 23181)
-- Dependencies: 245
-- Data for Name: cota; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3724 (class 0 OID 23190)
-- Dependencies: 247
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3726 (class 0 OID 23199)
-- Dependencies: 249
-- Data for Name: depoimento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3728 (class 0 OID 23208)
-- Dependencies: 251
-- Data for Name: egresso; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3729 (class 0 OID 23218)
-- Dependencies: 252
-- Data for Name: egresso_area_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3730 (class 0 OID 23223)
-- Dependencies: 253
-- Data for Name: egresso_cota; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3731 (class 0 OID 23228)
-- Dependencies: 254
-- Data for Name: egresso_empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3732 (class 0 OID 23235)
-- Dependencies: 255
-- Data for Name: egresso_titulacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3734 (class 0 OID 23243)
-- Dependencies: 257
-- Data for Name: egresso_valido; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3736 (class 0 OID 23250)
-- Dependencies: 259
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3738 (class 0 OID 23259)
-- Dependencies: 261
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3740 (class 0 OID 23270)
-- Dependencies: 263
-- Data for Name: faixa_salarial; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3742 (class 0 OID 23279)
-- Dependencies: 265
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3744 (class 0 OID 23288)
-- Dependencies: 267
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3746 (class 0 OID 23297)
-- Dependencies: 269
-- Data for Name: palestra; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3748 (class 0 OID 23304)
-- Dependencies: 271
-- Data for Name: setor_atuacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3749 (class 0 OID 23312)
-- Dependencies: 272
-- Data for Name: setor_atuacao_empresa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3751 (class 0 OID 23318)
-- Dependencies: 274
-- Data for Name: tipo_bolsa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3753 (class 0 OID 23327)
-- Dependencies: 276
-- Data for Name: titulacao; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3755 (class 0 OID 23336)
-- Dependencies: 278
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3756 (class 0 OID 23344)
-- Dependencies: 279
-- Data for Name: usuario_grupo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 236
-- Name: anuncio_id_anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.anuncio_id_anuncio_seq', 1, false);


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 230
-- Name: anuncio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.anuncio_seq', 1, false);


--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 238
-- Name: area_atuacao_id_area_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.area_atuacao_id_area_atuacao_seq', 1, false);


--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 223
-- Name: colacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.colacao_seq', 1, false);


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 240
-- Name: comentario_id_comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comentario_id_comentario_seq', 1, false);


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 231
-- Name: comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comentario_seq', 1, false);


--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 242
-- Name: contribuicao_id_contribuicao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribuicao_id_contribuicao_seq', 1, false);


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 216
-- Name: contribuicao_model_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribuicao_model_seq', 1, false);


--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 222
-- Name: contribuicao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contribuicao_seq', 1, false);


--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 244
-- Name: cota_id_cota_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cota_id_cota_seq', 1, false);


--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 232
-- Name: cota_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cota_seq', 1, false);


--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 246
-- Name: curso_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.curso_id_curso_seq', 1, false);


--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 224
-- Name: curso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.curso_seq', 1, false);


--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 248
-- Name: depoimento_id_depoimento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.depoimento_id_depoimento_seq', 1, false);


--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 217
-- Name: depoimento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.depoimento_seq', 1, false);


--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 250
-- Name: egresso_id_egresso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_id_egresso_seq', 1, false);


--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 218
-- Name: egresso_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_seq', 1, false);


--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 256
-- Name: egresso_valido_id_egresso_valido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_valido_id_egresso_valido_seq', 1, false);


--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 235
-- Name: egresso_valido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egresso_valido_seq', 1, false);


--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 233
-- Name: egressos_validos_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.egressos_validos_seq', 1, false);


--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 258
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.empresa_id_empresa_seq', 1, false);


--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 221
-- Name: empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.empresa_seq', 1, false);


--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 260
-- Name: endereco_id_endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.endereco_id_endereco_seq', 1, false);


--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 220
-- Name: endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.endereco_seq', 1, false);


--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 226
-- Name: etnia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.etnia_seq', 1, false);


--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 262
-- Name: faixa_salarial_id_faixa_salarial_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faixa_salarial_id_faixa_salarial_seq', 1, false);


--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 227
-- Name: faixa_salarial_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.faixa_salarial_seq', 1, false);


--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 264
-- Name: genero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genero_id_genero_seq', 1, false);


--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 225
-- Name: genero_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genero_seq', 1, false);


--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 266
-- Name: grupo_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grupo_id_grupo_seq', 1, false);


--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 214
-- Name: grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grupo_seq', 1, false);


--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 268
-- Name: palestra_id_palestra_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.palestra_id_palestra_seq', 1, false);


--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 234
-- Name: pesquisa_cientifica_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pesquisa_cientifica_seq', 1, false);


--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 270
-- Name: setor_atuacao_id_setor_atuacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.setor_atuacao_id_setor_atuacao_seq', 1, false);


--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 273
-- Name: tipo_bolsa_id_tipo_bolsa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_bolsa_id_tipo_bolsa_seq', 1, false);


--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 228
-- Name: tipo_bolsa_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_bolsa_seq', 1, false);


--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 275
-- Name: titulacao_id_titulacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.titulacao_id_titulacao_seq', 1, false);


--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 229
-- Name: titulacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.titulacao_seq', 1, false);


--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 219
-- Name: trabalho_publicado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trabalho_publicado_seq', 1, false);


--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 277
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);


--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_seq', 51, true);


--
-- TOC entry 3395 (class 2606 OID 23152)
-- Name: anuncio anuncio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT anuncio_pkey PRIMARY KEY (id_anuncio);


--
-- TOC entry 3397 (class 2606 OID 23161)
-- Name: area_atuacao area_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT area_atuacao_pkey PRIMARY KEY (id_area_atuacao);


--
-- TOC entry 3401 (class 2606 OID 23170)
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id_comentario);


--
-- TOC entry 3403 (class 2606 OID 23179)
-- Name: contribuicao contribuicao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT contribuicao_pkey PRIMARY KEY (id_contribuicao);


--
-- TOC entry 3407 (class 2606 OID 23188)
-- Name: cota cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT cota_pkey PRIMARY KEY (id_cota);


--
-- TOC entry 3411 (class 2606 OID 23197)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 3415 (class 2606 OID 23206)
-- Name: depoimento depoimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT depoimento_pkey PRIMARY KEY (id_depoimento);


--
-- TOC entry 3429 (class 2606 OID 23222)
-- Name: egresso_area_atuacao egresso_area_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT egresso_area_atuacao_pkey PRIMARY KEY (id_area_atuacao, id_egresso);


--
-- TOC entry 3431 (class 2606 OID 23227)
-- Name: egresso_cota egresso_cota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT egresso_cota_pkey PRIMARY KEY (id_egresso, id_cota);


--
-- TOC entry 3433 (class 2606 OID 23234)
-- Name: egresso_empresa egresso_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT egresso_empresa_pkey PRIMARY KEY (egresso_id_egresso, empresa_id_empresa);


--
-- TOC entry 3419 (class 2606 OID 23217)
-- Name: egresso egresso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT egresso_pkey PRIMARY KEY (id_egresso);


--
-- TOC entry 3437 (class 2606 OID 23241)
-- Name: egresso_titulacao egresso_titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT egresso_titulacao_pkey PRIMARY KEY (egresso_id_egresso, titulacao_id_titulacao);


--
-- TOC entry 3441 (class 2606 OID 23248)
-- Name: egresso_valido egresso_valido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT egresso_valido_pkey PRIMARY KEY (id_egresso_valido);


--
-- TOC entry 3447 (class 2606 OID 23257)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 3449 (class 2606 OID 23268)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 3451 (class 2606 OID 23277)
-- Name: faixa_salarial faixa_salarial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT faixa_salarial_pkey PRIMARY KEY (id_faixa_salarial);


--
-- TOC entry 3455 (class 2606 OID 23286)
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 3459 (class 2606 OID 23295)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 3463 (class 2606 OID 23302)
-- Name: palestra palestra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT palestra_pkey PRIMARY KEY (id_palestra);


--
-- TOC entry 3473 (class 2606 OID 23316)
-- Name: setor_atuacao_empresa setor_atuacao_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT setor_atuacao_empresa_pkey PRIMARY KEY (id_setor_atuacao, id_empresa);


--
-- TOC entry 3469 (class 2606 OID 23311)
-- Name: setor_atuacao setor_atuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT setor_atuacao_pkey PRIMARY KEY (id_setor_atuacao);


--
-- TOC entry 3475 (class 2606 OID 23325)
-- Name: tipo_bolsa tipo_bolsa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT tipo_bolsa_pkey PRIMARY KEY (id_tipo_bolsa);


--
-- TOC entry 3479 (class 2606 OID 23334)
-- Name: titulacao titulacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT titulacao_pkey PRIMARY KEY (id_titulacao);


--
-- TOC entry 3453 (class 2606 OID 23376)
-- Name: faixa_salarial uk_2bn1lsqed44xqtrtq17s7tjue; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT uk_2bn1lsqed44xqtrtq17s7tjue UNIQUE (faixa_faixa_salarial);


--
-- TOC entry 3465 (class 2606 OID 23384)
-- Name: palestra uk_2h2mxjetrwvc8sg1wx5ttyq07; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT uk_2h2mxjetrwvc8sg1wx5ttyq07 UNIQUE (egresso_id);


--
-- TOC entry 3443 (class 2606 OID 23374)
-- Name: egresso_valido uk_2jwojv1fccodf62r2wa6st1i1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_2jwojv1fccodf62r2wa6st1i1 UNIQUE (matricula_egresso_valido);


--
-- TOC entry 3421 (class 2606 OID 23366)
-- Name: egresso uk_3tmslc9ltmjdyy2mbstgpf1un; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_3tmslc9ltmjdyy2mbstgpf1un UNIQUE (usuario_id);


--
-- TOC entry 3423 (class 2606 OID 23364)
-- Name: egresso uk_4datilmpr40t15bnmxyve5t0y; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_4datilmpr40t15bnmxyve5t0y UNIQUE (matricula_egresso);


--
-- TOC entry 3457 (class 2606 OID 23378)
-- Name: genero uk_6xfypuejpx9h55hdouj112ocw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT uk_6xfypuejpx9h55hdouj112ocw UNIQUE (nome_genero);


--
-- TOC entry 3425 (class 2606 OID 23362)
-- Name: egresso uk_7wtwbdgn55nu31nx24ib5revf; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_7wtwbdgn55nu31nx24ib5revf UNIQUE (linkedin_egresso);


--
-- TOC entry 3483 (class 2606 OID 23392)
-- Name: usuario uk_8efax56av7vfdquauh0gyl9cx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_8efax56av7vfdquauh0gyl9cx UNIQUE (login_usuario);


--
-- TOC entry 3427 (class 2606 OID 23360)
-- Name: egresso uk_919oulldbx88ntvtrq5r6sdkt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT uk_919oulldbx88ntvtrq5r6sdkt UNIQUE (lattes_egresso);


--
-- TOC entry 3409 (class 2606 OID 23354)
-- Name: cota uk_9k3kf2b9f2mjv11ksekdha97k; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT uk_9k3kf2b9f2mjv11ksekdha97k UNIQUE (nome_cota);


--
-- TOC entry 3439 (class 2606 OID 23370)
-- Name: egresso_titulacao uk_du19rk6x1k7pg5tmh7k2xphgd; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT uk_du19rk6x1k7pg5tmh7k2xphgd UNIQUE (egresso_id_egresso);


--
-- TOC entry 3413 (class 2606 OID 23356)
-- Name: curso uk_i35k8uavr3s5cxr12aefe00e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT uk_i35k8uavr3s5cxr12aefe00e UNIQUE (nome_curso);


--
-- TOC entry 3461 (class 2606 OID 23380)
-- Name: grupo uk_is0kvc71ivi2o1nhe7h19m47p; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT uk_is0kvc71ivi2o1nhe7h19m47p UNIQUE (nome_grupo);


--
-- TOC entry 3471 (class 2606 OID 23386)
-- Name: setor_atuacao uk_j59f23omfkincud4bx0f8x3vp; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT uk_j59f23omfkincud4bx0f8x3vp UNIQUE (nome_setor_atuacao);


--
-- TOC entry 3477 (class 2606 OID 23388)
-- Name: tipo_bolsa uk_j6yqoqsrpie5ipmlh6c5jbrx1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT uk_j6yqoqsrpie5ipmlh6c5jbrx1 UNIQUE (nome_tipo_bolsa);


--
-- TOC entry 3399 (class 2606 OID 23350)
-- Name: area_atuacao uk_mu4kvuf03rl6w7vpqgvtt78pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT uk_mu4kvuf03rl6w7vpqgvtt78pk UNIQUE (nome_area_atuacao);


--
-- TOC entry 3467 (class 2606 OID 23382)
-- Name: palestra uk_nhn2buqnf290o7umjxd7b1av7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT uk_nhn2buqnf290o7umjxd7b1av7 UNIQUE (nome_palestra);


--
-- TOC entry 3435 (class 2606 OID 23368)
-- Name: egresso_empresa uk_r0sm8hpv921bqw3nrmnnjt99x; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT uk_r0sm8hpv921bqw3nrmnnjt99x UNIQUE (egresso_id_egresso);


--
-- TOC entry 3417 (class 2606 OID 23358)
-- Name: depoimento uk_rpha5d7rfphcjvj0nbjb1nvxs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT uk_rpha5d7rfphcjvj0nbjb1nvxs UNIQUE (egresso_id);


--
-- TOC entry 3405 (class 2606 OID 23352)
-- Name: contribuicao uk_rpvny7ejlpmi3fk8mbwva6qjy; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT uk_rpvny7ejlpmi3fk8mbwva6qjy UNIQUE (egresso_id);


--
-- TOC entry 3481 (class 2606 OID 23390)
-- Name: titulacao uk_rvnwm2n5juoh0aj3qnssh52nm; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT uk_rvnwm2n5juoh0aj3qnssh52nm UNIQUE (nome_titulacao);


--
-- TOC entry 3445 (class 2606 OID 23372)
-- Name: egresso_valido uk_snrp717wd5d36lg78t56wefwt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_valido
    ADD CONSTRAINT uk_snrp717wd5d36lg78t56wefwt UNIQUE (email_egresso_valido);


--
-- TOC entry 3487 (class 2606 OID 23348)
-- Name: usuario_grupo usuario_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT usuario_grupo_pkey PRIMARY KEY (id_usuario, id_grupo);


--
-- TOC entry 3485 (class 2606 OID 23343)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 3525 (class 2606 OID 23578)
-- Name: empresa fk1252u5xj526ufsf5c3c9fcic2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk1252u5xj526ufsf5c3c9fcic2 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3530 (class 2606 OID 23608)
-- Name: faixa_salarial fk12fuee7y4kjstxd7xwk3fageo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT fk12fuee7y4kjstxd7xwk3fageo FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3519 (class 2606 OID 23558)
-- Name: egresso_titulacao fk1bu3y46jwvfc24y707b8hr57s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk1bu3y46jwvfc24y707b8hr57s FOREIGN KEY (curso_id) REFERENCES public.curso(id_curso);


--
-- TOC entry 3498 (class 2606 OID 23448)
-- Name: cota fk1lve8o0jw4i8ksl2dxp0lm8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT fk1lve8o0jw4i8ksl2dxp0lm8 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3495 (class 2606 OID 23438)
-- Name: contribuicao fk2ccawuj4bpvj1vk6mhrb6b0op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk2ccawuj4bpvj1vk6mhrb6b0op FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3520 (class 2606 OID 23563)
-- Name: egresso_titulacao fk2pj0kns83aqiewk5pf2wxj1n9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fk2pj0kns83aqiewk5pf2wxj1n9 FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3512 (class 2606 OID 23518)
-- Name: egresso_cota fk2rs3m3oq3ujpj3nvgbyaqwata; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fk2rs3m3oq3ujpj3nvgbyaqwata FOREIGN KEY (id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3541 (class 2606 OID 23663)
-- Name: tipo_bolsa fk3c5grr0qggvj0dw2fada2xhyv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT fk3c5grr0qggvj0dw2fada2xhyv FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3505 (class 2606 OID 23498)
-- Name: egresso fk3lb1ai4t6bvvsu9jc9qm0fisi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fk3lb1ai4t6bvvsu9jc9qm0fisi FOREIGN KEY (usuario_id) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3500 (class 2606 OID 23453)
-- Name: curso fk3tu6gxj4fe3b8vgyhhr17p5d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk3tu6gxj4fe3b8vgyhhr17p5d1 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3502 (class 2606 OID 23468)
-- Name: depoimento fk4282xxihuiq8nqknlkrlmn6k7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fk4282xxihuiq8nqknlkrlmn6k7 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3532 (class 2606 OID 23613)
-- Name: genero fk4hmk8te4ct41ket6gewknyld3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT fk4hmk8te4ct41ket6gewknyld3 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3537 (class 2606 OID 23638)
-- Name: setor_atuacao fk4qba75lalso4wg21v2lldr81c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT fk4qba75lalso4wg21v2lldr81c FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3534 (class 2606 OID 23628)
-- Name: grupo fk4x87bpegbq5yd4awx0jpyl7rf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fk4x87bpegbq5yd4awx0jpyl7rf FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3492 (class 2606 OID 23418)
-- Name: comentario fk5k6dqdx9kn983dj5jx5orhss0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fk5k6dqdx9kn983dj5jx5orhss0 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3490 (class 2606 OID 23408)
-- Name: area_atuacao fk5oqxk24ttn7xfiqojcd3hrxqp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT fk5oqxk24ttn7xfiqojcd3hrxqp FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3496 (class 2606 OID 23428)
-- Name: contribuicao fk7x5ccymo3mvys7sdoar4w27jy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fk7x5ccymo3mvys7sdoar4w27jy FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3539 (class 2606 OID 23653)
-- Name: setor_atuacao_empresa fk86mqotohj7rghjrby21y54sr7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT fk86mqotohj7rghjrby21y54sr7 FOREIGN KEY (id_setor_atuacao) REFERENCES public.setor_atuacao(id_setor_atuacao);


--
-- TOC entry 3531 (class 2606 OID 23603)
-- Name: faixa_salarial fk96o103aeo1xeuhgnn0hhs6bl0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faixa_salarial
    ADD CONSTRAINT fk96o103aeo1xeuhgnn0hhs6bl0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3542 (class 2606 OID 23658)
-- Name: tipo_bolsa fk9brd9pf3m513c4qwotx7j5l5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_bolsa
    ADD CONSTRAINT fk9brd9pf3m513c4qwotx7j5l5f FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3547 (class 2606 OID 23693)
-- Name: usuario_grupo fk9huj1upwjyabwkwnpnhnernnu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fk9huj1upwjyabwkwnpnhnernnu FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3526 (class 2606 OID 23583)
-- Name: empresa fka0nk763e7luto0itr7it6y5gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fka0nk763e7luto0itr7it6y5gr FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3513 (class 2606 OID 23513)
-- Name: egresso_cota fka58rgwpq37hoof2640cw7j2l1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_cota
    ADD CONSTRAINT fka58rgwpq37hoof2640cw7j2l1 FOREIGN KEY (id_cota) REFERENCES public.cota(id_cota);


--
-- TOC entry 3493 (class 2606 OID 23413)
-- Name: comentario fkac7bpbirc6r6vcplb0fptftnx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fkac7bpbirc6r6vcplb0fptftnx FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3503 (class 2606 OID 23463)
-- Name: depoimento fkadydhxggbqc2ahkodd8du6s2t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkadydhxggbqc2ahkodd8du6s2t FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3521 (class 2606 OID 23573)
-- Name: egresso_titulacao fkb7ankaa93u5fr4nmbmyw46kmc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkb7ankaa93u5fr4nmbmyw46kmc FOREIGN KEY (titulacao_id_titulacao) REFERENCES public.titulacao(id_titulacao);


--
-- TOC entry 3538 (class 2606 OID 23643)
-- Name: setor_atuacao fkb7luqi69van4vdyylsmgv32hn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao
    ADD CONSTRAINT fkb7luqi69van4vdyylsmgv32hn FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3522 (class 2606 OID 23568)
-- Name: egresso_titulacao fkbympkqdq4ugh9r707xwyxmx0i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkbympkqdq4ugh9r707xwyxmx0i FOREIGN KEY (empresa_id) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3523 (class 2606 OID 23553)
-- Name: egresso_titulacao fkc2t7d851vn3eko0rgmg8uonqj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkc2t7d851vn3eko0rgmg8uonqj FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3499 (class 2606 OID 23443)
-- Name: cota fkcqjq3oy1bo82gon5venmvjw98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cota
    ADD CONSTRAINT fkcqjq3oy1bo82gon5venmvjw98 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3506 (class 2606 OID 23488)
-- Name: egresso fkcqqxhbp7hpudbb1dcyouyaq79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkcqqxhbp7hpudbb1dcyouyaq79 FOREIGN KEY (tipo_bolsa_id) REFERENCES public.tipo_bolsa(id_tipo_bolsa);


--
-- TOC entry 3548 (class 2606 OID 23688)
-- Name: usuario_grupo fkcu6om65mvqr6ct95ijgqgx7ww; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_grupo
    ADD CONSTRAINT fkcu6om65mvqr6ct95ijgqgx7ww FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo);


--
-- TOC entry 3510 (class 2606 OID 23508)
-- Name: egresso_area_atuacao fkd4e7n9hayio2dibmad734t0ra; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT fkd4e7n9hayio2dibmad734t0ra FOREIGN KEY (id_area_atuacao) REFERENCES public.area_atuacao(id_area_atuacao);


--
-- TOC entry 3514 (class 2606 OID 23543)
-- Name: egresso_empresa fkdut9kbfj1c87myf42xmao3aja; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkdut9kbfj1c87myf42xmao3aja FOREIGN KEY (faixa_salarial_id) REFERENCES public.faixa_salarial(id_faixa_salarial);


--
-- TOC entry 3488 (class 2606 OID 23398)
-- Name: anuncio fkf2afyb5u9a2g5kv1wce78ur8t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkf2afyb5u9a2g5kv1wce78ur8t FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3507 (class 2606 OID 23478)
-- Name: egresso fkf322p240i2h2i9sgcn5wjfaot; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkf322p240i2h2i9sgcn5wjfaot FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3491 (class 2606 OID 23403)
-- Name: area_atuacao fkfhdbeqpt6ruvdwof7m4acwoup; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area_atuacao
    ADD CONSTRAINT fkfhdbeqpt6ruvdwof7m4acwoup FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3540 (class 2606 OID 23648)
-- Name: setor_atuacao_empresa fkfjvgsmkx1gif8glw7y6uxjxos; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.setor_atuacao_empresa
    ADD CONSTRAINT fkfjvgsmkx1gif8glw7y6uxjxos FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3515 (class 2606 OID 23523)
-- Name: egresso_empresa fkhytqndbt06s83doal9nmgcksj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkhytqndbt06s83doal9nmgcksj FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3528 (class 2606 OID 23598)
-- Name: endereco fki98kyuu68rp4942s3r9vkko6x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fki98kyuu68rp4942s3r9vkko6x FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3501 (class 2606 OID 23458)
-- Name: curso fkiiafe2qpikwi45ggt4p8a5mik; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fkiiafe2qpikwi45ggt4p8a5mik FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3511 (class 2606 OID 23503)
-- Name: egresso_area_atuacao fkivuyjh4ny3uxkawybgpgxq96a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_area_atuacao
    ADD CONSTRAINT fkivuyjh4ny3uxkawybgpgxq96a FOREIGN KEY (id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3489 (class 2606 OID 23393)
-- Name: anuncio fkjw0029cxurvkx45044e65h64x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT fkjw0029cxurvkx45044e65h64x FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3508 (class 2606 OID 23493)
-- Name: egresso fkk0wr6p5gu54r773ttv5iira6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkk0wr6p5gu54r773ttv5iira6f FOREIGN KEY (genero_id) REFERENCES public.genero(id_genero);


--
-- TOC entry 3545 (class 2606 OID 23678)
-- Name: usuario fkkkymwf8xy047tl0035rhlfpq5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkkkymwf8xy047tl0035rhlfpq5 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3536 (class 2606 OID 23633)
-- Name: palestra fkku18fu56mnqdkfwbukwah002; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palestra
    ADD CONSTRAINT fkku18fu56mnqdkfwbukwah002 FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3546 (class 2606 OID 23683)
-- Name: usuario fkl4ghr4b3u1vycv960y09ss9a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkl4ghr4b3u1vycv960y09ss9a4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3494 (class 2606 OID 23423)
-- Name: comentario fkm8q6r8t4jmqia3plcao1pih8r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fkm8q6r8t4jmqia3plcao1pih8r FOREIGN KEY (anuncio_id) REFERENCES public.anuncio(id_anuncio);


--
-- TOC entry 3535 (class 2606 OID 23623)
-- Name: grupo fkmabbfeklclq6kit2wnnkgfak0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fkmabbfeklclq6kit2wnnkgfak0 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3504 (class 2606 OID 23473)
-- Name: depoimento fkmh11nyrmuejhtnlbo1tdxp88v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depoimento
    ADD CONSTRAINT fkmh11nyrmuejhtnlbo1tdxp88v FOREIGN KEY (egresso_id) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3509 (class 2606 OID 23483)
-- Name: egresso fkn1xoojso0x5qw602exgvv7v84; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso
    ADD CONSTRAINT fkn1xoojso0x5qw602exgvv7v84 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3543 (class 2606 OID 23673)
-- Name: titulacao fko1m66fdoqs86cucbvl928kes4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT fko1m66fdoqs86cucbvl928kes4 FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3524 (class 2606 OID 23548)
-- Name: egresso_titulacao fkp74iffsl9ivplq4gkuhyuvsh8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_titulacao
    ADD CONSTRAINT fkp74iffsl9ivplq4gkuhyuvsh8 FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3497 (class 2606 OID 23433)
-- Name: contribuicao fkpm3k93anx938a8ab7bnw2ct0u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuicao
    ADD CONSTRAINT fkpm3k93anx938a8ab7bnw2ct0u FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3516 (class 2606 OID 23528)
-- Name: egresso_empresa fkqdv2ixbxjn0jihxwra9tadgkb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkqdv2ixbxjn0jihxwra9tadgkb FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3533 (class 2606 OID 23618)
-- Name: genero fkqpmjfeicduajada8ttfr6fvbn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT fkqpmjfeicduajada8ttfr6fvbn FOREIGN KEY (last_modified_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3517 (class 2606 OID 23533)
-- Name: egresso_empresa fkrrdwo5y0sss2aq6r989sngy0g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fkrrdwo5y0sss2aq6r989sngy0g FOREIGN KEY (egresso_id_egresso) REFERENCES public.egresso(id_egresso);


--
-- TOC entry 3518 (class 2606 OID 23538)
-- Name: egresso_empresa fks0wngwsneahqe1p80rh1olamu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.egresso_empresa
    ADD CONSTRAINT fks0wngwsneahqe1p80rh1olamu FOREIGN KEY (empresa_id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 3527 (class 2606 OID 23588)
-- Name: empresa fks5bj6jkkca1s0d3jgw4wioi9g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fks5bj6jkkca1s0d3jgw4wioi9g FOREIGN KEY (endereco_empresa) REFERENCES public.endereco(id_endereco);


--
-- TOC entry 3529 (class 2606 OID 23593)
-- Name: endereco fkse5padocuj89r79jwdeif1l5i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fkse5padocuj89r79jwdeif1l5i FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 3544 (class 2606 OID 23668)
-- Name: titulacao fkt7h0tods16trs2x26gd6fkmca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.titulacao
    ADD CONSTRAINT fkt7h0tods16trs2x26gd6fkmca FOREIGN KEY (created_by) REFERENCES public.usuario(id_usuario);


-- Completed on 2023-05-04 09:24:55 -03

--
-- PostgreSQL database dump complete
--

