# Class for Let's Encrypt certificate resources
define dehydrated::certificate(
  $hook = '',
  $challenge = 'http-01',
  $domain = $title,
  $wellknown = '/var/www/html'
) {

  # Change hooks to paths
  case $hook {
    'route53': { $hook_path = "${dehydrated::home_directory}/hooks/route53/route53.sh" }
    default: { $hook_path = '' }
  }

  # Ensure present in domains.txt
  concat::fragment { $domain:
    target  => "${dehydrated::home_directory}/domains.txt",
    content => $domain
  }

  # Custom configuration

  # Ensure that domain directory exists
  file { "${dehydrated::etc_directory}/certs/${domain}/":
    ensure => directory,
    owner  => $dehydrated::user,
    mode   => '0700'
  }

  file { "${dehydrated::etc_directory}/certs/${domain}/config":
    ensure  => file,
    content => epp('dehydrated/domain.config.epp', {
      'hook_path' => $hook_path,
      'challenge' => $challenge,
      'wellknown' => $wellknown
    }),
    require => File["/etc/dehydrated/certs/${domain}/"]
  }

  # Run once to generate initial certificate
  exec { "cron-${domain}":
    command => "${dehydrated::etc_directory}/dehydrated --cron --config ${dehydrated::home_directory}/config",
    user    => $dehydrated::user,
    creates => "${dehydrated::etc_directory}/certs/${domain}/fullchain.pem",
    require => Concat::Fragment[$domain]
  }
}
