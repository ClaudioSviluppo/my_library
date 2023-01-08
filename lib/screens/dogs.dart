import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DogsScreen extends StatefulWidget {
  const DogsScreen({super.key});

  @override
  State<DogsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DogsScreen> {
  @override
  Future<void> initState() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'doggie_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
