resource "aws_eip" "eip-for-nat-gateway1" {
  vpc = true
  tags = {
    name = "EIP1"
  }
}

resource "aws_eip" "eip-for-nat-gateway2" {
  vpc = true
  tags = {
    name = "EIP2"
  }
}