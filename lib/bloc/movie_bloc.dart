
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_event.dart';
import 'movie_state.dart';
import '../api/omdb_api.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final OmdbApi api;

  MovieBloc({required this.api}) : super(MovieInitial()) {
    on<SearchMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await api.searchMovies(event.query);
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError("Something went wrong"));
      }
    });
  }
}
