module "gke_cluster" {
  source         = "github.com/SartSR/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 1
  GKE_MACHINE_TYPE = var.GKE_MACHINE_TYPE
}
terraform {
  backend "gcs" {
    bucket = "tfstatebckt"
    prefix = "terraform/state"
  }
}