resource "aws_lb" "ALB" {
  name               = "Application-Load-Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.subnets

  enable_deletion_protection = false
  tags = {
    Environment = "production"
  }
}
#Listener
resource "aws_lb_listener" "Listener_Rule" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Test_TG.arn
  }
}
#Target Group from ALB
resource "aws_lb_target_group" "Test_TG" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
#Target Group Attachment
resource "aws_lb_target_group_attachment" "Test_TG_Attach" {
  count = length(var.instances)
  target_group_arn = aws_lb_target_group.Test_TG.arn
  target_id        = var.instances[count.index]
  port             = 80
}