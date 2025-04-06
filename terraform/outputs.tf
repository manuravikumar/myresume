output "static_website_url" {
  description = "The URL of the static resume website"
  value       = azurerm_storage_account.resume.primary_web_endpoint
}
