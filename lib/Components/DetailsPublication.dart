// ignore_for_file: file_names, library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:project/Models/Post.dart';
import 'package:project/Components/SinglePublication.dart';
import '../Models/global.dart';
import 'Part/BottomIconBar.dart';
import 'Part/header.dart';

class DetailsPublication extends StatefulWidget {
  final Post post;
  const DetailsPublication(this.post, {super.key});

  @override
  _DetailsPublicationState createState() => _DetailsPublicationState(post);
}

const loginText = "Log into $applicationName !";

class _DetailsPublicationState extends State<DetailsPublication> {
  _DetailsPublicationState(Post post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context: context),
      backgroundColor: darkGray,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: white, size: 30)),
          Expanded(child: SinglePublication(widget.post)),
        ],
      ),
      bottomNavigationBar: BottomIconBar(context),
    );
  }
}
