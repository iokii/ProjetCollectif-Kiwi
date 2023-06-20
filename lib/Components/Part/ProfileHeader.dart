// ignore_for_file: no_logic_in_create_state, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:project/Models/Profile.dart';
import 'package:project/Models/global.dart';

class ProfileHeader extends StatefulWidget {
  final Profile profile;

  const ProfileHeader(this.profile, {super.key});

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState(profile);
}

class _ProfileHeaderState extends State<ProfileHeader> {
  _ProfileHeaderState(Profile profile);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: 50, top: 30),
        child: CircleAvatar(
          backgroundImage: NetworkImage(widget.profile.pdp),
          radius: 40,
        ),
      ),
      const SizedBox(width: 35),
      Padding(
        padding: const EdgeInsets.only(left: 0, top: 45),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.profile.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              textAlign: TextAlign.left,
              widget.profile.typeCompte,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.profile.followers.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const Text(
                      "abonnés",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.profile.follow.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const Text(
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
    ]);
  }
}
