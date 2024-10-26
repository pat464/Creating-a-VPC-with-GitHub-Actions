#Output for the SG
output "ec2_sg_id" {
  value = aws_security_group.S-G.id
}
output "alb_sg_id" {
  value = aws_security_group.ALB_SG.id
}
