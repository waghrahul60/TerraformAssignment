terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend "s3" {
  #   bucket = "testbucket458294"
  #   key    = "testproject/dev"
  #   region = "us-east-1"
  # }
}

# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


