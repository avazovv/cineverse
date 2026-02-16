import 'package:equatable/equatable.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  final SearchStatus status;
  final List<Movie> movies;
  final List<String> history;
  final String errorMessage;

  const SearchState({
    this.status = SearchStatus.initial,
    this.movies = const [],
    this.history = const [],
    this.errorMessage = '',
  });

  SearchState copyWith({
    SearchStatus? status,
    List<Movie>? movies,
    List<String>? history,
    String? errorMessage,
  }) {
    return SearchState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      history: history ?? this.history,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, movies, history, errorMessage];
}
