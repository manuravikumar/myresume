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
    index_document     = "index.html"
    
  }
}

resource "azurerm_storage_blob" "index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.resume.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../website/index.html"
  content_type           = "text/html"
}
resource "azurerm_storage_blob" "about" {
  name                   = "about.html"
  storage_account_name   = azurerm_storage_account.resume.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../website/about.html"
  content_type           = "text/html"
}
resource "azurerm_storage_blob" "resumes" {
  name                   = "resume.html"
  storage_account_name   = azurerm_storage_account.resume.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../website/resume.html"
  content_type           = "text/html"
}
resource "azurerm_storage_blob" "style" {
  name                   = "style.css"
  storage_account_name   = azurerm_storage_account.resume.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../website/style.css"  # Path to your local file
  content_type           = "text/css"  # Set the MIME type for CSS
}

resource "azurerm_storage_blob" "script" {
  name                   = "script.js"
  storage_account_name   = azurerm_storage_account.resume.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../website/script.js"  # Path to your local file
  content_type           = "application/script"  # Set the MIME type for CSS
}


output "website_url" {
  value = azurerm_storage_account.resume.primary_web_endpoint
}
