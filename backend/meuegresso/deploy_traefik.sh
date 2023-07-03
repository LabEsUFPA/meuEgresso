#!/bin/bash

docker pull alverad/meu-egresso-api:develop-latest && docker stack deploy -c docker-compose.api.yml meuegresso-api