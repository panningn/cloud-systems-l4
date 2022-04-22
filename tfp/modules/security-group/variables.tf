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

variable "cidr_block_pub_rt" {
    type = string
    default = "0.0.0.0/0"
}

variable "new_vpc_id" {
  description = "VPC ID passed from VPC module"
}

output "sg_output" {
  value = "aws_security_group.permit-http.id"
}

output "sn_id" {
  value = "subnet_id.sn_id.id"
}