<p align="center"><img src="https://github.com/zloyleva/docker_wordpress_v2/blob/master/docker-wordpress.png"></p>

# Wordpress + Docker
This is easy project for very fast develop sites on WordPress

## Getting Started

Install curl

```
$ sudo apt-get update
$ sudo apt-get install curl
```

Install Docker

## Docker install
```
wget -qO- https://get.docker.com/ | sh
```

Install Docker-Compose

[Docker-Compose link](https://docs.docker.com/compose/install/#install-compose)

## Create Docker Image

```
$ make install
```

## Install WordPress

```
$ make install_wordpress
```

## Laravel Mix

First - enter to nodejs image
```
$make connect_nodejs
```
Next run install npm dependencies
```
$ npm i
```