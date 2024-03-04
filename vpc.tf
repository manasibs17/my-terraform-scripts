

provider "aws" {
  region  = var.aws_region

}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "zoeencloud"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone_public_subnet
    

  tags = {
    Name = "Public-01"
  }
}

resource "aws_subnet" "private_subnet_ec2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_ec2_cidr
  availability_zone = var.availability_zone_private_subnet_ec2

  tags = {
    Name = "Private-01"
  }
}

resource "aws_subnet" "private_subnet_rds" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_rds_cidr
  availability_zone = var.availability_zone_private_subnet_rds
    
  tags = {
    Name = "Private-02"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Zoeen IGW"
  }
}

resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {        
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
   
   tags = {
     Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}

resource "aws_eip" "my_eip" {
  domain = "vpc"

  tags = {
    Name = "NAT IP"
  }
}


resource "aws_nat_gateway" "my_nat_gateway"{
  allocation_id = aws_eip.my_eip.id
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "NAT Gateway"
  }
}

resource "aws_route_table" "private_subnet_route_table"{
  vpc_id = aws_vpc.my_vpc.id
    
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my_nat_gateway.id
  }

  tags = {
    Name = "Private Route Table ec2"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id = aws_subnet.private_subnet_ec2.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}









