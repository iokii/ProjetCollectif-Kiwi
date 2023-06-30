// ignore_for_file: file_names, no_logic_in_create_state, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/Models/Gallery.dart';
import 'package:project/Models/global.dart';

import '../Models/ArgumentScreenCollection.dart';
import '../Page/ExtractArgumentsCollection.dart';

class ProfileCollection extends StatefulWidget {
  final List<Gallery> listGallery;
  final String type;
  const ProfileCollection(this.listGallery, this.type, {super.key});

  @override
  _ProfileCollectionState createState() =>
      _ProfileCollectionState(listGallery, type);
}

class _ProfileCollectionState extends State<ProfileCollection> {
  _ProfileCollectionState(List<Gallery> listGallery, String type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray,
      body: Container(
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
                    if (widget.listGallery.isNotEmpty)
                      for (int i = 0; i < widget.listGallery.length; i += 2)
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () => {
                                Navigator.pushNamed(context,
                                    ExtractArgumentsCollection.collection,
                                    arguments: ArgumentScreenCollection(
                                        widget.listGallery[i], widget.type))
                              },
                              child: ClipRRect(
                                  child: Column(
                                children: [
                                  Image.network(
                                    widget.listGallery[i].listPublication[0]
                                        .urlMedia,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(widget.listGallery[i].name,
                                      style: const TextStyle(
                                          color: white, fontSize: 17))
                                ],
                              )),
                            ))
                  ]),
                ),
                TableCell(
                  child: Column(children: [
                    if (widget.listGallery.length > 1)
                      for (int i = 1; i < widget.listGallery.length; i += 2)
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () => {
                                Navigator.pushNamed(
                                  context,
                                  ExtractArgumentsCollection.collection,
                                  arguments: ArgumentScreenCollection(
                                      widget.listGallery[i], widget.type),
                                )
                              },
                              child: ClipRRect(
                                  child: Column(
                                children: [
                                  Image.network(
                                    widget.listGallery[i].listPublication[0]
                                        .urlMedia,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(widget.listGallery[i].name,
                                      style: const TextStyle(
                                          color: white, fontSize: 17))
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
    );
  }
}
