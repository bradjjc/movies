
import 'package:flutter/material.dart';
import 'package:flutter_movie/main.dart';


class DetailScreen extends StatefulWidget {
  String category;
  DetailScreen({this.category});
  @override
  State<StatefulWidget> createState() => _DetailScreenState();
  //...
  }
  class _DetailScreenState extends State<DetailScreen> {
  List restaurants;
  @override
  void initState() {
  super.initState();
  restaurants = [];
  }
  void fetchRestaurants() {
  // fetch restaurants by category using widget.category
  }
  @override
  Widget build(BuildContext context) {

  }
  }
