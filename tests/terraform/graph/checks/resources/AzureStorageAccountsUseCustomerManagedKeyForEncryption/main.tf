data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                = "examplekv"
  location            = "location"
  resource_group_name = "group"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled = true
  tags = {
    yor_trace = "48f24244-9ce4-41c5-8ba3-f4cbe8f04b99"
  }
}

resource "azurerm_key_vault_key" "example" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  tags = {
    yor_trace = "81385f1b-35e8-4b58-9f64-322cb18ecef0"
  }
}


resource "azurerm_storage_account" "storage_account_good_1" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "80e7ccd4-33a7-478e-b66f-1f9138b491ff"
  }
}

resource "azurerm_storage_account" "storage_account_bad_1" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "cd0090b5-12cc-43e1-af78-e0e220c8694b"
  }
}

resource "azurerm_storage_account" "storage_account_bad_2" {
  name                     = "examplestor"
  resource_group_name      = "group"
  location                 = "location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  identity {
    type = "SystemAssigned"
  }
  tags = {
    yor_trace = "1b9d5a6b-c74d-4272-845c-a7ce14bf875f"
  }
}

resource "azurerm_storage_account_customer_managed_key" "managed_key_good" {
  storage_account_id = azurerm_storage_account.storage_account_good_1.id
  key_vault_id       = azurerm_key_vault.example.id
  key_name           = azurerm_key_vault_key.example.name
  key_version        = "1"
}


resource "azurerm_storage_account_customer_managed_key" "managed_key_bad_1" {
  storage_account_id = azurerm_storage_account.storage_account_bad_1.id
  key_vault_id       = ""
  key_name           = azurerm_key_vault_key.example.name
  key_version        = "1"
}
