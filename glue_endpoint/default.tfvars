# Specify default values for variables defined in variables.tf

############
# provider #
############
account_id                 = "123456789012"
region                     = "us-east-1"

#############
# top level #
#############
glue_endpoint_name                   = "terraform-endpoint"
glue_endpoint_role_name              = "ServiceRoleForGlue"
glue_endpoint_security_group_ids     = []
glue_endpoint_subnet_id              = ""
glue_endpoint_public_key             = ""
glue_endpoint_public_keys            = []
glue_endpoint_number_of_dpus         = 2
glue_endpoint_extra_python_libraries = ""
glue_endpoint_extra_jars_libraries   = ""
glue_endpoint_security_configuration = ""

##########
# custom #
##########
