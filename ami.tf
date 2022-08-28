provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-kvbucket"
    key    = "ami/user/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ami" {
  source = "github.com/krishnavamsi7616/immutable-app-ami"
  COMPONENT = "user"
  APP_VERSION = var.APP_VERSION
}

variable "APP_VERSION" {}