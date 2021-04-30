import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movies.dart';
import 'package:flutter_movie/selectPage.dart';
import 'package:flutter_movie/src/movie_info.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  final List<Results> filteredItems = [];
  Future<Movies> data;

  @override
  void initState() {
    super.initState();

    Provider.of<MovieInfo>(context, listen: false).fetchData();
        for (int i = 0; i < movieInfo.results.length; i++) {
          filteredItems.add(movies.results[i]);
        };
      }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            padding: EdgeInsets.only(top: 0.0),
            children: <Widget>[
              ListTile(
                title: Text('Dashboard'),
              ),
              ListTile(
                title: Text('Submit Reports'),
              ),
              ListTile(
                title: Text('Inbox Requests'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('영화 정보 검색기'),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          //    IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.help), onPressed: () {}),
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 16.0),
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
            ),
          ),
          preferredSize: Size(0.0, 30.0),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: <Widget>[
            TextField(
              controller: myController,
              onChanged: (text) {
                setState(() {
                  filteredItems.clear();
                  filteredItems.addAll(_result.results
                      .where((item) => item.title.contains(text)));
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(40)),
                labelText: '검색',
              ),
            ),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3.5,
                  children: _result == null ? [] : _buildShow()),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildItem(Results movie) {
    return InkWell(
      child: Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(
          children: [
            Image.network('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
            Text('${movie.title}', style: TextStyle(height: 1.5, fontSize: 15, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(movie: movie),
          ),
        );
      },
    );
  }


  List<Widget> _buildShow() {
    if (myController.text.isEmpty) {
      return _result.results.map((movie) => _buildItem(movie)).toList();
    }
    return filteredItems.map((e) => _buildItem(e)).toList();
  }
}