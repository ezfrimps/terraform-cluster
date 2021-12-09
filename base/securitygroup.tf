resource "aws_security_group" "odoo" {
  name        = "Allow odoo"
  description = "Allow odoo port traffic"
  vpc_id      = aws_vpc.odoo-base.id

  ingress {
    from_port   = 8069
    to_port     = 8069
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "odoo-base"
  }
}

resource "aws_security_group" "postgres" {
  name        = "Allow postgres"
  description = "Allow postgres port traffic"
  vpc_id      = aws_vpc.odoo-base.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.odoo.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "odoo-base"
  }
}