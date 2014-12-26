# == Class: qgis::desktop
#
# Installs the desktop version of qgis
#
class qgis::desktop {

  include qgis::repo

  package { 'qgis': ensure => present }

}
