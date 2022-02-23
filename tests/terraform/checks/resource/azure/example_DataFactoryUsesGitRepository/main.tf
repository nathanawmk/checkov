# pass

resource "azurerm_data_factory" "github" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name

  github_configuration {
    account_name    = "bridgecrewio"
    branch_name     = "master"
    git_url         = "https://github.com"
    repository_name = "checkov"
    root_folder     = "/"
  }
  tags = {
    yor_trace = "69a31e4c-5afd-40df-bcb6-8dc3dfe71cc5"
  }
}

resource "azurerm_data_factory" "vsts" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name

  vsts_configuration {
    account_name    = "bridgecrewio"
    branch_name     = "master"
    project_name    = "chechov"
    repository_name = "checkov"
    root_folder     = "/"
    tenant_id       = "123456789"
  }
  tags = {
    yor_trace = "cdeaf392-ca0b-45e5-bf5f-6497e3c0f4cf"
  }
}

# fail

resource "azurerm_data_factory" "fail" {
  location            = azurerm_resource_group.example.location
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    yor_trace = "ed5895b6-7f56-4bcc-940d-55af50eb2f8d"
  }
}
