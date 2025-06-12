resource "aws_security_group" "sg1" {
  name        = "sg1"
  description = "Allow http"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "allow httpd"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.sg2.id]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }

  tags = {
    env                  = "Dev"
    created_by_terraform = "yes"
  }
}


resource "aws_security_group" "sg2" {
  name        = "sg2"
  description = "Allow http and https"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }

  tags = {
    env                  = "Dev"
    created_by_terraform = "yes"
  }
}
