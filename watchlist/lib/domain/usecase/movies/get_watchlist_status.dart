import 'package:movies/domain/repositories/repository.dart';

class GetWatchListStatus {
  final RepositoryMovie repository;

  GetWatchListStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
