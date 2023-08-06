import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:netflix/films.dart';
import 'package:netflix/AppBarMenu.dart';
import 'package:netflix/BottomBarMenu.dart';
import 'package:netflix/PageFilm.dart';

class RechercherFilms extends StatefulWidget {
  final List<Film> filmsListe;

  const RechercherFilms({Key? key, required this.filmsListe}) : super(key: key);

  @override
  _RechercherFilmsState createState() => _RechercherFilmsState();
}

class _RechercherFilmsState extends State<RechercherFilms> {
  String _query = "";
  final _controller = TextEditingController();
  List<Film> _resultatsDeRecherche = []; // Liste des résultats de recherche
  List<String> _types = []; // Liste des types de films

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchTextChanged);
    _resultatsDeRecherche =
        widget.filmsListe; // Initialisation des résultats avec tous les films
    _types =
        extractFilmTypes(widget.filmsListe); // Récupération des types de films
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {
      _query = _controller.text;
      if (_query.isEmpty) {
        _resultatsDeRecherche = widget.filmsListe;
      } else {
        _resultatsDeRecherche = widget.filmsListe
            .where((film) =>
                film.title.toLowerCase().contains(_query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenu(),
      bottomNavigationBar: BottomBarMenu(
        filmsListe: widget.filmsListe,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Entrez le titre du film',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            if (_query.isNotEmpty) ..._buildResultatsDeRecherche(),
            SizedBox(height: 16.0),
            _buildCategories(),
            SizedBox(height: 16.0),
            _buildFilmImages(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _types.length,
        itemBuilder: (context, index) {
          String type = _types[index];
          return ElevatedButton(
            onPressed: () {
              // Filtrer les résultats de recherche en fonction du type sélectionné
              List<Film> resultats = widget.filmsListe
                  .where(
                      (film) => film.type.toLowerCase() == type.toLowerCase())
                  .toList();

              // Mettre à jour la liste de résultats de recherche avec les films filtrés
              setState(() {
                _query = type;
                _resultatsDeRecherche = resultats;
              });
            },
            child: Text(type),
          );
        },
      ),
    );
  }

  List<Widget> _buildResultatsDeRecherche() {
    if (_query.isNotEmpty && _resultatsDeRecherche.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Aucun résultat trouvé pour '$_query'.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ];
    } else {
      return _resultatsDeRecherche.map((film) {
        return FilmItemWidget(key: Key(film.title), film: film);
      }).toList();
    }
  }

  Widget _buildFilmImages() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: [
        for (Film film in _resultatsDeRecherche) // Use a for loop here
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageFilm(film: film),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: "film_image_${film.title}",
                child: Image.asset(
                  film.imageUrl,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 200,
                ),
              ),
            ),
          ),
      ],
    );
  }

  // Fonction pour extraire les types de films de la liste des films
  List<String> extractFilmTypes(List<Film> films) {
    Set<String> types = {};
    for (var film in films) {
      types.add(film.type);
    }
    return types.toList();
  }
}

class FilmItemWidget extends StatelessWidget {
  const FilmItemWidget({Key? key, required this.film}) : super(key: key);
  final Film film;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageFilm(film: film),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        color: Colors.black,
        height: 200, // Ajustez la hauteur selon vos besoins
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Hero(
            tag: "film_image_${film.title}",
            child: Image.asset(
              film.imageUrl,
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
