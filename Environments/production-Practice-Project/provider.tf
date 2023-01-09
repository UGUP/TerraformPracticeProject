
# Terraform provider is AWS 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

backend "s3" {
    bucket = "Practice-Project"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
    aws_dynamodb_table="s3-c38"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

