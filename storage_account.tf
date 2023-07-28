

variable "resource_type_abbreviation" {
  type = string
  default = SA
}

variable "location" {
  type        = string
  default     = "West US 3"
  description = "Azure region where resources will be deployed."
}


resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.department_abbreviation}${var.major_environment}${var.project}${var.specific_environment}${var.resource_type_abbreviation}"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.CORP-LE-NafNet-RG.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }

  network_rules {
    default_action = "Deny"
  }
}
