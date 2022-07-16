import 'package:tv_series/domain/repositories/tvseries_repository.dart';

class GetWatchListStatusTvSeries {
  final RepositoryTvSeries repository;

  GetWatchListStatusTvSeries(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistTvSeries(id);
  }
}
