import 'package:flutter/material.dart';
import 'package:flutter_netflix/repositories/data_repositories.dart';
import 'package:flutter_netflix/services/api_service.dart';
import 'package:flutter_netflix/ui/widgets/movie_card.dart';
import 'package:flutter_netflix/ui/widgets/movie_categorie.dart';
import "package:flutter_netflix/utils/constant.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_netflix/models/movie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepositories>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset("assets/images/netflix_logo_2.png"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 500,
            child: MovieCard(movie: dataProvider.popularMovieList.first)
          ),
          MovieCategorie(
            imageHeight: 160,
            imageWidth: 110,
            label: "Tendance actuelle",
            movieList: dataProvider.popularMovieList,
            callback: dataProvider.getPopularMovies,
          ),
          // MovieCategorie(
          //   imageHeight: 320,
          //   imageWidth: 220,
          //   label: "Actuellement au cinéma",
          //   movieList: dataProvider.popularMovieList,
          // ),
          // MovieCategorie(
          //   imageHeight: 160,
          //   imageWidth: 110,
          //   label: "Bientôt Disponible",
          //   movieList: dataProvider.popularMovieList,
          // ),
        ],
      ),
    );
  }
}