#!/bin/bash

CMD="docker run \
       --rm \
       --interactive \
       --tty \
       --net "host" \
       --env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
       --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
       --env AWS_REGION=$AWS_REGION \
       --user=$(id -u $(whoami)):$(id -g $(whoami)) \
       --volume $HOME:/home/developer \
       kurron/docker-aws-ecs-cli:0.2.0"

#eval echo $CMD $*
eval $CMD $*
