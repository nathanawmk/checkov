resource "azurerm_resource_group" "ok" {
  name     = "ok-resources"
  location = "West Europe"
  tags = {
    yor_trace = "a70b84aa-1d24-4a0b-aa45-b038ef05ea99"
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
    yor_trace = "6b99c728-6a38-421b-b6d1-0279a94e1c9f"
  }
}

resource "azurerm_key_vault_access_policy" "server" {
  key_vault_id       = azurerm_key_vault.ok.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = azurerm_postgresql_server.ok.identity.0.principal_id
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
    yor_trace = "7c02ccc4-307c-4caa-b146-26e017bd0a0c"
  }
}

resource "azurerm_postgresql_server" "ok" {
  name                             = "ok-pg-server"
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
    yor_trace = "123f2e22-39b6-4a05-bff8-b24b4a8196bf"
  }
}

resource "azurerm_postgresql_server_key" "ok" {
  server_id        = azurerm_postgresql_server.ok.id
  key_vault_key_id = azurerm_key_vault_key.ok.id
}

resource "azurerm_postgresql_server_key" "not_ok" {
  name                             = "ok-pg-server"
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
}