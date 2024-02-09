# create rsource warehouse
resource "snowflake_warehouse" "example_warehouse" {
  name                = var.warehouse_name
  warehouse_size      = var.warehouse_size
  auto_suspend        = var.auto_suspend
  auto_resume         = var.auto_resume
  initially_suspended = var.initially_suspended
}

# create resource database
resource "snowflake_database" "example_database" {
  name = var.database_name
}

# create resource schema
resource "snowflake_schema" "example_schema" {
  name     = var.schema_name
  database = snowflake_database.example_database.name
}

# create resource table
resource "snowflake_table" "example_table" {
  database = snowflake_database.example_database.name
  schema   = snowflake_schema.example_schema.name
  name     = var.table_name
  column {
    name = "ID"
    type = "NUMBER"
  }
  column {
    name = "Name"
    type = "STRING"
  }
  column {
    name = "CreatedAt"
    type = "TIMESTAMP_LTZ"
  }
  column {
    name = "IsActive"
    type = "BOOLEAN"
  }
}

# create resource role
resource "snowflake_role" "example_role" {
  name = var.role_name
}

# grant database access to new user
resource "snowflake_database_grant" "example_database_grant" {
  database_name = snowflake_database.example_database.name
  privilege     = "USAGE"
  roles         = [var.user_role]
}

# grant schema access to new user
resource "snowflake_schema_grant" "example_schema_grant" {
  schema_name   = snowflake_schema.example_schema.name
  database_name = snowflake_database.example_database.name
  privilege     = "USAGE"
  roles         = [var.user_role]
}

# grant warehouse access to new user
resource "snowflake_warehouse_grant" "example_warehouse_grant" {
  warehouse_name = snowflake_warehouse.example_warehouse.name
  privilege      = "MODIFY"
  roles          = [var.user_role]
}

# grant table access to new user
resource "snowflake_table_grant" "example_table_grant" {
  table_name    = snowflake_table.example_table.name
  schema_name   = snowflake_schema.example_schema.name
  database_name = snowflake_database.example_database.name
  privilege     = "SELECT"
  roles         = [var.user_role]
}

# create resource new user
resource "snowflake_user" "new_user" {
  name     = var.user_name
  password = var.user_password
}

# grant role to new user
resource "snowflake_role_grants" "user_role_grants" {
  role_name = var.user_role

  users = [
    snowflake_user.new_user.name,
  ]
# Explicitly specify dependencies to ensure this resource is executed last
  depends_on = [
    snowflake_warehouse.example_warehouse,
    snowflake_database.example_database,
    snowflake_schema.example_schema,
    snowflake_table.example_table,
    snowflake_role.example_role,
    snowflake_database_grant.example_database_grant,
    snowflake_schema_grant.example_schema_grant,
    snowflake_warehouse_grant.example_warehouse_grant,
    snowflake_table_grant.example_table_grant,
    snowflake_user.new_user,
  ]
}
