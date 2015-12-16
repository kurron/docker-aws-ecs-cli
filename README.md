#Overview
This project is a simple Docker image that runs the [Amazon ECS Command Line Interface](https://github.com/aws/amazon-ecs-cli/). 
It saves you from having to install the required dependencies just to run the command line.

#Prerequisites
* a working [Docker](http://docker.io) engine
* a working [Docker Compose](http://docker.io) installation

#Building
Type `docker-compose build` to build the image.

#Installation
Docker will automatically install the newly built image into the cache.

##Environment Variables
The `ecs.sh` script expects 3 variables to be specified in the environment and passes them onto the container:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

#Tips and Tricks

##Verifying The Image
`docker-compose up` will launch the image allowing you to begin working on projects. The Docker Compose file is 
configured to mount your home directory into the container.  

##Launching The Image
Run `./ecs.sh` and it will launch the container with the default command line argument of `--version`.  You can 
feed different arguments to script and execute arbitrary AWS commands, eg. `./ecs.sh configure`.

#Troubleshooting

##User Account
The image assumes that the account running the continer will have a user and group id of 1000:1000.  This allows the container 
to save files in your home directory and keep the proper permissions.

#License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).

#List of Changes

