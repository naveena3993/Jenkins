provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used

  subscription_id = "71ce6b58-b10d-4f36-8f98-b1728111b315"
  client_id       = "de02f09c-5666-4b88-9a15-38a37a098704"
  client_secret   = "5UX~S9.qv-BT.x3W~KX6Pg80Zdxd3_pU2W"
  tenant_id       = "4536e94f-051b-4555-893d-1529df2d08eb"

  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "azurermforme01"
  location = "westus"
}
resource "azurerm_storage_account" "examplee" {
  name                     = "[concat('storage', uniqueString(resourcegroup().id))]]
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
