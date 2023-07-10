#!/bin/bash

[ ! -d "./meuEgressoFotos" ] && echo "Diretorio 'meuEgressoFotos' não existe, logo não é possivel armazenar as fotos dos egressos." && exit 1;

[ ! -f "./.env" ] && echo "Arquivo de configuração '.env' não existe, consulte o manual" && exit 1;

cat << EOF > run.sh
#!/bin/bash
mvn clean
`grep "=" .env | tr '\n' ' '`mvn install
docker-compose down
docker image prune
docker volume prune
docker-compose up --build
EOF

bash run.sh