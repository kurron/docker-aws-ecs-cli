#!/bin/bash

CMD="docker run \
       --rm \
       --name aws \
       --net "host" \
       --env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
       --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
       --env AWS_REGION=$AWS_REGION \
       --user 1000:1000 \
       --volume $HOME:/home/developer \
       kurron/docker-aws-cli:latest"

#eval echo $CMD $*
eval $CMD $*
