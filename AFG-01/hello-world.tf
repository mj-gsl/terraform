provider "local" {}
resource "local_file" "tr-test" {
    content = "Hello World!"
    filename = "${path.module}/hello.txt" 
}