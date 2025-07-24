resource "aws_vpc" "aws_west_vpc" {
  # checkov:skip=CKV2_AWS_12: Demo Project
  # checkov:skip=CKV2_AWS_11: Demo Project
  cidr_block = "10.0.0.0/16"
  tags = {
    Name ="aws_west_vpc"
  }
}

resource "aws_subnet" "us_west_2a_public_subnet" {
  vpc_id = aws_vpc.aws_west_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "us_west_2a_public_subnet"
}
}

resource "aws_subnet" "us_west_2b_public_subnet" {
  vpc_id = aws_vpc.aws_west_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "us_west_2b_public_subnet"
}
}

resource "aws_internet_gateway" "us_west_gw" {
  vpc_id = aws_vpc.aws_west_vpc.id
  tags = {
    Name = "us_west_gw"
  }
}

resource "aws_route_table" "us_west_rt" {
  vpc_id = aws_vpc.aws_west_vpc.id
  route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.us_west_gw.id
  }
  tags = {
    Name = "us_west_rt"
  }
}

resource "aws_route_table_association" "us_west_2a_association" {
  subnet_id = aws_subnet.us_west_2a_public_subnet.id
  route_table_id = aws_route_table.us_west_rt.id
}

resource "aws_route_table_association" "us_west_2b_association" {
  subnet_id = aws_subnet.us_west_2b_public_subnet.id
  route_table_id = aws_route_table.us_west_rt.id
}

