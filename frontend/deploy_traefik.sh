#!/bin/bash

docker pull alverad/meu-egresso-front:develop-latest && docker stack deploy -c docker-compose.yml meuegresso-front