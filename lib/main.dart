import 'package:about/about_page.dart';
import 'package:core/presentation/pages/home.dart';
import 'package:core/presentation/pages/search.dart';
import 'package:core/presentation/pages/watchlist.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/ssl_helper.dart';
import 'package:core/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:movies/presentation/bloc/movie_detail/bloc.dart';
import 'package:movies/presentation/bloc/movie_recommendations/bloc.dart';
import 'package:movies/presentation/bloc/now_playing_movies/bloc.dart';
import 'package:movies/presentation/bloc/popular_movies/bloc.dart';
import 'package:movies/presentation/bloc/top_rated_movies/bloc.dart';
import 'package:movies/presentation/pages/detail_page.dart';
import 'package:movies/presentation/pages/popular_page.dart';
import 'package:movies/presentation/pages/top_rated_page.dart';
import 'package:search/presentation/bloc/movie/bloc.dart';
import 'package:search/presentation/bloc/tvseries/bloc.dart';
import 'package:search/presentation/pages/tvseries.dart';
import 'package:tv_series/presentation/bloc/on_the_air_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/popular_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/detail_tvseries/bloc.dart';
import 'package:tv_series/presentation/bloc/tvseries_recommendations/bloc.dart';
import 'package:tv_series/presentation/pages/home_tvseries_page.dart';
import 'package:tv_series/presentation/pages/popular_tvseries_page.dart';
import 'package:tv_series/presentation/pages/top_rated_tvseries_page.dart';
import 'package:tv_series/presentation/pages/tvseries_detail_page.dart';
import 'package:watchlist/presentation/bloc/movies/movies_bloc.dart';
import 'package:watchlist/presentation/bloc/tvseries/tvseries_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SSLHelper.init();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<NowPlayingMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieRecommendationsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailBlocMovie>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedBlocMovie>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularBlocMovie>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistBlocMovies>(),
        ),
        BlocProvider(
          create: (_) => di.locator<OnTheAirBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvRecommendationsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailBlocTv>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedBlocTv>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularBlocTv>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistBlocTv>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          colorScheme: kColorScheme.copyWith(secondary: kMikadoYellow),
        ),
        home: const HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case SearchPage.routeName:
              return CupertinoPageRoute(builder: (_) => const SearchPage());
            case DetailPageMovie.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => DetailPageMovie(id: id),
                settings: settings,
              );
            case HomeTvSeriesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const HomeTvSeriesPage());
            case PopularTvSeriesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const PopularTvSeriesPage());
            case TopRatedTvSeriesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedTvSeriesPage());
            case SearchPageTvSeries.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const SearchPageTvSeries());
            case TvSeriesDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );

            case WatchlistPage.routeName:
              return MaterialPageRoute(builder: (_) => const WatchlistPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
