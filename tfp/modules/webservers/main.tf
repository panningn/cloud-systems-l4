resource "aws_instance" "web" {
  count                  = var.instance_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  availability_zone      = var.az
  key_name               = var.aws_key_pair
  security_groups        = [var.sg_id]
  tags = merge(
    var.project_tags,
    {
      Name = "webserver-${count.index +1}"
    },
  )
  user_data              = <<-EOF
      #!/bin/bash
      yum update -y
      yum install httpd -y
      cd /var/www/html
      echo "VM $(hostname -f)" > index.html
      systemctl restart httpd
      systemctl enable hhtp
      EOF
}
