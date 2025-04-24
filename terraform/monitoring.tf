resource "azurerm_log_analytics_workspace" "resume_logs" {
  name                = "log-analytics-resume"
  location            = azurerm_resource_group.resume.location
  resource_group_name = azurerm_resource_group.resume.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Diagnostic settings for the Storage Account (Blob logs)
resource "azurerm_monitor_diagnostic_setting" "resume_blob_logs" {
  name                       = "diag-storage-resume"
  target_resource_id         = azurerm_storage_account.resume.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.resume_logs.id

  enabled_log {
    category = "StorageRead"

    retention_policy {
      enabled = false
    }
  }

  enabled_log {
    category = "StorageWrite"

    retention_policy {
      enabled = false
    }
  }

  enabled_log {
    category = "StorageDelete"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "Transaction"

    retention_policy {
      enabled = false
    }
  }
}

# Diagnostic settings for the CDN Endpoint
resource "azurerm_monitor_diagnostic_setting" "resume_cdn_logs" {
  name                       = "diag-cdn-resume"
  target_resource_id         = azurerm_cdn_endpoint.resume_cdn_endpoint.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.resume_logs.id

  enabled_log {
    category = "AzureCdnAccessLog"

    retention_policy {
      enabled = false
    }
  }

  enabled_log {
    category = "AzureCdnPerformanceLog"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
