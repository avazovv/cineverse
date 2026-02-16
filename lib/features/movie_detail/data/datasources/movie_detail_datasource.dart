import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/constants/api_constants.dart';
import 'package:cineverse/features/home/data/models/movie_model.dart';
import 'package:cineverse/features/movie_detail/data/models/cast_model.dart';
import 'package:cineverse/features/movie_detail/data/models/movie_detail_model.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<CastResponse> getMovieCast(int id);
  Future<MovieListResponse> getSimilarMovies(int id);
}

@LazySingleton(as: MovieDetailRemoteDataSource)
class MovieDetailRemoteDataSourceImpl implements MovieDetailRemoteDataSource {
  final Dio _dio;
  MovieDetailRemoteDataSourceImpl(this._dio);
  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _dio.get(
      '${ApiConstants.movieDetails}/$id',
      queryParameters: {'append_to_response': 'videos'},
    );
    return MovieDetailModel.fromJson(response.data);
  }

  @override
  Future<CastResponse> getMovieCast(int id) async {
    final response = await _dio.get('${ApiConstants.movieDetails}/$id/credits');
    return CastResponse.fromJson(response.data);
  }

  @override
  Future<MovieListResponse> getSimilarMovies(int id) async {
    final response = await _dio.get('${ApiConstants.movieDetails}/$id/similar');
    return MovieListResponse.fromJson(response.data);
  }
}
