import 'package:flutter/material.dart';
import 'package:my_library/screens/intro_screen.dart';

void main(List<String> args) {
  runApp(const MyLibraryApp());
}

class MyLibraryApp extends StatelessWidget {
  const MyLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey), // Colora appBAr
        home: const IntroScreen());
  }
}
