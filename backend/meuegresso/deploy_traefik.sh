#!/bin/bash

mvn install && docker-compose build && docker stack rm meuegresso-api && docker stack deploy -c docker-compose.api.yml meuegresso-api
