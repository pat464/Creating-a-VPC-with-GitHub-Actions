terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
  #  backend "s3" {
  #    bucket = "Remote-S3-Backend"
  #    key    = "Dev/terraform/statefiles"
  #    region = "us-east-1"
  #  }
}
#Provider Block
provider "aws" {
  region = "us-east-1"
}