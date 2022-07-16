import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:watchlist/presentation/bloc/movies/movies_bloc.dart';
import 'package:watchlist/presentation/bloc/tvseries/tvseries_bloc.dart';

// fake moviw watclist
class FakeWatchlistMovieEvent extends Fake implements WatchlistMoviesEvent {}

class FakeWatchlistMovieState extends Fake implements WatchlistMoviesState {}

class FakeWatchlistMovieBloc
    extends MockBloc<WatchlistMoviesEvent, WatchlistMoviesState>
    implements WatchlistBlocMovies {}

class FakeWatchlistTvSeriesEvent extends Fake implements WatchlistTvseriesEvent {}

class FakeWatchlistTvSeriesState extends Fake implements WatchlistTvseriesState {}

class FakeWatchlistTvSeriesBloc
    extends MockBloc<WatchlistTvseriesEvent, WatchlistTvseriesState>
    implements WatchlistBlocTv {}

