locals {
  operating_system_local_app_service = "Windows"  # Replace "Windows" with the appropriate operating system value
}

module "app_service" {
  source = "github.com/Olisehgenesis/modules"

  operating_system = local.operating_system_local_app_service

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
  os_type = local.operating_system_local_app_service

  # Enable Application Insights
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key
  }
}
