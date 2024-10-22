resource "aws_instance" "bastion" {
  ami           = "ami-0ebfd941bbafe70c6" 
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name

  tags = {
    Name = "BastionHost"
  }
}
output "bastion_instance_id" {
  value = aws_instance.bastion.id
}