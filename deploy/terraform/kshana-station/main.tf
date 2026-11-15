# SPDX-License-Identifier: AGPL-3.0-only
# Kshana Station on Kubernetes (roadmap 0.42 I10): the same objects as deploy/helm/kshana-station.
# Advisory software, not type-approved navigation or timing equipment.

locals {
  station_toml = coalesce(var.station_toml, file("${path.module}/files/station.toml"))

  labels = {
    "app.kubernetes.io/name"       = "kshana-station"
    "app.kubernetes.io/instance"   = var.name
    "app.kubernetes.io/managed-by" = "terraform"
  }

  selector = {
    "app.kubernetes.io/name"     = "kshana-station"
    "app.kubernetes.io/instance" = var.name
  }
}

resource "random_password" "token" {
  count   = var.token == null ? 1 : 0
  length  = 32
  special = false
}

resource "kubernetes_secret_v1" "token" {
  metadata {
    name      = "${var.name}-token"
    namespace = var.namespace
    labels    = local.labels
  }
  data = {
    token = var.token != null ? var.token : random_password.token[0].result
  }
}

resource "kubernetes_config_map_v1" "config" {
  metadata {
    name      = "${var.name}-config"
    namespace = var.namespace
    labels    = local.labels
  }
  data = {
    "station.toml" = local.station_toml
  }
}

resource "kubernetes_persistent_volume_claim_v1" "data" {
  count = var.storage_size == null ? 0 : 1
  metadata {
    name      = "${var.name}-data"
    namespace = var.namespace
    labels    = local.labels
  }
  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.storage_class
    resources {
      requests = {
        storage = var.storage_size
      }
    }
  }
  wait_until_bound = false
}

resource "kubernetes_deployment_v1" "station" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels    = local.labels
  }
  spec {
    # One Station per set of receivers: two replicas would read the same streams twice.
    replicas = 1
    strategy {
      type = "Recreate"
    }
    selector {
      match_labels = local.selector
    }
    template {
      metadata {
        labels = local.selector

        annotations = {
          "checksum/station" = sha256(local.station_toml)
        }
      }
      spec {
        node_selector = var.node_selector
        security_context {
          run_as_non_root = true
          run_as_user     = 10001
          run_as_group    = 10001
          fs_group        = 10001
          seccomp_profile {
            type = "RuntimeDefault"
          }
        }
        init_container {
          name    = "check"
          image   = var.image
          command = ["kshana", "station", "check", "/etc/kshana-station/config/station.toml"]
          security_context {
            allow_privilege_escalation = false
            read_only_root_filesystem  = true
            capabilities {
              drop = ["ALL"]
            }
          }
          volume_mount {
            name       = "config"
            mount_path = "/etc/kshana-station/config"
            read_only  = true
          }
          volume_mount {
            name       = "token"
            mount_path = "/etc/kshana-station/token"
            read_only  = true
          }
        }
        container {
          name    = "station"
          image   = var.image
          command = ["kshana", "station", "run", "/etc/kshana-station/config/station.toml"]
          port {
            name           = "status"
            container_port = 8470
          }
          readiness_probe {
            http_get {
              path = "/health"
              port = "status"
            }
            period_seconds = 15
          }
          liveness_probe {
            http_get {
              path = "/health"
              port = "status"
            }
            period_seconds = 30
          }
          resources {
            requests = {
              cpu    = "50m"
              memory = "32Mi"
            }
            limits = {
              memory = "256Mi"
            }
          }
          security_context {
            allow_privilege_escalation = false
            read_only_root_filesystem  = true
            capabilities {
              drop = ["ALL"]
            }
          }
          volume_mount {
            name       = "config"
            mount_path = "/etc/kshana-station/config"
            read_only  = true
          }
          volume_mount {
            name       = "token"
            mount_path = "/etc/kshana-station/token"
            read_only  = true
          }
          volume_mount {
            name       = "data"
            mount_path = "/var/lib/kshana-station"
          }
          volume_mount {
            name       = "tmp"
            mount_path = "/tmp"
          }
        }
        volume {
          name = "config"
          config_map {
            name = kubernetes_config_map_v1.config.metadata[0].name
          }
        }
        volume {
          name = "token"
          secret {
            secret_name = kubernetes_secret_v1.token.metadata[0].name
          }
        }
        volume {
          name = "data"
          dynamic "persistent_volume_claim" {
            for_each = var.storage_size == null ? [] : [1]
            content {
              claim_name = kubernetes_persistent_volume_claim_v1.data[0].metadata[0].name
            }
          }
          dynamic "empty_dir" {
            for_each = var.storage_size == null ? [1] : []
            content {}
          }
        }
        volume {
          name = "tmp"
          empty_dir {}
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "station" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels    = local.labels
  }
  spec {
    type     = "ClusterIP"
    selector = local.selector
    port {
      name        = "status"
      port        = 8470
      target_port = "status"
    }
  }
}
