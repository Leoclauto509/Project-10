#How to create a 3 tier network multi AZ, with a VPC, 2 Public subets, 2app tier and 2 Data-Base tier 

# create VPC
resource "aws_vpc" "Group10_vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "group 10 VPC"
  }
}

# create Public Subnet 1
resource "aws_subnet" "pub_subnet1" {
  vpc_id                  = aws_vpc.Group10_vpc.id
  cidr_block              = var.public-subnet-1-cidr
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true #means that any ec2 that being run will be assign a public IP address

  tags = {
    Name = "Public Subnet 1"
  }
}

# create Public Subnet 2
resource "aws_subnet" "pub_subnet2" {
  vpc_id                  = aws_vpc.Group10_vpc.id
  cidr_block              = var.public-subnet-2-cidr
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true #means that any ec2 that being run will be assign a public IP address

  tags = {
    Name = "Public Subnet 2"
  }
}


# Associate Public Subnet 1 to Public Route Table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.pub_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate Public Subnet 2 to Public Route Table
resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.pub_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

# create Private Subnet 1 app tier
resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.Group10_vpc.id
  cidr_block              = var.private-subnet-1-cidr
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 1 | App Tier"
  }
}

# create Private Subnet 2 app tier
resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.Group10_vpc.id
  cidr_block              = var.private-subnet-2-cidr
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 2 | App Tier"
  }
}

# create Private Subnet 3 Data tier
resource "aws_subnet" "private-subnet-3" {
  vpc_id                  = aws_vpc.Group10_vpc.id
  cidr_block              = var.private-subnet-3-cidr
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 3 | Data Tier"
  }
}

# create Private Subnet 4 Data tier
resource "aws_subnet" "private-subnet-4" {
  vpc_id                  = aws_vpc.Group10_vpc.id
  cidr_block              = var.private-subnet-4-cidr
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 4 | Data Tier"
  }
}


