import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series/tvseries.dart';
import 'package:tv_series/domain/usecase/get_popular.dart';

part 'event.dart';
part 'state.dart';

class PopularBlocTv
    extends Bloc<PopularTvseriesEvent, PopularTvseriesState> {
  final GetPopularTvSeries _getPopularTvseries;
  PopularBlocTv(this._getPopularTvseries)
      : super(PopularTvseriesEmpty()) {
    on<OnPopularTvseriesCalled>((event, emit) async {
      emit(PopularTvseriesLoading());

      final result = await _getPopularTvseries.execute();

      result.fold(
        (failure) => emit(PopularTvseriesError(failure.message)),
        (data) => data.isNotEmpty
            ? emit(PopularTvseriesHasData(data))
            : emit(PopularTvseriesEmpty()),
      );
    });
  }
}
