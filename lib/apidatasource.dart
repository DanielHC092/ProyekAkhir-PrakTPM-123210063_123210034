import 'package:proyek_mobile_danielhanselc_123210063/models/DetailUserModel.dart';
import 'baseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Movie> loadDetailUser(String title) async {
    final response = await BaseNetwork.get(title);
    return Movie.fromJson(response);
  }
}
