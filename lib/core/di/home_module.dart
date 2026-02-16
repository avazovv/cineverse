import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/features/home/data/datasources/movie_remote_datasource.dart';
import 'package:cineverse/features/home/data/repositories/movie_repository_impl.dart';
import 'package:cineverse/features/home/domain/repositories/movie_repository.dart';
import 'package:cineverse/features/home/domain/usecases/get_movies.dart';
@module
abstract class HomeModule {
  @lazySingleton
  MovieRemoteDataSource movieRemoteDataSource(Dio dio) =>
      MovieRemoteDataSource(dio);
  @LazySingleton(as: MovieRepository)
  MovieRepositoryImpl movieRepository(MovieRemoteDataSource dataSource) =>
      MovieRepositoryImpl(remoteDataSource: dataSource);
  @lazySingleton
  GetTrendingMovies getTrendingMovies(MovieRepository repository) =>
      GetTrendingMovies(repository);
  @lazySingleton
  GetPopularMovies getPopularMovies(MovieRepository repository) =>
      GetPopularMovies(repository);
  @lazySingleton
  GetTopRatedMovies getTopRatedMovies(MovieRepository repository) =>
      GetTopRatedMovies(repository);
  @lazySingleton
  GetNowPlayingMovies getNowPlayingMovies(MovieRepository repository) =>
      GetNowPlayingMovies(repository);
}