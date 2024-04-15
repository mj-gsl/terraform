provider "local" {}

resource "null_resource" "run_script" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "sh ${path.module}/local.sh"
  }
}
