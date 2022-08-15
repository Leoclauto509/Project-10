resource "aws_nat_gateway" "nat-gateway1" {
  allocation_id = aws_eip.eip-for-nat-gateway1.id
  subnet_id     = aws_subnet.pub_subnet1.id

  tags = {
    Name = "NAT Gateway public Subnet1"
  }
}

resource "aws_nat_gateway" "nat-gateway2" {
  allocation_id = aws_eip.eip-for-nat-gateway2.id
  subnet_id     = aws_subnet.pub_subnet2.id

  tags = {
    Name = "NAT Gateway public Subnet2"
  }
}

resource "aws_route_table" "private_route_table-1" {
  vpc_id = aws_vpc.Group10_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway1.id
  }

  tags = {
    Name = "private route table 1"
  }

}


# Associate Private Subnet 1 with Private Route Table 1
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private_route_table-1.id
}

# Associate Private Subnet 3 with Private Route table 1
resource "aws_route_table_association" "private-subnet-3-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private_route_table-1.id
}



# Associate Private Subnet 2 with Private Route Table 2
resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private_route_table-2.id
}

# Associate Private Subnet 4 with Private Route table 2
resource "aws_route_table_association" "private-subnet-4-route-table-association" {
  subnet_id      = aws_subnet.private-subnet-4.id
  route_table_id = aws_route_table.private_route_table-2.id
}

