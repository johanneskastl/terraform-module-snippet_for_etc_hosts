# create a snippet to add to /etc/hosts

data "template_file" "etc_hosts_snippet" {
  template = <<EOT
%{ for group in var.groups_to_add ~}
# ${ group.name }
%{ for fip_association in group.instancesobject.floating_ip_associations.* ~}
%{ for host in group.instancesobject.instances.* ~}
%{ if host.id == fip_association.instance_id ~}
${fip_association.floating_ip} ${host.name} ${host.name}.training.b1-systems.de
%{ endif ~}
%{ endfor ~}
%{ endfor ~}

%{ endfor ~}
EOT
}

resource "local_file" "file_etc_hosts_snippet" {
  content         = data.template_file.etc_hosts_snippet.rendered
  filename        = var.file_name_with_path
  file_permission = var.file_permissions
}

