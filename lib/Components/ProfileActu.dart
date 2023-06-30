// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project/Models/global.dart';

class ProfileActu extends StatefulWidget {
  final listActu;
  const ProfileActu({super.key, this.listActu});

  @override
  _ProfileActuState createState() => _ProfileActuState();
}

class _ProfileActuState extends State<ProfileActu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: const Text(
            "Actualités :",
            textAlign: TextAlign.left,
            style: TextStyle(color: white),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.listActu.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.listActu[index]),
                  radius: 30,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
