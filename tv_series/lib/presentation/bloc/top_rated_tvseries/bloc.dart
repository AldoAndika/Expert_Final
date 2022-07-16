import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series/tvseries.dart';
import 'package:tv_series/domain/usecase/get_top_rated.dart';

part 'event.dart';
part 'state.dart';

class TopRatedBlocTv
    extends Bloc<TopRatedTvseriesEvent, TopRatedTvseriesState> {
  final GetTopRatedTvSeries _getTopRatedTvseries;
  TopRatedBlocTv(this._getTopRatedTvseries)
      : super(TopRatedTvseriesEmpty()) {
    on<OnTopRatedTvseriesCalled>((event, emit) async {
      emit(TopRatedTvseriesLoading());
      final result = await _getTopRatedTvseries.execute();

      result.fold(
        (failure) => emit(TopRatedTvseriesError(failure.message)),
        (data) => data.isNotEmpty
            ? emit(TopRatedTvseriesHasData(data))
            : emit(TopRatedTvseriesEmpty()),
      );
    });
  }
}
