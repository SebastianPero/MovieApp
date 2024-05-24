import 'package:flutter/material.dart';
import 'package:movie_apllication/data/api/api_services_tv.dart';
import 'package:movie_apllication/helper/result_state.dart';
import 'package:movie_apllication/provider/tv/get_airing_today_provider.dart';
import 'package:movie_apllication/screen/list_tv_screen.dart';
import 'package:provider/provider.dart';

class AiringTodayPage extends StatelessWidget {
  const AiringTodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetAiringTodayProvider>(
      create: (_) {
        return GetAiringTodayProvider(apiServiceTv: ApiServicesTv());
      },
      child: Consumer<GetAiringTodayProvider>(
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
