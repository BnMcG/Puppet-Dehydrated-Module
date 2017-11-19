# Class to ensure that Dehydrated is installed correctly
class dehydrated::install {
  # Ensure the user is created
  user { $dehydrated::user:
    ensure     => present,
    home       => $dehydrated::home_directory,
    managehome => true,
    system     => true,
    shell      => '/usr/sbin/nologin'
  }

  # Ensure the GitHub repository is present, cloned and up-to-date
  # First, ensure Git is installed
  -> package { 'git':
    ensure => latest
  }

  # Clone the repository
  -> vcsrepo { $dehydrated::etc_directory:
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/lukas2511/dehydrated.git',
    revision => 'master'
  }

  # Ensure the Dehydrated install location is correctly permissioned
  -> file { $dehydrated::etc_directory:
    ensure  => directory,
    owner   => $dehydrated::user,
    group   => $dehydrated::group,
    recurse => true
  }

  # Cron job
  cron { 'dehydrated':
    command  => "/etc/dehydrated/dehydrated --cron --config ${dehydrated::home_directory}/config",
    user     => $dehydrated::user,
    hour     => 3,
    minute   => 45,
    month    => '*',
    monthday => '*',
    weekday  => '0'
  }
}
