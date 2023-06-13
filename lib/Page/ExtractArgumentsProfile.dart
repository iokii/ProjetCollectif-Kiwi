// A Widget that extracts the necessary arguments from
// the ModalRoute.
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:project/Components/Part/ProfileHeader.dart';
import 'package:project/Components/ProfileCollection.dart';
import 'package:project/Components/ProfileInfo.dart';
import 'package:project/Components/ProfilePost.dart';
import 'package:project/Models/Gallery.dart';
import 'package:project/Models/Profile.dart';

import 'package:project/Models/Post.dart';

import '../Components/Part/BottomIconBar.dart';
import '../Components/Part/header.dart';
import '../Models/global.dart';

class ExtractArgumentsProfile extends StatefulWidget {
  const ExtractArgumentsProfile({super.key});
  static const profile = '/profile';

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ExtractArgumentsProfile> {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    // ignore: unused_local_variable
    final args = ModalRoute.of(context)!.settings.arguments as int;

    //Request DB avec args pour l'id discuss
    Profile profile = Profile(
      "https://avatars.githubusercontent.com/u/98802482?v=4",
      "Fitz",
      "Voyageur",
      "Boop",
      69,
      42,
      0,
      [
        "https://cdn.lospec.com/avatar/mastrix.png",
        "https://media.discordapp.net/attachments/918399247857123328/948569324656951386/unknown.png?width=615&height=661"
      ],
      [
        Post(
            "Giga photo avec la team ou quoi la ah oui",
            "Une image de coucher de soleil sur l'océan: Les nuances dorées et oranges du soleil couchant se reflètent sur les vagues calmes de l'océan. Le ciel est rempli de nuages ​​roses et pourpres, créant un spectacle magnifique et paisible.",
            "https://www.photo-paysage.com/albums/userpics/10001/thumb_Crepuscule_sur_le_lac_Leman.jpg",
            "Romain ou quoi",
            "https://avatars.githubusercontent.com/u/98802482?v=4",
            ""),
        Post(
            "La Joconde",
            "Petit dessin pepouze",
            "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ-FvbbAq5IaJUhtwxXEwY0D-jiZju02ejnNHx_bQWL_27GF3srhwJgqusMAqKh3QqU",
            "De Vinci",
            "https://avatars.githubusercontent.com/u/98802482?v=4",
            ""),
        Post(
            "Ouais",
            "oué",
            "https://pbs.twimg.com/profile_images/1389204011589459972/OBN9k6dH_400x400.jpg",
            "oai",
            "https://avatars.githubusercontent.com/u/98802482?v=4",
            ""),
        Post(
            "Oshi no ko",
            "Ai",
            "https://image.over-blog.com/RPg2aYflqYfwUqgl31QJsQxYIO4=/filters:no_upscale()/image%2F0715535%2F20221221%2Fob_7c67b0_oshinoko-gekijousenkouvisual.jpg",
            "ouai",
            "https://avatars.githubusercontent.com/u/98802482?v=4",
            ""),
      ],
      [
        Gallery(1, "Art", [
          Post(
              "Oshi no ko",
              "Ai",
              "https://image.over-blog.com/RPg2aYflqYfwUqgl31QJsQxYIO4=/filters:no_upscale()/image%2F0715535%2F20221221%2Fob_7c67b0_oshinoko-gekijousenkouvisual.jpg",
              "ouai",
              "https://avatars.githubusercontent.com/u/98802482?v=4",
              ""),
        ]),
        Gallery(2, "Photo", [
          Post(
              "Giga photo avec la team ou quoi la ah oui",
              "Une image de coucher de soleil sur l'océan: Les nuances dorées et oranges du soleil couchant se reflètent sur les vagues calmes de l'océan. Le ciel est rempli de nuages ​​roses et pourpres, créant un spectacle magnifique et paisible.",
              "https://www.photo-paysage.com/albums/userpics/10001/thumb_Crepuscule_sur_le_lac_Leman.jpg",
              "Romain ou quoi",
              "https://avatars.githubusercontent.com/u/98802482?v=4",
              ""),
        ])
      ],
      [
        Gallery(1, "Tableaux", [
          Post(
              "La Joconde",
              "Petit dessin pepouze",
              "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ-FvbbAq5IaJUhtwxXEwY0D-jiZju02ejnNHx_bQWL_27GF3srhwJgqusMAqKh3QqU",
              "De Vinci",
              "https://avatars.githubusercontent.com/u/98802482?v=4",
              ""),
        ])
      ],
      [
        Post(
            "boop",
            "Mon interview sur TF1 !!!!",
            "https://www.cip-national.fr/wp-content/uploads/2020/06/EQ5jGdc4BcDpCoXWO9mhTw1lrvo.png",
            "Fitz",
            "https://avatars.githubusercontent.com/u/98802482?v=4",
            ""),
        Post(
            "pomme",
            "Mon interview sur TF1 !!!!",
            "https://www.cip-national.fr/wp-content/uploads/2020/06/EQ5jGdc4BcDpCoXWO9mhTw1lrvo.png",
            "Fitz",
            "https://avatars.githubusercontent.com/u/98802482?v=4",
            "")
      ],
    );

    return Scaffold(
        appBar: header(showParameter: true, context: context),
        backgroundColor: const Color(0xFF323232),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          ProfileHeader(profile),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: Text(
              "Actualités :",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profile.actu.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profile.actu[index]),
                    radius: 30,
                  ),
                ),
              ),
            ),
          ),
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
                    ProfilePost(profile.publications),
                    ProfileCollection(profile.listGallery, "gallery"),
                    ProfileCollection(profile.listCollect, "Collection"),
                    ProfileInfo(profile.listInfo),
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
