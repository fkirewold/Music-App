// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SongModel {
  final String title;
  final String artist;
  final String album;
  final String coverImageUrl;
  final String previewUrl;
  final int durationMs;
  SongModel({
    required this.title,
    required this.artist,
    required this.album,
    required this.coverImageUrl,
    required this.previewUrl,
    required this.durationMs,
  });

  SongModel copyWith({
    String? title,
    String? artist,
    String? album,
    String? coverImage,
    String? previewUrl,
    int? durationMs,
  }) {
    return SongModel(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      coverImageUrl: coverImage ?? this.coverImageUrl,
      previewUrl: previewUrl ?? this.previewUrl,
      durationMs: durationMs ?? this.durationMs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'artist': artist,
      'album': album,
      'coverImage': coverImageUrl,
      'previewUrl': previewUrl,
      'durationMs': durationMs,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> json) {
    return SongModel(
      title: json['name'],
      album: json['album']['album_type'],
      artist: json['artists'][0]['name'],
      coverImageUrl: json['album']['images'][0]['url'],
      previewUrl: json['preview_url'] ?? "",
      durationMs: 129,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongModel.fromJson(String source) =>
      SongModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SongModel(title: $title, artist: $artist, album: $album, coverImage: $coverImageUrl, previewUrl: $previewUrl, durationMs: $durationMs)';
  }

  @override
  bool operator ==(covariant SongModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.artist == artist &&
        other.album == album &&
        other.coverImageUrl == coverImageUrl &&
        other.previewUrl == previewUrl &&
        other.durationMs == durationMs;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        artist.hashCode ^
        album.hashCode ^
        coverImageUrl.hashCode ^
        previewUrl.hashCode ^
        durationMs.hashCode;
  }
}
