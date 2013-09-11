/*

== Class: qgis::repo

Configure apt-get to fetch all qgis packages from qgis.org.
You can still prefer install your distribution's packages by setting
another apt::preferences resource with a higher priority.

Only compatible with debian/ubuntu.

*/
class qgis::repo {

  if $::osfamily == 'Debian' {

    apt::sources_list { 'qgis.org':
      ensure  => present,
      content => "deb http://qgis.org/debian ${::lsbdistcodename} main",
    }

    apt::key {'47765B75':
      ensure    => present,
    }

    apt::preferences {'qgis':
      ensure   => present,
      package  => 'libqgis-dev libqgis1 python-qgis-common python-qgis qgis-api-doc qgis-common qgis-mapserver qgis-plugin-grass-common qgis-plugin-grass qgis-providers-common qgis-providers qgis-sqlanywhere* qgis',
      pin      => 'release o=Quantum GIS project',
      priority => 1100,
    }
  }

}
