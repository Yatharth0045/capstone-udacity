#!/usr/bin/env bash

PEM_FILE=~/Downloads/udacity-project.pem

## Change key permission
sudo chmod 400 ${PEM_FILE}

## Install python
ssh -i ${PEM_FILE} ubuntu@${1:-34.201.205.43} "sudo apt update && sudo apt install -y python && sudo apt install -y tidy"

## Run Ansible Role
ansible-playbook -i roles/inventory.ini  ansible-main.yaml
