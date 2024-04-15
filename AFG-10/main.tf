terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0" 
    }
  }
}

resource "random_password" "password" {
  length           = 16  
  special          = true  
  override_special = "_%@"  
}

output "generated_password" {
  value     = random_password.password.result
  sensitive = true  
}
