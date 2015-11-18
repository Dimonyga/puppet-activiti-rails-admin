class activiti_rails_admin::install inherits activiti_rails_admin {


case $operatingsystem {
  "Debian", "Ubuntu": {   
    $git_package = "git"
    $nodejs_package = "nodejs"
    $curl_dev_package = "libcurl4-gnutls-dev"
    $zlib_dev_package = "libghc-zlib-dev"
    $patch_package = "patch"
    $make_package = "make"
    }
  default:  { 
    $git_package = "git" 
    $nodejs_package = "nodejs"
    $curl_dev_package = "libcurl-devel"
    $zlib_dev_package = "zlib-devel"
    $patch_package = "patch"
    $make_package = "make"
    }
}


   user { $activiti_admin_user:
        ensure => present,
        shell => "/usr/sbin/nologin",
        home => $activiti_admin_home,
        managehome => true,
    }
    
    group { $activiti_admin_group:
    ensure => present,
    }
    
    package { $git_package:
	ensure => present,
    }
    
    vcsrepo { $activiti_admin_home:
        ensure   => present,
        provider => git,
        revision => $activiti_admin_git_revision,
        require => Package[$git_package],
        source   => $activiti_admin_git_url,
    }
    
    file { $activiti_admin_home:
	recurse => true,
        ensure => directory,
        owner => $activiti_admin_user,
        group => $activiti_admin_group,
        mode => "0644",
    }
    
    package { $make_package:
	ensure => present,
    }
    package { $nodejs_package:
	ensure => present,
    }
    package { $curl_dev_package:
	ensure => present,
    }
    package { $zlib_dev_package:
	ensure => present,
    }
    package { $patch_package:
	ensure => present,
    }

    exec { "bundle install --without development test":
    path	=> "/bin:/usr/bin:/usr/local/bin",
    cwd	=> $activiti_admin_home,
    require => [
		Package[$make_package], 
		Package[$nodejs_package], 
		Package[$curl_dev_package], 
		Package[$zlib_dev_package], 
		Package[$patch_package] 
	],
    }
    
}