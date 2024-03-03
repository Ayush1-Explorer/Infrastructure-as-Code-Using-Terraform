output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_ec2_id" {
  description = "ID of the private EC2 subnet"
  value       = aws_subnet.private_subnet_ec2.id
}

output "private_subnet_rds_id" {
  description = "ID of the private RDS subnet"
  value       = aws_subnet.private_subnet_rds.id
}

output "db_subnet_group_id" {
  description = "ID of the DB subnet group"
  value       = aws_db_subnet_group.my_db_subnet_group.id
}

output "internet_gateway_id" {
  description = "ID of the internet gateway"
  value       = aws_internet_gateway.my_igw.id
}

output "nat_gateway_id" {
  description = "ID of the NAT gateway"
  value       = aws_nat_gateway.my_nat_gateway.id
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "rds_instance_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.rds_instance.id
}

output "nat_gateway_public_ip" {
  description = "Primary public IPv4 address of the NAT Gateway"
  value       = aws_eip.my_eip.public_ip
}

