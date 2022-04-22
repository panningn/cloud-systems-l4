terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "terraform-github"

    workspaces {
      name = "L4-Nicole-Panning"
    }
  }
}

provider "aws" {
  region = lookup(var.project_tags, "region")
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}