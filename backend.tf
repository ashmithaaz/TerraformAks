backend "azurerm" {
  resource_group_name  = "resourcegroup1"
  storage_account_name = "aksterraform12"
  container_name       = "tfstatedevops"
  key                  = "tfstatedevops.tfstate"
}
