import 'package:flutter/material.dart';
import 'package:flutter_netflix/models/movie.dart';
import 'package:flutter_netflix/repositories/data_repositories.dart';
import 'package:flutter_netflix/ui/widgets/action_buttun.dart';
import 'package:flutter_netflix/ui/widgets/movie_info.dart';
import 'package:flutter_netflix/utils/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie? newMovie;

  @override
  void initState() {
    super.initState();
    getMovieData();
  }

  void getMovieData() async {
    final dataProvider = Provider.of<DataRepositories>(context, listen: false);

    Movie _movie = await dataProvider.getMovieDetails(movie: widget.movie);
    setState(() {
      newMovie = _movie;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
        ),
        body: (newMovie == null)
            ? Center(
                child: SpinKitFadingCircle(color: kPrimarycolor, size: 20),
              )
            : ListView(
                children: [
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                  ),
                  MovieInfo(movie: newMovie!),
                  const SizedBox(height: 10),
                  ActionButtun(
                    label: "Lecture",
                    icon: Icons.play_arrow,
                    bgColor: Colors.white,
                    color: kBackgroundColor,
                  ),
                  const SizedBox(height: 10),
                  ActionButtun(
                    label: "Télécharger la vidéo",
                    icon: Icons.download,
                    bgColor: Colors.grey.withOpacity(0.3),
                    color: Colors.white,
                  ),
                ],
              ));
  }
}
