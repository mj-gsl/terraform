provider "local" {}

resource "random_string" "random_id" {
    length = 10
    special = false
    upper = false
    lower = true
}

resource "local_file" "file_random-name" {
    content = "File name is random generated name by Terraform"
    filename = "${path.module}/${random_string.random_id.result}.txt"
}