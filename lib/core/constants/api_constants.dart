import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static String get apiKey => dotenv.env['TMDB_API_KEY'] ?? '';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';
  static const String posterSize = 'w500';
  static const String backdropSize = 'w780';
  static const String profileSize = 'w185';
  static const String trendingMovies = '/trending/movie/week';
  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String searchMovies = '/search/movie';
  static const String movieDetails = '/movie';
  static const String genres = '/genre/movie/list';
  static String poster(String? path) {
    if (path == null || path.isEmpty) return '';
    final cleanPath = path.startsWith('/') ? path : '/$path';
    return '$imageBaseUrl/$posterSize$cleanPath';
  }

  static String backdrop(String? path) {
    if (path == null || path.isEmpty) return '';
    final cleanPath = path.startsWith('/') ? path : '/$path';
    return '$imageBaseUrl/$backdropSize$cleanPath';
  }

  static String profile(String? path) {
    if (path == null || path.isEmpty) return '';
    final cleanPath = path.startsWith('/') ? path : '/$path';
    return '$imageBaseUrl/$profileSize$cleanPath';
  }
}
