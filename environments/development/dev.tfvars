#General variables
solution                = "mpmt"
owner                   = "alirity"
environment             = "development"
env_prefix              = "dev"
subscription_prefix     = "dev"
location                = "northeurope"
region_prefix           = "ne"
business_unit           = "it"
resource_group_prefix   = "rg"
ordinal_prefix          = "01"
subscription_id         = ""
project                 = "mpmt"
rg_prefix1              = "ntw"
rg_prefix2              = "dastg"
rg_prefix3              = "appser"
rg_prefix4              = "orches"

#network variables
network_prefix          = "vnet"
hub_address_space       = ["10.10.0.0/24"]
hub_subnet_prefix       = [
    {
      ip              = "10.10.0.0/26"
      name            = "AzureFirewallSubnet"
    },
    {
      ip              = "10.10.0.64/26"
      name            = "AzureBastionSubnet"
    },
    {
      ip              = "10.10.0.128/26"
      name            = "GatewaySubnet"
    }
]
spoke_address_space           = ["10.20.0.0/24"]
spoke_subnet_prefix           = [
    {
      ip              = "10.20.0.0/27"
      name            = "snet-data-orchest-tier"
      serviceendpoint = ["Microsoft.Web","Microsoft.KeyVault","Microsoft.Storage"]
      privateendpoint = "true"
    },
    {
      ip              = "10.20.0.32/27"
      name            = "snet-appser-tier"
      serviceendpoint = ["Microsoft.KeyVault","Microsoft.Web"]
      privateendpoint = "false"
    },
    {
      ip              = "10.20.0.64/27"
      name            = "snet-calc-tier"
      serviceendpoint = ["Microsoft.KeyVault","Microsoft.Web"]
      privateendpoint = "false"
    },
    {
      ip              = "10.20.0.96/27"
      name            = "snet-privateendpoint"
    }
]

#storage variables
storage_account           = "stg"
storage_account_type      = ""
account_tier              = "Standard"
account_replication_type        = "LRS"

#app-service variables
app_service_plan   = "asp"
web_app            = ""
function_app       = ""


#sql-database variables
sql_server             = ""
sql_server_admin_user  = ""
sql_server_admin_password = ""
sql_db                 = ""

# key vault variables
key_vault          = "kv"
