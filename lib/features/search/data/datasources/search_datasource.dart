import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/constants/api_constants.dart';
import 'package:cineverse/features/home/data/models/movie_model.dart';
abstract class SearchRemoteDataSource {
  Future<MovieListResponse> searchMovies(String query, {int page = 1});
}
@LazySingleton(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio _dio;
  SearchRemoteDataSourceImpl(this._dio);
  @override
  Future<MovieListResponse> searchMovies(String query, {int page = 1}) async {
    final response = await _dio.get(
      ApiConstants.searchMovies,
      queryParameters: {'query': query, 'page': page},
    );
    return MovieListResponse.fromJson(response.data);
  }
}