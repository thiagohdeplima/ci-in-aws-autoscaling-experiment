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
    nfs = {
      ingress = {
        allowed_port  = 2049
        allowed_proto = "tcp"
        allowed_cidrs = [
          "10.0.0.0/26",
          "10.0.0.64/26",
          "10.0.0.128/26",
          "10.0.0.192/26"
        ]
        allowed_secgrps = []
      }
    }

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
