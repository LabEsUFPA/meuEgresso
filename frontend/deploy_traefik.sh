#!/bin/bash

docker-compose build && docker stack rm meuegresso-front && docker stack deploy -c docker-compose.yml meuegresso-front