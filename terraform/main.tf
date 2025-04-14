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
resource "null_resource" "upload_static_assets" {
  triggers = {
    index_hash  = filesha256("../website/index.html")
    style_hash  = filesha256("../website/style.css")
    script_hash = filesha256("../website/script.js")
  }

  provisioner "local-exec" {
    command = <<EOT
      az storage blob upload --account-name ${azurerm_storage_account.resume.name} \
        --container-name \$web \
        --file ../website/index.html \
        --name index.html \
        --content-type "text/html" \
        --overwrite

      az storage blob upload --account-name ${azurerm_storage_account.resume.name} \
        --container-name \$web \
        --file ../website/style.css \
        --name style.css \
        --content-type "text/css" \
        --overwrite

      az storage blob upload --account-name ${azurerm_storage_account.resume.name} \
        --container-name \$web \
        --file ../website/script.js \
        --name script.js \
        --content-type "application/javascript" \
        --overwrite
    EOT
  }

  depends_on = [
    azurerm_storage_account.resume
  ]
}

output "website_url" {
  value = azurerm_storage_account.resume.primary_web_endpoint
}
