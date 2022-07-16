import 'dart:async' as _i5;

import 'package:movies/domain/entities/movie_detail.dart' as _i7;
import 'package:movies/domain/repositories/repository.dart' as _i2;
import 'package:movies/domain/usecase/get_movie_detail.dart' as _i4;
import 'package:core/utils/failure.dart' as _i6;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

class _FakeMovieRepository_0 extends _i1.Fake implements _i2.RepositoryMovie {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetMovieDetail].
class MockGetMovieDetail extends _i1.Mock implements _i4.GetMovieDetail {
  MockGetMovieDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositoryMovie get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_0()) as _i2.RepositoryMovie);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.DetailMovie>> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<_i3.Either<_i6.Failure, _i7.DetailMovie>>.value(
              _FakeEither_1<_i6.Failure, _i7.DetailMovie>())) as _i5
          .Future<_i3.Either<_i6.Failure, _i7.DetailMovie>>);
}
