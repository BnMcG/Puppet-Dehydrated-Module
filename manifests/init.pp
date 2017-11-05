class dehydrated {
  $user = 'dehydrated'

  $etc_directory = '/etc/dehydrated'
  $home_directory = '/home/dehydrated'

  class { 'dehydrated::user': } ->
  class { 'dehydrated::repository': } ->
  class { 'dehydrated::filesystem': } ->
  class { 'dehydrated::domains': }
}
