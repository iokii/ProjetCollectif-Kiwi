// ignore_for_file: library_private_types_in_public_api, file_names, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:project/Components/Part/header.dart';
import 'package:project/Components/TableEtiquetteCell.dart';
import 'package:project/Models/global.dart';

class AddPartTwo extends StatefulWidget {
  const AddPartTwo({super.key});

  @override
  _AddPartTwoState createState() => _AddPartTwoState();
}

class _AddPartTwoState extends State<AddPartTwo> {
  //TODO: Faire la query et remplir la List
  //List<String> etiquettes;

  List<String> etiquettes = ["", "pomme", "boop", "Oui"];
  late List<String> etiquetteAdd;
  late String select;

  @override
  void initState() {
    super.initState();
    etiquetteAdd = [];
    select = etiquettes.first;
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final tagController = TextEditingController();

    return Scaffold(
      backgroundColor: darkGray,
      appBar: header(context: context, back: true),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                labelText: "Nom de l'Oeuvre",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                fillColor: lightGray,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: TextField(
                            controller: descController,
                            decoration: InputDecoration(
                                labelText: "Description de l'oeuvre",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                fillColor: lightGray,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: TextField(
                            controller: tagController,
                            decoration: InputDecoration(
                                labelText: "Tags (séparé de \",\")",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                fillColor: lightGray,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                                flex: 3,
                                child: Text(
                                  "Etiquettes :",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Expanded(
                                flex: 3,
                                child: DropdownButton<String>(
                                  value: select,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.white),
                                  dropdownColor: lightGray,
                                  iconDisabledColor: lightGray,
                                  underline: Container(
                                    height: 1,
                                    color: lightGray,
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      select = value!;
                                    });
                                  },
                                  items: etiquettes
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )),
                            Expanded(
                              flex: 3,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (select != etiquettes.first) {
                                      etiquetteAdd.add(select);
                                      etiquettes.remove(select);
                                      select = etiquettes.first;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: lightGray,
                              border: Border.all(width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: GridView.count(
                            crossAxisCount: 4,
                            children: List.generate(
                                etiquetteAdd.length,
                                (index) => TableEtiquetteCell(
                                    context, etiquetteAdd[index])),
                          )),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(lightGray),
                              fixedSize: MaterialStateProperty.all(
                                  const Size(300, 15))),
                          onPressed: () {
                            //TODO -- faire add a l'API
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("Publier votre oeuvre sur Artista !!"),
                            ],
                          ))
                    ]))
          ]),
    );
  }
}
