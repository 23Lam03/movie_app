import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class VideoModel {
  String name;
  String key;
  String site;
  int size;
  String type;
  String published_at;
  String id;
  VideoModel({
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.published_at,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'published_at': published_at,
      'id': id,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      name: map['name'] ?? '',
      key: map['key'] ?? '',
      site: map['site'] ?? '',
      size: map['size'] as int,
      type: map['type'] ?? '',
      published_at: map['published_at'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
