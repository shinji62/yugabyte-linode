terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
}
