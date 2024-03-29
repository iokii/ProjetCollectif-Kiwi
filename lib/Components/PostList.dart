// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project/Models/Post.dart';
import 'package:provider/provider.dart';

import '../Models/UserStored.dart';
import '../Provider/UserProvider.dart';
import '../Services/PostService.dart';

import '../Models/global.dart';

class PostList extends StatefulWidget {
  final Post post;
  const PostList(this.post, {super.key});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _PostListState createState() => _PostListState(post);
}

class _PostListState extends State<PostList> {
  _PostListState(Post post);
  final postService = PostService();

  @override
  Widget build(BuildContext context) {
    UserStored user = Provider.of<UserProvider>(context, listen: false).user;

    return Container(
        color: semiLightGray,
        child: Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3, left: 3),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.post.authorPfp),
                  maxRadius: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(widget.post.author,
                    style: const TextStyle(color: white)),
              ),
            ]),
            Image.network(
              widget.post.urlMedia,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                icon: const Icon(Icons.star),

                color: widget.post.isLiked ? Colors.yellow : white,

                onPressed: () {
                  postService.changeLikeStateOnPost(
                      widget.post.postId, user.userId);
                  setState(() {
                    widget.post.liked = !widget.post.liked;
                  });
                },
              ),
              Flexible(
                child: Text(widget.post.title,
                    style: const TextStyle(color: white, fontSize: 16),
                    overflow: TextOverflow.ellipsis),
              ),
              IconButton(
                icon: const Icon(Icons.collections),
                color: white,
                onPressed: () {
                  setState(() {});
                },
              ),
            ]),
          ],
        ));
  }
}
