import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:project/footer.dart';
import 'package:project/header.dart';
import 'package:project/singlePublication.dart';
import 'package:project/Publication.dart';
import 'global.dart';

import '../Publication.dart';

Card SinglePublication(BuildContext context, Publication publication) {
  Card showPublication = Card(
      color: const Color(0xFF323232),
      shadowColor: Colors.transparent,
      child: Column(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(publication.photoProfil)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 50, top: 10),
                      child: Text(
                        publication.utilisateur,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image(
                  image: NetworkImage(publication.oeuvre),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      alignment: Alignment.topRight,
                      onPressed: () {},
                      icon:
                          const Icon(Icons.star, color: Colors.white, size: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      alignment: Alignment.topRight,
                      onPressed: () {},
                      icon: const Icon(Icons.add_box_sharp,
                          color: Colors.white, size: 40),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  publication.titre,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      publication.description,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ]));

  return showPublication;
}
