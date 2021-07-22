import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';

class TrendingMoviesScreen extends StatefulWidget {
  @override
  _TrendingMoviesScreenState createState() => _TrendingMoviesScreenState();
}

class _TrendingMoviesScreenState extends State<TrendingMoviesScreen> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage();

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null){
        print(message.notification!.body);
        print(message.notification!.title);
      }

    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {

      print(message.notification!.body);
      print(message.notification!.title);
    });


  }



  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context ,listen: false);
    final Future<List<Movie>> moviesList = movieProvider.getMoviesList();



    final imageUrl ="https://image.tmdb.org/t/p/original";
    // print(movieProvider.moviesList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: Container(
        child: FutureBuilder<List<Movie>>(
          future: moviesList,
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, i) {
                    return Column(
                      children: [
                        Card(child: Padding(padding: EdgeInsets.all(12),child: ClipRect(

                          child: GridTile(
                            child: GestureDetector(
                              onTap: (){
                                print(snapshot.data![i].id);
                                Navigator.of(context).pushNamed(MovieDetailsScreen.routeName,arguments: snapshot.data![i].id);
                              },
                              child: Image(
                                image: NetworkImage("https://image.tmdb.org/t/p/original/${snapshot.data![i].posterPath}" ),
                                fit: BoxFit.contain,
                                height: 250,width: 250,
                              ),
                            ),
                          ),
                        ),),),

                        Text(
                          snapshot.data![i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
