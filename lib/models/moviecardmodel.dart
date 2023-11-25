class MovieCardModel {
  final String poster;
  final String description;
  final String title;

  MovieCardModel(
      {required this.poster, required this.description, required this.title});

  static List<MovieCardModel> movieList() {
    return [
      MovieCardModel(
          poster: "assets/Movie3.webp",
          description:
              "The Office is an American mockumentary sitcom television series that depicts the everyday work lives of office employees at the Scranton, Pennsylvania, branch of the fictional Dunder Mifflin Paper Company. It aired on NBC from March 24, 2005, to May 16, 2013, spanning a total of nine seasons.",
          title: "The Office"),
      MovieCardModel(
          poster: "assets/Movie2.webp",
          description:
              "Friends is an American television sitcom created by David Crane and Marta Kauffman, which aired on NBC from September 22, 1994, to May 6, 2004, lasting ten seasons. With an ensemble cast starring Jennifer Aniston, Courteney Cox, Lisa Kudrow, Matt LeBlanc, Matthew Perry and David Schwimmer",
          title: "Friends"),
      MovieCardModel(
          poster: "assets/movie1.webp",
          description:
              "Peaky Blinders is a British period crime drama television series created by Steven Knight. Set in Birmingham, it follows the exploits of the Peaky Blinders crime gang in the direct aftermath of the First World War. The fictional gang is loosely based on a real urban youth gang of the same name .",
          title: "Peaky Blinders")
    ];
  }
}
