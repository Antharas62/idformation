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
      "language": "fr_FR",
    };

    //si params n'est pas null ont ajoute les parametre a query
    if(params != null){
      query.addAll(params);
    }

    //on appel
    final response = await dio.get(_url, queryParameters: query);
    //check si tout s'est bien passer
    if(response.statusCode == 200){
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

}