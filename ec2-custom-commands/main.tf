# main.tf

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "security_group_name" {
  description = "Name for the security group"
  default     = "nginx-security-group"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  default     = "my-key-pair"
}

module "ec2_with_docker" {
  source = "path/to/ec2_with_docker"    #NOTE --> Please change

  aws_region          = var.aws_region
  instance_type       = var.instance_type
  security_group_name = var.security_group_name
  key_pair_name       = var.key_pair_name
}
