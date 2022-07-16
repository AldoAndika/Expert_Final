part of 'movies_bloc.dart';

@immutable
abstract class WatchlistMoviesEvent extends Equatable {}

class OnWatchlistMoviesCalled extends WatchlistMoviesEvent {
  @override
  List<Object?> get props => [];
}

class FetchWatchlistStatus extends WatchlistMoviesEvent {
  final int id;
  FetchWatchlistStatus(this.id);
  @override
  List<Object?> get props => [id];
}

class AddMovieToWatchlist extends WatchlistMoviesEvent {
  final DetailMovie movieDetail;
  AddMovieToWatchlist(this.movieDetail);
  @override
  List<Object?> get props => [movieDetail];
}

class RemoveMovieFromWatchlist extends WatchlistMoviesEvent {
  final DetailMovie movieDetail;
  RemoveMovieFromWatchlist(this.movieDetail);
  @override
  List<Object?> get props => [movieDetail];
}
