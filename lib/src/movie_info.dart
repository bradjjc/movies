import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movies.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieInfo extends ChangeNotifier {
  Movies _result;

  Movies get result => _result;

  final myController = TextEditingController();

  Future<Movies> fetchData() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1');
    var response = await http.get(url);


    Movies result = Movies.fromJson(json.decode(response.body));
    notifyListeners();
    return result;


  }


}
