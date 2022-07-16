import 'package:bloc/bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:search/domain/usecase/search_movies.dart';

part 'event.dart';
part 'state.dart';

EventTransformer<T> movieDebounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class MovieBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final SearchMovies _searchMovies;
  MovieBloc(this._searchMovies) : super(MovieSearchEmpty()) {
    on<MovieOnQueryChanged>(
      (event, emit) async {
        final query = event.query;

        emit(MovieSearchLoading());

        final result = await _searchMovies.execute(query);

        result.fold(
          (failure) {
            emit(MovieSearchError(failure.message));
          },
          (data) {
            emit(MovieSearchHasData(data));
          },
        );
      },
      transformer: movieDebounce(
        const Duration(milliseconds: 500),
      ),
    );
  }
}
