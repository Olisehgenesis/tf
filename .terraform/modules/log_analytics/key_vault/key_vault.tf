locals {
  resource_type_abbreviation_local_key_vault = "KV"
  location_local_key_vault                   = "West US 3"
}

resource "azurerm_key_vault" "key_vault" {
  name                = "${var.department_abbreviation}-${var.major_environment}-${var.project}-${var.specific_environment}-${local.resource_type_abbreviation_local_key_vault}-KV"
  location            = local.location_local_key_vault
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
