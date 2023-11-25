import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1/constants/imageconstants.dart';
import 'package:project1/models/movies.dart';
import 'package:project1/services/moviesrepo.dart';
import 'package:project1/widgets/moviecard.dart';

class SearchSreen extends StatefulWidget {
  const SearchSreen({super.key});

  @override
  State<SearchSreen> createState() => _SearchSreenState();
}

class _SearchSreenState extends State<SearchSreen> {
  List<Movies> foundMovies = [];
  TextEditingController tc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.red, width: 3),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: tc,
              decoration: InputDecoration(
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search Your Movie",
                suffixIcon: IconButton(
                  onPressed: () async {
                    getmovie(tc.text);
                    setState(() {});
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: getmovie(tc.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //  log(snapshot.toString());
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData == snapshot.hasData) {
                log("aaaaaaa${snapshot}");
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: ClampingScrollPhysics(),
                    itemCount: foundMovies.length,
                    itemBuilder: (context, int index) => MovieCard(
                      movieone: foundMovies[index],
                      poster: foundMovies[index].show!.image?.original ??
                          brokenimage.toString(),
                      discription: foundMovies[index].show!.summary ?? "",
                      title: foundMovies[index].show!.name ?? "",
                    ),
                  ),
                );
              } else
                return Text("No movies found");
            },
          ),
        ],
      ),
    );
  }

  Future<void> getmovie(String enteredKeyWord) async {
    try {
      List<Movies> updatedMovies =
          await MovieRepo().searchMovies(enteredKeyWord);

      foundMovies = updatedMovies;

      log("API Response: ${foundMovies.toString()}");
    } catch (e) {
      log("Error fetching data: $e");

      foundMovies = [];
    }
  }
}
