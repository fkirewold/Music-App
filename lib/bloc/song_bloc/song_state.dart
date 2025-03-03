

import 'package:music_app/models/song_model.dart';

abstract class SongState {
  const SongState();
}
final class SongIntialState extends SongState{}
final class SongLoading extends SongState{}
final class SongLoaded extends SongState{
  final List<SongModel> songs;
    SongLoaded({required this.songs});
    SongLoaded copyWith({
    List<SongModel>? songs,
  }) {
    return SongLoaded(
      songs:songs ?? this.songs, // Use existing songs if no new songs are provided
    );
  }


}
final class SongError extends SongState{
  final String error;

  SongError({required this.error});

}