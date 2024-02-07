terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "= 0.73.0"
    }
  }
}

provider "snowflake" {
  authenticator = var.snowflake_authenticator
  # private_key   = var.snowflake_private_key
  account = var.snowflake_account
  role    = var.snowflake_role
}
