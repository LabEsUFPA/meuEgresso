# Meu Discente

Este repositório tem como finalidade o desenvolvimento da aplicação Meu Discente, que irá registrar informações referentes à vida profissional dos discentes e ex-discentes da UFPA.

# Informações sobre deploy da solução

## Requisitos

1. Postgres v15
2. Java v17
3. Docker
4. Docker Compose
5. Node 18.12
6. Maven

## Obtenção das Imagens Docker

### 1º Modo integrado ao CI/CD

Na pipeline de produção, sempre que houver alterações nos ramos Main e Develop, o GitHub irá cuidar de gerar e enviar ao DockerHub a ultima versão da aplicação.
Nesse sentido, as imagens estarão disponiveis nos seguintes endereços:

[Frontend](https://hub.docker.com/repository/docker/alverad/meu-egresso-front/general)

[Backend](https://hub.docker.com/repository/docker/alverad/meu-egresso-api/general)

### 2º Modo Build manual

Para realizar o build do projeto manualmente, é necessário que todos requisitos anteriormente citados sejam satisfeitos.
*OBS:* Recomendamos o deploy da aplicação no sistema operacional Linux.

Com isso em mente, deverão ser executados os seguintes passos após o projeto ser clonado:

* Build do FrontEnd
  
1. Navegar para o diretorio _frontend_
2. Executar o seguinte comando `npm install` para instalar os pacotes.
3. Copiar o arquivo .env.example para .env.
4. Editar o arquivo informando a varíavel de ambiente *VITE_API_URL_LOCAL*='http://endereco_onde_o_backend_estara_hospedado:porta_do_servico/'
5. Executar em seguida o comando `docker-compose --build` a fim de criar a imagem docker do frontend.

* Build do BackEnd

1. Navegar para o diretorio _backend/meuegresso_
2. Copiar o .env.example para .env
3. Preencher as variaveis de acordo
```
POSTGRES_HOST=postgres-meu-egresso # Endereço em que o banco de dados está hospedado.
POSTGRES_USER=username # Usuario do Banco de dados
POSTGRES_PASSWORD=password # Senha do banco de dados
POSTGRES_DB=nomedobanco # Nome do banco de dados
POSTGRES_PORT=5432 # Porta em que o banco de dados está rodando
POSTGRES_EXPOSE_PORT=5434 # Porta acessivel do banco de dados caso o mesmo tenha sido criado a partir do docker-compose

EMAIL_USERNAME=email # Email responsável por enviar mensagens na aplicação.
EMAIL_PASSWORD=senhadoAPP # Senha do e-mail.

PATHFOTOS=caminho/para/armazenar/as/fotos # Caminho em que as fotos dos Egressos serão armazenados.

APP_PORT=15000 # Porta no qual a aplicação ira rodar.

TOKEN_EXPIRES_HOURS=3 # Tempo correspondente a sessão do usuário, ou seja, tempo máximo logado no sistema.

DOMAIN_COOKIE=localhost # Dominio em que a solução vai ser hospedada.

ALLOWED_ORIGINS=http://localhost:5173/ # Dominio da solução. (Informa a API quais aplicações podem ser autenticadas).
```
1. Executar o seguinte comando `mvn install` afim de compilar o codigo fonte e gerar JAR.
2. Executar o seguinte comando `docker-compose --build` a fim de criar a imagem.

## Informações Adicionais

### Criar o schema do Banco de Dados

1. Navegar até _backend/meuegresso/src/main/resources_
2. Executar o seguinte comando `psql -u usuarioBanco -W -h enderecoDoBanco -f dump.sql`
