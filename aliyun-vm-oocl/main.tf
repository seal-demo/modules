provider "alicloud" {
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
  region     = "REGION"
}

# 创建资源组
resource "alicloud_resource_group" "example" {
  name = "example-resource-group"
}

# 创建虚拟网络
resource "alicloud_vpc" "example" {
  name             = "example-vpc"
  cidr_block       = "10.0.0.0/8"
  resource_group_id = alicloud_resource_group.example.id
}

# 创建子网
resource "alicloud_subnet" "example" {
  name              = "example-subnet"
  cidr_block        = "10.0.0.0/16"
  vpc_id            = alicloud_vpc.example.id
  resource_group_id = alicloud_resource_group.example.id
}

# 创建安全组
resource "alicloud_security_group" "example" {
  name        = "example-security-group"
  description = "example security group"
  vpc_id      = alicloud_vpc.example.id

  ingress {
    # 允许SSH访问
    protocol    = "tcp"
    port_range  = "22/22"
    cidr_ip     = "0.0.0.0/0"
  }

  egress {
    # 允许所有出站流量
    protocol    = "all"
    cidr_ip     = "0.0.0.0/0"
  }
}

# 创建虚拟机
resource "alicloud_instance" "example" {
  instance_name            = "example-instance"
  image_id                 = "ubuntu_18_04_64_20G_alibase_20200220.vhd"
  instance_type            = "ecs.t5-lc1m1.small"
  security_groups          = [alicloud_security_group.example.id]
  vswitch_id               = alicloud_subnet.example.id
  internet_charge_type     = "PayByTraffic"
  internet_max_bandwidth_out = 5
  system_disk_category     = "cloud_efficiency"
  system_disk_size         = 60
  resource_group_id        = alicloud_resource_group.example.id
}