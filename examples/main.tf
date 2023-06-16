// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

module "db_system" {
  source = "../"

  for_each = var.db_systems

  tenancy_ocid             = var.tenancy_ocid
  compartment              = each.value["compartment"]
  network_cmp              = each.value["network_cmp"]
  ad_number                = each.value["ad_number"]
  db_system_admin_password = each.value["db_system_admin_password"]
  db_system_hostname       = each.value["db_system_hostname"]
  db_system_shape          = each.value["db_system_shape"]
  ssh_public_keys          = ["test"]
  subnet_name              = each.value["subnet_name"]
  db_system_time_zone      = "test"

  db_system_cpu_core_count   = each.value["db_system_cpu_core_count"]
  db_system_database_edition = each.value["db_system_database_edition"]
  db_system_display_name     = each.key

  db_system_node_count = each.value["db_system_node_count"]

  freeform_tags = lookup(each.value, "freeform_tags", {})
  defined_tags  = { "application.project" = "sicop", "application.environment" = "np" }
}