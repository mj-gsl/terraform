provider "local" {}

# Include the Template provider
terraform {
  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "2.2"
    }
  }
}

data "template_file" "config" {
  template = file("${path.module}/config.tpl")

  vars = {
    user     = "admin"
    password = "securepassword123"
  }
}

resource "local_file" "config_json" {
  content  = data.template_file.config.rendered
  filename = "${path.module}/config.json"
}

output "config_file_path" {
  value = local_file.config_json.filename
}
