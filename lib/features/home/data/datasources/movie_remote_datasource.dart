import 'package:dio/dio.dart';
import 'package:cineverse/features/home/data/models/movie_model.dart';
class MovieRemoteDataSource {
  final Dio _dio;
  MovieRemoteDataSource(this._dio);
  Future<MovieListResponse> getTrending(int page) async {
    final response = await _dio.get(
      '/trending/movie/week',
      queryParameters: {'page': page},
    );
    return MovieListResponse.fromJson(response.data);
  }
  Future<MovieListResponse> getPopular(int page) async {
    final response = await _dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    return MovieListResponse.fromJson(response.data);
  }
  Future<MovieListResponse> getTopRated(int page) async {
    final response = await _dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );
    return MovieListResponse.fromJson(response.data);
  }
  Future<MovieListResponse> getNowPlaying(int page) async {
    final response = await _dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    return MovieListResponse.fromJson(response.data);
  }
}