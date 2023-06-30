// ignore_for_file: file_names, no_logic_in_create_state, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/Components/showPostInRow.dart';
import 'package:project/Models/Post.dart';

class ProfilePost extends StatefulWidget {
  final List<Post> listPost;
  const ProfilePost(this.listPost, {super.key});

  @override
  _ProfilePostState createState() => _ProfilePostState(listPost);
}

class _ProfilePostState extends State<ProfilePost> {
  _ProfilePostState(List<Post> listPost);

  @override
  Widget build(BuildContext context) {
    return showPostInRow(
      posts: widget.listPost,
      heightMult: 1,
    );
  }
}
