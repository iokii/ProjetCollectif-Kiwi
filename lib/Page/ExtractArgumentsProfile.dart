// A Widget that extracts the necessary arguments from
// the ModalRoute.
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:project/Components/Part/ProfileHeader.dart';
import 'package:project/Components/ProfileActu.dart';
import 'package:project/Components/ProfileCollection.dart';
import 'package:project/Components/ProfileInfo.dart';
import 'package:project/Components/ProfilePost.dart';
import 'package:project/Models/Profile.dart';


import 'package:project/Models/Post.dart';
import 'package:provider/provider.dart';

import '../Components/Part/BottomIconBar.dart';
import '../Components/Part/header.dart';
import '../Models/UserStored.dart';
import '../Models/global.dart';
import '../Provider/UserProvider.dart';
import '../Services/ProfileService.dart';

class ExtractArgumentsProfile extends StatefulWidget {
  const ExtractArgumentsProfile({super.key});
  static const profile = '/profile';

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ExtractArgumentsProfile> {
  late Profile profile;
  final profileService = ProfileService();
  @override
  Widget build(BuildContext context) {
    UserStored user = Provider.of<UserProvider>(context, listen: false).user;
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    // ignore: unused_local_variable
    final args = ModalRoute.of(context)!.settings.arguments as Profile;

    //Request DB avec args pour l'id discuss

    return Scaffold(
        appBar: header(showParameter: true, context: context),
        backgroundColor: const Color(0xFF323232),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          ProfileHeader(args),
          SizedBox(height: 30),
          if (args.actu.isNotEmpty)
            ProfileActu(listActu: args.actu)
          else
            SizedBox(height: 50),
          Expanded(
            flex: 3,
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: darkGray,
                  toolbarHeight: 0,
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.photo_camera)),
                      Tab(icon: Icon(Icons.menu_book_rounded)),
                      Tab(icon: Icon(Icons.bookmark)),
                      Tab(icon: Icon(Icons.info_outlined)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    ProfilePost(args.publications),
                    ProfileCollection(args.listGallery, "gallery"),
                    ProfileCollection(args.listCollect, "Collection"),
                    ProfileInfo(args.listInfo),
                  ],
                ),
              ),
            ),
          )
        ]),
        bottomNavigationBar: BottomIconBar(context));
  }
}

class ScreenArguments {}
