provider "aws" {
  region = var.region

  default_tags {
    tags = {
      app         = var.name
      owner       = var.squad
      provisioner = "terraform"
      vcs         = "https://github.com/caiodelgadonew/js-fakeapp"
    }
  }
}
