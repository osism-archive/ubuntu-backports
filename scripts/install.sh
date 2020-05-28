#!/usr/bin/env bash

sudo apt-add-repository 'deb http://archive.ubuntu.com/ubuntu bionic-backports main restricted universe multiverse'
sudo apt-get update
sudo apt-get install -y \
  debian-archive-keyring \
  fakeroot \
  lftp \
  pbuilder \
  ubuntu-keyring \
  ubuntu-dev-tools
