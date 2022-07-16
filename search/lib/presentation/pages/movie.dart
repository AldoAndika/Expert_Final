import 'package:core/presentation/widgets/movie_list_card.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/movie/bloc.dart';

class SearchPageMovies extends StatelessWidget {
  static const routeName = '/searchPageMovies';

  const SearchPageMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (query) {
              context.read<MovieBloc>().add(MovieOnQueryChanged(query));
            },
            decoration: const InputDecoration(
              hintText: 'Search title',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.search,
          ),
          const SizedBox(height: 16),
          Text(
            'Search Result',
            style: kHeading6,
          ),
          _buildSearchMovie()
        ],
      ),
    );
  }
}

Widget _buildSearchMovie() {
  return BlocBuilder<MovieBloc, MovieSearchState>(
    builder: (context, state) {
      if (state is MovieSearchLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is MovieSearchHasData) {
        final result = state.result;
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final movie = result[index];
              return CardMovie(movie);
            },
            itemCount: result.length,
          ),
        );
      } else if (state is MovieSearchError) {
        return Expanded(
          child: Center(
            child: Text(state.message),
          ),
        );
      } else {
        return Expanded(
          child: Container(),
        );
      }
    },
  );
}
