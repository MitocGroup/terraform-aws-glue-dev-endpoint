resource "null_resource" "glue_endpoint_apply" {

  triggers {
    default_tfvars = "${md5(file("${path.module}/default.tfvars"))}"
    script_apply  = "${md5(file("${path.module}/scripts/apply.py"))}"
  }

  provisioner "local-exec" {
    when    = "create"
    command = "python ${path.module}/scripts/apply.py"
    environment {
      Region                = "${var.region}"
      EndpointName          = "${var.glue_endpoint_name}"
      RoleArn               = "arn:aws:iam::${var.account_id}:role/${var.glue_endpoint_name}"
      SecurityGroupIds      = "${join(",",var.glue_endpoint_security_group_ids)}"
      SubnetId              = "${var.glue_endpoint_subnet_id}"
      PublicKey             = "${var.glue_endpoint_public_key}"
      PublicKeys            = "${join(",",var.glue_endpoint_public_keys)}"
      NumberOfNodes         = "${var.glue_endpoint_number_of_dpus}"
      ExtraPythonLibsS3Path = "${var.glue_endpoint_extra_python_libraries}"
      ExtraJarsS3Path       = "${var.glue_endpoint_extra_jars_libraries}"
      SecurityConfiguration = "${var.glue_endpoint_security_configuration}"
    }
  }
}

resource "null_resource" "glue_endpoint_destroy" {
  count = "${data.external.glue_endpoint.result["Exist"] == "True" ? 1 : 0}"
  provisioner "local-exec" {
    when    = "destroy"
    command = "python ${path.module}/scripts/destroy.py"
    environment {
      Region       = "${var.region}"
      EndpointName = "${var.glue_endpoint_name}"
    }
  }
}