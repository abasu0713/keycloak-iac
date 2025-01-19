variable "cf_zone_id" {
  type        = string
  description = "cloudflare zone id"
}

variable "cf_account_id" {
  sensitive   = true
  description = "cloudflare account id"
}

variable "cf_domain" {
  description = "cloudflare domain"
}

variable "cf_api_token" {
  description = "cloudflare API Token"
  sensitive   = true
  type        = string
}

variable "keycloak_namespace" {
  description = "keycloak namespace"
  type        = string
  default     = "auth"
}

variable "keycloak_image_tag" {
  description = "keycloak image tag"
  type        = string
  default     = "26.0.7-debian-12-r0"
}

variable "keycloak_admin_user" {
  description = "keycloak bootstrap admin user"
  type        = string
  default     = "admin-temp"
}

variable "keycloak_admin_user_password" {
  description = "keycloak bootstrap admin user password"
  type        = string
  sensitive   = true
}

variable "keycloak_deployment_name" {
  description = "keycloak deployment name used for helm release, service, and CNAME records in cloudflare"
  type        = string
  default     = "auth"
}