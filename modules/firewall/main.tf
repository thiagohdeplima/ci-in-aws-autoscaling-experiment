provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_security_group" "this" {
  for_each = "${var.groups}"

  name        = "${each.key}"
  vpc_id      = "${var.vpc_id}"
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