provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

data "aws_vpcs" "main" {
  tags = {
    Env = "${var.environment}"
  }
}

resource "aws_security_group" "this" {
  for_each = "${var.groups}"

  name        = "${each.key}"
  vpc_id      = "${tolist(data.aws_vpcs.main.ids)[0]}"
  description = "${each.key} security group"

  ingress {
    from_port   = "${each.value.ingress.allowed_port}"
    to_port     = "${each.value.ingress.allowed_port}"
    protocol    = "${each.value.ingress.allowed_proto}"
    cidr_blocks = "${each.value.ingress.allowed_cidrs}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${each.key}"
    Env  = "${var.environment}"
  }
}