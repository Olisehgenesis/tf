locals {
  resource_type_abbreviation_local_log_analytics = "LA"
  location_local_log_analytics                   = "West US 3"
}

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "${var.department_abbreviation}-${var.major_environment}-${var.project}-${var.specific_environment}-${local.resource_type_abbreviation_local_log_analytics}-LAW"
  location            = local.location_local_log_analytics
  resource_group_name = azurerm_resource_group.CORP-LE-NafNet-RG.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }
}
