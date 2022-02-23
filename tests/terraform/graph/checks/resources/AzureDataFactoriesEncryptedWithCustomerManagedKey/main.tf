resource "azurerm_data_factory" "data_factory_good" {
  name                = "example"
  location            = "location"
  resource_group_name = "group"
  tags = {
    yor_trace = "fd65efeb-5774-41e9-bc22-4ae340babf52"
  }
}

resource "azurerm_data_factory" "data_factory_bad" {
  name                = "example"
  location            = "location"
  resource_group_name = "group"
  tags = {
    yor_trace = "13d53ed3-23e5-4ccf-8a20-e9db254b3267"
  }
}

resource "azurerm_data_factory_linked_service_key_vault" "factory_good" {
  name                = "example"
  resource_group_name = "example"
  data_factory_name   = azurerm_data_factory.data_factory_good.name
  key_vault_id        = "123456"
}