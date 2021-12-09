# resource "aws_lb" "external" {
#   name               = "ExternalLB"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.odoo.id]
#   subnets            = [aws_subnet.public.id]
# }

# resource "aws_lb_target_group" "external" {
#   name     = "ExternalLB-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.odoo-base.id
# }

# resource "aws_lb_target_group_attachment" "external" {
#   target_group_arn = aws_lb_target_group.external.arn
#   target_id        = aws_instance.odoo-server.id
#   port             = 8069
#   depends_on = [
#     aws_instance.odoo-server,
#   ]
# }

# resource "aws_lb_listener" "external" {
#   load_balancer_arn = aws_lb.external.arn
#   port              = 8069
#   protocol          = "HTTP"
#   default_action {
#     target_group_arn = aws_lb_target_group.external.arn
#     type             = "forward"
#   }
# }