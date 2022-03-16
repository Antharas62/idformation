import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix/services/api_service.dart';
import '../models/movie.dart';

class DataRepositories with ChangeNotifier{
  final APIService apiService = APIService();
  final List<Movie> _popularMovieList = [];
  final List<Movie> _nowPlayingList = [];
  final List<Movie> _upcomingMoviesList = [];
  int _popularMoviePageIndex = 1;
  int _nowPlayingPageIndex = 1;
  int _upcomingMoviesPageIndex = 1;

  List<Movie> get popularMovieList => _popularMovieList;
  List<Movie> get nowPlayingList => _nowPlayingList;
  List<Movie> get upcomingMoviesList => _upcomingMoviesList;

  Future<void> getPopularMovies() async {
    try {
      List<Movie> movies = await apiService.getPopularMovies(pageNumber: _popularMoviePageIndex);
      _popularMovieList.addAll(movies);
      _popularMoviePageIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getNowPlaying() async {
    try {
      List<Movie> movies = await apiService.getNowPlaying(pageNumber: _nowPlayingPageIndex);
      _nowPlayingList.addAll(movies);
      _nowPlayingPageIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      List<Movie> movies = await apiService.getUpcomingMovies(pageNumber: _upcomingMoviesPageIndex);
      _upcomingMoviesList.addAll(movies);
      _upcomingMoviesPageIndex++;
      notifyListeners();
    } on Response catch (response) {
      print("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> initData() async {
    await getPopularMovies();
    await getNowPlaying();
    await getUpcomingMovies();
  }
}