// A Widget that extracts the necessary arguments from
// the ModalRoute.
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/Models/ArgumentScreenCollection.dart';

import '../footer.dart';
import '../global.dart';
import '../header.dart';

class ExtractArgumentsCollection extends StatefulWidget {
  const ExtractArgumentsCollection({super.key});
  static const collection = '/collection';

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ExtractArgumentsCollection> {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args =
        ModalRoute.of(context)!.settings.arguments as ArgumentScreenCollection;

    //Request DB avec args pour l'id discuss

    return Scaffold(
        appBar: header(context: context),
        backgroundColor: const Color(0xFF323232),
        body: Column(children: [
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
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 15))
                ])),
          ),
          Text(
            args.gallery.name,
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Container(
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
                          if (args.gallery.listPublication.isNotEmpty)
                            for (int i = 0;
                                i < args.gallery.listPublication.length;
                                i += 3)
                              Padding(
                                  padding: EdgeInsets.only(top: 10, right: 0),
                                  child: Image.network(
                                    args.gallery.listPublication[i].urlMedia,
                                    width: MediaQuery.of(context).size.width *
                                        0.31,
                                  )),
                        ]),
                      ),
                      TableCell(
                        child: Column(children: [
                          if (args.gallery.listPublication.length > 1)
                            for (int i = 1;
                                i < args.gallery.listPublication.length;
                                i += 3)
                              Padding(
                                  padding: EdgeInsets.only(top: 10, right: 0),
                                  child: Row(children: [
                                    Image.network(
                                      args.gallery.listPublication[i].urlMedia,
                                      width: MediaQuery.of(context).size.width *
                                          0.31,
                                    ),
                                  ])),
                        ]),
                      ),
                      TableCell(
                        child: Column(children: [
                          if (args.gallery.listPublication.length > 2)
                            for (int i = 2;
                                i < args.gallery.listPublication.length;
                                i += 3)
                              Padding(
                                padding: EdgeInsets.only(top: 10, right: 0),
                                child: Image.network(
                                  args.gallery.listPublication[i].urlMedia,
                                  width:
                                      MediaQuery.of(context).size.width * 0.31,
                                ),
                              ),
                        ]),
                      ),
                    ])
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
