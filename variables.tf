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

variable "ergw_allocation_method" {
  type        = string
  description = ""
  default     = ""
}

variable "ergw_ip_sku" {
  type        = string
  description = ""
  default     = ""
}

variable "ergw_type" {
  type        = string
  description = ""
  default     = ""
}

variable "ergw_sku" {
  type        = string
  description = ""
  default     = ""
}

variable "ergw_private_alloc" {
  type        = string
  description = ""
  default     = ""
}

variable "vpngw_client_address" {
  type        = list(string)
  description = ""
  default     = []
}

variable "gateway_vnet_rg_name" {
  type        = string
  description = ""
  default     = ""
}

variable "service_provider_name" {
  type        = string
  description = ""
  default     = ""
}

variable "peering_location" {
  type        = string
  description = ""
  default     = ""
}

variable "bandwidth_in_mbps" {
  type        = number
  description = ""
  default     = 0
}

variable "tier" {
  type        = string
  description = ""
  default     = ""
}

variable "family" {
  type        = string
  description = ""
  default     = ""
}

variable "peering_type" {
  type        = string
  description = ""
  default     = ""
}

variable "peer_asn" {
  type        = number
  description = ""
  default     = 0
}

variable "primary_peer_address_prefix" {
  type        = string
  description = ""
  default     = ""
}

variable "secondary_peer_address_prefix" {
  type        = string
  description = ""
  default     = ""
}

variable "vlan_id" {
  type        = number
  description = ""
  default     = 0
}

variable "advertised_public_prefixes" {
  type        = list(string)
  description = ""
  default     = []
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
