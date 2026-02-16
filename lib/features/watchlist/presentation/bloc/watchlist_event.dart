import 'package:equatable/equatable.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();
  @override
  List<Object> get props => [];
}
class LoadWatchlist extends WatchlistEvent {}
class AddMovieToWatchlist extends WatchlistEvent {
  final Movie movie;
  const AddMovieToWatchlist(this.movie);
  @override
  List<Object> get props => [movie];
}
class RemoveMovieFromWatchlist extends WatchlistEvent {
  final int movieId;
  const RemoveMovieFromWatchlist(this.movieId);
  @override
  List<Object> get props => [movieId];
}
class CheckMovieStatus extends WatchlistEvent {
  final int movieId;
  const CheckMovieStatus(this.movieId);
  @override
  List<Object> get props => [movieId];
}