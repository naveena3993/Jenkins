provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used

  subscription_id = "bd65f624-8c90-4842-ad3b-1ec18d74a32d"
  client_id       = "075ebc65-ea69-49a8-9c12-1cb84cdc53f4"
  client_secret   = "rk9pp97s2~J.UpSgY9o-tB~04qjjWMDUaz"
  tenant_id       = "ff7fcf1f-c9ab-464f-b2bd-a9c773e50ab9"

  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "azurermforme01"
  location = "westus"
}
