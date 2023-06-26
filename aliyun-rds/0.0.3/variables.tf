#################
# Rds Instance
#################
variable "creation" {
  default = "Rds"
}

variable "create_instance" {
  description = "Whether to create RDS. If false, you can use a existing RDS instance by setting `existing_instance_id`."
  type        = bool
  default     = true
}

variable "engine_version" {
  description = "RDS Database version. Value options can refer to the latest docs [CreateDBInstance](https://www.alibabacloud.com/help/doc-detail/26228.htm) `EngineVersion`"
  type        = string
  default     = "8.0"
}

variable "instance_name" {
  description = "The name of DB instance. A random name prefixed with 'terraform-rds-' will be set if it is empty."
  type        = string
  default     = "seal-demo"
}

variable "instance_type" {
  description = "DB Instance type, for example: mysql.n1.micro.1. full list is : https://www.alibabacloud.com/help/zh/doc-detail/26312.htm."
  type        = string
  default     = "rds.mysql.t1.small"
}

variable "instance_storage_type" {
  description = "The storage type of DB instance. Value options: cloud_essd, cloud_essd2, cloud_essd3, local_ssd, depended on instance type."
  type        = string
  default     = "cloud_essd"
}

variable "instance_storage" {
  description = "The storage capacity of the instance. Unit: GB. Valid values: 20~6000. The storage capacity increases at increments of 5 GB. For more information, see [Instance Types](https://www.alibabacloud.com/help/doc-detail/26312.htm)."
  type        = number
  default     = 10
}

variable "instance_charge_type" {
  description = "The instance charge type. Valid values: Prepaid and Postpaid. Default to Postpaid."
  type        = string
  default     = "Postpaid"
}

#################
# Rds Connection
#################
variable "allocate_public_connection" {
  description = "Whether to allocate public connection for a RDS instance. If true, the connection_prefix can not be empty."
  type        = bool
  default     = true
}

variable "connection_prefix" {
  description = "Prefix of an Internet connection string. A random name prefixed with 'tf-rds-' will be set if it is empty."
  type        = string
  default     = ""
}

variable "port" {
  description = " Internet connection port. Valid value: [3001-3999]. Default to 3306."
  type        = number
  default     = 3306
}

#################
# Rds Database
#################
variable "create_database" {
  description = "Whether to create multiple databases. If true, the `databases` should not be empty."
  type        = bool
  default     = true
}

variable "databases" {
  description = "A list mapping used to add multiple databases. Each item supports keys: name, character_set and description. It should be set when create_database = true."
  type        = list(map(string))
  default     = [
    {
      name          = "demo"
      character_set = "utf8"
      description   = "demo"
    },
  ]
}

#################
# Rds Database account
#################
variable "create_account" {
  description = "Whether to create a new account. If true, the `account_name` should not be empty."
  type        = bool
  default     = true
}

variable "account_name" {
  description = "Name of a new database account. It should be set when create_account = true."
  type        = string
  default     = "mysql"
}

variable "password" {
  description = "Operation database account password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  type        = string
  default     = "Seal@123"
}

variable "type" {
  description = "Privilege type of account. Normal: Common privilege. Super: High privilege.Default to Normal."
  type        = string
  default     = "Normal"
}

variable "privilege" {
  description = "The privilege of one account access database."
  type        = string
  default     = "ReadWrite"
}
