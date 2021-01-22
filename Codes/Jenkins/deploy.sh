#!/bin/bash
scp -i ~/.ssh/id_rsa docker-compose.yaml jenkins@swarm-manager:/home/jenkins/docker-compose.yaml
ssh -i ~/.ssh/id_rsa jenkins@swarm-manager << EOF
    export DATABASE_URI=${DATABASE_URI}
    export app_version = 'version1'
    export rollback = 'false'
    export replicas = 5
    docker stack deploy --compose-file /home/jenkins/docker-compose.yaml football_gen_service_1
EOF