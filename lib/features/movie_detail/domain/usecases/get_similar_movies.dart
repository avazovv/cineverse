import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/movie_detail/domain/repositories/movie_detail_repository.dart';
@lazySingleton
class GetSimilarMovies {
  final MovieDetailRepository repository;
  GetSimilarMovies(this.repository);
  Future<Either<Failure, List<Movie>>> call(int id) async {
    return await repository.getSimilarMovies(id);
  }
}