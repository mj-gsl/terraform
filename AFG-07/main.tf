provider "local" {}

terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "2.0"
    }
  }
}

data "http" "chuck_norris_joke" {
  url = "https://api.chucknorris.io/jokes/random"
}

resource "local_file" "api_response" {
  content  = data.http.chuck_norris_joke.body
  filename = "${path.module}/chuck_norris_joke.json"
}

output "file_path" {
  value = local_file.api_response.filename
}
