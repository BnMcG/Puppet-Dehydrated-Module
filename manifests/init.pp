class dehydrated {
  $user = 'dehydrated'
  $dehydrated_home = '/etc/dehydrated'

  class { 'dehydrated::user' } ->
  class { 'dehydrated::filesystem'}
}
