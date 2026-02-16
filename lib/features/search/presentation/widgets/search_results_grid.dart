import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/constants/api_constants.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

class SearchResultsGrid extends StatelessWidget {
  final List<Movie> movies;

  const SearchResultsGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.55,
          crossAxisSpacing: 8,
          mainAxisSpacing: 16,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 3,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: GestureDetector(
                  onTap: () => context.push(
                    '/movie/${movie.id}',
                    extra: ApiConstants.poster(movie.posterPath),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Hero(
                          tag: 'movie_poster_${movie.id}',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: movie.posterPath != null
                                ? CachedNetworkImage(
                                    imageUrl: ApiConstants.poster(
                                      movie.posterPath,
                                    ),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      color: Colors.grey[900],
                                      child: const Center(
                                        child: CupertinoActivityIndicator(
                                          color: Color(0xFFE50914),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                          color: Colors.grey[900],
                                          child: const Icon(
                                            Icons.error,
                                            color: Color(0xFFE50914),
                                          ),
                                        ),
                                  )
                                : Container(
                                    color: Colors.grey[900],
                                    width: double.infinity,
                                    child: const Icon(
                                      Icons.movie,
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
