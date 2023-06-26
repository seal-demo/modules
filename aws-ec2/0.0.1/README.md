
# Module `aws-ec2`

Provider Requirements:
* **aws:** (any version)

## Input Variables
* `ami` (default `"ami-0c55b159cbfafe1f0"`): AMI ID
* `instance_type` (default `"t2.micro"`): EC2 instance type
* `security_group_ids` (required): List of security group IDs
* `subnet_id` (required): Subnet ID

## Output Values
* `public_ip`

## Managed Resources
* `aws_instance.ec2` from `aws`

