import 'package:shared_preferences/shared_preferences.dart';
import 'libri.dart';
import 'dart:convert';

//Questa classe è i+un interfaccia  fra il codice e shared_preferences
class SPHelper {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeBook(Book book) async {
    prefs.setString(book.id.toString(), json.encode(book.toJson()));
  }

  List<Book> getBooks() {
    List<Book> books = [];

    //Set è una lista non ordinata, mentre List è una lista ordinata
    Set<String> keys = prefs.getKeys();
    keys.forEach((String key) {
      Book book = Book.fromJson(jsonDecode(prefs.getString(key) ?? ''));
      books.add(book);
    });
    return books;
  }
}
