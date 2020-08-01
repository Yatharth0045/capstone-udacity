#!/usr/bin/env bash

## Install dependencies
sudo apt-get update 

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

## Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

## Set Up Stable Repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

## Install docker
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io