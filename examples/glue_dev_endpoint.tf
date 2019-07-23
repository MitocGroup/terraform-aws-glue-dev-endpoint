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

module "glue-dev-endpoint" {
  source = "../"
  glue_endpoint_name                   = "test"
  glue_endpoint_role                   = ""   #same role as the crawler
  glue_endpoint_security_group_ids     = ""
  glue_endpoint_subnet_id              = ""
  glue_endpoint_public_keys            = ""
  glue_endpoint_number_of_dpus         = ""
  glue_endpoint_extra_python_libraries = ""
  glue_endpoint_extra_jars_libraries   = ""
  glue_endpoint_security_configuration = ""

  tags = {
    Type                 = "etl-test-job"
    Origin               = "leak"
    Source-Environment   = "dev"
    Source-Data          = "events"
    Update-Frequency     = "daily"
    Documentation        = "https://confluence.bgchtest.info/display/DTS/Curated+data+sets"
    Business-Owner       = "Robert Vadai"
    Cost-Center          = "11111"
    Classification-level = "2"
  }
}





