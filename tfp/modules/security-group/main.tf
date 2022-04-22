resource "aws_security_group" "permit-http" {
    name = "permit-http"
    description = "allow web traffic and SSH"
    vpc_id = var.new_vpc_id

    ingress {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks  = [var.cidr_block_pub_rt]
    }

    ingress {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks  = [var.cidr_block_pub_rt]
    }

    egress {
      description = "Allow all traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks  = [var.cidr_block_pub_rt]
    }
}
