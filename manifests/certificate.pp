# Class for Let's Encrypt certificate resources
define dehydrated::certificate(
  $hook = '',
  $challenge = 'http-01',
  $domain = $title,
  $wellknown = '/var/www/html'
) {

  include dehydrated

  # Change hooks to paths
  case $hook {
    'route53': { $hook_path = "${dehydrated::home_directory}/hooks/route53/route53.sh" }
    default: { $hook_path = '' }
  }

  # Ensure present in domains.txt
  concat {"${dehydrated::home_directory}/domains.txt":
    ensure => present
  }

  concat::fragment { 'domain':
    target  => "${dehydrated::home_directory}/domains.txt",
    content => $domain
  }

  # Custom configuration

  # Ensure that domain directory exists
  file { "/etc/dehydrated/certs/${domain}/":
    ensure => directory,
    owner  => $dehydrated::user,
    mode   => '0700'
  }

  file { "/etc/dehydrated/certs/${domain}/config":
    ensure  => file,
    content => epp('dehydrated/config.epp', {
      'hook_path' => $hook_path
    }),
    require => File["/etc/dehydrated/certs/${domain}/"]
  }
}
