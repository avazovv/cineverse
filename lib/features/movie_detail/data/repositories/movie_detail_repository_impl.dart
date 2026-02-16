import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/data/models/movie_model.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/movie_detail/data/datasources/movie_detail_datasource.dart';
import 'package:cineverse/features/movie_detail/data/models/cast_model.dart';
import 'package:cineverse/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:cineverse/features/movie_detail/domain/entities/cast.dart';
import 'package:cineverse/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:cineverse/features/movie_detail/domain/repositories/movie_detail_repository.dart';
@LazySingleton(as: MovieDetailRepository)
class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailRemoteDataSource remoteDataSource;
  MovieDetailRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(int id) async {
    try {
      final result = await remoteDataSource.getMovieDetail(id);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, List<Cast>>> getMovieCast(int id) async {
    try {
      final result = await remoteDataSource.getMovieCast(id);
      return Right(result.cast.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int id) async {
    try {
      final result = await remoteDataSource.getSimilarMovies(id);
      return Right(result.results.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}