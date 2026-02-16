import 'package:dartz/dartz.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/movie_detail/domain/entities/cast.dart';
import 'package:cineverse/features/movie_detail/domain/entities/movie_detail.dart';
abstract class MovieDetailRepository {
  Future<Either<Failure, MovieDetail>> getMovieDetail(int id);
  Future<Either<Failure, List<Cast>>> getMovieCast(int id);
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int id);
}