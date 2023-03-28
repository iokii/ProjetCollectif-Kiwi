// A Widget that extracts the necessary arguments from
// the ModalRoute.
// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/Discussion.dart';
import 'package:project/Models/Profile.dart';

import '../footer.dart';
import '../header.dart';
import '../Models/TextDiscuss.dart';
import 'package:project/global.dart';

import '../post.dart';

class ExtractArgumentsProfile extends StatefulWidget {
  ExtractArgumentsProfile({super.key});
  static const profile = '/profile';

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ExtractArgumentsProfile> {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
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
            "https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png",
            ""),
        Post(
            "La Joconde",
            "Petit dessin pepouze",
            "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ-FvbbAq5IaJUhtwxXEwY0D-jiZju02ejnNHx_bQWL_27GF3srhwJgqusMAqKh3QqU",
            "De Vinci",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQTpymriyzhjQEivOvItdFuSWXQJkJZ0jXgenzThOXA&s",
            ""),
      ],
      List.empty(),
      List.empty(),
      List.empty(),
    );

    return Scaffold(
        appBar: header(),
        backgroundColor: const Color(0xFF323232),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 50, top: 30),
              child: CircleAvatar(
                backgroundImage: NetworkImage(profile.pdp),
                radius: 40,
              ),
            ),
            SizedBox(width: 35),
            Padding(
              padding: EdgeInsets.only(left: 0, top: 45),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    profile.name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.left,
                    profile.typeCompte,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            profile.followers.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "abonnés",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            profile.follow.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "abonnements",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
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
                    radius: 25,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: darkGray,
                  toolbarHeight: 0,
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.directions_car)),
                      Tab(icon: Icon(Icons.directions_transit)),
                      Tab(icon: Icon(Icons.directions_bike)),
                      Tab(icon: Icon(Icons.directions_bike)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Container(
                      child: Text("boop"),
                      color: darkGray,
                    ),
                    Container(
                      child: Text("boop"),
                      color: darkGray,
                    ),
                    Container(
                      child: Text("boop"),
                      color: darkGray,
                    ),
                    Container(
                      child: Text("boop"),
                      color: darkGray,
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
        bottomNavigationBar: footer(context));
  }
}

class ScreenArguments {}
