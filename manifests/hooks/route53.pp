# Class for the Route53 Dehydrated hook, any dependencies (eg: AWS CLI) must be installed
# separately.
class dehydrated::hooks::route53 {
  # Git was required to clone Dehydrated in the first place, so we can go right ahead and
  # clone the Route53 hook
  vcsrepo { "${dehydrated::home_directory}/hooks/route53": 
    ensure => latest,
    provider => git,
    source => 'https://github.com/BnMcG/Dehydrated-Hook-Route53.git',
    revision => 'master'
  }
}
