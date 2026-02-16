import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:cineverse/features/movie_detail/domain/repositories/movie_detail_repository.dart';
@lazySingleton
class GetMovieDetail {
  final MovieDetailRepository repository;
  GetMovieDetail(this.repository);
  Future<Either<Failure, MovieDetail>> call(int id) async {
    return await repository.getMovieDetail(id);
  }
}