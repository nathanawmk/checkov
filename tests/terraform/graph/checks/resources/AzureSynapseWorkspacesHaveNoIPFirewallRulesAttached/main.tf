resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "56f54531-fa28-43fe-84c5-baedfb0029e5"
  }
}

resource "azurerm_synapse_workspace" "workspace_good" {
  name                             = "example"
  sql_administrator_login          = "sqladminuser"
  sql_administrator_login_password = "H@Sh1CoR3!"
  managed_virtual_network_enabled  = true
  tags = {
    Env       = "production"
    yor_trace = "d40b889c-3f30-43c2-bb27-4c556aaa7b60"
  }
}

resource "azurerm_synapse_workspace" "workspace_bad" {
  name                             = "example"
  sql_administrator_login          = "sqladminuser"
  sql_administrator_login_password = "H@Sh1CoR3!"
  tags = {
    Env       = "production"
    yor_trace = "a659aac0-73a0-4976-824f-3ffe4e6026d8"
  }
}

resource "azurerm_synapse_firewall_rule" "firewall_rule" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.workspace_bad.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"
}