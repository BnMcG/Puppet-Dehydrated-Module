class dehydrated::user {
  # Create a user to run Dehydrated with
  user { $dehydrated::user: 
    ensure => present,
    managehome => present,
    system => true
  }
}
