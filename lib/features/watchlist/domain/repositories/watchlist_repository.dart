import 'package:dartz/dartz.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
abstract class WatchlistRepository {
  Future<Either<Failure, List<Movie>>> getWatchlist();
  Future<Either<Failure, void>> addMovie(Movie movie);
  Future<Either<Failure, void>> removeMovie(int movieId);
  Future<Either<Failure, bool>> isMovieInWatchlist(int movieId);
}