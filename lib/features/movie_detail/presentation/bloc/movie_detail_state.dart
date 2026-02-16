import 'package:equatable/equatable.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/movie_detail/domain/entities/cast.dart';
import 'package:cineverse/features/movie_detail/domain/entities/movie_detail.dart';
enum MovieDetailStatus { initial, loading, success, failure }
class MovieDetailState extends Equatable {
  final MovieDetailStatus status;
  final MovieDetail? movieDetail;
  final List<Cast> cast;
  final List<Movie> similarMovies;
  final String? errorMessage;
  const MovieDetailState({
    this.status = MovieDetailStatus.initial,
    this.movieDetail,
    this.cast = const [],
    this.similarMovies = const [],
    this.errorMessage,
  });
  MovieDetailState copyWith({
    MovieDetailStatus? status,
    MovieDetail? movieDetail,
    List<Cast>? cast,
    List<Movie>? similarMovies,
    String? errorMessage,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      movieDetail: movieDetail ?? this.movieDetail,
      cast: cast ?? this.cast,
      similarMovies: similarMovies ?? this.similarMovies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  @override
  List<Object?> get props => [
    status,
    movieDetail,
    cast,
    similarMovies,
    errorMessage,
  ];
}