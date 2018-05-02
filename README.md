# Azure kafka aks

## Goal of the repo
The repo will do a deploy of a Kubernetes cluster on azure and will run kafka, zookeeper and kafka manager on the cluster.
The goal is to get people started with an easy setup so they can iterate upon the solution.

I have used terraform to deploy the cluster. This will allow for the same deployment outcome which each run.
The Kubernetes manifest files are part of the terraform deploy


## Prerequiste
The following techologies (along with versions) have been used to do the deployment. It is suggested you install these version or higher ones (lower might not work):

* Terraform v0.11.6 (th
* Kubectl v1.8.4
* Kubectx v1.8.4
* Docker v18.0.3 Community edition

## Getting started
First you will need to clone this directory to your local machine.
Next you will need to build the docker images. Note that you need to upload these docker images to a private or public container registry.
The reason for this is that kubernetes needs to pull the images from somewhere ( so your local machine doesn't work).

Now scan the project for `TODO` keyword as you will need to change a couple of things in the project

### 1. Change variables secret
This file, `variables.dev.secret.sh` , will hold the necessary values for azure connection as well as the configuration for your machine.
Some values are left blank as you will need to fill in the correct values for your azure account.
Also verify the type of machine you want to use.

If you are done, do not forget to source this file before starting terraform

### 2. terraform/aks_manifests/kafka/50_kafka.yml
Here I referenced my own image (my private repo has been removed from the name).

