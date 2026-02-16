import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/constants/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cineverse/core/di/injection.dart';
import 'package:cineverse/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:cineverse/features/movie_detail/presentation/bloc/movie_detail_event.dart';
import 'package:cineverse/features/movie_detail/presentation/bloc/movie_detail_state.dart';
import 'package:cineverse/features/home/presentation/widgets/movie_card.dart';
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_state.dart';
import 'package:cineverse/features/movie_detail/presentation/widgets/trailer_player.dart';
import 'package:palette_generator/palette_generator.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  final String? posterPath;
  const MovieDetailPage({super.key, required this.movieId, this.posterPath});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  PaletteGenerator? _paletteGenerator;

  @override
  void initState() {
    super.initState();
    context.read<WatchlistBloc>().add(CheckMovieStatus(widget.movieId));
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    if (widget.posterPath == null) return;
    try {
      final provider = NetworkImage(widget.posterPath!);
      final generator = await PaletteGenerator.fromImageProvider(
        provider,
        size: const Size(40, 60),
        maximumColorCount: 10,
      );
      if (mounted) {
        setState(() {
          _paletteGenerator = generator;
        });
      }
    } catch (e) {
      debugPrint('Error generating palette: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dominantColor =
        _paletteGenerator?.dominantColor?.color ?? Colors.black;
    final darkMutedColor =
        _paletteGenerator?.darkMutedColor?.color ?? Colors.black;

    final backgroundColor =
        _paletteGenerator?.darkMutedColor?.color ?? dominantColor;

    return BlocProvider(
      create: (context) =>
          getIt<MovieDetailBloc>()..add(LoadMovieDetail(widget.movieId)),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                backgroundColor.withOpacity(0.6),
                Colors.black,
                Colors.black,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
          child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            builder: (context, state) {
              final movie = state.movieDetail;
              final isLoading = state.status == MovieDetailStatus.loading;
              final isFailure = state.status == MovieDetailStatus.failure;

              if (isFailure) {
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Error',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }

              return Stack(
                children: [
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 300,
                        pinned: true,
                        stretch: true,
                        backgroundColor:
                            Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        leading: IconButton(
                          icon: const Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        flexibleSpace: FlexibleSpaceBar(
                          stretchModes: const [
                            StretchMode.zoomBackground,
                            StretchMode.blurBackground,
                          ],
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              if (movie?.backdropPath != null)
                                CachedNetworkImage(
                                  imageUrl: ApiConstants.backdrop(
                                    movie!.backdropPath!,
                                  ),
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Container(color: Colors.grey[900]),
                                )
                              else
                                Container(color: Colors.grey[900]),

                              const DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black54,
                                      Colors.black,
                                    ],
                                    stops: [0.0, 0.6, 1.0],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: 'movie_poster_${widget.movieId}',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: widget.posterPath != null
                                          ? CachedNetworkImage(
                                              imageUrl: widget.posterPath!,
                                              width: 120,
                                              height: 180,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Container(
                                                    color: Colors.grey[900],
                                                  ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                        color: Colors.grey[900],
                                                        child: const Icon(
                                                          Icons.movie,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                            )
                                          : Container(
                                              width: 120,
                                              height: 180,
                                              color: Colors.grey[900],
                                            ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie?.title ?? 'Loading...',
                                          style: GoogleFonts.outfit(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        if (movie != null)
                                          Row(
                                            children: [
                                              const Icon(
                                                CupertinoIcons.star_fill,
                                                color: Colors.amber,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                movie.voteAverage
                                                    .toStringAsFixed(1),
                                                style: GoogleFonts.outfit(
                                                  color: Colors.white70,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Text(
                                                movie.releaseDate.split('-')[0],
                                                style: GoogleFonts.outfit(
                                                  color: Colors.white70,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Text(
                                                movie.durationText,
                                                style: GoogleFonts.outfit(
                                                  color: Colors.white70,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(height: 8),
                                        if (movie != null)
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 4,
                                            children: movie.genres
                                                .map(
                                                  (g) => Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 2,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.white24,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      g.name,
                                                      style: GoogleFonts.outfit(
                                                        color: Colors.white70,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (isLoading)
                                const Center(
                                  child: CupertinoActivityIndicator(
                                    color: Color(0xFFE50914),
                                  ),
                                ),
                              if (movie != null) ...[
                                const SizedBox(height: 24),
                                Text(
                                  'Overview',
                                  style: GoogleFonts.outfit(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  movie.overview,
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.8),
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Cast',
                                  style: GoogleFonts.outfit(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  height: 120,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.cast.length,
                                    itemBuilder: (context, index) {
                                      final cast = state.cast[index];
                                      return Container(
                                        width: 80,
                                        margin: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    cast.profilePath != null
                                                    ? ApiConstants.profile(
                                                        cast.profilePath,
                                                      )
                                                    : '',
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Container(
                                                      color: Colors.grey[900],
                                                    ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(
                                                          color:
                                                              Colors.grey[900],
                                                          child: const Icon(
                                                            CupertinoIcons
                                                                .person_fill,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              cast.name,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.outfit(
                                                fontSize: 10,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                if (movie.youtubeVideoId != null) ...[
                                  const SizedBox(height: 24),
                                  TrailerPlayer(videoId: movie.youtubeVideoId!),
                                ],
                                const SizedBox(height: 24),
                                if (state.similarMovies.isNotEmpty) ...[
                                  Text(
                                    'Similar Movies',
                                    style: GoogleFonts.outfit(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.similarMovies.length,
                                      itemBuilder: (context, index) {
                                        return MovieCard(
                                          movie: state.similarMovies[index],
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MovieDetailPage(
                                                      movieId: state
                                                          .similarMovies[index]
                                                          .id,
                                                      posterPath: state
                                                          .similarMovies[index]
                                                          .posterUrl,
                                                    ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 80),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: BlocBuilder<WatchlistBloc, WatchlistState>(
                      builder: (context, watchlistState) {
                        final isInWatchlist =
                            watchlistState.movieStatus[widget.movieId] ?? false;
                        if (movie == null) return const SizedBox.shrink();
                        return FloatingActionButton.extended(
                          onPressed: () {
                            if (isInWatchlist) {
                              context.read<WatchlistBloc>().add(
                                RemoveMovieFromWatchlist(widget.movieId),
                              );
                            } else {
                              context.read<WatchlistBloc>().add(
                                AddMovieToWatchlist(movie),
                              );
                            }
                          },
                          backgroundColor: isInWatchlist
                              ? const Color(0xFF2A2A2A)
                              : backgroundColor,
                          icon: Icon(
                            isInWatchlist
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            color: Colors.white,
                          ),
                          label: Text(
                            isInWatchlist ? 'Saved' : 'Watchlist',
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
