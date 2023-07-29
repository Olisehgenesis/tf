locals {
  operating_system = "Windows"  # Replace "Windows" with the appropriate operating system value
}

module "app_service" {
  source = "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/app_service.tf"

  # Pass the local operating_system variable to the app_service module
  operating_system = local.operating_system

  site_config {
    always_on                 = true
    use_32_bit_worker_process = true
    websockets_enabled        = true
  }

  tags = {
    Owner     = var.tag_owner
    Department = var.tag_department
  }

  # Choose the Operating System based on the local variable value
  os_type = local.operating_system

  # Enable Application Insights
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key
  }
}
