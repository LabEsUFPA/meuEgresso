CREATE SEQUENCE IF NOT EXISTS "public".anuncio_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".comentario_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".contribuicao_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".cota_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".curso_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".depoimento_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".egresso_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".empresa_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".endereco_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".etnia_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".faixa_salarial_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".genero_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".grupo_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".pesquisa_cientifica_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".tipo_bolsa_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".titulacao_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".trabalho_publicado_seq START WITH 1 INCREMENT BY 50;

CREATE SEQUENCE IF NOT EXISTS "public".usuario_seq START WITH 1 INCREMENT BY 50;

CREATE  TABLE IF NOT EXISTS "public".usuario (
	id_usuario           integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	email                varchar(50)  NOT NULL  ,
	nascimento_usuario   date  NOT NULL  ,
	nome_usuario         varchar(30)  NOT NULL  ,
	senha_usuario        varchar(80)  NOT NULL  ,
	login_usuario        varchar(100)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT usuario_pkey PRIMARY KEY ( id_usuario ),
	CONSTRAINT uk_8efax56av7vfdquauh0gyl9cx UNIQUE ( login_usuario )
 );

CREATE  TABLE IF NOT EXISTS "public".anuncio (
	id_anuncio           integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	descricao_anuncio    varchar(600)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT anuncio_pkey PRIMARY KEY ( id_anuncio )
 );

CREATE  TABLE IF NOT EXISTS "public".comentario (
	id_comentario        integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	descricao_comentario varchar(255)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	anuncio_id           integer  NOT NULL  ,
	CONSTRAINT comentario_pkey PRIMARY KEY ( id_comentario )
 );

CREATE  TABLE IF NOT EXISTS "public".contribuicao (
	id_contribuicao      integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	descricao_contribuicao varchar(255)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT contribuicao_pkey PRIMARY KEY ( id_contribuicao )
 );

CREATE  TABLE IF NOT EXISTS "public".cota (
	id_cota              integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	nome_cota            varchar(50)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT cota_pkey PRIMARY KEY ( id_cota ),
	CONSTRAINT uk_9k3kf2b9f2mjv11ksekdha97k UNIQUE ( nome_cota )
 );

CREATE  TABLE IF NOT EXISTS "public".curso (
	id_curso             integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	nome_curso           varchar(100)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT curso_pkey PRIMARY KEY ( id_curso ),
	CONSTRAINT uk_i35k8uavr3s5cxr12aefe00e UNIQUE ( nome_curso )
 );

CREATE  TABLE IF NOT EXISTS "public".empresa (
	id_empresa           integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	nome_empresa         varchar(130)  NOT NULL  ,
	setor_atuacao_empresa varchar(130)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT empresa_pkey PRIMARY KEY ( id_empresa )
 );

CREATE  TABLE IF NOT EXISTS "public".endereco (
	id_endereco          integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	cidade_endereco      varchar(255)  NOT NULL  ,
	estado_endereco      varchar(255)  NOT NULL  ,
	pais_endereco        varchar(255)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT endereco_pkey PRIMARY KEY ( id_endereco )
 );

CREATE  TABLE IF NOT EXISTS "public".etnia (
	id_etnia             integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	nome_etnia           varchar(30)    ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT etnia_pkey PRIMARY KEY ( id_etnia )
 );

CREATE  TABLE IF NOT EXISTS "public".faixa_salarial (
	id_faixa_salarial    integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	faixa_faixa_salarial varchar(255)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT faixa_salarial_pkey PRIMARY KEY ( id_faixa_salarial ),
	CONSTRAINT uk_2bn1lsqed44xqtrtq17s7tjue UNIQUE ( faixa_faixa_salarial )
 );

CREATE  TABLE IF NOT EXISTS "public".genero (
	id_genero            integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	nome_genero          varchar(100)    ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT genero_pkey PRIMARY KEY ( id_genero )
 );

