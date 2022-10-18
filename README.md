# Guacamole on docker-compose

This work was inspired by @s4ur0n's excelent [GuacaVPN tutorial](https://cs3group.com/media/guacaVPN.pdf) (basically I'm too lazy to follow his tutorial ;)

**IMPORTANT:** 

This configuration does not use the docker image published by the guacamole project because it's not up to date and does not include the TOTP plugin.
We use an image hosted in docker.io/canarytek/guacamole-client that is a clean build from the latest guacamole-client git repository.

If you don't want to trust this image and prefer to build your own from the guacamole project's repo, read the "Build your own image section" below

## Setup service

  * Copy sample config files

```
cp env.sample .env
```

  * Modify to your needs. Choose secure passwords for MySQL root and guacamole user

  * Prepare database initialization

```
sh prepare_db.sh
```

  * Stop docker db instance with CTRL+C

## Run service

  * Start all services

```
docker-compose up
```

## Connect

  * Connect to http://SERVER_IP:8080/guacamole with default user (guacadmin/guacadmin)
  * In first login you wil be requested to setup TOTP

## Build you own image

Follow these steps to build your own guacamole-client image from guacamole project's upstream repository

  * Clone the git repo

```
git clone https://github.com/apache/guacamole-client.git
```

  * Build the Docker image using the project's Dockerfile

```
cd guacamole-client
docker build -t guacamole-client .
```

  * Change configuration image in ".env" file to use the image you just built

```
GUACAMOLE_CLIENT_IMAGE=guacamole-client
```
