terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.70.0"
    }
  }
  backend "s3" {
    region = "us-east-1"
    bucket = "evansf-storage"
    key    = "base-odoo-terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}