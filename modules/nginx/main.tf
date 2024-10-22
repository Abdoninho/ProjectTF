resource "aws_instance" "nginx" {
  count         = 2
  ami           = var.nginx_ami
  instance_type = var.instance_type 
  subnet_id     = var.private_subnets[count.index]
  key_name      = var.key_name


    user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
            EOF

  tags = {
    Name = "NginxInstance-${count.index + 1}"
  }
}

output "instance_ids" {
  value = aws_instance.nginx[*].id
}