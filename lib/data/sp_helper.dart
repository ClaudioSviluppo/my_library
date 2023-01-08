import 'package:shared_preferences/shared_preferences.dart';
import 'libri.dart';
import 'dart:convert';

//Questa classe è i+un interfaccia  fra il codice e shared_preferences
class SPHelper {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Book book) async {
    prefs.setString(book.id.toString(), json.encode(book.toJson()));
  }
}
