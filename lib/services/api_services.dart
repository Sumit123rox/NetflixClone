import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/movie_response.dart';
import 'package:netflix_clone/models/popular_movie_response.dart';
import 'package:netflix_clone/models/search_response.dart';

class ApiServices {
  Future<MovieResponse> getUpcomingMovies() async {
    log('api: $baseUrl$movieUpcomingEndPoint?api_key=$apiKey');
    var response = await http.get(
      Uri.parse("$baseUrl$movieUpcomingEndPoint?api_key=$apiKey"),
    );

    log("${response.statusCode}");

    if (response.statusCode == 200) {
      log("Success: ${response.body}");
      return movieResponseFromJson(response.body);
    }

    throw Exception(
      "Failed to load Upcoming Movies, Code: ${response.statusCode}",
    );
  }

  Future<PopularMovieResponse> getPopularMovies() async {
    log('api: $baseUrl$moviePopularEndPoint?api_key=$apiKey');
    var response = await http.get(
      Uri.parse("$baseUrl$moviePopularEndPoint?api_key=$apiKey"),
    );

    log("Popular: ${response.statusCode}");

    if (response.statusCode == 200) {
      log("Success: ${response.body}");
      return popularMovieResponseFromJson(response.body);
    }

    throw Exception(
      "Failed to load Popular Movies, Code: ${response.statusCode}",
    );
  }

  Future<MovieResponse> getNowPlayingMovies() async {
    log('api: $baseUrl$movieNowPlayingEndPoint?api_key=$apiKey');
    var response = await http.get(
      Uri.parse("$baseUrl$movieNowPlayingEndPoint?api_key=$apiKey"),
    );

    log("${response.statusCode}");

    if (response.statusCode == 200) {
      log("Success: ${response.body}");
      return movieResponseFromJson(response.body);
    }

    throw Exception(
      "Failed to load Now Playing Movies, Code: ${response.statusCode}",
    );
  }

  Future<SearchResponse> getSearchAll(String query) async {
    log('api: $baseUrl$searchMovieQuery$query&api_key=$apiKey');
    var response = await http.get(
      Uri.parse("$baseUrl$searchMovieQuery$query&api_key=$apiKey"),
    );

    log("${response.statusCode}");

    if (response.statusCode == 200) {
      log("Success: ${response.body}");
      return SearchResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception(
      "Failed to load searched movies, Code: ${response.statusCode}",
    );
  }

  Future<PopularMovieResponse> getTopRatedMovies() async {
    log('api: $baseUrl$movieTopRatedEndPoint?api_key=$apiKey');
    var response = await http.get(
      Uri.parse("$baseUrl$movieTopRatedEndPoint?api_key=$apiKey"),
    );

    log("${response.statusCode}");

    if (response.statusCode == 200) {
      log("Success: ${response.body}");
      return popularMovieResponseFromJson(response.body);
    }

    throw Exception(
      "Failed to load top rated movies, Code: ${response.statusCode}",
    );
  }

  Future<MovieModel> getMovieById(int movieId) async {
    log('api: $baseUrl$searchMovieById$movieId?api_key=$apiKey');
    var response = await http.get(
      Uri.parse("$baseUrl$searchMovieById$movieId?api_key=$apiKey"),
    );

    log("${response.statusCode}");

    if (response.statusCode == 200) {
      log("Success: ${response.body}");
      return MovieModel.fromJson(jsonDecode(response.body));
    }

    throw Exception(
      "Failed to load movie by the given Id, Code: ${response.statusCode}",
    );
  }

  Future<PopularMovieResponse> getSimilarMovies(int movieId) async {
    log('api: $baseUrl$searchMovieById$movieId/similar?api_key=$apiKey');
    var response = await http.get(
      Uri.parse("$baseUrl$searchMovieById$movieId/similar?api_key=$apiKey"),
    );

    log("${response.statusCode}");

    if (response.statusCode == 200) {
      log("Success: ${response.body}");
      return popularMovieResponseFromJson(response.body);
    }

    throw Exception(
      "Failed to load similar movies, Code: ${response.statusCode}",
    );
  }
}
