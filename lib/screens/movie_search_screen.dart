
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';
import '../widgets/movie_list_item.dart';
import 'movie_detail_screen.dart';

class MovieSearchScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  MovieSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OMDB Movie Search')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search movies...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    context.read<MovieBloc>().add(SearchMovies(controller.text));
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is MovieLoaded) {
                    return ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return MovieListItem(
                          movie: state.movies[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MovieDetailScreen(movie: state.movies[index]),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is MovieError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text('Search for a movie!'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

