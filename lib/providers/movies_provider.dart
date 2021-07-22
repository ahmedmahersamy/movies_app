import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/services/movies_api_service.dart';

class MoviesProvider with ChangeNotifier{
  MoviesApiService _moviesApiService = MoviesApiService();
   List<Movie> moviesList =[];
  Movie? movie ;

  Future<List<Movie>> getMoviesList() async
  {
     moviesList = await _moviesApiService.getTrendingMovies();

    notifyListeners();

    return moviesList;
  }

    Future<Movie?> getMovieDetails(int movieId) async
    {
      print("-------------------------------- from movie provider " +movieId.toString());

       movie = await _moviesApiService.getMovieDetail(movieId);
      print("-------------------------------------- from movie provider After " +movie!.title);
      notifyListeners();
      return movie;
    }

}