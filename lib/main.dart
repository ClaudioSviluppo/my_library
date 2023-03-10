import 'package:flutter/material.dart';
import 'package:my_library/screens/intro_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_library/screens/settings_screen.dart';

import 'util/application_helper.dart';

void main(List<String> args) {
  runApp(const MyLibraryApp());
}

class MyLibraryApp extends StatelessWidget {
  const MyLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApplicationHelper.debug('Starting application', 'MyLibraryApp');
    return MaterialApp(
      localizationsDelegates: const [
        //Setup Localization delegate
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
        Locale('it', ''), // Italian, no country code
        Locale('de', ''), // German, no country code
      ],
      routes: {
        '/': (context) => const IntroScreen(),
        '/settings': (context) => const SettingsScreen()
      },
      initialRoute: '/',
    );
  }
}
