

provider "scaleway" {
  access_key      = "SCW7Q77VGY2NB0BRVBGG"
  secret_key      = "e4f60e72-b97d-403a-8a24-1921ee06a17e"
  organization_id = "4db4430e-bffa-48fa-a5f7-6554bd128cf8"
  zone            = "fr-par-1"
  region          = "fr-par"
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "data" {
  size_in_gb = 550
  type = "l_ssd"
}

resource "scaleway_instance_security_group" "my-security-group" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
  }

  inbound_rule {
    action = "accept"
    port   = "80"
  }

  inbound_rule {
    action = "accept"
    port   = "443"
  }
}

resource "scaleway_instance_server" "my-ubuntu-instance" {
  type  = "GP1-M"
  image = "ubuntu-focal"

  tags = [ "FocalFossa", "MyUbuntuInstance" ]

  ip_id = scaleway_instance_ip.public_ip.id

  additional_volume_ids = [ scaleway_instance_volume.data.id ]
  security_group_id = scaleway_instance_security_group.my-security-group.id

}

