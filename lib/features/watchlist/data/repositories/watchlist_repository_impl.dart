import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/errors/exceptions.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/watchlist/data/datasources/watchlist_local_datasource.dart';
import 'package:cineverse/features/watchlist/data/models/watchlist_movie_model.dart';
import 'package:cineverse/features/watchlist/domain/repositories/watchlist_repository.dart';
@LazySingleton(as: WatchlistRepository)
class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistLocalDataSource localDataSource;
  WatchlistRepositoryImpl(this.localDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getWatchlist() async {
    try {
      final result = await localDataSource.getWatchlist();
      return Right(result.map((e) => e.toEntity()).toList());
    } on CacheException {
      return const Left(CacheFailure('Cache Error'));
    }
  }
  @override
  Future<Either<Failure, void>> addMovie(Movie movie) async {
    try {
      await localDataSource.addMovie(WatchlistMovieModel.fromEntity(movie));
      return const Right(null);
    } on CacheException {
      return const Left(CacheFailure('Cache Error'));
    }
  }
  @override
  Future<Either<Failure, void>> removeMovie(int movieId) async {
    try {
      await localDataSource.removeMovie(movieId);
      return const Right(null);
    } on CacheException {
      return const Left(CacheFailure('Cache Error'));
    }
  }
  @override
  Future<Either<Failure, bool>> isMovieInWatchlist(int movieId) async {
    try {
      final result = await localDataSource.isMovieInWatchlist(movieId);
      return Right(result);
    } on CacheException {
      return const Left(CacheFailure('Cache Error'));
    }
  }
}