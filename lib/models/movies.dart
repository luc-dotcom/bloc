import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final posterPath;
  final adult;
  final overview;
  final releaseDate;
  final genreIds;
  final id;
  final originalTitle;
  final originalLanguage;
  final title;
  final backdropPath;
  final popularity;
  final voteCount;
  final video;
  final voteAverage;

  const Movie({this.posterPath, this.adult, this.overview, this.releaseDate, this.genreIds,
      this.id, this.originalTitle,this.originalLanguage,this.title,this.backdropPath,this.popularity,this.voteCount,
       this.video, this.voteAverage});

  @override
  List<Object> get props => [ 
    posterPath,
    adult,
    overview,
    releaseDate,
    genreIds,
    id,
    originalTitle,
    originalLanguage,
    title,
    backdropPath,
    popularity,
    voteCount,
    video,
    voteAverage
  ];   

  static Movie fromJson(dynamic json) {
    final results = json['results'];
    return Movie(
    posterPath:  results['posterPath'],
    adult:  results['adult'],
    overview: results['overview'],
    releaseDate: results['releaseDate'],
    genreIds: results['genreIds'],
    id: results['id'],
    originalTitle: results['originalTitle'],
    originalLanguage: results['originalLanguage'],
    title: results['title'],
    backdropPath: results['backdropPath'],
    popularity: results['popularity'],
    voteCount: results['voteCount'],
    video: results['video'],
    voteAverage: results['voteAverage'],
    );
}


}
