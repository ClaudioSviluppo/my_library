import 'package:flutter/material.dart';
import 'package:my_library/shared/menu_drawer.dart';
// #docregion AppLocalizationsImport
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// #enddocregion AppLocalizationsImport
import '../util/application_helper.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    ApplicationHelper.debug('build', 'IntroScreen');

    String welcomeMessage = AppLocalizations.of(context)!.username('Claudio');
    String desc = AppLocalizations.of(context)!.appDescription;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
        backgroundColor: Colors.blueGrey,
      ),
      // body: welcomeMessage('Il mio Archivio'), get TextBox  da metodo
      drawer: const MenuDrawer(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/lib2.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white70,
            ),
            child: Text(
              textAlign: TextAlign.center,
              "$welcomeMessage\n$desc",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  shadows: [
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey)
                  ],
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings),
        ],
        //Al tap arriva l'ince dell'elemento cos?? come posizionato
        //Nell'array BottomNAvigationBar
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/settings');
              break;
            default:
          }
        },
      ),
    );
  }

  welcomeMessage(String testo) {
    return Center(
      child: Text(
        'Hello, $testo! How are you?',
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
