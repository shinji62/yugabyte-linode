# Start an AWS instance with the cloud-init config as user data
resource "linode_instance" "node_gwenn" {
  count           = var.node_on_prem_test
  image           = "linode/ubuntu20.04"
  type            = "g6-standard-4"
  label           = "${var.resource_prefix}_yb_onprem_node_${count.index}"
  stackscript_id  = 392559
  region          = var.region
  private_ip      = true
  authorized_keys = ["${chomp(file(local.node_ssh_key))}"]

  stackscript_data = {
    "userdata" = base64encode(templatefile(
      "${path.module}/scripts/cloud-init-node.yml.tpl",
      {
        public_key_node = file(local.node_ssh_key)
        num             = count.index
      }
    ))
  }
}


resource "linode_volume" "data" {
  count     = var.node_on_prem_test
  label     = "dataDisk${count.index}"
  region    = element(linode_instance.node_gwenn.*.region, count.index)
  linode_id = element(linode_instance.node_gwenn.*.id, count.index)
}
