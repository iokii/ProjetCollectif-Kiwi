// ignore_for_file: file_names, no_logic_in_create_state, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/Models/global.dart';
import '../Models/Post.dart';
import 'DetailsPublication.dart';

class ProfileInfo extends StatefulWidget {
  final List<Post> listInfo;
  const ProfileInfo(this.listInfo, {super.key});

  @override
  _ProfileInfoState createState() => _ProfileInfoState(listInfo);
}

class _ProfileInfoState extends State<ProfileInfo> {
  _ProfileInfoState(List<Post> listInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray,
      body: Container(
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
              for (int i = 0; i < widget.listInfo.length; i += 4)
                TableRow(children: [
                  TableCell(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPublication(widget.listInfo[i]),
                            ),
                          );
                        },
                        child: Column(children: [
                          ClipRRect(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 15, right: 15),
                                child: Image.network(
                                  widget.listInfo[i].urlMedia,
                                  height: 150,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Text(
                            widget.listInfo[i].title,
                            style: const TextStyle(color: white),
                          )
                        ])),
                  ),
                  TableCell(
                      child: Column(children: [
                    if (i + 1 < widget.listInfo.length)
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPublication(widget.listInfo[i]),
                              ),
                            );
                          },
                          child: Column(children: [
                            ClipRRect(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Image.network(
                                    widget.listInfo[i].urlMedia,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            if (i + 1 < widget.listInfo.length)
                              Text(
                                widget.listInfo[i + 1].title,
                                style: const TextStyle(color: white),
                              )
                          ])),
                  ])),
                  TableCell(
                      child: Column(children: [
                    if (i + 2 < widget.listInfo.length)
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPublication(widget.listInfo[i]),
                              ),
                            );
                          },
                          child: Column(children: [
                            ClipRRect(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Image.network(
                                    widget.listInfo[i + 2].urlMedia,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            if (i + 2 < widget.listInfo.length)
                              Text(
                                widget.listInfo[i + 2].title,
                                style: const TextStyle(color: white),
                              )
                          ])),
                  ])),
                  TableCell(
                      child: Column(children: [
                    if (i + 3 < widget.listInfo.length)
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPublication(widget.listInfo[i]),
                              ),
                            );
                          },
                          child: Column(children: [
                            ClipRRect(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15),
                                  child: Image.network(
                                    widget.listInfo[i + 3].urlMedia,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            if (i + 3 < widget.listInfo.length)
                              Text(
                                widget.listInfo[i + 3].title,
                                style: const TextStyle(color: white),
                              )
                          ])),
                  ])),
                ])
            ],
          ),
        ),
      ),
    );
  }
}
