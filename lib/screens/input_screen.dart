import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyInputScreen extends StatefulWidget {
  const MyInputScreen({super.key});

  @override
  State<MyInputScreen> createState() => _MyInputScreenState();
}

class _MyInputScreenState extends State<MyInputScreen> {
  String title = '';
  String hintAuthor = '';
  String hintTitle = '';
  String inserisci = '';
  String hintBtnV = '';
  String hintBtnE = '';
  String hintBtnCancella = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.insert),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: const MenuDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          getFirstContainer('Titolo prima riga'),
          getRow(
              context,
              AppLocalizations.of(context)!.insert,
              AppLocalizations.of(context)!.author,
              AppLocalizations.of(context)!.modality,
              AppLocalizations.of(context)!.modalityTypeE,
              AppLocalizations.of(context)!.modalityTypeV,
              AppLocalizations.of(context)!.delete),
          getRowb(
              context,
              AppLocalizations.of(context)!.insert,
              AppLocalizations.of(context)!.title,
              AppLocalizations.of(context)!.modality,
              AppLocalizations.of(context)!.modalityTypeE,
              AppLocalizations.of(context)!.modalityTypeV,
              AppLocalizations.of(context)!.delete)
        ],
      ),
    );
  }

  Row getRow(BuildContext context, String inserisci, String autore,
      String modalita, String typeEdit, String typeVocal, String elimina) {
    setState(() {
      hintAuthor = '$inserisci $autore';
      hintBtnV = '$modalita  $typeVocal';
      hintBtnE = '$modalita  $typeEdit';
      hintBtnCancella = '$elimina $autore';
    });
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                padding: EdgeInsets.all(10),
                color: Colors.blueAccent,
                child: Text("aa"))),
        Container(
            margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
            color: Colors.red[200],
            child: Text("bb")),
        Container(
            margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
            color: Colors.blueAccent,
            child: Text("cc")),
        Container(
            margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
            color: Colors.red[200],
            child: Text("cc"))
      ],
    );
  }

  Row getRowb(BuildContext context, String inserisci, String autore,
      String modalita, String typeEdit, String typeVocal, String elimina) {
    setState(() {
      hintAuthor = '$inserisci $autore';
      hintBtnV = '$modalita  $typeVocal';
      hintBtnE = '$modalita  $typeEdit';
      hintBtnCancella = '$elimina $autore';
    });
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                padding: EdgeInsets.all(10),
                color: Colors.blueAccent,
                child: Text("aa"))),
        Container(
            margin: const EdgeInsets.all(5),
            child: FloatingActionButton(
                onPressed: () {
                  print("FloatingActionButton1");
                },
                tooltip: hintBtnV,
                child: const Icon(Icons.mic))),
      ],
    );
  }

  Row getRow2(BuildContext context, String inserisci, String autore,
      String modalita, String typeEdit, String typeVocal, String elimina) {
    setState(() {
      hintAuthor = '$inserisci $autore';
      hintBtnV = '$modalita  $typeVocal';
      hintBtnE = '$modalita  $typeEdit';
      hintBtnCancella = '$elimina $autore';
    });
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
                margin: const EdgeInsets.all(20),
                color: Colors.blueAccent,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: hintAuthor),
                ))),
        Container(
            margin: const EdgeInsets.all(20),
            child: FloatingActionButton(
                onPressed: () {
                  print("FloatingActionButton1");
                },
                tooltip: hintBtnV,
                child: const Icon(Icons.mic))),
        Container(
            margin: const EdgeInsets.all(20),
            child: FloatingActionButton(
                onPressed: () {
                  print("FloatingActionButton1");
                },
                tooltip: hintBtnE,
                child: const Icon(Icons.edit))),
        Container(
            margin: const EdgeInsets.all(20),
            child: FloatingActionButton(
                onPressed: () {
                  print("FloatingActionButton4");
                },
                tooltip: hintBtnCancella,
                child: const Icon(Icons.delete))),
      ],
    );
  }

  Container getFirstContainer(String value) {
    setState(() {
      title = value;
    });
    return Container(
      height: 50,
      color: Colors.amber[500],
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}
