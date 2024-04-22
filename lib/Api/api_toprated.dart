import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/toprated_model.dart';

class ApiManager{
  static Future<TopRated> getTopRated() async {
    Uri url = Uri.https(ApiConstantT.baseUrl,ApiConstantT.topRatedEndPoint,
        {
          'api_key' :ApiConstantT.apiKey
        }
    );
    try {
      var response= await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return TopRated.fromJson(json);
    } on Exception catch (e) {
      throw e;
    }

  }
}
class ApiConstantT{
  static const String apiKey ='737e7bcd031a7af15bd04752a20ade7c';
  static const String baseUrl = 'api.themoviedb.org';
  static const String topRatedEndPoint = '/3/movie/top_rated';
  static const String imageUrl='https://image.tmdb.org/t/p/w500';
}