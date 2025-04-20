resource "azurerm_cdn_profile" "resume_cdn" {
  name                = "cdnprofile-resume"
  location            = "Global"
  resource_group_name = azurerm_resource_group.resume.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "resume_cdn_endpoint" {
  name                = "cdnendpoint-resume"
  profile_name        = azurerm_cdn_profile.resume_cdn.name
  location            = "Global"
  resource_group_name = azurerm_resource_group.resume.name

  origin {
    name      = "blobstaticorigin"
    host_name = replace(azurerm_storage_account.resume.primary_web_endpoint, "https://", "")
  }

  is_http_allowed  = false
  is_https_allowed = true
}

resource "azurerm_cdn_custom_domain" "resume_custom_domain" {
  name                = "customdomain-resume"
  resource_group_name = azurerm_resource_group.resume.name
  profile_name        = azurerm_cdn_profile.resume_cdn.name
  endpoint_name       = azurerm_cdn_endpoint.resume_cdn_endpoint.name
  host_name           = "www.manuravikumar-cloudengineer.com" # Replace
}

resource "azurerm_cdn_frontdoor_custom_domain_https" "resume_https" {
  custom_domain_id = azurerm_cdn_custom_domain.resume_custom_domain.id
  protocol_type    = "ServerNameIndication"
  certificate_type = "ManagedCertificate"
}
