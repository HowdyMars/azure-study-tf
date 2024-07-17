
locals {
  prefix        = "az-104"
  client_config = data.azuread_client_config.current
  tags = {
    environment = "practice"
    terraform   = true
  }
}

resource "azurerm_resource_group" "az-104-dev" {
  name     = "az-104-dev"
  location = "eastus"
  tags     = local.tags
}

resource "azurerm_resource_group" "az-104-prod" {
  name     = "az-104-prod"
  location = "eastus"
  tags     = local.tags

}

resource "azurerm_role_assignment" "az-104-dev" {
  scope                = azurerm_resource_group.az-104-dev.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.az-104-group.id
}

resource "azurerm_role_assignment" "az-104-prod" {
  scope                = azurerm_resource_group.az-104-prod.id
  role_definition_name = "Owner"
  principal_id         = local.client_config.object_id
}