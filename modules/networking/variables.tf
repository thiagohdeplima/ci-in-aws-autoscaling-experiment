variable "aws_region" {
  type    = "string"
  default = "us-east-2"
}

variable "aws_profile" {
  type    = "string"
  default = "default"
}

variable "network_cidr" {
  type    = "string"
  default = "10.0.0.0/16"
}

variable "subnets_cidrs" {
  type    = "map"
  default = {
    CI = [
      "10.0.0.0/26",
      "10.0.0.64/26",
      "10.0.0.128/26",
      "10.0.0.192/26"
    ]
  }
}

variable "environment" {
  type        = "string"
  default     = "management"
  description = "Environment name, like production, staging, etc"
}

