resource "azurerm_cdn_profile" "resume_cdn" {
  name                = "cdnprofile-resume"
  location            = azurerm_resource_group.resume.location
  resource_group_name = azurerm_resource_group.resume.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "resume_cdn_endpoint" {
  name                = "cdnendpoint-resume"
  resource_group_name = azurerm_resource_group.resume.name
  profile_name        = azurerm_cdn_profile.resume_cdn.name
  location            = azurerm_resource_group.resume.location

  origin {
    name      = "origin-resume"
    host_name = azurerm_storage_account.resume.primary_web_endpoint
  }

 
  is_https_allowed = true
}


