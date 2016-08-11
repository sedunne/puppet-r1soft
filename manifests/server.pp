class r1soft::server (
  $repo_install               = $r1soft::params::repo_install,
  $cdp_server_package_version = $r1soft::params::cdp_server_package_version,
  $cdp_server_package_name    = $r1soft::params::cdp_server_package_name,

  $service_manage      = $r1soft::params::server_service_manage,
  $service_name        = $r1soft::params::server_service_name,
  $service_ensure      = $r1soft::params::server_service_ensure,
  $service_enable      = $r1soft::params::server_service_enable,
  $admin_user          = $r1soft::params::server_admin_user,
  $admin_pass          = $r1soft::params::server_admin_pass,
  $max_mem             = $r1soft::params::server_max_mem,
)
inherits r1soft::params {
  validate_bool($repo_install)
  validate_string($cdp_server_package_version)
  validate_string($cdp_server_package_name)

  validate_bool($service_manage)
  validate_string($service_name)
  validate_string($service_ensure)
  validate_bool($service_enable)
  validate_string($admin_user)
  validate_string($admin_pass)
  validate_string($max_mem)

  if $repo_install {
    include r1soft::repo
    Yumrepo['r1soft'] -> Package <| title == $cdp_server_package_name |>
  }


  anchor {'r1soft::server::begin':} ->
  class{'::r1soft::server::install':} ->
  class{'::r1soft::server::config':} ->
  class{'::r1soft::server::service':} ->
  anchor {'r1soft::server::end':}
}
