


variable "resource_type_abbreviation" {
  type = string
  default = ASP
}

variable "location" {
  type        = string
  default     = "West US 3"
  description = "Azure region where resources will be deployed."
}

variable "pricing_tier" {
  type    = string
  default = "S1"
}

variable "operating_system" {
  type    = string
  default = "Windows"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "${var.department_abbreviation}-${var.major_environment}-${var.project}-${var.specific_environment}-${var.resource_type_abbreviation}-ASP"
  location            = var.location
  resource_group_name = azurerm_resource_group.CORP-LE-NafNet-RG.name

  sku {
    tier = var.pricing_tier
    size = "S1"
  }

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }

  reserved = var.operating_system == "Linux"
  is_xenon = var.operating_system == "Linux"
  hyper_v  = var.operating_system == "Linux"
}
