locals {
  node_ssh_key    = (var.node_on_prem_public_key_path != null ? var.node_on_prem_public_key_path : "")
  resource_prefix = var.resource_prefix

}
