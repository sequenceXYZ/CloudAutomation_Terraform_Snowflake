variable "snowflake_authenticator" {
  description = "Snowflake authenticator method"
  type        = string
}

variable "snowflake_private_key" {
  description = "Snowflake private key path"
  type        = string
}

variable "snowflake_account" {
  description = "Snowflake account id"
  type        = string
}
variable "snowflake_role" {
  description = "Snowflake account user role"
  type        = string
}


variable "warehouse_name" {
  description = "The name of the Snowflake warehouse"
  type        = string
}

variable "warehouse_size" {
  description = "Size of the Snowflake warehouse"
  type        = string
}

variable "auto_suspend" {
  description = "Number of seconds of inactivity after which the warehouse is automatically suspended"
  type        = number
}

variable "auto_resume" {
  description = "Specifies whether the warehouse should be automatically resumed when a query is submitted"
  type        = bool
}

variable "initially_suspended" {
  description = "Specifies whether the warehouse is created in the 'Suspended' state"
  type        = bool
}

variable "database_name" {
  description = "The name of the Snowflake database"
  type        = string
}

variable "schema_name" {
  description = "The name of the Snowflake schema"
  type        = string
}

variable "table_name" {
  description = "The name of the Snowflake table"
  type        = string
}

variable "role_name" {
  description = "The name of the Snowflake role"
  type        = string}

variable "user_name" {
  description = "The name of the new Snowflake user"
  type        = string
}

variable "user_password" {
  description = "The password for the new Snowflake user"
  type        = string
}

variable "user_role" {
  description = "The role to be assigned to the new Snowflake user"
  type        = string
}

