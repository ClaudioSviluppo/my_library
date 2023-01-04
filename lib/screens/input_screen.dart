import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/menu_drawer.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});
  final TextEditingController txtDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inserisci"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: const MenuDrawer(),
      body: ListView(children: getContent()),
    );
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];

    tiles.add(author());
    tiles.add(Container(
      margin: const EdgeInsets.all(20),
      color: Colors.blueAccent,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Inserisci Autore"),
                )),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: FloatingActionButton(
                onPressed: () {
                  print("FloatingActionButton2");
                },
                tooltip: 'Inserisci Autore',
                child: const Icon(Icons.mic)),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: FloatingActionButton(
                onPressed: () {
                  print("FloatingActionButton3");
                },
                tooltip: 'Edit Autore',
                child: const Icon(Icons.edit)),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: FloatingActionButton(
                onPressed: () {
                  print("FloatingActionButton4");
                },
                tooltip: 'Annulla Autore',
                child: const Icon(Icons.delete)),
          ),
        ],
      ),
    ));

    return tiles;
  }

  Container author() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: const TextField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: "Inserisci Autore"),
      ),
    );
  }

  Row getRowauthor() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: const TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Inserisci Autore"),
          ),
        ),
      ],
    );
  }
}
