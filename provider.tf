provider "google" {
  credentials = file("credentials.json")

  project = "hsbc-gcp-392204"
  region  = "us-central1"
  zone    = "us-central1-c"
}
