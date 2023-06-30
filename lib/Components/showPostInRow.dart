// ignore_for_file: override_on_non_overriding_member, non_constant_identifier_names, library_private_types_in_public_api, camel_case_types, no_logic_in_create_state, file_names

import 'package:flutter/material.dart';
import 'package:project/Components/DetailsPublication.dart';
import 'package:project/Models/global.dart';
import 'package:project/Models/Post.dart';

class showPostInRow extends StatefulWidget {
  final List<Post> posts;
  final double heightMult;

  const showPostInRow(
      {super.key, required this.posts, required this.heightMult});

  @override
  _showPostInRowState createState() => _showPostInRowState(posts);
}

class _showPostInRowState extends State<showPostInRow> {
  _showPostInRowState(List<Post> posts);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.heightMult,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Scaffold(
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
                      if (widget.posts.isNotEmpty)
                        for (int i = 0; i < widget.posts.length; i += 3)
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsPublication(
                                                  widget.posts[i])));
                                },
                                child: Image.network(
                                  widget.posts[i].urlMedia,
                                  width:
                                      MediaQuery.of(context).size.width * 0.31,
                                )),
                          ),
                    ]),
                  ),
                  TableCell(
                    child: Column(children: [
                      if (widget.posts.length > 1)
                        for (int i = 1; i < widget.posts.length; i += 3)
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsPublication(
                                                  widget.posts[i])));
                                },
                                child: Image.network(
                                  widget.posts[i].urlMedia,
                                  width:
                                      MediaQuery.of(context).size.width * 0.31,
                                )),
                          ),
                    ]),
                  ),
                  TableCell(
                    child: Column(children: [
                      if (widget.posts.length > 2)
                        for (int i = 2; i < widget.posts.length; i += 3)
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsPublication(
                                                  widget.posts[i])));
                                },
                                child: Image.network(
                                  widget.posts[i].urlMedia,
                                  width:
                                      MediaQuery.of(context).size.width * 0.31,
                                )),
                          ),
                    ]),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
