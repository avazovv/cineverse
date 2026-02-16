import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/watchlist/domain/repositories/watchlist_repository.dart';
@lazySingleton
class GetWatchlist {
  final WatchlistRepository repository;
  GetWatchlist(this.repository);
  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getWatchlist();
  }
}
@lazySingleton
class AddToWatchlist {
  final WatchlistRepository repository;
  AddToWatchlist(this.repository);
  Future<Either<Failure, void>> call(Movie movie) async {
    return await repository.addMovie(movie);
  }
}
@lazySingleton
class RemoveFromWatchlist {
  final WatchlistRepository repository;
  RemoveFromWatchlist(this.repository);
  Future<Either<Failure, void>> call(int movieId) async {
    return await repository.removeMovie(movieId);
  }
}
@lazySingleton
class CheckWatchlistStatus {
  final WatchlistRepository repository;
  CheckWatchlistStatus(this.repository);
  Future<Either<Failure, bool>> call(int movieId) async {
    return await repository.isMovieInWatchlist(movieId);
  }
}