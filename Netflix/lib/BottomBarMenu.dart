import 'package:flutter/material.dart';
import 'package:netflix/rechercheFilms.dart';
import 'filmsListe.dart';
import 'package:netflix/films.dart';

class BottomBarMenu extends StatefulWidget {
  final List<Film> filmsListe;

  BottomBarMenu({required this.filmsListe});

  @override
  _BottomBarMenuState createState() => _BottomBarMenuState();
}

class _BottomBarMenuState extends State<BottomBarMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search), // Ajout de l'icône de recherche
          label: 'Rechercher',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.preview),
          label: 'Prochainement',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download),
          label: 'Téléchargements',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Plus',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        if (index == 0) {
          // If "Accueil" is selected, navigate to filmsListe.dart
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FilmsListe(
                filmsListe: widget.filmsListe,
              ),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RechercherFilms(
                filmsListe: widget.filmsListe,
              ),
            ),
          );
        } else {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
    );
  }
}
