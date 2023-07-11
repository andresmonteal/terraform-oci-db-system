// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

########################
# code repositories
########################

locals {
  default_freeform_tags = {
    terraformed = "Please do not edit manually"
    module      = "oracle-terraform-oci-db-system"
  }
  merged_freeform_tags = merge(var.freeform_tags, local.default_freeform_tags)
  compartment_id       = try(data.oci_identity_compartments.compartment[0].compartments[0].id, var.compartment_id)
  ADs = [
    // Iterate through data.oci_identity_availability_domains.ad and create a list containing AD names
    for i in data.oci_identity_availability_domains.ad.availability_domains : i.name
  ]
  network_cmp_id  = try(data.oci_identity_compartments.network[0].compartments[0].id, var.network_cmp_id)
  security_cmp_id = try(data.oci_identity_compartments.security[0].compartments[0].id, var.security_cmp_id)
  ssh_key         = try(base64decode(data.oci_secrets_secretbundle.ssh_bundle[0].secret_bundle_content.0.content), var.ssh_public_keys)
  sys_pwd         = try(base64decode(data.oci_secrets_secretbundle.pwd_bundle[0].secret_bundle_content.0.content), var.db_system_admin_password)
  subnet_id       = data.oci_core_subnets.subnets.subnets[0].id
}

resource "oci_database_db_system" "main" {
  #Required
  availability_domain = var.ad_number == null ? element(local.ADs, 1) : element(local.ADs, var.ad_number - 1)
  compartment_id      = local.compartment_id
  db_home {
    #Required
    database {
      #Required
      admin_password = trimspace(local.sys_pwd)

      #Optional
      db_name       = var.db_system_db_home_database_db_name
      defined_tags  = var.defined_tags
      freeform_tags = local.merged_freeform_tags
    }

    #Optional
    db_version    = var.db_system_db_home_db_version
  }
  hostname        = var.db_system_hostname
  shape           = var.db_system_shape
  ssh_public_keys = [try(trimspace(local.ssh_key))]
  subnet_id       = local.subnet_id
  cluster_name    = var.db_system_cluster_name

  #Optional
  cpu_core_count          = var.db_system_cpu_core_count
  data_storage_size_in_gb = var.db_system_data_storage_size_in_gb
  database_edition        = var.db_system_database_edition

  defined_tags  = var.defined_tags
  display_name  = var.db_system_display_name
  freeform_tags = local.merged_freeform_tags
  license_model = var.db_system_license_model

  node_count = var.db_system_node_count
  time_zone  = var.db_system_time_zone
  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"],
      defined_tags["Oracle-Tags.CreatedOn"]
    ]
    # This meta-argument, when set to true, will cause Terraform to reject with an error any plan that would destroy the resource
    prevent_destroy = true
  }
  timeouts {
    create = "2h"
    update = "2h"
    delete = "2h"
  }
}