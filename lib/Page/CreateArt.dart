// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member, unused_field, avoid_init_to_null, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/Components/addPartTwo.dart';
import 'package:project/Components/addPartone.dart';

class CreateArt extends StatefulWidget {
  final bool page;
  const CreateArt({super.key, this.page = false});
  static const route = '/addArt';

  @override
  _CreateArtState createState() => _CreateArtState();
}

class _CreateArtState extends State<CreateArt> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as bool;
    if (args == false) {
      return const AddPartOne();
    } else {
      return const AddPartTwo();
    }
  }
}
