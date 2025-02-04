resource "kubernetes_namespace" "keycloak_namespace" {
  metadata {
    name = var.keycloak_namespace
    labels = {
      "pod-security.kubernetes.io/audit"   = "restricted"
      "pod-security.kubernetes.io/warn"    = "restricted"
      "pod-security.kubernetes.io/enforce" = "baseline"
    }
  }
}

resource "helm_release" "keycloak" {
  name       = var.keycloak_deployment_name
  namespace  = kubernetes_namespace.keycloak_namespace.metadata.0.name
  chart      = "keycloak"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  # version = "24.4.4"
  description = "Keycloak - an open source identity and access management solution"

  set = [
    {
      name  = "image.tag"
      value = var.keycloak_image_tag
    },
    {
      name  = "auth.adminUser"
      value = var.keycloak_admin_user
    },
    {
      name  = "proxy"
      value = "edge"
    },
    {
      name  = "extraEnvVars[0].name"
      value = "KEYCLOAK_FRONTEND_URL"
    },
    {
      name  = "extrEnvVars[0].value"
      value = "https://auth.${var.cf_domain}"
    },
    {
      name  = "auth.adminPassword"
      value = var.keycloak_admin_user_password
    }
  ]

  timeout = 600
}