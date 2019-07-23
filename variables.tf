# Define list of variables to be used in main.tf

variable "aws_region" {
  description = "This is the AWS region."
  default     = "us-east-1"
}

variable "glue_endpoint_name" {
  description = "The name to be assigned to the new DevEndpoint."
  default     = "my_dev_endpoint"
}

variable "glue_endpoint_role" {
  description = "The IAM role for the DevEndpoint."
  default     = "arn:aws:iam::111111111111:role/my_role"
}

variable "glue_endpoint_security_group_ids" {
  type        = list(string)
  description = "Security group IDs for the security groups to be used by the new DevEndpoint."
  default     = []
}


variable "glue_endpoint_subnet_id" {
  description = "The subnet ID for the new DevEndpoint to use."
  default     = ""
}

variable "glue_endpoint_public_keys" {
  type        = list(string)
  description = "A list of public keys to be used by the DevEndpoints for authentication. The use of this attribute is preferred over a single public key because the public keys allow you to have a different private key per client."
  default     = []
}


variable "glue_endpoint_number_of_dpus" {
  description = "The number of AWS Glue Data Processing Units (DPUs) to allocate to this DevEndpoint."
  default     = "2"
}

variable "glue_endpoint_extra_python_libraries" {
  description = "Path(s) to one or more Python libraries in an S3 bucket that should be loaded in your DevEndpoint. Multiple values must be complete paths separated by a comma."
  default     = ""
}

variable "glue_endpoint_extra_jars_libraries" {
  description = "Path to one or more Java Jars in an S3 bucket that should be loaded in your DevEndpoint."
  default     = ""
}

variable "glue_endpoint_security_configuration" {
  description = "The name of the SecurityConfiguration structure to be used with this DevEndpoint."
  default     = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
