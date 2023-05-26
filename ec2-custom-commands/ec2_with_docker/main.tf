# ec2_with_docker/main.tf

variable "aws_region" {}

variable "instance_type" {}

variable "security_group_name" {}

variable "key_pair_name" {}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-xxxxxxxx"  # Replace with the desired Ubuntu AMI ID for your region
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  tags = {
    Name = "EC2 with Docker"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io
    docker run -d --name nginx -p 8080:80 nginx:latest
    EOF
}

resource "aws_security_group" "ec2_security_group" {
  name        = var.security_group_name
  description = "Security group for EC2 with Docker"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}
