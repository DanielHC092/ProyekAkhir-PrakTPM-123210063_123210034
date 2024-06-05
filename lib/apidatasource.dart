import 'package:proyek_mobile_danielhanselc_123210063/models/DetailUserModel.dart';
import 'baseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  // Fetch movies
  Future<List<Movie>> fetchMovies() async {
    final response = await BaseNetwork.get("movies");
    List<dynamic> moviesJson = response['movies'];
    List<Movie> movies =
        moviesJson.map((movieJson) => Movie.fromJson(movieJson)).toList();
    return movies;
  }

  Future<List<Movie>> searchMovies(String title) async {
    final response = await BaseNetwork.get("search?title=$title");
    List<dynamic> moviesJson = response['movies'];
    List<Movie> movies =
        moviesJson.map((movieJson) => Movie.fromJson(movieJson)).toList();
    return movies;
  }

  Future<Movie> loadDetailUser(String title) async {
    final response = await BaseNetwork.get(title);
    return Movie.fromJson(response);
  }
}
