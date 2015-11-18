class activiti_rails_admin::config inherits activiti_rails_admin {

    file { "${activiti_admin_home}/config/servers.yml":
    ensure  => file,
    content => template("activiti_rails_admin/servers.yml.erb"),
    }    

    file { "${activiti_admin_home}/config/secrets.yml":
    ensure  => file,
    content => template("activiti_rails_admin/secrets.yml.erb"),
    }

}