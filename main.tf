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
  source = "github.com/Olisehgenesis/modules//log_analytics"
}

module "application_insights" {
  source = "github.com/Olisehgenesis/modules//application_insights"
}

module "app_service_plan" {
  source = "github.com/Olisehgenesis/modules//app_service_plan"
}

module "app_service" {
  source = "github.com/Olisehgenesis/modules//app_service"
  operating_system = "Windows"  # Replace with the appropriate operating system value
}

module "static_web_app" {
  source = "github.com/Olisehgenesis/modules//static_web_app"
}

module "static_app" {
  source = "github.com/Olisehgenesis/modules//static_app"
}

module "key_vault" {
  source = "github.com/Olisehgenesis/modules//key_vault"
}

module "storage_account" {
  source = "github.com/Olisehgenesis/modules//storage_account"
}
