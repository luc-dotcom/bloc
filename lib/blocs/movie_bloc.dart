import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../repositories/repositories.dart';
import '../models/models.dart';
import '../blocs/blocs.dart';


class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc({@required this.movieRepository})
      : assert(movieRepository != null);

  @override
  MovieState get initialState => MovieEmpty();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FecthMovie) {
      yield MovieLoading();
      try {
        final Movie movie = await movieRepository.getMovie();
        yield MovieLoaded(movie : movie);
      } catch (_) {
        yield MovieError();
        print(_);
      }
    }
  }
}