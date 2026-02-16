import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
class HeroMovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onPlayPressed;
  final VoidCallback onMyListPressed;
  const HeroMovieCard({
    super.key,
    required this.movie,
    required this.onPlayPressed,
    required this.onMyListPressed,
  });
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.55,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.transparent, Colors.black],
                stops: [0.0, 0.6, 1.0],
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: CachedNetworkImage(
              imageUrl: movie.backdropUrl.isNotEmpty
                  ? movie.backdropUrl
                  : movie.posterUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[900],
                child: const Center(
                  child: CupertinoActivityIndicator(color: Colors.white),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[900],
                child: const Icon(
                  CupertinoIcons.film,
                  color: Colors.grey,
                  size: 48,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 180,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGenreTag('Sci-Fi'),
                    _buildDot(),
                    _buildGenreTag('Adventure'),
                    _buildDot(),
                    _buildGenreTag('Action'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      icon: CupertinoIcons.plus,
                      label: 'My List',
                      onTap: onMyListPressed,
                    ),
                    SizedBox(
                      height: 42,
                      child: ElevatedButton.icon(
                        onPressed: onPlayPressed,
                        icon: const Icon(
                          CupertinoIcons.play_fill,
                          color: Colors.black,
                          size: 20,
                        ),
                        label: Text(
                          'Play',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    _buildActionButton(
                      icon: CupertinoIcons.info,
                      label: 'Info',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildGenreTag(String text) {
    return Text(
      text,
      style: GoogleFonts.outfit(
        color: Colors.white70,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
  Widget _buildDot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: Color(0xFFE50914),
        shape: BoxShape.circle,
      ),
    );
  }
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.outfit(color: Colors.white70, fontSize: 11),
          ),
        ],
      ),
    );
  }
}