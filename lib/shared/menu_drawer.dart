import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../screens/book_screen.dart';
import '../screens/intro_screen.dart';

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
      'Dischi',
      'Libri',
      'Weather',
      'Training'
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child:
            Text(menu, style: TextStyle(color: Colors.white, fontSize: 28))));

    for (String element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(
          element,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () {
          switch (element) {
            case 'Libri':
              screen = BookScreen();
              break;
          }
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    }
    return menuItems;
  }
}
