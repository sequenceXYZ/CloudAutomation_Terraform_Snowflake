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
  description = "Name of the Snowflake warehouse"
  type        = string
}

variable "warehouse_comment" {
  description = "Comment for the Snowflake warehouse"
  type        = string
}

variable "warehouse_size" {
  description = "Size of the Snowflake warehouse"
  type        = string
}

variable "database_name" {
  description = "Name of the Snowflake database"
  type        = string
}

variable "database_comment" {
  description = "Comment for the Snowflake database"
  type        = string
}

variable "data_retention_days" {
  description = "Data retention time in days for the Snowflake database"
  type        = number
}

variable "schema_name" {
  description = "Name of the Snowflake schema"
  type        = string
}

variable "schema_database" {
  description = "Name of the Snowflake database for the schema"
  type        = string
}

variable "schema_comment" {
  description = "Comment for the Snowflake schema"
  type        = string
}

variable "schema_is_transient" {
  description = "Whether the Snowflake schema is transient"
  type        = bool
}

variable "schema_is_managed" {
  description = "Whether the Snowflake schema is managed"
  type        = bool
}

variable "table_name" {
  description = "Name of the Snowflake table"
  type        = string
}

variable "table_comment" {
  description = "Comment for the Snowflake table"
  type        = string
}

variable "column_id" {
  description = "Column definition for 'id'"
  type        = map(any)
  default = {
    name     = "id"
    type     = "int"
    nullable = true
  }
}

variable "column_name" {
  description = "Column definition for 'name'"
  type        = map(any)
  default = {
    name     = "name"
    type     = "text"
    nullable = false
  }
}

variable "column_type" {
  description = "Column definition for 'type'"
  type        = map(any)
  default = {
    name     = "type"
    type     = "text"
    nullable = false
  }
}

variable "column_extra" {
  description = "Column definition for 'extra'"
  type        = map(any)
  default = {
    name    = "extra"
    type    = "VARIANT"
    comment = "extra data"
  }
}


variable "user_name" {
  description = "Name of the Snowflake user"
  type        = string
}

variable "user_login_name" {
  description = "Login name of the Snowflake user"
  type        = string
}

variable "user_comment" {
  description = "Comment for the Snowflake user"
  type        = string
}

variable "user_password" {
  description = "Password for the Snowflake user"
  type        = string
}


variable "display_name" {
  description = "Display name for the Snowflake user"
  type        = string
}

variable "email" {
  description = "Email address for the Snowflake user"
  type        = string
}

variable "first_name" {
  description = "First name of the Snowflake user"
  type        = string
}

variable "last_name" {
  description = "Last name of the Snowflake user"
  type        = string
}

variable "default_warehouse" {
  description = "Default warehouse for the Snowflake user"
  type        = string
}

variable "default_secondary_roles" {
  description = "List of default secondary roles for the Snowflake user"
  type        = list(string)
}

variable "default_role" {
  description = "Default role for the Snowflake user"
  type        = string
}


variable "name" {
  description = "Name of the Snowflake role"
  type        = string
}

variable "comment" {
  description = "Comment for the Snowflake role"
  type        = string
}

variable "database_object_name" {
  description = "Name of the Snowflake database object for privilege grant"
  type        = string
}

variable "schema_full_name" {
  description = "Name of the Snowflake schema for privilege grant"
  type        = string
}
