module "ergw_pip_label" {
  source             = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context            = var.context
  attributes         = ["pip3"]
  delimiter          = "-"
  tags               = { "random" = "face" }
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}

module "ergw_label" {
  source             = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context            = var.context
  attributes         = ["ergw"]
  delimiter          = "-"
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}

module "ipconfig_label" {
  source             = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context            = var.context
  attributes         = ["gw"]
  delimiter          = "-"
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}

# module "vnet" {
#   source  = "git::https://github.com/mashbynz/tf-mod-azure-vnet.git?ref=master"
#   context = var.context
# }
