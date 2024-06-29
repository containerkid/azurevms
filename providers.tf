provider "azurerm" {
  alias           = "subscription1"
  features        {}
  subscription_id = var.subscription1_id
}

provider "azurerm" {
  alias           = "subscription2"
  features        {}
  subscription_id = var.subscription2_id
}
