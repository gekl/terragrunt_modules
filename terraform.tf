# Token variable
variable "hcloud_token" {}

# Ssh key fingerprint variable
variable "hcloud_ssh_key_fingerprint" {}

# Define Hetzner provider
provider "hcloud" {
  token = var.hcloud_token
}

# Get ssh key data
data "hcloud_ssh_key" "ssh_key" {
  fingerprint = var.hcloud_ssh_key_fingerprint
}

resource "hcloud_server" "project" {
  for_each = var.project
  name        = each.value.name
  image       = each.value.image
  server_type = each.value.server_type
  ssh_keys    = [data.hcloud_ssh_key.ssh_key.id]
}

output "External_ipv4" {
value = {
    for vm in hcloud_server.project:
      vm.name => vm.ipv4_address
  }
}
