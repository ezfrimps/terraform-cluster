output "lb_dns_name" {
  value = aws_instance.odoo-1.public_dns
}
