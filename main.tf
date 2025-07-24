terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.4.0"
    }
  }
  backend "s3" {
    bucket ="infosys-assignment"
    key = "assignment.ftstate"
    region = "us-west-2"
    
  }
  }

provider "aws" {
  region = "us-west-2"
}