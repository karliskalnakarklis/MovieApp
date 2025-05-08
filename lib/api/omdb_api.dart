
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class OmdbApi {
  final String apiKey;
  OmdbApi({required this.apiKey});

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&s=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Response'] == 'True') {
        return (data['Search'] as List).map((e) => Movie.fromJson(e)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load movies');
    }
  }
}


