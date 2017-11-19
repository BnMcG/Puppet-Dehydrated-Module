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
    'route53': { $hook = "${dehydrated::home_directory}/hooks/route53/route53.sh" }
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
  file { "/etc/dehydrated/certs/${domain}/config":
    ensure => file,
    content => epp('dehydrated/config.epp')
  }
}
