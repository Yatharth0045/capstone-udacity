#!/usr/bin/env bash

## Download kubectl 
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

## Change kubectl 
chmod +x ./kubectl

## Move Kubectl
mv ./kubectl /usr/local/bin/kubectl

