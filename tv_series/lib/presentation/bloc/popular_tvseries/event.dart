part of 'bloc.dart';

@immutable
abstract class PopularTvseriesEvent extends Equatable {}

class OnPopularTvseriesCalled extends PopularTvseriesEvent {
  @override
  List<Object> get props => [];
}
