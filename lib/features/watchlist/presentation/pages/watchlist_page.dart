import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_state.dart';
import 'package:cineverse/features/watchlist/presentation/widgets/watchlist_grid.dart';
import 'package:cineverse/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WatchlistBloc>().add(LoadWatchlist());
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          l10n.watchlistTitle,
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          if (state.status == WatchlistStatus.loading) {
            return const Center(
              child: CupertinoActivityIndicator(color: Color(0xFFE50914)),
            );
          } else if (state.status == WatchlistStatus.failure) {
            return _buildEmptyState(
              icon: CupertinoIcons.exclamationmark_circle,
              message: state.errorMessage.isNotEmpty
                  ? state.errorMessage
                  : l10n.searchError,
            );
          } else if (state.status == WatchlistStatus.success) {
            if (state.movies.isEmpty) {
              return _buildEmptyState(
                icon: CupertinoIcons.bookmark,
                message: l10n.watchlistEmpty,
                subtitle: l10n.watchlistEmptySubtitle,
              );
            }
            return WatchlistGrid(movies: state.movies);
          }
          return _buildEmptyState(
            icon: CupertinoIcons.bookmark,
            message: l10n.watchlistEmpty,
            subtitle: l10n.watchlistEmptySubtitle,
          );
        },
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String message,
    String? subtitle,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: const Color(0xFF2A2A2A)),
          const SizedBox(height: 16),
          Text(
            message,
            style: GoogleFonts.outfit(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: GoogleFonts.outfit(color: Colors.grey[700], fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}
