class dehydrated (
  String  $user,
  String  $group,
  String  $etc_directory,
  String  $home_directory
) {
  # Include the classes required to setup Dehydrated
  Class['dehydrated::user'] ->
  Class['dehydrated::repository'] ->
  Class['dehydrated::filesystem'] ->
  Class['dehydrated::domains']
}
