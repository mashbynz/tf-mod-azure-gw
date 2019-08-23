module "ergw_pip_label" {
  source             = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context            = var.context
  attributes         = ["erpip"]
  label_order        = ["name"]
  delimiter          = "-"
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}

module "ergw_label" {
  source             = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context            = var.context
  attributes         = ["ergw"]
  delimiter          = "-"
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}

module "er_label" {
  source             = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context            = var.context
  attributes         = ["er"]
  label_order        = ["name"]
  delimiter          = "-"
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
}

module "ergw_authorisation" {
  source             = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.14.1"
  context            = var.context
  attributes         = ["auth"]
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
