resource "azurerm_sql_server" "sql_server_good_1" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "ec83811f-f160-442a-b745-0d2642628816"
  }
}

resource "azurerm_sql_server" "sql_server_good_2" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "2a93b742-fc95-4f48-86dc-49f263a773fc"
  }
}

resource "azurerm_sql_server" "sql_server_bad_1" {
  name                         = "mysqlserver"
  resource_group_name          = "group"
  location                     = "location"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  tags = {
    yor_trace = "208c8c74-2baa-43ab-9885-ac60ddb49f9d"
  }
}

resource "azurerm_mssql_server_security_alert_policy" "alert_policy_good" {
  resource_group_name = "group"
  server_name         = azurerm_sql_server.sql_server_good_1.name
  state               = "Enabled"
  retention_days      = 20
}

resource "azurerm_mssql_server_security_alert_policy" "alert_policy_bad" {
  resource_group_name = "group"
  server_name         = azurerm_sql_server.sql_server_bad_1.name
  state               = "Disabled"
  retention_days      = 20
}