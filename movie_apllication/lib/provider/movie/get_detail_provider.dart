import 'package:flutter/material.dart';
import 'package:movie_apllication/data/api/api_services_movie.dart';
import 'package:movie_apllication/data/model_movies.dart';
import 'package:movie_apllication/helper/result_state.dart';

class GetDetailMoviesProvider extends ChangeNotifier {
  final ApiServicesMovie apiService;
  final String id;

  late Result _movies;
  ResultState _state = ResultState.loading;
  String _message = '';

  String get message => _message;
  Result get movies => _movies;
  ResultState get state => _state;

  GetDetailMoviesProvider(this.id, {required this.apiService}) {
    _fetchDetailMovie(id);
  }

  Future<void> _fetchDetailMovie(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final result = await apiService.getDetailMovies(id);

      if (result.overview != "" &&
          result.title != "" &&
          result.releaseDate != "" &&
          result.popularity != 0.0 &&
          result.voteAverage != 0.0) {
        _state = ResultState.hasData;
        notifyListeners();
        _movies = result;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        _message = 'No results found by id:$id';
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      _message = 'Error loading data: $e';
    }
  }
}
