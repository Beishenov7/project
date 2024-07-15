locals {
  helm_releases = {
    api = {
      chart   = "../helm/api"
      version = "0.1.0"
    }
    web = {
      chart   = "../helm/web"
      version = "0.1.0"
    }
    mysql = {
      chart   = "../helm/db"
      version = "0.1.0"
    }
  }
}