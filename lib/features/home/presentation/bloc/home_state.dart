import 'package:equatable/equatable.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
enum HomeStatus { initial, loading, success, failure }
class HomeState extends Equatable {
  final HomeStatus status;
  final List<Movie> trendingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> nowPlayingMovies;
  final String? errorMessage;
  const HomeState({
    this.status = HomeStatus.initial,
    this.trendingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingMovies = const [],
    this.errorMessage,
  });
  HomeState copyWith({
    HomeStatus? status,
    List<Movie>? trendingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? nowPlayingMovies,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      trendingMovies: trendingMovies ?? this.trendingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  @override
  List<Object?> get props => [
    status,
    trendingMovies,
    popularMovies,
    topRatedMovies,
    nowPlayingMovies,
    errorMessage,
  ];
}