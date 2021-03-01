terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "excelsior"

    workspaces {
      name = "phillhocking-com-dev"
    }
  }
}