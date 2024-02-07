snowflake_authenticator = "JWT"
# snowflake_private_key   = "~/.ssh/snowflake_key"
snowflake_account = "lmjtmgu-kg24668"
snowflake_role    = "accountadmin"

warehouse_name    = "warehouse"
warehouse_comment = "warehouse"
warehouse_size    = "x-small"

database_name       = "database"
database_comment    = "development"
data_retention_days = 1

schema_name         = "schema"
schema_database     = "database"
schema_comment      = "database schema"
schema_is_transient = false
schema_is_managed   = false

table_name    = "table"
table_comment = "database table"


column_id = {
  name     = "id"
  type     = "int"
  nullable = true
}

column_name = {
  name     = "name"
  type     = "text"
  nullable = false
}

column_type = {
  name     = "type"
  type     = "text"
  nullable = false
}

column_extra = {
  name    = "extra"
  type    = "VARIANT"
  comment = "extra data"
}

user_name               = "user"
user_login_name         = "user"
user_comment            = "A user of snowflake."
user_password           = "User12user123!"
display_name            = "user"
email                   = "Agnija.Vjakse@gmail.com"
first_name              = "user"
last_name               = "user"
default_warehouse       = "warehouse"
default_secondary_roles = ["ALL"]
default_role            = "role1"


name    = "role1"
comment = "my_user role."


database_object_name = "database"
