part of 'bloc.dart';

@immutable
abstract class TvseriesRecommendationsEvent extends Equatable {}

class OnTvseriesRecommendationsCalled extends TvseriesRecommendationsEvent {
  final int id;

  OnTvseriesRecommendationsCalled(this.id);

  @override
  List<Object?> get props => [id];
}
