variable "alb_sg_id" {
  description = "Security Group ID for ALB"
  type = string
}
variable "subnets" {
  description = "subnets for ALB"
  type = list(string)
}
variable "vpc_id" {
  description = "vpc_id for ALB"
  type = string
}
variable "instances" {
  description = "instance id for target group attachment"
  type = list(string)
}