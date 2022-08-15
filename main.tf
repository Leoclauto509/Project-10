


resource "aws_route_table_association" "pub-subnet-1-route-table" {
  subnet_id      = aws_subnet.pub_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "pub-subnet-2-route-table" {
  subnet_id      = aws_subnet.pub_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table-2" {
  vpc_id = aws_vpc.Group10_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway2.id
  }

  tags = {
    Name = "private route table 2"
  }

}









