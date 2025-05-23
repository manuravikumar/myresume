resource "azurerm_log_analytics_workspace" "resume_logs" {
  name                = "log-analytics-resume"
  location            = azurerm_resource_group.resume.location
  resource_group_name = azurerm_resource_group.resume.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# ✅ Diagnostic settings for the Storage Account (Blob-specific logs)
resource "azurerm_monitor_diagnostic_setting" "resume_blob_logs" {
  name                       = "diag-storage-resume"
  target_resource_id         = azurerm_storage_account.resume.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.resume_logs.id

 



  metric {
    category = "AllMetrics"
  }
}




