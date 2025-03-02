import 'dart:convert';

class SongModel {
  final String title;
  final String artist;
  final String album;
  final String coverImage;
  final String previewUrl;
  final int durationMs;
  final int popularity;
  SongModel({
    required this.title,
    required this.artist,
    required this.album,
    required this.coverImage,
    required this.previewUrl,
    required this.durationMs,
    required this.popularity,
  });

  SongModel copyWith({
    String? title,
    String? artist,
    String? album,
    String? coverImage,
    String? previewUrl,
    int? durationMs,
    int? popularity,
  }) {
    return SongModel(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      coverImage: coverImage ?? this.coverImage,
      previewUrl: previewUrl ?? this.previewUrl,
      durationMs: durationMs ?? this.durationMs,
      popularity: popularity ?? this.popularity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'artist': artist,
      'album': album,
      'coverImage': coverImage,
      'previewUrl': previewUrl,
      'durationMs': durationMs,
      'popularity': popularity,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      title: map['title'] as String,
      artist: map['artist'] as String,
      album: map['album'] as String,
      coverImage: map['coverImage'] as String,
      previewUrl: map['previewUrl'] as String,
      durationMs: map['durationMs'] as int,
      popularity: map['popularity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SongModel.fromJson(String source) => SongModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SongModel(title: $title, artist: $artist, album: $album, coverImage: $coverImage, previewUrl: $previewUrl, durationMs: $durationMs, popularity: $popularity)';
  }

  @override
  bool operator ==(covariant SongModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.artist == artist &&
      other.album == album &&
      other.coverImage == coverImage &&
      other.previewUrl == previewUrl &&
      other.durationMs == durationMs &&
      other.popularity == popularity;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      artist.hashCode ^
      album.hashCode ^
      coverImage.hashCode ^
      previewUrl.hashCode ^
      durationMs.hashCode ^
      popularity.hashCode;
  }
}
