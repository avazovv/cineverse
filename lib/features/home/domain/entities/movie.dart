import 'package:equatable/equatable.dart';
import 'package:cineverse/core/constants/api_constants.dart';
class Movie extends Equatable {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  const Movie({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    this.genreIds = const [],
  });
  String get posterUrl => ApiConstants.poster(posterPath);
  String get backdropUrl => ApiConstants.backdrop(backdropPath);
  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
    backdropPath,
    voteAverage,
    overview,
    releaseDate,
    genreIds,
  ];
}