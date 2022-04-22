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
  default = "./terraform-ec2"
}

variable "cidr_block" {
  type    = string
  default = "100.64.0.0/16"
}

variable "public_cidr" {
  type    = string
  default = "100.64.0.0/24"
}

variable "private_cidr" {
  type    = string
  default = "100.64.3.0/24"
}

variable "cidr_block_pub_rt" {
  type    = string
  default = "0.0.0.0/0"
}

variable "az" {
  type    = string
  default = "us-east-1a"
}

variable "name" {
  type    = string
  default = "new"
}