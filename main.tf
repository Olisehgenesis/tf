# Configure the Azure provider


data "azurerm_resource_group" "CORP-LE-NafNet-RG" {
  name = "CORP-LE-NafNet-RG"
}

# Import variables from variables.tf
variable "department_abbreviation" {}
variable "major_environment" {}
variable "project" {}
variable "specific_environment" {}
variable "resource_type_abbreviation" {}
variable "location" {}
variable "tag_owner" {}
variable "tag_department" {}

# Include other configuration files for resources
module "log_analytics" {
  source = "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/log_analytics.tf"
}

module "application_insights" {
  source = "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/application_insights.tf"
}

module "app_service_plan" {
  source = "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/app_service_plan.tf&version=GBmain"
}

module "app_service" {
source =  "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/app_service.tf"
}

module "static_web_app" {
  source = "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/static_app.tf"
}

module "static_app" {
  source = "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/static_web_app.tf"
}

module "key_vault" {
  source = "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/key_vault.tf"
}

module "storage_account" {
  source = "https://dev.azure.com/NAFTechnologyServices/Cloud%20Architecture%20Templates/_git/modules?path=/storage_account.tf"
}

# Add any additional configuration or considerations here
# if they are not covered by separate modules.

