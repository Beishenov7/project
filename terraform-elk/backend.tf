terraform {
  backend "gcs" {
    bucket  = "adilet-bucket1"
    prefix  = "monitoring/terraform.tfstate"
  }
}
