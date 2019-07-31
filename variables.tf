/*****
Common Variables: Azure provider - Autoloaded from Terragrunt.
*****/

variable "region" {
  description = "The Azure region (e.g. 'australiaeast'). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

/*****
GATEWAY Module Variables - https://github.com/mashbynz/tf-mod-azure-gw
*****/

variable "vnet_name" {
  type        = string
  description = ""
  default     = ""
}
