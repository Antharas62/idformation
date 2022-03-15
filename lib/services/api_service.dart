import 'package:dio/dio.dart';
import 'package:flutter_netflix/services/api.dart';

class APIService {
  final API api = API();
  final Dio dio = Dio();

  Future <Response>  getData(String path, {Map<String, dynamic>? params}) async {
    //contruction de l'url
    String _url = api.baseURL + path;

    //constructiion des parametres
    //parametre present dans chaque requete
    Map<String,dynamic> query = {
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

  }


}