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
glue_endpoint_public_key             = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDP8gurVsn9rz62IFL9XkIxzJXz4iccr82o6pb4bAHXOSTDabH4TTE7IngWCK6h9xfE2son5pyt8EN7JQczux6O42dVaAAkHtSrPO0Gn7A/4s9y/S6SZi7fV1vF5Pszvumpvnx8rB3UIpZSbljdR9fhVT1ctDpH9sZn3t4BF21xmZ4pEqsp84hmXrOiGS8+oVvRrAp6IxX9R5Lbcistf3fFvPD5Q9axzc+aBpouEme1f3XhPsV4lXeaUzM+9/uwOJU6uWhqfBezykQB/mjEnBcdMezSct3UxSwCqAFdjQJAB36zTAphh9Fy5fXz+NE+fdrJZiq5sUj1mtQTcjt3hdtp root@DESKTOP-ECSQPB1"
glue_endpoint_public_keys            = []
glue_endpoint_number_of_dpus         = 2
glue_endpoint_extra_python_libraries = ""
glue_endpoint_extra_jars_libraries   = ""
glue_endpoint_security_configuration = ""

##########
# custom #
##########
