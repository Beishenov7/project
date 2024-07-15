terraform {
  backend "gcs" {
    bucket  = "adilet-bucket1"
    prefix  = "apps/terraform.tfstate"
  }
}
