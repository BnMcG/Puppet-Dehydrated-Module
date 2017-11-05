class dehydrated (
  String  $user,
  String  $group,
  String  $etc_directory,
  String  $home_directory
) {
  # Include the classes required to setup Dehydrated
  include dehydrated::user
  include dehydrated::repository
  include dehydrated::filesystem
  include dehydrated::domains

  Class['dehydrated::user'] ->
  Class['dehydrated::repository'] ->
  Class['dehydrated::filesystem'] ->
  Class['dehydrated::domains']
}
