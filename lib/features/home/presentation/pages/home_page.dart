import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cineverse/core/di/injection.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/home/presentation/bloc/home_bloc.dart';
import 'package:cineverse/features/home/presentation/bloc/home_event.dart';
import 'package:cineverse/features/home/presentation/bloc/home_state.dart';
import 'package:cineverse/features/home/presentation/widgets/hero_movie_card.dart';
import 'package:cineverse/features/home/presentation/widgets/movie_section.dart';
import 'package:cineverse/l10n/generated/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const LoadHomeData()),
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Color(0xFFE50914),
                  radius: 16,
                ),
              );
            } else if (state.status == HomeStatus.failure) {
              return _buildErrorState(context, state);
            } else if (state.status == HomeStatus.success) {
              return _buildSuccessState(context, state);
            }
            return const Center(
              child: CupertinoActivityIndicator(
                color: Color(0xFFE50914),
                radius: 16,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, HomeState state) {
    final l10n = AppLocalizations.of(context)!;
    return RefreshIndicator(
      color: const Color(0xFFE50914),
      onRefresh: () async {
        context.read<HomeBloc>().add(const RefreshHomeData());
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black.withValues(alpha: 0.85),
            surfaceTintColor: Colors.transparent,
            pinned: true,
            floating: false,
            expandedHeight: 0,
            toolbarHeight: 56,
            title: Text(
              'CINEVERSE',
              style: GoogleFonts.outfit(
                color: const Color(0xFFE50914),
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.0,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 4),
            ],
          ),
          if (state.trendingMovies.isNotEmpty)
            SliverToBoxAdapter(
              child: HeroMovieCard(
                movie: state.trendingMovies.first,
                onPlayPressed: () {
                  _navigateToDetail(context, state.trendingMovies.first);
                },
                onMyListPressed: () {},
              ),
            ),
          SliverToBoxAdapter(
            child: MovieSection(
              title: l10n.trendingNow,
              movies: state.trendingMovies,
              onMovieTap: (movie) => _navigateToDetail(context, movie),
              heroTagPrefix: 'trending',
            ),
          ),
          SliverToBoxAdapter(
            child: MovieSection(
              title: l10n.popular,
              movies: state.popularMovies,
              onMovieTap: (movie) => _navigateToDetail(context, movie),
              heroTagPrefix: 'popular',
            ),
          ),
          SliverToBoxAdapter(
            child: MovieSection(
              title: l10n.topRated,
              movies: state.topRatedMovies,
              onMovieTap: (movie) => _navigateToDetail(context, movie),
              heroTagPrefix: 'topRated',
            ),
          ),
          SliverToBoxAdapter(
            child: MovieSection(
              title: l10n.nowPlaying,
              movies: state.nowPlayingMovies,
              onMovieTap: (movie) => _navigateToDetail(context, movie),
              heroTagPrefix: 'nowPlaying',
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, HomeState state) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.wifi_slash,
              color: Color(0xFFE50914),
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.errorMessage ?? 'Unknown error',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                context.read<HomeBloc>().add(const LoadHomeData());
              },
              icon: const Icon(CupertinoIcons.arrow_clockwise, size: 18),
              label: Text(
                l10n.tryAgain,
                style: GoogleFonts.outfit(fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE50914),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, Movie movie) {
    context.push('/movie/${movie.id}', extra: movie.posterUrl);
  }
}
