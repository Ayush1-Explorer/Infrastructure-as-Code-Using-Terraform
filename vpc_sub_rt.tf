resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block 

  enable_dns_support   = true
  enable_dns_hostnames = true

tags = {
    Name = "myVPC"
    }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "INT_GATEWAY"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr_block  
  availability_zone = "ap-south-1a"  
  tags = {
    Name = "Public_sub"
  }
}

resource "aws_subnet" "private_subnet_ec2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_ec2_cidr_block  
  availability_zone = "ap-south-1b"  
  tags = {
    Name = "EC2_subnet"
  }
}

resource "aws_subnet" "private_subnet_rds" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_rds_cidr_block  
  availability_zone = "ap-south-1c"
  tags = {
    Name = "RDS_subnet"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.pubrt_cidr
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "Public_rt"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet.id

tags = {
    Name = "NAT_GATEWAY"
  }
}

resource "aws_eip" "my_eip" {
  domain = "vpc"
}

resource "aws_route_table" "private_subnet_ec2_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "private_EC2_rt"
  }
}

#nat connection for ec2
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_subnet_ec2_route_table.id
  destination_cidr_block = var.pubrt_cidr
  nat_gateway_id         = aws_nat_gateway.my_nat_gateway.id
}

resource "aws_route_table_association" "private_subnet_ec2_association" {
  subnet_id      = aws_subnet.private_subnet_ec2.id
  route_table_id = aws_route_table.private_subnet_ec2_route_table.id
}