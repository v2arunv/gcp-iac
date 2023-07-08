provider "google" {
  credentials = file("hsbc-gcp-392204-980f2b1eb72f.credentials.json")

  project = "hsbc-gcp-392204"
  region  = "us-central1"
  zone    = "us-central1-c"
}