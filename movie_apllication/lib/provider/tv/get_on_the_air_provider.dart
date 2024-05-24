import 'package:flutter/material.dart';
import 'package:movie_apllication/data/api/api_services_tv.dart';
import 'package:movie_apllication/data/model_tv.dart';
import 'package:movie_apllication/helper/result_state.dart';

class GetOnTheAirProvider extends ChangeNotifier {
  late ApiServicesTv apiServiceTv;
  late BaseTvResponse _tvResult;
  ResultState _state = ResultState.loading;
  String _message = '';

  String get message => _message;
  BaseTvResponse get result => _tvResult;
  ResultState get state => _state;

  GetOnTheAirProvider({required this.apiServiceTv}) {
    _fetchOnTheAir();
  }

  Future<void> _fetchOnTheAir() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final result = await apiServiceTv.getOnTheAir();

      if (result.results != null && result.results!.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        _tvResult = result;
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
