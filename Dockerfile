FROM python:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.name="AWS ECS CLI" org.kurron.version=0.2.0

ENV DEBIAN_FRONTEND noninteractive

# Set the environment to use the new user account
ENV HOME /home/developer

# the user of this image is expected to mount his actual home directory to this one
VOLUME ["/home/developer"]

ADD https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli

RUN chmod 555 /usr/local/bin/ecs-cli

# Set the AWS environment variables
ENV AWS_ACCESS_KEY_ID OVERRIDE ME 
ENV AWS_SECRET_ACCESS_KEY OVERRIDE_ME
ENV AWS_REGION us-west-2

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/usr/local/bin/ecs-cli"]
CMD ["--version"]
