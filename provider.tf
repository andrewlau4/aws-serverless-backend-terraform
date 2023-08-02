terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      FULLSTACK_WITH_AWS_SERVERLESS_BACKEND_DEMO = "---"
    }
  }
}