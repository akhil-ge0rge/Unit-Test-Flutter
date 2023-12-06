// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

PhotoModel photoModelFromJson(String str) =>
    PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class PhotoModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotoModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };

  @override
  String toString() {
    return 'PhotoModel(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }
}
