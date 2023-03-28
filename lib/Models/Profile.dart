// ignore_for_file: file_names

import 'package:project/post.dart';

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
  final List<String> listGallery;
  final List<String> listCollect;
  final List<String> listInfo;

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
}
