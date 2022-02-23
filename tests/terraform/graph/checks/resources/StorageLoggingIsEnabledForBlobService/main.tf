resource "azurerm_resource_group" "resource_group_ok" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "fcd0a4dc-7b1f-42eb-b798-ad941c726c21"
  }
}

resource "azurerm_log_analytics_workspace" "analytics_workspace_ok" {
  name                = "exampleworkspace"
  location            = azurerm_resource_group.resource_group_ok.location
  resource_group_name = azurerm_resource_group.resource_group_ok.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    yor_trace = "7128a322-c486-4a34-b424-b4126b7561de"
  }
}

resource "azurerm_storage_account" "storage_account_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.resource_group_ok.name
  location                 = azurerm_resource_group.resource_group_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "4e02ccd4-36bd-4fbe-83d6-461789294ce2"
  }
}

resource "azurerm_log_analytics_storage_insights" "analytics_storage_insights_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.resource_group_ok.name
  workspace_id        = azurerm_log_analytics_workspace.analytics_workspace_ok.id

  storage_account_id   = azurerm_storage_account.storage_account_ok.id
  storage_account_key  = azurerm_storage_account.storage_account_ok.primary_access_key
  blob_container_names = ["blobExample_ok"]
  tags = {
    yor_trace = "b2db1585-c3c2-40d0-afaf-cd1a94189c56"
  }
}

resource "azurerm_storage_container" "storage_container_ok" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.storage_account_ok.name
  storage_container_name = azurerm_storage_container.storage_container_ok.name
  container_access_type  = "blob"
}


resource "azurerm_storage_account" "storage_account_not_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_not_ok.name
  location                 = azurerm_resource_group.blobExample_not_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "ed146d8c-226f-457c-a8b3-f1045f5bb58f"
  }
}

resource "azurerm_log_analytics_storage_insights" "storage_insights_not_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_not_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_not_ok.id

  storage_account_id  = azurerm_storage_account.storage_account_not_ok.id
  storage_account_key = azurerm_storage_account.storage_account_not_ok.primary_access_key
  tags = {
    yor_trace = "6fc5ac56-7561-49ae-aadc-a6cd611f9f54"
  }
}

resource "azurerm_storage_container" "storage_container_not_ok" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.storage_account_not_ok.name
  storage_container_name = azurerm_storage_container.storage_container_not_ok.name
  container_access_type  = "blob"
}


