import 'package:flutter/material.dart';
import 'package:flutter_movie/main.dart';

import 'model/movies.dart';

class DetailScreen extends StatelessWidget {
  final Results movie;

  DetailScreen({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: movie.posterPath,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' + movie.posterPath,
                        height: 300,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('개봉일 : ${movie.releaseDate}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Card(
                                elevation: 5,
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        ' ${movie.voteCount}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    '★ ${movie.voteAverage}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(),
                Text(movie.overview),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



