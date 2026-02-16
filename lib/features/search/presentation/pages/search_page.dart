import 'package:cineverse/core/di/injection.dart';
import 'package:cineverse/features/search/presentation/bloc/search_bloc.dart';
import 'package:cineverse/features/search/presentation/bloc/search_state.dart';
import 'package:cineverse/features/search/presentation/widgets/search_bar_widget.dart';
import 'package:cineverse/features/search/presentation/widgets/search_results_grid.dart';
import 'package:cineverse/features/search/presentation/widgets/search_shimmer_loading.dart';
import 'package:cineverse/features/search/presentation/widgets/search_history_widget.dart';
import 'package:cineverse/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: SearchBarWidget(),
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.status == SearchStatus.loading) {
                      return const SearchShimmerLoading();
                    } else if (state.status == SearchStatus.success) {
                      if (state.movies.isEmpty) {
                        return _buildEmptyState(
                          icon: CupertinoIcons.search,
                          message: l10n.noMoviesFound,
                        );
                      }
                      return SearchResultsGrid(movies: state.movies);
                    } else if (state.status == SearchStatus.failure) {
                      return _buildEmptyState(
                        icon: CupertinoIcons.exclamationmark_circle,
                        message: state.errorMessage.isNotEmpty
                            ? state.errorMessage
                            : l10n.searchError,
                      );
                    }
                    return _buildInitialState(state.history, l10n);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState(List<String> history, AppLocalizations l10n) {
    if (history.isNotEmpty) {
      return SearchHistoryWidget(history: history);
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.film, size: 64, color: Color(0xFF2A2A2A)),
          const SizedBox(height: 16),
          Text(
            l10n.startSearching,
            style: GoogleFonts.outfit(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState({required IconData icon, required String message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Colors.grey[600]),
          const SizedBox(height: 16),
          Text(
            message,
            style: GoogleFonts.outfit(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }
}
