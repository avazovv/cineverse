import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/features/watchlist/data/models/watchlist_movie_model.dart';
import 'package:cineverse/core/errors/exceptions.dart';
abstract class WatchlistLocalDataSource {
  Future<List<WatchlistMovieModel>> getWatchlist();
  Future<void> addMovie(WatchlistMovieModel movie);
  Future<void> removeMovie(int movieId);
  Future<bool> isMovieInWatchlist(int movieId);
}
@LazySingleton(as: WatchlistLocalDataSource)
class WatchlistLocalDataSourceImpl implements WatchlistLocalDataSource {
  final Box box;
  WatchlistLocalDataSourceImpl(this.box);
  @override
  Future<List<WatchlistMovieModel>> getWatchlist() async {
    try {
      return box.values.cast<WatchlistMovieModel>().toList();
    } catch (e) {
      throw CacheException('Failed to get watchlist');
    }
  }
  @override
  Future<void> addMovie(WatchlistMovieModel movie) async {
    await box.put(movie.id, movie);
  }
  @override
  Future<void> removeMovie(int movieId) async {
    await box.delete(movieId);
  }
  @override
  Future<bool> isMovieInWatchlist(int movieId) async {
    return box.containsKey(movieId);
  }
}