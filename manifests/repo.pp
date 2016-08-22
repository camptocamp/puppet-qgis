# == Class: qgis::repo
#
# Configure apt-get to fetch all qgis packages from qgis.org.
# You can still prefer install your distribution packages by setting
# another apt::pin resource with a higher priority.
#
# Only compatible with debian/ubuntu.
#
class qgis::repo {

  if $::osfamily == 'Debian' {

    apt::source {'qgis-org':
      ensure      => present,
      location    => 'http://qgis.org/debian',
      release     => $::lsbdistcodename,
      repos       => 'main',
      key         => '073D307A618E5811',
      key_source  => 'http://qgis.org/downloads/qgis-2016.gpg.key',
      include_src => true,
    }

    $qgis_packages = [
      'libqgis-dev',
      'libqgis1',
      'python-qgis-common',
      'python-qgis',
      'qgis-api-doc',
      'qgis-common',
      'qgis-mapserver',
      'qgis-plugin-grass-common',
      'qgis-plugin-grass',
      'qgis-providers-common',
      'qgis-providers',
      'qgis-sqlanywhere*',
      'qgis',
    ]

    apt::pin {'qgis-org':
      ensure     => present,
      packages   => inline_template('<%= @qgis_packages.join(" ") %>'),
      originator => 'Quantum GIS project',
      priority   => 1100,
    }
  }

}
