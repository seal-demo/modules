
# Module `demo`

Provider Requirements:
* **aws:** (any version)

## Input Variables
* `ami_id` (default `"ami-0c55b159cbfafe1f0"`): The ID of the AMI to be used for the EC2 instance
* `instance_type` (default `"t2.micro"`): The type of EC2 instance to be launched
* `jar_url` (required): The URL of the JAR file to be deployed
* `security_group_ids` (required): The IDs of the security groups to associate with the EC2 instance
* `subnet_id` (required): The ID of the subnet in which to launch the EC2 instance

## Managed Resources
* `aws_instance.example` from `aws`

