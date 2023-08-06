// films.dart
class Film {
  final String title;
  final String type;
  final String director;
  final String imageUrl;
  final String description;
  final bool isFavorite;
  final int duration;

  Film(this.title, this.type, this.director, this.imageUrl, this.description,
      this.isFavorite, this.duration);
}

List<Map<String, dynamic>> convertFilmListToMapList(List<Film> films) {
  List<Map<String, dynamic>> mapList = [];
  for (var film in films) {
    Map<String, dynamic> filmMap = {
      'title': film.title,
      'type': film.type,
      'director': film.director,
      'imageUrl': film.imageUrl,
      'description': film.description,
      'isFavorite': film.isFavorite,
      'duration': film.duration,
    };
    mapList.add(filmMap);
  }
  return mapList;
}

// transformer liste de film en map<String, dynamic>
// fantastique : {
