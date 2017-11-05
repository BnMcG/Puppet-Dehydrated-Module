# Class for the Route53 Dehydrated hook, any dependencies (eg: AWS CLI) must be installed
# separately.
class dehydrated::hooks::route53 (
  String  $aws_hosted_zone,
  String  $aws_profile
) {
  # Git was required to clone Dehydrated in the first place, so we can go right ahead and
  # clone the Route53 hook
  vcsrepo { "${dehydrated::home_directory}/hooks/route53": 
    ensure => latest,
    provider => git,
    source => 'https://github.com/BnMcG/Dehydrated-Hook-Route53.git',
    revision => 'master'
  } ->

  # After the repository has been cloned, we need to create a configuration file with the
  # values we pull from Hiera. These are used to communicate with Route53
  file { "${dehydrated::home_directory}/hooks/route53/route53.json":
    ensure => file,
    content => epp('dehydrated/hooks/route53.json.epp')
  }
}
