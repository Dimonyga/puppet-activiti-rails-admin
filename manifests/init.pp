class activiti_rails_admin(
    $activiti_admin_home = $activiti_rails_admin::params::activiti_admin_home,
    $activiti_admin_giturl = $activiti_rails_admin::params::activiti_admin_giturl,
    $activiti_admin_user = $activiti_rails_admin::params::activiti_admin_user,
    $activiti_admin_group = $activiti_rails_admin::params::activiti_admin_group,
    $activiti_admin_server_url = $activiti_rails_admin::params::activiti_admin_server_url,
) inherits activiti_rails_admin::params {

    anchor { "activiti_rails_admin::begin": } ->
	class { "::activiti_rails_admin::install": } ->
	class { "::activiti_rails_admin::config": } ->
	class { "::activiti_rails_admin::service": } ->
    anchor { "activiti_rails_admin::end": }
}