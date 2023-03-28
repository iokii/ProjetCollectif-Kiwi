import 'package:flutter/material.dart';
import 'package:project/footer.dart';
import 'package:project/header.dart';
import 'package:project/Models/Post.dart';
import 'package:project/Components/SinglePublication.dart';
import 'global.dart';

class DetailsPublication extends StatefulWidget {
  final Post post;
  const DetailsPublication(this.post);

  @override
  _DetailsPublicationState createState() => _DetailsPublicationState(post);
}

const loginText = "Log into $applicationName !";

class _DetailsPublicationState extends State<DetailsPublication> {
  _DetailsPublicationState(Post post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      backgroundColor: darkGray,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.pushNamed(context, '/homepage');
              },
              icon:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 30)),
          Expanded(child: SinglePublication(widget.post)),
        ],
      ),
      bottomNavigationBar: footer(context),
    );
  }
}
