// ignore_for_file: file_names, no_logic_in_create_state, library_private_types_in_public_api, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:project/Data/User.dart';
import 'package:project/Models/Post.dart';
import 'package:project/Models/global.dart';
import 'package:project/Page/ExtractArgumentsProfile.dart';
import 'package:provider/provider.dart';

import '../Models/Profile.dart';


class SinglePublication extends StatefulWidget {
  final Post post;
  const SinglePublication(this.post, {super.key});

  @override
  _SinglePublicationState createState() => _SinglePublicationState(post);
}

class _SinglePublicationState extends State<SinglePublication> {
  _SinglePublicationState(Post post);
  final postService = PostService();

  late List<Profile> listUser;
  late int link;

  @override
  Widget build(BuildContext context) {
    UserStored user = Provider.of<UserProvider>(context, listen: false).user;
    return Card(
        color: const Color(0xFF323232),
        shadowColor: Colors.transparent,
        child: SingleChildScrollView(
            child: Column(children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  listUser =
                      Provider.of<DataUser>(context, listen: false).users();

                  Navigator.pushNamed(context, ExtractArgumentsProfile.profile,
                      arguments: listUser
                          .where(
                              (element) => element.name == widget.post.author)
                          .toList()[0]);
                },
                child: Row(children: [
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image(
                  image: NetworkImage(widget.post.urlMedia),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                  icon: const Icon(Icons.star),
                  color: widget.post.isLiked ? Colors.yellow : white,

                  onPressed: () {
                    setState(() {
                      postService.changeLikeStateOnPost(
                          widget.post.postId, user.userId);
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
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.post.desc,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: white),
                    ),
                  )),
            ],
          ),
        ])));
  }
}
