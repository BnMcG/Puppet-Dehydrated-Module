class dehydrated (
  String  $user,
  String  $password,
  String  $etc_directory,
  String  $home_directory
) {
  class { 'dehydrated::user': } ->
  class { 'dehydrated::repository': } ->
  class { 'dehydrated::filesystem': } ->
  class { 'dehydrated::domains': }
}
