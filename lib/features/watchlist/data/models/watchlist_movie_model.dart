import 'package:hive/hive.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
part 'watchlist_movie_model.g.dart';
@HiveType(typeId: 0)
class WatchlistMovieModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterPath;
  @HiveField(3)
  final double voteAverage;
  @HiveField(4)
  final String releaseDate;
  WatchlistMovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
  });
  factory WatchlistMovieModel.fromEntity(Movie movie) {
    return WatchlistMovieModel(
      id: movie.id,
      title: movie.title,
      posterPath: movie.posterPath ?? '',
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate,
    );
  }
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: '',
      voteAverage: voteAverage,
      overview: '',
      releaseDate: releaseDate,
      genreIds: [],
    );
  }
}