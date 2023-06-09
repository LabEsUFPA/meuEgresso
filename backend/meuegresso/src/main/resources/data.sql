-- Usuario Padrão

INSERT INTO usuario (email,nome_usuario,senha_usuario,login_usuario, email_verificado_usuario) VALUES ('admin@admin.com','ADMIN ADMIN','{bcrypt}$2a$10$vh9/MkL4XQyd.fqkQdnWSelTUxPBpDb6qL5W2uWLxLUN0JR9vwRZm','ADMIN', true) ON CONFLICT DO NOTHING;
INSERT INTO usuario (email,nome_usuario,senha_usuario,login_usuario, email_verificado_usuario) VALUES ('secretario@secretario.com','SECRETARIO SECRETARIO','{bcrypt}$2a$10$biZwxymZqQDevuqWzB/wCe0jfC6Idr.SJRYO9oXBFPuusp9oA9hAy','SECRETARIO', true) ON CONFLICT DO NOTHING;

-- Usuarios por Grupo
INSERT INTO public.usuario_grupo
VALUES (1, 'ADMIN') ON CONFLICT DO NOTHING;
INSERT INTO public.usuario_grupo
VALUES (2, 'SECRETARIO') ON CONFLICT DO NOTHING;
--- Tipos de Cota
INSERT INTO public.cota (nome_cota, created_by)
VALUES ('Escola', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.cota (nome_cota, created_by)
VALUES ('Renda', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.cota (nome_cota, created_by)
VALUES ('Autodeclaração de Raça', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.cota (nome_cota, created_by)
VALUES ('Quilombolas/Indígenas', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.cota (nome_cota, created_by)
VALUES ('PCD', 1) ON CONFLICT DO NOTHING;
--- Cursos
INSERT INTO public.curso (nome_curso, created_by)
VALUES ('CIÊNCIA DA COMPUTAÇÃO', 1) ON CONFLICT DO NOTHING;
--- Setor Atuação
INSERT INTO public.setor_atuacao (nome_setor_atuacao, created_by)
VALUES ('Empresarial', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.setor_atuacao (nome_setor_atuacao, created_by)
VALUES ('Público', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.setor_atuacao (nome_setor_atuacao, created_by)
VALUES ('Terceiro setor', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.setor_atuacao (nome_setor_atuacao, created_by)
VALUES ('Magistério/Docência', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.setor_atuacao (nome_setor_atuacao, created_by)
VALUES ('Outros', 1) ON CONFLICT DO NOTHING;

INSERT INTO public.area_atuacao (nome_area_atuacao, created_by)
VALUES ('Computação', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_atuacao (nome_area_atuacao, created_by)
VALUES ('Pesquisa', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_atuacao (nome_area_atuacao, created_by)
VALUES ('Desempregado', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_atuacao (nome_area_atuacao, created_by)
VALUES ('Programador', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_atuacao (nome_area_atuacao, created_by)
VALUES ('Analista', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_atuacao (nome_area_atuacao, created_by)
VALUES ('Outros', 1) ON CONFLICT DO NOTHING;
--- Endereço
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BELFORD ROXO', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BELO HORIZONTE', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FLORIANÓPOLIS', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RESENDE', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BRASÍLIA', 'DF', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUÍNA', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TEÓFILO OTONI', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO PAULO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CACIMBINHAS', 'AL', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VOTUPORANGA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('INDAIATUBA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIO DE JANEIRO', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FRANCISCO BELTRÃO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALTAMIRA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARCOVERDE', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BACABEIRA', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CATALÃO', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CONSELHEIRO LAFAIETE', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DIVINÓPOLIS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ILHÉUS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JATAÍ', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LORENA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PALMAS', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SETE LAGOAS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VITÓRIA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MACAPÁ', 'AP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TERESINA', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BELÉM DE SÃO FRANCISCO', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SARANDI', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUAPORÉ', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JARAGUÁ DO SUL', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARBACENA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TAUBATÉ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ESPÍRITO SANTO DO PINHAL', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MACHADO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ASSIS CHATEAUBRIAND', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VITÓRIA DA CONQUISTA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUIZ DE FORA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OLINDA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARIPIRANGA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('APARECIDA DE GOIÂNIA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GOIÂNIA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AMPARO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LEME', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FORTALEZA', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARABÁ', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTO ANDRÉ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO GRANDE', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NITERÓI', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PRESIDENTE PRUDENTE', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PORTO VELHO', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LUÍS EDUARDO MAGALHÃES', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PETRÓPOLIS', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CASCAVEL', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARACATU', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CURITIBA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BALNEÁRIO CAMBORIÚ', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIBEIRÃO PRETO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ORLEANS', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RECIFE', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO LUÍS DE MONTES BELOS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MOGI DAS CRUZES', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO LIMPO PAULISTA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARAPUAVA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COLATINA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARRA DO GARÇAS', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('QUIXADÁ', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JOINVILLE', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CORONEL FABRICIANO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LINS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OSÓRIO', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO CARLOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MACEIÓ', 'AL', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CACHOEIRINHA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MANAUS', 'AM', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARINGÁ', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BENTO GONÇALVES', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTARÉM', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BELÉM', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARRETOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUAXUPÉ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO BERNARDO DO CAMPO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARARAS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DOURADOS', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOSÉ DOS PINHAIS', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BAGÉ', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAXIAS DO SUL', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOÃO DA BOA VISTA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OURINHOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VITÓRIA DE SANTO ANTÃO', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ADAMANTINA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARRA MANSA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BAURU', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BRUSQUE', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CARATINGA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTO ANTÔNIO DE JESUS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAXIAS', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LUZIÂNIA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FEIRA DE SANTANA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARULHOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FORMIGA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GOIATUBA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAJUBÁ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPIRA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JAGUARIÚNA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JALES', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JOÃO PESSOA', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LAVRAS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MINEIROS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PATO BRANCO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PATOS', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PATOS DE MINAS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PAULÍNIA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOSÉ DO RIO PRETO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CACOAL', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SALVADOR', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA FÉ DO SUL', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('UBERABA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('UNIÃO DA VITÓRIA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VALENÇA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VÁRZEA GRANDE', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VIÇOSA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VOLTA REDONDA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FOZ DO IGUAÇU', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PATROCÍNIO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO CAETANO DO SUL', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARUJÁ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MONTES CLAROS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAXÁ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NATAL', 'RN', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PAULO AFONSO', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JABOATÃO DOS GUARARAPES', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VARGINHA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('UBERLÂNDIA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUAZEIRO DO NORTE', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARACATI', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('REGISTRO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BOA VISTA', 'RR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JI-PARANÁ', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOSÉ', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO LUÍS', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARACAJU', 'SE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIO BRANCO', 'AC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOSÉ DOS CAMPOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARÍLIA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SOROCABA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPINA GRANDE', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LAGES', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PORTO ALEGRE', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LAPA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARIQUEMES', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPIRANGA', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMAÇARI', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MURIAÉ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SINOP', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CARUARU', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUANAMBI', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OSASCO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LONDRINA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPOS DOS GOYTACAZES', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITABIRA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PINDAMONHANGABA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('UBÁ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TRINDADE', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GETÚLIO VARGAS', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAGUARI', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SOBRAL', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO MOURÃO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LUCAS DO RIO VERDE', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('INDAIAL', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRUZ DAS ALMAS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MONTE CARMELO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARREIRAS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PAULISTA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARNAÍBA', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPINAS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CARAGUATATUBA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FRANCA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITU', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CATANDUVA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUNDIAÍ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIO DO SUL', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SUZANO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOÃO DEL REI', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPERUNA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AMERICANA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PONTA GROSSA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAJAZEIRAS', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CACHOEIRO DE ITAPEMIRIM', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO ROQUE', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRICIÚMA', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BLUMENAU', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TERESÓPOLIS', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AVARÉ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAGUAÍNA', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAÇATUBA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BETIM', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BOM DESPACHO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CONTAGEM', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARAMIRIM', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIO VERDE', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CUIABÁ', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CABEDELO', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ATIBAIA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAUCÁRIA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MANHUAÇU', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BEBEDOURO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LAURO DE FREITAS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TELÊMACO BORBA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARANAVAÍ', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TABOÃO DA SERRA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALAGOINHAS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DOIS VIZINHOS', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAPIVARI DE BAIXO', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO MATEUS', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TRÊS CORAÇÕES', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ICÓ', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MATIPÓ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIRIPIRI', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BATATAIS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIO CLARO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITÁPOLIS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIRACICABA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARABIRA', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VILA VELHA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ABAETETUBA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARAGUAÇU PAULISTA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRUZEIRO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('POUSO ALEGRE', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IGUATAMA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ANANINDEUA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA TERESA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITUMBIARA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TIANGUÁ', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAGUATINS', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BURITICUPU', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARIANA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BENEVIDES', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CACHOEIRA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IVATUBA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO RAIMUNDO NONATO', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO FÉLIX DO XINGU', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JACOBINA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IRECÊ', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SENHOR DO BONFIM', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TUCANO', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO NOVO DO PARECIS', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITURAMA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PRAIA GRANDE', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('UMUARAMA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALMENARA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAÇUAÍ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAPELINHA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUANHÃES', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CASA NOVA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PONTALINA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('REMANSO', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITABERAÍ', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPEVI', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITABIRITO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MANACAPURU', 'AM', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALVORADA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ANÁPOLIS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GOVERNADOR VALADARES', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARAPARI', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IMPERATRIZ', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IPATINGA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITABUNA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPECERICA DA SERRA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPETININGA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPEVA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JACAREÍ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JAÚ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JEQUIÉ', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LIMEIRA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LINHARES', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MATÃO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MOGI GUAÇU', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARAGOMINAS', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARAUAPEBAS', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PASSO FUNDO', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PELOTAS', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('POÇOS DE CALDAS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PRIMAVERA DO LESTE', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIBEIRÃO DAS NEVES', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RONDONÓPOLIS', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA BÁRBARA D''OESTE', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOÃO DE MERITI', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SERRA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SERTÃOZINHO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SORRISO', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SUMARÉ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TANGARÁ DA SERRA', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TEIXEIRA DE FREITAS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VALINHOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VALPARAÍSO DE GOIÁS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIO GRANDE', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VOTORANTIM', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RESTINGA SECA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CURVELO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIRAPORA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BRUMADINHO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TOLEDO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ASTORGA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VALENÇA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PASSOS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PORTO SEGURO', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FERNANDÓPOLIS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRATO', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IJUÍ', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BERTIOGA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BIRIGUI', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BOA ESPERANÇA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JABOTICABAL', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO SEBASTIÃO DO PARAÍSO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMAQUÃ', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO ERÊ', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CACHOEIRA PAULISTA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CASA BRANCA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARACRUZ', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVO PROGRESSO', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MOSSORÓ', 'RN', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAPUTANGA', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MACAÉ', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAICÓ', 'RN', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMBÉ', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAPIVARI', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIO BONITO', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRISTALINA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CATANDUVAS', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IGUATU', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAPIRACA', 'AL', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PALMEIRA DOS ÍNDIOS', 'AL', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARACANAÚ', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARAU', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('EUSÉBIO', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COROMANDEL', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JOÃO PINHEIRO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ILHA SOLTEIRA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITABORAÍ', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO LARGO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FARROUPILHA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GRAVATAÍ', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAJAÍ', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA PETRÓPOLIS', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIO DAS OSTRAS', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTO ÂNGELO', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('UNAÍ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CONCÓRDIA', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CONCHAS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TIMÓTEO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CORNÉLIO PROCÓPIO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TUPÃ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VILHENA', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COLÍDER', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ESCADA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CANOINHAS', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CABO FRIO', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA MARIA DE JETIBÁ', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CONCEIÇÃO DO COITÉ', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VESPASIANO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARATINGUETÁ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SIDROLÂNDIA', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO BELO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CATAGUASES', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CHAPADÃO DO SUL', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FÁTIMA DO SUL', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA ANDRADINA', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA CRUZ DO RIO PARDO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('HOLAMBRA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AGUDOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALTA FLORESTA', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AMAMBAÍ', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AMPÉRE', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ANICUNS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('APUCARANA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARARAQUARA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ASSIS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BALSAS', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARUERI', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BOITUVA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BOTUCATU', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BRAGANÇA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAFELÂNDIA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAIEIRAS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CALDAS NOVAS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPINA GRANDE DO SUL', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CARIACICA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CASTELO', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUAÇUÍ', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ANDRADINA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARARIPINA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LIMOEIRO', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BELO JARDIM', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO MAIOR', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALÉM PARAÍBA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SERRA TALHADA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CODÓ', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GOIANA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TIMBAÚBA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO FIDÉLIS', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAPIM GROSSO', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BRAGANÇA PAULISTA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA MARIA DA VITÓRIA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CHAPECÓ', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JANAÚBA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPOS GERAIS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO GOTARDO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MAIRIPORÃ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SALGUEIRO', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CABO DE SANTO AGOSTINHO', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IGARASSU', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BOM JESUS DA LAPA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ERECHIM', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARAÍSO DO TOCANTINS', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA MARIA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TUCURUÍ', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARICÁ', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TRÊS RIOS', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AUGUSTINÓPOLIS', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAMARAJU', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('XAXIM', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('EXTREMA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUATUBA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JACIARA', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ÁGUA BOA', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PALMARES', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COLINAS DO TOCANTINS', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO FRANCISCO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRUZEIRO DO SUL', 'AC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPEMA', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('URUGUAIANA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('REDUTO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DRACENA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DUQUE DE CAXIAS', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MONTE APRAZÍVEL', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IPU', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COSTA RICA', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JARU', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO MATEUS DO MARANHÃO', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TAILÂNDIA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PEDREIRAS', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOÃO DO PIAUÍ', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PETROLINA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARACAMBI', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTO ANTÔNIO DE PÁDUA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BOM JESUS DO ITABAPOANA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BEZERROS', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ELESBÃO VELOSO', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PACAJUS', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('REDENÇÃO', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FLORIANO', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARECHAL CÂNDIDO RONDON', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PITANGA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TIMON', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GARÇA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TATUÍ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VIANA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALEGRE', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IBITINGA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITUVERAVA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PENÁPOLIS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOSÉ DO RIO PARDO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LUZ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FRUTAL', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARANTÃ DO NORTE', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('HORTOLÂNDIA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IBAITI', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('INDIARA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OURO PRETO DO OESTE', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('INHUMAS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GARIBALDI', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IPORÁ', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAITUBA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JANDAIA DO SUL', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUSSARA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MARTINÓPOLIS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MATUPÁ', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MAUÁ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA LIMA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AÇAILÂNDIA', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GARANHUNS', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CASTANHAL', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MIGUEL PEREIRA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MIRASSOL', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA MUTUM', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA SERRANA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OLÍMPIA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PALMEIRAS DE GOIÁS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARÁ DE MINAS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PENEDO', 'AL', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PINHAIS', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIRACANJUBA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PONTA PORÃ', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PORTO FELIZ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PRESIDENTE EPITÁCIO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PRESIDENTE VENCESLAU', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ROSANA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('QUIXERAMOBIM', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RANCHARIA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIBEIRÃO PIRES', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ROLIM DE MOURA', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ROSEIRA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SABARÁ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITABERABA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA INÊS', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA LUZIA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTANA DE PARNAÍBA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTO ANTÔNIO DA PLATINA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO LOURENÇO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO MARCOS', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO VICENTE', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOAQUIM DA BARRA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FLORESTA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TAPEJARA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TAQUARITINGA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAPÃO BONITO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CARAPICUÍBA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COTIA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRUZEIRO DO OESTE', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DIADEMA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FERRAZ DE VASCONCELOS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FRANCO DA ROCHA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('HORIZONTE', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAQUAQUECETUBA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITATIBA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MOCOCA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('POMPÉIA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO SEBASTIÃO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARRA BONITA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IVAIPORÃ', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUAZEIRO', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAUCAIA', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPIPOCA', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOSSA SENHORA DO SOCORRO', 'SE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARNAMIRIM', 'RN', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SENADOR CANEDO', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FORMOSA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FRANCISCO MORATO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVO HAMBURGO', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CANOAS', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ESTRELA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PALHOÇA', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LUPÉRCIO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO BENTO DO SUL', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TEODORO SAMPAIO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TIETÊ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA TEREZINHA DE GOIÁS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PONTE NOVA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CHAPADINHA', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SUMÉ', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VIAMÃO', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARRA DO CORDA', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIRATININGA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AÇU', 'RN', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CARANGOLA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JOÃO MONLEVADE', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARATUBA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BATURITÉ', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA CRUZ DO SUL', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAPITÃO LEÔNIDAS MARQUES', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GOIOERÊ', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('UBIRATÃ', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIBEIRA DO POMBAL', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LAGARTO', 'SE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CORONEL JOÃO SÁ', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO MIGUEL', 'RN', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CORRENTE', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CURRAIS NOVOS', 'RN', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MONTE SANTO', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MILHÃ', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TRINDADE', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AFOGADOS DA INGAZEIRA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CABROBÓ', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIRES DO RIO', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUARA', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VIRGINÓPOLIS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SURUBIM', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAGUAÍ', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('FAZENDA RIO GRANDE', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COLOMBO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MEDIANEIRA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OLIVEIRA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('EMBU', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUAIÚBA', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('EUNÁPOLIS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CANINDÉ', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIMENTA BUENO', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CÁCERES', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IPIRÁ', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CERES', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GOIANÉSIA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JARAGUÁ', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RUBIATABA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COROATÁ', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PAU DOS FERROS', 'RN', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAÚNA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARAMBU', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BANDEIRANTES', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIUM', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JAGUARIAÍVA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ÁGUAS LINDAS DE GOIÁS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CERQUILHO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CIDADE OCIDENTAL', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JANUÁRIA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PEDERNEIRAS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMOCIM', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SOUSA', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GUARAÍ', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAPONGAS', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('HORIZONTINA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIRAJU', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PORANGATU', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LOANDA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MANTENA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IPAUSSU', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITANHAÉM', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPURANGA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA QUITÉRIA', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('QUIRINÓPOLIS', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARUJÁ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO GONÇALO', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TIMBÓ', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PADRE BERNARDO', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVO GAMA', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CARPINA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTANA', 'AP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITUIUTABA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARNARAMA', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO MANUEL', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TUCUMÃ', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('XINGUARA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CROATÁ', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('COARI', 'AM', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DIAS D''ÁVILA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITACOATIARA', 'AM', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARINTINS', 'AM', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TEFÉ', 'AM', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BREVES', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IGARAPÉ-MIRI', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MOJI MIRIM', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PICOS', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CANELA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PALOTINA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA VENÉCIA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CLEVELÂNDIA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA ODESSA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITINGA DO MARANHÃO', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IPOJUCA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LENÇÓIS PAULISTA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAPANEMA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ROLÂNDIA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PEDRO LEOPOLDO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PERUÍBE', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PINHALZINHO', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CANINDÉ DE SÃO FRANCISCO', 'SE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TRÊS LAGOAS', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BACABAL', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BRUMADO', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARANAGUÁ', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PORTO BELO', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PORTO NACIONAL', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('AIMORÉS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BAEPENDI', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARÃO DE COCAIS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITANHANDU', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LAMBARI', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LEOPOLDINA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOÃO NEPOMUCENO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VISCONDE DO RIO BRANCO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PRESIDENTE DUTRA', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRATEÚS', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALFENAS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JUNQUEIRÓPOLIS', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OSVALDO CRUZ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('REALEZA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TUPI PAULISTA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CANDEIAS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BERTÓPOLIS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIACHÃO DO JACUÍPE', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('UMBAÚBA', 'SE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALTO SANTO', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PALMITOS', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PEDRO AFONSO', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CORUMBÁ', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA CRUZ DO CAPIBARIBE', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PINHEIRO', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVO HORIZONTE', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NAZARÉ DA MATA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IPIAÚ', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAÇAPAVA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('QUEIMADAS', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTOS DUMONT', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TERRA BOA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PÃO DE AÇÚCAR', 'AL', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IRATI', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARARANGUÁ', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAÇADOR', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO MIGUEL DO OESTE', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TUBARÃO', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('URUAÇU', 'GO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO LEOPOLDO', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO PEDRO DO PIAUÍ', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('EUCLIDES DA CUNHA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IRARÁ', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LAGO DA PEDRA', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('URUÇUÍ', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARAPOTI', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IBICARAÍ', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NAVEGANTES', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OURO FINO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CASSILÂNDIA', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DIAMANTINO', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NAVIRAÍ', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARANAÍBA', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TAGUAÍ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TAQUARA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA ROSA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PEREIRA BARRETO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITARARÉ', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ÁGUA BRANCA', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO BENTO', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IÚNA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ITAPORANGA', 'PB', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LIMOEIRO DO NORTE', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IGREJINHA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ALTO BOA VISTA', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TRÊS DE MAIO', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TRÊS PONTAS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMBUQUIRA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CIANORTE', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ARARUAMA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO GONÇALO DO AMARANTE', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PARAÍSO DO NORTE', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOSÉ DOS QUATRO MARCOS', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OURILÂNDIA DO NORTE', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO GABRIEL DA PALHA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAMPO VERDE', 'MT', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MUNDO NOVO', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CASCAVEL', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('TOBIAS BARRETO', 'SE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO MIGUEL DO IGUAÇU', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO LOURENÇO DA MATA', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARCARENA', 'PA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SERRINHA', 'BA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA PORTEIRINHA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO JOSÉ DO EGITO', 'PE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('ANCHIETA', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VENDA NOVA DO IMIGRANTE', 'ES', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MATO VERDE', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SOCORRO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTA RITA DO SAPUCAÍ', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PIRASSUNUNGA', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PORTEIRINHA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAARAPÓ', 'MS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CAPANEMA', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IPORÃ', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SERINGUEIRAS', 'RO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MANDAGUARI', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SABINÓPOLIS', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('PAÇO DO LUMIAR', 'MA', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CANTO DO BURITI', 'PI', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('IVOTI', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SANTANA DO IPANEMA', 'AL', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('RIBEIRÃO BONITO', 'SP', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('BARRACÃO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('REDENÇÃO', 'CE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('CRUZ ALTA', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('GURUPI', 'TO', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('VASSOURAS', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('MAFRA', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JOAÇABA', 'SC', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('LAJEADO', 'RS', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('JACAREZINHO', 'PR', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('OURO PRETO', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SÃO CRISTÓVÃO', 'SE', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('DIAMANTINA', 'MG', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('SEROPÉDICA', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.endereco (
        cidade_endereco,
        estado_endereco,
        pais_endereco,
        created_by
    )
VALUES ('NOVA IGUAÇU', 'RJ', 'BRASIL', 1) ON CONFLICT DO NOTHING;
--- Empresa/Instituiçao
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ABEU - CENTRO UNIVERSITÁRIO (UNIABEU)',
        1,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ACADEMIA DE POLÍCIA MILITAR DE MINAS GERAIS (APM)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ACADEMIA JUDICIAL DO TRIBUNAL DE JUSTIÇA DE SANTA CATARINA (AJ)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ACADEMIA MILITAR DAS AGULHAS NEGRAS (AMAN)',
        4,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ACADEMIA NACIONAL DE POLÍCIA - ANP (ANP)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'AJES - FACULDADE DO VALE DO JURUENA (AJES)',
        6,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ALFA - FACULDADE DE TEÓFILO OTONI (ALFA - TO)',
        7,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('BRAIN BUSINESS SCHOOL (BRAIN)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CEDDU - CENTRO DE ENSINO SUPERIOR (CEDDU)',
        9,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENAC - CENTRO DE ENSINO NACIONAL',
        10,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE EDUCAÇÃO TÉCNICA DA UTRAMIG (UTRAMIG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE EDUCAÇÃO TECNOLÓGICO DA FUNDAÇÃO INDAIATUBANA DE EDUCAÇÃO E CULTURA (FIEC)',
        11,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO E PESQUISA DO PRÓ-CARDÍACO (PROCEP)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR CESUL (CESUL)',
        13,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE ALTAMIRA',
        14,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE ARCOVERDE (CESA)',
        15,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE BACABEIRA (CESBA)',
        16,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE CATALÃO',
        17,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE CONSELHEIRO LAFAIETE (CES-CL)',
        18,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE DIVINÓPOLIS',
        19,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE ILHÉUS (CESUPI)',
        20,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE JATAÍ (CESUT)',
        21,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE LORENA',
        22,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE PALMAS (CESUP)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE SERRA DOURADA',
        22,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE SETE LAGOAS',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DE VITÓRIA (CESV)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DO AMAPÁ (CEAP)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DO VALE DO PARNAÍBA (CESVALE)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR DO VALE SÃO FRANCISCO (CESVASF)',
        28,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR RIOGRANDENSE (CESURG)',
        29,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR RIOGRANDENSE GUAPORE (CESURG GUAPORE)',
        30,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO SUPERIOR SOCIESC DE JARAGUÁ DO SUL',
        31,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ENSINO UNIFICADO DO PIAUÍ (CEUPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ESTUDOS DE PESSOAL E FORTE DUQUE DE CAXIAS (CEP)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ESTUDOS EM DIREITO E NEGÓCIOS',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ESTUDOS SUPERIORES APRENDIZ (CESA)',
        32,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE ESTUDOS SUPERIORES DE JATAÍ',
        21,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE FORMAÇÃO, TREINAMENTO E APERFEIÇOAMENTO (CEFOR)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE INSTRUÇÃO DE AVIAÇÃO DO EXÉRCITO (CIAVEX)',
        33,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE INSTRUÇÃO DE GUERRA ELETRÔNICA (CIGE)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO DE MEDICINA ESPECIALIZADA, PESQUISA E ENSINO (CEMEPE)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO FEDERAL DE EDUCAÇÃO TECNOLÓGICA CELSO SUCKOW DA FONSECA (CEFET/RJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO FEDERAL DE EDUCAÇÃO TECNOLÓGICA DE MINAS GERAIS (CEFET/MG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO REGIONAL UNIVERSITÁRIO DE ESPÍRITO SANTO DO PINHAL (UNIPINHAL)',
        34,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO SUPERIOR DE ENSINO E PESQUISA DE MACHADO (CESEP)',
        35,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO SUPERIOR DE ESTUDOS JURÍDICOS CARLOS DRUMMOND DE ANDRADE (CSEJCDA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO TÉCNICO-EDUCACIONAL SUPERIOR DO OESTE PARANAENSE (CTESOP)',
        36,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSIÁRIO UNIFTC', 37, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ACADEMIA (UNIACADEMIA)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ADVENTISTA DE SÃO PAULO (UNASP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO AESO - BARROS MELO (UNIAESO)',
        39,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO AGES (UNIAGES)',
        40,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ALFREDO NASSER (UNIFAN)',
        41,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ÁLVARES PENTEADO (FECAP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ALVES FARIA (UNIALFA)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO AMPARENSE (UNIFIA)',
        43,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ANHANGÜERA (UNIFIAN)',
        44,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ANHANGUERA DE FORTALEZA (UNIPITÁGORAS)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ANHANGUERA DE MARABÁ',
        46,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ANHANGUERA DE SÃO PAULO',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS AMPLI',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS UNOPAR DE CAMPO GRANDE',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ANHANGUERA PITÁGORAS UNOPAR DE NITERÓI (UNIAN-RJ)',
        49,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ANTÔNIO EUFRÁSIO DE TOLEDO DE PRESIDENTE PRUDENTE - TOLEDO PRUDENTE (TOLEDO PRUDENTE)',
        50,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO APARÍCIO CARVALHO',
        51,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ARAGUAIA (UNIARAGUAIA)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ARMANDO ALVARES PENTEADO (FA-FAAP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ARNALDO HORÁCIO FERREIRA',
        52,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ARTHUR SÁ EARP NETO (UNIFASE)',
        53,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ASSIS GURGACZ (FAG)',
        54,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ASSUNÇÃO (UNIFAI)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ATENAS (UNIATENAS)',
        55,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO ATENEU', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO AUGUSTO MOTTA (UNISUAM)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO AUTÔNOMO DO BRASIL (UNIBRASIL)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITARIO AVANTIS (UNIAVAN)',
        57,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO BARÃO DE MAUÁ (CBM)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO BARRIGA VERDE (UNIBAVE)',
        59,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO BELAS ARTES DE SÃO PAULO (FEBASP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO BRASILEIRO (UNIBRA)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO BRASÍLIA DO ESTADO DE GOIÁS (UNIBRASÍLIA)',
        61,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO BRAZ CUBAS', 62, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CAMBURY (UNICAMBURY)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CAMPO LIMPO PAULISTA ( UNIFACCAMP)',
        63,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO CAMPO REAL', 64, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CAMPOS DE ANDRADE (UNIANDRADE)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CARLOS DRUMMOND DE ANDRADE (UNIDRUMMOND)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CASTELO BRANCO (UNICB)',
        65,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO CATHEDRAL', 66, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CATÓLICA DE QUIXADÁ (UNICATÓLICA)',
        67,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO - CATÓLICA DE SANTA CATARINA EM JARAGUÁ DO SUL (CATÓLICA EM JARAGUÁ )',
        31,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO - CATÓLICA DE SANTA CATARINA EM JOINVILLE (CATÓLICA EM JOINVILE)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CATÓLICA DO LESTE DE MINAS GERAIS (UNILESTE)',
        69,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CATÓLICA DO TOCANTINS (UNICATÓLICA)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CATÓLICO SALESIANO AUXILIUM (UNISALESIANO)',
        70,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CELSO LISBOA (UCL)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CENECISTA DE OSÓRIO (UNICNEC)',
        71,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CENTRAL PAULISTA (UNICEP)',
        72,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CESMAC (CESMAC)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO CESUCA', 74, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CEUNI - FAMETRO (FAMETRO)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CHRISTUS (UNICHRISTUS)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CIDADE VERDE (UNICV)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CNEC DE BENTO GONÇALVES',
        77,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO CURITIBA (UNICURITIBA)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA AMAZÔNIA (UNAMA)',
        78,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA AMAZÔNIA (UNIESAMAZ)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL DE BARRETOS (UNIFEB)',
        80,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL GUAXUPÉ (UNIFEG)',
        81,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO EDUCACIONAL INACIANA PE SABÓIA DE MEDEIROS (FEI)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA FUNDAÇÃO HERMINIO OMETTO (FHO)',
        83,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA GRANDE DOURADOS (UNIGRAN)',
        84,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA GRANDE FORTALEZA (UNIGRANDE)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA INDÚSTRIA (UNINDUS)',
        85,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA REGIÃO DA CAMPANHA',
        86,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DAS AMÉRICAS (CAM)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA SERRA GAÚCHA (FSG)',
        87,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DAS FACULDADES ASSOCIADAS DE ENSINO - FAE (UNIFAE)',
        88,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DAS FACULDADES INTEGRADAS DE OURINHOS (UNIFIO)',
        89,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DAS FACULDADES METROPOLITANAS UNIDAS (FMU)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DA VITÓRIA DE SANTO ANTÃO (UNIVISA)',
        90,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE ADAMANTINA (FAI)',
        91,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE ARARAS - (UNAR)',
        83,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE BARRA MANSA (UBM)',
        92,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO DE BAURU', 93, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE BELO HORIZONTE (UNI-BH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE BRASÍLIA (UNICEUB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE BRUSQUE (UNIFEBE)',
        94,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE CARATINGA (UNEC)',
        95,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE CIÊNCIAS E EMPREENDEDORISMO (UNIFACEMP)',
        96,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE CIÊNCIAS E TECNOLOGIA DO MARANHÃO (UNIFACEMA)',
        97,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE DESENVOLVIMENTO DO CENTRO OESTE (UNIDESC)',
        98,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE ENSINO, CIÊNCIA E TECNOLOGIA DO PARANÁ (UNIENSINO)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE ENSINO SUPERIOR DO AMAZONAS (CIESA)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE EXCELÊNCIA (UNEX)',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE EXCELÊNCIA ENIAC (ENIAC)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE FORMIGA (UNIFORMG)',
        101,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE GOIÂNIA (UNICEUG)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE GOIÁS (UNIGOIÁS)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE GOIATUBA (UNICERRADO)',
        102,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE ITAJUBÁ (FEPI)',
        103,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE ITAPIRA UNIESI (UNIESI)',
        104,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE JAGUARIÚNA (UNIFAJ)',
        105,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE JALES (UNIJALES)',
        106,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE JOÃO PESSOA (UNIPÊ)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE LAVRAS (UNILAVRAS)',
        108,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE LINS (UNILINS)',
        70,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE MINEIROS (UNIFIMES)',
        109,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE PATO BRANCO (UNIDEP)',
        110,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE PATOS (UNIFIP)',
        111,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE PATOS DE MINAS (UNIPAM)',
        112,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE PAULÍNIA (UNIFACP)',
        113,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE RIO PRETO (UNIRP)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE RONDÔNIA (UNESC)',
        115,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE SALVADOR (UNICEUSA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE SANTA FÉ DO SUL (UNIFUNEC)',
        117,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE SETE LAGOAS (UNIFEMM)',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE TALENTOS HUMANOS (UNIFACTHUS)',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE TECNOLOGIA CARLOS DRUMMOND DE ANDRADE',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE TECNOLOGIA DE CURITIBA (UNIFATEC)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE TECNOLOGIA E NEGÓCIOS CARLOS DRUMMOND DE ANDRADE (UNITEN CDA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE UNIÃO DA VITÓRIA (UNIUV)',
        119,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE VALENÇA (UNIFAA)',
        120,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE VÁRZEA GRANDE (UNIVAG)',
        121,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE VIÇOSA (UNIVIÇOSA)',
        122,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE VOLTA REDONDA (UNIFOA)',
        123,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DE VOTUPORANGA (UNIFEV)',
        10,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DINÂMICA DAS CATARATAS (UDC)',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO CERRADO-PATROCÍNIO (UNICERP)',
        125,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DOCTUM DE TEÓFILO OTONI (UNIDOCTUM)',
        7,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO DISTRITO FEDERAL (UDF)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO ESPÍRITO SANTO (UNESC)',
        65,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO ESTADO DO PARÁ (CESUPA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO INSTITUTO DE EDUCAÇÃO SUPERIOR DE BRASÍLIA - IESB (IESB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO INSTITUTO MAUÁ DE TECNOLOGIA (CEUN-IMT)',
        126,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DOM BOSCO DO RIO DE JANEIRO (UNIDOMBOSCO-RJ)',
        4,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DOM PEDRO II (UNIDOMPEDRO)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DON DOMÊNICO (UNIDON)',
        127,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO NORTE (UNINORTE)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO NORTE DE MINAS (UNINORTE MINAS)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO NORTE DE SÃO PAULO (UNORTE)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO PARANÁ (UNIPA)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO PIAUÍ (UNIFAPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO PLANALTO CENTRAL APPARECIDO DOS SANTOS (UNICEPLAC)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO PLANALTO DE ARAXÁ (UNIARAXÁ)',
        129,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITARIO DO RECIFE (UNIPESU)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO RIO DE JANEIRO (UNIRJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO RIO GRANDE DO NORTE (UNI-RN)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO RIO SÃO FRANCISCO UNIRIOS (UNIRIOS)',
        131,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DOS GUARARAPES (UNIFG)',
        132,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO SUDESTE MINEIRO (UNICSUM)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO SUL DE MINAS (UNIS-MG)',
        133,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO TRIÂNGULO (UNITRI)',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DOUTOR LEÃO SAMPAIO (UNILEÃO)',
        135,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO VALE DO ARAGUAIA (UNIVAR)',
        66,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO VALE DO JAGUARIBE (UNIJAGUARIBE)',
        136,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO DO VALE DO RIBEIRA (UNIVR)',
        137,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESPÍRITO-SANTENSE/FAESA',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DA AMAZÔNIA (ESTÁCIO AMAZÔNIA)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DA BAHIA (ESTÁCIO BAHIA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE BELO HORIZONTE - ESTÁCIO BH (ESTÁCIO BH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE BRASÍLIA - ESTÁCIO BRASÍLIA (ESTÁCIO BRASÍLIA)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE GOIÁS (ESTÁCIO GOIÁS)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE JI-PARANÁ (ESTÁCIO UNIJIPA)',
        139,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE RIBEIRÃO PRETO (ESTÁCIO RIBEIRÃO PRE)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE SANTA CATARINA - ESTÁCIO SANTA CATARINA',
        140,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE SÃO LUÍS',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE SÃO PAULO (ESTÁCIO SÃO PAULO)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DE SERGIPE',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DO CEARÁ (ESTÁCIO CEARÁ)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO DO RECIFE',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO JUIZ DE FORA - ESTÁCIO JUIZ DE FORA',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ESTÁCIO META DE RIO BRANCO ESTÁCIO (UNIMETA)',
        143,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO ETEP', 144, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO EURÍPEDES DE MARÍLIA (UNIVEM)',
        145,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO EURO-AMERICANO (UNIEURO)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FACENS (UNIFACENS)',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FACEX (UNIFACEX)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FACID WYDEN (UNIFACID WYDEN)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FACISA (UNIFACISA)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FACOL (UNIFACOL)',
        90,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FACUNICAMPS (FACUNICAMPS)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FACVEST (UNIFACVEST)',
        148,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FADERGS (FADERGS)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FAEL (UNIFAEL)',
        150,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FAEMA (UNIFAEMA)',
        151,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO FAESA', 25, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO FAI', 152, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FAMEC (UNIFAMEC)',
        153,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FAMETRO ( UNIFAMETRO)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FAMINAS (UNIFAMINAS)',
        154,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FANOR WYDEN (UNIFANOR WYDEN)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FARIAS BRITO',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO FASIPE', 155, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FAVENI (UNIFAVENI)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FAVIP WYDEN (UNIFAVIP WYDEN)',
        156,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FBV WYDEN (UNIFBV WYDEN)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO FG (UNIFG)', 157, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FIBRA (UNIFIBRA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FIEO (UNIFIEO)',
        158,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FILADÉLFIA (UNIFIL)',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FIP-MOC (UNIFIPMOC)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FLUMINENSE (UNIFLU)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FMABC (FMABC)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FUNCESI (UNIFUNCESI)',
        161,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FUNDAÇÃO DE ENSINO OCTÁVIO BASTOS - FEOB (UNIFEOB)',
        88,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FUNDAÇÃO SANTO ANDRÉ (CUFSA)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FUNORTE (UNIFUNORTE)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO FUNVIC (UNIFUNVIC)',
        162,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO GAMA E SOUZA',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO GERALDO DI BIASE (UGB)',
        123,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO GOVERNADOR OZANAM COELHO (UNIFAGOC)',
        163,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO GOYAZES (UNIGOYAZES)',
        164,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO GUAIRACÁ (UNIGUAIRACÁ)',
        64,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO IBMEC (IBMEC)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO IBMR', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ICESP (UNICESP)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO IDEAU (UNIDEAU)',
        165,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO IMEPAC - ARAGUARI',
        166,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO INGÁ (UNINGÁ)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO INTA (UNINTA)',
        167,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO INTEGRADO DE CAMPO MOURÃO',
        168,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO INTERNACIONAL (UNINTER)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO INTERNACIONAL SIGNORELLI (UNISIGNORELLI)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ÍTALO-BRASILEIRO (UNIÍTALO)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO ITOP (UNITOP)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO JOAQUIM NABUCO DE RECIFE (UNINABUCO RECIFE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO JORGE AMADO (UNIJORGE)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO LA SALLE (UNILASALLE - LUCAS)',
        169,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO LA SALLE DO RIO DE JANEIRO (UNILASALLE/RJ)',
        49,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO LEONARDO DA VINCI (UNIASSELVI)',
        170,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO LS (UNILS)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO LUSÍADA (UNILUS)',
        171,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO LUTERANO DE MANAUS (CEULM/ULBRA)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO LUTERANO DE PALMAS (CEULP)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO LUTERANO DE SANTARÉM (CEULS)',
        78,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MARIA MILZA (UNIMAM)',
        172,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MÁRIO PALMÉRIO (UNIFUCAMP)',
        173,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO MATER DEI', 110, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAUÁ DE BRASÍLIA (UNIMAUÁ)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU (UNINASSAU)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU ALIANÇA (UNINASSAU ALIANÇA)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURICIO DE NASSAU DE ARACAJU',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE BARREIRAS (UNINASSAU)',
        174,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE BELÉM',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CACOAL (UNINASSAU)',
        115,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CAMPINA GRANDE (UNINASSAU CPV)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE CARUARU (UNINASSAU CARUARU)',
        156,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE FORTALEZA (UNINASSAU FORTALEZA)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE JOÃO PESSOA',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE JUAZEIRO DO NORTE (UNINASSAU)',
        135,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE MACEIÓ (UNINASSAUMACEI?)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE NATAL (UNINASSAU)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE SALVADOR (UNINASSAU SALVADOR)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE SÃO LUÍS (UNINASSAU)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DE TERESINA',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU DO RIO DE JANEIRO (UNINASSAU)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE NASSAU PAULISTA (UNINASSAU PAULISTA)',
        175,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAURÍCIO DE UNINASSAU DE PARNAÍBA (UNINASSAU PARNAÍBA)',
        176,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MAX PLANCK (UNIMAX)',
        11,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO METODISTA (IPA)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO METODISTA IZABELA HENDRIX (CEUNIH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO METROCAMP WYDEN (UNIMETROCAMP WYDEN)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO METROPOLITANO DA AMAZÔNIA (UNIFAMAZ)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO METROPOLITANO DE MARINGÁ (UNIFAMMA)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO METROPOLITANO DE SÃO PAULO (UNIMESP)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MÓDULO (MÓDULO)',
        178,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MOURA LACERDA (CUML)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MULTIVIX VITÓRIA',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MUNICIPAL DE FRANCA (UNI-FACEF)',
        179,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO MUNICIPAL DE SÃO JOSÉ (USJ)',
        140,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO NATALENSE (UNICEUNA)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO NEWTON PAIVA (NEWTON PAIVA)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO NOBRE DE FEIRA DE SANTANA',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO NOSSA SENHORA APARECIDA (UNIFANAP)',
        41,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO NOSSA SENHORA DO PATROCÍNIO (CEUNSP)',
        180,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO OPET (UNIOPET)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PADRE ALBINO',
        181,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PADRE ANCHIETA (UNIANCHIETA)',
        182,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO PARAÍSO', 135, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PARA O DESENVOLVIMENTO DO ALTO VALE DO ITAJAÍ (UNIDAVI)',
        183,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PAULISTANA (UNIPAULISTANA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PIAGET (UNIPIAGET)',
        184,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PLANALTO DO DISTRITO FEDERAL - UNIPLAN (UNIPLAN)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PRESIDENTE ANTÔNIO CARLOS (UNIPAC)',
        32,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PRESIDENTE TANCREDO DE ALMEIDA NEVES (UNIPTAN)',
        185,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO PROCESSUS (UNIPROCESSUS)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITARIO PROJEÇÃO (UNIPROJEÇÃO)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO REDENTOR (FACREDENTOR)',
        186,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO RITTER DOS REIS (UNIRITTER)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO RUY BARBOSA WYDEN (UNIRUY WYDEN)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SAGRADO CORAÇÃO (UNISAGRADO)',
        93,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SALESIANO (UNISALES)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SALESIANO DE SÃO PAULO (UNISAL)',
        187,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SANTA AMÉLIA (SECAL)',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SANTA CECÍLIA (UNICEA)',
        162,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SANTA CRUZ DE CURITIBA (UNI SANTA CRUZ)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SANTA MARIA (UNIFSM)',
        189,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SANTA MARIA DA GLÓRIA (UNISMG)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SANT''ANNA (UNISANT''ANNA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SANTA RITA (UNIFASAR)',
        18,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SANTO AGOSTINHO (UNIFSA)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO CAMILO (SAO CAMILO)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO CAMILO - ESPÍRITO SANTO (SÃO CAMILO-ES)',
        190,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO JOSÉ (UNISJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO JOSÉ DE ITAPERUNA',
        186,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO JUDAS TADEU (CSJT)',
        171,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO LUCAS JI-PARANÁ (UNISL)',
        139,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO LUCAS PORTO VELHO (SÃO LUCAS PVH)',
        51,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO MIGUEL (UNISÃOMIGUEL)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SÃO ROQUE (UNISÃO ROQUE)',
        191,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SATC (UNISATC)',
        192,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO SENAC (RS)', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SENAC (SENACSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SENAI BLUMENAU',
        193,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SENAI CIMATEC (SENAI CIMATEC)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SERRA DOS ÓRGÃOS (UNIFESO)',
        194,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SETE DE SETEMBRO (UNI7)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SOCIAL DA BAHIA (UNISBA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO SOCIESC', 68, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SOCIESC DE BLUMENAU',
        193,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SUDOESTE PAULISTA (UNIFSP)',
        195,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO SUL-AMERICANA (UNIFASAM)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO SUMARÉ', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO TABOSA DE ALMEIDA (ASCES-UNITA)',
        156,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO TERESA D''ÁVILA (FATEA)',
        22,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO TIRADENTES (UNIT)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO TIRADENTES DE PERNAMBUCO (UNIT PE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO TOCANTINENSE PRESIDENTE ANTÔNIO CARLOS (UNITPAC)',
        196,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO TOLEDO WYDEN (UNITOLEDO WYDEN)',
        197,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UFBRA (UFBRA)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNA (UNA)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNA DE BETIM',
        198,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNA DE BOM DESPACHO (UNA)',
        199,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNA DE CONTAGEM',
        200,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNA DE UBERLÂNDIA',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIÃO DAS AMÉRICAS DESCOMPLICA (UNIAMÉRICA )',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIASSELVI DE BLUMENAU',
        193,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIASSELVI DE BRUSQUE',
        94,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIASSELVI DE GUARAMIRIM',
        201,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNI-BAN (UNI-BAN)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIBRAS DO SUDOESTE GOIANO (UNIBRAS)',
        202,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIBTA', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIC', 203, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNICARIOCA (UNICARIOCA)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNICURITIBA (UNICURITIBA)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIDADE DE ENSINO SUPERIOR DOM BOSCO (UNDB)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIDOM - BOSCO (UNIDOM - BOSCO)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO - UNIESP (UNIESP)',
        204,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIFAAT (UNIFAAT)',
        205,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIFACEAR', 206, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIFACIG', 207, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIFAFIBE (FAFIBE)',
        208,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIFAS', 209, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIFATEB', 210, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIFATECIE (UNIFATECIE)',
        211,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIFECAF', 212, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIFTC', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIFTC SALVADOR',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIFTEC', 87, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIFTEC BENTO GONÇALVES',
        77,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIGRAN CAPITAL',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIHORIZONTES',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNINORTE', 143, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNINOVAFAPI (UNINOVAFAPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNINOVO (UNINOVO)',
        39,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIRB (UNIRB)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIRB - ALAGOINHAS',
        213,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNISAN (UNISAN)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNISEP (CEUUN)',
        214,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIVEL', 54, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITARIO UNIVERSO BELO HORIZONTE',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIVERSO GOIÂNIA',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIVERSO JUIZ DE FORA',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIVERSO RECIFE',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO UNIVERSO SALVADOR',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO UNIVINTE', 215, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CENTRO UNIVERSITÁRIO U:VERSE', 143, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO VALE DO CRICARÉ (UNIVC)',
        216,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO VALE DO RIO VERDE',
        217,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO VALE DO SALGADO',
        218,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CENTRO UNIVERSITÁRIO VÉRTICE (UNIVÉRTIX)',
        219,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('CESREI FACULDADE', 147, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CHRISTUS FACULDADE DO PIAUÍ (CHRISFAPI)',
        220,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CISNE - FACULDADE DE QUIXADÁ (CFQ)',
        67,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CISNE - FACULDADE TECNOLÓGICA DE QUIXADÁ (CFTQ)',
        67,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CLARETIANO - CENTRO UNIVERSITÁRIO (CLARETIANOBT)',
        221,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CLARETIANO - CENTRO UNIVERSITÁRIO',
        222,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CLARETIANO - FACULDADE DE BOA VISTA (CLARETIANOBV)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('COLÉGIO PEDRO II (CP II)', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'COMPLEXO DE ENSINO SUPERIOR DE PALMAS (CESUP)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'CONSERVATÓRIO BRASILEIRO DE MÚSICA - CENTRO UNIVERSITÁRIO BRASILEIRO DE EDUCAÇÃO (CBM-UNICBE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'DIRETORIA DE FORMAÇÃO E DESENVOLVIMENTO PROFISSIONAL (FUNDAJ)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'EJ - FACULDADE DE TECNOLOGIA EM AVIAÇÃO CIVIL (EJ)',
        223,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ENSINO SUPERIOR ALBERT SABIN JK (ESAS JK)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'EPGE ESCOLA BRASILEIRA DE ECONOMIA E FINANÇAS (FGV EPGE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA BAHIANA DE MEDICINA E SAÚDE PÚBLICA (EBMSP)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA BRASILEIRA DE ADMINISTRAÇÃO PÚBLICA E DE EMPRESAS (EBAPE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA BRASILEIRA DE MEDICINA CHINESA (EBRAMEC)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DA ADVOCACIA-GERAL DA UNIÃO (EAGU)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DA CIDADE - FACULDADE DE ARQUITETURA E URBANISMO (ESCOLA DA CIDADE)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ADMINISTRAÇÃO DE EMPRESAS DE SÃO PAULO - FGV EAESP (FGV-EAESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ADMINISTRAÇÃO E NEGÓCIOS (ESAD)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ADMINISTRAÇÃO FAZENDÁRIA (ESAF)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE APERFEIÇOAMENTO DE OFICIAIS (ESAO)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ARTILHARIA DE COSTA E ANTIAÉREA (ESCOSAAE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE CIÊNCIAS SOCIAIS FGV CPDOC (FGV CPDOC)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE COMANDO E ESTADO-MAIOR DO EXÉRCITO (ECEME)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE COMUNICAÇÃO, MÍDIA E INFORMAÇÃO DA FUNDAÇÃO GETULIO VARGAS (FGV ECMI)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ESCOLA DE COMUNICAÇÕES (ESCOM)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE CONTAS E CAPACITAÇÃO PROFESSOR PEDRO ALEIXO',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE DIREITO DE SÃO PAULO - FGV DIREITO SP (FGV DIREITO SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE DIREITO DO RIO DE JANEIRO (DIREITO RIO)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE DIREITO FUCAPE (FUCAPE DIREITO)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ECONOMIA DE SÃO PAULO (EESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE EDUCAÇÃO FÍSICA DO EXÉRCITO (ESEFEX)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE EDUCAÇÃO PERMANENTE (EEP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ENFERMAGEM DA FUNDAÇÃO TÉCNICO EDUCACIONAL SOUZA MARQUES (EEFTESM)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ENGENHARIA DE PIRACICABA (EEP/FUMEP)',
        224,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ENGENHARIA KENNEDY (EEK)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ENSINO SUPERIOR DA FIPE (FIPEEES)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE ENSINO SUPERIOR DO AGRESTE PARAIBANO (EESAP)',
        225,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE EQUITAÇÃO DO EXÉRCITO (ESEQEX)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE GOVERNO PROFESSOR PAULO NEVES DE CARVALHO (EG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE INSTRUÇÃO ESPECIALIZADA (ESIE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE INTELIGÊNCIA - ESINT/ABIN (ESINT/ABIN)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE INTELIGÊNCIA MILITAR DO EXÉRCITO (ESIMEX)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE MATEMÁTICA APLICADA (EMAP-FGV)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE MEDICINA SOUZA MARQUES DA FUNDAÇÃO TÉCNICO-EDUCACIONAL SOUZA MARQUES (EMSM)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE POLÍTICAS PÚBLICAS E GOVERNO DA FUNDAÇÃO GETULIO VARGAS (FGV EPPG)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE SARGENTOS DAS ARMAS (ESA)',
        217,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE SARGENTOS DE LOGÍSTICA (ESSLOG)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DE SOCIOLOGIA E POLÍTICA DE SÃO PAULO (ESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA DIEESE DE CIÊNCIAS DO TRABALHO (DIEESE)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA MUNICIPAL DE GESTÃO DO LEGISLATIVO (EMUGLE)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA NACIONAL DE ADMINISTRAÇÃO PÚBLICA (ENAP)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA NACIONAL DE CIÊNCIAS ESTATÍSTICAS (ENCE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SAÚDE PÚBLICA - ESPMT (ESPMT)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR ABERTA DO BRASIL (ESAB)',
        226,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR ASSOCIADA DE GOIÂNIA (ESUP)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR BATISTA DO AMAZONAS (ESBAM)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DA AMAZÔNIA DE ABAETETUBA (ESAMAZ)',
        227,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE AGRONOMIA DE PARAGUAÇU PAULISTA (ESAPP)',
        228,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE ARTES CÉLIA HELENA',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE AVIAÇÃO CIVIL (ESAC)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ESCOLA SUPERIOR DE CATALÃO', 17, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE CIÊNCIAS DA SANTA CASA DE MISERICÓRDIA DE VITÓRIA (EMESCAM)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE CIÊNCIAS DA SAÚDE (ESCS)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE CRICIÚMA - ESUCRI (ESUCRI)',
        192,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE CRUZEIRO "PREFEITO HAMILTON VIEIRA MENDES" (ESEFIC)',
        229,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE EDUCAÇÃO (ESJUS)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE EDUCAÇÃO CORPORATIVA (ESEC)',
        140,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE EDUCAÇÃO E NEGÓCIOS (ESN)',
        145,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE EDUCAÇÃO FÍSICA DE JUNDIAÍ (ESEFJ)',
        182,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE ENGENHARIA E GESTÃO DE SÃO PAULO - ESEG (ESEG)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE ENSINO HELENA ANTIPOFF (ESEHA)',
        49,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ESCOLA SUPERIOR DE GESTÃO (ESGE)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE GESTÃO COMERCIAL E MARKETING (ESIC)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ESCOLA SUPERIOR DE ITABIRA', 161, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE MARKETING (ESM)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ESCOLA SUPERIOR DE POUSO ALEGRE', 230, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING (ESPM)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING DE PORTO ALEGRE (ESPM - POA)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE PROPAGANDA E MARKETING DO RIO DE JANEIRO (ESPM)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE SAÚDE DE ARCOVERDE (ESSA)',
        15,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE TECNOLOGIA & GESTÃO DE SANTA CATARINA (EST&G)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DE TEOLOGIA E ESPIRITUALIDADE FRANCISCANA (ESTEF)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ESCOLA SUPERIOR DO AR (EAR)', 100, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DOM HELDER CÂMARA (ESDHC)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO (ESCOLAMP)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO DA UNIÃO (ESMPU)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR DO SUL DE SANTA CATARINA',
        192,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR EM MEIO AMBIENTE (ESMA)',
        231,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR MADRE CELESTE (ESMAC)',
        232,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR NACIONAL DE SEGUROS (ESNS)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR NACIONAL DE SEGUROS DE SÃO PAULO (ESNS-SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR SÃO FRANCISCO DE ASSIS (ESFA)',
        233,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR SÃO JUDAS DE GUARULHOS',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR SÃO JUDAS DE SÃO BERNARDO DO CAMPO',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR UNA DE CONSELHEIRO LAFAIETE',
        18,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESCOLA SUPERIOR UNA DE ITUMBIARA',
        234,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ESTÁCIO FATERN - FACULDADE ESTÁCIO DO RIO GRANDE DO NORTE (ESTÁCIO FATERN)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACITEN - FACULDADE DE CIÊNCIAS E TECNOLOGIAS DE NATAL (FACITEN)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACUDADE IEDUCARE - FIED (FIED)', 235, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACUDADE UNINEVES', 107, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE 05 DE JULHO (F5)', 167, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE 2001', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE 28 DE AGOSTO DE ENSINO E PESQUISA (28 DE AGOSTO)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ABC DE GOIÂNIA (FABC)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ABERTA DO TOCANTINS (FAT)',
        236,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ABRANGE ABC (FABRANGE)', 82, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ADELINA MOURA - FAADEMA (FAADEMA)',
        237,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ADELMAR ROSADO (FAR)', 27, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ADJETIVO CETEP (ADJETIVO-CETEP)',
        238,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ADVENTISTA DA AMAZÔNIA (FAAMA)',
        239,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ADVENTISTA DA BAHIA (FADBA)',
        240,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ADVENTISTA DO PARANÁ (FAP)',
        241,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE AFONSO MAFRENSE (FAM)', 242, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ÁGAPE DE SÃO FÉLIX', 243, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AGES DE JACOBINA (FACULDADE AGES)',
        244,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AGES DE MEDICINA (FACULDADE AGES)',
        244,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AGES DE MEDICINA DE IRECÊ (FACULDADE AGES)',
        245,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AGES DE SENHOR DO BONFIM (FACULDADE AGES)',
        246,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AGES DE TUCANO (FACULDADE AGES)',
        247,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ÁGORA - ADMINISTRAÇÃO, EDUCAÇÃO E CULTURA (FAAEC)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ÁGORA - FAG (FAG)', 248, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE AIEC (AIEC / FAAB)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE AJES (AJES)', 6, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALAGOANA DE ADMINISTRAÇÃO (FAA)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALBERT EINSTEIN (FALBE)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALDETE MARIA ALVES (FAMA)',
        249,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALFA AMÉRICA', 250, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALFA DE TEÓFILO OTONI (ALFA)',
        7,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALFA UMUARAMA (ALFA)', 251, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALFAUNIPAC DE ALMENARA',
        252,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALFAUNIPAC DE ARAÇUAÍ', 253, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALFAUNIPAC DE CAPELINHA',
        254,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALFAUNIPAC DE GUANHÃES',
        255,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALFREDO NASSER DE CASA NOVA (FAN)',
        256,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALFREDO NASSER DE PONTALINA',
        257,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALFREDO NASSER DE REMANSO',
        258,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALIANÇA DE ITABERAI', 259, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALIANÇA DO MARANHÃO (FAMAR)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALIANÇA EDUCACIONAL DO ESTADO DE SÃO PAULO',
        260,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALIS DE ITABIRITO', 261, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ALMEIDA RODRIGUES (FAR)',
        202,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALPHA (ALPHA)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALPHAVILLE (FAVI)', 158, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALURA.TECH (ALURA.TECH)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ÁLVARES DE AZEVEDO (FAATESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ALVES LIMA (FAAL)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE AMADEUS (FAMA)', 142, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE AMAZONAS', 262, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE AMÉRICA (AMÉRICA)', 190, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AMERICAS INTERNATIONAL COLLEGE (FAMG)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANA CAROLINA PUGA (FAPUGA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANASPS (FANASPS)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANCHIETA DO RECIFE (FAR)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANCLIVEPA (ANCLIVEPA)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANCLIVEPA BRASÍLIA', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANCLIVEPA DE GESTÃO E HUMANOLOGIA (FAGH)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANCLIVEPA DE NATAL', 130, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANCLIVEPA SÃO PAULO (ANCLIVEPA SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANDREOTTI DE MARINGÁ (FAM)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANGEL VIANNA (FAV)', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE ALAGOINHAS (FPA)',
        213,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE ALVORADA',
        263,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE ANÁPOLIS',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGÜERA DE BAURU', 93, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE BELO HORIZONTE',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE BETIM', 198, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE BRASÍLIA (ANHANGUERA DF)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE CACHOEIRO DE ITAPEMIRIM',
        190,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE CAMAÇARI',
        153,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGÜERA DE CAMPINAS',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE CARUARU', 156, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE CASCAVEL', 54, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE CATANDUVA (FAC)',
        181,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE CAXIAS DO SUL',
        87,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE CIÊNCIAS JURÍDICAS, GERENCIAIS E EDUCAÇÃO DE SINOP',
        155,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE CIÊNCIAS SOCIAIS APLICADAS DE SINOP (FACISAS)',
        155,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE CONTAGEM',
        200,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE DIVINÓPOLIS',
        19,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGÜERA DE DOURADOS', 84, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE FEIRA DE SANTANA',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE GOIÂNIA', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE GOVERNADOR VALADARES',
        265,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE GUARAPARI',
        266,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE GUARULHOS',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE IMPERATRIZ',
        267,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE INDAIATUBA',
        11,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE IPATINGA',
        268,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE ITABUNA', 269, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE ITAPECERICA DA SERRA',
        270,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE ITAPETININGA',
        271,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE ITAPEVA (FAI)',
        272,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE JACAREÍ', 273, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE JAÚ (FAJ)',
        274,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE JEQUIÉ (FPJ)',
        275,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE JOINVILLE',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE JUAZEIRO DO NORTE',
        135,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE JUNDIAÍ', 182, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE LIMEIRA', 276, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE LINHARES',
        277,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE MACAPÁ', 26, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE MACEIÓ', 73, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE MARABÁ', 46, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE MATÃO', 278, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE MOGI GUAÇU (FAMG)',
        279,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE OSASCO', 158, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE PALMAS', 23, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE PARAGOMINAS (FPP)',
        280,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE PARAUAPEBAS',
        281,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE PASSO FUNDO',
        282,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE PELOTAS', 283, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE PINDAMONHANGABA',
        162,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGÜERA DE PIRACICABA',
        224,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE POÇOS DE CALDAS',
        284,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE PONTA GROSSA',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE PORTO ALEGRE',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE PRIMAVERA DO LESTE (FIPL)',
        285,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE RIBEIRÃO DAS NEVES',
        286,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGÜERA DE RIBEIRÃO PRETO',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE RIO BRANCO',
        143,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE RIO CLARO',
        222,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE RONDONÓPOLIS (FAR)',
        287,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SANTA BÁRBARA',
        288,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SANTO ANTÔNIO DE JESUS',
        96,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SÃO BERNARDO',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SÃO JOÃO DE MERITI',
        289,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGÜERA DE SÃO JOSÉ',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SÃO JOSÉ DO RIO PRETO (FASJRP)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SÃO JOSÉ-SC (FASJ-SC)',
        140,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SÃO LUIZ',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SERRA (FPS)',
        290,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SERTÃOZINHO (FASERT)',
        291,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE SOBRAL', 167, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGÜERA DE SOROCABA (FSO)',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE SORRISO', 292, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE SUMARÉ (FACSUMARÉ)',
        293,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE TABOÃO DA SERRA (FATS)',
        212,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE TANGARÁ DA SERRA (FITS)',
        294,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DE TAUBATÉ', 33, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE TECNOLOGIA DE BELO HORIZONTE',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE TECNOLOGIA DE JUNDIAÍ',
        182,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE TEIXEIRA DE FREITAS',
        295,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE UBERLÂNDIA',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE VALINHOS',
        296,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE VALPARAÍSO',
        297,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DE VITÓRIA DA CONQUISTA',
        37,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DO AMAZONAS', 75, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA DO CEARÁ', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DO MARANHÃO',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA DO RIO GRANDE',
        298,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA FRANCA (FAF)',
        179,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ANHANGUERA ITABIRA', 161, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA JARAGUÁ DO SUL',
        31,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA PITÁGORAS DE JUNDIAÍ',
        182,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA PITÁGORAS VOTORANTIM (-)',
        299,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA UNIDADE GUARAPARI',
        266,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA UNIDADE PARAGOMINAS',
        280,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA UNIDADE PARAUAPEBAS',
        281,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANHANGUERA UNIME DE SALVADOR',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANÍSIO TEIXEIRA DE FEIRA DE SANTANA (FAT)',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ANTÔNIO MENEGHETTI (AMF)',
        300,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE APOGEU (APOGEU)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ÁREA1 WYDEN (ÁREA1 WYDEN)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ARIANO SUASSUNA - UNIVAS',
        262,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ARI DE SÁ (FAS)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ARNALDO JANSSEN (FAJANSSEN)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ARQUIDIOCESANA DE CURVELO (FAC)',
        301,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ARQUIDIOCESANA DE PIRAPORA (FAP)',
        302,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ASA DE BRUMADINHO (IECEMB - FAB)',
        303,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ASSEMBLEIANA DO BRASIL', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ASSIS GURGACZ (FAG TOLEDO)',
        304,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ASSOCIADA BRASIL (FAB)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ASSOCIADA BRASIL - EAD', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ASTORGA (FAAST)', 305, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATAME (ATAME)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ATENAS CENTRO DE MATO GROSSO',
        292,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATENAS CENTRO DE MINAS', 24, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATENAS DO SUL BAIANO', 306, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATENAS PASSOS', 307, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATENAS PORTO SEGURO', 308, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATENAS SETE LAGOAS', 24, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATENAS SORRISO', 292, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATENAS SUL DE MINAS', 307, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATENAS VALENÇA', 306, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ATITUDE DE EDUCAÇÃO CONTINUADA (FAEC)',
        309,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATTICUS', 124, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ATUALIZA (ATUALIZA)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AUDEN EDUCACIONAL (FAED)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AUTÔNOMA DE DIREITO (FADISP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE AUTÔNOMA DO BRASIL - MACEIÓ (FBR MACEIÓ)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BAHIANA DE ENGENHARIA E CIÊNCIAS SOCIAIS APLICADAS (FBE)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BAIANA DE DIREITO E GESTÃO',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BAIANA DO SENHOR DO BONFIM (FABASB)',
        246,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BARÃO DE JEQUIRIÇA (FBJ DIGITAL)',
        306,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BARDDAL DE ARTES APLICADAS',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BARRETOS (FB)', 80, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BARROS MELO RECIFE (UNIAESO)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BATISTA BRASILEIRA (FBB)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BATISTA DE MINAS GERAIS (FBMG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BATISTA DO CARIRI (FBC)',
        310,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BATISTA DO ESTADO DO RIO DE JANEIRO - FABERJ (FABERJ )',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BATISTA DO RIO DE JANEIRO (FABAT)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BATISTA PIONEIRA', 311, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BELA VISTA (FBV)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BEM TE VI LTDA (FAC-BTV)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BERTIOGA (FABE)', 312, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BEZERRA DE ARAÚJO (FABA)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BILAC DE SÃO JOSÉ DOS CAMPOS (BILAC)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BIOPARK', 304, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BIOPARK II (BIOPARK II)',
        304,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BIRIGUI (FABI)', 313, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BOA ESPERANÇA (FABECA)',
        314,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BOAS NOVAS DE CIÊNCIAS TEOLÓGICAS, SOCIAIS E BIOTECNOLÓGICAS (FBNCTSB)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BOOKPLAY', 10, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BORGES DE MENDONÇA (FBM)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA CRISTÃ (FBC)',
        290,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DE CACHOEIRO',
        190,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DE EDUCAÇÃO E CULTURA (FABEC BRASIL)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DE ENSINO, PESQUISA E EXTENSÃO (FABEX)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DE ESTUDOS AVANÇADOS (FABEA)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DE INOVAÇÃO (FABIN)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DE NEGÓCIOS INOVADORES (FABRANI)',
        315,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DE TECNOLOGIA (FBT)',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DE TRIBUTAÇÃO (FBT)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DIGITAL (FABRADI)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASILEIRA DO RECÔNCAVO (FBBR)',
        172,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE BRASIL EMPREENDER (FABEMP)',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BRASÍLIA (FBR)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BRASIL NORTE (FABRAN)', 26, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BRAVIUM (BRAVIUM)', 297, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE BSSP', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CALAFIORI (CALAFIORI)', 316, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CAL DE ARTES CÊNICAS (FACULDADE CAL)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CAMAQÜENSE DE CIÊNCIAS CONTÁBEIS E ADMINISTRATIVAS (FACCCA)',
        317,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CAMPOS BELOS (UNICAMPO)',
        318,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CAMPOS ELÍSEOS (FCE)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CANADENSES NO BRASIL', 65, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CANÇÃO NOVA (FCN)', 319, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CÂNDIDO RONDON (FCR)', 203, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CAPACITAR', 86, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CASA BRANCA (FACAB)', 320, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CASA DO ESTUDANTE (FACE)',
        321,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CÁSPER LÍBERO (FCL)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CASTRO ALVES (FCA)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CATHEDRAL (FACES)', 138, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA CAVANIS DO SUDOESTE DO PARÁ (FCCSPA)',
        322,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CATÓLICA DA PARAÍBA', 189, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE ABAETETUBA (FCAB)',
        227,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE ANÁPOLIS (CATÓLICA DE ANÁPOLIS)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE BELÉM (FACBEL)',
        232,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE FEIRA DE SANTANA',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE FORTALEZA (FCF)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE MATO GROSSO (FACC-MT)',
        121,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE POUSO ALEGRE (FACAPA)',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE RONDONIA (FCR)',
        51,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE SANTA CATARINA (FACASC)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE SÃO JOSÉ DOS CAMPOS (CATÓLICA-SJC)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DE VÁRZEA GRANDE (FACC-VG)',
        121,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DOM ORIONE (FACDO)',
        196,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA DO RIO GRANDE DO NORTE',
        323,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA IMACULADA CONCEIÇÃO DO RECIFE (CATÓLICA)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA PAULISTA (FACAP)',
        145,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA RAINHA DA PAZ DE ARAPUTANGA (FCARP)',
        324,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA SALESIANA DE MACAÉ (FCSMA)',
        325,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CATÓLICA SANTA TERESINHA (FCST)',
        326,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CATUAÍ (ICES)', 327, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CCI (FAC CCI)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CDL', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CEAFI', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CEAM (CEAM)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CEARENSE (FAC)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CECAPE', 135, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CEDIN (CEDIN)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CENBRAP (CENBRAP)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CENECISTA DE CAPIVARI (FACECAP)',
        328,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CENECISTA DE RIO BONITO (FACERB)',
        329,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CENECISTA DE SETE LAGOAS (FCSL)',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CENSUPEG', 68, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CENTRAL DE CRISTALINA (FACEC)',
        330,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CENTRAL DO RECIFE CENTRO (FACENTRAL REC)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CENTRO MATO-GROSSENSE', 292, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CENTRO OESTE CATANDUVAS (FACOC)',
        331,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CENTRO PAULISTANO', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CENTRO SÃO PAULO (FACESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CENTRO SUL', 332, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CEPEP', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CERES (FACERES)', 114, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CERRADO (FACE)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CERS (CERS)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CESAR (FCE)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESGRANRIO (FACESGRANRIO)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESMAC DO AGRESTE (CESMAC AGRESTE)',
        333,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESMAC DO SERTÃO (CESMAC SERTÃO)',
        334,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESMA DE MARACANAÚ (FACESMA)',
        335,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESPU EUROPA BRASIL (FACCE)',
        132,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESUMAR DE CAMPO GRANDE (FACCESUMAR)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESUMAR DE GUARAPUAVA (FAC-CESUMAR)',
        64,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESUMAR DE LONDRINA (FAC-CESUMAR)',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CESUMAR DE PONTA GROSSA (FAC-CESUMAR)',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CESURG MARAU', 336, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CESUSC', 3, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CETRUS SANAR (CETRUS)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CGESP GOIANIA (FAC CGESP)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CHRISTUS (CHRISTUS EUSÉBIO)',
        337,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CIDADE DE APARECIDA DE GOIÂNIA (FACCIDADE)',
        41,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CIDADE DE COROMANDEL (FCC)',
        338,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CIDADE DE JOÃO PINHEIRO (FCJP)',
        339,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CIDADE DE PATOS DE MINAS (FPM)',
        112,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CIDADE LUZ (FACILUZ)', 340, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CIDADE TEOLÓGICA PENTECOSTAL (FCTP)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CIÊNCIAS DA VIDA (FCV)', 24, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CLARETIANA DE BRASILIA (FCB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CLARETIANA DE TEOLOGIA', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CLEBER LEITE (FCL)', 47, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CLEBER LEITE - EAD (FCL - EAD)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CMB (CMB)', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC ALBERTO TORRES', 341, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC CAMPO LARGO', 342, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CNEC CAPITÃO LEMOS CUNHA',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CNEC DE EDUCAÇÃO DE UBERABA (FACEUB)',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC FARROUPILHA', 343, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC GRAVATAÍ', 344, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC ITAJAÍ', 345, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC JOINVILLE', 68, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC NOVA PETRÓPOLIS', 346, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC RIO DAS OSTRAS', 347, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC SANTO ÂNGELO', 348, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC UNAÍ', 349, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CNEC VARGINHA', 133, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE COELHO NETO (FACNET)', 267, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE COGNITIVO (COGNITIVO)', 3, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CONCEITO EDUCACIONAL (FACCON)',
        15,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CONCÓRDIA (FACC)', 350, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CONECTADA FACONNECT (FACONNECT)',
        351,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CONEXÃO (CONEXÃO)', 352, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CONHECIMENTO & CIÊNCIA (FCC)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE COSMOPOLITA', 79, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE COTEMIG (COTEMIG)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CRISTÃ DA CIDADE (FCC)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE CRISTÃ DE CURITIBA (FCC)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CRISTO REI (FACCREI)', 353, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CTA (CTA)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CUIABÁ (FAUC)', 203, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CULTURA INGLESA (FCI)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE CURITIBANA (FAC)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA ALTA PAULISTA (FAP)',
        354,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DA AMAZÔNIA (FAMA)', 355, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DA AMAZÔNIA (FAAM)', 232, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA AMAZÔNIA DE PORTO VELHO',
        51,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA AMAZÔNIA LEGAL (FAMA)',
        356,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA ASSOCIAÇÃO BRASILIENSE DE EDUCAÇÃO (FABE)',
        336,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA ASSOCIAÇÃO MÉDICA PAULISTA (APM)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA CIDADE DE MACEIÓ (FACIMA)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA CONSTRUÇÃO E DO TRABALHO (FACT)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DA ESCADA (FAESC)', 357, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA FRATERNIDADE DE VALENÇA (FFV)',
        306,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA FUNDAÇÃO EDUCACIONAL ARAÇATUBA (FAC-FEA)',
        197,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DAMA', 358, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DAMAS DA INSTRUÇÃO CRISTÃ (FADIC)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DAMÁSIO (DAMASIO)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DAMÁSIO EDUCACIONAL (FDE)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA POLÍCIA MILITAR (FPM)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA POLÍCIA MILITAR DE SANTA CATARINA (FAPOM)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA REGIÃO DOS LAGOS (FERLAGOS)',
        359,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA REGIÃO SERRANA (FARESE)',
        360,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA REGIÃO SISALEIRA (FARESI)',
        361,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DAS ATIVIDADES EMPRESARIAIS DE TERESINA (FAETE)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA SAÚDE E ECOLOGIA HUMANA (FASEH)',
        362,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DA SERRA GAÚCHA DE BENTO GONÇALVES',
        77,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DA SEUNE (SEUNE)', 73, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO CIÊNCIAS ECON E CONTÁBEIS DE GUARATINGUETÁ (FACEAG)',
        363,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO, COMÉRCIO E EMPREENDEDORISMO (FACEM)',
        364,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO DE CAMPO BELO (FACAMP)',
        365,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO DE CATAGUASES (UNIPACAT)',
        366,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO DE CHAPADÃO DO SUL (FACHASUL)',
        367,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO DE FÁTIMA DO SUL (FAFS)',
        368,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO DE ITABIRITO (FAI)',
        261,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO DE MARIANA (FAMA)',
        238,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO DE NOVA ANDRADINA - FANOVA (FANOVA)',
        369,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO DE SANTA CRUZ DO RIO PARDO (FASC)',
        370,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO E ARTES DE LIMEIRA (FAAL)',
        276,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO E NEGÓCIOS (FAN)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ADMINISTRAÇÃO E NEGÓCIOS DE SERGIPE (FANESE)',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE AGRONEGÓCIOS DE HOLAMBRA (FAAGROH)',
        371,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE AGRONOMIA UNA DE CONSELHEIRO LAFAIETE',
        18,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE AGRONOMIA UNA DE ITUMBIARA',
        234,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE AGUDOS (FAAG)', 372, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ALTA FLORESTA (FAF)',
        373,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE AMAMBAI (FIAMA)', 374, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE AMERICANA (FAM)', 187, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE AMPÉRE (FAMPER)', 375, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE ANICUNS (FA)', 376, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE APUCARANA (FAP)', 377, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE ARACAJU (FACAR)', 142, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE ARARAQUARA (FARA)', 378, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ARTES DULCINA DE MORAES (FADM)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE ASSIS (FASS)', 379, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE BALSAS (UNIBALSAS)', 380, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE BARUERI (FCGB)', 381, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE BELÉM (FABEL)', 79, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE BELO HORIZONTE (FDR)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE BOITUVA (FIB)', 382, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE BOTUCATU (FDB)', 383, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE BRAGANÇA (FABRA)', 384, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE CAFELÂNDIA (FAC)', 385, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE CAIEIRAS', 386, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CALDAS NOVAS (UNICALDAS)',
        387,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CAMPINA GRANDE (FAC-CG)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CAMPINA GRANDE DO SUL (FACSUL)',
        388,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CARIACICA (FAC DE CARIACICA)',
        389,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CASTELO - MULTIVIX CASTELO (MULTIVIX CASTELO)',
        390,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIA E EDUCAÇÃO DO CAPARAÓ (FACEC)',
        391,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIA E TECNOLOGIA DE MONTES CLAROS (FACIT)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS AGRÁRIAS DE ANDRADINA (FCAA)',
        392,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS AGRÁRIAS DE ARARIPINA (FACIAGRA)',
        393,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS APLICADAS DE LIMOEIRO (FACAL)',
        394,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS APLICADAS DE LIMOEIRO',
        395,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS APLICADAS PIAUIENSE (FACAPI)',
        396,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS BIOMÉDICAS DO ESPÍRITO SANTO (PIO XII - BIO)',
        389,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS CONTÁBEIS (FACIC)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS CONTÁBEIS DE NOVA ANDRADINA - FACINAN (FACINAN)',
        369,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS CONTÁBEIS E ADMINISTRATIVAS DE CACHOEIRO DO ITAPEMIRIM (FACCACI)',
        190,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS CONTÁBEIS E DE ADMINISTRAÇÃO DE EMPRESAS (FCCAE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA AMAZÔNIA (FCA)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA BAHIA - FACIBA (FACIBA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA FUNDAÇÃO INSTITUTO TECNOLÓGICO DE OSASCO (FAC-FITO)',
        158,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE (FACS)',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE ARCHIMEDES THEODORO (FAC - SAUDE ARTHE)',
        397,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE DE BARRETOS DR. PAULO PRATA (FACISB)',
        80,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE DE SÃO PAULO (FACIS)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE DE SERRA TALHADA (FACISST)',
        398,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE DE UNAÍ (FACISA)',
        349,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE DO GRUPO HOSPITALAR CONCEIÇÃO (FACS - GHC)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE IGESP',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE MOINHOS DE VENTO (FACSMV)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE PITÁGORAS DE CODÓ',
        399,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DA SAÚDE SÍRIO-LIBANÊS (SÍRIO-LIBANÊS)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DE GOIANA (FCG)',
        400,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DE TIMBAÚBA (FACET)',
        401,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS DO TOCANTINS (FACIT)',
        196,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS, EDUCAÇÃO E TEOLOGIA DO NORTE DO BRASIL (FACETEN)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS, EDUCAÇÃO, SAÚDE, PESQUISA E GESTÃO (FSF)',
        402,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS EDUCACIONAIS DE CAPIM GROSSO (FCG)',
        403,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS EDUCACIONAIS DO RIO GRANDE DO NORTE (FACERN)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS EDUCACIONAIS E EMPRESARIAIS DE NATAL (FACEN)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS EDUCACIONAIS E TECNOLOGIAS INTEGRADAS (FACETI)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E EDUCAÇÃO DO ESPÍRITO SANTO (UNIVES)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E EDUCAÇÃO EM SAÚDE (FACCESA)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E EDUCAÇÃO SENA AIRES (FACESA)',
        297,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E LETRAS DE BRAGANÇA PAULISTA (FESB)',
        404,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E SAÚDE EDUFOR (EDUFOR)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIA DA BAHIA (FACITE)',
        405,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE BIRIGUI (FATEB)',
        313,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE CHAPECÓ (FACITEC)',
        406,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE JANAÚBA (FACITEC)',
        407,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE TERESINA (FACET)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIA DE UNAÍ - FACTU (FACTU)',
        349,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIA PASCHOAL DANTAS',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIA PROFESSOR DIRSON MACIEL DE BARROS (FADIMAB)',
        400,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS E TECNOLOGIAS DE CAMPOS GERAIS (FACICA)',
        408,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS GERENCIAIS ALVES FORTES (FACE - ALFOR)',
        397,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS GERENCIAIS DE SÃO GOTARDO (CESG)',
        409,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS (IMENSU)',
        410,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS DE CURVELO (FACIC)',
        301,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS DE FORTALEZA (FCHFOR)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS DE OLINDA (FACHO)',
        39,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS DE PERNAMBUCO (FCHPE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS DO ESTADO DE SÃO PAULO (FACIC)',
        229,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS DO SERTÃO CENTRAL (FACHUSC)',
        411,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS E EXATAS DO SERTÃO DO SÃO FRANCISCO (FACESF)',
        28,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS APLICADAS DO CABO DE SANTO AGOSTINHO (FACHUCA)',
        412,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DE ARARIPINA - FACISA (FACISA)',
        393,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DE IGARASSU (FACIG)',
        413,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIENCIAS HUMANAS E SOCIAIS DE SERRA TALHADA (FACHUSST)',
        398,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS DO XINGU E AMAZÔNIA (FACX)',
        14,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS ESUDA (FCHE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS HUMANAS,EXATAS E DA SAÚDE DO PIAUÍ (FAHESP)',
        176,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS ANHANGUERA DE ARAPIRACA',
        333,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE ALTAMIRA',
        14,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE ASSIS',
        379,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE BELO JARDIM',
        395,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE BOM JESUS DA LAPA',
        414,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE CAMPINA GRANDE',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE CRUZ DAS ALMAS',
        172,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE ERECHIM',
        415,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE ITUMBIARA',
        234,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE JABOATÃO DOS GUARARAPES',
        132,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE JACOBINA',
        244,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE LUZIÂNIA',
        98,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE PARAÍSO DO TOCANTINS (FCJP)',
        416,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE SANTA MARIA (UNISM)',
        417,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS JURÍDICAS DE TUCURUÍ',
        418,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS CEMEPE (CEMEPE)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS DA PARAÍBA (FCM-PB)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS DA SANTA CASA SÃO PAULO (FCMSCSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS DE MARICÁ (FACMAR)',
        419,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS DE MINAS GERAIS (FCMMG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS DE SÃO JOSÉ DOS CAMPOS',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS DE TRÊS RIOS (FCM/TR)',
        420,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS DO PARÁ (FACIMPA)',
        46,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS E DA SAÚDE DE JUIZ DE FORA (FCMS/JF)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS MÉDICAS E JURÍDICA (FACMED)',
        421,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS ODONTOLÓGICAS (FCO)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS (FACISA)',
        423,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE BELO HORIZONTE (FACISABH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE EXTREMA (FAEX)',
        424,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE MARABÁ (FACIMAB)',
        46,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DE MINAS GERAIS (FACISAMG)',
        425,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DO SUL DE MINAS - FACESM (FACESM)',
        103,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS DO VALE DO SÃO LOURENÇO (EDUVALE)',
        426,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS APLICADAS E DE TECNOLOGIAS DE AGUA BOA (FACESA)',
        427,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS DOS PALMARES (FACIP)',
        428,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS SOCIAIS E AGRÁRIAS DE ITAPEVA (FAIT)',
        272,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE CIÊNCIAS TECNOLÓGICAS DE FORTALEZA (FCTFOR)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DECISION DE NEGÓCIOS', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE COLIDER (FACIDER)', 356, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE COLINAS DO TOCANTINS',
        429,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE COMUNICAÇÃO ANHANGUERA UNIDADE GUARAPARI',
        266,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE COMUNICAÇÃO E DESIGN "OSWALDO CRUZ"',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DESENVOLVIMENTO DO NORTE (FADENORTE)',
        430,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DESENVOLVIMENTO SUSTENTÁVEL DE CRUZEIRO DO SUL (IEVAL)',
        431,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE DIREITO 8 DE JULHO', 142, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO ANHANGUERA UNIDADE GUARAPARI',
        266,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO ATAME (ATAME)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO AVANTIS DE ITAPEMA (AVANTIS ITAPEMA)',
        432,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO, CIÊNCIAS E TECNOLOGIA SANTA MARIA MADA (FADICT)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DA FUNDAÇÃO ESCOLA SUPERIOR DO MINISTÉRIO PÚBLICO',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE ALTA FLORESTA',
        373,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE CACHOEIRO DO ITAPEMIRIM (FDCI)',
        190,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE CONSELHEIRO LAFAIETE (FDCL)',
        18,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE CONTAGEM (FDCON)',
        200,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE FRANCA (FDF)',
        179,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE IPATINGA (FADIPA)',
        268,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE ITÚ (FADITU)',
        180,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE SANTA MARIA (FADISMA)',
        417,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE SÃO BERNARDO DO CAMPO (FDSBC)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE SOROCABA (FADI)',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE URUGUAIANA - ANHANGUERA',
        433,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE VARGINHA - FADIVA (FADIVA)',
        133,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DE VITÓRIA (FDV)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DO SUL DE MINAS (FDSM)',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO DO VALE DO RIO DOCE (FADIVALE)',
        265,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO E CIÊNCIAS SOCIAIS DO LESTE DE MINAS - FADILESTE (FADILESTE)',
        434,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO SERRA DOURADA',
        14,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DIREITO TECH DE SÃO PAULO (FADITECH)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE DRACENA', 435, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE DUQUE DE CAXIAS (FDC)',
        436,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ECONOMIA E PROCESSAMENTO DE DADOS DE FOZ DO IGUAÇU (FEPI)',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO ACRIANA EUCLIDES DA CUNHA (INEC)',
        143,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO CIÊNCIAS E ARTES DOM BOSCO DE MONTE APRAZÍVEL (FAECA DOM BOSCO)',
        437,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO CIÊNCIAS E LETRAS DE PARAÍSO (FECIPAR)',
        416,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DA IBIAPABA (FAEDI)',
        438,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE COSTA RICA (FECRA)',
        439,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE GUARATINGUETÁ (FACEG)',
        363,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE ITABORAÍ (FEITA)',
        341,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE JARU (UNICENTRO)',
        440,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE NOVA ANDRADINA (FENA)',
        369,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE PATOS DE MINAS (FAEP)',
        112,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE PORTO VELHO (UNIRON)',
        51,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE SANTA CATARINA (FAESC)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE SÃO MATEUS',
        441,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DE TANGARÁ DA SERRA',
        294,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO DO PIAUÍ (FAEPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO E CULTURA DE JI-PARANÁ (FAJIPA)',
        139,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO E ESTUDOS SOCIAIS DE UBERLÂNDIA (FEESU)',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO ELIÂ (FACEEL)',
        442,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO EM CIÊNCIAS DA SAÚDE (FECS)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO E TECNOLOGIA DA AMAZÔNIA (FAM)',
        227,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO E TECNOLOGIA DO ESPÍRITO SANTO (FETES)',
        290,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCACAO E TECNOLOGIA DO PARA (FAETE)',
        227,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO E TECNOLOGIA IRACEMA (FAETI)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO FÍSICA DA ASSOCIAÇÃO CRISTÃ DE MOÇOS DE SOROCABA (FEFISO)',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO FÍSICA DE FOZ DO IGUAÇU',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO MEMORIAL ADELAIDE FRANCO (FEMAF)',
        443,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO PAULISTANA (FAEP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SANTA TEREZINHA (FEST)',
        267,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SÃO FRANCISCO (FAESF)',
        443,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SÃO LUÍS (FESL)',
        315,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SOCIAL DA BAHIA (FAESB)',
        306,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUL DO PIAUÍ',
        444,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE CATALÃO',
        17,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE CHAPECÓ (FACESC)',
        406,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE DIVINÓPOLIS',
        19,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE PARAGOMINAS (FACESP)',
        280,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE PERNAMBUCO (FAESPE)',
        445,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE PERNAMBUCO (FACESP)',
        445,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE POUSO ALEGRE',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE SETE LAGOAS',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DE TANGARÁ DA SERRA (FAEST)',
        294,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR DO PARANÁ (FESPPR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO SUPERIOR IESLA (IESLA)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA BARRA MANSA (FAETERJ B.MANSA)',
        92,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO (FAETERJ CAXIAS)',
        436,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO (FAETERJ PARACAMBI)',
        446,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ PETRÓPOLIS)',
        53,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ S ANT. PÁDUA)',
        447,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ ITAPERUNA)',
        186,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ BJ ITABAPOAN)',
        448,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO - FAETERJ (FAETERJ TRÊS RIOS)',
        420,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO TECNOLÓGICA DO ESTADO DO RIO DE JANEIRO FERNANDO MOTA (FAETERJ-RIO)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EDUCAÇÃO VALE DO PAJEÚ (FVP)',
        449,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ELESBÃO VELOSO (FAEVE)',
        450,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE EMPREENDEDORISMO E CIÊNCIAS HUMANAS (FACULDADE FAECH)',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENFERMAGEM NOVA ESPERANÇA (FACENE)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENFERMAGEM NOVA ESPERANÇA DE MOSSORÓ - FACENE/RN (FACENE/RN)',
        323,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENFERMAGEM SÃO VICENTE DE PAULA (FESVIP)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENGENHARIA DE MINAS GERAIS - FEAMIG (FEAMIG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENGENHARIA DE RESENDE (FER)',
        4,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENGENHARIA E ADMINISTRAÇÃO PAULISTA (FEAP)',
        195,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENGENHARIA E AGRIMENSURA DE SÃO PAULO (FEASP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENGENHARIA SOUZA MARQUES (FESM)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO DE MINAS GERAIS (FACEMG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO DE PESQUISA DO COOPERATIVISMO (FEPCOOP)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO E CULTURA DO CEARÁ (FAECE)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO JURÍDICO DE VITÓRIA (FEJ)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO PASCHOAL DANTAS (FEPD)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO PORTAL (FEP)',
        451,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO REGIONAL ALTERNATIVA (FERA)',
        333,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR (FAES)',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR BRASILEIRA - FACULDADE FEBRAS (FEBRAS)',
        226,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DA AMAZÔNIA (FESAM)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DA AMAZÔNIA REUNIDA (FESAR)',
        452,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DA CIDADE DE FEIRA DE SANTANA (FAESF/UNEF)',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DA PARAÍBA (FESP)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DE FLORIANO (FAESF)',
        453,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DE LINHARES (FACELI)',
        277,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DE MARECHAL CÂNDIDO RONDON (ISEPE RONDON)',
        454,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DE PARNAÍBA (FAESPA)',
        176,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DO CENTRO DO PARANÁ (UCP)',
        455,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DO INTERIOR PAULISTA (FAIP)',
        145,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DO LAGO (FAESLA)',
        456,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DOM BOSCO (FACDOMBOSCO)',
        353,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR DO PIAUÍ (FAESPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR E FORMAÇÃO INTEGRAL (FAEF)',
        457,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR PASCHOAL DANTAS',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR PELEGRINO CIPRIANI (FASPEC)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR REFFERENCIAL (FAREFF)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ENSINO SUPERIOR SANTA BARBARA (FAESB)',
        458,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ESTUDOS AVANÇADOS DO PARÁ (FEAPA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ESTUDOS SOCIAIS APLICADOS DE VIANA (FESAV)',
        459,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ESTUDOS SOCIAIS DO ESPÍRITO SANTO (PIO XII)',
        389,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE ALEGRE (FAFIA)',
        460,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE BOA ESPERANÇA (FAFIBE)',
        314,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE IBITINGA (FAIBI)',
        461,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE ITUVERAVA (FFCL)',
        462,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE MACAÉ (FAFIMA)',
        325,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE PENÁPOLIS (FAFIPE)',
        463,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DE SÃO JOSÉ DO RIO PARDO (FFCL)',
        464,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DO ALTO SÃO FRANCISCO (FASF)',
        465,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS DOM BOSCO (FFCLDB)',
        4,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA CIÊNCIAS E LETRAS SOUZA MARQUES (FFCLSM)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FILOSOFIA E TEOLOGIA PAULO VI (FFTP)',
        62,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FORMAÇÃO DE PROFESSORES DA MATA SUL (FAMASUL)',
        428,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FORMAÇÃO DE PROFESSORES DE ARARIPINA (FAFOPA)',
        393,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE FORMAÇÃO DE PROFESSORES DE SERRA TALHADA (FAFOPST)',
        398,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE FORTALEZA (FAFOR)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE FRUTAL (FAF)', 466, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE GESTÃO, EDUCAÇÃO E DE SAÚDE (FGS)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE GESTÃO E INOVAÇÃO (FGI)',
        21,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE GESTAO E NEGOCIOS DE CACHOEIRINHA (FGN CACHOEIRINH)',
        74,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE GESTAO E NEGOCIOS DE SALVADOR (FGN)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE GESTAO E NEGOCIOS DE TERESINA (FGN TERESINA)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE GOIANA (FAG)', 400, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE GOVERNANÇA, ENGENHARIA E EDUCAÇÃO DE SÃO PAULO (FGE-SP)',
        195,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE GUARANTÃ DO NORTE ( UNIFAMA)',
        467,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE GUARULHOS (FAG)', 100, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DEHONIANA (DEHONIANA)', 33, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE HORTOLÂNDIA (FACH)', 468, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE IBAITI (FEATI)', 469, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ILHA SOLTEIRA (FAISA)',
        340,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE IMPERATRIZ WYDEN (FACIMP WYDEN)',
        267,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE INDIARA (FAIND)', 470, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE INFORMÁTICA DE OURO PRETO DO OESTE (FIOURO)',
        471,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE INHUMAS - FAC-MAIS (FACMAIS)',
        472,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE INTEGRAÇÃO DO ENSINO SUPERIOR DO CONE SUL (FISUL)',
        473,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE INTEGRAÇÃO DO SERTÃO (FIS)',
        398,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE IPORÁ (FAI)', 474, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE ITAITUBA (FAI)', 475, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ITÁPOLIS - FACITA (FACITA)',
        223,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE JABOTICABAL (FAJAB)',
        315,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE JACAREÍ', 273, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE JANDAIA DO SUL (FAFIJAN)',
        476,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE JUSSARA (FAJ)', 477, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DELMIRO GOUVEIA (FDG)', 73, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DELTA (FACULDADE DELTA)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE LUCAS DO RIO VERDE (UNIFAMA)',
        169,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE MARÍLIA (FAMAR)', 145, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MARTINÓPOLIS (FAMA)',
        478,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MATO GROSSO (FAMAT)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE MATUPÁ ( UNIFAMA)', 479, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE MAUÁ - FAMA (FAMA)', 480, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDIAÇÃO ÍVIA CORNELI (FAMIC)',
        481,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE MEDICINA (ITPAC)', 196, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE AÇAILÂNDIA',
        482,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE BARBACENA (FAME)',
        32,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE CAMPOS (FMC)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE GARANHUNS (SUB JUDICE)',
        483,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE ITAJUBÁ (FMIT)',
        103,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE JI-PARANÁ',
        139,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE JUNDIAÍ (FMJ)',
        182,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE MARÍLIA (FAMEMA)',
        145,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE OLINDA (FMO)',
        39,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE PETRÓPOLIS (FMP)',
        53,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DE SÃO JOSÉ DO RIO PRETO (FAMERP)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA DO SERTÃO (FMS)',
        15,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA ESTÁCIO DE CASTANHAL (ESTÁCIO FMEC)',
        484,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA ESTÁCIO DE JUAZEIRO DO NORTE (ESTÁCIO FMJ)',
        135,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MEDICINA NOVA ESPERANÇA (FAMENE)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MIGUEL PEREIRA (FAMIPE)',
        485,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MINAS BH (FAMINAS-BH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE MIRASSOL', 486, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MÚSICA CARLOS GOMES (FMCG)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MÚSICA DO ESPÍRITO SANTO MAURÍCIO DE OLIVEIRA (FAMES)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE MÚSICA SOUZA LIMA (FMSL)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE NOVA MUTUM (UNIFAMA)',
        487,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE NOVA MUTUM', 487, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE NOVA SERRANA (FANS)',
        488,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ODONTOLOGIA DA APCD (FAOA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ODONTOLOGIA DE MANAUS (FOM)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ODONTOLOGIA DO RECIFE (FOR)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE OLÍMPIA', 489, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE OSASCO (FCO)', 158, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PALMAS (FAPAL)', 23, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE PALMEIRAS DE GOIÁS - FACMAIS (FACMAIS)',
        490,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE PARÁ DE MINAS (FAPAM)',
        491,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PEDAGOGIA (ANAEC)', 369, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PENÁPOLIS', 463, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE PENEDO (FAC-PENEDO)',
        492,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PETROLINA (FACAPE)', 445, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PINHAIS (FAPI)', 493, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PIRACANJUBA (FAP)', 494, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PONTA PORÃ (FAP)', 495, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PORTO FELIZ', 496, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE PRESIDENTE EPITÁCIO - FAPE (FAPE)',
        497,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE PRESIDENTE PRUDENTE (FAPEPE)',
        50,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE PRESIDENTE VENCESLAU (FAPREV)',
        498,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE PRIMAVERA (CESPRI)', 499, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE QUIXERAMOBIM (UNIQ)',
        500,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE RANCHARIA', 501, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE RIBEIRÃO PIRES', 502, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE RIBEIRÃO PRETO (AFARP)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE RIO CLARO (CBTA)', 222, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE ROLIM DE MOURA (FAROL)',
        503,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE RONDÔNIA (FARO)', 51, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE ROSEIRA (FARO)', 504, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SABARÁ (SOECS)', 505, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SANTA BÁRBARA D''OESTE (FAP)',
        288,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SANTA CATARINA (FASC)',
        140,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SANTA CRUZ DA BAHIA (FSC)',
        506,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SANTA INÊS (FSI)', 507, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SANTA LUZIA (FACSAL)',
        508,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SANTANA DE PARNAÍBA (FASP)',
        509,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SANTO ANDRÉ', 47, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SANTO ÂNGELO (FASA)',
        348,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SANTO ANTONIO DA PLATINA',
        510,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SÃO BENTO (FSB)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SÃO BERNARDO DO CAMPO (FAPAN)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SÃO BERNARDO DO CAMPO - FASB (FASB I)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SÃO CAETANO DO SUL', 126, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SÃO CARLOS (FASC)', 72, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SÃO LOURENÇO (FASAMA)',
        511,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SÃO MARCOS (FACSM)', 512, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SÃO PAULO (FASP)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SÃO ROQUE (FASAR)', 191, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SÃO VICENTE (FSV)', 513, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SAÚDE, CIÊNCIAS E TECNOLOGIA - FACESB (FACESB)',
        514,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SAÚDE DO SERTÃO DE PERNAMBUCO (FASPE)',
        515,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SAÚDE E HUMANIDADES IBITURUNA (FASI)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE SAÚDE SANTO AGOSTINHO DE VITÓRIA DA CONQUISTA (FASA)',
        37,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DESCOMPLICA', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SERTÃOZINHO', 291, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SOBRAL (FASOL)', 167, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SOROCABA', 146, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE SUZANO (UNISUZ)', 184, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE TAPEJARA (FAT)', 516, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TAQUARITINGA (FTGA)',
        517,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA AEROTD (AEROTD)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA ALCIDES MAYA (AMTEC)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA ALPHA CHANNEL (FATAC)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA ALTO MÉDIO SÃO FRANCISCO (FAC FUNAM)',
        302,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA ASSESSORITEC',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA AVANÇADA',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA BANDEIRANTES (BANDTEC)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA CACHOEIRO DE ITAPEMIRIM (FACI)',
        190,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA CENTEC - CARIRI (CENTEC)',
        135,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA CENTEC - SERTÃO CENTRAL (FTC SERTÃO CENTRAL)',
        500,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA CNA (FATECNA)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA COESP (FCOESP)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DA AMAZÔNIA (FATEC)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DA PARAÍBA (FATECPB)',
        204,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ADAMANTINA',
        91,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE AMERICANA "MINISTRO RALPH BIASI" (FATEC-AM)',
        187,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ARAÇATUBA (FATEC ARAÇATUBA)',
        197,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ARARAQUARA (FATEC ARQ)',
        378,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ARARAS',
        83,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ASSIS (FATEC ASSIS)',
        379,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE BARUERI (FATEC BARUERI)',
        381,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE BAURU (FATEC)',
        93,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE BOTUCATU (FATEC BT)',
        383,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE BRAGANÇA PAULISTA',
        404,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE CAMPINAS (FATEC CAMPINAS)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE CAPÃO BONITO (FATEC-CB)',
        518,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE CARAPICUIBA (FATEC)',
        519,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE CATANDUVA (FATEC CATANDUVA)',
        181,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE COTIA (FATEC COTIA)',
        520,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE CRUZEIRO DO OESTE (FACO)',
        521,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE DIADEMA LUIGI PAPAIZ (FATEC DIADEMA)',
        522,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE FERRAZ DE VASCONCELOS',
        523,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE FRANCO DA ROCHA',
        524,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE GARÇA (FATECGA)',
        457,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE GUARATINGUETÁ (FATEC GT)',
        363,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE GUARULHOS (FATEC GR)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE HORIZONTE (FATHOR)',
        525,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE INDAIATUBA (FATEC-ID)',
        11,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ITAPETININGA - PROF.ANTÔNIO BELIZANDRO BARBOSA REZENDE (FATEC - ITAPETININGA)',
        271,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ITAPIRA (FATEC ITAPIRA)',
        104,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ITAQUAQUECETUBA (FATEC ITAQUA)',
        526,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ITAQUERA (FATEC ITAQUERA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE ITATIBA (FATEC ITATIBA)',
        527,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE JACAREÍ (FATEC JACAREÍ)',
        273,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE JAHU (FATEC-JAHU)',
        274,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE JALES (FATEC JALES)',
        106,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE JUNDIAÍ (FATEC/JD)',
        182,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE MATÃO',
        278,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE MAUÁ (FATEC MAUÁ)',
        480,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE MOCOCA (FATEC)',
        528,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE MOGI DAS CRUZES (FATEC-MC)',
        62,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE OSASCO - PREFEITO HIRANT SANAZAR (FATEC OSASCO)',
        158,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE OURINHOS (FATEC)',
        89,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE PINDAMONHANGABA (FATEC PI)',
        162,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE PIRACICABA (FATEC PIRACICABA)',
        224,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE PIRACICABA (FATEP)',
        224,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE POMPEIA - SHUNJI NISHIMURA (FATEC POMPEIA)',
        529,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE PONTA PORÃ (FATEP)',
        495,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE PRAIA GRANDE (FATECPG)',
        250,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE PRESIDENTE PRUDENTE (FATEC)',
        50,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SANTANA DE PARNAÍBA (FATEC-SPB)',
        509,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO BERNARDO DO CAMPO (FATEC-SB)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO CAETANO DO SUL (FATEC SCS)',
        126,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO CARLOS (FATEC SÃO CARLO)',
        72,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO JOSÉ DO RIO PRETO (FATECRP)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO JOSÉ DOS CAMPOS - JESSEN VIDAL (FATECSJCAMPOS)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO PAULO (FATEC-SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO ROQUE (FATEC-SR)',
        191,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO SEBASTIÃO (FATEC SS)',
        530,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SÃO VICENTE (FATEF)',
        513,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SERTÃOZINHO (FATEC SERTÃOZINHO)',
        291,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SINOP (FASTECH)',
        155,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SOROCABA (FATEC SO)',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE SUMARÉ (FATEC DE SUMARÉ)',
        293,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE TAQUARITINGA (FATEC/TQ)',
        517,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE TATUÍ - PROF. WILSON ROBERTO RIBEIRO DE CAMARGO (FATEC TATUÍ)',
        458,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE TAUBATÉ (FATEC TAUBATÉ)',
        33,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DE TERESINA (FACULDADE CET)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DO AMAPÁ (META)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DO BRASIL (FAT BRASIL)',
        531,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DO COOPERATIVISMO',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DO IPIRANGA (FATECIPI)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DOM AMAURY CASTANHO (FATEC ITU)',
        180,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DO NORDESTE (FATENE)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DO PIAUÍ (FATEPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DO TATUAPÉ (FATEC-TT)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DO VALE DO IVAÍ (FATEC-IVAI)',
        532,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA DR. THOMAZ NOVELINO (FATEC FRANCA)',
        179,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E ADMINISTRAÇÃO EDUFOR (EDUFOR)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS (FTC JUAZEIRO)',
        533,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS DA BAHIA (FATEC/BA)',
        213,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE CAMPINA GRANDE (FTC CAMP GRANDE)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE ITABUNA (FTC)',
        269,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE JEQUIÉ (FTC)',
        275,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS DE TERESINA (FTC TERESINA)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS DO ALTO PARANAÍBA (FATAP)',
        125,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CAMAÇARI (FTC CAMAÇARI)',
        153,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CARUARU (FTC - CARUARU)',
        156,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC CAUCAIA (FTC CAUCAIA)',
        534,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC ITAPIPOCA (FTC ITAPIPOCA)',
        535,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC JUAZEIRO DO NORTE (FTC JUAZEIRO CE)',
        135,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC N. SRA. DO SOCORRO (FTC N S SOCORRO)',
        536,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC PARNAMIRIM (FTC PARNAMIRIM)',
        537,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC PETROLINA (FTC PETROLINA)',
        445,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E CIÊNCIAS - FTC TEIXEIRA DE FREITAS (FTC)',
        295,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E DESENVOLVIMENTO DE COMPETÊNCIAS (FDC)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA, EDUCAÇÃO SUPERIOR E PROFISSIONAL (FATESP)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E EDUCAÇÃO DE GOIÁS (FATEG)',
        538,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E EDUCAÇÃO SUPERIOR E PROFISSIONALIZ (FATESP)',
        539,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA EGÍDIO JOSÉ DA SILVA (FATEGIDIO)',
        7,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E INOVAÇÃO SENAC DF',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA EM HOTELARIA, GASTRONOMIA E TURISMO DE SÃO PAULO (HOTEC)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA EM SAÚDE (FATESA)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA EM SAÚDE CIEPH (FACTES)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA EM SAÚDE - IAHCS (FATESA)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA E NEGÓCIOS DE CATALÃO (FATENC)',
        17,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA ESTÁCIO DE CURITIBA (FATEC ESTÁC CURITIBA)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA ESTUDANTE RAFAEL ALMEIDA CAMARINHA - MARILIA (FATEC MARILIA)',
        145,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA FAESA (CET-FAESA)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA - FATEC DE RIBEIRÃO PRETO',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA FRANCISCO MORATO (FFRAMO)',
        540,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA FTEC (FTEC NOVO HAMBURGO)',
        541,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA FTEC DE PORTO ALEGRE (FTEC PORTO ALEGRE)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA FUTURO (FATEC FUTURO)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA GAP (GAP)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA IBRATE (FAITEC)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA ÍCONE (FACTI)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA INFORMÁTICA (FATI)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE TECNOLOGIA IPANEMA', 146, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA IPEP DE CAMPINAS (FATEC CAMPINAS)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA IPPEO (IPPEO)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA IPUC (FATIPUC)',
        542,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA JARDIM (FATEJ)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA JORGE CARAM SABBAG (FATEC BEBEDOURO)',
        208,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA LA SALLE - ESTRELA (FACSALLE)',
        543,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA NILO DE STÉFANI - JABOTICABAL (FATEC JBL)',
        315,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA NOVA PALHOÇA (FATENP)',
        544,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA OSWALDO CRUZ (FATEC OSWALDO CRUZ)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA PAULISTA',
        545,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA PENTÁGONO (FATEP)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA PORTO DAS MONÇÕES (FAMO)',
        496,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA PORTO SUL (FAPS)',
        250,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA PROFESSOR ANTÔNIO SEABRA (FATEC LINS)',
        70,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA RUBENS LARA (FATEC-BS)',
        171,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SAINT PAUL',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SANTO ANDRÉ (FATEC-SA)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SEBRAE (FATEC SEBRAE)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC AMAZONAS',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC CASCAVEL',
        54,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC CURITIBA',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC CURITIBA PORTÃO',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC MARINGÁ',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC MINAS - UNIDADE BARBACENA',
        32,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC MINAS - UNIDADE BELO HORIZONTE (FTS)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC PELOTAS (FATEC SENAC PELOTAS)',
        283,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC PONTA GROSSA',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAC RIO (FATEC)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI ANTÔNIO ADOLPHO LOBBE',
        72,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI CAMPO GRANDE',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI CHAPECÓ (SENAI)',
        406,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI CIC',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI CURITIBA',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI DE DESENVOLVIMENTO GERENCIAL (FATESG)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI DOURADOS (FATEC DOURADOS)',
        84,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI FELIX GUISARD',
        33,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI FLORIANÓPOLIS (SENAI -SC - CTAI)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI GASPAR RICARDO JUNIOR',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI ÍTALO BOLOGNA (FATECIB)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI JARAGUÁ DO SUL (FATEC)',
        31,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI JOINVILLE (SENAI DE JOINVILLE)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI LONDRINA',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI MARIO AMATO (SENAI)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI MATO GROSSO (FATEC SENAI MT)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI NADIR DIAS DE FIGUEIREDO',
        158,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI PERNAMBUCO',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI PORTO ALEGRE (FATEC SENAI)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI ROBERTO MANGE',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA SENAI ROBERTO MANGE (FATEC SENAI RM)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA TUPY DE SÃO BENTO DO SUL (FTT-SBS)',
        546,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECNOLOGIA ZONA LESTE (FATEC-ZL)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TECONOLOGIA DA ZONA SUL (FATEC ZONASUL)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEODORO SAMPAIO (FTS)',
        547,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEOLOGIA DA ARQUIDIOCESE DE BRASÍLIA (FATEO)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEOLOGIA DE SÃO PAULO DA IGREJA PRESBITERIANA INDEPENDENTE DO BRASIL',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEOLOGIA E CIÊNCIAS HUMANAS (FATECH)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEOLOGIA E CIÊNCIAS HUMANAS (ITEPAFACULDADES)',
        282,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEOLOGIA EVANGÉLICA EM CURITIBA - FATEV (FATEV)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEOLOGIA, FILOSOFIA E CIÊNCIAS HUMANAS GAMALIEL (FATEFIG)',
        418,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEOLOGIA FORTALEZA - FATEFOR (FATEFOR)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DE TEOLOGIA INTEGRADA (FATIN)',
        413,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE TIETÊ', 548, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE TUPÃ', 354, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE VIÇOSA (FDV)', 122, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DE VITÓRIA', 25, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DIADEMA (FAD)', 522, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DINÂMICA (FACDIN)', 549, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DINÂMICA DO VALE DO PIRANGA (FADIP)',
        550,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DIOCESANA SÃO JOSÉ (FADISI)',
        143,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO AMAZONAS (IAES)', 75, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO AMAZONAS DE ENSINO, PESQUISA E INOVAÇÃO (FAMEPI)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO BAIXO PARNAÍBA (FAP)',
        551,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO BELO JARDIM (FBJ)', 395, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO CARIRI PARAIBANO (UNICIR)',
        552,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO CEFI (FACEFI)', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO CENTRO EDUCACIONAL MINEIRO - FACEM (FACEM-BH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO CENTRO EDUCACIONAL SANTA ISABEL (FACESI)',
        553,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO CENTRO LESTE (UCL)', 290, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO CENTRO MARANHENSE (FCMA)',
        554,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO CENTRO OESTE PAULISTA (FACOP)',
        555,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOCKTOR (FADOCKTOR)', 154, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO CLUBE NÁUTICO MOGIANO (FCNM)',
        62,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO COMÉRCIO DE SÃO PAULO (FAC-SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO COMPLEXO EDUCACIONAL SANTO ANDRÉ (FACESA)',
        556,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DA ZONA NORTE DE JUIZ DE FORA (DOCTUM)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE ALMENARA (DOCTUM)',
        252,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE CARANGOLA (DOCTUM)',
        557,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE JOÃO MONLEVADE (DOCTUM)',
        558,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE JUIZ DE FORA (DOCTUM)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE MANHUAÇU - DOCTUM (FCM)',
        207,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE SERRA (DOCTUM)',
        290,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE SETE LAGOAS (DOCTUM)',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE VILA VELHA (DOCTUM)',
        226,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOCTUM DE VITÓRIA (DOCTUM)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO EDUCADOR (FEDUC)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO ESTADO DE SÃO PAULO (ESP)',
        197,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO ESTADO DO MARANHÃO (FACEM)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO ESTADO DO RIO DE JANEIRO (FAERJ)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO FUTURO (FAF)', 207, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO GUARUJÁ (FAGU)', 127, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO INSTITUTO BRASIL (FIBRA)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO INSTITUTO NACIONAL DE PÓS-GRADUAÇÃO DE SÃO JOSÉ DOS CAMPOS (FACULDADE INPG - SJC)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO INSTITUTO PANAMERICANO (FACIPAN)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOIS DE JULHO (F2J)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO LITORAL PARANAENSE (FLP)',
        559,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO LITORAL SUL PAULISTA (FALS)',
        250,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO MACIÇO DO BATURITÉ (FMB)',
        560,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM ADELIO TOMASIN (FADAT)',
        67,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOM ALBERTO (FDA)', 561, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO MARANHÃO (FACAM-MA)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOM BOSCO (DOM BOSCO)', 54, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM BOSCO DE CAPITÃO LEÔNIDAS MARQUES',
        562,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM BOSCO DE GOIOERÊ (DOM BOSCO GOIOERÊ)',
        563,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM BOSCO DE MARINGA (DOM BOSCO)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM BOSCO DE PORTO ALEGRE (FDB)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM BOSCO DE UBIRATÃ (DOM BOSCO UBIRATÃ)',
        564,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM BOSCO PARANÁ (DOM BOSCO PARANÁ)',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOMINIUS (FAD)', 157, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM LUCIANO MENDES (FDLM)',
        238,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM LUIS DE ORLEANS E BRAGANÇA (FDL)',
        565,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM PEDRO II DE SERGIPE (DP II SERGIPE)',
        566,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOM PEDRO II DE TECNOLOGIA (FDP II TEC)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOM RICARDO (FDR)', 100, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOMUS SAPIENS (FDS)', 533, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO NORDESTE DA BAHIA (FANEB)',
        567,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO NOROESTE DE MINAS (FINOM)',
        55,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO NORTE DE MATO GROSSO (AJES)',
        467,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO NORTE NOVO DE APUCARANA (FACNOPAR)',
        377,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO OESTE POTIGUAR (FAOP)',
        568,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO PLANALTO CENTRAL (FAPLAC)',
        539,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO RECIFE (FAREC)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO RIO DE JANEIRO', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOS CARAJÁS', 46, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOS CERRADOS PIAUIENSES (FCP)',
        569,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO SERIDÓ (FAS)', 570, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO SERTÃO BAIANO (FASBE)',
        571,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO SERTÃO CENTRAL (FASEC)',
        572,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO SERTÃO CENTRAL EAD (FASEC EAD)',
        572,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO SERTÃO DO ARARIPE (FASA)',
        573,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO SERTÃO DO PAJEÚ (FASP)',
        574,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO SERTÃO DO SÃO FRANCISCO (FASF)',
        575,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOS GÊNIOS (FAGENIUS)', 268, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOS PALMARES (FAP)', 428, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO SUDESTE GOIANO (FASUG)',
        576,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO SUL DA BAHIA (FASB)',
        295,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO TAPAJÓS (FAT)', 475, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO TRABALHO (FATRA)', 134, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DOURADO (FD)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DOUTOR FRANCISCO MAEDA (FAFRAM)',
        462,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO VALE (FAV)', 452, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DO VALE DO CAJU (FVC)', 451, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO VALE DO ITAPECURÚ (FAI)',
        97,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO VALE DO JAGUARIBE MOSSORÓ (FVJ MOSSORÓ)',
        323,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO VALE DO RIO ARINOS (AJES)',
        577,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DO VALE ELVIRA DAYRELL - FAVED (FAVED)',
        578,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE DUARTE COELHO (FDC)', 579, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE DYNAMUS DE CAMPINAS (FADYC)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EASE BRASIL (EASE)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EDUCABRASIL NOEL DE MELLO',
        580,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EDUCACIONAL ARAUCÁRIA (FACEAR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EDUCACIONAL DE COLOMBO (FAEC)',
        582,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EDUCACIONAL DE MEDIANEIRA (UDC MEDIANEIRA)',
        583,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EDUCACIONAL JURÍDICA E GERENCIAL DE OLIVEIRA (FEJUGO)',
        584,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EDUCAMAIS (EDUCA+)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EDUCAREMT (EDUCARE)', 203, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EDUFOR (EDUFOR)', 141, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EDUFOR DE SALVADOR (EDUFOR)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EDUVALE DE AVARÉ (EDUVALE)',
        195,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EFICAZ (EFICAZ)', 76, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EGAS MONIZ (FEM)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EINSTEIN', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ELO (FAELO)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EMBU DAS ARTES (FAEM)', 585, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EMPRESARIAL DE CHAPECÓ (FAEM)',
        406,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ENAU (FACENAU)', 502, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ENDEX (ENDEX)', 230, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ENERGIA', 3, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ENGENHEIRO SALVADOR ARENA (FESA)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ENSIN.E (ENSIN.E)', 38, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ERICH FROMM (FACEF)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESAMC CAMPINAS (ESAMC)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESAMC FRANCA (ESAMC FRANCA)',
        179,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESAMC GOIÂNIA (ESAMC GOIÂNIA)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ESAMC JUNDIAÍ (ESAMC)', 182, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ESAMC SANTOS (ESAMC)', 171, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESAMC SÃO PAULO - ESAMC (ESAMC)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESAMC SOROCABA (ESAMC)',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESAMC UBERLÂNDIA (ESAMC)',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESCOLA DE AYURVEDA (FAESDA)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESCOLA DE NEGÓCIOS EXCELLENCE (FAENE)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESCOLA PAULISTA DE DIREITO (FACEPD)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESCOLA POLITÉCNICA DE INOVAÇÃO E CONHECIMENTO APLICADO (ÉPICA)',
        193,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESCOLA SOBRAL DE OLIVEIRA (FAESDO)',
        586,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESPECIALIZADA NA ÁREA DE SAÚDE DO RIO GRANDE DO SUL (FASURGS)',
        282,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ÉSPER (ÉSPER)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESPÍRITO SANTENSE (UNICAPE)',
        389,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESPÍRITO SANTENSE DE CIÊNCIAS JURÍDICAS (PIO XII - DIR)',
        389,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ESPÍRITO SANTO (FAES)', 587, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESSA EDUCACAO PROFISSIONAL (UNIESSA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DA PARAÍBA (ESTACIO PARAIBA)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE ALAGOAS - ESTÁCIO FAL (ESTÁCIO FAL)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ESTÁCIO DE ALAGOINHAS', 213, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ESTÁCIO DE ANANINDEUA', 232, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE BELÉM - ESTÁCIO BELÉM (ESTÁCIO BELÉM)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE CANINDÉ (ESTÁCIO CANINDÉ)',
        588,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE CARAPICUÍBA (ESTÁCIO CARAPICUÍBA)',
        519,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE CASTANHAL (ESTÁCIO CASTANHAL)',
        484,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE COTIA (ESTACIO COTIA)',
        520,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE CURITIBA (ESTÁCIO CURITIBA)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE FEIRA DE SANTANA (ESTÁCIO FEIRA DE SAN)',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE FLORIANÓPOLIS - ESTÁCIO FLORIANÓPOLIS',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE JARAGUÁ DO SUL (ESTÁCIO JARAGUÁ)',
        31,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE JUAZEIRO (ESTÁCIOJUAZEIRO)',
        533,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE NATAL (ESTACIO NATAL)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE PIMENTA BUENO (ESTÁCIO FAP)',
        589,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE RIO PRETO (ESTÁCIO RIO PRETO)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE SÁ DE OURINHOS (FAESO)',
        89,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE SÁ DE VILA VELHA (FESVV)',
        226,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE SÁ DE VITÓRIA (FESV)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE SANTO ANDRÉ (ESTÁCIO SANTO ANDRÉ)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DE TERESINA (ESTÁCIO TERESINA)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DO AMAPÁ - ESTÁCIO AMAPÁ (ESTÁCIO AMAPÁ)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DO AMAZONAS - ESTÁCIO AMAZONAS (ESTÁCIO AMAZONAS)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DO PANTANAL (ESTÁCIO FAPAN)',
        590,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DO PARÁ - ESTÁCIO FAP (ESTÁCIO FAP)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO DO RIO GRANDE DO SUL - ESTÁCIO FARGS (ESTÁCIO FARGS)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO MACAPÁ - ESTÁCIO MACAPÁ (ESTÁCIO MACAPÁ)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ESTÁCIO SÃO PAULO DE RONDÔNIA (ESTÁCIO FSP)',
        503,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ESTRATEGO (ESTRATEGO)', 79, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EUGÊNIO GOMES (FEG)', 591, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EUROPÉIA DE TECNOLOGIA E CIÊNCIAS HUMANAS - EUROTECH (EUROTECH)',
        132,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EUROPÉIA DE VITÓRIA (FAEV)',
        389,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA DE CERES (FACER)',
        592,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA DE GOIANÉSIA (FACEG)',
        593,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA DE JARAGUÁ (FEJA)',
        594,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA DE RUBIATABA (FER)',
        595,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA DE SALVADOR (FACESA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EVANGÉLICA DE SÃO PAULO', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA DE SENADOR CANEDO (FESCAN)',
        538,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA DE TECNOLOGIA, CIÊNCIAS E BIOTECNOLOGIA DA CGADB (FAECAD)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA DO MEIO NORTE (FAEME)',
        596,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA MACKENZIE DO PARANÁ (FEMPAR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVANGÉLICA RAÍZES (RAÍZES)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EVOLUÇÃO (FAEV)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EVOLUÇÃO ALTO OESTE POTIGUAR (FACEP)',
        597,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE EVOLUIR (FAEV)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE EXATA EDUCACIONAL (FEE)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FABAD (FABAD)', 162, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FACCAT (FACCAT)', 354, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FACIENCIA (FACIENCIA)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FACMIL', 114, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FACTUM (FACTUM)', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FACUMINAS DE PÓS-GRADUAÇÃO EAD (FACUMINAS EAD)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FADAM (FADAM)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FADAM DE MARACANAÚ (FADAM)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FAIPE', 203, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FAMART', 598, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FAMEP - UNIDADE PARAMBU - CE (FAMEP)',
        599,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FAMERCOSUL (FSUL)', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FANORPI BANDEIRANTES (FANORPI)',
        600,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FAPAF (FAPAF)', 601, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FARUS (FARUS)', 488, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FASIPE CUIABÁ (FFC)', 203, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FASIPE DE PRIMAVERA (FFP)',
        285,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FASIPE DE RONDONÓPOLIS (FFR)',
        287,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FASIPE DE SORRISO (FFS)',
        292,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FASIPE DF (FACDF)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FASIPE MATO GROSSO (FFMT)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FASIPE PANTANAL (FASIPE)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FASUP (FASUP)', 175, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FATIFAJAR JAGUARIAÍVA (FAJAR)',
        602,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FAVENI GUARULHOS (FAVENI - GUARULHOS)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FAVOO COOP', 355, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FECOMERCIO RORAIMA (FACORR)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FEITEP (FEITEP)', 76, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FERNANDA BICCHIERI', 1, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FERNÃO DIAS (FAFE)', 158, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FIA DE ADMINISTRAÇÃO E NEGÓCIOS (FFIA)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FIDELIS (FF)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FIGUEIREDO COSTA - FIC', 73, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FILADELFIA DE TECNOLOGIA (FAFILTEC)',
        345,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FILOS', 603, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FINACI (FINACI)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FINOM DE PATOS DE MINAS (FINOM)',
        112,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FIPECAFI (FIPECAFI)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FISEPE (FISEPE)', 282, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FLAMINGO', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FLEMING CERQUILHO (FAC CERQUILHO)',
        604,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FLEMING DE OSASCO (A. FLEMING)',
        158,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FOCUS (FOCUS)', 54, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FOZ DO IGUAÇU (FAFIG)', 124, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FRACTAL (FRACTAL)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FRAGA DE INTEGRAÇÃO DA CULTURA EDUCAÇÃO E PESQUISA (FICEPE)',
        605,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FRASSINETTI DO RECIFE (FAFIRE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE FREIRE DE ENSINO (FFE)',
        540,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FUCAPE (FUCAPE)', 25, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FUNORTE DE JANAÚBA', 407, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FUNORTE DE JANUÁRIA', 606, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE FUTURA', 10, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE G8 (FG8)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE GALILEU (FG)', 383, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE GARÇA BRANCA PANTANAL (FGB)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE GENNARI E PEARTREE (FGP)',
        607,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE GEORGINA (FAGEO)', 608, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE GIANNA BERETTA', 141, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE GIL GAL (GILGAL)', 609, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE GRAN TIETÊ (FGT)', 531, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE GRAU S ENSINO SUPERIOR (GRAU)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE GUARAÍ (FAG)', 610, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE GUARAPUAVA (FG)', 64, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE GUERRA (FAG)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE GUILHERME GUIMBALA (FGG)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE HÉLIO ROCHA (FHR)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE HERRERO (FATEC)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE HOLÍSTICA (FAHOL)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE HONPAR', 611, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE HORIZONTE (FACHORIZONTE)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE HORIZONTINA (FAHOR)', 612, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE HOSPITAL SÃO PAULO DE MURIAÉ (FAMEHSP)',
        154,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IBAM', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IBECO (IBECO)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IBERO AMERICANA DE SÃO PAULO (FIASP)',
        613,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IBG (IBG)', 287, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IBGEN', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IBIAPABA', 235, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IBMEC (IBMEC)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IBMEC DE BRASÍLIA (IBMEC BRASÍLIA)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IBMEC SÃO PAULO (IBMEC SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IBRA DA GRANDE SÃO PAULO (FACULDADE FAGRAN)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IBRA DE BRASÍLIA (FACULDADE FABRAS)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IBRA DE MINAS GERAIS (FACULDADE FIBMG)',
        268,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IBRA DE TECNOLOGIA (FACULDADE FITEC)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IBRA DOS VALES (FACULDADE FADIVALES)',
        273,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IBS (IBS)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ICESP (ICESP)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ICTQ/PGE (ICTQ/PGE)', 264, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IDD (IDD)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IDEAL WYDEN (FACI WYDEN)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IDEAU DE BAGÉ (IDEAU)', 86, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IDEAU DE CAXIAS DO SUL (IDEAU)',
        87,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IDEAU DE PASSO FUNDO (IDEAU)',
        282,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IDOR DE CIÊNCIAS MÉDICAS (FACULDADE IDOR)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ILAPEO (ILAPEO)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IMEPAC DE ITUMBIARA (IMEPAC ITUMBIAR)',
        234,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IMES (IMES)', 265, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IMESP MONITOR (IMESP)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IMPACTA (IMPACTA)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IMPACTO', 73, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IMPACTO DE PORANGATU (FIP)',
        614,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IMPACTOS - FACI (FACI)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INBEC (INBEC)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INDEPENDENTE DO NORDESTE (FAINOR)',
        37,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INESP - INSTITUTO NACIONAL DE ENSINO E PESQUISA (INESP)',
        273,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INNOVARE (FACINN)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INNOVATE DE ANÁPOLIS (INNOVATE)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INOVA MAIS DE SÃO PAULO (FIMSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INPG DE BLUMENAU (FACINPG)',
        193,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INPRO (FACINPRO)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INSPIRAR (INSPIRAR)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INSTED', 48, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INSTITUTO BRASILEIRO DE ENSINO (FACIBE)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INSTITUTO DE ENSINO SUPERIOR (FACIES)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INSTITUTO PAULISTA DE ENSINO (FIPEN)',
        158,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INSTITUTO RIO DE JANEIRO (FIURJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INSTITUTO SUPERIOR DE EDUCAÇÃO DO PARANÁ - FAINSEP (FAINSEP)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INTEGRAÇÃO (FI)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA CARAJÁS (FIC)',
        452,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA CESUMAR DE CURITIBA (CESUMAR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INTEGRADA CETE (FIC)', 483, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA DA AMAZÔNIA (FINAMA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA DAS CATARATAS EJOVEM (EJOVEM)',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA DE ADVOCACIA DA AMAZÔNIA (FINAMA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA DE GESTÃO E MEIO AMBIENTE (FACIGMA)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA DE PALMEIRAS DE GOIÁS (FAI)',
        490,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA DE SANTA MARIA (FISMA)',
        417,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA DE TAUBATÉ (FACULDADE FITAU)',
        33,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRADA INSTITUTO SOUZA (FASOUZA)',
        268,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRAL CANTAREIRA (F.I.C.)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTEGRAL DE JABOATÃO DOS GUARARAPES (FIJ)',
        132,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTELLECTUS (FACINTEL)',
        176,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERAMERICANA DE PORTO VELHO (UNIRON)',
        51,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERATIVA DE SÃO PAULO (FAISP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERCONTINENTAL (FAICON)',
        299,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERCULTURAL DA AMAZONIA (FIAMA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERMUNICIPAL DO NOROESTE DO PARANÁ (FACINOR)',
        615,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERNACIONAL CIDADE VIVA',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERNACIONAL DA PARAÍBA (FPB)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERNACIONAL DE SÃO LUÍS (ISL)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INTERNACIONAL DE SÃO PAULO (FINSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INTERVALE (INTERVALE)', 616, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INTESP (INTESP)', 617, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE INVEST DE CIÊNCIAS E TECNOLOGIA (INVEST)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE INVICTUS (FIRP)', 114, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE IPEMED DE CIÊNCIAS MÉDICAS (IPEMED)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IPESSP (IPESSP)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE IRECÊ (FAI)', 245, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ISAE BRASIL (ISAE)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ISEIB DE BELO HORIZONTE (FIBH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ISEIB DE BETIM (FISBE)',
        198,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ISMD (ISMD)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ISRAELITA DE CIÊNCIAS DA SAÚDE ALBERT EINSTEIN (FICSAE)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ITA EDUCACIONAL PAULISTA',
        531,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ITANHAÉM (FAITA)', 618, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ITAPURANGA', 619, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ITAQUÁ (UNEITAQUÁ)', 526, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ITATAIA (FACIT)', 620, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ITEANA DE BOTUCATU (FITB)',
        383,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ITEC', 111, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ITH (ITH)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ITPAC ABAETETUBA (ITPAC ABAET)',
        227,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ITPAC BRAGANÇA (ITPAC BRAGANÇA)',
        384,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ITPAC SANTA INES (ITPAC SANTA INÊS)',
        507,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE JAGUAR INDAIÁ (FJI)', 11, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE JARDINS (FACJARDINS)', 142, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE JESUÍTA DE FILOSOFIA E TEOLOGIA (FAJE)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE JK BRASÍLIA - RECANTO DAS EMAS (JK BSB RE)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE JK DE TECNOLOGIA (FACJK)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE JK - GUARÁ (JK)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE JK - UNIDADE I - GAMA', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE JK - UNIDADE II - GAMA', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE JOÃO PAULO II (FAJOP)', 621, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE KENNEDY DE BELO HORIZONTE (FKBH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE KENNEDY DE IPATINGA (FKIPATINGA)',
        268,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE KENNEDY DE MINAS GERAIS - FKMG (FKMG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE LABORO (LABORO)', 141, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE LA SALLE', 75, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LATINO-AMERICANA (FLAM)',
        622,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE LEGALE (LEGALE)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LEONARDO DA VINCI DE BELO HORIZONTE',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LEONARDO DA VINCI DE SÃO GONÇALO',
        623,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LEONARDO DA VINCI - SANTA CATARINA (FAVINCI)',
        624,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LIBER DE PORANGATU (FACLIBER)',
        614,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE LIFE (FACLIFE)', 625, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LIFE UNIC EDUCATION (LI)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE LIONS (FAC-LIONS)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE LOGOS (FALOG)', 626, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE LUCIANO FEIJÃO (FLF)', 167, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUIZ EDUARDO MAGALHÃES (FILEM)',
        52,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUIZ MÁRIO MOUTINHO (FLMM)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUSITANA DE PERNAMBUCO (FALUP)',
        627,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUSO-BRASILEIRA (FALUB)',
        627,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUSÓFONA DA BAHIA (FL-BA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUSÓFONA DE SÃO PAULO (FL-SP)',
        520,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUSÓFONA DO RIO DE JANEIRO (FL-RJ)',
        623,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUTERANA DE TEOLOGIA (FLT)',
        546,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE LUTERANA SÃO MARCOS (FALSM)',
        263,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MACÊDO DE AMORIM (FAMAM)',
        90,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MACHADO DE ASSIS (FAMA)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MACHADO SOBRINHO (FMS)', 38, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MADALENA SOFIA (FMS)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MADRE TEREZA (FAMAT)', 628, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MADRE THAIS (FMT)', 20, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MAIS DE ITUIUTABA (FACMAIS)',
        629,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MALTA (FACMA)', 27, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MARANATHA (FAMAH)', 27, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MARANHENSE (FAM)', 630, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MARANHENSE SÃO JOSÉ DOS COCAIS (FSJ)',
        456,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MARECHAL RONDON', 355, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MARECHAL RONDON (FMR)', 631, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MARECHAL RONDON DE BAURU (FMR-BAURU)',
        93,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MARECHAL RONDON DE GUARULHOS (FMR-GUARULHOS)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MARECHAL RONDON DE MAUÁ (FMR-MAUÁ)',
        480,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MARIA THEREZA (FAMATH)', 49, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MARINGÁ (CESPAR)', 76, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MÁRIO QUINTANA (FAMAQUI)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MARQUÊS DE OLINDA (FMO)',
        127,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MARTHA FALCÃO WYDEN (FMF WYDEN)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MASTER DE PARAUAPEBAS - FAMAP (FAMAP)',
        281,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MASTER DO PARÁ - FAMAP TUCUMÃ (FAMAP)',
        632,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MASTER DO PARÁ - FAMAP XINGUARA (FAMAP)',
        633,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MATO GROSSO DO SUL (FACSUL)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MAUÁ DE GOIÁS', 603, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MAURÍCIO DE NASSAU DE IMPETRATRIZ (FMN IMPERATRIZ)',
        267,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MAURÍCIO DE NASSAU SERRA TALHADA (FMN SERRA)',
        398,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE M-EDUCAR (FAMED)', 634, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MEGA (MEGA)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MÉLIÈS (MÉLIÈS)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MENINO DEUS (FAMED)', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MENNA BARRETO (FMB)', 206, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MERIDIONAL (IMED)', 282, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MERIDIONAL DE IJUÍ (IMED)',
        311,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MERIDIONAL DE PORTO ALEGRE (IMED)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MERIDIONAL RS (IMED )', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MESSIANICA', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METODISTA CENTENÁRIO (FMC)',
        417,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METODISTA CONEXIONAL (FACO)',
        467,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METODISTA DE CIÊNCIAS HUMANAS E EXATAS (METODISTA)',
        313,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METODISTA GRANBERY (FMG)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MÉTODO DE SÃO PAULO (FAMESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE METROPOLITANA (UNNESA)', 51, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DA GRANDE RECIFE (UNESJ)',
        132,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE ANÁPOLIS (FAMA)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE CIENCIAS E TECNOLOGIA (FAMEC)',
        537,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE COARI (FAMETRO)',
        635,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE DIAS D''ÀVILA (FACD''ÀVILA)',
        636,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE FLORIANÓPOLIS (FAMEFLORIPA)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE FRANCA (FAMEF)',
        179,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE HORIZONTE (FMH)',
        525,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE ITACOATIARA (FAMETRO)',
        637,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE ITAJAÍ (FIMT)',
        345,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE JOINVILLE (FAMEVILLE)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE LAGES (FAMELAGES)',
        148,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE PALHOÇA (FAMEPALHOÇA)',
        544,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE PARINTINS (FAMETRO)',
        638,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE RIO DO SUL (FAMESUL)',
        183,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE TEFÉ (FAMETRO)',
        639,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DE TERESINA',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DO CARIRI (FAMEC)',
        310,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DO CEARÁ (FAMEC)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DO ESTADO DE SÃO PAULO (FAMEESP)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DO MARAJÓ (FAMMA)',
        640,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DO PARÁ (FAMETRO)',
        78,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA DO PLANALTO NORTE (FAMEPLAN)',
        358,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA NORTE RIOGRANDENSE (FAMEN)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE METROPOLITANA SÃO CARLOS BJI (FAMESC-BJI)',
        448,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MICROLINS (FAMIC)', 181, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MILTON CAMPOS (FMC)', 481, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MINAS GERAIS (FAMIG)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MIRIENSE', 641, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MODAL (MODAL)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MODELO (FACIMOD)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MOGIANA (FAMOGI)', 642, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MOGIANA DO ESTADO DE SÃO PAULO (FMG)',
        279,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MONSENHOR HIPOLITO (FMH)',
        643,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MONTE PASCOAL (FMP)', 644, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MONTES CLAROS (FACULMONTES)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MONTESSORIANO DE SALVADOR (FAMA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MORGANA POTRICH (FAMP)',
        109,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MORUMBI (FAMOR)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MOZARTEUM DE SÃO PAULO (FAMOSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVERSA (MULTIVERSA)',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVERSA DE FORTALEZA',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVERSA DE PALOTINA (MULTIVERSA)',
        645,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVERSA DE TECNOLOGIA',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVIX CARIACICA (MULTIVIX CARIAC)',
        389,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVIX DE CACHOEIRO (MULTIVIX CACHOEIRO)',
        190,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVIX NOVA VENÉCIA (MULTIVIX NOVA VENÉCI)',
        646,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVIX SÃO MATEUS (MULTIVIX SÃO MATEUS)',
        216,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVIX SERRA (MULTIVIX SERRA)',
        290,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MULTIVIX VILA VELHA (MULTIVIX VILA V)',
        226,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MUNICIPAL DE EDUCAÇÃO E MEIO AMBIENTE (FAMA)',
        647,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MUNICIPAL DE PALHOÇA (FMP)',
        544,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE MUNICIPAL PROFESSOR FRANCO MONTORO DE MOGI GUAÇU (FMPFM)',
        279,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE MURIALDO (FAMUR)', 87, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NACIONAL (FANAC)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NACIONAL DE NATUROPATIA ADMINISTRAÇÃO E PEDAGOGIA (FANNAP)',
        541,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NAZARENA DO BRASIL (FNB)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NETCOM (FANET)', 141, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NETWORK (NWK)', 648, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NIP DE CIÊNCIAS APLICADAS (FANIP)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NOROESTE (FAN)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NORTE E NORDESTE DO BRASIL (FANOR - BRASIL)',
        649,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NORTE-SUL (FANS)', 183, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOSSA SENHORA APARECIDA (FNSA)',
        98,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOSSA SENHORA DA CONCEIÇÃO (FSC)',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOSSA SENHORA DE FÁTIMA (FACULDADE FÁTIMA)',
        87,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOSSA SENHORA DE LOURDES (FNSL)',
        308,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NOVA ROMA (FNR)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVA ROMA CARUARU (FNR CARUARU)',
        156,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVA ROMA DE CAMPO GRANDE (FNR - CAMPO GRANDE)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVE DE JULHO DE BAURU (NOVE-BAURU)',
        93,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVE DE JULHO DE BOTUCATU (NOVE-BOTUCATU)',
        383,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVE DE JULHO DE OSASCO (NOVE-OSASCO)',
        158,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVE DE JULHO DE SÃO BERNARDO DO CAMPO (NOVE-SBC)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVE DE JULHO GUARULHOS (NOVE-GUARULHOS)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVE DE JULHO MAUÁ (NOVE_MAUÁ)',
        480,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NOVOESTE (NOVOESTE)', 48, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVO HAMBURGO (FACULDADE IENH)',
        541,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NOVO HORIZONTE (FNH)', 90, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE NOVO HORIZONTE DE IPOJUCA (FNH)',
        650,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE NOVO MILÊNIO (FNM)', 226, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE OLGA METTIG (FAMETTIG)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE ONE LEARNING', 566, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE OPUS 365', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ORÍGENES LESSA (FACOL)',
        651,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PADRÃO (PADRAO)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PADRÃO (-)', 41, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PADRAO DE SENADOR CANEDO (FAPSC)',
        538,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PAIVA ANDRADE (FPA)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PALOTINA (FAPAS)', 417, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PAN AMAZÔNICA (FAPAN)', 79, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PAN AMERICANA (FPA)', 652, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PAN-AMERICANA DE ADMINISTRAÇÃO E DIREITO (FAPAD)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PARAENSE DE ENSINO (FAPEN)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PARAÍSO ARARIPINA (FAP)',
        393,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PARAÍSO FORTALEZA (FAP)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PARANÁ (FAP)', 327, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PARANAENSE (FACCAR)', 653, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PARANAENSE (FAPAR)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PARA O DESENVOLVIMENTO SUSTENTÁVEL DA AMAZÔNIA (FADESA)',
        281,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PARQUE (FAP)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PASCHOAL DANTAS (FPD)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PASCHOAL DANTAS EAD (FPD - EAD)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PAULISTA DE ARTES (FPA)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PAULISTA DE BEM ESTAR E SAÚDE',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PAULISTA DE CIÊNCIAS DA SAÚDE (FPCS)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PAULISTA DE COMUNICAÇÃO (FEPAC)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PAULISTA DE GESTÃO E SAÚDE',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PAULISTA DE SERVIÇO SOCIAL DE SÃO CAETANO DO SUL (FAPSS)',
        126,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PAULO PICANÇO (FACPP)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PAULUS DE TECNOLOGIA E COMUNICAÇÃO (FAPCOM)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PECEGE (PECEGE)', 224, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PEDRO II (FAPE2)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PEDRO LEOPOLDO (FPL)', 654, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PENTÁGONO - FAPEN (FAPEN)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PERNAMBUCANA DE SAÚDE (FPS)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PERUIBE (FPBE)', 655, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PESTALOZZI DE FRANCA (FAPESF)',
        179,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PETRUS (FAPETRUS)', 141, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PHORTE DE EDUCAÇÃO E TECNOLOGIA',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PHYSIO CURSOS (FACPHYSIO)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PIAUIENSE DE PROCESSAMENTO DE DADOS (FPPD)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PINHALZINHO (HORUS)', 656, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PINHEIRO GUIMARÃES (FAPG)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PIO DÉCIMO (FPD)', 142, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PIO DECIMO DE CANINDE DO SAO FRANCISCO (FAPIDE)',
        657,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS ANHANGUERA DE TERESINA',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITAGORAS ANHANGUERA DE TRÊS LAGOAS',
        658,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS BACABAL MEARIM',
        659,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PITÁGORAS DE ALTAMIRA', 14, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PITÁGORAS DE BACABAL', 659, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PITÁGORAS DE BELÉM', 79, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PITÁGORAS DE BRUMADO', 660, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE CONCÓRDIA',
        350,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITAGORAS DE EUNAPOLIS (FPE)',
        587,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE IRECÊ (FPI)',
        245,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE JUIZ DE FORA (FPJF)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE LUIS EDUARDO MAGALHÃES',
        52,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE MEDICINA DE EUNÁPOLIS',
        587,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PITÁGORAS DE MOSSORÓ', 323, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE PARANAGUÁ',
        661,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE PENÁPOLIS',
        463,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE POUSO ALEGRE (FPPA)',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS DE RIO VERDE',
        202,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PITÁGORAS DE TUCURUÍ', 418, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR ANHANGUERA DE LONDRINA',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE BRUMADO',
        660,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE CALDAS NOVAS',
        387,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE CANINDÉ',
        588,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE CHAPECÓ',
        406,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE GUANAMBI (FPG)',
        157,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE ITAJUBÁ',
        103,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE JOÃO PESSOA',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE MURIAÉ',
        154,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PITÁGORAS UNOPAR DE QUIXERAMOBIM',
        500,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PLUS (PLUS)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE POLIENSINO - FP', 203, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PÓLIS CIVITAS', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE POLITÉCNICA DE CAMPINAS (POLICAMP)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE POLITÉCNICA DE CAMPO GRANDE (POLITÉCNICA)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PORTO DAS ÁGUAS (FAPAG)',
        662,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PORTO UNIÃO (FPU)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE POSITIVO LONDRINA (FPL)',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PRAIA GRANDE (FPG)', 250, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PREMIER (PREMIER)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESBITERIANA GAMMON (FAGAMMON)',
        108,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESBITERIANA MACKENZIE BRASILIA (FPMB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESBITERIANA MACKENZIE RIO',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESBITERIANA QUINZE DE NOVEMBRO',
        483,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS (FAPAC)',
        663,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE AIMORÉS',
        664,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE BAEPENDI (FAPAC BAEPENDI)',
        665,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE BARÃO DE COCAIS',
        666,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE CONSELHEIRO LAFAIETE',
        18,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE GOVERNADOR VALADARES (FAPAC - GV )',
        265,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE ITABIRITO',
        261,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE ITANHANDU (FAPACI)',
        667,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE LAMBARI (FAPAC LAMBARI)',
        668,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE LEOPOLDINA',
        669,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE MARIANA (FAPAM)',
        238,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE NOVA LIMA',
        481,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE PONTE NOVA',
        550,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE SABARÁ (FUNEES SABARÁ)',
        505,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE SÃO JOÃO NEPOMUCENO',
        670,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE TEÓFILO OTONI',
        7,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBÁ',
        163,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBERABA',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE UBERLÂNDIA',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE ANTÔNIO CARLOS DE VISCONDE DO RIO BRANCO',
        671,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRESIDENTE DUTRA (FAP)',
        672,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PRIME (FAPRIME)', 48, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRIMEIRO DE JANEIRO (FPJ)',
        673,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PRIMUM (PRIMUM)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRINCESA DO OESTE (FPO)',
        673,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PRISMA DE APUCARANA (FPA)',
        377,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PROFESSOR DALTRO', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROFESSOR MIGUEL ÂNGELO DA SILVA SANTOS (FEMASS)',
        325,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PROFISSIONAL (FAPRO)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROF. LUÍZ MÁRIO D''AVILA (FADAVILA)',
        80,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROF. WLADEMIR DOS SANTOS (WLASAN)',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PROGRESSO (FAP)', 100, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROJEÇÃO DE CEILÂNDIA (FAPRO)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROJEÇÃO DE SOBRADINHO (FAPRO)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROJEÇÃO DE TAGUATINGA NORTE (FAPRO)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PROJEÇÃO DO GUARÁ', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMINAS DE CONTAGEM (PROMINAS)',
        200,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMINAS DE MONTES CLAROS (PROMINAS)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMINAS DE TIMÓTEO (PROMINAS)',
        352,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PROMOVE DE ALFENAS', 674, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMOVE DE BELO HORIZONTE (PROMOVE)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMOVE DE CURVELO (FACURVELO)',
        301,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMOVE DE MINAS GERAIS (PROMOVE)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMOVE DE SÃO PAULO (FPSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMOVE DE SETE LAGOAS (FSLMG)',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE PROMOVE DE TECNOLOGIA (FPTEC)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE PSICOLOG (FAPSI)', 58, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE QI BRASIL (FAQI)', 344, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE QUALITTAS (QUALITTAS)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE QUALITTAS - EAD', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE QUIRINÓPOLIS (FAQUI)', 621, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE RACHEL DE QUEIROZ (FAQ)',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RAIMUNDO MARINHO (FRM)', 73, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE RAIMUNDO MARINHO DE PENEDO',
        492,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE REALIZA', 41, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REBOUÇAS DE CAMPINA GRANDE (FRCG)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RECONHECER (FR)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE REFIDIM (REFIDIM)', 68, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE REGES DE DRACENA', 435, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGES DE JUNQUEIRÓPOLIS',
        675,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE REGES DE OSVALDO CRUZ', 676, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE REGES DE REALEZA', 677, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGES DE RIBEIRÃO PRETO',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGES DE TUPI PAULISTA',
        678,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL DE FILOSOFIA, CIÊNCIAS E LETRAS DE CANDEIAS (FAC)',
        679,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL DE LEOPOLDINA',
        669,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL DE MINAS GERAIS (FACMINAS)',
        680,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL DE RIACHÃO DO JACUÍPE (FARJ)',
        681,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL DO AMAZONAS (FAM)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL DO CENTRO SUL DE SERGIPE (FARSUL)',
        682,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL DO JACUÍPE (FARJ)',
        403,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL JAGUARIBANA (FRJ)',
        683,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE REGIONAL PALMITOS (FAP)',
        684,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE REHAGRO (REHAGRO)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE REPUBLICANA', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RESULTADOS (FR)', 48, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RHEMA (FACUR)', 611, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RIO GUARIBAS (FARG)', 643, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RIO PARNAÍBA (FARP)', 456, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RIO SONO (RISO)', 685, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ROBERTO MIRANDA (FRM SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RODOLFO TEÓFILO (FRT)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE RUDOLF STEINER (FRS)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SABERES (SABERES)', 25, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES AGGEU MAGALHÃES (FAMA)',
        398,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SAGRADA FAMÍLIA (FASF)',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SALESIANA DE SANTA TERESA (FSST)',
        686,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SALESIANA DOM BOSCO (FSDB)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SALESIANA DO NORDESTE (FASNE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANAR (SANAR)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA CASA (FSC)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTA CASA DE BELO HORIZONTE (FSCBH)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA CRUZ (FACRUZ)', 687, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA FÉ (CESSF)', 141, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA HELENA (FSH)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA LÚCIA (FCACSL)', 642, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA LUZIA (FSL)', 507, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA MARCELINA (FASM)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTA MARCELINA MURIAÉ - FASM (FASM)',
        154,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA MARIA (FASAMP)', 688, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTANA', 242, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANT ANA (IESSA)', 188, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA RITA (FASAR)', 689, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTA RITA DE CÁSSIA (IFASC)',
        234,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA RITA DE CHAPECÓ', 406, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTA TERESA', 75, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTA TEREZINHA (CEST)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTISSIMA TRINDADE (FAST)',
        690,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTÍSSIMO SACRAMENTO (FSSS)',
        213,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO AGOSTINHO (FACSA)',
        691,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO AGOSTINHO DE ITABUNA (FASAI)',
        269,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO AGOSTINHO DE SETE LAGOAS (FASASETE)',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO AGOSTINHO DE VITÓRIA DA CONQUISTA (FASAVIC)',
        37,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTO ANDRÉ (FASA)', 355, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTO ANTONIO (FSA)', 213, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTO ANTÔNIO (FSA)', 692, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO ANTÔNIO DE FEIRA DE SANTANA (FSAF)',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO ANTONIO DE ITABUNA (FSAI)',
        269,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO ANTÔNIO DE PÁDUA (FASAP)',
        447,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO ANTONIO DE QUEIMADAS (FSAQ)',
        693,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SANTO ANTÔNIO - SJC (FSA)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SANTOS DUMONT (FSD)', 694, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO BASÍLIO MAGNO (FASBAM)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO BENTO DA BAHIA (FSBB)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO BENTO DO RIO DE JANEIRO (FSB/RJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO CAMILO (FASC)', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO FRANCISCO DA PARAÍBA (FASP)',
        189,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO FRANCISCO DA PARAÍBA CAMPINA GRANDE',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO FRANCISCO DE ASSIS (FSFA)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO FRANCISCO DE CAJAZEIRAS (FSF)',
        189,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO FRANCISCO DO CEARÁ (FASC)',
        332,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO FRANCISCO DO CEARÁ - CRATO (FASC)',
        310,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO FRANCISCO XAVIER (FACSFX)',
        268,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO JOAQUIM DA BARRA', 514, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO JUDAS DE GUARULHOS',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO JUDAS DE SÃO BERNARDO DO CAMPO',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO JUDAS DE TERRA BOA (FSJ)',
        695,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO JUDAS TADEU (FSJT)', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO LEOPOLDO MANDIC', 177, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO LEOPOLDO MANDIC DE ARARAS (SLMANDIC-ARARAS)',
        83,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO LEOPOLDO MANDIC DE LIMEIRA (SLM LIMEIRA)',
        276,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO LUÍS (FSL)', 94, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO LUÍS DE FRANÇA (FSLF)',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO MARCOS (FASAMAR)', 663, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO PAULO DE PRESIDENTE VENCESLAU (FASPREV)',
        498,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO SALVADOR (FSS)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO SEBASTIÃO', 530, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO TOMÁS DE AQUINO (FACESTA)',
        334,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO TOMÁS DE AQUINO DE NOVA LIMA (FACTAN)',
        481,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO TOMAZ DE AQUINO (FSTA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SÃO VICENTE (FASVIPA)', 696, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SÃO VICENTE DE IRATI (FASVI)',
        697,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SAPIENS (SAPIENS)', 51, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES ASSOCIADAS DE UBERABA - FAZU (FAZU)',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES BATISTA DO PARANÁ (FABAPAR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES DE CAMPINAS (FACAMP)', 177, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES DE CIÊNCIAS E TECNOLOGIA DO NORDESTE LTDA (FACINE)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES DE DRACENA', 435, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES DE INOVAÇÃO E TECNOLOGIA DE MINAS GERAIS (FIT MG)',
        307,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES DOCTUM DE CARATINGA (DOCTUM )',
        95,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES DOCTUM DE GUARAPARI (DOCTUM)',
        266,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES DOCTUM DE IPATINGA', 268, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES DO VALE DO ARARANGUA - FVA (FVA)',
        698,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SEB DE RIBEIRÃO PRETO (SEBRP)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SEB LAFAIETE (SEBLF)', 58, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SEBRAE', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAC BLUMENAU (SENAC)',
        193,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAC CAÇADOR (SENAC)', 699, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAC CEARA (SENACCE)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAC CHAPECÓ (SENAC)', 406, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAC CONCÓRDIA', 350, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAC CRICIÚMA (SENAC CRICIÚMA)',
        192,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAC FLORIANÓPOLIS (SENAC FLORIANÓPOLIS)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAC GOIÁS (FACSENACGO)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAC JARAGUÁ DO SUL', 31, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAC MINAS (FSM)', 200, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAC PALHOÇA (SENAC PALHOÇA)',
        544,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAC PERNAMBUCO (SENACPE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAC SÃO MIGUEL DO OESTE',
        700,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAC TUBARÃO', 701, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAI-CETIQT (SENAI-CETIQT)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAI DA PARAÍBA', 107, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAI DE CONSTRUÇÃO', 48, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAI DE TECNOLOGIA MECATRÔNICA (SENAI)',
        126,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENAI RIO', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SENAI SÃO PAULO (SENAI SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SENSU (FAS)', 42, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SEQÜENCIAL', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SERGIPANA (FASER)', 142, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SERRA DA MESA (FASEM)', 702, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SERRA DO CARMO (FASEC)', 23, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SERRA DOURADA', 14, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SERRA GERAL (FASG)', 407, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SESI-SP DE EDUCAÇÃO (FASESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES EST (EST)', 703, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SETE LAGOAS (FACSETE)', 24, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES EVANGÉLICAS INTEGRADAS CANTARES DE SALOMÃO (FEICS)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES FAMEP (FAMEP)', 704, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES FAMEP UNIDADE EUCLIDES DA CUNHA - BA (FAMEP)',
        705,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES FAMEP UNIDADE FORTALEZA CE (FAMEP)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES FAMEP UNIDADE IRARÁ - BA (FAMEP)',
        706,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES FAMEP UNIDADE LAGO DA PEDRA - MA (FAMEP)',
        707,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES FAMEP UNIDADE PARNAÍBA - PI (FAMEP)',
        176,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES FAMEP UNIDADE TERESINA - P (FAMEP)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES FAMEP - UNIDADE URUÇUI - PI (FAMEP)',
        708,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES FATIFAJAR - FATIFAJAR ARAPOTI',
        709,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES IDAAM (IDAAM)', 75, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SIGMA (SIGMA EAD)', 710, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SILVA NETO (FASINE)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES IMPACTOS BRASIL (FACIB)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SINERGIA (SINERGIA)', 711, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SINOP (FASIP)', 155, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SINPAIN (SINPAIN)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS ADVENTISTAS DE MINAS GERAIS (FADMINAS)',
        108,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS APARÍCIO CARVALHO VILHENA (FIMCAVILHENA)',
        355,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS ASMEC (ASMEC)',
        712,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS CAMÕES (FICA)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS CAMPO-GRANDENSES (FIC)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS CAMPOS SALLES (FICS)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS CESUMAR DE ARAPONGAS (CESUMAR)',
        611,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DA AMÉRICA DO SUL (FAC INTEGRA)',
        387,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DA UPIS (UPIS)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE ARACRUZ (FAACZ)',
        321,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE ARARAQUARA (FIAR)',
        378,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE BAURU (FIB)',
        93,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE BOTUCATU',
        383,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE CASSILÂNDIA (FIC)',
        713,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE CATAGUASES (FIC)',
        366,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE CIÊNCIAS HUMANAS, SAÚDE E EDUCAÇÃO DE GUARULHOS (FG)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE DIAMANTINO (FID)',
        714,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE FERNANDÓPOLIS (FIFE)',
        309,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE GARANHUNS (FACIGA)',
        483,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE ITAPETININGA (FII)',
        271,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE JACAREPAGUÁ (FIJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE JAHU (FIJ)',
        274,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE NAVIRAÍ (FINAV)',
        715,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE PARANAÍBA - FIPAR (FIPAR)',
        716,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE PATOS (FIP)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE RONDONÓPOLIS (FAIR)',
        287,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE SAÚDE E EDUCAÇÃO DO BRASIL (FISEB)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE TAGUAÍ (FIT)',
        717,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE TAQUARA (FACCAT)',
        718,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DE TRÊS LAGOAS (AEMS)',
        658,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DO BRASIL UNIFUTURO (FACULDADE UNIFUTURO)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DO EXTREMO SUL DA BAHIA (UNESULBAHIA)',
        587,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DOM PEDRO II (DOMPEDRO)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DOS CAMPOS GERAIS (CESCAGE)',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DO SUL DE MINAS - FISMINAS',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS DO VALE DO IVAÍ',
        532,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS EINSTEIN DE LIMEIRA (FIEL)',
        276,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS ESPÍRITA (FIES)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS HÉLIO ALONSO (FACHA)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS IESGO (IESGO)',
        539,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS IPEP (FIPEP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS IPITANGA (FACIIP)',
        209,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS MACHADO DE ASSIS (FEMA)',
        719,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS MARIA IMACULADA (FIMI)',
        279,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS OSWALDO CRUZ',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS PADRÃO (FIP GUANAMBI)',
        157,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS PAULISTA (FIP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS POTENCIAL (FIP)',
        520,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS QUALIS (FIQ)',
        225,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS REGIONAIS DE AVARÉ (FIRA)',
        195,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS RIO BRANCO (FRB)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS RIO BRANCO GRANJA VIANNA (FRB-GV)',
        520,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS RUI BARBOSA (FIRB)',
        392,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS SÃO JUDAS TADEU (SJT)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS SILVA E SOUZA (FAU)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS SIMONSEN (FIS)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS SOARES DE OLIVEIRA (FISO)',
        80,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS STELLA MARIS DE ANDRADINA (FISMA)',
        392,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS URUBUPUNGÁ (FIU)',
        720,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS VALE DO RIO VERDE (FIVAR)',
        721,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS VIANNA JÚNIOR (FIVJ)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS VITAL BRAZIL (FVB)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES INTEGRADAS ZONA DA MATA (FIZM)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES IPEDE (IPEDE)', 399, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES ITECNE DE CASCAVEL (ITECNE)',
        54,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES JOÃO PAULO II (FJP)', 282, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES JOÃO PAULO II - CAMPUS PORTO ALEGRE (FJP)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES JOÃO PAULO II - PELOTAS (FJP -PELOTAS)',
        283,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES JOÃO PAULO II - RIO GRANDE (FJP)',
        298,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SKEMA BUSINESS SCHOOL (SKEMA)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES LONDRINA', 159, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES MAGSUL (FAMAG)', 495, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES METROPOLITANAS DE CUIABÁ (FAMEC)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SNA DIGITAL (SNA DIGITAL)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES NETWORK - CAMPUS SUMARÉ',
        293,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOBERANA DE ARAPIRACA (SOBERANA)',
        333,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOBERANA DE CACHOEIRO DO ITAPEMIRIM (SOBERANA)',
        190,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOBERANA DE JACOBINA (SOBERANA)',
        244,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOCIESC DE EDUCAÇÃO DE JARAGUÁ DO SUL',
        31,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOCIESC DE EDUCAÇÃO DE SÃO BENTO DO SUL',
        546,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOCIESC DE JARAGUÁ DO SUL (SOCIESC)',
        31,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOGIPA DE EDUCAÇÃO FÍSICA',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOLIDÁRIA DE SOBRADINHO (FASOL)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SOLIDARIA DO OESTE PAULISTA (FASOL)',
        50,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES OSWALDO CRUZ (FOC)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES PEQUENO PRÍNCIPE (FPP)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES PLANALTO CENTRAL (FPC)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES REUNIDAS DA ASCE (FRASCE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADES SULAMÉRICA BAHIA', 52, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE STBNB', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE STELLA MARIS - FSM (FSM)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SUCESSO (FAS)', 722, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SUCESSO (FACSU)', 723, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SUDAMÉRICA (SUDAMÉRICA)',
        366,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SUDOESTE (FASU)', 37, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SULAMÉRICA BRASÍLIA', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SUL DA AMÉRICA (SULDAMÉRICA)',
        41,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SUL FLUMINENSE (FASF)', 123, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SUL PAULISTA DE ITANHAÉM (FASUPI)',
        618,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES UNIDAS DE PESQUISA, CIÊNCIAS E SAÚDE LTDA (FAPEC)',
        275,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES UNIFICADAS DE CATAGUASES (FUC)',
        366,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES UNIFICADAS DE FOZ DO IGUAÇU (UNIFOZ)',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES UNIFICADAS DE IÚNA (FUI)',
        724,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES UNIFICADAS DE LEOPOLDINA (FUL)',
        669,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE SUPREMO (SUPREMO)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE SUPREMO REDENTOR (FACSUR)',
        688,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADES VALE DO PIANCÓ (FAVAP)',
        725,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TECNOLOGICA ANTHROPOS (FATAN)',
        235,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TECNOLÓGICA DE LIMOEIRO DO NORTE: LADISLAU PEREIRA (FTLN)',
        726,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TECNOLÓGICA DENTAL CEEO (ESD-CEEO)',
        727,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TECNOLÓGICA DE PERNAMBUCO (FATEPE)',
        39,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TECNOLÓGICA FALCÃO (FTF)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TECNOLÓGICA INAP (FAT- INAP)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TECNOLÓGICA LATINO AMERICANA (FATLA)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE TECSOMA (FATEC)', 55, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TELOS DE CAMPINAS (FATELOS)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TEOLÓGICA BATISTA DE BRASÍLIA (FTBB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TEOLÓGICA BATISTA DE SÃO PAULO (FTBSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TEOLÓGICA BATISTA EQUATORIAL (FATEBE)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TEOLÓGICA BETÂNIA (FATEBE)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TEOLÓGICA DE CIÊNCIAS HUMANAS E SOCIAIS LOGOS (FAETEL)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TEOLÓGICA SUL AMERICANA (FTSA)',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE TERCEIRA VISÃO (F3V)', 473, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE TERRA BRASILIS', 728, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TERRA NORDESTE (FATENE)',
        534,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE TERZIUS (TERZIUS)', 177, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TIRADENTES DE GOIANA (FITS)',
        400,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TIRADENTES DE JABOATÃO DOS GUARARAPES',
        132,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE TRÊS DE MAIO (SETREM)', 729, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE TRÊS MARIAS (FTM)', 107, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE TRÊS PONTAS (FATEP)', 730, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TRILÓGICA KEPPE & PACHECO (KEPPE & PACHECO)',
        731,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE TRILÓGICA NOSSA SENHORA DE TODOS OS POVOS (FATRI EAD)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE TUCURUÍ (FATUC)', 418, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UBERLANDENSE DE NÚCLEOS INTEGRADOS DE ENSINO, SERVIÇO SOCIAL E APRENDIZAGEM (FAESSA)',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UBS (FACULDADE UBS)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UMFG (UMFG)', 732, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNA DE CONSELHEIRO LAFAIETE',
        18,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNA DE DIVINÓPOLIS (UNA DIVINOPOLIS)',
        19,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNA DE ITABIRA (UNA)', 161, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNA DE ITUMBIARA', 234, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNA DE JATAÍ (UNA)', 21, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNA DE POUSO ALEGRE (UNA POUSOALEGRE)',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNA DE SETE LAGOAS (UNASET)',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNESC-UNAMA', 51, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNEX (UNEX)', 308, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIABA (FAC UNIABA)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIÃO ARARUAMA DE ENSINO S/S LTDA. (FAC-UNILAGOS)',
        733,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIÃO CULTURAL DO ESTADO DE SÃO PAULO (UCESP)',
        197,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIÃO DE CAMPO MOURÃO', 168, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIÃO DE GOYAZES FORMOSA (FUG)',
        539,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIÃO PAULISTANA (FAUP)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIATENEU (FATE)', 734, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIAVAN RIO DO SUL (UNIAVAN)',
        183,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIBF', 735, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIBRAS DA BAHIA (FACBRAS)',
        533,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIBRAS DO MARANHÃO (FACBRAS)',
        507,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIBRAS DO MATO GROSSO (FACBRAS)',
        736,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIBRAS DO NORTE GOIANO (FACBRAS)',
        614,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIBRAS DO PARÁ (FACBRAS)',
        737,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIBRASÍLIA (BRASÍLIA)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIBRASÍLIA DE CIÊNCIAS ECONÔMICAS DE MINAS GERAIS (BRASÍLIA)',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIBRASÍLIA DE MINAS GERAIS (BRASÍLIA)',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIBRASÍLIA SUL (BRASÍLIA)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ÚNICA DE FORMAÇÃO E ENSINO (FUNIFE)',
        738,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ÚNICA DE IPATINGA (FUNIP)',
        268,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNICENTRAL', 739, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNICESUMAR DE CORUMBÁ', 686, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNICPO (FACULDADE UNICPO)',
        299,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIDA DE CAMPINAS GOIÂNIA - FACUNICAMPS GOIÂNIA (FACUNICAMPS)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIDA DE SÃO PAULO (FAUSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIDA DE SÃO PAULO - EAD (FAUSP - EAD)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIDA DE VITÓRIA (FACULDADE UNIDA)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIEDUCAR', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIFAEL CURITIBA (FAEL CURITIBA)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIFAEL PORTO ALEGRE (FAEL POA)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIFAHE', 740, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIFAMETRO CASCAVEL', 741, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIFAMETRO MARACANAÚ', 335, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIFICADA DO ESTADO DE SÃO PAULO (FAUESP - ONLINE)',
        480,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIFICADA DO ESTADO DE SÃO PAULO (FAUESP)',
        480,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIFTB', 742, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIGUAÇU (FAC UNIGUAÇU)',
        743,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIMED', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIME DE CIÊNCIAS EXATAS E TECNOLÓGICAS (FCT)',
        209,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIME DE CIÊNCIAS JURÍDICAS (FCJ)',
        209,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIME DE CIÊNCIAS SOCIAIS (FCS)',
        209,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIME DE EDUCAÇÃO E COMUNICAÇÃO (FEC)',
        209,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINA', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINABUCO SÃO LOURENÇO DA MATA',
        744,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINASSAU ARAPIRACA', 333, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU BELO HORIZONTE',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU BRASÍLIA (NASSAU BRASÍLIA)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINASSAU CABO', 412, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU CUIABÁ (NASSAU CUIABÁ)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU FEIRA DE SANTANA',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU GARANHUNS (NASSAU GARANHUNS)',
        483,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU JABOATÃO DOS GUARARAPES (UNINASSAU)',
        132,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU LAURO DE FREITAS',
        209,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINASSAU MARACANAÚ', 335, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINASSAU MOSSORÓ', 323, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU OLINDA - NASSAU OLINDA',
        39,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU PALMAS (NASSAU PALMAS)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINASSAU PARNAMIRIM', 537, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINASSAU PETROLINA', 445, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINASSAU SOBRAL', 167, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINASSAU VILHENA', 355, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINASSAU VITÓRIA DA CONQUISTA',
        37,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE - UNINORTE ALTAMIRA', 14, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE - UNINORTE BARCARENA', 745, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINORTE MARABÁ (UNINORTE MARABÁ)',
        46,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINORTE TAILÂNDIA (UNINORTE)',
        442,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINTA FORTALEZA', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNINTA FORTALEZA - GESTÃO E NEGÓCIOS',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINTA IGUATU', 332, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNINTA TIANGUA', 235, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNÍNTESE', 348, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - ALAGOAS (F. UNIRB)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - ARACAJU (F. UNIRB)',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - ARAPIRACA (F. UNIRB)',
        333,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - BARREIRAS (F. UNIRB)',
        174,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - CAMAÇARI (FACULDADE UNIRB)',
        153,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIRB CEARÁ (F.CEARÁ)', 45, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - CIDADE DE FORTALEZA (F. UNIRB)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - FEIRA DE SANTANA (F. UNIRB)',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - FORTALEZA (F. UNIRB)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB JOÃO PESSOA (F.UNIRB)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - JUAZEIRO (FACULDADE UNIRB)',
        533,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - MACEIO (FACULDADE UNIRB)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - MOSSORÓ (F. UNIRB)',
        323,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - NATAL (F. UNIRB)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - PARNAÍBA (F. UNIRB)',
        176,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB PARNAMIRIM (F.UNIRB)',
        537,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - PIAUÍ (F. UNIRB)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - SALVADOR (FACULDADE UNIRB)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - SERRINHA (FACULDADE UNIRB)',
        746,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIRB - TERESINA (F. UNIRB)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIRIO', 51, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNISE', 342, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIS POUSO ALEGRE', 230, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIS SÃO LOURENÇO', 511, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNISUL DE BALNEÁRIO CAMBORIÚ',
        57,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNISUL DE EDUCAÇÃO DE ITAJAÍ',
        345,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNISUL DE FLORIANÓPOLIS', 3, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNISUL DE ITAJAÍ', 345, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNITÀ (UNITÀ)', 177, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNITERP (FACTERP)', 114, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE CAMPO GRANDE',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE GOIÂNIA (VERITAS GOIÂNIA)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIVERITAS UNIVERSUS VERITAS DE PIRACICABA (UNIVERITAS PCBA)',
        224,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIVERSALIS (FACSALIS)',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNIVERSO BRASÍLIA', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNIVEST DE EDUCAÇÃO (UNIVEST)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNOPAR DE CIÊNCIAS JURÍDICAS DE PETROLINA',
        445,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE UNOPAR DE CIÊNCIAS JURÍDICAS DE SETE LAGOAS',
        24,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNYLEYA', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE UNYPUBLICA', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE URIEL DE ALMEIDA LEITÃO',
        95,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VALE DO AÇO (FAVALE)', 482, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VALE DO GORUTUBA (FAVAG)',
        747,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VALE DO PAJEU (FVP)', 748, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VALE DOS CARAJÁS (FVC)',
        281,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VALE DO SORRISO (UNIVALE)',
        609,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VAN GOGH (FVG)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VANGUARDA', 144, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VASCONCELLOS & SOUZA', 749, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VENDA NOVA DO IMIGRANTE (FAVENI)',
        750,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VERBO EDUCACIONAL (VERBOEDU)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VERDE NORTE (FAVENORTE)',
        751,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VÉRTIX TRIRRIENSE (FVT)',
        420,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VIA SAPIENS (FVS)', 235, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VICENTINA - FAVI (FAVI)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VIDAL (FAVILI)', 726, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VINCIT (VINCIT)', 76, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VIRTUAL DO BRASIL (FVB)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VISCONDE DE CAIRÚ (FAVIC)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE VITÓRIA EM CRISTO (FVC)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VIVA VITÓRIA (FAVIVA)', 25, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VOLPE MIELE (FVM)', 58, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE VP (VP)', 41, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE WENCESLAU BRAZ', 103, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE WOLI', 129, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE XP EDUCAÇÃO - IGTI (XPE)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACULDADE XV DE AGOSTO (FAQ)', 752, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ZACARIAS DE GÓES (FAZAG)',
        306,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FACULDADE ZUMBI DOS PALMARES (FAZP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FACUMINAS FACULDADE (FACUMINAS)', 128, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FAE CENTRO UNIVERSITÁRIO', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FAI - CENTRO DE ENSINO SUPERIOR EM GESTÃO, TECNOLOGIA E EDUCAÇÃO',
        753,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FAJOPA - FACULDADE JOÃO PAULO II (FAJOPA)',
        145,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FANEESP - FACULDADE NACIONAL DE EDUCAÇÃO E ENSINO SUPERIOR DO PARANÁ (FANEESP)',
        206,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FASUL EDUCACIONAL EAD (FASUL EDUCACIONAL)',
        511,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FATEC ARTHUR AZEVEDO - MOGI MIRIM (FATECMM)',
        642,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FATEC CRUZEIRO - PROF. WALDOMIRO MAY',
        229,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FATECE - FACULDADE DE TECNOLOGIA, CIÊNCIAS E EDUCAÇÃO (FATECE)',
        754,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FATEC - FACULDADE DE TEOLOGIA E CIÊNCIAS DE VOTUPORANGA (FATEC)',
        10,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FAVENORTE DE PORTEIRINHA (FAVEPORT)',
        755,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FETAC - FACULDADE DE EDUCAÇÃO, TECNOLOGIA E ADMINISTRAÇÃO DE CAARAPÓ (FETAC)',
        756,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FG FACULDADE GLOBAL (FG)', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FGV / ESCOLA DE RELAÇÕES INTERNACIONAIS (FGV/RI)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FIAM-FAAM - CENTRO UNIVERSITÁRIO (UNIFIAM-FAAM)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FIAP - CENTRO UNIVERSITÁRIO', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FIEP - FACULDADE INTERNACIONAL DE EVOLUÇÃO PROFISSIONAL (FIEP)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FI - FACULDADE IGUAÇU (FI)', 757, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FIP - FACULDADE DE IPORÃ PARANÁ (FIP)',
        758,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FOCCA - FACULDADE DE OLINDA (FOCCA)',
        39,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FORMAÇÃO FACULDADE INTEGRADA (FFI)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FRANKLINCOVEY BUSINESS SCHOOL (FCBS)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FTRB - FACULDADE TEOLÓGICA REFORMADA DE BRASÍLIA',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FUNDAÇÃO DOM CABRAL', 481, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO DOM CABRAL - ENSINO SUPERIOR (FDC)',
        481,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO ESCOLA LINCE KEMPIM (FELK)',
        759,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO FACULDADE DE FILOSOFIA, CIÊNCIAS E LETRAS DE MANDAGUARI (FAFIMAN)',
        760,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO FACULDADE PARA AS ARTES, EDUCAÇÃO E COMUNICAÇÃO (FUNDAEC)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('FUNDAÇÃO OSWALDO CRUZ (FIOCRUZ)', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE DO ESTADO DE SANTA CATARINA (UDESC)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE FEDERAL DA GRANDE DOURADOS (UFGD)',
        84,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE FEDERAL DE CIÊNCIAS DA SAÚDE DE PORTO ALEGRE (UFCSPA)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE FEDERAL DE RONDÔNIA (UNIR)',
        51,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE FEDERAL DO ABC (UFABC)',
        47,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE FEDERAL DO PAMPA - UNIPAMPA (UNIPAMPA)',
        86,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE FEDERAL DO TOCANTINS (UFT)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE FEDERAL DO VALE DO SÃO FRANCISCO (UNIVASF)',
        445,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNDAÇÃO UNIVERSIDADE VIRTUAL DO ESTADO DE SÃO PAULO (UNIVESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'FUNVIC - FACULDADE FUNVIC DE MOCOCA',
        528,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('GAIA (GAIA)', 146, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('GRAN CENTRO UNIVERSITÁRIO (GRAN)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('GRUPO DE NUTRIÇÃO HUMANA (GANEP)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'IBPTECH FACULDADE DE CIÊNCIAS FORENSES E TECNOLOGIA',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ICEV - INSTITUTO DE ENSINO SUPERIOR',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ILUM ESCOLA DE CIÊNCIA', 177, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSIDE - INSTITUTO SUPERIOR PARA INTEGRAÇÃO, DESENVOLVIMENTO E EDUCAÇÃO (INSIDE)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSPER INSTITUTO DE ENSINO E PESQUISA',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUIÇÃO DE ENSINO SUPERIOR DE CACOAL (FANORTE CACOAL)',
        115,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO AMAZÔNICO DE ENSINO SUPERIOR (IAMES)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO APHONSIANO DE ENSINO SUPERIOR (IAESUP)',
        164,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('INSTITUTO ARIA', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO BELO HORIZONTE DE ENSINO SUPERIOR (IBHES)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO BRASIL DE ENSINO SUPERIOR (IBRAS)',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO BRASILEIRO DE COACHING (IBC)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO BRASILEIRO DE ENSINO, DESENVOLVIMENTO E PESQUISA DE BRASÍLIA (IDP-BSB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO BRASILEIRO DE ENSINO, DESENVOLVIMENTO E PESQUISA DE SÃO PAULO (IDP-SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO CATÓLICO DE ESTUDOS SUPERIORES DO PIAUÍ (ICESPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO CUIABÁ DE ENSINO E CULTURA (ICEC)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ASSISTÊNCIA MÉDICA AO SERVIDOR PÚBLICO ESTADUAL (IAMSPE)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE CIÊNCIAS SOCIAIS E HUMANAS (ICSH)',
        297,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE DESENVOLVIMENTO E APRENDIZAGEM - IDEA DIREITO (IDEA DIREITO)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE DESENVOLVIMENTO E APRENDIZAGEM - IDEA SÃO LUIZ (IDEA SÃO LUIZ)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE DESENVOLVIMENTO EDUCACIONAL (IDE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE DESENVOLVIMENTO EDUCACIONAL DA AMAZÔNIA (IDEA)',
        267,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE DESENVOLVIMENTO TECNOLÓGICO DA FGV (FGV/IDT)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE DIREITO DO NORTE - IDN MANAUS (IDN MANAUS)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO E ENSINO SUPERIOR DE CAMPINAS (IESCAMP)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO E INOVAÇÃO (IEDI)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO SUPERIOR DE POUSO ALEGRE',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO SUPERIOR E INOVAÇÃO INVENIO (INVENIO)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO SUPERIOR E INOVAÇÃO PERSONA',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCACAO SUPERIOR LATINOAMERICANO (SIGLA IESLA)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO SUPERIOR PRESIDENTE KENNEDY - CENTRO DE FORMAÇÃO DE PROFISSIONAIS DE EDUCAÇÃO (IFESP)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO SUPERIOR RAIMUNDO SÁ (IESRSA)',
        643,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO SUPERIOR UNISUL DE ITAJAÍ',
        345,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO SUPERIOR UNYAHNA DE SALVADOR (IESUS)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE EDUCAÇÃO TECNOLÓGICA EIRELI (IETEC)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO E PESQUISA DO HOSPITAL SÍRIO-LIBANÊS (IEP/HSL)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR AGOSTINIANO CASA GAIA',
        200,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR BLAURO CARDOSO DE MATTOS (FASERRA)',
        290,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR BRASILEIRO (ESB)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR CAPIXABA (IESCAPI)',
        290,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DA FUPESP (IESF)',
        113,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DA GRANDE FLORIANÓPOLIS (IESGF)',
        140,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE ALAGOAS (IESA)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE AMERICANA (IESA)',
        187,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE BAURU (IESB)',
        93,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE CUIABÁ',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE FORTALEZA (IESF)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE FOZ DO IGUAÇU (IESFI)',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE LONDRINA - INESUL (INESUL)',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE MINAS GERAIS (IESMIG)',
        761,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE OLINDA (IESO)',
        39,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE RONDÔNIA (IESUR)',
        151,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DE TERESINA (IEST)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DO AMAPÁ (IESAP)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR DO SUL DO MARANHÃO (IESMA)',
        267,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR E FORMAÇÃO AVANÇADA DE VITÓRIA (IESFAVI)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR FRANCISCANO (IESF)',
        762,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR FUCAPI (CESF)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR INTEGRADO-IESI (FENORD)',
        7,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR MATERDEI (IES-MATERDEI)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR MÚLTIPLO (IESM)',
        456,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR PLANALTO (IESPLAN)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR SANTA CECÍLIA (IESC)',
        333,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ENSINO SUPERIOR SANTO ANTÔNIO (INESA)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE ESTUDOS SUPERIORES DO MARANHÃO (IESMA)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE FILOSOFIA E TEOLOGIA DE GOIÁS (IFITEG)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE PESQUISAS, ENSINO E GESTÃO EM SAÚDE (IPGS)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE PÓS-GRADUAÇÃO E ATUALIZAÇÃO EM ODONTOLOGIA (IPENO)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('INSTITUTO DE SERRA DOURADA', 22, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DE TECNOLOGIA E LIDERANÇA (INTELI)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO DO SUL DE SANTA CATARINA',
        192,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO EDUCACIONAL DAS AMÉRICAS (IEA EDUCACIONAL)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO EDUCACIONAL MONTE PASCOAL',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO ESPERANÇA DE ENSINO SUPERIOR (IESPES)',
        78,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA BAIANO (IFBAIANO)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA CATARINENSE (IF CATARINENSE)',
        193,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DA BAHIA (IFBA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DA PARAÍBA (IFPB)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE ALAGOAS (IFAL)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIENCIA E TECNOLOGIA DE BRASILIA (IFB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE GOIÁS (IFG)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MATO GROSSO (IFMT)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MATO GROSSO DO SUL (IFMS)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE MINAS GERAIS (IFMG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE PERNAMBUCO (IFPE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO CIÊNCIA E TECNOLOGIA DE RONDÔNIA (IFRO)',
        51,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE RORAIMA (IFRR)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SANTA CATARINA (IFSC)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SÃO PAULO (IFSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DE SERGIPE (IFS)',
        142,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO ACRE (IFAC)',
        143,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO AMAPÁ (IFAP)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO AMAZONAS (IFAM)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO CEARÁ (IFCE)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO ESPÍRITO SANTO (IFES)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO MARANHÃO (IFMA)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO NORTE DE MINAS GERAIS (IFNMG)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PARÁ (IFPA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PARANÁ (IFPR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO PIAUÍ (IFPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO DE JANEIRO (IFRJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO GRANDE DO NORTE (IFRN)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO RIO GRANDE DO SUL (IFRS)',
        77,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SERTÃO PERNAMBUCANO (IF SERTÃO)',
        445,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SUDESTE DE MINAS GERAIS (IFSEMG)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SUL DE MINAS GERAIS (IF SUL DE MINAS)',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO TOCANTINS (IFTO)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO TRIÂNGULO MINEIRO (IFTM)',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA FARROUPILHA (IFFARROUPILHA)',
        417,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA FLUMINENSE (IF FLUMINENSE)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA GOIANO (IF GOIANO)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA SUL-RIO-GRANDENSE (IFSUL)',
        283,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FLORENCE DE ENSINO SUPERIOR (IFES)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO FRIBURGO DE ENSINO SUPERIOR (IFES)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO GOIANO DE DIREITO (IGD)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO INFNET RIO DE JANEIRO (INFNET)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO INTERNACIONAL DE ESTUDOS EM SAUDE (IIESAU)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO ITAPETININGANO DE ENSINO SUPERIOR (IIES)',
        271,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO LEGISLATIVO BRASILEIRO (ILB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO LEYA DE EDUCAÇÃO SUPERIOR (LEYA)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO LUTERANO DE ENSINO SUPERIOR DE ITUMBIARA (ILES)',
        234,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MACAPAENSE DE ENSINO SUPERIOR (IMMES)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MACHADENSE DE ENSINO SUPERIOR (IMES)',
        35,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MARANHENSE DE ENSINO E CULTURA (IMEC)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MATONENSE MUNICIPAL DE ENSINO SUPERIOR (IMMES)',
        278,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO METROPOLITANO DE ENSINO SUPERIOR (IMES)',
        268,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MILITAR DE ENGENHARIA (IME)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('INSTITUTO MOINHOS DE VENTO', 149, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE ASSIS (IMESA)',
        379,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE BEBEDOURO VICTÓRIO CARDASSI (IMESB)',
        208,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE CATANDUVA (IMES CATANDUVA)',
        181,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO MUNICIPAL DE ENSINO SUPERIOR DE SÃO MANUEL (IMESSM)',
        631,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO NACIONAL DE EDUCAÇÃO DE SURDOS (INES)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO NACIONAL DE ENSINO SUPERIOR E PÓS-GRADUAÇÃO PADRE GERVÁSIO (INAPÓS)',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO NACIONAL DE TELECOMUNICAÇÕES (INATEL)',
        753,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO PARAIBANO DE ENSINO RENOVADO (INPER)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO PLENITUDE EDUCAÇÃO (IPLENI)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO POLITÉCNICO DOCTUM DE VITÓRIA',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO PROFESSOR FLÁVIO VELLINI',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO RACINE DE EDUCAÇÃO SUPERIOR (RACINE)',
        278,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SALVADOR DE ENSINO E CULTURA (ISEC)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SANTO TOMÁS DE AQUINO (ISTA)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SÃO PAULO DE ESTUDOS SUPERIORES (ITESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('INSTITUTO SERRA DOURADA', 14, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SERZEDELLO CORRÊA (ISC-TCU)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SOCIESC DE JARAGUÁ DO SUL (SOCIESC)',
        31,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DA AFAC (ISAFAC)',
        49,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DA CONVENÇÃO NAC. DAS ASSEMBLEIAS DE DEUS (ISCON)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE CIÊNCIAS APLICADAS - ISCA (ISCA)',
        276,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE CIÊNCIAS DA SAÚDE CARLOS CHAGAS (IPGMCC)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE CIÊNCIAS HUMANAS E SOCIAIS ANÍSIO TEIXEIRA (ISAT)',
        623,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE CIENCIAS POLICIAIS (ISCP)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO ALBERT EINSTEIN (ISALBE)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO ALMEIDA RODRIGUES (ISEAR)',
        202,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO ANTONINO FREIRE - ISEAF (ISEAF)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO ATENEU (ISEAT)',
        226,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO CERES (ISE-CERES)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DA ZONA OESTE (ISE ZONA OESTE)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DE BARRETOS (ISEB)',
        80,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DE CAXIAS (ISEC)',
        97,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DE GOIANA (I.S.E.G.)',
        400,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DE GUARATUBA (ISEPE GUARATUBA)',
        559,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DE SÃO PAULO (SINGULARIDADES/ISESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DO CECAP (ISCECAP)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DO CENTRO EDUCACIONAL NOSSA SENHORA AUXILIADORA (ISECENSA)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DO MUNICÍPIO DE ITAPERUNA (ISEMI)',
        186,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DO RIO DE JANEIRO (ISERJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DO SERTÃO DO PAJEÚ (ISESP)',
        574,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO DO SUL DO PIAUÍ (ISESPI)',
        763,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO ELVIRA DAYRELL (ISEED)',
        578,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO IBITURUNA',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO IVOTI (ISEI)',
        764,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO OCIDENTE (OCIDEMNTE)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO PROFESSOR ALDO MUYLAERT (ISEPAM)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO PROFESSORA NAIR FORTES ABU-MERHY (ISEFOR)',
        397,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO PRÓ-SABER (ISEPS)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO SANTA CRUZ (ISED)',
        687,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE EDUCAÇÃO VERA CRUZ (ISE VERA CRUZ)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE FILOSOFIA BERTHIER (IFIBE)',
        282,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DE TECNOLOGIA EM HORTICULTURA (ISTHORTICULTURA)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DO LITORAL DO PARANÁ (ISULPAR)',
        661,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR DO MINISTERIO PUBLICO (ISMP)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO SUPERIOR E CENTRO EDUCACIONAL LUTERANO - BOM JESUS - IELUSC (BOM JESUS/IELUSC)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO TAQUARITINGUENSE DE ENSINO SUPERIOR DR. ARISTIDES DE CARVALHO SCHLOBACH (ITES)',
        517,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO TAUBATÉ DE ENSINO SUPERIOR (I.T.E.S.)',
        33,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO TECNOLÓGICO DE AERONÁUTICA (ITA)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO TECNOLÓGICO E DAS CIÊNCIAS SOCIAIS APLICADAS E DA SAÚDE DO CENTRO EDUC. N. SRª AUXILIADORA (ITCSAS/CENSA)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO TEOLÓGICO FRANCISCANO (ITF)',
        53,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO TOCANTINENSE PRESIDENTE ANTONIO CARLOS (ITPAC)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('INSTITUTO UNA DE ITABIRA (UNA)', 161, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO UNIVERSITÁRIO SÃO JUDAS DE GUARULHOS',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO UNIVERSITÁRIO SÃO JUDAS DE SÃO BERNARDO DO CAMPO',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO UNIVERSITÁRIO UNA DE CATALÃO (CATALANA)',
        17,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INSTITUTO UNIVERSITÁRIO UNA DE CONSELHEIRO LAFAIETE',
        18,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'INTERNATIONAL OROFACIAL ACADEMY RP (IOA RP)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'IPD INSTITUTO DE PROFISSIONALIZAÇÃO DIGITAL (IPD)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'IPOG - INSTITUTO DE PÓS-GRADUAÇÃO & GRADUAÇÃO (IPOG)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ISTITUTO EUROPEO DI DESIGN (IED SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'ITPAC CRUZEIRO DO SUL (ITPAC - CZ)',
        431,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ITPAC ITACOATIARA (ITPAC ITA)', 637, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('ITPAC MANACAPURU (ITPAC MANACA)', 262, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('L2 LABOR (L2 LABOR)', 765, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'LIBERTAS - FACULDADES INTEGRADAS (LIBERTAS)',
        316,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('LINK SCHOOL OF BUSINESS (LSB)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('NOVA FACULDADE (NF)', 200, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE CAMPINAS (PUC-CAMPINAS)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE GOIÁS (PUC GOIÁS)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE MINAS GERAIS (PUC MINAS)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'PONTIFÍCIA UNIVERSIDADE CATÓLICA DE SÃO PAULO (PUCSP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO PARANÁ (PUCPR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO RIO DE JANEIRO (PUC-RIO)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO RIO GRANDE DO SUL (PUCRS)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'PROFESSOR EDSON ANTÔNIO VELANO (UNIFENAS)',
        674,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'RATIO - FACULDADE TEOLÓGICA E FILOSÓFICA (RATIO)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('REAL FACULDADE DE BRASÍLIA (FU)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'SINAL FACULDADE DE CIÊNCIAS HUMANAS E SOCIAIS (SINAL)',
        143,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'SIRIUS ESCOLA SUPERIOR DE TECNOLOGIA (SIRIUS)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'SISTEMA EDUCACIONAL CORPORATIVO DA PETROBRAS',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'SISTEMAS DE ENSINO EM CIÊNCIAS E TECNOLOGIAS (SECTRAS)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'SOBERANA FACULDADE DE SAÚDE DE PETROLINA (SOBERANA)',
        445,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'SOBRESP - FACULDADE DE CIÊNCIAS DA SAÚDE (SOBRESP)',
        417,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('STRONG BUSINESS SCHOOL', 47, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('STRONG BUSINESS SCHOOL BS', 171, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'SUSTENTARE ESCOLA DE NEGÓCIOS (SUSTENTARE)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'SVT FACULDADE DE ENSINO SUPERIOR (SVT)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS (TREVISAN)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'TREVISAN ESCOLA SUPERIOR DE NEGÓCIOS- (TEN)',
        766,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UGV CENTRO UNIVERSITÁRIO', 119, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNAMA FACULDADE DA AMAZÔNIA DE BOA VISTA (UNAMA)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNAMA FACULDADE DA AMAZÔNIA DE MACAPÁ',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNAMA FACULDADE DA AMAZÔNIA DE RIO BRANCO (FMN RIO BRANCO)',
        143,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNETRI FACULDADES (UNETRI)', 767, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIÃO DAS FACULDADES DOS GRANDES LAGOS (UNILAGO)',
        114,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNICORP FACULDADES (UNICORP)', 107, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ALTO VALE DO RIO DO PEIXE (UNIARP)',
        699,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ANHANGUERA (UNIDERP)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ANHANGUERA DE SÃO PAULO (UNIAN - SP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ANHEMBI MORUMBI (UAM)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE BRASIL (UB)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CÂNDIDO MENDES (UCAM)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CASTELO BRANCO (UCB)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CATÓLICA DE BRASÍLIA (UCB)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CATÓLICA DE PELOTAS (UCPEL)',
        283,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CATÓLICA DE PERNAMBUCO (UNICAP)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CATÓLICA DE PETRÓPOLIS (UCP)',
        53,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CATÓLICA DE SANTOS (UNISANTOS)',
        171,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CATÓLICA DOM BOSCO (UCDB)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CESUMAR (UNICESUMAR)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE CEUMA (UNICEUMA)', 141, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CIDADE DE SÃO PAULO (UNICID)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE COMUNITÁRIA DA REGIÃO DE CHAPECÓ (UNOCHAPECÓ)',
        406,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE CRUZEIRO DO SUL (UNICSUL)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE DA AMAZÔNIA (UNAMA)', 79, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DA INTEGRAÇÃO INTERNACIONAL DA LUSOFONIA AFRO-BRASILEIRA (UNILAB)',
        768,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DA REGIÃO DE JOINVILLE (UNIVILLE)',
        68,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE ARARAQUARA (UNIARA)',
        378,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE DE BRASÍLIA (UNB)', 5, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE CAXIAS DO SUL (UCS)',
        87,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE CRUZ ALTA (UNICRUZ)',
        769,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE CUIABÁ (UNIC/UNIME)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE FORTALEZA (UNIFOR)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE FRANCA (UNIFRAN)',
        179,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE DE GURUPI (UNIRG)', 770, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE DE ITAÚNA (UI)', 598, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE MARÍLIA (UNIMAR)',
        145,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE MOGI DAS CRUZES (UMC)',
        62,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE PASSO FUNDO (UPF)',
        282,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE DE PERNAMBUCO (UPE)', 60, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE RIBEIRÃO PRETO (UNAERP)',
        58,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE RIO VERDE (FESURV)',
        202,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE SANTA CRUZ DO SUL (UNISC)',
        561,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE DE SÃO PAULO (USP)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE SOROCABA (UNISO)',
        146,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE DE TAUBATÉ (UNITAU)', 33, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE UBERABA (UNIUBE)',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DE VASSOURAS (UNIVASSOURAS)',
        771,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO CONTESTADO (UNC)',
        772,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO DISTRITO FEDERAL (UNDF)',
        5,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO ESTADO DA BAHIA (UNEB)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO ESTADO DE MATO GROSSO CARLOS ALBERTO REYES MALDONADO - UNEMAT (UNEMAT)',
        590,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO ESTADO DE MINAS GERAIS (UEMG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO ESTADO DO AMAPÁ (UEAP)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO ESTADO DO AMAZONAS (UEA)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO ESTADO DO PARÁ (UEPA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO (UERJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO ESTADO DO RIO GRANDE DO NORTE (UERN)',
        323,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO EXTREMO SUL CATARINENSE (UNESC)',
        192,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO GRANDE RIO PROFESSOR JOSÉ DE SOUZA HERDY (UNIGRANRIO)',
        436,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO OESTE DE SANTA CATARINA (UNOESC)',
        773,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO OESTE PAULISTA (UNOESTE)',
        50,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO PLANALTO CATARINENSE (UNIPLAC)',
        148,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO SUL DE SANTA CATARINA (UNISUL)',
        701,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO VALE DO ITAJAÍ (UNIVALI)',
        345,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO VALE DO PARAÍBA (UNIVAP)',
        144,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO VALE DO RIO DOS SINOS (UNISINOS)',
        703,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO VALE DO SAPUCAÍ (UNIVÁS)',
        230,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE DO VALE DO TAQUARI (UNIVATES)',
        774,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTÁCIO DE SÁ (UNESA)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DA PARAÍBA (UEPB)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DA REGIÃO TOCANTINA DO MARANHÃO (UEMASUL)',
        267,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE ALAGOAS - UNEAL (UNEAL)',
        333,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE CAMPINAS (UNICAMP)',
        177,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE CIÊNCIAS DA SAÚDE DE ALAGOAS - UNCISAL (UNCISAL)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE FEIRA DE SANTANA (UEFS)',
        99,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE GOIÁS (UEG)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE LONDRINA (UEL)',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE MARINGÁ (UEM)',
        76,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE MATO GROSSO DO SUL (UEMS)',
        84,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE MONTES CLAROS (UNIMONTES)',
        128,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE PONTA GROSSA (UEPG)',
        188,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE RORAIMA (UERR)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DE SANTA CRUZ (UESC)',
        20,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO CEARÁ (UECE)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO CENTRO OESTE (UNICENTRO)',
        64,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO MARANHÃO (UEMA)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO NORTE DO PARANÁ (UENP)',
        775,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO NORTE FLUMINENSE DARCY RIBEIRO (UENF)',
        160,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO OESTE DO PARANÁ (UNIOESTE)',
        54,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO PARANÁ (UNESPAR)',
        211,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO PIAUÍ (UESPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO RIO GRANDE DO SUL (UERGS)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO SUDOESTE DA BAHIA (UESB)',
        37,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL DO TOCANTINS (UNITINS)',
        23,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL PAULISTA JÚLIO DE MESQUITA FILHO (UNESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE ESTADUAL VALE DO ACARAÚ (UVA)',
        167,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE EVANGÉLICA DE GOIÁS (UNIEVANGÉLICA)',
        264,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DA BAHIA (UFBA)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DA FRONTEIRA SUL (UFFS)',
        406,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DA INTEGRAÇÃO LATINO-AMERICANA (UNILA)',
        124,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DA PARAÍBA (UFPB)',
        107,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE ALAGOAS (UFAL)',
        73,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE ALFENAS (UNIFAL-MG)',
        674,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE CAMPINA GRANDE (UFCG)',
        147,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE CATALÃO (UFCAT)',
        17,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE GOIÁS (UFG)',
        42,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE ITAJUBÁ - UNIFEI (UNIFEI)',
        103,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE JATAÍ (UFJ)',
        21,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE JUIZ DE FORA (UFJF)',
        38,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE LAVRAS (UFLA)',
        108,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE MATO GROSSO (UFMT)',
        203,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE MATO GROSSO DO SUL (UFMS)',
        48,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE MINAS GERAIS (UFMG)',
        2,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE OURO PRETO (UFOP)',
        776,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE PELOTAS (UFPEL)',
        283,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE PERNAMBUCO (UFPE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE RONDONÓPOLIS (UFR)',
        287,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE RORAIMA (UFRR)',
        138,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE SANTA CATARINA (UFSC)',
        3,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE SANTA MARIA (UFSM)',
        417,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE SÃO CARLOS (UFSCAR)',
        72,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE SÃO JOÃO DEL REI (UFSJ)',
        185,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE SÃO PAULO (UNIFESP)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE SERGIPE (UFS)',
        777,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE UBERLÂNDIA (UFU)',
        134,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DE VIÇOSA (UFV)',
        122,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO ACRE (UFAC)',
        143,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO AGRESTE DE PERNAMBUCO (UFAPE )',
        483,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO AMAPÁ (UNIFAP)',
        26,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO AMAZONAS (UFAM)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO CARIRI (UFCA)',
        135,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO CEARÁ (UFC)',
        45,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO DELTA DO PARNAIBA (UFDPAR)',
        176,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO ESPÍRITO SANTO (UFES)',
        25,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO ESTADO DO RIO DE JANEIRO (UNIRIO)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO MARANHÃO (UFMA)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO OESTE DA BAHIA (UFOB)',
        174,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO OESTE DO PARÁ (UFOPA)',
        78,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO PARÁ (UFPA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO PARANÁ (UFPR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO PIAUÍ (UFPI)',
        27,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO RECÔNCAVO DA BAHIA (UFRB)',
        172,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO RIO DE JANEIRO (UFRJ)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO RIO GRANDE (FURG)',
        298,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO RIO GRANDE DO NORTE (UFRN)',
        130,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL (UFRGS)',
        149,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO SUL DA BAHIA (UFSB)',
        269,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO SUL E SUDESTE DO PARÁ (UNIFESSPA)',
        46,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DOS VALES DO JEQUITINHONHA E MUCURI (UFVJM)',
        778,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL DO TRIÂNGULO MINEIRO (UFTM)',
        118,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL FLUMINENSE (UFF)',
        49,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL RURAL DA AMAZÔNIA (UFRA)',
        79,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL RURAL DE PERNAMBUCO (UFRPE)',
        60,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL RURAL DO RIO DE JANEIRO (UFRRJ)',
        779,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE FEDERAL RURAL DO SEMI-ÁRIDO (UFERSA)',
        323,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE FEEVALE (FEEVALE)', 541, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE FRANCISCANA (UFN)', 417, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE FUMEC (FUMEC)', 2, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE IBIRAPUERA (UNIB)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE IGUAÇU (UNIG)', 780, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE LA SALLE (UNILASALLE)',
        542,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE LUTERANA DO BRASIL (ULBRA)',
        542,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE METODISTA DE PIRACICABA (UNIMEP)',
        224,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE METODISTA DE SÃO PAULO (UMESP)',
        82,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE METROPOLITANA DE SANTOS (UNIMES)',
        171,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE MUNICIPAL DE SÃO CAETANO DO SUL (USCS)',
        126,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE NILTON LINS (UNINILTONLINS)',
        75,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE NOVE DE JULHO (UNINOVE)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE PARANAENSE (UNIPAR)',
        251,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE PAULISTA (UNIP)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE PITÁGORAS UNOPAR ANHANGUERA',
        159,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE POSITIVO (UP)', 56, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE POTIGUAR (UNP)', 130, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE PRESBITERIANA MACKENZIE (MACKENZIE)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE REGIONAL DE BLUMENAU (FURB)',
        193,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE REGIONAL DO CARIRI (URCA)',
        310,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE REGIONAL DO NOROESTE DO ESTADO DO RIO GRANDE DO SUL (UNIJUI)',
        311,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE REGIONAL INTEGRADA DO ALTO URUGUAI E DAS MISSÕES (URI)',
        415,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE SALGADO DE OLIVEIRA (UNIVERSO)',
        623,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE SALVADOR (UNIFACS)', 116, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE SANTA CECÍLIA (UNISANTA)',
        171,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE SANTA ÚRSULA (USU)', 12, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE SANTO AMARO (UNISA)', 8, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE SÃO FRANCISCO (USF)',
        404,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE SÃO JUDAS TADEU (USJT)',
        8,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE TECNOLÓGICA FEDERAL DO PARANÁ (UTFPR)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE TIRADENTES (UNIT)', 142, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE TUIUTI DO PARANÁ (UTP)',
        56,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE UNIVERSUS VERITAS GUARULHOS (UNIVERITAS UNG)',
        100,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE VALE DO RIO DOCE (UNIVALE)',
        265,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE VEIGA DE ALMEIDA (UVA)',
        12,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES ('UNIVERSIDADE VILA VELHA (UVV)', 226, 1, false) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'UNIVERSIDADE VIRTUAL DO ESTADO DO MARANHÃO (UNIVIMA)',
        141,
        1,
        false
    ) ON CONFLICT DO NOTHING;
INSERT INTO public.empresa (
        nome_empresa,
        endereco_empresa,
        created_by,
        empresa_is_emprego
    )
VALUES (
        'VOAS - INSTITUTO DE APRENDIZAGEM SUPERIOR (VOAS)',
        116,
        1,
        false
    ) ON CONFLICT DO NOTHING;
--- Faixa Salarial
INSERT INTO public.faixa_salarial (faixa_faixa_salarial, created_by)
VALUES ('1 salário mínimo', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.faixa_salarial (faixa_faixa_salarial, created_by)
VALUES ('de 2 a 4 salários mínimos', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.faixa_salarial (faixa_faixa_salarial, created_by)
VALUES ('de 5 a 10 salários mínimos', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.faixa_salarial (faixa_faixa_salarial, created_by)
VALUES ('11 ou mais salários mínimos', 1) ON CONFLICT DO NOTHING;
--- Genero
INSERT INTO public.genero (nome_genero, created_by)
VALUES ('Masculino', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.genero (nome_genero, created_by)
VALUES ('Feminino', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.genero (nome_genero, created_by)
VALUES ('Não-binário', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.genero (nome_genero, created_by)
VALUES ('Transsexual', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.genero (nome_genero, created_by)
VALUES ('Não quero declarar', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.genero (nome_genero, created_by)
VALUES ('Outros', 1) ON CONFLICT DO NOTHING;
--- Tipo de Bolsa
INSERT INTO public.tipo_bolsa (nome_tipo_bolsa, created_by)
VALUES ('PIBIC', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.tipo_bolsa (nome_tipo_bolsa, created_by)
VALUES ('PROAD', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.tipo_bolsa (nome_tipo_bolsa, created_by)
VALUES ('PROEX', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.tipo_bolsa (nome_tipo_bolsa, created_by)
VALUES ('PROBAC', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.tipo_bolsa (nome_tipo_bolsa, created_by)
VALUES ('PERMANÊNCIA', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.tipo_bolsa (nome_tipo_bolsa, created_by)
VALUES ('CAPES/CNPQ', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.titulacao (nome_titulacao, created_by)
VALUES ('GRADUAÇÃO', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.titulacao (nome_titulacao, created_by)
VALUES ('PÓS-GRADUAÇÃO', 1) ON CONFLICT DO NOTHING;
--- Area de Emprego
INSERT INTO public.area_emprego (nome_area_emprego, created_by)
VALUES ('Engenharia de Software', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_emprego (nome_area_emprego, created_by)
VALUES ('Programação', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_emprego (nome_area_emprego, created_by)
VALUES ('Informática', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_emprego (nome_area_emprego, created_by)
VALUES ('Suporte a TI', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_emprego (nome_area_emprego, created_by)
VALUES ('Analista de Sistema', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_emprego (nome_area_emprego, created_by)
VALUES ('Analista de QA', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.area_emprego (nome_area_emprego, created_by)
VALUES ('Outros', 1) ON CONFLICT DO NOTHING;
--- Egressos Validos (Dados pela Marcele)

insert into egresso_valido (nome_egresso_valido , matricula_egresso_valido , email_egresso_valido) values
('ADALBERTO DOS REMEDIOS SILVA JUNIOR','200411140009',null),
('ADONIAS PINHEIRO PIRES','200511140025','quase_4ever@yahoo.com.br'),
('ADRIANA MENDONCA GARCES','200311140030',null),
('ADRIANO ANDRADE SILVA','200511140017','adrianocbsi05@gmail.com'),
('ALAYR MAUES MELO SOBRINHO','200311140009',null),
('ALBERTO WILLIAMS CORREA FERREIRA','200411140017',null),
('ALESSANDRO PEDRO DA CUNHA','200711140025','alessandrocunha1@gmail.com'),
('ALEXANDRE BRITO CARDIAS JUNIOR','200611140006','alexandrecjr@ufpa.br'),
('ALEXANDRE TELES BASTOS','200811140014','alexandretelesbastos@gmail.com'),
('ALEXSANDER HAGE DE MELO','200411140008',null),
('ALISON COSTA DA CONCEICAO','200811140007','alisoncosta@globo.com'),
('ALISSON PAULO SOUSA SIQUEIRA','200511140033','apbelem@bol.com.br'),
('ALLAN DA SILVA ALCANTARA','201311140010','allan.pa.br@gmail.com'),
('ALLE HEDEN TRINDADE DE SOUZA','200811140040','jardim-do-heden@hotmail.com'),
('ALTIERE COSTA DE SOUZA','200311140004','altisouza@gmail.com'),
('ANDERSON COSTA NOVAES DE OLIVEIRA','201111140034','anovaes27@gmail.com'),
('ANDERSON JORGE SANTOS FERREIRA','201111140018','andufpa@gmail.com'),
('ANDERSON JUNIOR PARAENSE DA SILVA','200311140029','andsilvapara@bol.com.br'),
('ANDERSON NAZARENO ALCANTARA DE OLIVEIRA','201111140007','andervilo@hotmail.com'),
('ANDRÉ AVELINO DA SILVA NETO','201211140004','andre.n.los@gmail.com'),
('ANDRE DEFREMONT','201311140016','andre.def93@gmail.com'),
('ANDRE LUIZ COELHO PINHEIRO','200711140013','acgrafic@gmail.com'),
('ANDRE LUIZ DE GUSMAO','200811140002','andredgusmao@gmail.com'),
('ANDRESSA MYRTYS PEREIRA NOWACZYK','200911140012','andressa.myrtys@gmail.com'),
('ANDRE THIAGO SANTANA FERNANDES','200211140003',null),
('ANTONILSON DA SILVA ALCANTARA','201211140014','antonilsonalcantara@gmail.com'),
('ANTONIO ALAN MENEZES DA SILVA','200911140029','alan.menezes@yahoo.com.br'),
('ANTONIO NICOLAU MAIA JUNIOR','200211140020',null),
('ARLEM ANTONIO PEREIRA LEMOS','200411140016',null),
('BELARDIM BERTON LOPES ARAUJO','200211140032','berton28@hotmail.com'),
('BERNARDO JOSE DA SILVA ESTACIO','200711140015',null),
('BRENO BRUNO VIEIRA DE CAMPOS','200711140017','brenobcampos@gmail.com'),
('BRUNA JULLY NEVES NUNES','200911140031','bjullynn@gmail.com'),
('BRUNO BOTELHO CARDOSO','200311140035','botabotelho@hotmail.com'),
('BRUNO LIMA MARTINS','201011140026','brunolmartins@gmail.com'),
('CARLOS DOS SANTOS PORTELA','200611140025','csp@ufpa.br'),
('CARMEN LUCIA MARTINS DO NASCIMENTO','200511140024',null),
('CECIL CORDEIRO DA SILVA','200311140024',null),
('CLEBER ROBSON DA SILVA GOMES','201211140034','crsg.si.2012@gmail.com'),
('DACIO PANTOJA SILVA','200411140023',null),
('DANGELO WESLEY OLIVEIRA MENDES','201011140021','dangelomendes10@gmail.com'),
('DANIEL BERG SOUZA DE OLIVEIRA','200511140036',null),
('DANIELLE GONCALVES BARROS','200211140015',null),
('DANILO ANDERSON PALHANO PINTO','200411140019','danilopinto@museu-goeldi.br'),
('DANILO HENRIQUE SOUSA MARTINS','200411140005',null),
('DANILO MATOS DA SILVA','200811140023','danilomatosdasilva@gmail.com'),
('DANILO SOUZA DUARTE','201611140020','danilosduarte5@gmail.com'),
('DAVID BARROS DE OLIVEIRA JUNIOR','201111140037','david.barros.j@gmail.com'),
('DEBORA DA SILVA CUENTRO','201011140007','cuentrosilva@gmail.com'),
('DEBORA EMERIQUE DE LIMA','201111140005','deboraelima58@gmail.com'),
('DENER MAUES NEGRAO','201511140004','denermaues@gmail.com'),
('DENISSON RONEY ALVES REIS','201111140039','denisson_roney@hotmail.com'),
('DIEGO ASSIS DA SILVA LISBOA','200711140027','diegolisboa@ufpa.br'),
('DIEGO RODRIGUES DE SOUZA','200911140008','diego.souza@icen.ufpa.br'),
('DIEGO SAMPAIO PANTOJA','200711140022','diegofuture@yahoo.com.br'),
('DIELLE DA SILVA CORREA FRANCO','200211140004','diellefranco@yahoo.com.br'),
('DIOGO ADRIEL LIMA FERREIRA','201011140022','cetlho@gmail.com'),
('DIOGO MARINHO ALMEIDA','200411140002','diogo.marinho@gmail.com'),
('DIORGINO RIGLES ALVES REIS','201011140023','diorgino@gmail.com'),
('DIOVANNI MORAES DE ARAUJO','200611140021','diovanini@gmail.com'),
('EDGAR EGUCHI ALVES','200611140033','edgar.eguchi@gmail.com'),
('EDILSON ALVARO CUSTODIO JUNIOR','200411140015',null),
('EDNELSON SILVA DE SOUSA','200511140020','ednssousa@yahoo.com.br'),
('EDSON GOMES DE AGUIAR SILVA','200411140027',null),
('EDUARDO SOUSA DE ARAUJO','200311140008',null),
('EDWIN VIANA CHAGAS','201511140005','edwinchagas@ufpa.br'),
('ELDER BRUNO EVARISTO CORREA','201211140035','ebec2012@gmail.com'),
('ELDER THIAGO COSTA MOREIRA','201111140031','thiagom@ufpa.br'),
('ELIEL DOS SANTOS BENTES','201111140019','elielsbentes@hotmail.com'),
('ELIENE DE NAZARE NASCIMENTO PAIXAO','200411140012','elienenb@yahoo.com.br'),
('ELIWELTON GOMES PAES','201311140007','eliwelton.g.p@gmail.com'),
('ELTON SARMANHO SIQUEIRA','200611140008','eltonsarmanho@gmail.com'),
('ELVIS THERMO CARVALHO MIRANDA','201611140041','elvisthermo@hotmail.com'),
('ERICK CARDOSO SYADE','201311140005','e.syadetbo@gmail.com'),
('ERIKA MAIA LIMA','200611140019','erikasoueu@gmail.com'),
('EUDO NEVES PRIMO','200411140035',null),
('EVANDRO DE SOUZA MONTEIRO','201211140005','evandroofox@gmail.com'),
('EWERTOM MOZART MORAES DE MIRANDA','201311140004','ewertom.moraes@gmail.com'),
('EXPEDITO AUGUSTO CARDOSO NOBRE FILHO','201311140031','expeditonobrefilho@gmail.com'),
('FABIO LUIZ CORDEIRO REZENDE','200411140034',null),
('FABRICIO ALMEIDA ARAUJO','200711140024','araujopa@gmail.com'),
('FABRICIO BRAGA DE SOUZA','200611140013',null),
('FAUSTINO FIRMINO DE CARVALHO JUNIOR','200711140019',null),
('FELIPE LEITE DE NAZARETH','200811140009','felipe.leite.nazareth@gmail.com'),
('FERNANDO CESAR CHAVES ALVES JUNIOR','201411140003','fernandoaj@ufpa.br'),
('FERNANDO FABIO DIAS GAMA DA MATA','201011140028','f.fabiogama88@gmail.com'),
('FERNANDO LUIZ DE SIQUEIRA CARDOSO','200811140010','fernandols.cardoso@gmail.com'),
('FERNANDO WAGNER ASSUNCAO TEIXEIRA','200811140024','flash104@gmail.com'),
('FLAVIO AUGUSTO SANTOS DE OLIVEIRA','200511140018','flavio.oliveira@ica.ufpa.br'),
('FRANCIELLEM MAYARA PONTES BEZERRA','201211140015','franccy.b@gmail.com'),
('FRANCIELMA DOS SANTOS ASSUNCAO','201611140010','assuncao.francielma@gmail.com'),
('FRANCISCO BANDEIRA BRITO JUNIOR','200711140010',null),
('FRANCISCO CARLOS GUALBERTO DOS SANTOS JUNIOR','200911140027','jramlen@gmail.com'),
('FRANCISCO PAULO BRITO BORGES','200311140033',null),
('FRANKNALDO TORRES GOMES','200211140031',null),
('GABRIEL CRUZ SOARES GOMES','201611140012','ggomes873@gmail.com'),
('GABRIEL MEDEIROS DA SILVA','201111140025','gabrielmedsilva@hotmail.com'),
('GEDEAN GONCALVES CARVALHO','201011140002','gedean.carvalho@hotmail.com'),
('GENE SHUCHIN WEN','200311140001',null),
('GEORGE GILSON OLIVEIRA DOS REIS','200511140008',null),
('GEOVANI OLIVEIRA CABRAL DA PAZ','201211140009','geovanipaz7@gmail.com'),
('GERSON SOUZA DA SILVA','201111140012','gersonsouza2@gmail.com'),
('GILBERTO NERINO DE SOUZA JUNIOR','200611140023','gilbertojr@ufpa.br'),
('GIOVANNI ASSUMPCAO MAGNO','200711140033','assumpcaogiovanni@yahoo.com.br'),
('GIOVANNI AUGUSTO MELO PINHEIRO','200611140005','g3oaugusto@gmail.com'),
('GLEIDSON FELIPE PEREIRA DA SILVA','200711140035',null),
('GLEISE PINHEIRO BALDEZ','200711140001','gleisebaldez@gmail.com'),
('GLEYDSON DA COSTA FERREIRA','200311140010',null),
('GLEYSON MIRANDA MELO','200311140011',null),
('GUSTAVO MAUES DE OLIVEIRA LOBATO','200311140005','gustavomaues@ufpa.br'),
('HANA GABRIELLE DOS SANTOS BARATA','201711140009','hanagabrielle@outlook.com'),
('HANS WILLIAM DOS SANTOS SILVA','201011140010','hans.w.santos@gmail.com'),
('HEGON HENRIQUE CORREA DA SILVA','200511140022','hegoncbsi@yahoo.com.br'),
('HERBERTH MENDES DE ALMEIDA','200811140031','herberthalmeida@hotmail.com'),
('HIEDA ADRIANA NASCIMENTO SILVA','200211140009','hieda@ufpa.br'),
('HUGO BISPO SANTOS DO NASCIMENTO','200711140011','hbsnhugo@gmail.com'),
('HUGO RONALDO GONZALEZ NOGUEIRA','200311140032',null),
('IDERALDO CARLOS PAVESI','200611140010','ideraldo_carlos@hotmail.com'),
('IGOR BARBOSA DE CARVALHO','200811140041',null),
('INGRID MOREIRA MIRANDA DA SILVA','201511140003','i.moreiragt@gmail.com'),
('ISAAC SOUZA ELGRABLY','201111140020','isaacelgrably@hotmail.com'),
('IURI IGONEZ SILVA RAIOL','200911140006','iuriraiol@gmail.com'),
('JACKSON PEREIRA DA SILVA CRUZ','200411140011','jacksonpscruz@outlook.com'),
('JADIR HORACIO SARMENTO PINTO JUNIOR','200911140023','jadirjunior@ufpa.br'),
('JAILSON MARTINS TOLOSA','201111140014','jailsontolosa@gmail.com'),
('JAIRO DE JESUS NASCIMENTO DA SILVA JUNIOR','200811140039','junior.jairo1@gmail.com'),
('JAMYSON DA SILVA MATOSO','200911140011','jamysonmatoso@yahoo.com.br'),
('JANDER DE SOUZA E SILVA','200211140010',null),
('JEFFERSON KLISTER DUARTE DA SILVA JUNIOR','201311140001','jeffklister@gmail.com'),
('JESSÉ DA COSTA ROCHA','201111140001','jesserocha2012@gmail.com'),
('JESSICA DE PAULA FIGUEIRA RIBEIRO','201411140036','jessicadepaula.stm@gmail.com'),
('JHONATHAS SOUSA DOS SANTOS','200611140012','j0g4d0r1@hotmail.com'),
('JHOVAN OBEDE TERRA DA SILVA','200211140028',null),
('JOAO LUIS DOS REIS LIMA','200911140002','joaoamil@hotmail.com'),
('JOAO VICTOR PATERNOSTRO CORREA','201211140003','jvpaternostroc2@gmail.com'),
('JOSE AUGUSTO DE SENA QUARESMA','201111140011','jq.quaresma12@gmail.com'),
('JOSE BRICIO MACHADO CARDOSO NETO','200711140020',null),
('JOSE DEIVISON VIEIRA XAVIER','201311140026','deivisonvx@gmail.com'),
('JOSE HIRVALDO LOBO MONTEIRO','200211140012',null),
('JOSE RAMON DA CONCEIÇAO MONTEIRO','201411140019','jose.monteiro@icen.ufpa.br'),
('JOYCE ANNE PINTO RODRIGUES','200311140015','joycesinfo03@yahoo.com.br'),
('JULIO DE PADUA LOPES MENEZES','201311140036','julio.menezesi2013@gmail.com'),
('JULIO EDUARDO BITTENCOURT DA SILVA','200711140014','julioebs20@hotmail.com'),
('JULIO FRANCISCO COUTO DE CARVALHO','201011140033','juliusufpa2010@gmail.com'),
('JULIO RAMON NOGUEIRA LISBOA','200811140025','julioramonufpa@gmail.com'),
('KAIO SERGIO DA MOTTA VALENTE','200711140004',null),
('KALILL CORDEIRO LAMEIRA','201411140013','kalill.lameira@gmail.com'),
('KAMILA BALTAZAR CORREIA','200611140029',null),
('KATYA KEILA COSTA ASSIS','200511140031','katyakeila@gmail.com'),
('KELVIN TEIXEIRA VIEIRA','201111140016','kelvintvieira@hotmail.com'),
('KLEOSON BRUNO CORREA DOS SANTOS','200811140013','brunocorrea@ufpa.br'),
('LAERTE GUEDES MONTEIRO','200911140001','laerte-gm@hotmail.com'),
('LAERTH LASERINO PINTO MONTEIRO','201011140034','laertthpotter@hotmail.com'),
('LAIS CONCEICAO RIBEIRO','200811140019','laissribeiro@gmail.com'),
('LARISSA DE SOUZA CARNEIRO','200511140027',null),
('LEANDRO GOMES DE MOURA','200911140033','leandro.goms.moura@gmail.com'),
('LEANDRO HERNANDEZ ALMEIDA','200411140004',null),
('LEIDIEL ARAUJO DE OLIVEIRA','200611140003','leidiel@ufpa.br'),
('LEONARDO ANDRE SILVA DOS SANTOS','201111140010','leonardoandre27@gmail.com'),
('LEONARDO BARBOSA DA COSTA','201011140001','barbosleonardo@gmail.com'),
('LEONARDO DA COSTA FIGUEIREDO','201411140011','leonardofig88@gmail.com'),
('LEONARDO DIAS MARTINS','201111140008','leo_dm@live.it'),
('LEONARDO FERREIRA E SILVA','200911140015',null),
('LEONARDO HERNANDEZ ALMEIDA','200411140020','leofozzy@yahoo.com.br'),
('LEO SANTOS DE LIMA','200511140002','leo-sdl@hotmail.br'),
('LEYRILANE DE SOUZA','200511140015',null),
('LOURDILENE SILVA DE SOUZA','201011140031','lourdilene.souza@gmail.com'),
('LOURIVAL DA CONCEICAO PEREIRA JUNIOR','200311140013',null),
('LUAN DOS SANTOS OLIVEIRA','201411140029','luanoliveira35@hotmail.com'),
('LUAN FELIPE BRITTO ALVES','201611140015','akaluan.la@gmail.com'),
('LUCIANA NEVES BENTES','200611140031',null),
('LUCIANE FARIAS SOARES','200411140025',null),
('LUIZ ALESSANDRO LOPES FEITOSA','200511140009','alelibbra@hotmail.com'),
('LUIZ ANTONIO ANDRADE DE SOUSA','201311140013','luizdsousa@gmail.com'),
('LUIZ EDUARDO ALVES DE ALCANTARA','201111140006','eduardo@alcantara.net.br'),
('LUIZ FELIPPH CALADO SOSINHO','201211140006','luizfelipph@gmail.com'),
('LUIZ OTAVIO DANIN DE LIMA','200911140021','otaviodanin@gmail.com'),
('LUZIANA BRAGA CORREA','200311140026',null),
('LYNDON JOHNSON BRITO SOUSA','200411140003',null),
('MABEL PILAR NASCIMENTO DUARTE','200211140013','mpillar@yahoo.com.br'),
('MANOEL VICTOR RODRIGUES LEITE','201211140022','victor.ufpaa@gmail.com'),
('MANUELY BARBOSA GUEDES','201011140020','manuely.guedes@icen.ufpa.br'),
('MARCELA SANTIAGO DOS SANTOS','200211140007',null),
('MARCELO DA SILVA MORAES','200411140029','marcelo@ufpa.br'),
('MARCELO SARRAF PINHO','200211140006','marcelosarraf@gmail.com'),
('MARCIO JOSE MOUTINHO DA PONTE','200211140014','marcio.ponte@ufopa.edu.br'),
('MARCIO NUNES GOMES','200311140016','marciogomes@mpf.mp.br'),
('MARCO AURELIO CAPELA','200411140032','macapela@ufpa.br'),
('MARCOS ALMEIDA DA COSTA','201511140034','almeidmar@gmail.com'),
('MARCOS AUGUSTO BARATA DA SILVA','200411140030',null),
('MARCOS PAULO FERREIRA COSTA','201311140034','marcsi2320@gmail.com'),
('MARCOS PAULO NASCIMENTO SILVA','200411140024',null),
('MARCOS VALERIO DA SILVA RENDEIRO','200611140020',null),
('MARIANO JEFFERSON BATISTA GOMES JUNIOR','200711140021','marianojefferson@hotmail.com'),
('MARIO ANTONIO PEREIRA DE OLIVEIRA','201011140039','mario_oliveira10@yahoo.com.br'),
('MARIO BASTOS DE BRITO JUNIOR','200211140017',null),
('MARLON SILVA PIMENTEL CRUZ','201211140028','marlonufpasi@gmail.com'),
('MARLON WILSON SANTOS DOS SANTOS','201511140006','marlon.santos.santos@icen.ufpa.br'),
('MARTA JODYE BORDO DA CONCEICAO','200511140019','jodye_st@hotmail.com'),
('MATHEUS SEABRA DE CARVALHO VIEIRA COELHO','201311140021','matheusvieiracoelho@gmail.com'),
('MAURICIO MARTINS RIBEIRO','201811140014','mauricio.si.ufpa@gmail.com'),
('MAURO AUGUSTO BARROS FERREIRA','201111140048','mauroabferreira@yahoo.com.br'),
('MAXIMIANO DAVES DA COSTA VIEIRA','200411140026',null),
('MAX WANDERSON DE ARAUJO FAVACHO','200511140010',null),
('MAYKON ARAUJO DE SOUZA','201311140018','maykonaraujo23@gmail.com'),
('MICHEL FEU CASTRO GONDIM','200511140034','michelgondim@yahoo.com.br'),
('MICHEL PEREIRA MARQUES','200711140008',null),
('NILTON RODRIGUES DE ASSIS JUNIOR','200611140028','NILJUNIOR@GMAIL.COM                                                             '),
('ODIRLEY PINHEIRO DE MATOS','201211140008','odirley007@yahoo.com.br'),
('ORLANDO DO NASCIMENTO TAVARES FILHO','200811140026','ontf.filho@gmail.com'),
('OTAVIO DUTRA LEITE','200211140022',null),
('PATRICIA PINTO DINIZ','200411140010','patricia.diniz@tucurui.ufpa.br'),
('PAULEANDRO SILVA NUNES','200811140030','psn_leandro@hotmail.com'),
('PAULO ALBERTO LIMA PRADO','200611140026','paulo_alp19@hotmail.com'),
('PAULO ANDRE MOREIRA CARVALHO','200211140008',null),
('PAULO HENRIQUE AMORIM PEREIRA','201211140025','paulohenriq10@gmail.com'),
('PAULO VITOR CHAVES DE LIMA','201111140024','pv.lima05@gmail.com'),
('PAULO VITOR RODRIGUES CARDOSO','200811140008','paulocardoso.dev@gmail.com'),
('PAULO WESKLEY DE ALMEIDA FERREIRA','201011140032','weskleyalmeida.si@gmail.com'),
('PEDRO ESTEVAO DA CONCEICAO MOUTINHO JUNIOR','200611140002','pedro_cabeludow@hotmail.com'),
('RAFAELA CARDOSO MOUTINHO','200511140012','rafmout@yahoo.com.br'),
('RAFAEL BRUNO PECCATIELLO','200511140007','peccatiello@ig.com.br'),
('RAFAEL DANTAS CARVALHO','200711140031',null),
('RAFAEL DE SOUZA CAVALHEIRO','201211140030','rafcavalheiro@gmail.com'),
('RAFAEL FERREIRA DE SOUZA','201011140005','desouza.timao@gmail.com'),
('RAFAEL GOMES SOUSA','200711140032','rafael.sousa@ifpa.edu.br'),
('RAIMUNDO NORBERTO LAMEIRA JUNIOR','200211140021','raimundonorberto@yahoo.com.br'),
('RAPHAEL DA SILVA AZEVEDO','200511140011','razeved@yahoo.com.br'),
('RAPHAEL ROGERIO MOUTA','200911140025',null),
('RAUL CESAR MONTEIRO DA SILVA','200811140018','fa15698@yahoo.com.br'),
('RENAN EDUARDO SOARES RODRIGUES','201011140016','renaneduardorodrigues@gmail.com'),
('RENATA RODRIGUES DE CARVALHO','200511140032',null),
('RICARDO ANDERSON MUNIZ SARMANHO','201411140007','ricardosarmanho@hotmail.com'),
('RICARDO ARAUJO FEIO','200611140018','rafeio@bol.com.br'),
('RICARDO PAES ALMEIDA','200411140007',null),
('ROBERTO BARBOSA DE ALMEIDA JUNIOR','201311140002','roberto.almeida@icen.ufpa.br'),
('ROBERTO BRITO XAVIER JUNIOR','201211140019','rbxjunior@gmail.com'),
('ROBERTO FELIX','201011140014','bob.felix89@gmail.com'),
('ROBSON DOS SANTOS SILVA','201011140015','rsantsil@gmail.com'),
('RODRIGO BEZERRA BRASIL','200711140002','rodrigobbrasil@gmail.com'),
('RODRIGO DO CARMO VIANA','201011140030','rodrigoviana@ufpa.br'),
('RODRIGO VIDAL MIRANDA','200811140027','rvidalth@yahoo.com.br'),
('ROGERIO LIMA CARNEIRO','200211140019','rlimac@gmail.com'),
('ROMAO SOUZA SILVA','200411140022','rjsilva@ufpa.br'),
('ROSANE DA SILVA SIQUEIRA','200311140025',null),
('ROSANGELA SOUSA RAIOL','200211140026','zanraiol@gmail.com'),
('ROSIVALDO FONSECA GOMES JUNIOR','200911140020','rfgomesjr@gmail.com'),
('ROUSEVELT RODRIGUES DE ALMEIDA','200811140032',null),
('RUMENIGG NOGUEIRA VIEIRA','200211140018',null),
('SAMARA FERNANDES PIMENTEL','201511140002','samwallflowergirl@gmail.com'),
('SAMUEL LINHARES SANTANA','200911140014','ifpa.santana@gmail.com'),
('SANDRO ALAN DE SOUZA MONTEIRO','200711140006',null),
('SEBASTIAO GILBERTO LOPES VAZ','200511140035',null),
('SERGIO EWERTON MACIEL RODES','201111140030','sergio_ewr17@hotmail.com'),
('SILVIO BRUNO PAIVA COSTA','200511140014','sbpaco@gmail.com'),
('SIMON AFONSO CORREA LOBATO','200511140004','simondelarocha@yahoo.com.br'),
('SIVALDO DE OLIVEIRA BARBOSA','200711140007',null),
('TALITA DE CACIA SOUSA TRAVASSOS','201411140025','talitatravassos.tt@gmail.com'),
('TAMARA CUNHA MENDES','200211140016',null),
('TATIANE BOTELHO BORGES','200811140015','tatianejbm@yahoo.com.br'),
('THIAGO BENICIO MACEDO','201611140002','thiagobm01@hotmail.com'),
('THIAGO CORDEIRO COSTA DA SILVA','201211140010','tsilva0891@gmail.com'),
('THIAGO DA SILVA GILLA','200211140001',null),
('THIAGO DE LIMA ARAUJO','200311140020',null),
('THIAGO DE MATOS BEZERRA','200911140017','thiagomatos99@hotmail.com'),
('THIAGO MODESTO DIAS','200711140023',null),
('THIAGO SALES SANTOS','200711140034','ioritss@hotmail.com'),
('TIAGO ANTERO DE SOUSA ALVES','201011140012','jvantero@gmail.com'),
('TIAGO PORTO SANTOS DO NASCIMENTO','200311140003',null),
('VERONICA COSTA PANTOJA','200311140017','VCPSINFO@YAHOO.COM.BR'),
('VICTOR GUSTAVO DE MELLO GONCALVES','200511140016',null),
('VICTOR HUGO AZEVEDO FERREIRA','201711140002','victorhugo543af@gmail.com'),
('VINICIUS FAVACHO QUEIROZ','201611140031','viniciusqquei@gmail.com'),
('VITOR CIRILO ARAUJO SANTOS','201011140003','vitor.cirilo3@gmail.com'),
('VITOR DE SOUZA CASTRO','200711140003','vitor@ufpa.br'),
('WALBERT CUNHA MONTEIRO','200511140021','walbert.monteiro@ifpa.edu.br'),
('WALBERT EMANUEL DA SILVA NASCIMENTO','201011140009','walbertsilva5@gmail.com'),
('WALDER LOBO MARQUES','201111140038','walderwolf.tm@gmail.com'),
('WALERIA PAULA DA LUZ MOURA SOUZA','200511140028','waleriamoura@gmail.com'),
('WANDERSON AUGUSTO DE SOUZA PEREIRA','200311140034',null),
('WELLINGTON CARDOSO COSTA','200311140007',null),
('WELLINGTON SOUZA MORAES','200811140003','engwillsm@yahoo.com.br'),
('WESLEY ANDERSON OLIVEIRA DE MELO','200911140032','wesleyandmelo@gmail.com'),
('WESLEY DE OLIVEIRA BARBOSA','201011140013','wesley.tadsi@yahoo.com.br'),
('WILLIAM CAPELA CARDOSO','200511140029',null),
('WILLIAM SAWAKI DE MELO E SILVA','201011140006','williamsawaki@gmail.com'),
('WILLY CLEYBER ALMEIDA SILVA','200411140033',null),
('WILTON CESAR NASCIMENTO DA SILVA','200511140037','wilton.cns@gmail.com'),
('YASMIN VIEIRA DE MELO KOURY','200311140018',null),
('YURI MELO E SILVA DO ESPIRITO SANTO','201611140027','yurimelo89@gmail.com'),
('ABEL BRUNO NASCIMENTO SILVA','200804940012','abelbruno@hotmail.com'),
('ABNATAL PEREIRA CORDOVIL JUNIOR','199904940002',null),
('ABNER CARDOSO DA SILVA','201604940029','abner.cardo@gmail.com'),
('ABNER GILLET FARIAS','201304940017','abnergillet16@gmail.com'),
('ABRAHAM LINCOLN RABELO DE SOUSA','199504940031',null),
('ACZA LIRA SILVA','201704940024','acza.silva@icen.ufpa.br'),
('ADAILTON MAGALHAES LIMA','200204940003','adailton@ufpa.br'),
('ADEILSON NAZARENO ARAUJO PINHEIRO','200304940019',null),
('ADELMO FREIRES GOMES','199104940049',null),
('ADENILTON CORECHA DE SOUZA','200904940039','adcorecha@gmail.com'),
('ADERBAL MOURA SANTOS','199104940090',null),
('ADEVALDO QUEIROZ DA SILVA','200104940034',null),
('ADIEL DOS SANTOS NASCIMENTO','201504940002','adieltab16@gmail.com'),
('ADILSON FRANCISCO FERREIRA SOUSA','200904940009','adilson.sousa@icen.ufpa.br'),
('ADRIANA LEITE DE ALCANTARA','199304940001',null),
('ADRIANA NUNES TELES','199904940016',null),
('ADRIANO DE AGUIAR RIBEIRO','200204940036','ribeiroadrianno@ig.com.br'),
('ADRIANO DE OLIVEIRA MARTINS','200004940020',null),
('ADRIANO LUIZ PINTO SOBRAL','199404940002',null),
('ADRIANO SILVA BARRETO','201304940025','adriano.sbarreto@hotmail.com'),
('AIAN SHAY BENTES DAMASCENO CARDOSO','201704940041','aianshay@gmail.com'),
('AILTO LORASCHI','200004940046',null),
('AIRTON NOBUMASA ISHIMORI','200604940031','airton@ufpa.br'),
('ALAN TONY SOUZA VELOSO','201504940009','aveloso@ufpa.br'),
('ALBERTO DA CRUZ LIMA SOBRINHO','201704940019','aclsobrinho@gmail.com'),
('ALBERTO SHINTA KURODA','199104940107',null),
('ALCYR DA COSTA ALMEIDA JUNIOR','201204940025','almeida.alcyr@gmail.com'),
('ALEKSANDRA DO SOCORRO DA SILVA','199104940108',null),
('ALESSANDRA CAROLINE DOS SANTOS NASCIMENTO','200404940026',null),
('ALESSANDRA DA SILVA GOMES','200104940011',null),
('ALESSANDRA FONTEL POMPEU','199104940050',null),
('ALESSANDRA PANTOJA DE ARAUJO','201204940027','alessandra.araujo@icen.ufpa.br'),
('ALESSANDRA PRISCILA ALVES DE OLIVEIRA','201004940012','alessandrapriscila.alves@gmail.com'),
('ALETEIA PATRICIA FAVACHO DE ARAUJO','199304940002',null),
('ALEXANDER RICHARD VINSON','200004940013',null),
('ALEXANDRE ABREU DE FREITAS','201104940039','alexandre.freytas@gmail.com'),
('ALEXANDRE ALVAREZ MARTINI SANTOS','199504940001',null),
('ALEXANDRE CARLOS BEZERRA MACEDO','199304940004',null),
('ALEXANDRE MELO BRAGA','199204940001',null),
('ALEXANDRE MONASSA MOREIRA','200504940011','alexandre.monassa@gmail.com'),
('ALEXANDRE RODRIGUES GOMES','201004940020','gomes.bcc@gmail.com'),
('ALEX YUICHI YOKOKURA','200004940016',null),
('ALFREDO LIMA DA COSTA JUNIOR','201104940033','jrcdz01@gmail.com'),
('ALINE CLAIREFONT TAVARES MELO','199704940017',null),
('ALINE DE OLIVEIRA SILVA','200304940005',null),
('ALINE PATRICIA DA SILVA PIMENTEL','200204940047','apssig@ig.com.br'),
('ALINE REGINA DE OLIVEIRA MIRANDA','199404940045',null),
('ALISON RICARDO SANTOS DA SILVA','200304940003','alisonricss@yahoo.com.br'),
('ALLINE DE MELO LEMOS','200204940007','allinelemos@gmail.com'),
('ALLINE DE OLIVEIRA PEIXOTO','200104940049','alline_peixoto@yahoo.com.br'),
('ALLISFRANK DOS SANTOS','200904940031','allisknarf@gmail.com'),
('ALUIZIO RAMOS PEREIRA NETO','201004940028','aluizio.ramos.adv@gmail.com'),
('AMANDA NOBRE COSTA','200204940060',null),
('ANA CARLA MACEDO DA SILVA','199104940001','acms@ufpa.br'),
('ANA CAROLINA DE ARAUJO BARBOSA','200204940055','carolufpa@gmail.com'),
('ANA IDALINA TENORIO PIEDADE','200204940046','idabiap@yahoo.com.br'),
('ANA ISABELA MANITO RAMOS','201404940021','aisabelamr@gmail.com'),
('ANA KARLA MIRANDA DE OLIVEIRA','199204940044',null),
('ANA VITORIA DE BACELAR MACHADO E SILVA','201704940008','av503vitoria@gmail.com'),
('ANDERSON BAIA MAIA','199804940029',null),
('ANDERSON DE OLIVEIRA BANDEIRA','200504940036',null),
('ANDERSON FURTADO DE NAZARE','200904940015','anderson.fn88@gmail.com'),
('ANDERSON JONES SILVA DE JESUS','199704940007',null),
('ANDERSON JORGE SERRA DA COSTA','200204940052','andersonjsc@gmail.com'),
('ANDERSON MARQUES MORAIS','200904940016','andersonoanjo18@gmail.com'),
('ANDERSON RAIOL RODRIGUES','199504940002','arr@ufpa.br'),
('ANDERSON SILVA DE OLIVEIRA GÓES','200304940016','agoes@ufpa.br'),
('ANDRE LUIS MACHADO DE VASCONCELOS','200804940001','andre.cbcc@gmail.com'),
('ANDRE MIGUEL PENA BAHIA','200804940022','andrebahia.cbcc@gmail.com'),
('ANDRE MIRANDA PINHEIRO','201604940032','andremirandap93@gmail.com'),
('ANDRE RICARDO FARIA GOMES','199504940032',null),
('ANDREY DE MACEDO SOUSA','200904940014','andreymacedo06@hotmail.com'),
('ANE MARGARETH MONTE VERDE SILVA','199104940052',null),
('ANETE HIROMI HASHIMOTO','199104940053',null),
('ANGELA CRISTINA SOUZA DE AQUINO','199304940006',null),
('ANGELA MARIA TRINDADE AMADOR','201104940028','angelaamador@ufpa.br'),
('ANGELO DE BARROS BRAGA','200104940031','3390955@gmail.com'),
('ANGELO LUIZ DA CRUZ OLIVEIRA','201004940045','angeloluizz@gmail.com'),
('ANTONIO ANDRE CUNHA DA SILVA','201004940031','aandrecunhas@gmail.com'),
('ANTONIO FABIO RODRIGUES DOS SANTOS','199604940015',null),
('ANTONIO JOSE CASTRO DE ALMEIDA JUNIOR','199104940110','antonio.almeida.negocios@gamial.com'),
('ANTONIO MARCOS FERREIRA DE SOUZA','200204940048','amsouzapa2@gmail.com'),
('ANTONIO SOARES LOBATO','199904940023',null),
('ARIANE ELIZABETH NUNES GARCIA','201204940030','aeng.garcia@gmail.com'),
('AROLDO CRISTIANO GUERREIRO LEAL','199604940006',null),
('ARTHUR IVSON XAVIER DE MORAES BATISTA','201204940014','ivson.ma@gmail.com'),
('ARTHUR MASAHIRO YOSHINO','201104940003','arthur_masahiro@hotmail.com'),
('ARTHUR TAKESHI NORONHA YOSHIKAWA','201704940039','arthur.yoshikawa@icen.ufpa.br'),
('ARUANDA SIMOES GONCALVES  MEIGUINS','199404940005','aruandasimoes@gmail.com'),
('AUGUSTO FARIAS CRAVO','201404940003','augusto.f.cravo@gmail.com'),
('BARBARA CONCEICAO DE OLIVEIRA BARBOSA','199104940111',null),
('BERNARDO LOBATO DOS SANTOS NETO','200304940021',null),
('BILLY ANDERSON PINHEIRO','200204940054','haquiticos@gmail.com'),
('BLENO WILSON FRANKLIN VALE DA SILVA','201204940035','blenofvale@gmail.com'),
('BRENO BERNARD NICOLAU DE FRANCA','200204940005','brenofranca@yahoo.com.br'),
('BRENO CRISTOVAO RODRIGUES PINTO','200004940043',null),
('BRUNELLI PINTO MIRANDA','201104940015','brunelli.miranda@gmail.com'),
('BRUNO AKIRA FUKUSHIMA MURAKAMI','201204940005','murakami.bruno@gmail.com'),
('BRUNO BITAR MORHY','199504940004',null),
('BRUNO DA COSTA BARROSO','200104940029',null),
('BRUNO DO NASCIMENTO MONTEIRO','200704940029','bnmonteiro2@gmail.com'),
('CAIO MARCOS FLEXA RODRIGUES','201204940010','caiomfrodrigues@gmail.com'),
('CAIO PINHEIRO DE CARVALHO','201304940006','caiocarvalho1996@hotmail.com'),
('CAIO SHIMADA RABELLO','201604940020','xcaiosr@gmail.com'),
('CALADO PEREIRA FIJAMO','199104940048',null),
('CAMILA MARINHO ALMEIDA','200004940039',null),
('CARLA ALESSANDRA GOMES DE LIMA','199104940054',null),
('CARLA CRISTINA DA CRUZ ARAUJO','200804940032','alrac.cruz@gmail.com'),
('CARLA MARINA COSTA PAXIUBA','199904940035',null),
('CARLOS ALBERTO LEITE MENDES','199104940112',null),
('CARLOS ALEXANDRE LOURINHO GOMES','199904940060',null),
('CARLOS ANDRE NEVES DO VALE','200004940058',null),
('CARLOS DIEGO NASCIMENTO DAMASCENO','200804940017','carlos.damasceno@icen.ufpa.br'),
('CARLOS EDUARDO COSTEIRA CALDAS','200104940017',null),
('CARLOS EDUARDO MARINHO GOMES','200804940014','kadu-marinho@hotmail.com'),
('CARLOS EDUARDO RIBEIRO BASTOS','199304940007',null),
('CARLOS GUSTAVO RESQUE DOS SANTOS','201004940024','gustavoresqueufpa@gmail.com'),
('CARLOS HENRIQUE RIBEIRO CARDOSO','201604940014','carlos.h.cardoso140@gmail.com'),
('CARLOS MARCIO JORGE SARAIVA','199604940034',null),
('CARLOS RENATO LISBOA FRANCES','199104940004',null),
('CASSIO ALEXANDRE TEIXEIRA MENEZES','200004940026',null),
('CIDIANE ARACATY LOBATO','199804940001',null),
('CINTIA KELLI CABRAL RODRIGUES','200104940023',null),
('CIRNEY RICARDO J B CARNEIRO','199104940005',null),
('CLARICE MORAES FERREIRA','200904940035','claricemoraesf@gmail.com'),
('CLARK DA CUNHA SA','199104940114',null),
('CLAUDIA MYLENE DA SILVA PINHEIRO','199904940031',null),
('CLAUDIO ANTONIO DA SILVA CAVALCANTI','199904940057',null),
('CLAUDIO DIEGO TEIXEIRA DE SOUZA','201004940007','diegodisouzza@gmail.com'),
('CLAUDIO KENJI KAWAMURA DA SILVA','199704940025',null),
('CLEBER ROBERTO PAES DA ROCHA','199604940018',null),
('CLEBERSON MALCHER GUERREIRO','200204940032','cmguerreiro2@gmail.com'),
('CLEIDSON RONALD BOTELHO DE SOUZA','199104940008',null),
('CLEIDYR DA SILVA LIMA','201004940049','cleidyr.system@gmail.com'),
('CLODOALDO ESTUMANO DA SILVA','200304940018',null),
('CLOVIS DA PAZ TAVARES JUNIOR','199104940105',null),
('CRISTIANE DO SOCORRO PIRES ALMEIDA','200104940019',null),
('CRISTIANE MARQUES DA SILVA','200104940024',null),
('CRYS SAYURI GOTO','200304940007',null),
('CYNTHIA MARA FONSECA DE OLIVEIRA','199104940009',null),
('DANIELA KARINE MARAVALHO AVELAR','200904940022','donk14@gmail.com'),
('DANIELA NAZARE MAIA DA CONCEICAO','199104940093',null),
('DANIEL DE JESUS TAVARES','200704940023','djtavaresieq@gmail.com'),
('DANIEL DIAS DE CARVALHO','200304940035','danieldiascv@gmail.com'),
('DANIELE MOURA DE QUEIROZ','200504940034','daniqueiroz.bt@gmail.com'),
('DANIEL HENRIQUES MOREIRA','200104940001',null),
('DANIELLE DA SILVA COSTA NUNES','200304940029','danicostas@yahoo.com.br'),
('DANIELLE DE MICHELI PALHANO PINTO','200204940053',null),
('DANIELLE FURTADO DOS SANTOS','200004940025',null),
('DANIEL LIMA BRASIL','199904940010',null),
('DANIELL SOARES CAVALCANTI VIEIRA','201204940018','daniellcavalcanti@bol.com.br'),
('DANIEL ORLANDO SERPA DA SILVA','199204940004','dosdasilva@hotmail.com'),
('DANIEL SANTOS RODRIGUES','199504940005',null),
('DANILO DO CARMO QUADROS CABRAL','200104940046','cabraldanilo@yahoo.com.br'),
('DAN JHONATAN DA SILVA TEIXEIRA','201204940020','danjsteixeira@gmail.com'),
('DARLENE DOS REIS SOARES GONCALVES','199104940056',null),
('DAUCIKELEM BRAGA DOS SANTOS','199504940006',null),
('DAVID LEONARDO MIRANDA BENTOLILA','200404940017',null),
('DAVID SAMUEL BELICHA ISRAEL','200004940057',null),
('DAVI MITSUO DA SILVA SHIBAYAMA','199604940031',null),
('DAVISON HOLANDA PACHECO','200704940024','davisonph@ufpa.br'),
('DEDIER GOMES MERCES LIMA','200204940061',null),
('DEIVID TINOCO LEMOS','200304940034','detilufpa@yahoo.com.br'),
('DELCIO NONATO ARAUJO DA SILVA','199204940006',null),
('DELIANE DE JESUS ALVES DE ANDRADE','199904940042',null),
('DENIS TAVARES SILVA','199804940019',null),
('DERICK EDUARDO DIAS ROSA','201004940001','derickedu@gmail.com'),
('DEUZINEI PINHEIRO MIRANDA','200004940032',null),
('DIEGO JOSE CUNHA QUEIROZ','200104940021',null),
('DIEGO OLIVEIRA ABREU','201204940013','diegooabreu@gmail.com'),
('DILMA FARIAS VIANA','199104940010',null),
('DOGEVAL AUGUSTO SACHETT','199504940007',null),
('DOUGLAS BRITO DAMALIO','200304940032','ddamalio@yahoo.com.br'),
('DOUGLAS CARDOSO PINHEIRO','200204940069',null),
('DURVAL CASTRO DE BASTOS JUNIOR','199604940014',null),
('EDER CRUZ BARBOSA','200304940012','ponto_flutuante@yahoo.com.br'),
('EDER TAVEIRA DOS SANTOS','200504940038',null),
('EDGAR ALMEIDA MANESCHY','200204940043',null),
('EDGARD ASSUNCAO ARAUJO','199604940025',null),
('EDILA MARTA MIRANDA LOBO','199204940007',null),
('EDMAR LUIZ DA COSTA BENTES','199104940095',null),
('EDSON ALESSANDRO FAGUNDES COSTA','201404940001','ale-remo@hotmail.com'),
('EDSON COSTA DIAS','200304940015','ecdias@ufpa.br'),
('EDSON EUSTACHIO OLIVEIRA DE AZEVEDO','199404940006',null),
('EDSON PRESTES E SILVA JUNIOR','199304940009',null),
('EDSON SILVA DOS SANTOS','199204940008',null),
('EDUARDO COSTA DE CARVALHO','200704940030','duducostacarvalho@gmail.com'),
('EDUARDO DE CARVALHO LEITE','199704940014',null),
('EDUARDO LEAL GUERRA','199804940003',null),
('EDVIRGES MARIA DA SILVA NASCIMENTO','199204940009',null),
('EHILTON KAZUO CHIBA YOSHIDOME','201104940006','ekcy00@gmail.com'),
('ELAINE DO SOCORRO FURRIEL AMANAJAS','199204940010',null),
('ELDER DE JESUS FERREIRA DA SILVA','201004940006','elderferreirass@gmail.com'),
('ELENILTON ALEX SANTOS DA COSTA','200004940055',null),
('ELIAS SENA MORAES','201304940023','eliassm.ufpa@gmail.com'),
('ELINETE NUNES FREITAS','199104940057',null),
('ELISANGELA SANTANA AGUIAR','199504940009','eaguiar@ufpa.br'),
('ELIZEL PINHEIRO LEAL','200304940033',null),
('ELLTON SALES BARROS','201004940026','elltonsalesbarros@gmail.com'),
('ELTON JHON DIAS GONCALVES','200704940032','elton.private@gmail.com'),
('ELTON PENICHE QUARESMA','201504940035','eltonpeniche14@gmail.com'),
('EMANUEL ESTUMANO SANTOS','200104940042','emanuel.estumano@gmail.com'),
('EMANUEL NUNES REIS','200304940017',null),
('EMERSON JOSE SILVEIRA DA COSTA','199104940058',null),
('EMILIO JUN NAGAHAMA','199204940011',null),
('ERIC FELIPE DE OLIVEIRA PEREIRA','201104940012','eric.cbcc@gmail.com'),
('ERLON FONSECA PINHEIRO','201604940045','erlon.fpinheiro@gmail.com'),
('ERNANI DE OLIVEIRA SALES','200204940006','ernani@ufpa.br'),
('ESTHER CARDOSO DA SILVA','201404940009','esther.cardoso.silva@gmail.com'),
('EURICO OLIVEIRA DA ROCHA','199104940115',null),
('EVANDRO KOUJI DA SILVA TORII','200404940008',null),
('EVERTON MEIRELES COSTA','199904940050',null),
('EWELTON YOSHIO CHIBA YOSHIDOME','200504940019','ewelton.yoshio@gmail.com'),
('EWERTON ALMEIDA SILVA','200504940004',null),
('EWERTON DA COSTA VAZ','199304940010',null),
('EWERTON DAVID MARTINS LEITE','199404940009',null),
('EZEQUIAS CARLOS FERREIRA DA SILVA','199304940011',null),
('FABIANA RODRIGUES DE GÓES','200904940024','fabil.goes@gmail.com'),
('FABIO ALEX MENDES CAMPOS VASCONCELOS','201504940030','fa.vasconc@gmail.com'),
('FABIO AUGUSTO DAS DORES SILVA','199304940012',null),
('FABIO AUGUSTO GUIMARAES TEIXEIRA','200004940001',null),
('FABIO BRAGA DOS SANTOS','200304940026','fbragas@ufpa.br'),
('FABIO CARVALHO DA COSTA','199104940012',null),
('FABIO DE LIMA BEZERRA','199604940009',null),
('FABIO DE OLIVEIRA FERREIRA','199704940005',null),
('FABIO DE SOUZA MIRANDA','201704940029','fabiosouza21777@gmail.com'),
('FABIOLA PANTOJA OLIVEIRA','199304940013',null),
('FABIO MALCHER MIRANDA','201104940008','miranda.fmm@gmail.com'),
('FABIO MENDES MONTEIRO','199904940030',null),
('FABIO REIS SIZO NASCIMENTO','200304940027','fabiosizo@yahoo.com.br'),
('FABIO YU NAGAHAMA','199704940012','nagahama@yahoo.com'),
('FABRICIO JOSE UCHOA CORREA','199504940011',null),
('FABRICIO SILVA DE MAGALHAES','199804940011',null),
('FAGNER LEAL PANTOJA','200904940002','fagnerleal@ufpa.br'),
('FELIPE DE MELO RODRIGUES E OLIVEIRA','201704940017','sem.ideias.na.hora@gmail.com'),
('FELIPE ELIASQUEVICI','201304940003','felipe.quevici@gmail.com'),
('FELIPE GUSMAO ARAUJO','201604940033','shinakuma3000@hotmail.com'),
('FELIPE LEITE DA SILVA','200804940010','felipe.leite3@gmail.com'),
('FERNANDO CESAR SILVA DE MENEZES','199104940059',null),
('FERNANDO MENEZES MATOS','199604940012',null),
('FERNANDO SILVA VILA NOVA','200104940058','fernando.vilanova@gmail.com'),
('FILIPE DAMASCENO COELHO','201304940029','filipecoelho@ufpa.br'),
('FLAVIA COELHO PINHEIRO','200204940051',null),
('FLAVIO DIAS DE ASSUNCAO','200504940003','flavio.dias@yahoo.com.br'),
('FLAVIO JOSE FERRO BARROS','199204940012',null),
('FRANCISCO CARRERA NASCIMENTO JUNIOR','201304940028','francisco_nascimento@outlook.com.br'),
('FRANCISCO CESAR DE JESUS SILVA','199904940033',null),
('FRANCISCO COSTA COELHO JUNIOR','199504940012',null),
('FRANCISCO DEMARIM DE AGUIAR JUNIOR','201004940027','junior.demarimm@gmail.com'),
('FRANCISCO WERTHER SILVA DE SANTANA JUNIOR','200704940025','wertherjr@gmail.com'),
('FRANCIS JAMES VIANA RIBEIRO','199804940028',null),
('FRANK DA SILVA MALCHER','200104940008',null),
('FRANKLIM HARRISON MOREIRA DOS SANTOS','200204940027',null),
('FREDERICO NOBRE REIS','199904940020',null),
('GABRIELA FONSECA ANDRADE','200304940011','andrade.f.gabriela@gmail.com'),
('GABRIELA NUNES CAMPOS','199104940060',null),
('GABRIEL BELTRAO DE ABREU','201404940017','gab.abreu23@gmail.com'),
('GABRIEL DE MAGALHAES ESCUDEIRO','201304940019','gabrielescudeiro1@gmail.com'),
('GABRIEL DE SOUSA ARAUJO','200404940014',null),
('GABRIEL NUNES CRISPINO','201304940010','gabriel.crispino@hotmail.com'),
('GARDENIA VIEIRA DE ALBUQUERQUE','199104940015',null),
('GEORGE TASSIANO MELO PEREIRA','201304940008','george.melo7@gmail.com'),
('GESSICA PINHEIRO DE MORAES BATISTA','201204940022','gesspinhero@gmail.com'),
('GHISLENE BRITO DE FREITAS','199104940016',null),
('GILBERT ASDRUBAL HERNANDEZ LOURENCO','199204940041',null),
('GILMARA SANTOS DA SILVA','199704940015',null),
('GILSON TAVARES QUEIROZ','199704940022',null),
('GIORDANNA DE GREGORIIS','201304940009','gior.grs@gmail.com'),
('GIOVANI FONTENELLE COSTA','199104940062',null),
('GISSELEN RENEE DE OLIVEIRA SOUZA','200004940038',null),
('GLAUCO ESTACIO GONCALVES','200004940005',null),
('GLEFSON FRANCO CARNEIRO','200304940030',null),
('GLENON MATEUS BARBOSA ARAUJO','200704940017','glenonmateus@gmail.com'),
('GLEYSON DO NASCIMENTO GAMA','200604940035','gleysongama@gmail.com.br'),
('GUILHERME AUGUSTO BARROS CONDE','199304940015',null),
('GUILHERME FARIAS LIMA','201004940036','guilhermef.bcc@gmail.com'),
('GUILHERME SMETHURST ALBUQUERQUE','201604940009','guitrompa1@gmail.com'),
('GUSTAVO HENRIQUE SAMPAIO COUTO','199404940010',null),
('HAMILTON DA SILVA CAVALCANTE','200704940015','hamiltoncavalcante@gmail.com'),
('HAMILTON JOSE MORAES DE ALBUQUERQUE','200104940027',null),
('HAMILTON LUIZ RODRIGUES DE OLIVEIRA','199604940024',null),
('HEITOR DE OLIVEIRA MACEDO','201004940013','heitorom9@gmail.com'),
('HELDER KLEMP CORREA DA SILVA','200104940004',null),
('HELDER LUIZ BEZERRA DE OLIVEIRA GARCIA','199104940096',null),
('HELIO CARVALHO OLIVEIRA','199304940016',null),
('HELIO MARCOS PAZ DE ALMEIDA','199904940048',null),
('HENLY KOUICHI TSUCHIYA','199204940014',null),
('HERESSON JOÃO PAMPOLHA DE SIQUEIRA MENDES','200504940006','heresson@gmail.com'),
('HERIVELTON BARBOSA LIMA','199604940011',null),
('HUGO BRITO LIMA','201104940023','hugo141592@gmail.com'),
('HUGO CEZAR DO NASCIMENTO GOES','200104940052',null),
('HUGO PEREIRA KURIBAYASHI','200204940022','hugo@unifesspa.edu.br'),
('HUGO SAWADA TODA','200104940012','hogotoda@gmail.com'),
('HYAGO PINHEIRO COSTA OLIVEIRA','201004940015','hyagogow@gmail.com'),
('IAN CAMPOS BEZERRA REGO','201604940043','iancamposcc@gmail.com'),
('IGOR DE SOUZA ALMEIDA','200104940013',null),
('IGOR FURTADO CARVALHO','200604940011','igfuca@gmail.com'),
('IGOR MATHEUS SOUZA MOREIRA','201704940007','imatheus.sm@gmail.com'),
('IGOR SAMUEL MOREIRA DE MELO','200404940024','ivoquimico@gmail.com'),
('INGRID FURTADO RAIOL','201504940028','ingrid.frcomp@gmail.com'),
('IRAQUITAN CORDEIRO FILHO','200804940006','iraquitanfilho@gmail.com'),
('IROMAR GOMES DA SILVA','199104940116',null),
('ISABELA LOPES MAUES BATISTA','201704940005','maues.isa@gmail.com'),
('ISRAEL SEWANOU HOUNSOU','201504940001','hisara3@gmail.com'),
('ITALO RAMON DA COSTA CAMPOS','201504940012','italo.campos@icen.ufpa.br'),
('IVANDILSON DE SOUZA DUARTE','199804940017',null),
('IVAN DOS SANTOS MELLO','199104940017',null),
('JAIME DE MELO SABAT NETO','199304940017',null),
('JAIME NAZARENO DA SILVA SOARES JUNIOR','199104940019',null),
('JAIR DA SILVA FERREIRA JUNIOR','199504940013',null),
('JAIRO NASCIMENTO DE SOUSA FILHO','201604940016','jairofilho79@gmail.com'),
('JANAINA DE FATIMA ROLLA FERREIRA','199404940013',null),
('JANAINA DJENANE SOUZA CATETE','199104940117',null),
('JANNE YUKIKO YOSHIKAWA OEIRAS','199204940016',null),
('JANYNNE STEPHANIE DE OLIVEIRA PALHETA','201104940030','janynnepalheta@gmail.com'),
('JAYME DA COSTA CABRAL JUNIOR','201504940005','jaymejunior@yahoo.com.br'),
('JEAN CARNEIRO DO NASCIMENTO','201004940008','jeancnasc@hotmail.com'),
('JEAN MARCEL DOS REIS COSTA','200404940002',null),
('JEANNE DE OLIVEIRA PEREIRA','201304940002','jeanneop22@gmail.com'),
('JEFERSON MARCELO DE OLIVEIRA CAMARA','200004940031',null),
('JEFFERSON FERREIRA DE FIGUEIREDO JUNIOR','201004940014','jefjr2504@gmail.com'),
('JEFFERSON MIGUEL GONCALVES FERREIRA','199704940023',null),
('JEFFSON CELEIRO SOUSA','201504940027','jeffson.celeiro@gmail.com'),
('JESSE DE SOUZA SOARES','200004940002',null),
('JNANE DE SOUSA NEIVA','200004940022','jnane@ufpa.br'),
('JOAO CALDAS JUNIOR','199104940063',null),
('JOAO DE DEUS FERREIRA FILHO','201504940020','lubien1996@gmail.com'),
('JOAO JOSE CORSI FILHO','201004940018','jjcf_cc_ufpa@hotmail.com'),
('JOÃO JÚLIO SALVATTI NETO','200104940050','salvatti@ufpa.br'),
('JOAO MARCELO FREITAS DE ALMEIDA','201704940004','jmfda00@gmail.com'),
('JOAO MAURICIO SILVA DE CARVALHO','200004940047',null),
('JOAO PAULO SOUZA ALVES DE SOUZA','199904940043',null),
('JOAO PEDRO MOREIRA MORAES','201504940006','joaopedromoraes@outlook.com'),
('JOAO ROBERTO PINHEIRO DA CRUZ','199104940064',null),
('JOAO VICTOR DA SILVA DIAS CANAVARRO','201704940015','jvcanavarro@gmail.com'),
('JOAQUIM MAGNO CUNHA','199904940019','jmcpa1982@gmail.com'),
('JOEL COSTA DE OLIVEIRA','199504940014',null),
('JOERCIO DE SENA RODRIGUES','199404940014',null),
('JOGINETE PEREIRA ACRIAO','199304940018',null),
('JONATHAN TRINDADE DO NASCIMENTO','200004940017',null),
('JONATHAS REIS DA SILVA','199604940030',null),
('JONE KAZUKI YAMAGUCHI','200104940045',null),
('JORGE LUIS MORAES VALENTE','199104940065',null),
('JORGE LUIZ VASCONCELOS DE LIMA','200904940023','jorgedelima911@gmail.com'),
('JOSÉ AILTON SOARES VALADARES JÚNIOR','200404940023','ailtonvaladares@yahoo.com.br'),
('JOSE ALBERTO DE ANDRADE AVILA','200504940028','zeavila@gmail.com'),
('JOSE ALEX AIRES DOS SANTOS','199604940010',null),
('JOSEANE DE CASSIA DA SILVA VIANA','200204940037',null),
('JOSE ANTONIO SARMANHO DOS SANTOS FREIRE','199304940019','josesarmanho@ufpa.br'),
('JOSE CORREA DA SILVA JUNIOR','200904940028','correasjunior@gmail.com'),
('JOSE ENDERSON FERREIRA RODRIGUES','200104940041',null),
('JOSÉ FLÁVIO DE SOUZA DIAS JÚNIOR','200404940035','contato@joseflavio.com'),
('JOSE MARIA DE OLIVEIRA JUNIOR','200604940037',null),
('JOSE RAIMUNDO FREITAS DE MENESES','199604940037',null),
('JOSE RICARDO SIQUEIRA DE MIRANDA','199204940018',null),
('JOSUE PEREIRA DE CASTRO','199104940069',null),
('JO UEYAMA','199204940017',null),
('JOYCE CRISTINA SOUZA BASTOS','200604940023','joyce.csb@gmail.com'),
('JOZENILDO SOARES DE SOUZA','199204940019',null),
('JULIANO KAZUKI MATSUZAKI OYA','199804940004',null),
('JULIO VALENTE DA COSTA JUNIOR','199304940021',null),
('JUSSARA ALEIXO SILVA SOUSA','200004940014',null),
('KAE UCHOA SARMANHO','201304940012','kaeuchoa@hotmail.com'),
('KARLA NAZARE FERREIRA DAMASCENO','199804940021',null),
('KARLA SANTOS DE OLIVEIRA','200104940055','karla.santoli@gmail.com'),
('KARLYANNE PAOOLA SILVA BRAGA','201004940029','braga.paoola@gmail.com'),
('KAZUSHIGE BATISTA MATSUMOTO','199204940020',null),
('KEISE BARBOSA PEIXOTO','199704940003',null),
('KELLY DO SOCORRO SILVA DA COSTA','201604940040','kellydosocorro@gmail.com'),
('KELLY ROBERTA TORRES GUIMARAES','200104940032',null),
('KELVIN LOPES DIAS','199104940021',null),
('KIWAKO BATISTA MATSUMOTO','199304940022',null),
('KIZZY BEZERRA THE','199704940024',null),
('KLEBER MENDONCA DE MELO','200904940036','kleber.mendonca@hotmail.com'),
('KLEBER PALHETA SILVA','199504940034',null),
('KLEDER MIRANDA GONCALVES','199804940023',null),
('KLESSIS LOPES DIAS','199804940025',null),
('KLEVERTON CARLOS MACEDO DE OLIVEIRA','200704940021','kleverton.macedo@gmail.com'),
('KLISSIOMARA LOPES DIAS','199504940016',null),
('KYLME IKEGAMI SAKIYAMA','199704940029',null),
('LANA PRISCILA DA SILVA FERREIRA','201204940009','lanapsf@gmail.com'),
('LANA RAQUEL SOUZA DE SOUZA','199404940017',null),
('LARISSA FERNANDES CHAGAS','200504940030','alilari@uol.com.br'),
('LAUDEMIRA PACHECO FARIAS','200204940033','laudafarias@yahoo.com.br'),
('LEANDRO BEZERRA COUTINHO','200704940034',null),
('LEANDRO HENRIQUE SANTOS CORREA','200804940008','hscleandro@gmail.com'),
('LEANDRO LAGES DE CARVALHO FARIA','199904940012',null),
('LEANDRO ORLANDO SOUSA DA SILVA','201404940031','le-an-dro95@hotmail.com'),
('LEANDRO PANTOJA PEREIRA','200204940039',null),
('LEDA MARA SOUZA DE OLIVEIRA MONTEIRO','199104940121','ledaoliveiramonteiro@gmail.com'),
('LENON JOSE COSTA RAIOL','199804940012',null),
('LEOMARIO SILVA MACHADO','200604940025','leomarioguitarr@yahoo.com.br'),
('LEONAM GAMA DA SILVA','200904940033','leohenryster@gmail.com'),
('LEONARDO ATHANAZIO DE CERQUEIRA GATTI','199804940026',null),
('LEONARDO AUGUSTO SOUZA AFONSO','201204940026','nardoasafonso@gmail.com'),
('LEONARDO BARBOSA FURTADO','201604940024','srleonardofurtado@gmail.com'),
('LEONARDO CHRISTIAN FERREIRA DA COSTA','201504940019','leonardo.chfc@gmail.com'),
('LEONARDO CORREA BAIMA','200104940009',null),
('LEONARDO DE SOUSA RAMOS','200904940007','leosr89@gmail.com'),
('LEONARDO HIROKAZU DE SOUZA HAMADA','199704940008',null),
('LEONARDO JUNQUEIRA DA SILVA VALENTE','200104940048','leonardovalente@gmail.com'),
('LEONARDO PATRICIO FERREIRA BARBOSA','200304940004','leonardopfb@gmail.com'),
('LEONARDO SANTOS FORMENTO','201104940007','leonardo.santos.formento@gmail.com'),
('LEONARDO SARRAFF NUNES DE MORAES','200704940005','leonardosarraff@gmail.com'),
('LEONARDO YOICHI FEIO OKADA','200104940014',null),
('LICIA CRISTINA BRITO DE CARVALHO','199404940041',null),
('LIDIANE PARENTE ANDRADE','200004940007',null),
('LIGEIA DE ALMEIDA ALENCAR','199404940018',null),
('LIKEN IU MATSUMOTO CORREIA LIMA','200404940025','liken_iu@yahoo.com.br'),
('LILIAN SANTOS FERREIRA DA SILVA','200904940017','lilianferreira@ufpa.br'),
('LINDALVO GONZAGA DE ALCANTARA NETO','199104940023',null),
('LIS WEIJI KANASHIRO PEREIRA','200304940001',null),
('LIVIA RENATA VALE FRANCO DE SA','199804940006',null),
('LOUISE GONCALVES DE BARROS','200404940012','louisebarros@yahoo.com.br'),
('LUCAS DE MELO SILVA','200804940007','lucasmelo@ufpa.br'),
('LUCAS FELIPE FERRARO CARDOSO','201604940042','luks.ferraro@gmail.com'),
('LUCAS GABRIEL DE SOUZA','201604940039','lucassouzaufpa@gmail.com'),
('LUCAS RODRIGUES GUIMARAES','201404940005','lucasrodriguesgui@hotmail.com'),
('LUCAS TAVARES MONTEIRO','201404940026','tavares.lucas1996@gmail.com'),
('LUCELIA PEREIRA GONCALVES','200304940006','luceliapgoncalves@gmail.com'),
('LUCIANA CRISTINA MARTINS','199304940023',null),
('LUCIANA DE NAZARE PAIVA NUNES','199604940013','paiva@ufpa.br'),
('LUCIANA LIMA BRITO','201204940031','lucianabrito@openmailbox.org'),
('LUCIANA MARIA AZEVEDO NASCIMENTO','199904940026','luma@ufpa.br'),
('LUCIANA TOUREIRO HAGE','199104940024',null),
('LUCIENE PEREIRA COSTA','199404940020',null),
('LUCIO EDUARDO SOLANO REIS','199104940071',null),
('LUIS MIGUEL FONSECA DE MORAIS','199504940030',null),
('LUIZ ACACIO CENTENO CORDEIRO JUNIOR','199904940029',null),
('LUIZ ALANO ALEXANDRE LOPES','199404940021',null),
('LUIZ ALBERTO DA SILVA FILHO','200204940017','lasf_bel@yahoo.com.br'),
('LUIZ ALBUQUERQUE LEAO','199604940022',null),
('LUIZ AUGUSTO MONTEIRO ROSO DANIN','201104940004','luizdanin@gmail.com'),
('LUIZ DANIEL CREAO AUGUSTO','200104940005',null),
('LUIZ DOURADO DIAS JUNIOR','199904940015','ldourado1980@globo.com'),
('LUIZ GUSTAVO COSTA CARVALHO','200004940037',null),
('LUIZ OTAVIO DA SILVA BARATA','200104940030',null),
('LUIZ TOME VILHENA DANTAS NETO','200004940035',null),
('LUIZ WALDOMIRO MONTEIRO NETO','199104940072',null),
('LUZIO SANTANA DA SILVA FILHO','200204940042','filholuzio@gmail.com'),
('LUZONILDO LEAO DA SILVA','199204940021',null),
('MANOEL AFONSO PEREIRA DE LIMA FILHO','201004940009','manoel.afonsoo@gmail.com'),
('MANOEL FREDERICO BELTRAO ROSAS JUNIOR','199504940018',null),
('MANUELA DE JESUS SEMBLANO BITTENCOURT','199704940010',null),
('MARCEL ABREU DA MOTA','200004940050',null),
('MARCELA PIEDADE DO AMARAL','199104940026',null),
('MARCELIO D OLIVEIRA LEAL','200004940029',null),
('MARCELLA LETICIA DE SOUZA COSTA','200004940008',null),
('MARCELLE PEREIRA MOTA','200304940014','mpmota@ufpa.br'),
('MARCELLO ADOLFO VELOSO DA SILVA','199504940035',null),
('MARCELO ALMEIDA DA SILVA','200204940013','mas@ufpa.br'),
('MARCELO ANDRADE DA GAMA MALCHER','200004940028',null),
('MARCELO ANDRADE PEREIRA','200204940019',null),
('MARCELO ANTONIO ALVES ALENCAR','201404940014','marceloalves@ufpa.br'),
('MARCELO DE BRITO GARCIA','199704940004',null),
('MARCELO MAIA DA SILVA','200904940027','mmaia.cc@gmail.com'),
('MARCELO NASCIMENTO COSTA','199404940022',null),
('MARCELO RIBEIRO ALBERNAZ','200204940050',null),
('MARCELO SAMUEL DA COSTA MAGALHAES','199504940019',null),
('MARCIA ANDREA DE CARVALHO FREITAS','199204940022',null),
('MARCIA CRISTINA MONTEIRO DE MORAES','199804940002',null),
('MARCIA MARIA DA SILVA AMARAL','199504940020',null),
('MARCIO AMAZON KOHLER DA C KURIBAYASHI','199104940123',null),
('MARCIO AUGUSTO PEREIRA BAILOSA','199104940098',null),
('MARCIO BRAGA DOS SANTOS','200204940035',null),
('MARCIO FREITAS CABRAL DA LUZ','199604940003',null),
('MARCIO KUROKI GONCALVES','200204940031',null),
('MARCO ANTONIO FAGUNDES DE MORAES','199204940023',null),
('MARCOS AURELIO TRAJANO DE ASSIS','199104940027',null),
('MARCOS ROMERO GONZAGA DE ALMEIDA','199904940005',null),
('MARCOS SENNA BENAION LEAL','201204940019','marcosbenaion@gmail.com'),
('MARCUS DE BARROS BRAGA','199104940106',null),
('MARIA ADALZIRA SEIXAS LOPES','199204940024',null),
('MARIA ANDRÉIA RODRIGUES DOS SANTOS','199504940021','mariaandreia@ufpa.br'),
('MARIANA DE NAZARE DOS ANJOS LIMA','200004940011',null),
('MARINA ATSUMI OIKAWA','200104940007',null),
('MARINA NERY BRACCHI','199404940025',null),
('MARIO DO SOCORRO JARDIM MONTEIRO','200004940030',null),
('MARISSA BRASIL DE CARVALHO','201104940005','marissabc@ufpa.br'),
('MARJORIE PEREIRA MARQUES','201004940010','marjoriepmarques@gmail.com'),
('MARLOS BATISTA FERREIRA','200204940026','marlos_ferreira@yahoo.com.br'),
('MARLOS DE MORAES TAVARES','200604940027','marlos1415@gmail.com'),
('MARTHA CASTELLO BRANCO DE MELLO','199104940124',null),
('MARYANNE PACHECO SOEIRO DE BARROS','200304940031',null),
('MASAO IIDA','199704940021',null),
('MATEUS PINTO RODRIGUES','201204940006','mprodrigues@openmailbox.org'),
('MATHEUS FERREIRA FREIRE','201104940020','matheusfreire.cbcc@gmail.com'),
('MATHEUS OLIVEIRA LEITE DE SA','201504940018','sa.matheus.leite@gmail.com'),
('MAURICIO PIO DE LACERDA','199904940025',null),
('MAURICIO RONNY DE ALMEIDA SOUZA','200504940015','mauricio.ronny@ufla.br'),
('MAX HIDEYUKI MATSUZAKI','199304940028',null),
('MAXWEL MACEDO DIAS','200404940028','maxwelmdias@gmail.com'),
('MAYARA COSTA FIGUEIREDO','200404940001','mcfigueiredo@ufpa.br'),
('MELINA DE VASCONCELOS ALBERIO','199804940022',null),
('MELISSA SA OTERO','199304940029',null),
('MICHELL COSTA OLIVEIRA DA CRUZ','201104940035','michellkruz@gmail.com'),
('MICHEL PENA DOS SANTOS NERY','200004940049',null),
('MIGUEL FORMIGOSA SIQUEIRA','199904940047','migsiq2@gmail.com'),
('MIGUEL JOSE DE ALMEIDA PERNAMBUCO FILHO','200504940016','mp_godan@hotmail.com'),
('MIGUEL PEREIRA MARQUES','199404940026',null),
('MILENA HELLEM BEZERRA DA SILVA','199604940027',null),
('MILENA RAYANE DOS SANTOS GALVAO','200904940030','milenarayane@ufpa.br'),
('MIZAEL PANTOJA MONTEIRO','200604940020','mizaelm2@yahoo.com.br'),
('MOISES BEN HUR SOUSA SEIFFERT SIMOES','199604940016',null),
('MOISES FELIPE MELLO DA SILVA','201204940021','moises.silva@icen.ufpa.br'),
('MONICA DE NAZARE TAVARES DE PAULA GOYANA','199304940030',null),
('MONICA FERNANDES DA SILVA','199604940004',null),
('MOSHE DAYAN SOUSA RIBEIRO','200504940008','mosheribeiro@yahoo.com.br'),
('MURILO FARIAS SALES','200204940045','murilosalles@yahoo.com.br'),
('NATALIA COUTO DIAS','200104940056',null),
('NAYME CRISTHINA GOMES DE ALMEIDA','199104940036',null),
('NELSON BRAZAO MACIEL JUNIOR','199304940031',null),
('NICOLI DA SILVA PEREIRA DE SOUZA','201104940037','nickspsouza@gmail.com'),
('NIKOLAS JORGE SANTIAGO CARNEIRO','201104940009','nikolas.carneiro@gmail.com'),
('NILSON JOSE MENDES DA COSTA FILHO','199904940040',null),
('NOEL BASTOS GONZAGA','199404940027',null),
('ODNALRO CRUZ VIDEIRA JUNIOR','200004940009',null),
('OLINDA MIOKA CHUBACHI','199104940028',null),
('OSIEL MARLON NEGRAO DA SILVA','199704940011',null),
('OTÁVIO NOURA TEIXEIRA','199504940023','onoura@gmail.com'),
('OTAVIO RODRIGUES JUNIOR','200004940053','orvoltz@gmail.com'),
('PATRICIA MATIAS LOPES','200404940011','patriciaufpa@gmail.com'),
('PAULA DANIELE DE OLIVEIRA MOREIRA','200204940021','pdanni@gmail.com'),
('PAULA JOSIANE DE SA SANTOS','199104940100',null),
('PAULO ANDRE EVANGELISTA DA SILVA','199304940032',null),
('PAULO CLEITON VIEIRA DA SILVA','200304940036','paulocleiton@ufpa.br'),
('PAULO FERNANDO SOUZA RODRIGUES JUNIOR','200504940031','pjpaulor@gmail.com'),
('PAULO GLEIDSON RISUENHO PEINADO','199704940019',null),
('PAULO GUILHERME DOS SANTOS NASCIMENTO','199104940087',null),
('PAULO JORGE OLIVEIRA BRAGA','199104940101',null),
('PAULO NAZARENO MAIA SAMPAIO','199104940128',null),
('PAULO ROBERTO SILVA CHAGAS JUNIOR','201104940001','paulo.robertojr100@gmail.com'),
('PAULO ROBSON CAMPELO MALCHER','200804940027','prcmalcher@gmail.com'),
('PAULO RUDOLPH DA SILVA NASCIMENTO','200504940009','paulorudolph07@gmail.com'),
('PAULO SENA FERREIRA FILHO','201404940044','paulosena99@gmail.com'),
('PAULO SERGIO DOS SANTOS COSTA','199104940029',null),
('PAULO SERGIO LAMEIRA SANTOS','199104940075',null),
('PAULO SERGIO SILVA RODRIGUES','199304940033',null),
('PAULO TAKASHI SAWAKI FILHO','199404940029',null),
('PAULO VICTOR DE LIMA SFAIR ALVARES','201304940021','pvsfair@gmail.com'),
('PAULUS ROBERTO GUEIROS ANGLADA','200204940010','paulusanglada@hotmail.com'),
('PEDRO AFONSO NASCIMENTO DE AVIZ','200804940021',null),
('PEDRO NOLASCO FERREIRA NETO','200104940060',null),
('PEDRO VICTOR AROUCK MELO','201704940003','ppvitorr@gmail.com'),
('PRISCILA CORREA SABOIA','199904940007',null),
('PRISCILA GOES BURLE','200204940009',null),
('PRISCILLA LANNE CORDEIRO DE LEAO','199404940042',null),
('RAFAELA DA SILVA LOBO','200104940040',null),
('RAFAEL DA SILVA TAKASHIMA','200304940009',null),
('RAFAEL FREITAS DE MORAIS','200304940028',null),
('RAFAEL LOPES GOMES','200504940018','rafaellgom@gmail.com'),
('RAFAEL MARTINS FEITOSA','200404940007','rafaelmf@ufpa.br'),
('RAFAEL MESQUITA DO MAR','200804940029','rafamesquita89@gmail.com'),
('RAFAEL NASCIMENTO DE SOUSA','201604940041','rafaelsousa2187@gmail.com'),
('RAFAEL NASCIMENTO DE SOUZA','200904940012','nascimento.rsouza@gmail.com'),
('RAFAEL PEREIRA ESTEVES','200204940001',null),
('RAFAEL VERAS GUIMARAES','200604940002','rafaveguim@gmail.com'),
('RAIMUNDO FERNANDO BENTES DAS CHAGAS JUNIOR','201504940004','rfbcj@hotmail.com'),
('RAISSA LORENA SILVA DA SILVA','201104940013','r.lorenna@gmail.com'),
('RAMIRO LUZ VERGOLINO ZAHLOUTH','201004940040','ramiroserge@gmail.com'),
('RAMON DA GAMA CORDEIRO','201304940013','ramonestii@gmail.com'),
('RAMON FALSONI','200704940011','ramonfalsoni@hotmail.com'),
('RAMON TORRES CRUZ','200604940009','ramontcruz@gmail.com'),
('RANIERI BARROS TEIXEIRA','200604940024','ranieri@ufpa.br'),
('RAPHAEL BRITO DE PAIVA','200504940033',null),
('REGIANE ANDRADE BRITO','199904940003',null),
('REGIANE LIMA DE SOUSA','199804940024',null),
('REGIANE YUMIKO DA SILVA KAWASAKI','199104940032',null),
('REGINALDO CORDEIRO DOS SANTOS FILHO','201004940002','regicsf2010@gmail.com'),
('REGINALDO TERUYOSHI HAMAGUCHI','199204940031',null),
('REGINA NAOMI TANAKA','199204940029',null),
('REINALDO GIL LIMA DE CARVALHO','200104940057','reinaldoc@gmail.com'),
('RENAN FILIP COSTA BALIEIRO','201304940011','Renanf016@gmail.com'),
('RENAN FONSECA CUNHA','201704940034','renancunhafonseca@hotmail.com'),
('RENAN LOBO DUARTE','201504940029','renan.leviathan@gmail.com'),
('RENAN SALES BARROS','200604940010','renan3mf@hotmail.com'),
('RENAN THIAGO DA SILVA ROSA','201304940032','renannojosa@gmail.com'),
('RENATA PEREIRA BAENA','200304940002',null),
('RENATO FIGUEIRO MAIA','199704940006',null),
('RENATO JOSE LIMA MOTA','201704940001','Rjlmota@gmail.com'),
('RENATO PENNAFORT ROCHA','200604940007','pennafort22@gmail.com'),
('RENATO RENISON MOREIRA OLIVEIRA','201004940011','renato.renison@gmail.com'),
('RENATO WILSON SOUZA DE OLIVEIRA','199704940035',null),
('RICARDO ANDRE CAVALCANTE DE SOUZA','199304940034',null),
('RICARDO BASTOS ARRAES','201304940001','ricardo@vfatec.com.br'),
('RICARDO CARVALHO DE SOUZA','200004940015',null),
('RICARDO CESAR FREITAS DE SOUZA','199904940011',null),
('RICARDO DE FARIAS SANTOS','199304940035',null),
('RICARDO IUNES COSTA','199804940020',null),
('RICHARD DIAS DA COSTA','199304940036',null),
('RITA DE CASSIA DAVID DAS NEVES','199404940031',null),
('ROBERTA DE OLIVEIRA CAVALCANTE','199304940037',null),
('ROBERTA MACHADO BRASIL DE LIMA ARAUJO','199404940032','robertaba@gmail.com'),
('ROBERTA VILHENA VIEIRA','199104940076',null),
('ROBERTO DE ARAUJO MOURA','199704940002',null),
('ROBERTO FRANKLIN MOREIRA CARDOSO','200404940030',null),
('ROBERTO NOGUEIRA LIMA','199104940102',null),
('ROBERTO PINHEIRO DA FONSECA','200804940033','roberto.pinheiro@hotmail.com.br'),
('ROBERTSON DIOGO DE MORAES BANDEIRA','200104940037',null),
('ROBSON DA SILVA AGUIAR','200404940018','robsonaguiar@ufpa.br'),
('RODOLFO FIEL DE SOUSA','200304940023','rodolfo_fiel@yahoo.com.br'),
('RODOLFO MOACIR SEABRA JUNIOR','199604940029',null),
('RODRIGO ARAUJO BARBALHO','200604940044','rodbarbalho@gmail.com'),
('RODRIGO CUNHA MENDES','199504940026',null),
('RODRIGO DE BRITTO PONTES RODRIGUES PARA','200904940003','rodrigopara@gmail.com'),
('RODRIGO DE FREITAS VALE','199404940033',null),
('RODRIGO HENRIQUE BARBOSA MONTEIRO','201404940012','rodrigo99monteiro@gmail.com'),
('RODRIGO PINTO CARDOSO','199904940014',null),
('RODRIGO QUITES REIS','199104940077',null),
('RODRIGO SILVA PINTO','199904940058',null),
('ROGERIO FIGUEIREDO DE BRITO','199104940078',null),
('ROMULO PINTO DE ALBUQUERQUE','200504940022','albuquerque@ufpa.br'),
('RONALD ASSUNCAO SOUZA','201104940029','ronaldsouza16@hotmail.com'),
('RONALDD PATRIK SILVA PINHO','201704940035','RONALDPPINHO@GMAIL.COM'),
('RONALDO CUNHA GOMES','200504940047',null),
('RONALD RIBEIRO SILVA','200904940019','ronaldsilva852@gmail.com'),
('ROSANA CERES EVANGELISTA KALIL','200104940036',null),
('ROSANA DE NAZARE MENEZES MATOS','199104940079',null),
('ROSARINA MARIA PINHEIRO RODRIGUES','199104940046',null),
('ROSSANA DA CUNHA SILVA','199804940010',null),
('RUBENS FERNANDES ROCHA','200504940045','profrubensfr@ig.com.br'),
('RUBIA CRISTIANE BORGES CASTRO','199704940026',null),
('RUI DE ALMEIDA MACOLA','199104940080',null),
('SALOMAO FERNANDES DE FREITAS JUNIOR','199204940033',null),
('SAMIRA MARIA LUZ CARMO','199204940034',null),
('SAMUEL FELIX DE SOUSA JUNIOR','200504940007','sfelixjr@gmail.com'),
('SAMUEL MARQUES CAMPOS','200004940042','samcampos81@gmail.com'),
('SANDRO MARCELO ATI TADAIESKY','199204940035',null),
('SANDY ANDRADE FARO','201604940027','sandyfaro0@gmail.com'),
('SANDY EVELON CUNHA DAS NEVES','200004940034',null),
('SAUL CAMPOS BERARDO','200404940005','saul.berardo@gmail.com'),
('SAVANA CECILIA PARGA CARNEIRO','200104940003',null),
('SCHUBERT RIBEIRO DE CARVALHO','199604940021',null),
('SEBASTIAO ALESSANDRO LINHARES DOS SANTOS','199204940036',null),
('SEBASTIAO ANTONIO V DE FARIAS JUNIOR','199904940038',null),
('SEBASTIAO BORGES FONSECA','199904940004','sababorges@gmail.com'),
('SEBASTIAO DE SOUSA MESQUITA','199404940034',null),
('SERGIO ANGELO CAMPOS ALVES','199104940081',null),
('SERGIO RICARDO LIMA DA SILVA','199204940038',null),
('SHIRLEY DOS SANTOS SALES BAIMA PINTO','199104940047',null),
('SIDNEY MASAHARU MATSUNAGA','200104940025',null),
('SILVANA ROSSY DE BRITO','199104940132',null),
('SILVIA CRISTINA NUNES DAS DORES','200704940018',null),
('SILVIA DAS DORES RISSINO','199104940133',null),
('SILVIO CARLOS AZEVEDO ANDRADE','199504940033',null),
('SIMEAO SANTOS DAS DORES','199404940035',null),
('SIMONE BACELLAR LOPES','200104940002',null),
('SIMONE FONSECA FERREIRA','200304940013','simonefonseca@yahoo.com.br'),
('SIMONE NAYARA COSTA CARNEIRO','200604940014','simone.nara@gmail.com'),
('SUELEN BRAGA BRABO','200804940036','suelenbbrabo@gmail.com'),
('SUELLEN PATRICIA SILVESTRE RIBEIRO ALBERNAZ','200404940021','SUELLENPSR@UFPA.BR'),
('TACIO VINICIUS BERNARDES RIBEIRO','200204940014','tacio@ufpa.br'),
('TAINA INAIE DOS SANTOS DA SILVA','201504940007','taina.inaie@gmail.com'),
('TALES CHENE DE MIRANDA','200704940008','tales.miranda84@gmail.com'),
('TALITA VIEIRA RIBEIRO','200704940004',null),
('TALVANE GLAUBER LOPES DE LIMA','201104940031','talvane.glauber@gmail.com'),
('TAYANA UCHOA CONTE','199104940035',null),
('TEOFILO AUGUSTO BORDALO DE SOUZA VIEIRA','200804940002','teo@ufpa.br'),
('TEREZA CONCEICAO AKI BARROS KANZAKI','199104940103',null),
('THALES SILVA DE SOUSA','201304940014','thales_cross@hotmail.com'),
('THAYS DHANDARAH RODRIGUES SA','201404940010','dhandarah1996@gmail.com'),
('THIAGO FONSECA DE ANDRADE','200304940025',null),
('THIAGO JORGE ALMEIDA DOS SANTOS','200704940006','thiago.tjas@gmail.com'),
('THIAGO RUBENI ALVES DA SILVA','200104940054',null),
('THIAGO SYLAS ANTUNES DA COSTA','201004940022','tsylasac@gmail.com'),
('TIAGO DAVI OLIVEIRA DE ARAUJO','201104940024','tiagodavi70@gmail.com'),
('TUBY D OLIVEIRA NETO','201704940006','netotuby@gmail.com'),
('ULISSES MARTINS DIAS','200004940004',null),
('URIEL FERREIRA CAMPOS','201504940023','urielfcampos95@gmail.com'),
('VAGNER NOGUEIRA SILVA','200404940013','vagner.nogueira@gmail.com'),
('VALERIA FREITAS SOUSA','199904940049',null),
('VALERIA GOMES DA CAMARA CORECHA BASTOS','199104940104','valeria@ufpa.br'),
('VANA DO CARMO CARVALHO PEREIRA','199104940082',null),
('VANDERLENE COVRE ROCHA','200004940019',null),
('VICTOR AMARANTE DE BARROS','199104940083',null),
('VICTOR ESPINDOLA MARTINS','200404940004','ccvem@yahoo.com.br'),
('VICTOR LOURENCO GARCIA DA CUNHA','200104940044',null),
('VICTOR LUIZ SANTOS NEGRAO','200904940006','victorlsn@gmail.com'),
('VINICIUS LIMA DA SILVA','199804940009',null),
('VITOR LIMA COELHO','200804940004','vitorlimac2@gmail.com'),
('VITOR NOVAES CANTAO','201704940018','vitornovaes.cantao@gmail.com'),
('VITOR PINHEIRO FEITOSA','200504940001','vfeitosa86@hotmail.com'),
('VIVIANE SOARES GRIECO','200104940018',null),
('WAGNER FELIDRE NEGRAO DA SILVA','201704940043','wagnerfelidre@gmail.com'),
('WALISSON CARDOSO GOMES','201204940001','walissoncardosogomes@gmail.com'),
('WALLACE MICHEL PINTO LIRA','200504940005',null),
('WALLACE PACHECO PEREIRA','201404940028','wallacecovic@yahoo.com.br'),
('WALMIR PORTAL DOS SANTOS JUNIOR','200704940031','walmir.psj@gmail.com'),
('WANESSA MELO DA SILVA','200604940029','wnessms@hotmail.com'),
('WANILSON MIRANDA DE FIGUEIREDO','199304940040',null),
('WANJA DANIELLE DA SILVA MOTA','199504940028',null),
('WASHINGTON NEVES DE ALMEIDA','199504940029',null),
('WEILA SHEYLA DE MELO BRITO','199404940038',null),
('WELLSON SERGIO BITENCOURT DOS SANTOS','200804940009','fmwellson@yahoo.com.br'),
('WENDEL RENAN MACEDO DOS SANTOS','201104940017','wendelrenann@gmail.com'),
('WESCLEY PIMENTEL FONTES','199804940008','wescley.fontes@gmail.com'),
('WESLEY HANANI PINTO DO CARMO','200104940061','wesleyhanani@yahoo.com.br'),
('WEVERTON LUIS DA COSTA CORDEIRO','200204940016','wevertoncordeiro@gmail.com'),
('WILLIS DO SOCORRO A DE CAMPOS','199104940084',null),
('YANN FABRICIO CARDOSO DE FIGUEIREDO','201704940026','yann.fabricio@hotmail.com'),
('YASMIN LUANA SALES DA PAZ','201304940005','paz.yasminl@gmail.com'),
('YOSSEF GABRIEL OLIVEIRA CASTELO','200504940035','castelo@ufpa.br'),
('YVAN PEREIRA DOS SANTOS BRITO','201304940016','yvanbrito96@gmail.com'),
('Abraham Lincoln Rabelo De Sousa',null,'rabelo.lincoln@gmail.com'),
('ADAILTON MAGALHAES LIMA',null,'adailtulima@gmail.com'),
('Adalberto Cavalcante de Melo',null,'adalbertocmelo@gmail.com'),
('Adrianne Veras de Almeida',null,'adrianne.veras@outlook.com'),
('Alen Costa Vieira',null,'alencv@gmail.com'),
('Allan Douglas Bento da Costa',null,'allandoug@gmail.com'),
('Ana Larissa da Silva Dias',null,'larissa.engcomp@gmail.com'),
('Anderson Gregório Marques Soares',null,'andersonsoares@ufra.edu.br'),
('Anderson Gregório Marques Soares',null,'anderson.gmarques@gmail.com'),
('Anderson Trindade Maia',null,'anderson_detran@hotmail.com'),
('André de Jesus Araújo Ramos',null,'andre.rammos7@gmail.com'),
('André Figueira Riker',null,'andre.riker@gmail.com'),
('Benedito de Souza Ribeiro Neto',null,'ditoneto@gmail.com'),
('Breno Bernard Nicolau de França',null,'bfranca@unicamp.br'),
('Bruno Garcia da Costa',null,'upbrunogc@gmail.com'),
('Bruno Pereira Brito',null,'britodi@gmail.com'),
('Carlos Gustavo Resque dos Santos',null,'gustavo.cbcc@gmail.com'),
('Carlos Takeshi Kudo Yasojima',null,'takeshiyasojima@gmail.com'),
('Cassio Trindade Batista',null,'cassio.batista.13@gmail.com'),
('Cesar Siqueira de Oliveira',null,'avcesar@gmail.com'),
('Claudomir Cardoso de Carvalho Junior',null,'claudomir.junior@ifma.edu.br'),
('Clay Palmeira da Silva',null,'dom.clay@yahoo.com.br'),
('Cleyton Aparecido Dim',null,'cleytondim@ufpa.br'),
('Cynthya Letícia Teles De Oliveira',null,'cynthya.telles@gmail.com'),
('Daniel Leal Souza',null,'daniel.leal.souza@gmail.com'),
('Danileno Meireles do Rosario',null,'lenomeireles@gmail.com'),
('Diego Bento Aires Teixeira',null,'diegoaires@gmail.com'),
('Diego Hortêncio dos Santos',null,'hortencio1983@gmail.com'),
('Diego Oliveira Abreu',null,'diegoabreuengcomp@gmail.com'),
('Eddas Josue Bertrand Martinez',null,'eddasjbertrand@gmail.com'),
('Edian Franklin Franco De Los Santos',null,'edianfranklin@gmail.com'),
('Edinaldo João Costa de La-roque',null,'edinaldo.laroque@gmail.com'),
('Edson Koiti Kudo Yasojima',null,'koitiyasojima@gmail.com'),
('Eduardo Gabriel Lima da Silva',null,'eduardolima.ufpa@gmail.com'),
('Eduardo Paulo Marques Raiol',null,'marquesraiol@gmail.com'),
('Edwin Jahir Rueda Rojas',null,'ejrueda95g@gmail.com'),
('Elisiane Monteiro Soares',null,'elismclean@gmail.com'),
('Elziane Monteiro Soares',null,'msoares.elziane@gmail.com'),
('Emanuel Montero Espaillat',null,'emanuel.montero.e@gmail.com'),
('Erick Modesto Campos',null,'erick.c.modesto@gmail.com'),
('Ericson Sarmento Costa',null,'ericsonsarmento+ppgcc@gmail.com'),
('Estêvão Damasceno Santos',null,'estevaosantos265@gmail.com'),
('Fabio Malcher Miranda',null,'fabiomm@ufmg.br'),
('Fabio Rocha de Araujo',null,'fabioaraujo289@gmail.com'),
('Fabricio wickey da silva garcia',null,'fabriciogarcia@ufpa.br'),
('Fabricio Wickey da Silva Garcia',null,'fabriciowsgarcia@gmail.com'),
('Felipe Rocha de Araújo',null,'felipearaujo289@gmail.com'),
('Fernando Nazareno Nascimento Farias',null,'fernnf@gmail.com'),
('Gilson Rocha Silva',null,'gilsonrocha@gmail.com'),
('Hernan Dario Carreño Laguado',null,'hernan.laguado@gmail.com'),
('Hilton Prado de Castro Junior',null,'hilton.castro@ifap.edu.br'),
('Hugo Brito Lima',null,'hugoblim@gmail.com'),
('Iago Lins de Medeiros',null,'iagolmedeiros@gmail.com'),
('Igor da Penha Natal',null,'igorpnatal@gmail.com'),
('Igor Ernesto Ferreira Costa',null,'IGGOR16@GMAIL.COM'),
('Isadora Mendes dos Santos',null,'isadoramsantos@gmail.com'),
('Ivo de Abreu Araújo',null,'ivoabreu94@gmail.com'),
('Jadielly Fernandes Oliveira Treccani',null,'jadielly.oliveira@gmail.com'),
('Jailton Wagner Rodrigues Tavares',null,'jwagner28@gmail.com'),
('Jair da Silva Ferreira Junior',null,'jair.jr.j2@gmail.com'),
('Jean Carlos Arouche Freire',null,'jeanarouche@gmail.com'),
('Jefferson Magalhães de Morais',null,'jeffersonmorais@gmail.com'),
('Joahannes Bruno Dias da Costa',null,'joahannes@gmail.com'),
('João Júlio Salvatti Neto',null,'salvatti@gmail.com'),
('Jonathas Pinheiro Trindade',null,'jonathasp6@gmail.com'),
('José de Sousa Ribeiro Filho',null,'jose.sousa.filho@gmail.com'),
('José Flávio de Souza Dias Júnior',null,'joseflaviojr@gmail.com'),
('Julio Cezar Costa Furtado',null,'furtado@unifap.br'),
('Karla Suely Diniz da Costa',null,'k_info_04@yahoo.com.br'),
('Larissa Monteiro Pimentel',null,'larissamonteiropimentel@gmail.com'),
('Lena Patrícia Souza Rodrigues',null,'patricia.souza@ufra.edu.br'),
('Lennon Sales Furtado',null,'lennonsfurtado@gmail.com'),
('Leonardo Hirokazu de Souza Hamada',null,'hamadaleonardo@gmail.com'),
('Leonardo Sarraff Nunes de Moraes',null,'matakura@gmail.com'),
('Lucas de Melo Silva',null,'lucas.melo04@gmail.com'),
('Lucelia Pereira Goncalves',null,'lucelia.matsumoto@serpro.gov.br'),
('Luciana Abdon Almeida',null,'lu.abdon.si@gmail.com'),
('LUCIANO RIBEIRO DUARTE',null,'duartelucianoribeiro@gmail.com'),
('Marcelle Pereira Mota',null,'cellemota@gmail.com'),
('Marcia Priscila Furtado Pantoja',null,'marciapantoja13@gmail.com'),
('Marcio Goes do Nascimento',null,'goes.nascimento@gmail.com'),
('Márcio José Moutinho da Ponte',null,'mjmponte@gmail.com'),
('Marco Antonio Balieiro Da Silva',null,'ma.balieiro@gmail.com'),
('Marcos César da Rocha Seruffo',null,'marcos.seruffo@gmail.com'),
('Marcos Felipe Carvalho Nazario',null,'carvalhonazario@yahoo.com.br'),
('Marisa Cristina Moreno Alves de Andrade',null,'mm.marisamoreno@gmail.com'),
('Mauricio Ronny de Almeida Souza',null,'mauricio.ronny@gmail.com'),
('Mauro Rodrigo Larrat Frota e Silva',null,'maurolarrat@ufpa.br'),
('Mayara Costa Figueiredo',null,'mayfigueiredo@gmail.com'),
('Mireille Pinheiro Moreira Balieiro',null,'mireillepm@gmail.com'),
('Müller Gabriel Da Silva Miranda',null,'mulgsm@gmail.com'),
('Nágila Natália Torres Vale',null,'nagila.ufpa@gmail.com'),
('Nielsen Alves Gonçalves',null,'engenilk@gmail.com'),
('Olavo Nylander Brito Neto',null,'olavo.nylander@gmail.com'),
('Paulo Igor Alves Godinho',null,'piagodinho@gmail.com'),
('Paulo Vitor Rodrigues Cardoso',null,'paulo.cardoso12@gmail.com'),
('Pedro Alberto Bento Gomes',null,'pedroabg@gmail.com'),
('Pedro Luiz Magalhães Cumino',null,'pedro.cumino@gmail.com'),
('Pedro Montibeler Salvador',null,'pedro.montibeler@gmail.com'),
('Phelipe Luiz Dias Feio',null,'phelipefeio09@gmail.com'),
('Rafael Martins Feitosa',null,'rafael.feito@gmail.com'),
('Rafael Pereira Esteves',null,'rafesteves@gmail.com'),
('Rafael Santana Oliveira',null,'rafaelstnoliveira@gmail.com'),
('Reinaldo Junior Lopes Cardoso',null,'reinald28@gmail.com'),
('Renata Kelly Dantas Cascaes',null,'renatadcascaes@gmail.com'),
('Renato de Pina Ferreira',null,'renpina@gmail.com'),
('Renato Hidaka Torres',null,'renatohidaka@gmail.com'),
('Rennan Jose Maia da Silva',null,'rennanmaia@gmail.com'),
('Ricardo Rodrigo Marinho Melo',null,'ricardorodrigomm@gmail.com'),
('Roberto Yuri da Silva Franco',null,'roberto.yuri.franco@gmail.com'),
('Rodrigo Santos do Amor Divino Lima',null,'rodrigo.sad.lima@gmail.com'),
('Romulo Silva Pinheiro',null,'romulo.s.pinheiro@gmail.com'),
('Sandro de Paula Mendonça ',null,'sandrodpm@gmail.com'),
('Sara das Merces Silva',null,'maru.merces18@gmail.com'),
('Saul Campos Berardo',null,'saulberardo@gmail.com'),
('sebastião rodrigues da costa neto',null,'s.rodriguescn@gmail.com'),
('Silvério Sirotheau Corrêa Neto',null,'silverio@ufpa.br'),
('Silvério Sirotheau Corrêa Neto',null,'ssirotheau@gmail.com'),
('Suelene de Jesus do Carmo Corrêa ',null,'suelene.correa@ifpa.edu.br'),
('Thiago Antônio Sidônio Coqueiro',null,'tcoqueiro@hotmail.com'),
('Vagner de Brito Nascimento',null,'vagner@ufpa.br'),
('Vitor de Souza Castro',null,'vitor@unifesspa.edu.br'),
('Walbert Cunha Monteiro',null,'walbertcm@gmail.com'),
('Wendy Mendes Galeno',null,'wendymgaleno@gmail.com'),
('Wilson Luiz da Silva Farias',null,'wilsonluiz.dsf@gmail.com'),
('Yuri Lima Cavalcante',null,'yurilimacavalcante@gmail.com'),
('Yuri Santa Rosa Nassar dos Santos',null,'yuri.nassar@gmail.com')  ON CONFLICT DO NOTHING;
