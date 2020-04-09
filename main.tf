terraform {
  backend "s3" {
    region = "us-east-2"
    key    = "terraform/state"
    bucket = "codebrain-terraform"
  }
  
  required_providers {
    aws = ">= 2.14.0"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

provider "azurerm" {
  version = ">= 2.0.0"
  features {}
}

provider "google" {

}