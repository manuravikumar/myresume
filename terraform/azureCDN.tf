resource "azurerm_cdn_profile" "resume_cdn" {
  name                = "cdnprofile-resume"
  location            = azurerm_resource_group.resume.location
  resource_group_name = azurerm_resource_group.resume.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "resume_cdn_endpoint" {
  name                = "cdnendpoint-resume"
  profile_name        = azurerm_cdn_profile.resume_cdn.name
  location            = azurerm_resource_group.resume.location
  resource_group_name = azurerm_resource_group.resume.name

  origin {
    name      = "blobstaticorigin"
    host_name = replace(azurerm_storage_account.resume.primary_web_endpoint, "https://", "")
  }

  is_http_allowed  = false
  is_https_allowed = true
}


