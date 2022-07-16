import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:watchlist/domain/usecase/movies/get_watchlist.dart';
import 'package:watchlist/domain/usecase/movies/get_watchlist_status.dart';
import 'package:watchlist/domain/usecase/movies/remove_watchlist.dart';
import 'package:watchlist/domain/usecase/movies/save_watchlist.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class WatchlistBlocMovies
    extends Bloc<WatchlistMoviesEvent, WatchlistMoviesState> {
  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchListStatus _getWatchListStatusMovies;
  final RemoveWatchlist _removeWatchlistMovies;
  final SaveWatchlist _saveWatchlistMovies;
  WatchlistBlocMovies(
      this._getWatchlistMovies,
      this._getWatchListStatusMovies,
      this._removeWatchlistMovies,
      this._saveWatchlistMovies,
      ) : super(WatchlistMoviesEmpty()) {
    on<OnWatchlistMoviesCalled>((event, emit) async {
      emit(WatchlistMoviesLoading());
      final result = await _getWatchlistMovies.execute();

      result.fold(
              (failure) => emit(WatchlistMoviesError(failure.message)),
              (data) => data.isNotEmpty
              ? emit(WatchlistMoviesHasData(data))
              : emit(
            WatchlistMoviesEmpty(),
          ));
    });

    on<FetchWatchlistStatus>(((event, emit) async {
      final id = event.id;

      final result = await _getWatchListStatusMovies.execute(id);

      emit(WatchlistMoviesIsAdded(result));
    }));

    on<AddMovieToWatchlist>(
      ((event, emit) async {
        final movie = event.movieDetail;

        final result = await _saveWatchlistMovies.execute(movie);

        result.fold(
              (failure) => emit(WatchlistMoviesError(failure.message)),
              (message) => emit(
            WatchlistMoviesMessage(message),
          ),
        );
      }),
    );

    on<RemoveMovieFromWatchlist>(
      ((event, emit) async {
        final movie = event.movieDetail;

        final result = await _removeWatchlistMovies.execute(movie);

        result.fold(
              (failure) => emit(WatchlistMoviesError(failure.message)),
              (message) => emit(
            WatchlistMoviesMessage(message),
          ),
        );
      }),
    );
  }
}
