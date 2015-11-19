class activiti_rails_admin::config inherits activiti_rails_admin {

  file { "${activiti_admin_home}/config/servers.yml":
    ensure  => file,
    content => template("activiti_rails_admin/servers.yml.erb"),
  }

  $hiera_servers = hiera_hash ($activiti_rails_admin::params::activiti_admin_servers)
  $servers = hash_merge($hiera_servers,$activiti_rails_admin::params::activiti_admin_servers)

  file { "${activiti_admin_home}/config/secrets.yml":
    ensure  => file,
    content => template("activiti_rails_admin/secrets.yml.erb"),
  }

}