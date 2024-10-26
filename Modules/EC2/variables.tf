#Variable for EC2 Security Group
variable "ec2_sg_id" {
  description = "Security Group for EC2"
  type = string
}
variable "Subnets" {
  description = "Subnets for the EC2"
  type = list(string)
}
#Create names for the EC2
variable "ec2_names" {
  description = "Names for the EC2"
  type = list(string)
  default = [ "Web01", "Web02" ]
}