resource "aws_db_instance" "postgres" {
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "12"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "odoo"
  username               = "odoo"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.postgres.id]
  db_subnet_group_name   = aws_db_subnet_group.postgres.id
}

resource "aws_db_subnet_group" "postgres" {
  name       = "odoo-postgres"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  tags = {
    Name = "odoo-postgres"
  }
}