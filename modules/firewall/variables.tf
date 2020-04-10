variable "aws_region" {
  type    = "string"
  default = "us-east-2"
}

variable "aws_profile" {
  type    = "string"
  default = "default"
}

variable "environment" {
  type    = "string"
  default = "management"
}

variable "groups" {
  type    = "map"
  default = {
    ssh = {
      ingress = {
        allowed_port    = 22
        allowed_proto   = "tcp"
        allowed_cidrs   = ["0.0.0.0/0"]
        allowed_secgrps = []
      }
    }

    jenkins = {
      ingress = {
        allowed_port    = 8080
        allowed_proto   = "tcp"
        allowed_cidrs   = ["0.0.0.0/0"]
        allowed_secgrps = []
      }
    }

    sonarqube = {
      ingress = {
        allowed_port    = 9000
        allowed_proto   = "tcp"
        allowed_cidrs   = ["0.0.0.0/0"]
        allowed_secgrps = []
      }
    }
  }
}
