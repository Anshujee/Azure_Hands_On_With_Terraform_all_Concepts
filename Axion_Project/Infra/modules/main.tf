module "rg" {
    source = "./Azurerm_Resource_group"
    rgs   = var.resource_groups
}

module "storage" {
    depends_on = [module.rg]
    source = "./Azurerm_Storage_Account"
    storage_acco = var.Storage_accounts
}