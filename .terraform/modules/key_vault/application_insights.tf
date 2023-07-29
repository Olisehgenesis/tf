

variable "resource_type_abbreviation" {
  type = string
  default = ai
}

variable "location" {
  type        = string
  default     = "West US 3"
  description = "Azure region where resources will be deployed."
}

resource "azurerm_application_insights" "app_insights" {
  name                = "${var.department_abbreviation}-${var.major_environment}-${var.project}-${var.specific_environment}-${var.resource_type_abbreviation}-APPIN"
  location            = var.location
  resource_group_name = azurerm_resource_group.CORP-LE-NafNet-RG.name

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }
}
