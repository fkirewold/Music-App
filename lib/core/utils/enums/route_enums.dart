
enum RouteEnums {
  mainScreen('/','mainScreen'),
  playMusicScreen('/play_music_screen','playMusicScreen');
  final String path;
  final String name;
  const RouteEnums(this.path,this.name);
}