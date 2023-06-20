import 'package:flutter/material.dart';
import 'package:project/Models/Post.dart';
import 'package:provider/provider.dart';

import '../Components/DetailsPublication.dart';
import '../Components/Part/BottomIconBar.dart';
import '../Components/Part/header.dart';
import '../Components/PostList.dart';
import '../Models/UserStored.dart';
import '../Models/global.dart';
import '../Provider/UserProvider.dart';
import '../Services/PostService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

const loginText = "Log into $applicationName !";

class _HomePageState extends State<HomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late Post _selectedPost;
  final postService = PostService();

  @override
  Widget build(BuildContext context) {
    UserStored user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      appBar: header(context: context, artist: true),
      backgroundColor: darkGray,
      body: FutureBuilder<List<dynamic>>(
        future: postService.getPosts(user.userId),
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

          return CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: BottomIconBar(context),
    );
  }
}
