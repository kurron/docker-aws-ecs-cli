FROM python:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.name="AWS ECS CLI" org.kurron.version=0.2.0

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /home/developer

VOLUME ["/home/developer"]
VOLUME ["/pwd"]

ADD https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli

RUN chmod 555 /usr/local/bin/ecs-cli

# Set the AWS environment variables
ENV AWS_ACCESS_KEY_ID OVERRIDE ME 
ENV AWS_SECRET_ACCESS_KEY OVERRIDE_ME
ENV AWS_REGION OVERRIDE_ME 
ENV AWS_CLUSTER OVERRIDE_ME 

USER developer:developer
WORKDIR /pwd
ENTRYPOINT ["/usr/local/bin/ecs-cli"]
CMD ["--version"]
