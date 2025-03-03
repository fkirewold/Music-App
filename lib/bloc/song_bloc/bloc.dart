

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/song_bloc/song_event.dart';
import 'package:music_app/bloc/song_bloc/song_state.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/repository/song_repository.dart';
import 'package:http/http.dart' as http;



class SongBloc extends Bloc<SongEvent,SongState>{
  final  SongRepository repository;
   SongBloc({required this.repository})
 :
super(SongIntialState())
{
on<FetchSongEvent>(_onFetchSong);

}

_onFetchSong(FetchSongEvent event,Emitter emit) async{
  final url = 'https://api.spotify.com/v1/search?q=pop&type=track&limit=30';
 final String? token= await repository.getAccessToken();
  emit(SongLoading());
try{
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token'},);
       if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> tracks = data['tracks']['items'];
    List<SongModel> songzzList= tracks.map((track) => SongModel.fromJson(track)).toList();
  } else {
    throw Exception('Failed to load songs');
  }

}
catch(e)
{
emit(SongError(error: e.toString()));
}

}


 




}