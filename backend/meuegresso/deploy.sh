#!/bin/bash

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