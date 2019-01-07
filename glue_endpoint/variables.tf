# Define list of variables to be used in main.tf

############
# provider #
############
variable "account_id" {
  description = "Allowed AWS account ID, to prevent you from mistakenly using an incorrect one (and potentially end up destroying a live environment)."
}

variable "region" {
  description = "This is the AWS region."
}

#############
# top level #
#############
variable "glue_endpoint_name" {
  description = "The name to be assigned to the new DevEndpoint."
}

variable "glue_endpoint_role_name" {
  description = "The IAM role for the DevEndpoint."
}

variable "glue_endpoint_security_group_ids" {
  type        = "list"
  description = "Security group IDs for the security groups to be used by the new DevEndpoint."
}

variable "glue_endpoint_subnet_id" {
  description = "The subnet ID for the new DevEndpoint to use."
}

variable "glue_endpoint_public_key" {
  description = "The public key to be used by this DevEndpoint for authentication. This attribute is provided for backward compatibility, as the recommended attribute to use is public keys."
}

variable "glue_endpoint_public_keys" {
  type        = "list"
  description = "A list of public keys to be used by the DevEndpoints for authentication. The use of this attribute is preferred over a single public key because the public keys allow you to have a different private key per client."
}

variable "glue_endpoint_number_of_dpus" {
  description = "The number of AWS Glue Data Processing Units (DPUs) to allocate to this DevEndpoint."
}

variable "glue_endpoint_extra_python_libraries" {
  description = "Path(s) to one or more Python libraries in an S3 bucket that should be loaded in your DevEndpoint. Multiple values must be complete paths separated by a comma."
}

variable "glue_endpoint_extra_jars_libraries" {
  description = "Path to one or more Java Jars in an S3 bucket that should be loaded in your DevEndpoint."
}

variable "glue_endpoint_security_configuration" {
  description = "The name of the SecurityConfiguration structure to be used with this DevEndpoint."
}

variable "command" {
  description = "The terraform command."
  default = ""
}

