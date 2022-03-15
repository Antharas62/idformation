import 'package:flutter/material.dart';
import 'package:flutter_netflix/repositories/data_repositories.dart';
import 'package:flutter_netflix/ui/screens/home_screen.dart';
import 'package:flutter_netflix/utils/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    //todo : appel api
    final dataProvider = Provider.of<DataRepositories>(context, listen: false);
    //initialisation des differente liste de movies
    await dataProvider.initData();
    //ensuite on va sur homescreen
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/netflix_logo_1.png"),
          SpinKitFadingCircle(
            color: kPrimarycolor,
          )
        ]
        ),
    );
  }
}