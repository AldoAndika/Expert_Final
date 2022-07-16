import 'package:core/data/datasources/db_helper.dart';
import 'package:core/data/datasources/db_tv_helper.dart';
import 'package:core/data/datasources/movie_local_datasource.dart';
import 'package:core/data/datasources/movie_remote_datasource.dart';
import 'package:core/data/datasources/tv_series_local_data_source.dart';
import 'package:core/data/datasources/tv_series_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:movies/domain/repositories/repository.dart';
import 'package:tv_series/domain/repositories/tvseries_repository.dart';

@GenerateMocks([
  RepositoryMovie,
  RepositoryTvSeries,
  MovieRemoteDataSource,
  TvSeriesRemoteDataSource,
  MovieLocalDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelper,
  TvSeriesDatabaseHelper
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
