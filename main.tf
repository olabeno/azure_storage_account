resource "azurerm_resource_group" "TFAzureLab-RG" { 
    name = "TFAzureLab-rg" 
    location = "eastus" 
}

resource "azurerm_storage_account" "storage" {
  name                     = "olabeno1"
  resource_group_name      = azurerm_resource_group.TFAzureLab-RG.name
  location                 = azurerm_resource_group.TFAzureLab-RG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Development"
    purpose     = "Data storage"
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "mydatacontainer2025-05-12-xyz"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
####

