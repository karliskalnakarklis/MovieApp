
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            movie.poster != 'N/A'
                ? Image.network(movie.poster, height: 300)
                : Container(height: 300, color: Colors.grey),
            SizedBox(height: 20),
            Text(movie.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Year: ${movie.year}'),
          ],
        ),
      ),
    );
  }
}
