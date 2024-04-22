import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/movie_discover_model.dart';

class ApiManager {
  static const String apiKey = '737e7bcd031a7af15bd04752a20ade7c';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static Future<List<Map<String, dynamic>>?> getMovies({required int page}) async {
    String apiKey = '737e7bcd031a7af15bd04752a20ade7c';
    Uri url = Uri.https(
      'api.themoviedb.org',
      '/3/movie/popular',
      {'api_key': apiKey},
    );
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(json['results']);
      } else {
        print('Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<MovieDiscover> getMoviesDiscover() async {
    Uri url = Uri.parse('$baseUrl/discover/movie?api_key=$apiKey');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MovieDiscover.fromJson(json);
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');

    }}
  static Future<List<Results>> fetchMoviesByCategory(int categoryId) async {
    const String apiKey = '737e7bcd031a7af15bd04752a20ade7c';
    const String baseUrl = 'https://api.themoviedb.org/3';

    final Uri url = Uri.parse('$baseUrl/discover/movie?api_key=$apiKey&with_genres=$categoryId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Results> movies = [];

        for (var item in jsonData['results']) {
          movies.add(Results.fromJson(item));
        }

        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}

