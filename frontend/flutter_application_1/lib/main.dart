import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screens/activites_utilisateur.dart';
import 'package:flutter_application_1/screens/navigation_rail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Borning Challenge',
      debugShowCheckedModeBanner: false, // Enlève la petite bannière "Debug"
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // On définit l'écran de démarrage
      home: NavRail(),
    );
  }
}