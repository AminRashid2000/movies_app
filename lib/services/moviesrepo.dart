import "dart:convert";
import "dart:developer";

import "package:http/http.dart" as http;
import "package:project1/models/movies.dart";

class MovieRepo {
  Future<List<Movies>> getmovies() async {
    try {
      final response = await http
          .get(Uri.parse("https://api.tvmaze.com/search/shows?q=all"));
      if (response.statusCode == 200) {
        log(response.body.toString());
        List<dynamic> data = jsonDecode(response.body);
        List<Movies> movieData =
            data.map((e) => Movies.fromJson(e)).cast<Movies>().toList();
        return movieData;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<Movies>> searchMovies(String enteredKeyWord) async {
    try {
      final String searchData = enteredKeyWord;
      final response = await http
          .get(Uri.parse("https://api.tvmaze.com/search/shows?q=$searchData"));
      if (response.statusCode == 200) {
        log(response.body.toString());
        List<dynamic> data = jsonDecode(response.body);
        List<Movies> movieData =
            data.map((e) => Movies.fromJson(e)).cast<Movies>().toList();
        return movieData;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
