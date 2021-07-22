import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {

  static const routeName ='/moviesDetails';

  @override
  Widget build(BuildContext context) {

    final movieId = ModalRoute.of(context)!.settings.arguments as int;
    final movieProvider = Provider.of<MoviesProvider>(context ,listen: false);
    final Future<Movie?> moviesDetails = movieProvider.getMovieDetails(movieId);
    final imageUrl ="https://image.tmdb.org/t/p/original";

    print(movieId.toString() +"from details screen");

    return Scaffold(
      appBar:AppBar(title: Text("Movie Details"),),
      body: FutureBuilder<Movie?>(
        future: moviesDetails,

        builder:(context, snapshot) {
          //print(snapshot.data!.title);
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Column(
                children: [
                  GridTile(
                    
                    child: GestureDetector(

                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Image(
                          
                          image: NetworkImage("https://image.tmdb.org/t/p/original/${snapshot.data!.posterPath}" ),
                          fit: BoxFit.contain,
                          height: 250,width: 250,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),

                    child: Text(snapshot.data!.title),

                  ),
                  Container(
                    padding: EdgeInsets.all(15),

                    child: Text("Release date: "+ snapshot.data!.releaseDate),

                  ),
                  Container(
                    padding: EdgeInsets.all(15),

                    child: Text("Overview: " + snapshot.data!.overview),

                  ),
                  Container(
                    padding: EdgeInsets.all(15),

                    child: Text("Original Language: " + snapshot.data!.originalLanguage),

                  ),

                  Container(
                    padding: EdgeInsets.all(15),

                    child: Text("Popularity: " +snapshot.data!.popularity.toInt().toString()),

                  ),

                ],
              ),
            );
          }
        }
        ),
    );

  }
}
