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

module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  vnet_name = "vnet-dev-platform"

  address_space = ["10.0.0.0/16"]

  aks_subnet_name   = "aks-subnet"
  aks_subnet_prefix = ["10.0.1.0/24"]

  bastion_subnet_prefix = ["10.0.2.0/24"]

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

module "keyvault" {
  source = "../../modules/keyvault"

  keyvault_name      = "kvdevplatform001"
  location           = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  tenant_id = var.tenant_id

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

module "acr" {
  source = "../../modules/acr"

  acr_name            = "acrdevplatform001"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

module "aks" {
  source = "../../modules/aks"

  aks_name            = "aks-dev-platform"
  dns_prefix          = "aksdev"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  subnet_id = module.network.aks_subnet_id

  node_count = 2

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

module "monitoring" {
  source = "../../modules/monitoring"

  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  log_analytics_name = "law-dev-platform"

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

module "bastion" {
  source = "../../modules/bastion"

  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  bastion_name      = "bastion-dev-platform"
  bastion_subnet_id = module.network.bastion_subnet_id

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}