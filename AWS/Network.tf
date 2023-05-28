# Create a VPC
resource "aws_vpc" "Test_VPC" {
  cidr_block = var.cidr_block
  tags = {
    Name = "Test_VPC"
  }
}
# create subnet

resource "aws_subnet" "Test_sbnt1" {
  vpc_id     = aws_vpc.Test_VPC.id
  cidr_block = var.cidr_block_sbnt
  availability_zone_id = var.availability_zone

  tags = {
    Name = "Test_sbnt1"
  }
}

#create internet gateway for vpc
resource "aws_internet_gateway" "Test_gw" {
  vpc_id = aws_vpc.Test_VPC.id

}

#create route
resource "aws_route_table" "Test_RT" {
  vpc_id = aws_vpc.Test_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Test_gw.id
  }
  tags = {
    Name = "Test_RT"
  }
}

#routetable associate

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Test_sbnt1.id
  route_table_id = aws_route_table.Test_RT.id
}
