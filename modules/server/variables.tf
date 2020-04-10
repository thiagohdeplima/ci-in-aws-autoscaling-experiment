variable "aws_region" {
  type    = "string"
  default = "us-east-2"
}

variable "aws_profile" {
  type    = "string"
  default = "default"
}

variable "canonical_account_id" {
  type    = "string"
  default = "099720109477"
}

variable "environment" {
  type    = "string"
  default = "management"
}

variable "instance_type" {
  type    = "string"
  default = "t2.micro"
}

variable "ssh_key_name" {
  type    = "string"
  default = "ssh_ci_key"
}

variable "ssh_pub_key" {
  type    = "string"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJyioe2oOMdMZJYoKXTNFPVU6zCmRqLmOeOuSIR8tRqKPtHlReSxm7b26ziiBLvu6N2H3E0zLsZ/ry+s+HuS0EhkeI/hd5XQvVp/Vgvq97YuU48tLq0k0ZxhgHCYM0HXDwy5eU3AZPUq8ypl1EOy8p1HuwHWagydXI9e52QfCRU/idnQ1AfWnd/e0FH4vRz2/cpUwNcfynjpl5vhmx18KKURlSEjW4V11scXbnEVH9uRDdajDanU7NwcIEBBzqcWD+VFAZMqK5jzogmA8RCet9bjHgiH2Wzhj7wXygtRKWc68a5nlSGhzMCTJtJhkRSca4PMV038vyzcLhw8HjyIa3"
}
