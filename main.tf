terraform {
  backend "azurerm" {
    resource_group_name  = "resourcegroup1"
    storage_account_name = "aksterraform12"
    container_name       = "tfstatedevops"
    key                  = "tfstatedevops.tfstate"
  }
}

provider "azurerm" {
  version = "~>2.0"
  features {}
}
 
data "azurerm_client_config" "current" {}
 
#Create Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = "tamops"
  location = "eastus2"
}

#Create ACR 
resource "azurerm_container_registry" "acr" {
  name                = "akscontainerRegistry1233"
  resource_group_name = azurerm_resource_group.aksgroup.name
  location            = azurerm_resource_group.aksgroup.location
  sku                 = "Premium"
  admin_enabled       = false
}

#Create AKS
resource "azurerm_kubernetes_cluster" "akscluster" {
  name                = "cluster-aks1233"
  location            = azurerm_resource_group.aksgroup.location
  resource_group_name = azurerm_resource_group.aksgroup.name
  dns_prefix          = "exampleaks123"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Test"
  }
}
 
