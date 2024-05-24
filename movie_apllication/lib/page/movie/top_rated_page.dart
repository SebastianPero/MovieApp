import 'package:flutter/material.dart';
import 'package:movie_apllication/card/movies_card.dart';
import 'package:movie_apllication/data/api/api_services_movie.dart';
import 'package:movie_apllication/helper/result_state.dart';
import 'package:movie_apllication/provider/movie/get_top_rated_provider.dart';
import 'package:provider/provider.dart';

class TopRatedPage extends StatelessWidget {
  const TopRatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetTopRatedProvider>(
      create: (_) {
        return GetTopRatedProvider(apiServiceMovie: ApiServicesMovie());
      },
      child: Consumer<GetTopRatedProvider>(
        builder: (context, provider, child) {
          switch (provider.state) {
            case ResultState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ResultState.hasData:
              return MoviesCard(movies: provider.result.results ?? []);
            case ResultState.noData:
            case ResultState.error:
              return Center(
                child: Text(provider.message),
              );
          }
        },
      ),
    );
  }
}
