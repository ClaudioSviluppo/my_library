import 'package:flutter/material.dart';
import 'package:my_library/data/libri.dart';
import 'package:my_library/data/sp_helper.dart';
import '../data/sql_statement.dart';

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
  SQlStatement sqlStatement = SQlStatement();

  @override
  void initState() {
    helper.init().then((value) => updateScreen());
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
                    onPressed: () {},
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
        body: ListView(children: getContent()));
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
                  print(sqlStatement.sqlLibri);
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
    int id = helper.getCounter() + 1;
    Book newBook = Book(id, txtAuthor.text, txtTitle.text, txtGenere.text);
    helper.writeBook(newBook).then((_) => updateScreen());
    helper.setCounter();
    txtTitle.text = '';
    txtAuthor.text = '';
    txtGenere.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var book in books) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.deleteBook(book.id).then((value) => updateScreen());
        },
        child: ListTile(
            title: Text(book.title),
            subtitle: Text('${book.author} - ${book.type}')),
      ));
    }
    return tiles;
  }

  void updateScreen() {
    books = helper.getBooks();
    setState(() {});
  }
}
