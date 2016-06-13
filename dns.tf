
variable "dnsimple_token" {}
variable "dnsimple_email" {}

provider "dnsimple" {
  token = "${var.dnsimple_token}"
  email = "${var.dnsimple_email}"
}

resource "dnsimple_record" "example" {
  domain = "terraform.rocks"
  type   = "A"
  name   = "ilari"
  value  = "${aws_instance.hashi-ilari.0.public_ip}"
}
