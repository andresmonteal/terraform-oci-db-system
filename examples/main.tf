// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

module "db_system" {
  source = "../"

  for_each = var.db_systems

  tenancy_ocid = var.tenancy_ocid
  compartment  = each.value["compartment"]
  network_cmp  = each.value["network_cmp"]
  ad_number    = each.value["ad_number"]

  db_system_db_home_db_version       = "19.0.0.0"
  db_system_db_home_database_db_name = each.value["db_name"]

  db_system_hostname  = each.value["db_system_hostname"]
  db_system_shape     = each.value["db_system_shape"]
  subnet_name         = each.value["subnet_name"]
  db_system_time_zone = "America/Costa_Rica"

  ssh_secret   = each.value["ssh_secret"]
  pwd_secret   = each.value["pwd_secret"]
  security_cmp = each.value["security_cmp"]

  db_system_cpu_core_count          = each.value["db_system_cpu_core_count"]
  db_system_data_storage_size_in_gb = each.value["db_system_data_storage_size_in_gb"]
  db_system_database_edition        = each.value["db_system_database_edition"]
  db_system_display_name            = each.key

  db_system_node_count = each.value["db_system_node_count"]

  freeform_tags = lookup(each.value, "freeform_tags", {})
}