snowflake_authenticator = "JWT"
# snowflake_private_key   = "~/.ssh/snowflake_key"
snowflake_account = "lmjtmgu-kg24668"
snowflake_role    = "accountadmin"

warehouse_name    = "my_warehouse"
warehouse_comment = "my_warehouse"
warehouse_size    = "x-small"

database_name       = "my_database"
database_comment    = "development"
data_retention_days = 1

schema_name         = "my_schema"
schema_database     = "my_database"
schema_comment      = "database schema"
schema_is_transient = false
schema_is_managed   = false

table_name    = "my_table"
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

user_name                    = "my_user"
user_login_name              = "my_user"
user_comment                 = "A user of snowflake."
user_password                = "User12user123!"
user_disabled                = false
user_display_name            = "my_user"
user_email                   = "Agnija.Vjakse@gmail.com"
user_first_name              = "my_user"
user_last_name               = "my_user"
user_default_warehouse       = "my_warehouse"
user_default_secondary_roles = ["ALL"]
user_default_role            = "role1"
user_must_change_password    = false

role_name    = "role1"
role_comment = "my_user role."


database_object_name   = "my_database"
role_on_account        = true
role_all_privileges    = true
role_with_grant_option = true
