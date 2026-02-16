import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/search/domain/repositories/search_repository.dart';
@lazySingleton
class SearchMovies {
  final SearchRepository repository;
  SearchMovies(this.repository);
  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}