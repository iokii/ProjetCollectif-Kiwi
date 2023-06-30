// ignore_for_file: no_logic_in_create_state, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:project/Data/User.dart';
import 'package:project/Models/Profile.dart';
import 'package:project/Models/global.dart';
import 'package:provider/provider.dart';

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
    final args = ModalRoute.of(context)!.settings.arguments as Profile;
    if (args.follow.isEmpty) {
      Provider.of<DataUser>(context, listen: false).majFollow();
    }
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: 50, top: 30),
        child: CircleAvatar(
          backgroundImage: NetworkImage(args.pdp),
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
              style: const TextStyle(color: white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (args.typeCompte)
              const Text(
                textAlign: TextAlign.left,
                "Artiste",
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              )
            else
              const Text(
                textAlign: TextAlign.left,
                "Voyageur",
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 15),
            Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/subs",
                            arguments: args.follow);
                      },
                      child: Column(children: [
                        Text(
                          args.follow.length.toString(),
                          style: const TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Text(
                          "abonnés",
                          style: TextStyle(color: white),
                        )
                      ]),
                    )
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/subs",
                            arguments: args.followers);
                      },
                      child: Column(children: [
                        Text(
                          args.followers.length.toString(),
                          style: const TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Text(
                          "abonnements",
                          style: TextStyle(color: white),
                        )
                      ]),
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
