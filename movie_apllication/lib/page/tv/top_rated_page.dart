import 'package:flutter/material.dart';
import 'package:movie_apllication/data/api/api_services_tv.dart';
import 'package:movie_apllication/helper/result_state.dart';
import 'package:movie_apllication/provider/tv/get_top_rated_provider.dart';
import 'package:movie_apllication/screen/list_tv_screen.dart';
import 'package:provider/provider.dart';

class TopRatedTvPage extends StatelessWidget {
  const TopRatedTvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetTopRatedTvProvider>(
      create: (_) {
        return GetTopRatedTvProvider(apiServiceTv: ApiServicesTv());
      },
      child: Consumer<GetTopRatedTvProvider>(
        builder: (context, provider, child) {
          switch (provider.state) {
            case ResultState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ResultState.hasData:
              return const ListTvScreen();
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
