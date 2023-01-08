import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyLibraryDatabase {
  static final MyLibraryDatabase instance = MyLibraryDatabase._init();

  static Database? _database;

  MyLibraryDatabase._init();

  //Open Connection
  Future<Database?> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mydblib.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    // Get a location using getDatabasesPath

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  FutureOr<void> _createDb(Database db, int version) async {
    //  await db.execute(sql)
  }

  Future close() async {
    final db = await instance.database;
    db?.close();
  }
}
