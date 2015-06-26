#!/bin/sh

USER=$(id -u)
WWW=$(docker-compose ps|grep _www_|awk '{print $1}')
IMAGE=kbase/depl:1.0.1

docker run -it --rm --user $USER --name client-$USER --workdir $HOME --volume $HOME:$HOME --env HOME=$HOME --link $WWW:www --entrypoint bash $IMAGE