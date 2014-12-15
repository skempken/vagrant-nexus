  # puppetlabs-java
  # NOTE: Nexus requires
  class{ '::java':
    distribution => 'jdk'
  }

  group{ 'nexus':
    ensure => present,
    system => true
  }

  user{ 'nexus':
    ensure => present,
    comment => 'Nexus user',
    uid     => '998',
    gid     => '998',
    home    => '/srv/nexus',
    shell   => '/bin/bash', # unfortunately required to start application via script.
    system  => true,
    require => Group['nexus']
  }

  class{ '::nexus':
    version        => '2.11.0',
    revision       => '02',
    nexus_user     => 'nexus',
    nexus_group    => 'nexus',
    nexus_root     => '/srv' # All directories and files will be relative to this
  }

  Class['::java'] ->
  Class['::nexus']

  exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>