CREATE  TABLE IF NOT EXISTS "public".grupo (
	id_grupo             integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	nome_grupo           varchar(50)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT grupo_pkey PRIMARY KEY ( id_grupo ),
	CONSTRAINT uk_is0kvc71ivi2o1nhe7h19m47p UNIQUE ( nome_grupo )
 );

CREATE  TABLE IF NOT EXISTS "public".tipo_bolsa (
	id_tipo_bolsa        integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	nome_tipo_bolsa      varchar(100)  NOT NULL  ,
	remuneracao_tipo_bolsa double precision  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT tipo_bolsa_pkey PRIMARY KEY ( id_tipo_bolsa ),
	CONSTRAINT uk_j6yqoqsrpie5ipmlh6c5jbrx1 UNIQUE ( nome_tipo_bolsa )
 );

CREATE  TABLE IF NOT EXISTS "public".titulacao (
	id_titulacao         integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	nome_titulacao       varchar(30)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT titulacao_pkey PRIMARY KEY ( id_titulacao ),
	CONSTRAINT uk_rvnwm2n5juoh0aj3qnssh52nm UNIQUE ( nome_titulacao )
 );

CREATE  TABLE IF NOT EXISTS "public".trabalho_publicado (
	id_trabalho_publicado integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	link_trabalho_publico varchar(255)  NOT NULL  ,
	nome_trabalho_publicado varchar(255)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	CONSTRAINT trabalho_publicado_pkey PRIMARY KEY ( id_trabalho_publicado ),
	CONSTRAINT uk_auqx5ujp3bqhc5gla7lmmhmc5 UNIQUE ( nome_trabalho_publicado )
 );

CREATE  TABLE IF NOT EXISTS "public".usuario_grupo (
	id_usuario           integer  NOT NULL  ,
	id_grupo             integer  NOT NULL  ,
	CONSTRAINT usuario_grupo_pkey PRIMARY KEY ( id_usuario, id_grupo )
 );

CREATE  TABLE IF NOT EXISTS "public".egresso (
	id_egresso           integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	interesse_em_pos_egresso boolean  NOT NULL  ,
	lattes_egresso       varchar(255)  NOT NULL  ,
	linkedin_egresso     varchar(255)  NOT NULL  ,
	matricula_egresso    varchar(12)  NOT NULL  ,
	pcd_egresso          boolean  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	cota_id              integer  NOT NULL  ,
	endereco_id          integer  NOT NULL  ,
	etnia_id             integer  NOT NULL  ,
	genero_id            integer  NOT NULL  ,
	usuario_id           integer  NOT NULL  ,
	CONSTRAINT egresso_pkey PRIMARY KEY ( id_egresso ),
	CONSTRAINT uk_4datilmpr40t15bnmxyve5t0y UNIQUE ( matricula_egresso ) ,
	CONSTRAINT uk_3tmslc9ltmjdyy2mbstgpf1un UNIQUE ( usuario_id )
 );

CREATE  TABLE IF NOT EXISTS "public".egresso_colacao (
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	data_conclusao       date    ,
	data_ingresso        date  NOT NULL  ,
	egresso_id_egresso   integer  NOT NULL  ,
	colacao_id_titulacao integer  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	curso_id             integer  NOT NULL  ,
	empresa_id           integer  NOT NULL  ,
	CONSTRAINT egresso_colacao_pkey PRIMARY KEY ( colacao_id_titulacao, egresso_id_egresso )
 );

CREATE  TABLE IF NOT EXISTS "public".egresso_contribuicao (
	id_contribuicao      integer  NOT NULL  ,
	egresso_id           integer  NOT NULL  ,
	CONSTRAINT egresso_contribuicao_pkey PRIMARY KEY ( id_contribuicao, egresso_id )
 );

