provider "local" {}
resource "random_integer" "random_number" {
  min = 1
  max = 100
}

resource "local_file" "output_random" {
    content = "Random Number: ${random_integer.random_number.result}"
    filename = "${path.module}/random_number.txt" 
}