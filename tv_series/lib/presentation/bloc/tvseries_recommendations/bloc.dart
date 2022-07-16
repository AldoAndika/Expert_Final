import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series/tvseries.dart';
import 'package:tv_series/domain/usecase/get_recommendations.dart';

part 'event.dart';
part 'state.dart';

class TvRecommendationsBloc
    extends Bloc<TvseriesRecommendationsEvent, TvseriesRecommendationsState> {
  final GetTvSeriesRecommendations _getTvseriesRecommendations;
  TvRecommendationsBloc(this._getTvseriesRecommendations)
      : super(TvseriesRecommendationsEmpty()) {
    on<OnTvseriesRecommendationsCalled>((event, emit) async {
      final id = event.id;

      emit(TvseriesRecommendationsLoading());

      final result = await _getTvseriesRecommendations.execute(id);

      result.fold(
        (failure) => emit(TvseriesRecommendationsError(failure.message)),
        (data) => data.isNotEmpty
            ? emit(TvseriesRecommendationsHasData(data))
            : emit(TvseriesRecommendationsEmpty()),
      );
    });
  }
}
