import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1/constants/imageconstants.dart';
import 'package:project1/models/movies.dart';
import 'package:project1/services/moviesrepo.dart';
import 'package:project1/widgets/moviecard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movies> movieList = [];
  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    //List<MovieCardModel>? movieList = MovieCardModel.movieList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Home Screen",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: getMovieList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData == snapshot.hasData) {
                return ListView.builder(
                    itemCount: movieList.length,
                    itemBuilder: (BuildContext context, int index) => MovieCard(
                        movieone: movieList[index],
                        poster: movieList[index].show!.image?.medium ??
                            brokenimage.toString(),
                        discription: movieList[index].show!.summary ?? "",
                        title: movieList[index].show!.name ?? ""));
              } else {
                return Text(
                  "Retry",
                  style: TextStyle(color: Colors.white),
                );
              }
            }),
      ),
    );
  }

  Future<List<Movies>> getMovieList() async {
    movieList = await MovieRepo().getmovies();
    log('ebufiebiu $movieList');
    return movieList;
  }
}
