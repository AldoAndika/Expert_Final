part of 'bloc.dart';

@immutable
abstract class DetailEvent extends Equatable {}

class OnMovieDetailCalled extends DetailEvent {
  final int id;

  OnMovieDetailCalled(this.id);
  @override
  List<Object?> get props => [id];
}
