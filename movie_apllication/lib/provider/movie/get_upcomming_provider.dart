import 'package:flutter/material.dart';
import 'package:movie_apllication/data/api/api_services_movie.dart';
import 'package:movie_apllication/data/model_movies.dart';
import 'package:movie_apllication/helper/result_state.dart';

class GetUpcommingProvider extends ChangeNotifier {
  late final ApiServicesMovie apiServiceMovie;
  late BaseMoviesResponse _moviesResult;
  ResultState _state = ResultState.loading;
  String _message = '';

  String get message => _message;
  BaseMoviesResponse get result => _moviesResult;
  ResultState get state => _state;

  GetUpcommingProvider({required this.apiServiceMovie}) {
    _fetchUpcomming();
  }

  Future<void> _fetchUpcomming() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final result = await apiServiceMovie.getUpcomming();

      if (result.results != null && result.results!.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        _moviesResult = result;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        _message = 'No results found';
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      _message = 'Error loading data: $e';
    }
  }
}
