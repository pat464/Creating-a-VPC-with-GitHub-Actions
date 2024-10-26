#VPC cidr_block
variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}
variable "subnets_cidr" {
  description = "subnets cidr block"
  type        = list(string)
}