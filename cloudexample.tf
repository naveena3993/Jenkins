
# Provider Block

provider "azurerm" {
    version         =   ">= 2.26"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {
       
    }
}
resource "azurerm_resource_group" "example" {
  name     = "adi-eus-devops-poc-rg"
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
