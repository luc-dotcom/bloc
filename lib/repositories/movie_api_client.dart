import 'dart:convert';

import 'package:app/models/movies.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class MovieApiClient {
  ///Notre Url de base
  ///
  ///
  static const baseUrl = 'https://api.themoviedb.org/3/movie';
  final http.Client httpClient;

  MovieApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);


  Future<Movie> fetchMovie() async {

    var language = 'fr-FR';
    var apiKey = '715f9ee686ba92711f8ab0bc321130c7';
    final movieUrl =
        '$baseUrl/upcoming?api_key=$apiKey&language=$language&include_image_language=fr&page=1';
    final movieResponse = await this.httpClient.get(movieUrl);

    if (movieResponse.statusCode != 200) {
      throw Exception('error cannot get movies');
    }
    final movieJson = jsonDecode(movieResponse.body);
  

    return Movie.fromJson(movieJson);
    
  }
}
