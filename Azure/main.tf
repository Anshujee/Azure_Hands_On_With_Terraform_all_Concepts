
resource "azurerm_resource_group" "RG1" {
  for_each = toset(var.RG_Names)
  name     = each.value
  location = var.location
} 
