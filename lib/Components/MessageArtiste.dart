// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:project/Components/TabArtist.dart';
import 'package:project/Models/global.dart';

class MessageArtiste extends StatefulWidget {
  const MessageArtiste({super.key});

  @override
  _MessageArtisteState createState() => _MessageArtisteState();
}

class _MessageArtisteState extends State<MessageArtiste> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8585,
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: darkGray,
                    toolbarHeight: 0,
                    bottom: const TabBar(tabs: [
                      Tab(
                        icon: Icon(
                          Icons.pending,
                          color: white,
                        ),
                      ),
                      Tab(
                          icon: Icon(
                        Icons.thumbs_up_down_rounded,
                        color: white,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.auto_awesome,
                        color: white,
                      )),
                    ]),
                  ),
                  body: TabBarView(children: [
                    TabArtist(actualTab: 0),
                    TabArtist(actualTab: 1),
                    TabArtist(actualTab: 2)
                  ]),
                ),
              ),
            )
          ],
        ),
        // SizedBox(
        //     width: MediaQuery.of(context).size.width,
        //     height: MediaQuery.of(context).size.height * 0.7585626, //précision
        //     child: ListView.builder(
        //       itemCount: listMsg.length,
        //       itemBuilder: (context, index) =>
        //           SingleMessage(context, listMsg[index]),
        //     )),
      ],
    );
  }
}
