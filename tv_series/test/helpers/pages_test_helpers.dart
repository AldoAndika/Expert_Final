import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tv_series/presentation/bloc/on_the_air_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/popular_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/detail_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/tvseries_recommendations/bloc.dart';
import 'package:watchlist/presentation/bloc/tvseries/tvseries_bloc.dart';


// fake on the air Tvseries bloc
class FakeOnTheAirTvseriesEvent extends Fake implements OnTheAirTvseriesEvent {}

class FakeOnTheAirTvseriesState extends Fake implements OnTheAirTvseriesState {}

class FakeOnTheAirTvseriesBloc
    extends MockBloc<OnTheAirTvseriesEvent, OnTheAirTvseriesState>
    implements OnTheAirBloc {}

// fake popular Tvseries bloc
class FakePopularTvseriesEvent extends Fake implements PopularTvseriesEvent {}

class FakePopularTvseriesState extends Fake implements PopularTvseriesState {}

class FakePopularTvseriesBloc
    extends MockBloc<PopularTvseriesEvent, PopularTvseriesState>
    implements PopularBlocTv {}

// fake top rated Tvseries bloc
class FakeTopRatedTvseriesEvent extends Fake implements TopRatedTvseriesEvent {}

class FakeTopRatedTvseriesState extends Fake implements TopRatedTvseriesState {}

class FakeTopRatedTvseriesBloc
    extends MockBloc<TopRatedTvseriesEvent, TopRatedTvseriesState>
    implements TopRatedBlocTv {}

// fake detail Tvseries bloc
class FakeTvseriesDetailEvent extends Fake implements TvseriesDetailEvent {}

class FakeTvseriesDetailState extends Fake implements TvseriesDetailState {}

class FakeTvseriesDetailBloc
    extends MockBloc<TvseriesDetailEvent, TvseriesDetailState>
    implements DetailBlocTv {}

// fake Tvseries recommendations bloc
class FakeTvseriesRecommendationsEvent extends Fake
    implements TvseriesRecommendationsEvent {}

class FakeTvseriesRecommendationsState extends Fake
    implements TvseriesRecommendationsState {}

class FakeTvseriesRecommendationsBloc
    extends MockBloc<TvseriesRecommendationsEvent, TvseriesRecommendationsState>
    implements TvRecommendationsBloc {}

// fake watchlist Tvseries bloc
class FakeWatchlistTvseriesEvent extends Fake
    implements WatchlistTvseriesEvent {}

class FakeWatchlistTvseriesState extends Fake
    implements WatchlistTvseriesState {}

class FakeWatchlistTvseriesBloc
    extends MockBloc<WatchlistTvseriesEvent, WatchlistTvseriesState>
    implements WatchlistBlocTv {}
