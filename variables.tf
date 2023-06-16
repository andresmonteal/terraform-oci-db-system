// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

# compartments
variable "tenancy_ocid" {
  description = "(Required) (Updatable) The OCID of the root compartment."
  type        = string
  default     = null
}

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
  default     = null
}

variable "compartment" {
  description = "compartment name where to create all resources"
  type        = string
  default     = null
}

variable "network_cmp" {
  description = "Compartment name for networking resources"
  type        = string
  default     = null
}

variable "network_cmp_id" {
  description = "Compartment id for networking resources"
  type        = string
  default     = null
}

# db system

# required

variable "ad_number" {
  description = "The availability domain number. If none is provided, it will start with AD-1 and continue in round-robin."
  type        = number
  default     = null
}

variable "db_system_admin_password" {
  description = "(Required) A strong password for SYS, SYSTEM, PDB Admin and TDE Wallet. The password must be at least nine characters and contain at least two uppercase, two lowercase, two numbers, and two special characters."
  type        = string
}

variable "db_system_hostname" {
  description = "(Required) The hostname for the DB system. The hostname must begin with an alphabetic character, and can contain alphanumeric characters and hyphens (-). The maximum length of the hostname is 16 characters for bare metal and virtual machine DB systems, and 12 characters for Exadata DB systems."
  type        = string
}

variable "db_system_shape" {
  description = "(Required) (Updatable) The shape of the DB system. The shape determines resources allocated to the DB system."
  type        = string
}

variable "ssh_public_keys" {
  description = "(Required) (Updatable) The public key portion of the key pair to use for SSH access to the DB system. Multiple public keys can be provided. The length of the combined keys cannot exceed 40,000 characters."
  type        = list(string)
}

variable "subnet_name" {
  description = "(Required) The name of the subnet the DB system is associated with."
  type        = string
}

variable "db_system_time_zone" {
  description = "(Optional) The time zone to use for the DB system"
  type        = string
}

# optional

variable "db_system_cpu_core_count" {
  description = "The number of CPU cores enabled on the DB system."
  type        = number
  default     = null
}

variable "db_system_database_edition" {
  description = "The Oracle Database edition that applies to all the databases on the DB system."
  type        = string
  default     = null
}

variable "db_system_display_name" {
  description = "The user-friendly name for the DB system. The name does not have to be unique."
  type        = string
  default     = null
}

variable "db_system_domain" {
  description = "The domain name for the DB system."
  type        = string
  default     = null
}

variable "db_system_license_model" {
  description = "The Oracle license model that applies to all the databases on the DB system. The default is LICENSE_INCLUDED."
  type        = string
  default     = "LICENSE_INCLUDED"
}

variable "db_system_node_count" {
  description = "The number of nodes in the DB system. For RAC DB systems, the value is greater than 1."
  type        = string
  default     = null
}

# tags

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace."
  type        = map(any)
  default     = null
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(any)
  default     = null
}