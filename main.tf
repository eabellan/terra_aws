provider "aws" {
  
}

resource "aws_security_group" "my_sg" {
  name = "openallEdu"
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "MyEc2" {
  ami                    = "ami-07caf09b362be10b8"
  instance_type          = "t2.nano"
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "EduTest"
  }
}