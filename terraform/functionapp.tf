resource "azurerm_app_service_plan" "function_plan" {
  name                = "asp-resume-functions"
  location            = azurerm_resource_group.resume.location
  resource_group_name = azurerm_resource_group.resume.name
  kind                = "FunctionApp"
  reserved            = true  # required for Linux

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_linux_function_app" "resume_api" {
  name                       = "resume-visitor-api"
  location                   = azurerm_resource_group.resume.location
  resource_group_name        = azurerm_resource_group.resume.name
  service_plan_id            = azurerm_app_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.resume.name
  storage_account_access_key = azurerm_storage_account.resume.primary_access_key

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      node_version = "18"
    }
    cors {
      allowed_origins = [
        "https://manuresumestorageacct.z8.web.core.windows.net"
      ]
      support_credentials = false
    }
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node"
    WEBSITE_RUN_FROM_PACKAGE = "1"
    WORKSPACE_ID             = "587a2689-7f12-4f89-9b1b-4b2b3d346263"
  }
}
