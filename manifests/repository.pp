# Class to manage the Dehydrated Git repository. The Dehydrated application is deployed
# from here
class dehydrated::repository {
  # Ensure Git is installed
  package { 'git': 
    ensure => latest
  } ->

  # Clone the repository
  vcsrepo { '/etc/dehydrated': 
    ensure => latest,
    provider => git,
    source => 'https://github.com/lukas2511/dehydrated.git',
    revision => 'master'
  }

}
