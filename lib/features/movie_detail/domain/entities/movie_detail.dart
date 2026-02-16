import 'package:equatable/equatable.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';

class MovieDetail extends Movie {
  final int runtime;
  final List<Genre> genres;
  final String status;
  final String? tagline;
  final String? youtubeVideoId;

  const MovieDetail({
    required super.id,
    required super.title,
    super.posterPath,
    super.backdropPath,
    required super.voteAverage,
    required super.overview,
    required super.releaseDate,
    required this.runtime,
    required this.genres,
    required this.status,
    this.tagline,
    this.youtubeVideoId,
  });

  String get genresText => genres.map((g) => g.name).join(', ');

  String get durationText {
    final hours = runtime ~/ 60;
    final minutes = runtime % 60;
    return '${hours}h ${minutes}m';
  }

  @override
  List<Object?> get props => [
    ...super.props,
    runtime,
    genres,
    status,
    tagline,
    youtubeVideoId,
  ];
}

class Genre extends Equatable {
  final int id;
  final String name;
  const Genre({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
