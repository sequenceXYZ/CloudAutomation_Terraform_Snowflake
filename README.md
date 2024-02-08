## CloudAutomation_Terraform_Snowflake
### Objective: Leverage Terraform to automate the provisioning of Snowflake resources, ensuring adherence to Infrastructure as Code (IaC) best practices.
## Task Description:
- As part of this task, you are to create a series of Terraform scripts/modules that will provision the following Snowflake resources:
- Warehouse: A compute warehouse suitable for processing queries and data manipulation tasks.
- Database: A dedicated database to house various schemas and tables.
- Schema: Within the database, create a specific schema intended for the tables.
- Table: A table within the schema that includes at least four columns of varying data types.
- Role: A role with permissions that allow for database, schema, and warehouse access, and select privileges on the table.

## Prerequisites
### Install Terraform
https://developer.hashicorp.com/terraform/install

### Snowflake account 
https://signup.snowflake.com/
- Create the User in Snowflake

### Getting Started

### Create a Service User for Terraform
- Create an RSA key for Authentication

### Setup Terraform Authentication
- Add Account Information to Environment

### Declare resouces
- providers.tf
- main.tf
- variables.tf
- terraform.tfvars

### Run Running Terraform
- terraform init
- terraform plan
- terraform apply

  
