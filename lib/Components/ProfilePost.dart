// ignore_for_file: file_names, no_logic_in_create_state, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/Components/DetailsPublication.dart';
import 'package:project/Models/Post.dart';

import '../Models/global.dart';

class ProfilePost extends StatefulWidget {
  final List<Post> listPost;
  const ProfilePost(this.listPost, {super.key});

  @override
  _ProfilePostState createState() => _ProfilePostState(listPost);
}

class _ProfilePostState extends State<ProfilePost> {
  _ProfilePostState(List<Post> listPost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray,
      body: Container(
        color: darkGray,
        child: SingleChildScrollView(
          child: Table(
            columnWidths: const {
              0: FractionColumnWidth(1 / 3),
              1: FractionColumnWidth(1 / 3),
              2: FractionColumnWidth(1 / 3),
            },
            children: [
              TableRow(children: [
                TableCell(
                  child: Column(children: [
                    if (widget.listPost.isNotEmpty)
                      for (int i = 0; i < widget.listPost.length; i += 3)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 5),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsPublication(
                                                widget.listPost[i])));
                              },
                              child: Image.network(
                                widget.listPost[i].urlMedia,
                                width: MediaQuery.of(context).size.width * 0.31,
                              )),
                        ),
                  ]),
                ),
                TableCell(
                  child: Column(children: [
                    if (widget.listPost.length > 1)
                      for (int i = 1; i < widget.listPost.length; i += 3)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 5),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsPublication(
                                                widget.listPost[i])));
                              },
                              child: Image.network(
                                widget.listPost[i].urlMedia,
                                width: MediaQuery.of(context).size.width * 0.31,
                              )),
                        ),
                  ]),
                ),
                TableCell(
                  child: Column(children: [
                    if (widget.listPost.length > 2)
                      for (int i = 2; i < widget.listPost.length; i += 3)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 5),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsPublication(
                                                widget.listPost[i])));
                              },
                              child: Image.network(
                                widget.listPost[i].urlMedia,
                                width: MediaQuery.of(context).size.width * 0.31,
                              )),
                        ),
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
