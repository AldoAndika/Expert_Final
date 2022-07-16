import 'package:core/data/datasources/db_helper.dart';
import 'package:core/data/datasources/db_tv_helper.dart';
import 'package:core/data/datasources/movie_local_datasource.dart';
import 'package:core/data/datasources/movie_remote_datasource.dart';
import 'package:core/data/datasources/tv_series_local_data_source.dart';
import 'package:core/data/datasources/tv_series_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:core/data/repositories/movie_repository_impl.dart';
import 'package:core/data/repositories/tv_repository_impl.dart';
import 'package:core/utils/ssl_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/domain/repositories/repository.dart';
import 'package:movies/domain/usecase/get_movie_detail.dart';
import 'package:movies/domain/usecase/get_movie_recommendations.dart';
import 'package:movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies/domain/usecase/get_popular_movies.dart';
import 'package:movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies/presentation/bloc/movie_detail/bloc.dart';
import 'package:movies/presentation/bloc/movie_recommendations/bloc.dart';
import 'package:movies/presentation/bloc/now_playing_movies/bloc.dart';
import 'package:movies/presentation/bloc/popular_movies/bloc.dart';
import 'package:movies/presentation/bloc/top_rated_movies/bloc.dart';
import 'package:search/domain/usecase/search_movies.dart';
import 'package:search/domain/usecase/search_tvseries.dart';
import 'package:search/presentation/bloc/movie/bloc.dart';
import 'package:search/presentation/bloc/tvseries/bloc.dart';
import 'package:tv_series/domain/repositories/tvseries_repository.dart';
import 'package:tv_series/domain/usecase/get_now_playing.dart';
import 'package:tv_series/domain/usecase/get_popular.dart';
import 'package:tv_series/domain/usecase/get_top_rated.dart';
import 'package:tv_series/domain/usecase/get_detail.dart';
import 'package:tv_series/domain/usecase/get_recommendations.dart';
import 'package:tv_series/presentation/bloc/on_the_air_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/popular_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/detail_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/tvseries_recommendations/bloc.dart';
import 'package:watchlist/domain/usecase/movies/get_watchlist.dart';
import 'package:watchlist/domain/usecase/movies/get_watchlist_status.dart';
import 'package:watchlist/domain/usecase/movies/remove_watchlist.dart';
import 'package:watchlist/domain/usecase/movies/save_watchlist.dart';
import 'package:watchlist/domain/usecase/tvseries/get_watchlist.dart';
import 'package:watchlist/domain/usecase/tvseries/get_watchlist_status.dart';
import 'package:watchlist/domain/usecase/tvseries/remove_watchlist.dart';
import 'package:watchlist/domain/usecase/tvseries/save_watchlist.dart';
import 'package:watchlist/presentation/bloc/movies/movies_bloc.dart';
import 'package:watchlist/presentation/bloc/tvseries/tvseries_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // BLoC Movies
  locator.registerFactory<NowPlayingMovieBloc>(
    () => NowPlayingMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DetailBlocMovie(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedBlocMovie(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularBlocMovie(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistBlocMovies(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  // BLoC TvSeries
  locator.registerFactory(
    () => OnTheAirBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvRecommendationsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DetailBlocTv(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedBlocTv(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularBlocTv(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistBlocTv(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  // Usecase
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetOnTheAirTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTvSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

  // Repository
  locator.registerLazySingleton<RepositoryMovie>(
    () => RepositoryImplMovie(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<RepositoryTvSeries>(
    () => RepositoryImplTvSeries(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // Datasource
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(ioClient: locator()));
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(ioClient: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // Helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<TvSeriesDatabaseHelper>(
      () => TvSeriesDatabaseHelper());

  // External
  locator.registerLazySingleton(() => http.Client);
  locator.registerLazySingleton(() => SSLHelper.client);
}
