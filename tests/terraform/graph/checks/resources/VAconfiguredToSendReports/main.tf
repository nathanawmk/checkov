resource "azurerm_resource_group" "okLegacyExample" {
  name     = "okLegacyExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "515dd2c1-e84c-4126-9593-fb62294c157b"
  }
}

resource "azurerm_sql_server" "okLegacyExample" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.okLegacyExample.name
  location                     = azurerm_resource_group.okLegacyExample.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "2836ab8d-7c2a-4676-aeee-79d83b48d6d0"
  }
}

resource "azurerm_storage_account" "okLegacyExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okLegacyExample.name
  location                 = azurerm_resource_group.okLegacyExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "4836297d-5b17-4b1a-a553-0fd1b986dbd8"
  }
}

resource "azurerm_storage_container" "okLegacyExample" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.okLegacyExample.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "okLegacyExample" {
  resource_group_name = azurerm_resource_group.okLegacyExample.name
  server_name         = azurerm_sql_server.okLegacyExample.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "okLegacyExample" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.okLegacyExample.id
  storage_container_path          = "${azurerm_storage_account.okLegacyExample.primary_blob_endpoint}${azurerm_storage_container.okLegacyExample.name}/"
  storage_account_access_key      = azurerm_storage_account.okLegacyExample.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}

resource "azurerm_resource_group" "okExample" {
  name     = "okExample-resources"
  location = "West Europe"
  tags = {
    yor_trace = "31bc5ee0-1d75-4985-aea1-354ec129ec0e"
  }
}

resource "azurerm_mssql_server" "okExample" {
  name                         = "mysqlserver"
  resource_group_name          = azurerm_resource_group.okExample.name
  location                     = azurerm_resource_group.okExample.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "85ad15cc-332f-4a62-837f-30e0561a5d98"
  }
}

resource "azurerm_storage_account" "okExample" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.okExample.name
  location                 = azurerm_resource_group.okExample.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "e181c073-a76b-4ed2-95c0-2cb9576445ed"
  }
}

resource "azurerm_storage_container" "okExample" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.okExample.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "okExample" {
  resource_group_name = azurerm_resource_group.okExample.name
  server_name         = azurerm_mssql_server.okExample.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "okExample" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.okExample.id
  storage_container_path          = "${azurerm_storage_account.okExample.primary_blob_endpoint}${azurerm_storage_container.okExample.name}/"
  storage_account_access_key      = azurerm_storage_account.okExample.primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}

resource "azurerm_resource_group" "badExample" {
  name     = "database-rg"
  location = "West Europe"
  tags = {
    yor_trace = "ed44a7b4-7f43-4c39-90b3-8e771af65bf1"
  }
}

resource "azurerm_storage_account" "badExample" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.badExample.name
  location                 = azurerm_resource_group.badExample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    yor_trace = "77d807eb-1c12-4511-ade3-f7f790c3aefa"
  }
}

resource "azurerm_sql_server" "badExample" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.badExample.name
  location                     = azurerm_resource_group.badExample.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.badExample.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.badExample.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }

  tags = {
    environment = "production"
    yor_trace   = "5299db70-cc8d-415a-90ea-5efe32761484"
  }
}


resource "azurerm_storage_container" "badExampleNotEnabled" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.badExampleNotEnabled.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "badExampleNotEnabled" {
  resource_group_name = azurerm_resource_group.badExampleNotEnabled.name
  server_name         = azurerm_sql_server.badExampleNotEnabled.name
  state               = "Enabled"
}

resource "azurerm_mssql_server_vulnerability_assessment" "badExampleNotEnabled" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.badExampleNotEnabled.id
  storage_container_path          = "${azurerm_storage_account.badExampleNotEnabled.primary_blob_endpoint}${azurerm_storage_container.badExampleNotEnabled.name}/"
  storage_account_access_key      = azurerm_storage_account.badExampleNotEnabled.primary_access_key

  recurring_scans {
    enabled                   = false
    email_subscription_admins = false
    emails = [
      "email@example1.com",
      "email@example2.com"
    ]
  }
}
