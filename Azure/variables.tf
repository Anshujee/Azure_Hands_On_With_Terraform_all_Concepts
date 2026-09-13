variable "RG_Names" {
    description = "List of resource group names"
    type        = list(string)
}

variable "location" {
type        = string
description = "Location of the resource group"
}