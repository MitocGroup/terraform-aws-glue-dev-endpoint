data "external" "glue_endpoint" {
  program = ["python", "${path.module}/scripts/apply.py"]

  query = {
      Region                = "${var.region}"
      EndpointName          = "${var.glue_endpoint_name}"
      RoleArn               = "arn:aws:iam::${var.account_id}:role/${var.glue_endpoint_role_name}"
      SecurityGroupIds      = "${join(",",var.glue_endpoint_security_group_ids)}"
      SubnetId              = "${var.glue_endpoint_subnet_id}"
      PublicKey             = "${var.glue_endpoint_public_key}"
      PublicKeys            = "${join(",",var.glue_endpoint_public_keys)}"
      NumberOfNodes         = "${var.glue_endpoint_number_of_dpus}"
      ExtraPythonLibsS3Path = "${var.glue_endpoint_extra_python_libraries}"
      ExtraJarsS3Path       = "${var.glue_endpoint_extra_jars_libraries}"
      SecurityConfiguration = "${var.glue_endpoint_security_configuration}"
      job_apply             = "${null_resource.glue_endpoint.id}"
  }
}
