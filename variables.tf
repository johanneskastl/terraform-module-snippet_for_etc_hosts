#
#
#

variable "file_name_with_path" {
  description = "File name for the new file"
  default     = "etc_hosts_snippet.txt"
}

variable "file_permissions" {
  description = "Permissions for the new file"
  default     = "0644"
}

variable "domain" {
  description = "The domain the FQDN should use"
  default     = "training.b1-systems.de"
}

variable "groups_to_add" {
  description = "Instance objects created using the create_instance_with_floating_ip module"
  type        = list
}
