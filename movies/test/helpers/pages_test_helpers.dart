import 'package:mocktail/mocktail.dart';
import 'package:movies/movies.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:movies/presentation/bloc/movie_detail/bloc.dart';
import 'package:movies/presentation/bloc/movie_recommendations/bloc.dart';
import 'package:movies/presentation/bloc/now_playing_movies/bloc.dart';
import 'package:movies/presentation/bloc/popular_movies/bloc.dart';
import 'package:movies/presentation/bloc/top_rated_movies/bloc.dart';
import 'package:watchlist/presentation/bloc/movies/movies_bloc.dart';

// fake now playing movies bloc
class FakeNowPlayingMoviesEvent extends Fake implements NowPlayingMovieEvent {}

class FakeNowPlayingMoviesState extends Fake implements NowPlayingMovieState {}

class FakeNowPlayingMoviesBloc
    extends MockBloc<NowPlayingMovieEvent, NowPlayingMovieState>
    implements NowPlayingMovieBloc {}

// fake popular movies bloc
class FakePopularMoviesEvent extends Fake implements PopularMoviesEvent {}

class FakePopularMoviesState extends Fake implements PopularMoviesState {}

class FakePopularMoviesBloc
    extends MockBloc<PopularMoviesEvent, PopularMoviesState>
    implements PopularBlocMovie {}

// fake top rated movies bloc
class FakeTopRatedMoviesEvent extends Fake implements TopRatedMoviesEvent {}

class FakeTopRatedMoviesState extends Fake implements TopRatedMoviesState {}

class FakeTopRatedMoviesBloc
    extends MockBloc<TopRatedMoviesEvent, TopRatedMoviesState>
    implements TopRatedBlocMovie {}

// fake detail movie bloc
class FakeMovieDetailEvent extends Fake implements DetailEvent {}

class FakeMovieDetailState extends Fake implements DetailState {}

class FakeMovieDetailBloc extends MockBloc<DetailEvent, DetailState>
    implements DetailBlocMovie {}

// fake movie recommendations bloc
class FakeMovieRecommendationsEvent extends Fake
    implements RecommendationsEvent {}

class FakeMovieRecommendationsState extends Fake
    implements MovieRecommendationsState {}

class FakeMovieRecommendationsBloc
    extends MockBloc<RecommendationsEvent, MovieRecommendationsState>
    implements MovieRecommendationsBloc {}

// fake watchlist movies bloc
class FakeWatchlistMoviesEvent extends Fake implements WatchlistMoviesEvent {}

class FakeWatchlistMoviesState extends Fake implements WatchlistMoviesState {}

class FakeWatchlistMoviesBloc
    extends MockBloc<WatchlistMoviesEvent, WatchlistMoviesState>
    implements WatchlistBlocMovies {}
