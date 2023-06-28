data "oci_identity_compartments" "compartment" {
  count = var.compartment == null ? 0 : 1
  #Required
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  #Optional
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.compartment]
  }
}

data "oci_identity_compartments" "network" {
  count = var.network_cmp == null ? 0 : 1
  #Required
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  #Optional
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.network_cmp]
  }
}

data "oci_identity_compartments" "security" {
  count = var.security_cmp == null ? 0 : 1
  #Required
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  #Optional
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.security_cmp]
  }
}

// Get all the Availability Domains for the region and default backup policies
data "oci_identity_availability_domains" "ad" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_subnets" "subnets" {
  #Required
  compartment_id = local.network_cmp_id

  #Optional
  display_name = var.subnet_name
}

#This data source provides the list of Secrets in Oracle Cloud Infrastructure Vault service.
data "oci_vault_secrets" "ssh_secret" {
  count = var.ssh_secret == null ? 0 : 1
  #Required
  compartment_id = local.security_cmp_id

  #Optional
  name = var.ssh_secret
}

#This data source provides details about a specific Secretbundle resource in Oracle Cloud Infrastructure Secrets service.
data "oci_secrets_secretbundle" "ssh_bundle" {
  count     = var.ssh_secret == null ? 0 : 1
  secret_id = data.oci_vault_secrets.ssh_secret[0].secrets[0].id
}

#This data source provides the list of Secrets in Oracle Cloud Infrastructure Vault service.
data "oci_vault_secrets" "pwd_secret" {
  count = var.pwd_secret == null ? 0 : 1
  #Required
  compartment_id = local.security_cmp_id

  #Optional
  name = var.pwd_secret
}

#This data source provides details about a specific Secretbundle resource in Oracle Cloud Infrastructure Secrets service.
data "oci_secrets_secretbundle" "pwd_bundle" {
  count     = var.pwd_secret == null ? 0 : 1
  secret_id = data.oci_vault_secrets.pwd_secret[0].secrets[0].id
}