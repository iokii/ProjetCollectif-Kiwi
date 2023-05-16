// A Widget that extracts the necessary arguments from
// the ModalRoute.
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Components/ExtractArgumentsCollection.dart';
import 'package:project/Models/ArgumentScreenCollection.dart';
import 'package:project/Models/Gallery.dart';
import 'package:project/Models/Profile.dart';

import '../Models/Info.dart';
import '../footer.dart';
import '../header.dart';
import 'package:project/global.dart';

import '../post.dart';

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
        Info(1, "boop",
            "https://www.cip-national.fr/wp-content/uploads/2020/06/EQ5jGdc4BcDpCoXWO9mhTw1lrvo.png")
      ],
    );

    return Scaffold(
        appBar: header(showParameter: true, context: context),
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
                    Container(
                      color: darkGray,
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: const {
                            0: FractionColumnWidth(.3),
                            1: FractionColumnWidth(.3),
                            2: FractionColumnWidth(.3),
                          },
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: Column(children: [
                                  if (profile.publications.isNotEmpty)
                                    for (int i = 0;
                                        i < profile.publications.length;
                                        i += 3)
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, right: 0),
                                          child: Image.network(
                                            profile.publications[i].urlMedia,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.31,
                                          )),
                                ]),
                              ),
                              TableCell(
                                child: Column(children: [
                                  if (profile.publications.length > 1)
                                    for (int i = 1;
                                        i < profile.publications.length;
                                        i += 3)
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, right: 0),
                                          child: Row(children: [
                                            Image.network(
                                              profile.publications[i].urlMedia,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.31,
                                            ),
                                          ])),
                                ]),
                              ),
                              TableCell(
                                child: Column(children: [
                                  if (profile.publications.length > 2)
                                    for (int i = 2;
                                        i < profile.publications.length;
                                        i += 3)
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, right: 0),
                                        child: Image.network(
                                          profile.publications[i].urlMedia,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.31,
                                        ),
                                      ),
                                ]),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: darkGray,
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: const {
                            0: FractionColumnWidth(.5),
                            1: FractionColumnWidth(.5),
                          },
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: Column(children: [
                                  if (profile.listGallery.isNotEmpty)
                                    for (int i = 0;
                                        i < profile.listGallery.length;
                                        i += 2)
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: InkWell(
                                            onTap: () => {
                                              Navigator.pushNamed(
                                                  context,
                                                  ExtractArgumentsCollection
                                                      .collection,
                                                  arguments:
                                                      ArgumentScreenCollection(
                                                          profile
                                                              .listGallery[i],
                                                          "gallery"))
                                            },
                                            child: ClipRRect(
                                                child: Column(
                                              children: [
                                                Image.network(
                                                  profile
                                                      .listGallery[i]
                                                      .listPublication[0]
                                                      .urlMedia,
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                                Text(
                                                    profile.listGallery[i].name,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17))
                                              ],
                                            )),
                                          ))
                                ]),
                              ),
                              TableCell(
                                child: Column(children: [
                                  if (profile.listGallery.length > 1)
                                    for (int i = 1;
                                        i < profile.listGallery.length;
                                        i += 2)
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: InkWell(
                                            onTap: () => {
                                              Navigator.pushNamed(
                                                context,
                                                ExtractArgumentsCollection
                                                    .collection,
                                                arguments:
                                                    ArgumentScreenCollection(
                                                        profile.listGallery[i],
                                                        "gallery"),
                                              )
                                            },
                                            child: ClipRRect(
                                                child: Column(
                                              children: [
                                                Image.network(
                                                  profile
                                                      .listGallery[i]
                                                      .listPublication[0]
                                                      .urlMedia,
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                                Text(
                                                    profile.listGallery[i].name,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17))
                                              ],
                                            )),
                                          ))
                                ]),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: darkGray,
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: const {
                            0: FractionColumnWidth(.5),
                            1: FractionColumnWidth(.5),
                          },
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: Column(children: [
                                  if (profile.listCollect.isNotEmpty)
                                    for (int i = 0;
                                        i < profile.listCollect.length;
                                        i += 2)
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              ExtractArgumentsCollection
                                                  .collection,
                                              arguments:
                                                  ArgumentScreenCollection(
                                                      profile.listCollect[i],
                                                      "Collection"),
                                            );
                                          },
                                          child: ClipRRect(
                                              child: Column(
                                            children: [
                                              Image.network(
                                                profile
                                                    .listCollect[i]
                                                    .listPublication[0]
                                                    .urlMedia,
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                              Text(profile.listCollect[i].name,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17))
                                            ],
                                          )),
                                        ),
                                      )
                                ]),
                              ),
                              TableCell(
                                child: Column(children: [
                                  if (profile.listCollect.length > 1)
                                    for (int i = 1;
                                        i < profile.listCollect.length;
                                        i += 2)
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              ExtractArgumentsCollection
                                                  .collection,
                                              arguments:
                                                  ArgumentScreenCollection(
                                                      profile.listCollect[i],
                                                      "Collection"),
                                            );
                                          },
                                          child: ClipRRect(
                                              child: Column(
                                            children: [
                                              Image.network(
                                                profile
                                                    .listCollect[i]
                                                    .listPublication[0]
                                                    .urlMedia,
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                              Text(profile.listCollect[i].name,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17))
                                            ],
                                          )),
                                        ),
                                      )
                                ]),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: darkGray,
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: const {
                            0: FractionColumnWidth(.25),
                            1: FractionColumnWidth(.25),
                            2: FractionColumnWidth(.25),
                            3: FractionColumnWidth(.25),
                          },
                          children: [
                            for (int i = 0; i < profile.listInfo.length; i += 4)
                              TableRow(children: [
                                TableCell(
                                    child: Column(children: [
                                  ClipRRect(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 15, left: 15, right: 15),
                                        child: Image.network(
                                          profile.listInfo[i].media,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Text(
                                    profile.listInfo[i].name,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ])),
                                TableCell(
                                    child: Column(children: [
                                  if (i + 2 < profile.listInfo.length)
                                    ClipRRect(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 15, right: 15),
                                          child: Image.network(
                                            profile.listInfo[i + 1].media,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  if (i + 2 < profile.listInfo.length)
                                    Text(
                                      profile.listInfo[i + 1].name,
                                      style: TextStyle(color: Colors.white),
                                    )
                                ])),
                                TableCell(
                                    child: Column(children: [
                                  if (i + 3 < profile.listInfo.length)
                                    ClipRRect(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 15, right: 15),
                                          child: Image.network(
                                            profile.listInfo[i + 2].media,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  if (i + 3 < profile.listInfo.length)
                                    Text(
                                      profile.listInfo[i + 2].name,
                                      style: TextStyle(color: Colors.white),
                                    )
                                ])),
                                TableCell(
                                    child: Column(children: [
                                  if (i + 4 < profile.listInfo.length)
                                    ClipRRect(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 15, right: 15),
                                          child: Image.network(
                                            profile.listInfo[i + 3].media,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  if (i + 4 < profile.listInfo.length)
                                    Text(
                                      profile.listInfo[i + 3].name,
                                      style: TextStyle(color: Colors.white),
                                    )
                                ])),
                              ])
                          ],
                        ),
                      ),
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
