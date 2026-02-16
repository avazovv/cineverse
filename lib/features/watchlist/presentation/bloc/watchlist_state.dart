import 'package:equatable/equatable.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
enum WatchlistStatus { initial, loading, success, failure }
class WatchlistState extends Equatable {
  final WatchlistStatus status;
  final List<Movie> movies;
  final String errorMessage;
  final Map<int, bool> movieStatus;
  const WatchlistState({
    this.status = WatchlistStatus.initial,
    this.movies = const [],
    this.errorMessage = '',
    this.movieStatus = const {},
  });
  WatchlistState copyWith({
    WatchlistStatus? status,
    List<Movie>? movies,
    String? errorMessage,
    Map<int, bool>? movieStatus,
  }) {
    return WatchlistState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
      movieStatus: movieStatus ?? this.movieStatus,
    );
  }
  @override
  List<Object> get props => [status, movies, errorMessage, movieStatus];
}