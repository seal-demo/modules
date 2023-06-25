variable "jar_url" {
  description = "The URL of the JAR file to be deployed"
}

variable "instance_type" {
  description = "The type of EC2 instance to be launched"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the AMI to be used for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the EC2 instance"
}

variable "security_group_ids" {
  description = "The IDs of the security groups to associate with the EC2 instance"
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y java-1.8.0-openjdk
              wget ${var.jar_url}
              java -jar <jar-file-name>
              EOF
}
