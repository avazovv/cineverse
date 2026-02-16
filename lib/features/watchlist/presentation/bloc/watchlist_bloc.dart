import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/features/watchlist/domain/usecases/watchlist_usecases.dart';
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_state.dart';

@injectable
class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlist getWatchlist;
  final AddToWatchlist addToWatchlist;
  final RemoveFromWatchlist removeFromWatchlist;
  final CheckWatchlistStatus checkWatchlistStatus;
  WatchlistBloc({
    required this.getWatchlist,
    required this.addToWatchlist,
    required this.removeFromWatchlist,
    required this.checkWatchlistStatus,
  }) : super(const WatchlistState()) {
    on<LoadWatchlist>(_onLoadWatchlist);
    on<AddMovieToWatchlist>(_onAddMovieToWatchlist);
    on<RemoveMovieFromWatchlist>(_onRemoveMovieFromWatchlist);
    on<CheckMovieStatus>(_onCheckMovieStatus);
  }
  Future<void> _onLoadWatchlist(
    LoadWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(state.copyWith(status: WatchlistStatus.loading));
    final result = await getWatchlist();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: WatchlistStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (movies) =>
          emit(state.copyWith(status: WatchlistStatus.success, movies: movies)),
    );
  }

  Future<void> _onAddMovieToWatchlist(
    AddMovieToWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    final result = await addToWatchlist(event.movie);
    result.fold(
      (failure) {
        print('Watchlist Add Error: ${failure.message}');
      },
      (_) {
        add(CheckMovieStatus(event.movie.id));
        add(LoadWatchlist());
      },
    );
  }

  Future<void> _onRemoveMovieFromWatchlist(
    RemoveMovieFromWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    final result = await removeFromWatchlist(event.movieId);
    result.fold(
      (failure) {
        print('Watchlist Remove Error: ${failure.message}');
      },
      (_) {
        add(CheckMovieStatus(event.movieId));
        add(LoadWatchlist());
      },
    );
  }

  Future<void> _onCheckMovieStatus(
    CheckMovieStatus event,
    Emitter<WatchlistState> emit,
  ) async {
    final result = await checkWatchlistStatus(event.movieId);
    result.fold((failure) => null, (isAdded) {
      final newStatus = Map<int, bool>.from(state.movieStatus);
      newStatus[event.movieId] = isAdded;
      emit(state.copyWith(movieStatus: newStatus));
    });
  }
}
