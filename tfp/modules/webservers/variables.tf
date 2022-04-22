variable "project_tags" {
  type = map(string)
  default = {
    Owner      = "Nicole Panning"
    Purpose    = "Dev"
    CostCenter = "0001"
    region     = "us-east-1"
  }
}

variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_key_pair" {
  default = "terraform-ec2"
}

variable "aws_key_path" {
  default = "/tfp/terraform-ec2"
}

variable "cidr_block" {
    type = string 
    default = "100.64.0.0/16"
}

variable "public_cidr" {
    type = string
    default = "100.64.0.0/24"
}

variable "private_cidr" {
    type = string
    default = "100.64.3.0/24"
}

variable "cidr_block_pub_rt" {
    type = string
    default = "0.0.0.0/0"
}

variable "az" {
    type    = string
    default =  "us-east-1a"
}

variable "name" {
    type = string
    default = "new"
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

variable "sg_id" {
  description = "SG ID passed from security-group module"
}

variable "pub_sn_id" {
  description = "Public Subnet ID from the security-group module"
}