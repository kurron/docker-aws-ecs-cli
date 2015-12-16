FROM python:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="AWS ECS CLI" org.kurron.ide.version=1.9.3

ENV DEBIAN_FRONTEND noninteractive

# Create a user and group that matches what is in most Vagrant boxes
RUN groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    chown -R developer:developer /home/developer

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
