import 'package:flutter/material.dart';
import 'package:project/global.dart';
import 'package:project/Models/Post.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'Models/UserStored.dart';
import 'Provider/UserProvider.dart';

class PostList extends StatefulWidget {
  final Post post;
  const PostList(this.post);

  @override
  _PostListState createState() => _PostListState(post);
}

Future<void> changeLikeStateOnPost(String postId, String userId) async {
  final response = await http
      .put(Uri.parse('http://localhost:3000/posts/$postId/like/$userId'));
}

class _PostListState extends State<PostList> {
  _PostListState(Post post);

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
                    style: const TextStyle(color: Colors.white)),
              ),
            ]),
            Image.network(
              widget.post.urlMedia,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                icon: const Icon(Icons.star),
                color: widget.post.liked ? Colors.yellow : Colors.white,
                onPressed: () {
                  changeLikeStateOnPost(widget.post.postId, user.userId);
                  setState(() {
                    widget.post.liked = !widget.post.liked;
                  });
                },
              ),
              Flexible(
                child: Text(widget.post.title,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    overflow: TextOverflow.ellipsis),
              ),
              IconButton(
                icon: const Icon(Icons.collections),
                color: Colors.white,
                onPressed: () {
                  setState(() {});
                },
              ),
            ]),
          ],
        ));
  }
}
