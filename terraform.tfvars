aws_region                = "ap-south-1"
vpc_cidr_block            = "10.0.0.0/16"
public_subnet_cidr_block  = "10.0.1.0/24"
private_subnet_ec2_cidr_block = "10.0.2.0/24"
private_subnet_rds_cidr_block = "10.0.3.0/24"

# You can adjust these CIDR blocks as needed.

ssh_cidr_blocks           = ["10.0.0.0/16"]
anywhere_access_cidr_blocks    = ["0.0.0.0/0"]
pubrt_cidr                = "0.0.0.0/0"

# Specify the necessary values for RDS instance
ami_id                    = "ami-03bb6d83c60fc5f7c"
db_engine_version         = "8.0.35"
db_instance_identifier    = "testdb"
db_username               = "admin"
db_password               = "/%%/"
db_name                   = "webappdb"
db_instance_class          = "db.t2.micro"
ec2_instance_type         = "t2.micro"
