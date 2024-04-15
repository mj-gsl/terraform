provider "local" {}

terraform {
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "2.2"
    }
  }
}

data "archive_file" "data_zip" {
  type        = "zip"
  source_dir  = "${path.module}/datafiles"  
  output_path = "${path.module}/data.zip"
}

output "archive_path" {
  value = data.archive_file.data_zip.output_path
}