CREATE  TABLE IF NOT EXISTS "public".egresso_empresa (
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	area_atuacao         varchar(50)  NOT NULL  ,
	empresa_id_empresa   integer  NOT NULL  ,
	egresso_id_egresso   integer  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	faixa_salarial_id    integer  NOT NULL  ,
	CONSTRAINT egresso_empresa_pkey PRIMARY KEY ( egresso_id_egresso, empresa_id_empresa )
 );

CREATE  TABLE IF NOT EXISTS "public".egresso_tabalho_publicado (
	id_trabalho_publicado integer  NOT NULL  ,
	id_usuario           integer  NOT NULL  ,
	CONSTRAINT egresso_tabalho_publicado_pkey PRIMARY KEY ( id_trabalho_publicado, id_usuario )
 );

CREATE  TABLE IF NOT EXISTS "public".pesquisa_cientifica (
	id_pesquisa_cientifica integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	fim                  date  NOT NULL  ,
	inicio               date  NOT NULL  ,
	nome_pesquisa_cientifica varchar(100)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	empresa_id           integer  NOT NULL  ,
	tipo_bolsa_id        integer  NOT NULL  ,
	CONSTRAINT pesquisa_cientifica_pkey PRIMARY KEY ( id_pesquisa_cientifica ),
	CONSTRAINT uk_g78g7we6eclwcec6f6yflh9jw UNIQUE ( fim ) ,
	CONSTRAINT uk_4p8pb1j2o2cb350tekkdcmfxi UNIQUE ( inicio ) ,
	CONSTRAINT uk_c59t92u7dloaowxaxyoou9n3 UNIQUE ( nome_pesquisa_cientifica ) ,
	CONSTRAINT uk_cl6mu5f6c7u8201hyvmj50yl6 UNIQUE ( empresa_id ) ,
	CONSTRAINT uk_3rka6fa74y70gole2j84l4se6 UNIQUE ( tipo_bolsa_id )
 );

CREATE  TABLE IF NOT EXISTS "public".depoimento (
	id_depoimento        integer  NOT NULL  ,
	ativo                boolean DEFAULT true NOT NULL  ,
	created_date         timestamp    ,
	last_modified_date   timestamp    ,
	descricao_depoimento varchar(255)  NOT NULL  ,
	created_by           integer    ,
	last_modified_by     integer    ,
	egresso_id           integer  NOT NULL  ,
	CONSTRAINT depoimento_pkey PRIMARY KEY ( id_depoimento ),
	CONSTRAINT uk_rpha5d7rfphcjvj0nbjb1nvxs UNIQUE ( egresso_id )
 );

ALTER TABLE "public".anuncio ADD CONSTRAINT fkf2afyb5u9a2g5kv1wce78ur8t FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".anuncio ADD CONSTRAINT fkjw0029cxurvkx45044e65h64x FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".comentario ADD CONSTRAINT fkm8q6r8t4jmqia3plcao1pih8r FOREIGN KEY ( anuncio_id ) REFERENCES "public".anuncio( id_anuncio );

ALTER TABLE "public".comentario ADD CONSTRAINT fk5k6dqdx9kn983dj5jx5orhss0 FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".comentario ADD CONSTRAINT fkac7bpbirc6r6vcplb0fptftnx FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".contribuicao ADD CONSTRAINT fk7x5ccymo3mvys7sdoar4w27jy FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".contribuicao ADD CONSTRAINT fkpm3k93anx938a8ab7bnw2ct0u FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".cota ADD CONSTRAINT fk1lve8o0jw4i8ksl2dxp0lm8 FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".cota ADD CONSTRAINT fkcqjq3oy1bo82gon5venmvjw98 FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".curso ADD CONSTRAINT fk3tu6gxj4fe3b8vgyhhr17p5d1 FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".curso ADD CONSTRAINT fkiiafe2qpikwi45ggt4p8a5mik FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".depoimento ADD CONSTRAINT fkmh11nyrmuejhtnlbo1tdxp88v FOREIGN KEY ( egresso_id ) REFERENCES "public".egresso( id_egresso );

