class dehydrated (
  String  $user,
  String  $group,
  String  $etc_directory,
  String  $home_directory
) {
  class { 'dehydrated::user': } ->
  class { 'dehydrated::repository': } ->
  class { 'dehydrated::filesystem': } ->
  class { 'dehydrated::domains': }
}
