terraform {
backend "azurerm" {
    resource_group_name  = "AnshuRG1test"
    storage_account_name = "anshustorageaforaxion"
    container_name       = "axionstatefile"
    key                  = "terraform.tfstate"
  }
}