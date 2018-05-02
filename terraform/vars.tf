####
## Please, please use TF environment variables!! check `Readme.md`
####

variable "resourceGroupName" {
  description = "The resource group name"
}

variable "adminUsersname" {
  description = "Username of the administrator"
}

variable "azureClientId" {
  description = "Client id for azure"
}

variable "sshKeyData" {
  description = "ssh key to authenticate against the cluster"
}

variable "azureClientSecret" {
  description = "Client secret for azure"
}

variable "PoolName" {
  description = "Name of the pool within AKS cluster"
}


variable "PoolNodeCount" {
  description = "Name of the pool within AKS cluster"
}


variable "PoolVmSize" {
  description = "Size of the VMs of the pool within AKS cluster"
}


variable "PoolDiskSizeGb" {
  description = "Name of the pool within AKS cluster"
}

variable "kubernetesClusterName" {
  description = "Name of the kubernetes cluster"
}

variable "DeployEnvironment" {
  description = "Environment to which you are deploying"
}