resource "aws_security_group" "my_sg" {
  name        = "my_security_group"
  description = "Allow incoming traffic on port 8000"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_id" {
  value = aws_security_group.my_sg.id
}
