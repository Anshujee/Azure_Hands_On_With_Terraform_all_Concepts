
resource "azurerm_resource_group" "RGs" {
  for_each = var.RG_Names
  name     = each.key
  location = each.value
} 

# Problem we faced here is that we have to create multiple resource groups with different names. So, we used for_each to iterate over the list of resource group names provided in the terraform.tfvars file. 
#This way, we can create multiple resource groups dynamically based on the input list.
# But we need to change the location as well. So, we can create a map variable for location and use it in the resource block.
# So concept Of MAP in Terraform is that it allows us to create a collection of key-value pairs, where each key is unique and maps to a specific value. 
#In this case, we can use a map variable to define the location for each resource group, allowing us to create multiple resource groups with different names and locations dynamically.

# --------------------Listed MAP in Terraform -----------------

resource "azurerm_storage_account" "Storage_Account" {
  depends_on = [azurerm_resource_group.RGs]
  for_each = var.storage_account_name
  name                     = each.value.sa_name
  resource_group_name      = each.value.sa_resource_group
  location                 = each.value.sa_location
  account_tier             = each.value.sa_account_tier
  account_replication_type = each.value.sa_account_replication_type
}