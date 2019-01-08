# aws_glue_dev_endpoint

Provides a Glue Dev Endpoint resource.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|aws_region|This is the AWS region.|string|us-east-1|Yes|
|glue_endpoint_name|The name to be assigned to the new DevEndpoint.|string|my_dev_endpoint|Yes|
|glue_endpoint_role|The IAM role for the DevEndpoint.|string|arn:aws:iam::111111111111:role/my_role|Yes|
|glue_endpoint_security_group_ids|Security group IDs for the security groups to be used by the new DevEndpoint.|list|[]|No|
|glue_endpoint_subnet_id|The subnet ID for the new DevEndpoint to use.|string||No|
|glue_endpoint_public_key|The public key to be used by this DevEndpoint for authentication. This attribute is provided for backward compatibility, as the recommended attribute to use is public keys.|string||No|
|glue_endpoint_public_keys|A list of public keys to be used by the DevEndpoints for authentication. The use of this attribute is preferred over a single public key because the public keys allow you to have a different private key per client.|list|[]|No|
|glue_endpoint_number_of_dpus|The number of AWS Glue Data Processing Units (DPUs) to allocate to this DevEndpoint.|string||No|
|glue_endpoint_extra_python_libraries|Path(s) to one or more Python libraries in an S3 bucket that should be loaded in your DevEndpoint. Multiple values must be complete paths separated by a comma.|string||No|
|glue_endpoint_extra_jars_libraries|Path to one or more Java Jars in an S3 bucket that should be loaded in your DevEndpoint.|string||No|
|glue_endpoint_security_configuration|The name of the SecurityConfiguration structure to be used with this DevEndpoint.|string||No|

## output parameters

| Name | Description | Type |
|------|-------------|:----:|
|id|Dev Endpoint name|string|
|name|Dev Endpoint name|string|
