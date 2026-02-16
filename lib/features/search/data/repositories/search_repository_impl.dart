import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/core/errors/exceptions.dart';
import 'package:cineverse/features/home/data/models/movie_model.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/search/data/datasources/search_datasource.dart';
import 'package:cineverse/features/search/domain/repositories/search_repository.dart';
import 'package:cineverse/features/search/data/datasources/search_local_datasource.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;
  final SearchLocalDataSource localDataSource;

  SearchRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final result = await remoteDataSource.searchMovies(query);
      return Right(result.results.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on DioException {
      return const Left(ServerFailure('Network Error'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSearchHistory() async {
    try {
      final result = await localDataSource.getSearchHistory();
      return Right(result);
    } catch (e) {
      return const Left(CacheFailure('Cache Error'));
    }
  }

  @override
  Future<Either<Failure, void>> saveSearchQuery(String query) async {
    try {
      await localDataSource.saveSearchQuery(query);
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure('Cache Error'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSearchQuery(String query) async {
    try {
      await localDataSource.deleteSearchQuery(query);
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure('Cache Error'));
    }
  }
}
