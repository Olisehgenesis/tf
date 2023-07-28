

variable "resource_type_abbreviation" {
  type = string
  default = SA
}

variable "location" {
  type    = string
  default = "West US 2"
}



resource "azurerm_app_service" "static_app" {
  name                = "${var.department_abbreviation}-${var.major_environment}-${var.project}-${var.specific_environment}-${var.resource_type_abbreviation}-AS"
  location            = var.location
  resource_group_name = azurerm_resource_group.CORP-LE-NafNet-RG.name

  site_config {
    always_on           = true
    use_32_bit_worker_process = true
    websockets_enabled  = true
  }

  app_settings = {
    "OWNER"     = var.tag_owner
    "DEPARTMENT" = var.tag_department
  }

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }
}

# Add deployment slot configurations here, if you have them.
