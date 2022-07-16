import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/repositories/repository.dart';

class GetMovieDetail {
  final RepositoryMovie repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, DetailMovie>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
