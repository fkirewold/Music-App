import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:music_app/models/song_model.dart';

class SongRepository {
  final String _clientId = '0a73da2c8c634c62af378ffdaa7c7af8';
  final String _clientSecret = '2656040e52a5455283bb640f44dc7bcb';

  Future<String?> getAccessToken() async {
    final url = Uri.parse("https://accounts.spotify.com/api/token");
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "grant_type": "client_credentials",
        "client_id": _clientId,
        "client_secret": _clientSecret,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse["access_token"];
    } else {
      print("Error getting token: ${response.body}");
      return null;
    }
  }
Future<List<SongModel>> fetchSongs() async {
  final url = 'https://api.spotify.com/v1/search?q=pop&type=track&limit=30';
  final token = getAccessToken();

  final response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer $token'},
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> tracks = data['tracks']['items'];
    return tracks.map((track) => SongModel.fromJson(track)).toList();
  } else {
    throw ('Failed to load songs');
  }
  }


  Future<SongModel?> searchSong(String query) async {
    final token = await getAccessToken();
    if (token == null) return null;

    final url = Uri.parse(
        "https://api.spotify.com/v1/search?q=$query&type=track&limit=5");
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final track = jsonResponse["tracks"]["items"][0];
      return SongModel.fromJson(track); // Convert JSON to Song model
    } else {
      print("Error searching song: ${response.body}");
      return null;
    }
  }
}
