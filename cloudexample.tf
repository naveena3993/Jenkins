provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used

  features {}
}
resource "azurerm_resource_group" "example" {
  name     = "azurermfrrrorme01"
  location = "westus"
}

resource "azurerm_storage_account" "examplee" {
  name                     = azurerm_resource_group.example.name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
