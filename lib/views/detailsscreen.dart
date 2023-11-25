import 'package:flutter/material.dart';
import 'package:project1/constants/imageconstants.dart';
import 'package:project1/models/movies.dart';

class DetailsScreen extends StatelessWidget {
  final Movies movie;

  DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.show!.name ?? "Movie",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(movie.show!.image?.original ??
                                  brokenimage.toString()))),
                    ),
                  ),
                ),
                Text(
                  movie.show!.summary ?? "No Summary",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 5,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Language:${movie.show!.language ?? "No lanuage"}",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                Text("RUnning Time: ${movie.show!.runtime.toString()} minutes",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                Row(
                  children: movie.show!.genres!
                      .map((e) => Text(
                            "Gener: ${e}",
                            style: TextStyle(color: Colors.white),
                          ))
                      .toList(),
                ),
                // Text(
                //  "Geners:${movie.show.genres[0].toString()}/${movie.show.genres[1].toString()}",
                //   style: TextStyle(
                //    color: Colors.white,
                //)),
                Text("Rating: ${movie.show!.rating!.average ?? "No Rating"}",
                    style: TextStyle(
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
