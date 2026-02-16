import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/movie_detail/domain/entities/cast.dart';
import 'package:cineverse/features/movie_detail/domain/repositories/movie_detail_repository.dart';
@lazySingleton
class GetMovieCast {
  final MovieDetailRepository repository;
  GetMovieCast(this.repository);
  Future<Either<Failure, List<Cast>>> call(int id) async {
    return await repository.getMovieCast(id);
  }
}