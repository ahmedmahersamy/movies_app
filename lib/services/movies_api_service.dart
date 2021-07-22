import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movies_app/models/movie.dart';

class MoviesApiService {
  final Dio _dio = Dio();
  var logger = Logger();

  ///trending/all/day?
  final String baseUrl = "https://api.themoviedb.org/3";
  final String apiKey = "api_key=4e4189f6fef2d432a9866a7d782d4dd6";

  Future<List<Movie>> getTrendingMovies() async
  {
    try {
      final String url = '$baseUrl/trending/movie/Week?$apiKey';
      final response = await _dio.get(url);
      var   movies = response.data['results'] as List;
      //print("${movies.toList()}  here clever");

      // if(response.data!=null) {
      //
      // }

      List<Movie> movieList=movies.map((m)=>Movie.fromJson(m)).toList();
      // logger.d(movieList);
      logger.d(url);
        logger.d(response.headers);
        logger.d(response.data);
        logger.d(response.data);
        logger.d(movies);
        logger.d(url);

     // print('****************************************************************************************');
     // print("${movieList[0]}  here clever");
      return movieList;
    } catch (error ,stacktrace){
      throw Exception('Exception : $error with stacktrace: $stacktrace');
    }
  }

  Future<Movie?> getMovieDetail(int movieId) async {
    try {
      final String url = '$baseUrl/movie/$movieId?$apiKey';

      final response = await _dio.get(url);
      print(response.data.toString()+"++++++++++++++++++++++++++++++++++++++++++++++");
      Movie movieDetail = Movie.fromJson(response.data);
      print(movieDetail.title + " from api details func   +++++++++++++++++++++++++++++");

    // if(response.data!=null)
    // {
    logger.d(url);
    logger.d(response.headers);
    logger.d(response.data);
    //
    // }

      print(movieDetail.trailerId + "After calling api details func ++++++++++++++++++++++++++++");
      return movieDetail;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

}