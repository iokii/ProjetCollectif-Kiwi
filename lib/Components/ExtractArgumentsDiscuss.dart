// A Widget that extracts the necessary arguments from
// the ModalRoute.
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Models/Discussion.dart';
import 'package:project/Models/Message.dart';
import 'package:project/Models/discuss.dart';

import '../footer.dart';
import '../header.dart';
import '../Models/TextDiscuss.dart';

class ExtractArgumentsDiscuss extends StatefulWidget {
  const ExtractArgumentsDiscuss({super.key});
  static const discuss = '/discuss';

  @override
  State<StatefulWidget> createState() => _DiscussPageState();
}

class _DiscussPageState extends State<ExtractArgumentsDiscuss> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    // final args = ModalRoute.of(context)!.settings.arguments as String;
    final args = ModalRoute.of(context)!.settings.arguments as Discuss;

    //Request DB avec args pour l'id discuss
    Discussion discuss = Discussion(
        "Fitz", "https://avatars.githubusercontent.com/u/98802482?v=4", [
      TextDiscuss("0", "Beauty Fitz"),
      TextDiscuss("1", "boop"),
      TextDiscuss("0", "Hehehe"),
    ]);

    List<Widget> messages() {
      // ignore: deprecated_member_use, prefer_collection_literals
      List<Widget> list = [];

      for (int i = 0; i < discuss.messages.length; i++) {
        if (discuss.messages[i].idUser == "0") {
          list.add(Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(discuss.pdp),
                radius: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        discuss.username,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    margin: const EdgeInsets.only(left: 10, bottom: 30),
                    color: const Color(0xFF979797),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 5, bottom: 5, right: 15),
                      child: Text(
                        discuss.messages[i].mess,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ));
        } else {
          list.add(Container(
              margin: const EdgeInsets.only(right: 25),
              alignment: Alignment.topRight,
              child: Container(
                width: 200,
                color: const Color(0xFF00C2DD),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 5, bottom: 5, right: 15),
                  child: Text(
                    discuss.messages[i].mess,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )));
        }
      }
      return list; // all widget added now retrun the list here
    }

    return Scaffold(
        appBar: header(context: context),
        backgroundColor: const Color(0xFF323232),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Card(
                color: const Color(0xFF323232),
                elevation: 0,
                child: Column(children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/message');
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 15))
                ])),
          ),
          SizedBox(
            height: 530,
            child: Column(children: messages()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // ignore: prefer_const_literals_to_create_immutables
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width - 140,
                    decoration: BoxDecoration(
                        color: Color(0xFF00C2DD),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  )),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
                color: Color(0xFF00C2DD),
                iconSize: 20,
              )
            ]),
          )
        ]),
        bottomNavigationBar: footer(context));
  }
}

class ScreenArguments {}
