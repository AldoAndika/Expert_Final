part of 'bloc.dart';

@immutable
abstract class NowPlayingMovieEvent extends Equatable {}

class OnNowPlayingMovieCalled extends NowPlayingMovieEvent {
  @override
  List<Object> get props => [];
}
