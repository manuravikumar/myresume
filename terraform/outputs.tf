output "static_website_url" {
  description = "The URL of the static resume website"
  value       = azurerm_storage_account.resume.primary_web_endpoint
}
output "cdn_url" {
  value = "https://${azurerm_cdn_endpoint.resume_cdn_endpoint.host_name}"
}

output "storage_url" {
  value = azurerm_storage_account.resume.primary_web_endpoint
}
