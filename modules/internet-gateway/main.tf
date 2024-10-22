resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet" {
  count    = length(var.public_subnet_ids)
  subnet_id = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}