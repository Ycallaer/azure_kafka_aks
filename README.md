#Azure kafka aks

##Goal of the repo
The repo will do a deploy of a Kubernetes cluster on azure and will run kafka, zookeeper and kafka manager on the cluster.
The goal is to get people started with an easy setup so they can iterate upon the solution.

I have used terraform to deploy the cluster. This will allow for the same deployment outcome which each run.
The Kubernetes manifest files are part of the terraform deploy


##Prerequiste
The following techologies (along with versions) have been used to do the deployment. It is suggested you install these version or higher ones (lower might not work):

* Terraform v0.11.6 (th
* Kubectl v1.8.4
* Kubectx v1.8.4
* Docker v18.0.3 Community edition

##Getting st