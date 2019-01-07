data "external" "terrahub_glue_endpoint" {
  program = ["python", "${path.module}/scripts/get.py"]

  query = {
      EndpointName = "${var.glue_endpoint_name}"
      Region       = "${var.region}"
  }
}