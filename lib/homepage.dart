import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/DetailsPublication.dart';
import 'package:project/BottomIconBar.dart';
import 'package:project/header.dart';
import 'package:project/Models/Post.dart';
import 'package:project/PostList.dart';
import 'package:provider/provider.dart';
import 'Models/UserStored.dart';
import 'Provider/UserProvider.dart';
import 'global.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const loginText = "Log into $applicationName !";

Future<List<Post>> getPosts(String username) async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/posts/$username'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> data = jsonResponse['data'];
    return data.map((item) => Post.fromJson(item)).toList();
  } else {
    throw Exception(
        'Failed to load posts. Status code: ${response.statusCode}. Response body: ${response.body}');
  }
}

class _HomePageState extends State<HomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late Post _selectedPost;

  @override
  Widget build(BuildContext context) {
    UserStored user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      appBar: header(context: context),
      backgroundColor: darkGray,
      body: FutureBuilder<List<dynamic>>(
        future: getPosts(user.userId),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            var listPosts = snapshot.data!;
            return ListView.builder(
              itemCount: listPosts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPost = listPosts[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsPublication(_selectedPost),
                        ),
                      );
                    });
                  },
                  child: Card(child: PostList(listPosts[index])),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: BottomIconBar(context),
    );
  }
}
