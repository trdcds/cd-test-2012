group { 'puppet': ensure => 'present' }

exec { 'apt-get update':
  command => '/usr/bin/apt-get update'
}

Exec["apt-get update"] -> Package <| |>

class { 'mysql::server':
  config_hash => { 'root_password' => 'root' }
}

include mysql::server

#class db {
#  $mysql_password = "" 
#  include mysql::server
# }

#include db

#class mysql_5 {
#  
#  package { "mysql-server-5.1":
#    ensure => present
#  }
#  
#  service { "mysql":
#    ensure => running, 
#    require => Package["mysql-server-5.1"]
#  }

#  exec { "create-db-schema-and-user":
#    command => "/usr/bin/mysql -uroot -p -e \"drop database if exists testapp; create database testapp; create user dbuser@'%' identified by 'dbuser'; grant all on testapp.* to dbuser@'%'; flush privileges;\"",
#    require => Service["mysql"]
#  }

  #file { "/etc/mysql/my.cnf":
  #  owner => 'root',
  #  group => 'root',
  #  mode => 644,
  #  notify => Service['mysql'],
  #  source => '/vagrant/files/my.cnf'
  #}

#}

#include mysql_5

