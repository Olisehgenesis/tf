

variable "resource_type_abbreviation" {
  type = string
  default = LA

}

variable "location" {
  type        = string
  default     = "West US 3"
  description = "Azure region where resources will be deployed."
}


resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "${var.department_abbreviation}-${var.major_environment}-${var.project}-${var.specific_environment}-${var.resource_type_abbreviation}-LAW"
  location            = var.location
  resource_group_name = azurerm_resource_group.CORP-LE-NafNet-RG.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }
}
