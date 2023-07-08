terraform {
  cloud {
    organization = "varun-gcp"

    workspaces {
      name = "gcp-iac"
    }
  }
}
