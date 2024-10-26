#VPC ID
output "vpc_id" {
  value = aws_vpc.Test_Env.id
}
#Public Subnet ID's
output "subnets_ids" {
  value = aws_subnet.Public_Subnets[*].id
}