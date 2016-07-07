#!/bin/bash

if [ "$1" = "" ]
then
 echo "Usage: $0 tag"
 exit
fi

TAG=$1

TAG_COMMAND="docker tag ecs:compose kurron/docker-aws-ecs-cli:$TAG"
echo $TAG_COMMAND
$TAG_COMMAND

PUSH_COMMAND="docker push kurron/docker-aws-ecs-cli:$TAG"
echo $PUSH_COMMAND
$PUSH_COMMAND
