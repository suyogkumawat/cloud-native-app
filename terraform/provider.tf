terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.42" # latest stable
    }
  }

  backend "s3" {
    bucket = "storage-09052025-day1"
    key    = "vault-eks/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}

