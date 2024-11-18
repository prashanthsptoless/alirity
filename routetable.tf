# route table module
# module "route_table" {
#   source              = "./modules/terraform_azure_route_tables"
#   env                 = var.env
#   postfix             = var.postfix
#   location            = var.location
#   route_table_name    = var.route_table_name
#   resource_group_name = module.resource_group.name
#   subnet_id           = module.virtual_network.subnet1_id
# }

# module "rt_route" {
#   source                       = "./modules/terraform_azure_routes_for_route_table"
#   env                          = var.env
#   postfix                      = var.postfix
#   route_name                   = var.route1_name
#   route_table_name             = module.route_table_1.name
#   resource_group_name          = module.resource_group.name
#   route_address_prefix         = var.route1_address_prefix
#   route_next_hop_in_ip_address = var.route1_next_hop_in_ip_address
# }

# module "rt_route_2" {
#   source                       = "./modules/terraform_azure_routes_for_route_table"
#   env                          = var.env
#   postfix                      = var.postfix
#   route_name                   = var.route2_name
#   route_table_name             = module.route_table_1.name
#   resource_group_name          = module.resource_group.name
#   route_address_prefix         = var.route2_address_prefix
#   route_next_hop_in_ip_address = var.route2_next_hop_in_ip_address
# }

# module "rt_route_3" {
#   source                       = "./modules/terraform_azure_routes_for_route_table"
#   env                          = var.env
#   postfix                      = var.postfix
#   route_name                   = var.route3_name
#   route_table_name             = module.route_table_1.name
#   resource_group_name          = module.resource_group.name
#   route_address_prefix         = var.route3_address_prefix
#   route_next_hop_in_ip_address = var.route3_next_hop_in_ip_address
# }