import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/features/home/domain/usecases/get_movies.dart';
import 'package:cineverse/features/home/presentation/bloc/home_event.dart';
import 'package:cineverse/features/home/presentation/bloc/home_state.dart';
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTrendingMovies getTrendingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;
  final GetNowPlayingMovies getNowPlayingMovies;
  HomeBloc({
    required this.getTrendingMovies,
    required this.getPopularMovies,
    required this.getTopRatedMovies,
    required this.getNowPlayingMovies,
  }) : super(const HomeState()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<RefreshHomeData>(_onRefreshHomeData);
  }
  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final results = await Future.wait([
        getTrendingMovies(),
        getPopularMovies(),
        getTopRatedMovies(),
        getNowPlayingMovies(),
      ]);
      final hasFailure = results.any((result) => result.isLeft());
      if (hasFailure) {
        final failure = results.firstWhere((result) => result.isLeft());
        failure.fold(
          (error) => emit(
            state.copyWith(
              status: HomeStatus.failure,
              errorMessage: error.message,
            ),
          ),
          (_) {},
        );
      } else {
        final trending = results[0].getOrElse(() => []);
        final popular = results[1].getOrElse(() => []);
        final topRated = results[2].getOrElse(() => []);
        final nowPlaying = results[3].getOrElse(() => []);
        emit(
          state.copyWith(
            status: HomeStatus.success,
            trendingMovies: trending,
            popularMovies: popular,
            topRatedMovies: topRated,
            nowPlayingMovies: nowPlaying,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: 'An unexpected error occurred: $e',
        ),
      );
    }
  }
  Future<void> _onRefreshHomeData(
    RefreshHomeData event,
    Emitter<HomeState> emit,
  ) async {
    await _onLoadHomeData(const LoadHomeData(), emit);
  }
}