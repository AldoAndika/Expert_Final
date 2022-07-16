import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/repositories/repository.dart';

class SaveWatchlist {
  final RepositoryMovie repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(DetailMovie movie) {
    return repository.saveWatchlist(movie);
  }
}
