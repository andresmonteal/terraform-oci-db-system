tenancy_ocid = "tenant-id"

db_systems = {
  "test" = {
    compartment                       = "cmp-app-np"
    network_cmp                       = "cmp-networking"
    security_cmp                      = "cmp-security"
    ad_number                         = 1
    db_system_hostname                = "test"
    db_system_shape                   = "VM.Standard3.Flex"
    subnet_name                       = "sn-db-np-pri"
    db_system_cpu_core_count          = 2
    db_system_database_edition        = "ENTERPRISE_EDITION"
    db_system_node_count              = 1
    db_system_data_storage_size_in_gb = "1024"
    ssh_secret                        = "test"
    pwd_secret                        = "test2"

  }
}