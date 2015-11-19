class activiti_rails_admin::service inherits activiti_rails_admin {

	if $activiti_admin_manage_unicorn == true {

		unicorn::instance { "activiti_rails_admin":
			working_directory	=> $activiti_admin_home,
    	pid				=> "${activiti_admin_home}/unicorn.pid",
    	listen			=> "${activiti_admin_home}/unicorn.sock",
    	user       		=> $activiti_admin_user,
    }
  }
    
  if $activiti_admin_manage_nginx == true {

    include nginx

	  nginx::resource::upstream { "activiti_rails_admin":
      members => [
        "unix:${activiti_admin_home}/unicorn.sock",
      ],
	  }

	  nginx::resource::vhost { '_':
      proxy => "http://activiti_rails_admin",
	  }
  }
}