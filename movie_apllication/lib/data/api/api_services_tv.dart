import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_apllication/data/model_tv.dart';

class ApiServicesTv {
  static const _baseurl = 'https://api.themoviedb.org/3/tv';
  static const String bearertoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YmEwMWZhNjY0YmFkODYyZjVjOGY2Y2JiZWM1ZjI5MSIsInN1YiI6IjVjMzA1Y2QxOTI1MTQxNmQ5NDZmMzcyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JE_61sIEpt4O2VzmJ1rG8ER5SqU4QjdUExTi-1mj2Nw';

  var headers = {
    'Authorization': 'Bearer $bearertoken',
    'Content-Type': 'application/json',
  };

  Future<BaseTvResponse> getAiringtoday() async {
    final response =
        await http.get(Uri.parse('$_baseurl/airing_today'), headers: headers);
    if (response.statusCode == 200) {
      return BaseTvResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list Tv');
    }
  }

  Future<BaseTvResponse> getOnTheAir() async {
    final response =
        await http.get(Uri.parse('$_baseurl/on_the_air'), headers: headers);
    if (response.statusCode == 200) {
      return BaseTvResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list Tv');
    }
  }

  Future<BaseTvResponse> getpopular() async {
    final response =
        await http.get(Uri.parse('$_baseurl/popular'), headers: headers);
    if (response.statusCode == 200) {
      return BaseTvResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list Tv');
    }
  }

  Future<BaseTvResponse> getTopRatedTv() async {
    final response =
        await http.get(Uri.parse('$_baseurl/top_rated'), headers: headers);
    if (response.statusCode == 200) {
      return BaseTvResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list Tv');
    }
  }

  Future<Result> getDetailTv(String id) async {
    final response =
        await http.get(Uri.parse('$_baseurl/$id'), headers: headers);
    if (response.statusCode == 200) {
      return Result.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load list Tv');
    }
  }
}
