provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "resume" {
  name     = "rg-resume"
  location = "Australia East"
}

resource "azurerm_storage_account" "resume" {
  name                     = "manuresumestorageacct"
  resource_group_name      = azurerm_resource_group.resume.name
  location                 = azurerm_resource_group.resume.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = "index.html"
  }
}

output "website_url" {
  value = azurerm_storage_account.resume.primary_web_endpoint
}
