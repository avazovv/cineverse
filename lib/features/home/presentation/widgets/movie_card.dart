import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/core/presentation/widgets/scale_on_tap.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;
  final double width;
  final String? heroTagPrefix;

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
    this.width = 120,
    this.heroTagPrefix,
  });
  @override
  Widget build(BuildContext context) {
    return ScaleOnTap(
      onTap: onTap ?? () {},
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: heroTagPrefix != null
                    ? '${heroTagPrefix}_movie_poster_${movie.id}'
                    : 'movie_poster_${movie.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: movie.posterUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[900],
                      child: const Center(
                        child: CupertinoActivityIndicator(
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[900],
                      child: const Icon(
                        CupertinoIcons.film,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.amber,
                  size: 12,
                ),
                const SizedBox(width: 4),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: GoogleFonts.outfit(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
