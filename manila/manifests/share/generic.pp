# == Class: manila::share::generic
#
# Configures Manila to use the generic share driver
#
# ===Parameters
# [*smb_template_config_path*]
#   (optional) Path to smb config.
#   Defaults to: $state_path/smb.conf
#
# [*volume_name_template*]
#   (optional) Volume name template.
#   Defaults to: manila-share-%s
#
# [*volume_snapshot_name_template*]
#   (optional) Volume snapshot name template.
#   Defaults to: manila-snapshot-%s
#
# [*share_mount_path*]
#   (optional) Parent path in service instance where shares will be mounted.
#   Defaults to: /shares
#
# [*max_time_to_create_volume*]
#   (optional) Maximum time to wait for creating cinder volume.
#   Defaults to: 180
#
# [*max_time_to_attach*]
#   (optional) Maximum time to wait for attaching cinder volume.
#   Defaults to: 120
#
# [*service_instance_smb_config_path*]
#   (optional) Path to smb config in service instance.
#   Defaults to: $share_mount_path/smb.conf
#
# [*share_volume_fstype*]
#   (optional) Filesystem type of the share volume.
#   Choices: 'ext4', 'ext3'
#   Defaults to: ext4
#
# [*share_helpers*]
#   (optional) Specify list of share export helpers.
#   Defaults to:  ['CIFS=manila.share.drivers.generic.CIFSHelper',
#                  'NFS=manila.share.drivers.generic.NFSHelper']
#

class manila::share::generic (
  $smb_template_config_path         = '$state_path/smb.conf',
  $volume_name_template             = 'manila-share-%s',
  $volume_snapshot_name_template    = 'manila-snapshot-%s',
  $share_mount_path                 = '/shares',
  $max_time_to_create_volume        = 180,
  $max_time_to_attach               = 120,
  $service_instance_smb_config_path = '$share_mount_path/smb.conf',
  $share_volume_fstype              = 'ext4',
  $share_helpers = ['CIFS=manila.share.drivers.generic.CIFSHelper',
                    'NFS=manila.share.drivers.generic.NFSHelper'],
) {

  manila::backend::generic { 'DEFAULT':
    smb_template_config_path          => $smb_template_config_path,
    volume_name_template              => $volume_name_template,
    volume_snapshot_name_template     => $volume_snapshot_name_template,
    share_mount_path                  => $share_mount_path,
    max_time_to_create_volume         => $max_time_to_create_volume,
    max_time_to_attach                => $max_time_to_attach,
    service_instance_smb_config_path  => $service_instance_smb_config_path,
    share_helpers                     => $share_helpers,
    share_volume_fstype               => $share_volume_fstype,
  }
}
