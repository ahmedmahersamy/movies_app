class Movie {
   String backdropPath ;
   String originalLanguage;
   String originalTitle;
   String overview;
   String posterPath;
   String releaseDate;
   String title;

   int id;
   double popularity;
   bool video;
   num voteAverage;
   num voteCount;

   String trailerId;


   Movie({
    this.backdropPath ="backdropPath",
    this.id =0,
    this.originalLanguage ="originalLanguage",
    this.originalTitle ="originalTitle",
    this.overview ="overview",
    this.popularity =0.0,
    this.posterPath ="posterPath",
    this.releaseDate ="releaseDate",
    this.title ="title",
    this.video =false,
    this.voteAverage =0,
    this.voteCount =0,
   this.trailerId=" "});


  factory Movie.fromJson(dynamic json) {
   // print('**************************  from Factory method **********************************************');
   // print("----------------------   "+ json.toString() +"   -----------------------------");
    if (json == null) {
      return Movie();
    }
    //print('/n jason is not null/n');

    Movie movie =  Movie(
        backdropPath: json['backdrop_path'] ,
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteCount: json['vote_count'],
        voteAverage: json['vote_average']
    );
   // print(movie.id);
    return movie;
  }
}
