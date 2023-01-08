import 'package:flutter/material.dart';
import 'package:my_library/data/libri.dart';
import 'package:my_library/data/sp_helper.dart';

class LibriScreen extends StatefulWidget {
  const LibriScreen({super.key});

  @override
  State<LibriScreen> createState() => _LibriScreen();
}

class _LibriScreen extends State<LibriScreen> {
  final TextEditingController txtAuthor = TextEditingController();
  final TextEditingController txtTitle = TextEditingController();
  final TextEditingController txtGenere = TextEditingController();
  final SPHelper helper = SPHelper();
  List<Book> books = [];

  @override
  void initState() {
    helper.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  color: Colors.amber,
                  margin: const EdgeInsets.all(20),
                  child: FloatingActionButton(
                    onPressed: () {
                      print('Microfono');
                    },
                    child: const Icon(Icons.mic),
                  )),
              Container(
                  color: Colors.blueAccent,
                  margin: const EdgeInsets.all(20),
                  child: FloatingActionButton(
                    onPressed: () {
                      showBookDialog(context);
                    },
                    child: const Icon(Icons.edit),
                  )),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Set Title TBD'),
        ),
        body: ListView(
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.lightGreen,
              child: Text("GGGG"),
            ))
          ],
        ));
  }

  Future<dynamic> showBookDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Inserisci"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: txtAuthor,
                    decoration: InputDecoration(hintText: "Insert autore"),
                  ),
                  TextField(
                    controller: txtTitle,
                    decoration: InputDecoration(hintText: "Insert Titolo"),
                  ),
                  TextField(
                    controller: txtGenere,
                    decoration: InputDecoration(hintText: "Insert Genere"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                  txtTitle.text = '';
                  txtAuthor.text = '';
                  txtGenere.text = '';
                },
              ),
              ElevatedButton(onPressed: saveBook, child: Text('Save'))
            ],
          );
        });
  }

  Future saveBook() async {
    Book newBook = new Book(1, txtAuthor.text, txtTitle.text, txtGenere.text);
    helper.writeBook(newBook);
    txtTitle.text = '';
    txtAuthor.text = '';
    txtGenere.text = '';
    Navigator.pop(context);
  }
}
