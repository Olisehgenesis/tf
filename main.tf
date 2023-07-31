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
variable "private_endpoint_enabled" {}
variable "private_endpoint_subnet_id" {}

# Include other configuration files for resources
module "log_analytics" {
  source = "git::https://dev.azure.com/oliseh/Azure%20Help/_git/Modules//log_analytics"
}

module "application_insights" {
  source = "git::https://dev.azure.com/oliseh/Azure%20Help/_git/Modules//application_insights"
}

module "app_service_plan" {
  source = "git::https://dev.azure.com/oliseh/Azure%20Help/_git/Modules//app_service_plan"
}

module "app_service" {
  source = "git::https://dev.azure.com/oliseh/Azure%20Help/_git/Modules//app_service"
  operating_system = "Windows"  # Replace with the appropriate operating system value
}

module "static_web_app" {
  source = "git::https://dev.azure.com/oliseh/Azure%20Help/_git/Modules//static_web_app"
}

module "static_app" {
  source = "git::https://dev.azure.com/oliseh/Azure%20Help/_git/Modules//static_app"
}

module "key_vault" {
  source = "git::https://dev.azure.com/oliseh/Azure%20Help/_git/Modules//key_vault"
}

module "storage_account" {
  source = "git::https://dev.azure.com/oliseh/Azure%20Help/_git/Modules//storage_account"
}
