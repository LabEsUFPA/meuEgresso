# Instruções de Execução

Para Gerar as chaves utilizadas para validar o token

openssl genrsa -out src/main/resources/certs/private.pem 2048

openssl rsa -in src/main/resources/certs/private.pem -out src/main/resources/certs/public.pem -pubout -outform PEM

Crie o arquivo .env baseado no .env.example

## Pre Requisitos para Usuarios Windows

- Instalar o Docker Desktop


- Instalar o WSL
1. Abrir o PowerShell
2. Digitar `wsl --install`
3. Ir na MicrosftStore e instalar o Ubuntu 22.04
4. Abrir o Ubuntu 22.04
5. Instalar as dependencias: `sudo apt update && sudo apt install openjdk-17-jdk maven docker docker-compose`
6. Digitar no terminal do Ubuntu: `echo export JAVA_HOME=/lib/jvm/java-17-openjdk-amd64 >> ~/.bashrc`

## Para Build

1. Criar o arquivo JAR - `mvn install`
2. Subir no docker - `docker-compose up --build`

# Usuarios Padrões para Testes

1. ADMIN - 123456
2. SECRETARIO - 123456
3. EGRESSO - 123456
