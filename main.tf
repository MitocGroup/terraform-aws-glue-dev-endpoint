resource "null_resource" "glue_endpoint_apply" {
  triggers {
    tfvars_file = "${md5(file("${path.module}/default.tfvars"))}"
  }
  provisioner "local-exec" {
    when    = "create"
    command = "python ${path.module}/scripts/apply.py"
    environment {
      region                    = "${var.aws_region}"
      endpoint_name             = "${var.glue_endpoint_name}"
      role_arn                  = "${var.glue_endpoint_role}"
      security_group_ids        = "${join(",",var.glue_endpoint_security_group_ids)}"
      subnet_id                 = "${var.glue_endpoint_subnet_id}"
      public_key                = "${var.glue_endpoint_public_key}"
      public_keys               = "${join(",",var.glue_endpoint_public_keys)}"
      number_of_nodes           = "${var.glue_endpoint_number_of_dpus}"
      extra_python_libs_s3_path = "${var.glue_endpoint_extra_python_libraries}"
      extra_jars_s3_path        = "${var.glue_endpoint_extra_jars_libraries}"
      security_configuration    = "${var.glue_endpoint_security_configuration}"
    }
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "echo 'Glue Endpoint Apply'"
  }
}

resource "null_resource" "glue_endpoint_destroy" {
  depends_on = ["null_resource.glue_endpoint_apply"]
  provisioner "local-exec" {
    when    = "create"
    command = "echo 'Glue Endpoint Destroy'"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "python ${path.module}/scripts/destroy.py"
    environment {
      region        = "${var.aws_region}"
      endpoint_name = "${var.glue_endpoint_name}"
    }
  }
}
