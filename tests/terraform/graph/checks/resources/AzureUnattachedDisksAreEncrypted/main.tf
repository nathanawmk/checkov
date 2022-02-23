resource "azurerm_resource_group" "group" {
  name     = "example-resources"
  location = "West Europe"
  tags = {
    yor_trace = "80099d62-33fd-4544-a2c8-d298d3f7dbba"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_1" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  encryption_settings {
    enabled = true
  }
  tags = {
    environment = "staging"
    yor_trace   = "ecf16624-4cdc-4560-813e-d81e2127b7f8"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_2" {
  name                   = "acctestmd"
  location               = "West US 2"
  resource_group_name    = azurerm_resource_group.group.name
  storage_account_type   = "Standard_LRS"
  create_option          = "Empty"
  disk_size_gb           = "1"
  disk_encryption_set_id = "12345"
  tags = {
    environment = "staging"
    yor_trace   = "7b1d4cab-e721-45fa-9a6f-759d74adec47"
  }
}

resource "azurerm_managed_disk" "managed_disk_good_3" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  tags = {
    environment = "staging"
    yor_trace   = "c99c0758-39b7-4f81-be79-5647a8b09765"
  }

  encryption_settings {
    enabled = true
  }
}

resource "azurerm_managed_disk" "managed_disk_bad_1" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  tags = {
    environment = "staging"
    yor_trace   = "ea78f232-4b01-467a-9157-0d5891797b57"
  }
}

resource "azurerm_managed_disk" "managed_disk_bad_2" {
  name                 = "acctestmd"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.group.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
  encryption_settings {
    enabled = false
  }
  tags = {
    environment = "staging"
    yor_trace   = "0ee74052-2e6a-4cc9-8e6c-936b34452b94"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_good_1" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name            = "myosdisk1"
    caching         = "ReadWrite"
    create_option   = "FromImage"
    managed_disk_id = azurerm_managed_disk.managed_disk_good_1.id
  }
  tags = {
    yor_trace = "a982b226-f8b2-4253-86fe-054728a55c20"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_good_2" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name            = "myosdisk1"
    caching         = "ReadWrite"
    create_option   = "FromImage"
    managed_disk_id = azurerm_managed_disk.managed_disk_good_2.id
  }
  tags = {
    yor_trace = "3eb7edf4-aa03-44ad-af03-3c76fdcc8754"
  }
}


resource "azurerm_virtual_machine" "virtual_machine_good_3" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "managed"
  }
  tags = {
    yor_trace = "4016a58e-fbcf-4215-ac29-ade1194b9e15"
  }
}


resource "azurerm_virtual_machine" "virtual_machine_bad_1" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = azurerm_managed_disk.managed_disk_bad_1.id
  }
  tags = {
    yor_trace = "f254510d-ea6e-49ae-8524-97223d809793"
  }
}

resource "azurerm_virtual_machine" "virtual_machine_bad_2" {
  name                  = "$vm"
  location              = "location"
  resource_group_name   = azurerm_resource_group.group.name
  network_interface_ids = ["id"]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = azurerm_managed_disk.managed_disk_bad_2.id
  }
  tags = {
    yor_trace = "7f5065f4-eb1f-47e5-9452-e64e794a8222"
  }
}