#VPC cidr_block
variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type = string
}
#Public Subnets cidr block
variable "subnets_cidr" {
  description = "subnets cidr block"
  type = list(string)
}
#Subnet Names
variable "subnet_names" {
  description = "subnet names"
  type = list(string)
  default = [ "PublicSubnet1", "PublicSubnet2" ]
}