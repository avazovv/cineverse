import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cineverse/features/search/domain/usecases/search_movies.dart';
import 'package:cineverse/features/search/presentation/bloc/search_event.dart';
import 'package:cineverse/features/search/presentation/bloc/search_state.dart';
import 'package:cineverse/features/search/domain/usecases/search_history_usecases.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies searchMovies;
  final GetSearchHistory getSearchHistory;
  final SaveSearchQuery saveSearchQuery;
  final DeleteSearchQuery deleteSearchQuery;

  SearchBloc({
    required this.searchMovies,
    required this.getSearchHistory,
    required this.saveSearchQuery,
    required this.deleteSearchQuery,
  }) : super(const SearchState()) {
    on<SearchQueryChanged>(
      _onSearchQueryChanged,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 500))
          .switchMap(mapper),
    );
    on<LoadSearchHistory>(_onLoadSearchHistory);
    on<SaveSearchQueryEvent>(_onSaveSearchQuery);
    on<DeleteSearchQueryEvent>(_onDeleteSearchQuery);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(LoadSearchHistory());
      emit(state.copyWith(status: SearchStatus.initial, movies: []));
      return;
    }
    emit(state.copyWith(status: SearchStatus.loading));
    final result = await searchMovies(event.query);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SearchStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (movies) {
        add(SaveSearchQueryEvent(event.query));
        emit(state.copyWith(status: SearchStatus.success, movies: movies));
      },
    );
  }

  Future<void> _onLoadSearchHistory(
    LoadSearchHistory event,
    Emitter<SearchState> emit,
  ) async {
    final result = await getSearchHistory();
    result.fold(
      (failure) => null,
      (history) => emit(state.copyWith(history: history)),
    );
  }

  Future<void> _onSaveSearchQuery(
    SaveSearchQueryEvent event,
    Emitter<SearchState> emit,
  ) async {
    await saveSearchQuery(event.query);
    add(LoadSearchHistory());
  }

  Future<void> _onDeleteSearchQuery(
    DeleteSearchQueryEvent event,
    Emitter<SearchState> emit,
  ) async {
    await deleteSearchQuery(event.query);
    add(LoadSearchHistory());
  }
}
