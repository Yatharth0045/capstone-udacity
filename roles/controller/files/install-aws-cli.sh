#!/usr/bin/env bash

## Install Dependencies - unzip
sudo apt update && sudo apt install -y unzip

# Installing on linux
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install