// ignore_for_file: library_private_types_in_public_api, file_names, invalid_use_of_visible_for_testing_member

import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/Components/Part/header.dart';
import 'package:project/Models/global.dart';

import 'package:image_picker/image_picker.dart';

class AddPartOne extends StatefulWidget {
  const AddPartOne({super.key});

  @override
  _AddPartOneState createState() => _AddPartOneState();
}

class _AddPartOneState extends State<AddPartOne> {
  File? _image;

  Future getImage() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image == null) {
        _image = null;
      } else {
        _image = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray,
      appBar: header(context: context, back: true),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Ajouter un média :",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: getImage,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(lightGray),
                        fixedSize:
                            MaterialStateProperty.all(const Size(125, 15))),
                    child: const Text(
                      "Parcourir la gallerie de son appareil",
                      style: TextStyle(fontSize: 10),
                    ))
              ],
            ),
            const SizedBox(height: 30),
            if (_image == null)
              Container(
                color: lightGray,
                width: 200,
                height: 200,
              )
            else
              Image.file(
                _image!,
                width: 200,
                height: 200,
              ),
            const SizedBox(height: 200),
            if (_image != null)
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(lightGray),
                      fixedSize:
                          MaterialStateProperty.all(const Size(300, 15))),
                  onPressed: () {
                    Navigator.pushNamed(context, "/addArt", arguments: true);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Continuer la publication"),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_right_alt)
                    ],
                  ))
          ]),
    );
  }
}
