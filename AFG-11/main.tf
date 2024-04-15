provider "local" {}

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

resource "random_integer" "subnet_count" {
  min = 1
  max = 5
}

resource "local_file" "subnet_file" {
  content = join("\n", [
    for s in range(random_integer.subnet_count.result) : 
      format("172.19.%d.0/24", s + 10)
  ])
  filename = "${path.module}/subnets.txt"
}

output "subnet_file_path" {
  value = local_file.subnet_file.filename
}
