// ignore_for_file: file_names

import 'package:project/Models/Post.dart';

class Gallery {
  final int id;
  final String name;
  final List<Post> listPublication;

  Gallery(this.id, this.name, this.listPublication);
}
