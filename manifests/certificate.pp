# Class for Let's Encrypt certificate resources
class dehydrated::certificate(
  $hook,
  $challenge,
  $domain = $title
) {

  # Ensure present in domains.txt
  concat {"${dehydrated::home_directory}/domains.txt":
    ensure => present
  }

  concat::fragment { 'domain':
    target  => "${dehydrated::home_directory}/domains.txt",
    content => $domain
  }
}
