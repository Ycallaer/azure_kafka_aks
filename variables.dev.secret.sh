#TODO: Fill this template with the correct values
#Azure Subscription related vars -> these can be asked with you azure admin
export ARM_SUBSCRIPTION_ID=""
export ARM_TENANT_ID=""
export ARM_CLIENT_ID="" #Application ID
export ARM_CLIENT_SECRET="" # Password

#Azure Deployment related vars
export TF_VAR_resourceGroupName="yca027-pg001"
export TF_VAR_resourceGroupLocation="westeurope"

export TF_VAR_kubernetesClusterName="KafkakKubeTestTerra"

#Azure client auth
export TF_VAR_azureClientId=""
export TF_VAR_azureClientSecret=""

#Azure pool configuration
export TF_VAR_PoolName="kafkaakstest"
export TF_VAR_PoolNodeCount=3
export TF_VAR_PoolVmSize="Standard_D2_v2"
export TF_VAR_PoolDiskSizeGb=30

#agent authentication
export TF_VAR_adminUsersname="IAmTheAdmin" #Change to something appropriately
export TF_VAR_sshKeyData="ssh-rsa ..." # Generate or use private key to get access to the aks cluster