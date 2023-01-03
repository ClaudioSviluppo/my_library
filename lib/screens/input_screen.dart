import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/menu_drawer.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inserisci"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: const MenuDrawer(),
      body: titleSection,
    );
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        InputWidget("Placeholder 1"),
        InputWidget("Placeholder 2"),
        InputWidget("Placeholder 3"),
        InputWidget("Placeholder 4"),
      ],
    ),
  );
}

class InputWidget extends StatelessWidget {
  String label;

  InputWidget(
    String this.label, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10)),
      child: Text(label),
    );
  }
}
