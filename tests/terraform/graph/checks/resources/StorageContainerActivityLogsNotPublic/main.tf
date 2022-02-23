resource "azurerm_storage_container" "ok_container_1" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.ok_account_1.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "ok_container_2" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.ok_account_2.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "not_ok_container" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.not_ok_account.name
  container_access_type = "private"
}

resource "azurerm_storage_account" "ok_account_1" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "8c2fcfdb-985e-4d69-bb61-9541a6602c3d"
  }
}

resource "azurerm_storage_account" "ok_account_2" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "293d1850-58af-4a53-81fa-482f37fd3bd4"
  }
}

resource "azurerm_storage_account" "not_ok_account" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "ee513480-5acb-4f11-b47e-a17ac633ee2c"
  }
}

resource "azurerm_monitor_activity_log_alert" "ok_monitor_activity_log_alert_1" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."

  criteria {
    resource_id    = azurerm_storage_account.ok_account_1.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }


  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "82f79a56-9d06-48b6-95f3-05ad9b28009f"
  }
}

resource "azurerm_monitor_activity_log_alert" "ok_monitor_activity_log_alert_2" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."
  enabled             = true

  criteria {
    resource_id    = azurerm_storage_account.ok_account_2.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }


  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "a18db649-d6b3-401f-8f24-fe9b79859e90"
  }
}

resource "azurerm_monitor_activity_log_alert" "not_ok_monitor_activity_log_alert" {
  name                = "example-activitylogalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_resource_group.main.id]
  description         = "This alert will monitor a specific storage account updates."
  enabled             = false

  criteria {
    resource_id    = azurerm_storage_account.not_ok_account.id
    operation_name = "Microsoft.Storage/storageAccounts/write"
    category       = "Recommendation"
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id

    webhook_properties = {
      from = "terraform"
    }
  }
  tags = {
    yor_trace = "8cfc1a6f-ef0a-4833-8cbd-f8694328b63a"
  }
}