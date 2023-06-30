// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:project/Components/Part/BottomIconBar.dart';
import 'package:project/Components/Part/header.dart';
import 'package:project/Components/showPostInRow.dart';
import 'package:project/Data/Posts.dart';
import 'package:project/Models/Post.dart';
import 'package:project/Models/global.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const route = "/search";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //TODO : query de l'algo de référence
  List<Post> posts = listPostsSearch;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context: context),
      backgroundColor: darkGray,
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      //TODO recherche DB et tout charget dans la var "posts"
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: white,
                  ),
                ),
                labelText: "Recherche",
                labelStyle: const TextStyle(color: white),
                fillColor: lightGray,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
          ),
        ),
        showPostInRow(
          posts: posts,
          heightMult: 0.75025484,
        ),
      ]),
      bottomNavigationBar: BottomIconBar(context),
    );
  }
}
