class activiti_rails_admin::config inherits activiti_rails_admin {

  #if ($activiti_rails_admin::activiti_admin_servers) {
  #  $hiera_servers = hiera_hash (activiti_rails_admin::activiti_admin_servers)
  #  $servers = hash_merge($hiera_servers,$activiti_rails_admin::params::activiti_admin_servers)
  #} else {
    $servers = $activiti_rails_admin::params::activiti_admin_servers
  #}

  file { "${activiti_admin_home}/config/servers.yml":
    ensure  => file,
    content => template("activiti_rails_admin/servers.yml.erb"),
  }

  file { "${activiti_admin_home}/config/secrets.yml":
    ensure  => file,
    content => template("activiti_rails_admin/secrets.yml.erb"),
  }

}