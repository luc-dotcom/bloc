import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';

abstract class MovieState extends Equatable {
  const MovieState();
  
  @override
  List<Object> get props => [];
}


class MovieLoaded extends MovieState {
  final Movie movie;

  const MovieLoaded({@required this.movie}) : assert(movie != null);

  @override
  List<Object> get props => [movie];
}

class MovieError extends MovieState {}
class MovieEmpty extends MovieState {}
class MovieLoading extends MovieState{}