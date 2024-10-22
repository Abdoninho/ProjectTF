resource "aws_lb" "main" {
  name               = "nginx-load-balancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnets

  security_groups = [
    var.lb_security_group
  ]
}

resource "aws_lb_target_group" "nginx" {
  name     = "nginx-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }
}

resource "aws_lb_target_group_attachment" "nginx" {
  count            = length(var.target_instances)
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = var.target_instances[count.index]
  port             = 80
}
output "dns_name" {
  value = aws_lb.main.dns_name
}