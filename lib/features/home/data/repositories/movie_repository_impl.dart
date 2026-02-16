import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:cineverse/core/errors/exceptions.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/data/datasources/movie_remote_datasource.dart';
import 'package:cineverse/features/home/data/models/movie_model.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/home/domain/repositories/movie_repository.dart';
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies({int page = 1}) async {
    return _getMovies(() => remoteDataSource.getTrending(page));
  }
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies({int page = 1}) async {
    return _getMovies(() => remoteDataSource.getPopular(page));
  }
  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies({int page = 1}) async {
    return _getMovies(() => remoteDataSource.getTopRated(page));
  }
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies({
    int page = 1,
  }) async {
    return _getMovies(() => remoteDataSource.getNowPlaying(page));
  }
  Future<Either<Failure, List<Movie>>> _getMovies(
    Future<MovieListResponse> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();
      final movies = response.results.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error occurred'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('An unexpected error occurred: $e'));
    }
  }
}