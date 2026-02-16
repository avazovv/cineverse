import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/features/movie_detail/domain/usecases/get_movie_cast.dart';
import 'package:cineverse/features/movie_detail/domain/usecases/get_movie_detail.dart';
import 'package:cineverse/features/movie_detail/domain/usecases/get_similar_movies.dart';
import 'package:cineverse/features/movie_detail/presentation/bloc/movie_detail_event.dart';
import 'package:cineverse/features/movie_detail/presentation/bloc/movie_detail_state.dart';
@injectable
class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetMovieCast getMovieCast;
  final GetSimilarMovies getSimilarMovies;
  MovieDetailBloc({
    required this.getMovieDetail,
    required this.getMovieCast,
    required this.getSimilarMovies,
  }) : super(const MovieDetailState()) {
    on<LoadMovieDetail>(_onLoadMovieDetail);
  }
  Future<void> _onLoadMovieDetail(
    LoadMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(state.copyWith(status: MovieDetailStatus.loading));
    final detailResult = await getMovieDetail(event.movieId);
    final castResult = await getMovieCast(event.movieId);
    final similarResult = await getSimilarMovies(event.movieId);
    if (detailResult.isLeft()) {
      detailResult.fold(
        (error) => emit(
          state.copyWith(
            status: MovieDetailStatus.failure,
            errorMessage: error.message,
          ),
        ),
        (_) {},
      );
      return;
    }
    final movieDetail = detailResult.getOrElse(
      () => throw Exception('unreachable'),
    );
    final cast = castResult.getOrElse(() => []);
    final similar = similarResult.getOrElse(() => []);
    emit(
      state.copyWith(
        status: MovieDetailStatus.success,
        movieDetail: movieDetail,
        cast: cast,
        similarMovies: similar,
      ),
    );
  }
}