# create snowflake warehouse
resource "snowflake_warehouse" "warehouse" {
  name           = var.warehouse_name
  comment        = var.warehouse_comment
  warehouse_size = var.warehouse_size
}

# create snowflake Database
resource "snowflake_database" "database" {
  name                        = var.database_name
  comment                     = var.database_comment
  data_retention_time_in_days = var.data_retention_days
}

# create database schema 
resource "snowflake_schema" "schema" {
  name     = var.schema_name
  database = snowflake_database.database.name
  comment  = var.schema_comment

  is_transient        = var.schema_is_transient
  is_managed          = var.schema_is_managed
  data_retention_days = var.data_retention_days
}

# create a table in the schema and database
resource "snowflake_table" "table" {
  database = snowflake_database.database.name
  schema   = snowflake_schema.schema.name
  name     = var.table_name
  comment  = var.table_comment


  column {
    name     = var.column_id["name"]
    type     = var.column_id["type"]
    nullable = var.column_id["nullable"]
  }

  column {
    name     = var.column_name["name"]
    type     = var.column_name["type"]
    nullable = var.column_name["nullable"]
  }

  column {
    name     = var.column_type["name"]
    type     = var.column_type["type"]
    nullable = var.column_type["nullable"]
  }

  column {
    name    = var.column_extra["name"]
    type    = var.column_extra["type"]
    comment = var.column_extra["comment"]
  }
}

# create new user
resource "snowflake_user" "user" {
  name                    = var.user_name
  login_name              = var.user_login_name
  comment                 = var.user_comment
  password                = var.user_password
  disabled                = false
  display_name            = var.display_name
  email                   = var.email
  first_name              = var.first_name
  last_name               = var.last_name
  default_warehouse       = var.default_warehouse
  default_secondary_roles = var.default_secondary_roles
  default_role            = var.default_role
  must_change_password    = false
}

# create role for user
resource "snowflake_role" "role" {
  name    = var.name
  comment = var.comment
}

resource "snowflake_role_grants" "grants" {
  role_name = var.name
  roles     = [snowflake_role.role.name]
  users     = [snowflake_user.user.name]
}

# list of privileges
resource "snowflake_grant_privileges_to_role" "g1" {
  privileges = ["MODIFY", "USAGE"]
  role_name  = var.name
  on_account = true
}

# all privileges + grant option
resource "snowflake_grant_privileges_to_role" "g2" {
  role_name         = var.name
  on_account        = true
  all_privileges    = true
  with_grant_option = true
}

# privileges on database
resource "snowflake_grant_privileges_to_role" "g3" {
  privileges = ["CREATE", "MONITOR"]
  role_name  = var.name
  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_object_name
  }
  depends_on = [snowflake_role.role, snowflake_user.user,
    snowflake_database.database, snowflake_schema.schema,
  snowflake_table.table]
  }
}

# privileges on schema
resource "snowflake_grant_privileges_to_role" "g5" {
  privileges = ["MODIFY", "CREATE TABLE"]
  role_name  = var.name
  on_schema {
    schema_name = "\"my_database\".\"my_schema\""
  }
}
