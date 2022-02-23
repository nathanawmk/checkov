resource "azurerm_resource_group" "ok" {
  name     = "ok-resources"
  location = "West Europe"
  tags = {
    yor_trace = "9e2f3ca1-87fe-4018-a01f-1b54ee72f02f"
  }
}

resource "azurerm_key_vault" "ok" {
  name                     = "okkv"
  location                 = azurerm_resource_group.ok.location
  resource_group_name      = azurerm_resource_group.ok.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "premium"
  purge_protection_enabled = true
  tags = {
    yor_trace = "b234f570-a1ac-493b-b48b-e50b4cb5e7a2"
  }
}

resource "azurerm_key_vault_access_policy" "server" {
  key_vault_id       = azurerm_key_vault.ok.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = azurerm_mysql_server.ok.identity.0.principal_id
  key_permissions    = ["get", "unwrapkey", "wrapkey"]
  secret_permissions = ["get"]
}

resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id       = azurerm_key_vault.ok.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = data.azurerm_client_config.current.object_id
  key_permissions    = ["get", "create", "delete", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}

resource "azurerm_key_vault_key" "ok" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.ok.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  depends_on = [
    azurerm_key_vault_access_policy.client,
    azurerm_key_vault_access_policy.server,
  ]
  tags = {
    yor_trace = "31daf167-97fc-4000-b558-f91ea5756769"
  }
}

resource "azurerm_mysql_server" "ok" {
  name                             = "ok-mysql-server"
  location                         = azurerm_resource_group.ok.location
  resource_group_name              = azurerm_resource_group.ok.name
  sku_name                         = "GP_Gen5_2"
  administrator_login              = "acctestun"
  administrator_login_password     = "H@Sh1CoR3!"
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_1"
  storage_mb                       = 51200
  version                          = "5.6"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "3c669158-3a72-4d7e-abfe-c5946b56d6e8"
  }
}

resource "azurerm_mysql_server_key" "ok" {
  server_id        = azurerm_mysql_server.ok.id
  key_vault_key_id = azurerm_key_vault_key.ok.id
}

resource "azurerm_mysql_server" "not_ok" {
  name                             = "ok-mysql-server"
  location                         = azurerm_resource_group.ok.location
  resource_group_name              = azurerm_resource_group.ok.name
  sku_name                         = "GP_Gen5_2"
  administrator_login              = "acctestun"
  administrator_login_password     = "H@Sh1CoR3!"
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_1"
  storage_mb                       = 51200
  version                          = "5.6"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "ebeb8507-69b6-4e33-870b-483deb6c8b91"
  }
}