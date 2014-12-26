# == Class: qgis::mapserver
#
# Installs the mapserver fastcgi version of qgis
#
class qgis::mapserver {

  include qgis::repo

  package { 'qgis-mapserver': ensure => present }

}
