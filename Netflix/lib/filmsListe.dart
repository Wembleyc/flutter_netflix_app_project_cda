import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:netflix/films.dart';
import 'package:netflix/AppBarMenu.dart';
import 'package:netflix/BottomBarMenu.dart';
import 'package:netflix/PageFilm.dart';

class FilmsListe extends StatefulWidget {
  final List<Film> filmsListe;

  FilmsListe({required this.filmsListe});

  @override
  FilmsListeState createState() => FilmsListeState();
}

class FilmsListeState extends State<FilmsListe> {
  final List<Film> grosSuccesFilms = [
    Film(
      "Inception",
      "Science-fiction",
      "Christopher Nolan",
      "assets/inception.jpg",
      "Dom Cobb est un voleur expérimenté, le meilleur dans l'art dangereux de l'extraction. Son travail consiste à s'approprier les secrets les plus intimes enfouis au plus profond du subconscient, pendant qu'une personne rêve et que son esprit est particulièrement vulnérable.",
      false,
      148,
    ),
    Film(
      "The Dark Knight",
      "Action",
      "Christopher Nolan",
      "assets/the Dark Knight.jpg",
      "Batman s'associe avec le lieutenant James Gordon et le procureur Harvey Dent pour nettoyer les rues de Gotham City de la criminalité organisée, qui a toujours été si puissante dans la ville.",
      false,
      152,
    ),
    Film(
      "Avatar",
      "Science-fiction",
      "James Cameron",
      "assets/avatar.jpg",
      "Sur la lointaine planète de Pandora, Jake Sully se lie d'amitié avec les Na'vi et se bat contre la colonisation humaine destructrice.",
      false,
      162,
    ),
    Film(
      "Interstellar",
      "Science-fiction",
      "Christopher Nolan",
      "assets/Interstellar.jpg",
      "Dans un futur proche où la Terre est devenue inhabitable, un groupe d'explorateurs voyage à travers un trou de ver pour trouver une nouvelle planète habitable.",
      false,
      169,
    ),
    Film(
      "Gladiator",
      "Action",
      "Ridley Scott",
      "assets/Gladiator.jpg",
      "Maximus, un ancien général romain, est réduit en esclavage et se bat pour retrouver son honneur en tant que gladiateur dans l'arène.",
      false,
      155,
    ),
    Film(
      "Jurassic Park",
      "Science-fiction",
      "Steven Spielberg",
      "assets/Jurassic Park.jpg",
      "Un milliardaire crée un parc d'attractions peuplé de dinosaures clonés. Les choses tournent mal lorsque les dinosaures s'échappent de leur enclos.",
      false,
      127,
    ),
    Film(
      "The Avengers",
      "Action",
      "Joss Whedon",
      "assets/The Avengers.jpg",
      "Les super-héros les plus puissants de la Terre doivent s'unir pour arrêter Loki et son armée d'invasion extraterrestre.",
      false,
      143,
    ),
  ];

  final List<Film> plusMarrantsFilms = [
    Film(
      "La folle journée de Ferris Bueller",
      "Comédie",
      "John Hughes",
      "assets/La folle journée de Ferris Bueller.jpg",
      "Ferris Bueller, un adolescent populaire et charismatique, décide de sécher une journée de cours et de vivre la meilleure journée de sa vie.",
      false,
      103,
    ),
    Film(
      "Superbad",
      "Comédie",
      "Greg Mottola",
      "assets/Superbad.jpg",
      "Deux amis inséparables, Evan et Seth, décident de profiter de leur dernière année de lycée pour s'amuser et faire la fête.",
      false,
      113,
    ),
    Film(
      "The Hangover",
      "Comédie",
      "Todd Phillips",
      "assets/The Hangover.jpg",
      "Après une nuit de folie à Las Vegas, trois amis se réveillent sans aucun souvenir de la nuit précédente et essaient de retracer leurs pas pour comprendre ce qui s'est passé.",
      false,
      100,
    ),
    Film(
      "Deadpool",
      "Action",
      "Tim Miller",
      "assets/Deadpool.jpg",
      "Wade Wilson, un mercenaire disfiguré, adopte l'alter ego de Deadpool pour traquer l'homme responsable de sa transformation.",
      false,
      108,
    ),
    Film(
      "La Grande Aventure LEGO",
      "Animation",
      "Phil Lord, Christopher Miller",
      "assets/La Grande Aventure LEGO.jpg",
      "Un ouvrier LEGO ordinaire, Emmet, est pris par erreur pour l'Élu et embarque dans une quête épique pour sauver le monde LEGO.",
      false,
      100,
    ),
    Film(
      "Zoolander",
      "Comédie",
      "Ben Stiller",
      "assets/Zoolander.jpg",
      "Derek Zoolander, un mannequin narcissique, est recruté pour assassiner le Premier ministre de Malaisie.",
      false,
      89,
    ),
    Film(
      "Shrek",
      "Animation",
      "Andrew Adamson, Vicky Jenson",
      "assets/Shrek.jpg",
      "Shrek, un ogre grincheux, part à la recherche de la princesse Fiona pour la ramener au roi Lord Farquaad afin de retrouver son marais paisible.",
      false,
      90,
    ),
  ];

