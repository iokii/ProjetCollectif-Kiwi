// ignore_for_file: file_names

import 'package:project/Models/Gallery.dart';
import 'package:project/Models/Save.dart';
import 'package:project/Models/Info.dart';
import 'package:project/Models/Post.dart';

class Profile {
  final String pdp;
  final String name;
  final String typeCompte;
  final String description;
  final int follow;
  final int followers;
  final int like;
  final List<String> actu;
  final List<Post> publications;
  final List<Gallery> listGallery;
  final List<Gallery> listCollect;
  final List<Post> listInfo;

  // ignore: use_key_in_widget_constructors
  Profile(
    this.pdp,
    this.name,
    this.typeCompte,
    this.description,
    this.follow,
    this.followers,
    this.like,
    this.actu,
    this.publications,
    this.listGallery,
    this.listCollect,
    this.listInfo,
  );

  factory Profile.fromJson(Map<String, dynamic> json) {
    var posts = (json['posts'] as List)
        .map((item) => item == null ? null : Post.fromJson(item))
        .where((item) => item != null)
        .toList()
        .cast<Post>();
    var liked = (json['liked'] as List)
        .map((item) => item == null ? null : Post.fromJson(item))
        .where((item) => item != null)
        .toList()
        .cast<Post>();
    var listCollect = [
      Gallery(1, "Mes likes", liked),
    ];
    return Profile(
      json['pdp'] ?? "",
      json['name'] ?? "",
      json['typeCompte'] ?? "",
      json['description'] ?? "",
      json['follow'] ?? 10,
      json['followers'] ?? 10,
      json['like'] ?? 10,
      json['actu'] ?? [],
      posts,
      json['listGallery'] ?? [],
      listCollect,
      json['listInfo'] ?? [],
    );
  }
}
