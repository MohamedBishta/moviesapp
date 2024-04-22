import '../model/Lists_movies_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiMoviesLists {
  static Future<List<MovieGenre>> fetchGenres() async {
    const apiKey = '737e7bcd031a7af15bd04752a20ade7c';
    final response = await http.get(
      Uri.https('api.themoviedb.org', '/3/genre/movie/list', {'api_key': apiKey}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['genres'];
      return data.map((json) => MovieGenre.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load genres');
    }
  }
}
