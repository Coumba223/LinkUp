import 'package:flutter/material.dart';
import 'package:linkupapp/screens/connexion.dart';
import 'package:linkupapp/screens/home.dart';
import 'package:linkupapp/screens/inscription.dart';
import 'package:linkupapp/screens/discover1.dart';
import 'package:linkupapp/screens/discover2.dart';
import 'package:linkupapp/screens/discover3.dart';
import 'package:linkupapp/screens/monreseau.dart';
import 'package:linkupapp/screens/nouveaucontact.dart';
import 'package:linkupapp/screens/profil.dart';
import 'package:linkupapp/screens/scancontact.dart';
import 'package:linkupapp/screens/splashscreen.dart';
import 'package:linkupapp/screens/testqr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: const SplashScreen(),
      home: const SplashScreen(),
    );
  }
}
