import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
import 'package:cineverse/features/home/presentation/widgets/movie_card.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? onSeeAllPressed;
  final Function(Movie)? onMovieTap;
  final String? heroTagPrefix;

  const MovieSection({
    super.key,
    required this.title,
    required this.movies,
    this.onSeeAllPressed,
    this.onMovieTap,
    this.heroTagPrefix,
  });
  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (onSeeAllPressed != null)
                GestureDetector(
                  onTap: onSeeAllPressed,
                  child: Text(
                    'See All',
                    style: GoogleFonts.outfit(
                      color: const Color(0xFFE50914),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: AnimationLimiter(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: MovieCard(
                        movie: movies[index],
                        onTap: () => onMovieTap?.call(movies[index]),
                        heroTagPrefix: heroTagPrefix,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
