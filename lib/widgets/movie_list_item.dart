
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieListItem({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: movie.poster != 'N/A'
          ? Image.network(movie.poster, width: 50)
          : Icon(Icons.movie),
      title: Text(movie.title),
      subtitle: Text(movie.year),
      onTap: onTap,
    );
  }
}
