import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/usecase/get_movie_detail.dart';

part 'event.dart';
part 'state.dart';

class DetailBlocMovie extends Bloc<DetailEvent, DetailState> {
  final GetMovieDetail _getMovieDetail;
  DetailBlocMovie(this._getMovieDetail) : super(MovieDetailEmpty()) {
    on<OnMovieDetailCalled>((event, emit) async {
      final id = event.id;

      emit(MovieDetailLoading());

      final result = await _getMovieDetail.execute(id);

      result.fold((failure) => emit(MovieDetailError(failure.message)),
          (data) => emit(MovieDetailHasData(data)));
    });
  }
}
