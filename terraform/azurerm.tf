# Microsoft Azure Provider
provider "azurerm" {
  version = "~>1.5"
}

# Source the resource group from Azure
data "azurerm_resource_group" "kafka_aks_res_group" {
  name = "${var.resourceGroupName}"
}

