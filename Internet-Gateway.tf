# Create Internet Gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.Group10_vpc.id

  tags = {
    Name = "New internet GW"
  }
}

# Create Route Table and Add Public Route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.Group10_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }

}