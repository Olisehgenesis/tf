
variable "location" {
  type        = string
  default     = "West US 3"
  description = "Azure region where resources will be deployed."
}


variable "resource_type_abbreviation" {
  type = string
  default = KV
}


resource "azurerm_key_vault" "key_vault" {
  name                = "${var.department_abbreviation}-${var.major_environment}-${var.project}-${var.specific_environment}-${var.resource_type_abbreviation}-KV"
  location            = var.location
  resource_group_name = azurerm_resource_group.CORP-LE-NafNet-RG.name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
    ]

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Update",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "UnwrapKey",
    ]
  }
}

data "azurerm_client_config" "current" {}