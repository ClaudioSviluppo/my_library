import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/menu_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: const MenuDrawer(),
        body: const Center(child: FlutterLogo()));
  }
}
