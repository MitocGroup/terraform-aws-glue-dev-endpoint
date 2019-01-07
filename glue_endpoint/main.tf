resource "null_resource" "glue_endpoint" {
  provisioner "local-exec" {
    when    = "create"
    command = "touch ${path.module}/scripts/create.lock"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "python ${path.module}/scripts/destroy.py"
    environment {
      Region       = "${var.region}"
      EndpointName = "${var.glue_endpoint_name}"
    }
  }
}