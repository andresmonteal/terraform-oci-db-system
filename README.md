# Oracle Cloud Infrastructure Database System Terraform Module

This Terraform module provisions an Oracle Cloud Infrastructure (OCI) Database System.

## Usage

```hcl
module "oci_db_system" {
  source = "./path_to_your_module"

  tenancy_ocid                     = "your-tenancy-ocid"
  compartment_id                   = "your-compartment-id"
  network_cmp_id                   = "your-network-compartment-id"
  security_cmp_id                  = "your-security-compartment-id"
  ad_number                        = 1
  db_system_hostname               = "my-db-host"
  db_system_shape                  = "VM.Standard2.1"
  subnet_name                      = "my-subnet"
  db_system_time_zone              = "UTC"
  db_system_data_storage_size_in_gb = 256
  db_system_db_home_db_version     = "19.0.0.0"
  db_system_db_home_database_db_name = "mydb"
  db_system_admin_password         = "YourStrongPassword123!"
  ssh_public_keys                  = "ssh-rsa AAAAB3..."
  
  # Optional Parameters
  db_system_display_name           = "My Database System"
  db_system_license_model          = "LICENSE_INCLUDED"
  db_system_node_count             = 1
  db_system_cluster_name           = "my-cluster"
  freeform_tags                    = {
    environment = "dev"
  }
  defined_tags                     = {
    "Oracle-Tags.CreatedBy" = "terraform"
  }
  
  # Auto Backup Parameters
  auto_backup_enabled              = true
  backup_destination_type          = "OBJECT_STORE"
  recovery_window_in_days          = 30
  run_immediate_full_backup        = true
}
```

## Inputs

| Name                                   | Description                                                                                                         | Type   | Default               | Required |
|----------------------------------------|---------------------------------------------------------------------------------------------------------------------|--------|-----------------------|----------|
| `tenancy_ocid`                         | The OCID of the root compartment.                                                                                   | string | `null`                | yes      |
| `compartment_id`                       | The OCID of the compartment where resources will be created.                                                        | string | `null`                | yes      |
| `network_cmp_id`                       | The OCID of the compartment for networking resources.                                                               | string | `null`                | yes      |
| `security_cmp_id`                      | The OCID of the compartment for security resources.                                                                 | string | `null`                | yes      |
| `ad_number`                            | The availability domain number. If not provided, it defaults to AD-1.                                               | number | `null`                | yes      |
| `db_system_hostname`                   | The hostname for the DB system.                                                                                     | string | `null`                | yes      |
| `db_system_shape`                      | The shape of the DB system.                                                                                         | string | `null`                | yes      |
| `subnet_name`                          | The name of the subnet the DB system is associated with.                                                            | string | `null`                | yes      |
| `db_system_time_zone`                  | The time zone for the DB system.                                                                                    | string | `null`                | no       |
| `db_system_data_storage_size_in_gb`    | Size (in GB) of the initial data volume for a VM DB system.                                                         | string | `null`                | yes      |
| `db_system_db_home_db_version`         | The Oracle Database version.                                                                                        | string | `null`                | yes      |
| `db_system_db_home_database_db_name`   | The display name of the database.                                                                                   | string | `null`                | yes      |
| `db_system_admin_password`             | A strong password for SYS, SYSTEM, PDB Admin, and TDE Wallet.                                                       | string | `null`                | yes      |
| `ssh_public_keys`                      | The public key for SSH access to the DB system.                                                                     | string | `null`                | yes      |
| `db_system_display_name`               | The user-friendly name for the DB system.                                                                           | string | `null`                | no       |
| `db_system_license_model`              | The Oracle license model. Default is `LICENSE_INCLUDED`.                                                            | string | `"LICENSE_INCLUDED"`  | no       |
| `db_system_node_count`                 | The number of nodes in the DB system.                                                                               | string | `null`                | no       |
| `db_system_cluster_name`               | The cluster name for Exadata and 2-node RAC VM DB systems.                                                          | string | `null`                | no       |
| `freeform_tags`                        | Free-form tags for this resource.                                                                                   | map    | `{}`                  | no       |
| `defined_tags`                         | Defined tags for this resource.                                                                                     | map    | `{}`                  | no       |
| `auto_backup_enabled`                  | Configures automatic backups.                                                                                       | bool   | `false`               | no       |
| `backup_destination_type`              | Type of the database backup destination.                                                                            | string | `"OBJECT_STORE"`      | no       |
| `recovery_window_in_days`              | The OCID of the DBRS policy used for backup.                                                                        | number | `30`                  | no       |
| `run_immediate_full_backup`            | Configures automatic full backups immediately.                                                                      | bool   | `true`                | no       |

## Outputs

This module does not have outputs defined. You can add outputs to `outputs.tf` if needed.

## Example

```hcl
module "oci_db_system" {
  source = "./path_to_your_module"

  tenancy_ocid                     = "ocid1.tenancy.oc1..example"
  compartment_id                   = "ocid1.compartment.oc1..example"
  network_cmp_id                   = "ocid1.compartment.oc1..example"
  security_cmp_id                  = "ocid1.compartment.oc1..example"
  ad_number                        = 1
  db_system_hostname               = "my-db-host"
  db_system_shape                  = "VM.Standard2.1"
  subnet_name                      = "my-subnet"
  db_system_time_zone              = "UTC"
  db_system_data_storage_size_in_gb = 256
  db_system_db_home_db_version     = "19.0.0.0"
  db_system_db_home_database_db_name = "mydb"
  db_system_admin_password         = "YourStrongPassword123!"
  ssh_public_keys                  = "ssh-rsa AAAAB3..."
  
  # Optional Parameters
  db_system_display_name           = "My Database System"
  db_system_license_model          = "LICENSE_INCLUDED"
  db_system_node_count             = 1
  db_system_cluster_name           = "my-cluster"
  freeform_tags                    = {
    environment = "dev"
  }
  defined_tags                     = {
    "Oracle-Tags.CreatedBy" = "terraform"
  }
  
  # Auto Backup Parameters
  auto_backup_enabled              = true
  backup_destination_type          = "OBJECT_STORE"
  recovery_window_in_days          = 30
  run_immediate_full_backup        = true
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Andres F. Montealegre**

- Email: [montealegre.af@gmail.com](mailto:montealegre.af@gmail.com)
- GitHub: [https://github.com/andresmonteal](https://github.com/andresmonteal)