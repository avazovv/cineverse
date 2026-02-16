import 'package:dartz/dartz.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/home/domain/repositories/movie_repository.dart';
class GetTrendingMovies {
  final MovieRepository repository;
  GetTrendingMovies(this.repository);
  Future<Either<Failure, List<Movie>>> call({int page = 1}) {
    return repository.getTrendingMovies(page: page);
  }
}
class GetPopularMovies {
  final MovieRepository repository;
  GetPopularMovies(this.repository);
  Future<Either<Failure, List<Movie>>> call({int page = 1}) {
    return repository.getPopularMovies(page: page);
  }
}
class GetTopRatedMovies {
  final MovieRepository repository;
  GetTopRatedMovies(this.repository);
  Future<Either<Failure, List<Movie>>> call({int page = 1}) {
    return repository.getTopRatedMovies(page: page);
  }
}
class GetNowPlayingMovies {
  final MovieRepository repository;
  GetNowPlayingMovies(this.repository);
  Future<Either<Failure, List<Movie>>> call({int page = 1}) {
    return repository.getNowPlayingMovies(page: page);
  }
}