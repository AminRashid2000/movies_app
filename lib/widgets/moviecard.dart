import 'package:flutter/material.dart';
import 'package:project1/models/movies.dart';
import 'package:project1/views/detailsscreen.dart';

class MovieCard extends StatelessWidget {
  Movies? movieone;
  String? poster;
  String? discription;
  String? title;
  MovieCard(
      {super.key,
      required this.poster,
      required this.discription,
      required this.title,
      this.movieone});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  movie: movieone!,
                )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(poster!))),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    height: 100,
                    child: Text(
                      discription!,
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
