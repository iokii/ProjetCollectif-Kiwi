import 'package:flutter/material.dart';
import 'package:project/Models/Post.dart';

class SinglePublication extends StatefulWidget {
  final Post post;
  const SinglePublication(this.post);

  @override
  _SinglePublicationState createState() => _SinglePublicationState(post);
}

class _SinglePublicationState extends State<SinglePublication> {
  _SinglePublicationState(Post post);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xFF323232),
        shadowColor: Colors.transparent,
        child: SingleChildScrollView(
            child: Column(children: [
          Column(
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
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image(
                  image: NetworkImage(widget.post.urlMedia),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                  icon: const Icon(Icons.star),
                  color: widget.post.liked ? Colors.yellow : Colors.white,
                  onPressed: () {
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
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.post.desc,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ])));
  }
}
