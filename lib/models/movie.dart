
class Movie {
  final String title;
  final String year;
  final String imdbID;
  final String poster;

  Movie({required this.title, required this.year, required this.imdbID, required this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      imdbID: json['imdbID'],
      poster: json['Poster'],
    );
  }
}