ALTER TABLE "public".depoimento ADD CONSTRAINT fk4282xxihuiq8nqknlkrlmn6k7 FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".depoimento ADD CONSTRAINT fkadydhxggbqc2ahkodd8du6s2t FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".egresso ADD CONSTRAINT fkexkpbpskvab604sytj2vwkbbi FOREIGN KEY ( cota_id ) REFERENCES "public".cota( id_cota );

ALTER TABLE "public".egresso ADD CONSTRAINT fk8fxxf75hx1hh70l37mgssxq7x FOREIGN KEY ( endereco_id ) REFERENCES "public".endereco( id_endereco );

ALTER TABLE "public".egresso ADD CONSTRAINT fkais2tyr121r8riq5shnxis9a5 FOREIGN KEY ( etnia_id ) REFERENCES "public".etnia( id_etnia );

ALTER TABLE "public".egresso ADD CONSTRAINT fkk0wr6p5gu54r773ttv5iira6f FOREIGN KEY ( genero_id ) REFERENCES "public".genero( id_genero );

ALTER TABLE "public".egresso ADD CONSTRAINT fk3lb1ai4t6bvvsu9jc9qm0fisi FOREIGN KEY ( usuario_id ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".egresso ADD CONSTRAINT fkf322p240i2h2i9sgcn5wjfaot FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".egresso ADD CONSTRAINT fkn1xoojso0x5qw602exgvv7v84 FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".egresso_colacao ADD CONSTRAINT fklv0r9bo87w7g07k5sxdq528n6 FOREIGN KEY ( curso_id ) REFERENCES "public".curso( id_curso );

ALTER TABLE "public".egresso_colacao ADD CONSTRAINT fk5s4jvmhaxcxqf9ns9emjxsfcl FOREIGN KEY ( egresso_id_egresso ) REFERENCES "public".egresso( id_egresso );

ALTER TABLE "public".egresso_colacao ADD CONSTRAINT fkcbfx8yqfdky3xvvpa2ueglokf FOREIGN KEY ( empresa_id ) REFERENCES "public".empresa( id_empresa );

ALTER TABLE "public".egresso_colacao ADD CONSTRAINT fkoa0s7u5ldhsvj60d9k8me0pm FOREIGN KEY ( colacao_id_titulacao ) REFERENCES "public".titulacao( id_titulacao );

ALTER TABLE "public".egresso_colacao ADD CONSTRAINT fkad0lc8uoy6j5vi41gtjxwjmbx FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".egresso_colacao ADD CONSTRAINT fkqo0363yfvw2wtwmhpmcstw5se FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".egresso_contribuicao ADD CONSTRAINT fkq9mn4tfe8aa2ja8eqyqkh2bmi FOREIGN KEY ( id_contribuicao ) REFERENCES "public".contribuicao( id_contribuicao );

ALTER TABLE "public".egresso_contribuicao ADD CONSTRAINT fk4gvopbnet1mmho04h7co01nac FOREIGN KEY ( egresso_id ) REFERENCES "public".egresso( id_egresso );

ALTER TABLE "public".egresso_empresa ADD CONSTRAINT fkrrdwo5y0sss2aq6r989sngy0g FOREIGN KEY ( egresso_id_egresso ) REFERENCES "public".egresso( id_egresso );

ALTER TABLE "public".egresso_empresa ADD CONSTRAINT fks0wngwsneahqe1p80rh1olamu FOREIGN KEY ( empresa_id_empresa ) REFERENCES "public".empresa( id_empresa );

ALTER TABLE "public".egresso_empresa ADD CONSTRAINT fkdut9kbfj1c87myf42xmao3aja FOREIGN KEY ( faixa_salarial_id ) REFERENCES "public".faixa_salarial( id_faixa_salarial );

ALTER TABLE "public".egresso_empresa ADD CONSTRAINT fkhytqndbt06s83doal9nmgcksj FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".egresso_empresa ADD CONSTRAINT fkqdv2ixbxjn0jihxwra9tadgkb FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".egresso_tabalho_publicado ADD CONSTRAINT fk3sf576u4g9plod0u1p97rte3 FOREIGN KEY ( id_usuario ) REFERENCES "public".egresso( id_egresso );

ALTER TABLE "public".egresso_tabalho_publicado ADD CONSTRAINT fkms1rd8cb5i9kwchng3bn8xx72 FOREIGN KEY ( id_trabalho_publicado ) REFERENCES "public".trabalho_publicado( id_trabalho_publicado );

ALTER TABLE "public".empresa ADD CONSTRAINT fk1252u5xj526ufsf5c3c9fcic2 FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".empresa ADD CONSTRAINT fka0nk763e7luto0itr7it6y5gr FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".endereco ADD CONSTRAINT fki98kyuu68rp4942s3r9vkko6x FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".endereco ADD CONSTRAINT fkse5padocuj89r79jwdeif1l5i FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".etnia ADD CONSTRAINT fk2gady9tv8ecy50ushe4dahyll FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".etnia ADD CONSTRAINT fk61v53y0v0kn5dqm3lk01nmyla FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".faixa_salarial ADD CONSTRAINT fk12fuee7y4kjstxd7xwk3fageo FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".faixa_salarial ADD CONSTRAINT fk96o103aeo1xeuhgnn0hhs6bl0 FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".genero ADD CONSTRAINT fk4hmk8te4ct41ket6gewknyld3 FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".genero ADD CONSTRAINT fkqpmjfeicduajada8ttfr6fvbn FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".grupo ADD CONSTRAINT fk4x87bpegbq5yd4awx0jpyl7rf FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".grupo ADD CONSTRAINT fkmabbfeklclq6kit2wnnkgfak0 FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".pesquisa_cientifica ADD CONSTRAINT fkb1v55t12ysomaf0pjgmbm0ol4 FOREIGN KEY ( empresa_id ) REFERENCES "public".empresa( id_empresa );

ALTER TABLE "public".pesquisa_cientifica ADD CONSTRAINT fkewerpa5ejhivluvp6biw6ml10 FOREIGN KEY ( tipo_bolsa_id ) REFERENCES "public".tipo_bolsa( id_tipo_bolsa );

ALTER TABLE "public".pesquisa_cientifica ADD CONSTRAINT fknykoy5ti3sn6kqj400se34h1k FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".pesquisa_cientifica ADD CONSTRAINT fkpy956mebthp6xe40htvdiij85 FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".tipo_bolsa ADD CONSTRAINT fk3c5grr0qggvj0dw2fada2xhyv FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".tipo_bolsa ADD CONSTRAINT fk9brd9pf3m513c4qwotx7j5l5f FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".titulacao ADD CONSTRAINT fko1m66fdoqs86cucbvl928kes4 FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".titulacao ADD CONSTRAINT fkt7h0tods16trs2x26gd6fkmca FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".trabalho_publicado ADD CONSTRAINT fkejj6gibgk52smjgtgls1ghvcw FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".trabalho_publicado ADD CONSTRAINT fkh9i8ep2j6ifsmtl46j8pakcfo FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".usuario ADD CONSTRAINT fkkkymwf8xy047tl0035rhlfpq5 FOREIGN KEY ( created_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".usuario ADD CONSTRAINT fkl4ghr4b3u1vycv960y09ss9a4 FOREIGN KEY ( last_modified_by ) REFERENCES "public".usuario( id_usuario );

ALTER TABLE "public".usuario_grupo ADD CONSTRAINT fkcu6om65mvqr6ct95ijgqgx7ww FOREIGN KEY ( id_grupo ) REFERENCES "public".grupo( id_grupo );

ALTER TABLE "public".usuario_grupo ADD CONSTRAINT fk9huj1upwjyabwkwnpnhnernnu FOREIGN KEY ( id_usuario ) REFERENCES "public".usuario( id_usuario );
