import 'package:dartz/dartz.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, List<String>>> getSearchHistory();
  Future<Either<Failure, void>> saveSearchQuery(String query);
  Future<Either<Failure, void>> deleteSearchQuery(String query);
}
