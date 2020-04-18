import 'movie_api_client.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

class MovieRepository {
  final MovieApiClient movieApiClient;

  MovieRepository({@required this.movieApiClient})
      : assert(movieApiClient != null);

  Future<Movie> getMovie() async {
    return movieApiClient.fetchMovie();
  }
}