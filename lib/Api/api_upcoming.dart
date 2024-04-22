import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/upcoming_model.dart';


class ApiRecommended {
  static Future<Upcomingfilm?> getUpFilms() async {
    Uri url = Uri.https(ApiConstant.baseURL,ApiConstant.filmApi,
        {
          'api_key':'737e7bcd031a7af15bd04752a20ade7c',
        });
    try{
      var upFilm = await http.get(url);
      var upFilmbody = upFilm.body;
      var json = jsonDecode(upFilmbody);
      return Upcomingfilm.fromJson(json);
    }catch(e){
      throw e;
    }

  }
}


class ApiConstant {
  static const String baseURL = 'api.themoviedb.org';
  static const String filmApi = '/3/movie/upcoming';
}