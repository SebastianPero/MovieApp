import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_apllication/data/model_movies.dart';

class ApiServicesMovie {
  static const _baseurl = 'https://api.themoviedb.org/3/movie';
  static const String bearertoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YmEwMWZhNjY0YmFkODYyZjVjOGY2Y2JiZWM1ZjI5MSIsInN1YiI6IjVjMzA1Y2QxOTI1MTQxNmQ5NDZmMzcyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JE_61sIEpt4O2VzmJ1rG8ER5SqU4QjdUExTi-1mj2Nw';

  var headers = {
    'Authorization': 'Bearer $bearertoken',
    'Content-Type': 'application/json',
  };

  Future<BaseMoviesResponse> getMoviesNowPlaying() async {
    final response =
        await http.get(Uri.parse('$_baseurl/now_playing'), headers: headers);
    if (response.statusCode == 200) {
      return BaseMoviesResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list movies');
    }
  }

  Future<BaseMoviesResponse> getPopuler() async {
    final response =
        await http.get(Uri.parse('$_baseurl/popular'), headers: headers);
    if (response.statusCode == 200) {
      return BaseMoviesResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list movies');
    }
  }

  Future<BaseMoviesResponse> getTopRated() async {
    final response =
        await http.get(Uri.parse('$_baseurl/top_rated'), headers: headers);
    if (response.statusCode == 200) {
      return BaseMoviesResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list movies');
    }
  }

  Future<BaseMoviesResponse> getUpcomming() async {
    final response =
        await http.get(Uri.parse('$_baseurl/upcoming'), headers: headers);
    if (response.statusCode == 200) {
      return BaseMoviesResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list movies');
    }
  }

  Future<Result> getDetailMovies(String id) async {
    final response =
        await http.get(Uri.parse('$_baseurl/$id'), headers: headers);
    if (response.statusCode == 200) {
      return Result.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list movies');
    }
  }
}
