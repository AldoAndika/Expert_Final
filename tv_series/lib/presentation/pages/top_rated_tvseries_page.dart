import 'package:core/presentation/widgets/tv_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tvseries/bloc.dart';

class TopRatedTvSeriesPage extends StatefulWidget {
  static const routeName = '/top-rated-TvSeries';

  const TopRatedTvSeriesPage({Key? key}) : super(key: key);

  @override
  _TopRatedMoviesPageState createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TopRatedBlocTv>().add(OnTopRatedTvseriesCalled()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedBlocTv, TopRatedTvseriesState>(
          builder: (context, state) {
            if (state is TopRatedTvseriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvseriesHasData) {
              final tvseries = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = tvseries[index];
                  return CardTv(tv);
                },
                itemCount: tvseries.length,
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text((state as TopRatedTvseriesError).message),
              );
            }
          }),
        )
      );
  }
}
