resource "digitalocean_database_cluster" "db-cluster" {
  name       = "pass-in"
  engine     = "pg"
  version    = "16"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = 1
}

resource "digitalocean_database_db" "db-name" {
  cluster_id = digitalocean_database_cluster.db-cluster.id
  name       = "pass-in"

  depends_on = [digitalocean_database_cluster.db-cluster]
}