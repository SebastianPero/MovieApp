import 'package:flutter/material.dart';
import 'package:movie_apllication/card/movies_card.dart';
import 'package:movie_apllication/data/api/api_services_movie.dart';
import 'package:movie_apllication/helper/result_state.dart';
import 'package:movie_apllication/provider/movie/get_upcomming_provider.dart';
import 'package:provider/provider.dart';

class UpcommingPage extends StatelessWidget {
  const UpcommingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetUpcommingProvider>(
      create: (_) {
        return GetUpcommingProvider(apiServiceMovie: ApiServicesMovie());
      },
      child: Consumer<GetUpcommingProvider>(
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
