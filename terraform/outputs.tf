output "static_website_url" {
  description = "The URL of the static resume website"
  value       = azurerm_storage_account.resume.primary_web_endpoint
}
output "cdn_url" {
  value = "https://${azurerm_cdn_endpoint.resume_cdn_endpoint.host_name}"
}
output "cdn_endpoint" {
  description = "The CDN endpoint for the static website"
  value       = azurerm_cdn_endpoint.resume_cdn_endpoint.host_name
}
output "cdn_profile" {
  description = "The CDN profile for the static website"
  value       = azurerm_cdn_profile.resume_cdn.name
}
