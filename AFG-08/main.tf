provider "local" {}

variable "create_file" {
  type    = bool
  default = false
  description = "A boolean to decide whether to create the file or not"
}

resource "local_file" "conditional_file" {
  count    = var.create_file ? 1 : 0
  content  = "This file is created based on a condition."
  filename = "${path.module}/conditional_file.txt"
}

output "file_path" {
  value     = var.create_file ? local_file.conditional_file[0].filename : "File not created"
  sensitive = false
}
