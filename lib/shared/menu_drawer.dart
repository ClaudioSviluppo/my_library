import 'package:flutter/material.dart';

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
    final List<String> menuTitles = [
      'Home',
      'Dischi',
      'Libri',
      'Weather',
      'Training'
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text('xxxxx',
            style: TextStyle(color: Colors.white, fontSize: 28))));

    for (String element in menuTitles) {
      menuItems.add(ListTile(
        title: Text(
          element,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () {},
      ));
    }
    return menuItems;
  }
}
