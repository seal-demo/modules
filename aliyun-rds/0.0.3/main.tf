data "alicloud_zones" "default" {
  available_resource_creation = var.creation
}

resource "alicloud_vpc" "default" {
  vpc_name       = var.instance_name
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = data.alicloud_zones.default.zones[0].id
  vswitch_name = var.instance_name
}

resource "alicloud_db_instance" "this" {
  count                      = var.create_instance ? 1 : 0
  engine                     = "MySQL"
  engine_version             = var.engine_version
  instance_name              = var.instance_name
  instance_type              = var.instance_type
  instance_storage           = var.instance_storage
  vswitch_id                 = alicloud_vswitch.default.id
}

resource "alicloud_db_connection" "db_connection" {
  count             = local.create_more_resources && var.allocate_public_connection ? 1 : 0
  instance_id       = local.this_instance_id
  connection_prefix = var.connection_prefix
  port              = var.port
}

resource "alicloud_db_database" "default" {
  instance_id = alicloud_db_instance.this.id
  name        = var.db_name
}