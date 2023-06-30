// ignore_for_file: file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project/Models/global.dart';

Padding TableEtiquetteCell(context, String etiquette) {
  return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.05,
        color: darkGray,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: lightGray,
                  height: 25,
                  width: 40,
                  child: Text(
                    etiquette,
                    style: const TextStyle(fontSize: 10, color: white),
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  alignment: Alignment.center,
                  color: lightGray,
                  height: 25,
                  width: 20,
                  child: const Icon(
                    Icons.close,
                    size: 10,
                  ),
                )
              ]),
        ),
      ));
}
