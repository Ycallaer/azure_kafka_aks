# Azure kafka aks

## Goal of the repo
The repo will do a deploy of a Kubernetes cluster on azure and will run kafka, zookeeper and kafka manager on the cluster.
The goal is to get people started with an easy setup so they can iterate upon the solution.

I have used terraform to deploy the cluster. This will allow for the same deployment outcome which each run.
The Kubernetes manifest files are part of the terraform deploy


## Prerequiste
The following techologies (along with versions) have been used to do the deployment. It is suggested you install these version or higher ones (lower might not work):

* Terraform v0.11.6 (or a higher version)
* Kubectl v1.8.4
* Kubectx v1.8.4
* Docker v18.0.3 Community edition
* az cli

## Getting started
First you will need to clone this directory to your local machine.
Then please follow the following steps
### 1. Build docker images and upload to repo
Next you will need to build the docker images. Note that you need to upload these docker images to a private or public container registry.
The reason for this is that kubernetes needs to pull the images from somewhere ( so your local machine doesn't work).

I build 2 of the images on my perosnal docker hub public repo: https://hub.docker.com/r/ycallaert/azure_kafka_aks/tags/
You can download them from here or build yourself

Now scan the project for the `TODO` keyword as you will need to change a couple of things in the project


### 2. Change variables secret
The file, `variables.dev.secret.sh` , will hold the necessary values for azure connection as well as the configuration for your machines inside the kubernetes cluster.
Some values are left blank as you will need to fill in the correct values for your azure account.
Also verify the type of machine you want to use.

If you are done, do not forget to source this file before starting terraform

### 3. terraform/aks_manifests/kafka/50_kafka.yml
Here I referenced my own image (my private repo has been removed from the name).
It would be best to replace this with your own build image.
If you are using a private repository you can uncomment the section for `imagePullSecrets`

### 4. terraform/aks_manifests/yahoo_kafka_manager/20_kafka_manager.yml
Here I referenced my own image (my private repo has been removed from the name).
It would be best to replace this with your own build image.
If you are using a private repository you can uncomment the section for `imagePullSecrets`

### 5. terraform/aks_manifests/zookeeper/50_pzoo.yml and 51_zoo.yml
Here I referenced my own image (my private repo has been removed from the name).
It would be best to replace this with your own build image.
If you are using a private repository you can uncomment the section for `imagePullSecrets`

## Deployment

Before you can start the terraform make sure that the az cli is available. If you are using a virtualenv make sure to source it before starting.
If 2 factored authentication is activated make sure to run `az login` before proceeding.

Next source the `variables.dev.secret.sh` file so that the environment variables are present for the deployment

The deployment is completely done using terraform.
First make sure that your working directory is the terraform directory of the project.
Next issue the command `terraform init`.
This will download the necessary plugins for the project

Next run `terraform apply`. This will generate a plan and tell you how many objects will be created.
Type `yes` when prompted for the deployment.
