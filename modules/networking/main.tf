terraform {
  backend "s3" {
    region = "us-east-2"
    bucket = "codebrain-terraform"
    key    = "networking/terraform.tfstate"
  }
  
  required_providers {
    aws = ">= 2.14.0"
  }
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_vpc" "this" {
  cidr_block = "${var.network_cidr}"

  tags = {
    Env  = "${var.environment}"
    Name = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.this.id}"

  tags = {
    Env  = "${var.environment}"
    Name = "${var.environment}"
  }
}

resource "aws_route" "default" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
  route_table_id         = "${aws_vpc.this.main_route_table_id}"
}

resource "aws_subnet" "CI" {
  count = "${length(data.aws_availability_zones.azs.names)}"

  vpc_id            = "${aws_vpc.this.id}"
  availability_zone = "${data.aws_availability_zones.azs.names["${count.index}"]}"
  cidr_block        = "${var.subnets_cidrs.CI[count.index]}"

  tags = {
    Name = "CI"
    Env  = "${var.environment}"
  }
}

resource "aws_subnet" "NFS" {
  count = "${length(data.aws_availability_zones.azs.names)}"

  vpc_id            = "${aws_vpc.this.id}"
  availability_zone = "${data.aws_availability_zones.azs.names["${count.index}"]}"
  cidr_block        = "${var.subnets_cidrs.NFS[count.index]}"

  tags = {
    Name = "NFS"
    Env  = "${var.environment}"
  }
}
