import 'package:flutter/material.dart';
import 'package:netflix/BottomBarMenu.dart';
import 'package:netflix/filmsListe.dart';
import 'films.dart';
import 'ChatGptPage.dart';
import 'package:netflix/AppBarMenu.dart';
import 'package:netflix/PageFilm.dart';
import 'package:netflix/rechercheFilms.dart'; // Assurez-vous que le chemin d'importation est correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Film> filmsListe = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android:
                ZoomPageTransitionsBuilder(), // Utiliser ZoomPageTransitionsBuilder
          },
        ),
      ),
      home: FilmsListe(filmsListe: filmsListe), //
    );
  }
}
