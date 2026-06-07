module "resource_group" {
  source = "../../modules/resource-group"

  resource_group_name = "rg-dev-platform-eastus"
  location            = "East US"

  tags = {
    Environment = "Dev"
    Project     = "AzureEnterprisePlatform"
    ManagedBy   = "Terraform"
  }
}