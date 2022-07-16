part of 'bloc.dart';

@immutable
abstract class RecommendationsEvent extends Equatable {}

class OnMovieRecommendationsCalled extends RecommendationsEvent {
  final int id;

  OnMovieRecommendationsCalled(this.id);

  @override
  List<Object?> get props => [id];
}
