import 'package:flutter/material.dart';
import 'package:flutter_netflix/repositories/data_repositories.dart';
import 'package:flutter_netflix/services/api_service.dart';
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
          Container(
            height: 500,
            color: Colors.red,
            child: (dataProvider.popularMovieList.isEmpty) ? const Text("Null Value") : Image.network(
              dataProvider.popularMovieList[0].posterURL(),
              fit: BoxFit.cover,
              ),
          ),
          const SizedBox(height: 15),
          Text(
          "Tendances actuelles",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 110,
                  color: Colors.yellow,
                  child: (dataProvider.popularMovieList.isEmpty) ? Center(
                    child: Text(index.toString()),
                  ) : Image.network(dataProvider.popularMovieList[index + 1].posterURL(),fit: BoxFit.cover),
                );
              }
          ),
          ),
          const SizedBox(height: 15),
          Text(
          "Actuellement au cinéma",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 220,
                  color: Colors.blue,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              }
          ),
          ),
          const SizedBox(height: 15),
          Text(
          "Bientôt Disponible",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 110,
                  color: Colors.green,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              }
          ),
          ),
        ],
      ),
      );
  }
}