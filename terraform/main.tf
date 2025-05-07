provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  endpoints {
    ec2 = "http://ip10-0-2-6-cvh9tgab9qb14bivkplg-4566.direct.lab-boris.fr"
  }
}

resource "random_id" "unique" {
  byte_length = 4
}

resource "aws_instance" "demo" {
  ami           = "ami-${random_id.unique.hex}"  # AMI générée dynamiquement
  instance_type = "t2.micro"

  tags = {
    Name = "demo-${random_id.unique.hex}"
  }
}
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}