  final List<Film> plusActionFilms = [
    Film(
      "Mad Max: Fury Road",
      "Action",
      "George Miller",
      "assets/Mad Max Fury Road.jpg",
      "Dans un désert apocalyptique, un groupe de femmes rebelles dirigées par Furiosa tente de s'échapper d'un despote cruel, Immortan Joe, à l'aide de Max, un homme de main solitaire.",
      false,
      120,
    ),
    Film(
      "John Wick",
      "Action",
      "Chad Stahelski",
      "assets/John Wick.jpg",
      "John Wick, un ancien tueur à gages, se lance dans une vendetta sanglante après que des gangsters ont tué son chien, dernier cadeau de sa femme mourante.",
      false,
      101,
    ),
    Film(
      "Die Hard",
      "Action",
      "John McTiernan",
      "assets/Die Hard.jpg",
      "L'officier de police John McClane se retrouve pris au piège dans un gratte-ciel avec des terroristes allemands, et il est le seul espoir pour les otages pris en otage.",
      false,
      132,
    ),
    Film(
      "Matrix",
      "Science-fiction",
      "Lana Wachowski, Lilly Wachowski",
      "assets/Matrix.jpg",
      "Thomas Anderson, programmeur le jour et hacker la nuit, découvre la vérité sur la réalité simulée par une intelligence artificielle malveillante.",
      false,
      136,
    ),
    Film(
      "Fast & Furious",
      "Action",
      "Rob Cohen",
      "assets/Fast & Furious.jpg",
      "Brian O'Conner, un policier infiltré, se retrouve pris entre la loyauté envers son travail et l'amitié grandissante avec Dom Toretto, un coureur de rue recherché.",
      false,
      106,
    ),
    Film(
      "Kingsman: The Secret Service",
      "Action",
      "Matthew Vaughn",
      "assets/Kingsman The Secret Service.jpg",
      "Gary 'Eggsy' Unwin, un jeune délinquant, est recruté par une agence d'espionnage secrète et élite pour arrêter un méchant milliardaire.",
      false,
      129,
    ),
    Film(
      "Mission: Impossible - Fallout",
      "Action",
      "Christopher McQuarrie",
      "assets/Mission Impossible - Fallout.jpg",
      "Ethan Hunt et son équipe de l'IMF doivent arrêter une catastrophe mondiale après qu'une mission a mal tourné.",
      false,
      147,
    ),
  ];

  final List<Film> nouvellesSortiesFilms = [
    Film(
      "La Belle Époque",
      "Comédie, Drame, Romance",
      "Nicolas Bedos",
      "assets/La Belle Époque.jpg",
      "Un homme déprimé se voit offrir la possibilité de revivre l'époque de son choix grâce à une entreprise qui propose des reconstitutions historiques ultra-réalistes.",
      false,
      115,
    ),
    Film(
      "Les Misérables",
      "Drame, Thriller",
      "Ladj Ly",
      "assets/Les Misérables.jpg",
      "Un policier novice rejoint une brigade anticriminalité dans la banlieue de Paris et se retrouve rapidement confronté à la brutalité et aux tensions sociales du quartier.",
      false,
      104,
    ),
    Film(
      "Portrait de la jeune fille en feu",
      "Drame, Romance",
      "Céline Sciamma",
      "assets/Portrait de la jeune fille en feu.jpg",
      "Au 18ème siècle, une peintre est engagée pour réaliser le portrait d'une jeune femme sans que cette dernière ne s'en aperçoive. Une relation inattendue se noue entre les deux femmes.",
      false,
      119,
    ),
    Film(
      "Les Invisibles",
      "Comédie, Drame",
      "Louis-Julien Petit",
      "assets/Les Invisibles.jpg",
      "Une directrice de centre d'accueil pour femmes SDF décide de défier les lois en embauchant des actrices sans-abri pour jouer dans une pièce de théâtre.",
      false,
      102,
    ),
    Film(
      "La Haine",
      "Drame, Crime",
      "Mathieu Kassovitz",
      "assets/La Haine.jpg",
      "Trois amis issus de l'immigration vivent dans la banlieue parisienne et font face aux tensions sociales et à la violence policière après qu'un de leurs amis a été blessé par un officier de police.",
      false,
      98,
    ),
    Film(
      "Amélie",
      "Comédie, Romance",
      "Jean-Pierre Jeunet",
      "assets/Amélie.jpg",
      "Une jeune femme timide décide d'aider les autres et de semer la joie autour d'elle tout en cherchant l'amour à Montmartre, Paris.",
      false,
      122,
    ),
    Film(
      "Intouchables",
      "Comédie, Drame, Biographie",
      "Olivier Nakache, Éric Toledano",
      "assets/Intouchables.jpg",
      "L'histoire d'une amitié improbable entre un riche tétraplégique et un homme issu des quartiers défavorisés de Paris embauché comme son aide-soignant.",
      false,
      112,
    ),
  ];

