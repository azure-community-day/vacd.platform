# Configure the Azure Provider
provider "azurerm" {
  version = "=2.12.0"
  features {}
  skip_provider_registration = true
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "plat_rg" {
  name = var.rg_name
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.asp_name
  location            = data.azurerm_resource_group.plat_rg.location
  resource_group_name = data.azurerm_resource_group.plat_rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.asp_tier
    size = var.asp_size
  }
}

resource "azurerm_app_service" "example" {
  name                = var.app_name
  location            = data.azurerm_resource_group.plat_rg.location
  resource_group_name = data.azurerm_resource_group.plat_rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "DOTNETCORE|2.1"
  }
}
