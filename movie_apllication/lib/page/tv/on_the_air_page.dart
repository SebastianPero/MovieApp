import 'package:flutter/material.dart';
import 'package:movie_apllication/data/api/api_services_tv.dart';
import 'package:movie_apllication/helper/result_state.dart';
import 'package:movie_apllication/provider/tv/get_on_the_air_provider.dart';
import 'package:movie_apllication/screen/list_tv_screen.dart';
import 'package:provider/provider.dart';

class OnTheAirPage extends StatelessWidget {
  const OnTheAirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetOnTheAirProvider>(
      create: (_) {
        return GetOnTheAirProvider(apiServiceTv: ApiServicesTv());
      },
      child: Consumer<GetOnTheAirProvider>(
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
