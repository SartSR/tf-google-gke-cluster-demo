module "gke_cluster" {
  source         = "github.com/SartSR/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 2
}

resource "google_container_cluster" "main" {
  name     = var.GKE_CLUSTER_NAME
  location = var.GOOGLE_REGION

  initial_node_count       = 1
  remove_default_node_pool = true
}

resource "google_container_node_pool" "main" {
  name       = var.GKE_POOL_NAME
  project    = google_container_cluster.main.project
  cluster    = google_container_cluster.main.name
  location   = google_container_cluster.main.location
  node_count = var.GKE_NUM_NODES

  node_config {
    machine_type = var.GKE_MACHINE_TYPE
  }
}



