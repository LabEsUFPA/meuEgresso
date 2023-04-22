# Instruções de Execução

Para Gerar as chaves utilizadas para validar o token

openssl genrsa -out src/main/resources/certs/private.pem 2048

openssl rsa -in src/main/resources/certs/private.pem -out src/main/resources/certs/public.pem -pubout -outform PEM

Crie o arquivo .env baseado no .env.example

## Para Build

1. Criar o arquivo JAR - `mvn install`
2. Subir no docker - `docker-compose up`

# Usuarios Padrões para Testes

1. ADMIN - 123456
2. SECRETARIO - 123456
3. EGRESSO - 123456