  final List<Film> dramesFilms = [
    Film(
      "La Vie d'Adèle",
      "Drame, Romance",
      "Abdellatif Kechiche",
      "assets/La Vie d'Adèle.jpg",
      "L'histoire d'amour passionnée entre une jeune femme aux cheveux bleus et une artiste plus âgée.",
      false,
      180,
    ),
    Film(
      "Amour",
      "Drame, Romance",
      "Michael Haneke",
      "assets/Amour.jpg",
      "Un couple de personnes âgées fait face aux défis de la vieillesse et de la maladie, mettant à l'épreuve leur amour inconditionnel l'un pour l'autre.",
      false,
      127,
    ),
    Film(
      "La Promesse",
      "Drame",
      "Jean-Pierre Dardenne, Luc Dardenne",
      "assets/La Promesse.jpg",
      "Un adolescent se retrouve tiraillé entre la loyauté envers son père et le désir d'aider une immigrante en situation précaire.",
      false,
      90,
    ),
    Film(
      "Au Revoir les Enfants",
      "Drame, Guerre",
      "Louis Malle",
      "assets/Au Revoir les Enfants.jpg",
      "L'histoire d'une amitié entre deux garçons, l'un juif et l'autre catholique, dans un pensionnat catholique pendant l'occupation allemande de la France.",
      false,
      104,
    ),
    Film(
      "Un Prophète",
      "Drame, Crime",
      "Jacques Audiard",
      "assets/Un Prophète.jpg",
      "Un jeune délinquant illétré est condamné à une peine de prison où il doit faire face aux hiérarchies de gangs et aux dangers quotidiens.",
      false,
      155,
    ),
    Film(
      "La Môme",
      "Biographie, Drame, Musique",
      "Olivier Dahan",
      "assets/La Môme.jpg",
      "L'histoire de la chanteuse Édith Piaf, de ses débuts difficiles à son succès international.",
      false,
      140,
    ),
    Film(
      "Incendies",
      "Drame, Mystère, Guerre",
      "Denis Villeneuve",
      "assets/Incendies.jpg",
      "Deux jumeaux partent à la recherche de leur passé familial en suivant les traces d'une mère mystérieuse décédée dans un pays déchiré par la guerre.",
      false,
      131,
    ),
  ];

  List<Film> tousLesFilms = [];

  @override
  Widget build(BuildContext context) {
    List<Film> tousLesFilms = []
      ..addAll(grosSuccesFilms)
      ..addAll(plusMarrantsFilms)
      ..addAll(plusActionFilms)
      ..addAll(nouvellesSortiesFilms)
      ..addAll(dramesFilms);

    return Scaffold(
      appBar: AppBarMenu(),
      bottomNavigationBar: BottomBarMenu(
        filmsListe: tousLesFilms,
      ), // Passer 'tousLesFilms' à 'BottomBarMenu'
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Code pour "Les plus gros succès"
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Les plus gros succès sur Netflix",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: grosSuccesFilms.length,
                itemBuilder: (context, index) {
                  final film = grosSuccesFilms[index];
                  return FilmItemWidget(film: film);
                },
              ),
            ),
            // Code pour "Les plus marrants"
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Les plus marrants sur Netflix",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plusMarrantsFilms.length,
                itemBuilder: (context, index) {
                  final film = plusMarrantsFilms[index];
                  return FilmItemWidget(film: film);
                },
              ),
            ),
            // Code pour "Les plus action"
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Les plus action sur Netflix",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plusActionFilms.length,
                itemBuilder: (context, index) {
                  final film = plusActionFilms[index];
                  return FilmItemWidget(film: film);
                },
              ),
            ),
            // Code pour "les nouvelles sorties"
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Les nouvelles sorties",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nouvellesSortiesFilms.length,
                itemBuilder: (context, index) {
                  final film = nouvellesSortiesFilms[index];
                  return FilmItemWidget(film: film);
                },
              ),
            ),
            // Code pour "les plus dramatiques"
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Les plus dramatiques",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dramesFilms.length,
                itemBuilder: (context, index) {
                  final film = dramesFilms[index];
                  return FilmItemWidget(film: film);
                },
              ),
            ),

            // Ajoutez du code pour d'autres catégories au besoin
          ],
        ),
      ),
    );
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
        height: 800, // Augmentez la valeur ici selon vos besoins
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Hero(
            tag:
                "film_image_${film.title}", // Utilisez le titre du film comme tag
            child: Image.asset(
              film.imageUrl,
              fit: BoxFit.cover,
              width: 200,
              height: 350,
            ),
          ),
        ),
      ),
    );
  }
}
