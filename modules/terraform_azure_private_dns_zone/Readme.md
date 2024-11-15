# Azure Private DNS zone

Azure Private DNS provides a reliable, secure DNS service to manage and resolve domain names in a virtual network without the need to add a custom DNS solution. By using private DNS zones, you can use your own custom domain names rather than the Azure-provided names available today.

The records contained in a private DNS zone aren't resolvable from the Internet. DNS resolution against a private DNS zone works only from virtual networks that are linked to it.

For more information refer the page: https://learn.microsoft.com/en-us/azure/dns/private-dns-privatednszone

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| private_dns_zone_name | list(string) | Yes |
| virtual_network_id | string | Yes |
| resource_group_name | string | Yes |

