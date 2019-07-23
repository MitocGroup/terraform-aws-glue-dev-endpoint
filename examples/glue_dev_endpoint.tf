/* glue_database.tf
 Glue database / table / crawler implementation
module "dp_dl_prod_glue_projectx_00" {
  source         = "../../" 
*/

/* main.tf
provider "aws" {
  region = "eu-west-1"
}

terraform {
  required_version = "~> 0.11.11"
}  
*/
/*
module "glue-dev-endpoint" {
  source = "../"
  glue_endpoint_name   = ""
  glue_endpoint_role {
  # Example IAM role
  module "glue_role" {
  source = "../"
  name   = "dp-dl-test-role"

  }
  glue_endpoint_security_group_ids =
  glue_endpoint_subnet_id =
  glue_endpoint_public_keys =
  glue_endpoint_number_of_dpus =
  glue_endpoint_extra_python_libraries =
  glue_endpoint_extra_jars_libraries =
  glue_endpoint_security_configuration =


}


*/


