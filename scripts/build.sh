#!/usr/bin/env bash

export DEBFULLNAME="Betacloud Solutions GmbH"
export DEBEMAIL="info@betacloud-solutions.de"
export UBUMAIL="info@betacloud-solutions.de"

sudo pbuilder --create \
  --configfile files/pbuilderrc \
  --distribution bionic \
  --architecture amd64 \
  --basetgz /tmp/bionic-amd64-base.tgz

# build python3-dockerpycreds

backportpackage \
  -w /tmp \
  --dont-sign \
  http://archive.ubuntu.com/ubuntu/pool/universe/d/docker-pycreds/docker-pycreds_0.3.0-1.1.dsc

sudo pbuilder --build \
  --configfile files/pbuilderrc \
  --distribution bionic \
  --architecture amd64 \
  --basetgz /tmp/bionic-amd64-base.tgz \
  /tmp/docker-pycreds_0.3.0-1.1~ubuntu18.04.1.dsc

# build python3-requests

backportpackage \
  -w /tmp \
  --dont-sign \
  http://archive.ubuntu.com/ubuntu/pool/main/r/requests/requests_2.22.0-2ubuntu1.dsc

sudo pbuilder --build \
  --configfile files/pbuilderrc \
  --distribution bionic \
  --architecture amd64 \
  --basetgz /tmp/bionic-amd64-base.tgz \
  /tmp/requests_2.22.0-2ubuntu1~ubuntu18.04.1.dsc

# build python-docker

backportpackage \
  -w /tmp \
  --dont-sign \
  http://archive.ubuntu.com/ubuntu/pool/universe/p/python-docker/python-docker_4.1.0-1.dsc

sudo pbuilder --build \
  --configfile files/pbuilderrc \
  --distribution bionic \
  --architecture amd64 \
  --basetgz /tmp/bionic-amd64-base.tgz \
  --debbuildopts "-d" \
  /tmp/python-docker_4.1.0-1~ubuntu18.04.1.dsc

# build docker-compose

backportpackage \
  -w /tmp \
  --dont-sign \
  http://archive.ubuntu.com/ubuntu/pool/universe/d/docker-compose/docker-compose_1.25.0-1.dsc

sudo pbuilder --build \
  --configfile files/pbuilderrc \
  --distribution bionic \
  --architecture amd64 \
  --basetgz /tmp/bionic-amd64-base.tgz \
  --debbuildopts "-d" \
  /tmp/docker-compose_1.25.0-1~ubuntu18.04.1.dsc
