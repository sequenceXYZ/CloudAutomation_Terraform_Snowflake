resource "snowflake_warehouse" "example_warehouse" {
  name                = var.warehouse_name
  warehouse_size      = var.warehouse_size
  auto_suspend        = var.auto_suspend
  auto_resume         = var.auto_resume
  initially_suspended = var.initially_suspended
}

resource "snowflake_database" "example_database" {
  name = var.database_name
}

resource "snowflake_schema" "example_schema" {
  name     = var.schema_name
  database = snowflake_database.example_database.name
}

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

resource "snowflake_role" "example_role" {
  name = var.role_name
}

resource "snowflake_database_grant" "example_database_grant" {
  database_name = snowflake_database.example_database.name
  privilege     = "USAGE"
  roles         = [snowflake_role.example_role.name]
}

resource "snowflake_schema_grant" "example_schema_grant" {
  schema_name   = snowflake_schema.example_schema.name
  database_name = snowflake_database.example_database.name
  privilege     = "USAGE"
  roles         = [snowflake_role.example_role.name]
}

resource "snowflake_warehouse_grant" "example_warehouse_grant" {
  warehouse_name = snowflake_warehouse.example_warehouse.name
  privilege      = "USAGE"
  roles          = [snowflake_role.example_role.name]
}

resource "snowflake_table_grant" "example_table_grant" {
  table_name    = snowflake_table.example_table.name
  schema_name   = snowflake_schema.example_schema.name
  database_name = snowflake_database.example_database.name
  privilege     = "SELECT"
  roles         = [snowflake_role.example_role.name]
}
