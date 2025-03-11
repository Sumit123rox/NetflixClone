import 'package:flutter/material.dart';

const apiKey = "your_api_key";
const backgroundColor = Colors.black;
const baseUrl = 'https://api.themoviedb.org/3/';
const imageUrlOriginal = "https://image.tmdb.org/t/p/original";
const imageUrlCustom = "https://image.tmdb.org/t/p/w500";
const moviePopularEndPoint = "movie/popular";
const movieNowPlayingEndPoint = "movie/now_playing";
const movieUpcomingEndPoint = "movie/upcoming";
const movieTopRatedEndPoint = "movie/top_rated";
const searchMovieEndPoint = "search/multi";
const searchMovieQuery =
    "$searchMovieEndPoint?page=1&include_adult=true&language=en-US&query=";
const searchMovieById = "movie/";
