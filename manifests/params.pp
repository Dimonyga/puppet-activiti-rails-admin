class activiti_rails_admin::params {

    $activiti_admin_home = "/opt/activiti_rails_admin"
    $activiti_admin_git_url = "https://github.com/Dimonyga/activiti-rails-admin.git"
    $activiti_admin_user = "www-data"
    $activiti_admin_group = "www-data"
    $activiti_admin_server_url = "http://127.0.0.1:8080/activiti/rest/service/"
    $activiti_admin_manage_unicorn = true
    $activiti_admin_manage_nginx = true
    $activiti_admin_git_revision = "master"

}