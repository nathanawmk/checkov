resource "azurerm_resource_group" "blobExample_ok" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "d12a09ff-5506-486f-ba2b-1651a8ed6c4c"
  }
}

resource "azurerm_log_analytics_workspace" "blobExample_ok" {
  name                = "exampleworkspace"
  location            = azurerm_resource_group.blobExample_ok.location
  resource_group_name = azurerm_resource_group.blobExample_ok.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    yor_trace = "0f1632e4-3849-4b5b-918a-6aae43dc0e38"
  }
}

resource "azurerm_storage_account" "blobExample_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_ok.name
  location                 = azurerm_resource_group.blobExample_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "02b9e355-4970-4ef6-9475-b633256b175a"
  }
}

resource "azurerm_log_analytics_storage_insights" "blobExample_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_ok.id

  storage_account_id  = azurerm_storage_account.blobExample_ok.id
  storage_account_key = azurerm_storage_account.blobExample_ok.primary_access_key
  table_names         = ["myexampletable_ok"]
  tags = {
    yor_trace = "d1ac7d49-01c8-4d46-8a74-27ee3a2c8c1a"
  }
}

resource "azurerm_storage_table" "blobExample_ok" {
  name                   = "myexampletable_ok"
  storage_account_name   = azurerm_storage_account.blobExample_ok.name
  storage_container_name = azurerm_storage_container.blobExample_ok.name
}


resource "azurerm_storage_account" "blobExample_not_ok" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.blobExample_not_ok.name
  location                 = azurerm_resource_group.blobExample_not_ok.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "50f0143d-f3d4-49ff-acd7-0c6a3c72ad14"
  }
}

resource "azurerm_log_analytics_storage_insights" "blobExample_not_ok" {
  name                = "example-storageinsightconfig"
  resource_group_name = azurerm_resource_group.blobExample_not_ok.name
  workspace_id        = azurerm_log_analytics_workspace.blobExample_not_ok.id

  storage_account_id  = azurerm_storage_account.blobExample_not_ok.id
  storage_account_key = azurerm_storage_account.blobExample_not_ok.primary_access_key
  tags = {
    yor_trace = "76ba9051-ca73-421c-afec-15ccb8284da0"
  }
}

resource "azurerm_storage_table" "blobExample_not_ok" {
  name                   = "myexampletable_not_ok"
  storage_account_name   = azurerm_storage_account.blobExample_not_ok.name
  storage_container_name = azurerm_storage_container.blobExample_not_ok.name
}

