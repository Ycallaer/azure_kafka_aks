
resource "azurerm_kubernetes_cluster" "kube_cluster" {
  name                = "${var.kubernetesClusterName}"
  location            = "${data.azurerm_resource_group.kafka_aks_res_group.location}"
  resource_group_name = "${data.azurerm_resource_group.kafka_aks_res_group.name}"
  dns_prefix          = "${var.kubernetesClusterName}"

  linux_profile {
    admin_username = "${var.adminUsersname}"

    ssh_key {
      key_data = "${var.sshKeyData}"
    }
  }

  agent_pool_profile {
    name            = "${var.PoolName}"
    count           = "${var.PoolNodeCount}"
    vm_size         = "${var.PoolVmSize}"
    os_type         = "Linux"
    os_disk_size_gb = "${var.PoolDiskSizeGb}"
  }

  service_principal {
    client_id     = "${var.azureClientId}"
    client_secret = "${var.azureClientSecret}"
  }

  tags {
    Environment = "${var.DeployEnvironment}"
  }
}