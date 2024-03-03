resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = var.ec2_instance_type
    subnet_id = aws_subnet.private_subnet_ec2.id
    associate_public_ip_address = true
    security_groups = [aws_security_group.ec2_security_group.id]
tags = {
    Name = "server"
  }
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = var.db_engine_version
  multi_az             = false
  identifier           = var.db_instance_identifier
  instance_class       = var.db_instance_class
  storage_type         = "gp2"
  username             = var.db_username
  password             = var.db_password
  db_name              = var.db_name
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_security_group.id]
  skip_final_snapshot  = true
}


#creating vpc endpoint
resource "aws_ec2_instance_connect_endpoint" "webconnect" {
  subnet_id = aws_subnet.private_subnet_ec2.id
  tags = {
    Name = "endpoint"
  }
}
