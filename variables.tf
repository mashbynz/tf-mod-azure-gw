/*****
Common Variables: Azure provider - Autoloaded from Terragrunt.
*****/

variable "region" {
  description = "The Azure region (e.g. 'australiaeast'). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "enabled" {
  type        = bool
  description = "switch if this resource is to be created or not"
  default     = true
}


/*****
GATEWAY Module Variables - https://github.com/mashbynz/tf-mod-azure-gw
*****/

variable "resource_group_name" {
  type        = string
  description = ""
  default     = ""
}

variable "gateway_subnet_id" {
  type        = string
  description = ""
  default     = ""
}

variable "location" {
  type        = string
  description = ""
  default     = ""
}

variable "express_route_config" {
  type = object({
    regions                       = map(string)
    enabled                       = bool
    primary_peer_address_prefix   = list(string)
    secondary_peer_address_prefix = list(string)
    advertised_public_prefixes = object({
      ae  = list(string)
      ase = list(string)
    })
    peering_location        = map(string)
    provider_name           = map(string)
    bandwidth_in_mbps       = map(string)
    tier                    = string
    family                  = string
    peering_type            = string
    peer_asn                = number
    vlan_id                 = number
    ergw_allocation_method  = string
    ergw_ip_sku             = string
    ergw_type               = string
    ergw_sku                = string
    ergw_private_allocation = string
  })
  default = {
    enabled                       = true
    primary_peer_address_prefix   = []
    secondary_peer_address_prefix = []
    advertised_public_prefixes    = {}
    peering_location              = {}
    provider_name                 = {}
    bandwidth_in_mbps             = {}
    tier                          = ""
    family                        = ""
    peering_type                  = ""
    peer_asn                      = null
    vlan_id                       = null
    ergw_allocation_method        = ""
    ergw_ip_sku                   = ""
    ergw_type                     = ""
    ergw_sku                      = ""
    ergw_private_allocation       = ""
  }
  description = "Default express route configuration"
}

/*****
Label Module Variables
*****/

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "class" {
  type        = string
  default     = ""
  description = "the type of resource e.g. 'sharedservices' or 'app1'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "regex_replace_chars" {
  type        = string
  default     = "/[^a-zA-Z0-9-]/"
  description = "Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed"
}

variable "context" {
  type = object({
    namespace           = string
    environment         = string
    stage               = string
    name                = string
    enabled             = bool
    delimiter           = string
    attributes          = list(string)
    label_order         = list(string)
    tags                = map(string)
    additional_tag_map  = map(string)
    regex_replace_chars = string
  })
  default = {
    namespace           = ""
    environment         = ""
    stage               = ""
    name                = ""
    enabled             = true
    delimiter           = ""
    attributes          = []
    label_order         = []
    tags                = {}
    additional_tag_map  = {}
    regex_replace_chars = ""
  }
  description = "Default context to use for passing state between label invocations"
}
