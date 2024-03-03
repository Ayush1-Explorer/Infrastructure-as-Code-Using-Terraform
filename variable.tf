variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_ec2_cidr_block" {
  description = "CIDR block for the private EC2 subnet"
  type        = string
}

variable "private_subnet_rds_cidr_block" {
  description = "CIDR block for the private RDS subnet"
  type        = string
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks for SSH access"
  type        = list(string)
}

variable "anywhere_access_cidr_blocks" {
  description = "CIDR blocks for RDS access"
  type        = list(string)
}

variable "ami_id" {
  description = "ID of the Amazon Machine Image (AMI) to use for EC2 instance"
  type        = string
}

variable "db_engine_version" {
  description = "Version of the database engine for RDS instance"
  type        = string
}

variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Name of the database in RDS instance"
  type        = string
}

variable "db_instance_class" {
  description = "instance type of the database in RDS instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "instance type of the database in RDS instance"
  type        = string
}

variable "pubrt_cidr" {
  description = "instance type of the database in RDS instance"
  type        = string
}

variable "master_user_secret_kms_key" {
  description = "instance type of the database in RDS instance"
  type        = string
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "subnet"
  description = "DB subnet group for RDS instance"
  subnet_ids = [aws_subnet.private_subnet_ec2.id, aws_subnet.private_subnet_rds.id]  
}
 
resource "aws_security_group" "ec2_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.anywhere_access_cidr_blocks
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.anywhere_access_cidr_blocks
  }
}

resource "aws_security_group" "rds_security_group" {
    vpc_id = aws_vpc.my_vpc.id

 ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = var.anywhere_access_cidr_blocks
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.anywhere_access_cidr_blocks
  }
}