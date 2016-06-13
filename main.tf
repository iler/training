
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "eu-central-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" hashi-ilari {
  count		= "1"
  ami		= "ami-74ee001b"
  instance_type = "t2.micro"

  subnet_id		= "subnet-99a58be2"
  vpc_security_group_ids = ["sg-8e08dfe6"]

  tags {
    Identity 	= "hashiconf-02e74f10e0327ad868d138f2b4fdd6f0"
    Foo	     	= "bar"
    Zip		= "zap"
    Suvi	= "ilari"
  }
}

resource "aws_instance" hashi-suvi {
  count         = "1"
  ami           = "ami-74ee001b"
  instance_type = "t2.micro"

  subnet_id             = "subnet-99a58be2"
  vpc_security_group_ids = ["sg-8e08dfe6"]

  tags {
    Identity    = "hashiconf-02e74f10e0327ad868d138f2b4fdd6f0"
  }
}

output "public_ip" {
  value = "${join(", ", aws_instance.hashi-ilari.*.public_ip)}"
}

output "public_dns" {
  value = "${join(", ", aws_instance.hashi-ilari.*.public_dns)}"
}
