import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/menu_drawer.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.music),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: const MenuDrawer(),
        body: const Center(child: FlutterLogo()));
  }
}
