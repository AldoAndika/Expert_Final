import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/repositories/repository.dart';

class RemoveWatchlist {
  final RepositoryMovie repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(DetailMovie movie) {
    return repository.removeWatchlist(movie);
  }
}
