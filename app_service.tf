

variable "resource_type_abbreviation" {
  type = string
  default = AS
}
variable "location" {
  type        = string
  default     = "West US 3"
  description = "Azure region where resources will be deployed."
}

#variable "tag_owner" {
#  type = Jeff Farinich
#}

#variable "tag_department" {
#  type = technology services
#}

#variable "runtime_stack" {
#  type    = string
#  default = "dotnet|5.0"
#}



  site_config {
    always_on                 = true
    use_32_bit_worker_process = true
    websockets_enabled        = true
  }

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }

  # Choose the Operating System based on the variable value
  os_type = var.operating_system

  # Enable Application Insights
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key

  }

