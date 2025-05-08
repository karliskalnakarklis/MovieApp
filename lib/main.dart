import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/movie_bloc.dart';
import 'api/omdb_api.dart';
import 'screens/movie_search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final OmdbApi api = OmdbApi(apiKey: 'bc8ae1b8');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMDB Movie Search',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => MovieBloc(api: api),
        child: MovieSearchScreen(),
      ),
    );
  }
}
