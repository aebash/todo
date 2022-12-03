import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/src/views/home_screen.dart';

import 'src/logger.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        logger.d('User is currently signed out!');
      } else {
        logger.d('User is signed in!');
      }
    });

    try {
      final userCredential = FirebaseAuth.instance.signInAnonymously();
      logger.d("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          logger.d("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          logger.d("Unknown error.");
      }
    }
    return const MaterialApp(
      title: 'Template App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomeScreen(),
    );
  }
}
