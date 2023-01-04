import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_library/screens/music_screen.dart';
import 'package:my_library/shared/model_translate.dart';
import '../screens/book_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/input_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final String menu = AppLocalizations.of(context)!.menu;
    final List<String> menuTitles = [
      'Home',
      'Musica',
      'Libri',
      'Weather',
      'Training',
      'Input'
    ];

    final List<ModelTranslate> menuTitles2 = [
      ModelTranslate("Home", "Home"),
      ModelTranslate("Musica", AppLocalizations.of(context)!.music),
      ModelTranslate("Libri", AppLocalizations.of(context)!.books),
      ModelTranslate("Weather", "Weather"),
      ModelTranslate("Training", "Training"),
      ModelTranslate("Input", AppLocalizations.of(context)!.insert),
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: Text(menu,
            style: const TextStyle(color: Colors.white, fontSize: 28))));

    for (ModelTranslate element in menuTitles2) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(
          element.value,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {
          switch (element.key) {
            case 'Home':
              screen = const IntroScreen();
              break;
            case 'BMI Calculator':
              screen = const IntroScreen();
              break;
            case 'Musica':
              screen = const MusicScreen();
              break;
            case 'Libri':
              screen = const BookScreen();
              break;
            case 'Input':
              screen = const MyInputScreen();
              break;
            default:
          }

          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    }
    return menuItems;
  }
}
