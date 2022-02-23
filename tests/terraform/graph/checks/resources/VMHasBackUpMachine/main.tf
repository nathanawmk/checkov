
resource "azurerm_virtual_machine" "example_ok" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  tags = {
    yor_trace = "099dd184-be82-4961-b77f-35127fc7d475"
  }
}

resource "azurerm_backup_protected_vm" "vm_protected_backup" {
  resource_group_name = azurerm_resource_group.example_ok.name
  recovery_vault_name = azurerm_recovery_services_vault.example_ok.name
  source_vm_id        = azurerm_virtual_machine.example_ok.id
  backup_policy_id    = azurerm_backup_policy_vm.example_ok.id
  tags = {
    yor_trace = "be8d95a3-90d7-4e56-8b85-a6a3236ce882"
  }
}


resource "azurerm_virtual_machine" "example_not_ok" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  tags = {
    yor_trace = "cc583261-3787-498c-8f5a-d2b5acc5b6c7"
  }
}
