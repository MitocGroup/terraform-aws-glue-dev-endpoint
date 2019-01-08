resource "null_resource" "glue_endpoint_apply" {
  triggers {
    change_region                    = "${md5("${var.aws_region}")}"
    change_endpoint_name             = "${md5("${var.glue_endpoint_name}")}"
    change_role                      = "${md5("${var.glue_endpoint_role}")}"
    change_security_group_ids        = "${md5("${var.glue_endpoint_security_group_ids}")}"
    change_subnet_id                 = "${md5("${var.glue_endpoint_subnet_id}")}"
    change_public_keys               = "${md5("${var.glue_endpoint_public_keys}")}"
    change_number_of_nodes           = "${md5("${var.glue_endpoint_number_of_dpus}")}"
    change_extra_python_libs_s3_path = "${md5("${var.glue_endpoint_extra_python_libraries}")}"
    change_extra_jars_s3_path        = "${md5("${var.glue_endpoint_extra_jars_libraries}")}"
    change_security_configuration    = "${md5("${var.glue_endpoint_security_configuration}")}"
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
      public_keys               = "${join(",",var.glue_endpoint_public_keys)}"
      number_of_nodes           = "${var.glue_endpoint_number_of_dpus}"
      extra_python_libs_s3_path = "${var.glue_endpoint_extra_python_libraries}"
      extra_jars_s3_path        = "${var.glue_endpoint_extra_jars_libraries}"
      security_configuration    = "${var.glue_endpoint_security_configuration}"
    }
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "echo 'info: destroy ignored because part of apply'"
  }
}

resource "null_resource" "glue_endpoint_destroy" {
  depends_on = ["null_resource.glue_endpoint_apply"]

  provisioner "local-exec" {
    when    = "create"
    command = "echo 'info: apply ignored because part of destroy'"
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
