import 'package:dio/dio.dart';
import 'package:flutter_netflix/services/api.dart';
import 'package:flutter_netflix/models/movie.dart';

class APIService {
  final API api = API();
  final Dio dio = Dio();

  Future <Response>  getData(String path, {Map<String, dynamic>? params}) async {
    //contruction de l'url
    String _url = api.baseURL + path;

    //constructiion des parametres
    //parametre present dans chaque requete
    Map<String, dynamic> query = {
      "api_key": api.apikey,
      "language": "fr-FR",
    };

    //si params n'est pas null ont ajoute les parametre a query
    if(params != null){
      query.addAll(params);
    }

    //on appel
    final response = await dio.get(_url, queryParameters: query);
    //check si tout s'est bien passer
    if(response.statusCode == 200){
      print(_url + query.toString());
      return response;
    } else {
      throw response;
    }
  } // getdata

  Future<List<Movie>> getPopularMovies({required int pageNumber}) async {

    Response response = await getData('/movie/popular', params: {
      "page": pageNumber,
    });

    if(response.statusCode == 200){
      Map data = response.data;
      List<dynamic> results = data['results'];
      List<Movie> movies = [];
      for(Map<String,dynamic> json in results){
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }

      return movies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getNowPlaying({required int pageNumber}) async {

    Response response = await getData('/movie/now_playing', params: {
      "page": pageNumber,
    });

    if(response.statusCode == 200){
      Map data = response.data;
      List<Movie> movies = data["results"].map<Movie>((dynamic movieJson){
        return Movie.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getUpcomingMovies({required int pageNumber}) async {

    Response response = await getData('/movie/upcoming', params: {
      "page": pageNumber,
    });

    if(response.statusCode == 200){
      Map data = response.data;
      List<Movie> movies = data["results"].map<Movie>((dynamic movieJson){
        return Movie.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getAnimationMovies({required int pageNumber}) async {

    Response response = await getData('/discover/movie', params: {
      "page": pageNumber,
      "with_genres": "16",
    });

    if(response.statusCode == 200){
      Map data = response.data;
      List<Movie> movies = data["results"].map<Movie>((dynamic movieJson){
        return Movie.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getFantastiqueMovies({required int pageNumber}) async {

    Response response = await getData('/discover/movie', params: {
      "page": pageNumber,
      "with_genres": "878",
    });

    if(response.statusCode == 200){
      Map data = response.data;
      List<Movie> movies = data["results"].map<Movie>((dynamic movieJson){
        return Movie.fromJson(movieJson);
      }).toList();

      return movies;
    } else {
      throw response;
    }
  }

  Future<Movie> getMovieDetails({required Movie movie}) async {
    Response response = await getData('/movie/${movie.id}');

  if(response.statusCode == 200){
      Map<String,dynamic> _data = response.data;
      var genres = _data["genres"] as List;
      List<String> genreList = genres.map((item) {
        return item["name"] as String;
      }).toList();

      Movie newMovie = movie.copyWith(
        genres: genreList,
        releaseDate: _data["release_date"],
        vote: _data["vote_average"],
      );

      return newMovie;
    } else {
      throw response;
    }
  }

  Future<Movie> getMovieVideo({required Movie movie}) async {
    Response response = await getData('/movie/${movie.id}/videos');

  if(response.statusCode == 200){
      Map<String,dynamic> _data = response.data;

      //Ma methode
      // List<dynamic> videos = _data["results"];
      // List<String> video = videos.map((item) {
      //   return item["key"] as String;
      // }).toList();

      //Methode sans variable tempon
      List<String> videos = _data["results"].map<String>((item) {
        return item["key"] as String;
      }).toList();


      Movie newMovie = movie.copyWith(
        videos: videos,
      );

      return newMovie;
    } else {
      throw response;
    }
  }
}