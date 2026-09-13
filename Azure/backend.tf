terraform {
backend "azurerm" {
    resource_group_name  = "AnshuRG1test"
    storage_account_name = "anshustorage1fortestonly"
    container_name       = "statefilesmanagement"
    key                  = "terraform.tfstate"
  }
}