variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "security_group_ids" {
  description = "List of security group IDs"
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "EC2 Instance"
  }
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}
