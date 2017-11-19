# Class for Let's Encrypt certificate resources
define dehydrated::certificate(
  $hook,
  $challenge,
  $domain = $title
) {

  include dehydrated

  # Ensure present in domains.txt
  concat {"${dehydrated::home_directory}/domains.txt":
    ensure => present
  }

  concat::fragment { 'domain':
    target  => "${dehydrated::home_directory}/domains.txt",
    content => $domain
  }
}
