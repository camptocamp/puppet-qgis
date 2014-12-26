# == Class: qgis::mapserver::apache
#
# Installs the mapserver fastcgi version of qgis
# and enables apache's fastcgi module.
#
# You are left to put the following directive somewhere in
# apache's config:
#
#   Alias /a/relevant/path /usr/lib/cgi-bin/qgis_mapserv.fcgi
#
class qgis::mapserver::apache {

  include qgis::mapserver
  include apache

  package { 'libapache2-mod-fastcgi': ensure => present }

  apache_c2c::module { 'fastcgi':
    ensure  => present,
    require => Package['libapache2-mod-fastcgi'],
  }

}
