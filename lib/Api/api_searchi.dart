import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/search_model.dart';

class SearchApi {
  static Future<SearchModel> getSearchMovies(String query) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?query=$query&api_key=737e7bcd031a7af15bd04752a20ade7c');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('Sucess');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load');
  }
}
