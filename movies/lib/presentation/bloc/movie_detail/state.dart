part of 'bloc.dart';

@immutable
abstract class DetailState extends Equatable {}

class MovieDetailEmpty extends DetailState {
  @override
  List<Object?> get props => [];
}

class MovieDetailLoading extends DetailState {
  @override
  List<Object?> get props => [];
}

class MovieDetailError extends DetailState {
  final String message;

  MovieDetailError(this.message);
  @override
  List<Object?> get props => [message];
}

class MovieDetailHasData extends DetailState {
  final DetailMovie result;

  MovieDetailHasData(this.result);
  @override
  List<Object?> get props => [result];
}
