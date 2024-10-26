#VPC
resource "aws_vpc" "Test_Env" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "Test_Env"
  }
}
#Creating 2 Public Subnets
resource "aws_subnet" "Public_Subnets"  {
  count = length(var.subnets_cidr)
  vpc_id = aws_vpc.Test_Env.id
  cidr_block = var.subnets_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_names[count.index]
  }
}
#IGW
resource "aws_internet_gateway" "Test_Env_IGW" {
  vpc_id = aws_vpc.Test_Env.id
  tags = {
    Name = "Test_Env_IGW"
  }
}
#Route Table
resource "aws_route_table" "Test_Env_RT" {
  vpc_id = aws_vpc.Test_Env.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Test_Env_IGW.id
  }
  tags = {
    Name = "Test_Env_RT"
  }
}
#Route Table Association
resource "aws_route_table_association" "PublicSubnet1" {
  count = length(var.subnets_cidr)
  subnet_id = aws_subnet.Public_Subnets[count.index].id
  route_table_id = aws_route_table.Test_Env_RT.id
}