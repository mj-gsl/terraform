provider "local" {}

terraform {
  required_providers {
    tls = {
        source = "hashicorp/tls"
        version = "3.0"
    }
  }
}

resource "tls_private_key" "example_key" {
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "tls_self_signed_cert" "example_cert" {
  key_algorithm = tls_private_key.example_key.algorithm
  private_key_pem = tls_private_key.example_key.private_key_pem

  subject {
    common_name = "example.com"
    organization = "Example inc."
  }  

  validity_period_hours = 24
  is_ca_certificate = true

  allowed_uses = [ 
    "key_encipherment",
    "digital_signature",
    "server_auth",
   ]
}

output "private_key" {
    value = tls_private_key.example_key.private_key_pem
    sensitive = true
}

output "certification" {
  value = tls_self_signed_cert.example_cert.cert_pem 
}
