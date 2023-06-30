// ignore_for_file: library_private_types_in_public_api, file_names, unused_local_variable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:project/Components/Part/BottomIconBar.dart';
import 'package:project/Components/Part/header.dart';
import 'package:project/Components/profileSubs.dart';
import 'package:project/Models/Profile.dart';
import 'package:project/Models/global.dart';

//type : 1 --> les abonnées
//       2 --> les abonnements

class ShowSubs extends StatefulWidget {
  const ShowSubs({super.key});
  static const route = "/subs";

  @override
  _ShowSubsState createState() => _ShowSubsState();
}

class _ShowSubsState extends State<ShowSubs> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<Profile>;

    List<Profile> subs = args;

    //TODO : Query des subs selon type

    return Scaffold(
      backgroundColor: darkGray,
      appBar: header(context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: white, size: 30)),
          const SizedBox(
            height: 10,
          ),
          if (args == 1)
            const Text(
              "Abonné.e.s : ",
              style: TextStyle(color: white),
            )
          else
            const Text(
              "Abonnement.s : ",
              style: TextStyle(color: white),
            ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7579, //précision
              child: ListView.builder(
                itemCount: subs.length,
                itemBuilder: (context, index) =>
                    profileSubs(context, subs[index]),
              ))
        ],
      ),
      bottomNavigationBar: BottomIconBar(context),
    );
  }
}
