import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
part 'movie_model.freezed.dart';
part 'movie_model.g.dart';
@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    required int id,
    required String title,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    required String overview,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'genre_ids') @Default([]) List<int> genreIds,
  }) = _MovieModel;
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
extension MovieModelX on MovieModel {
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      overview: overview,
      releaseDate: releaseDate,
      genreIds: genreIds,
    );
  }
}
@freezed
class MovieListResponse with _$MovieListResponse {
  const factory MovieListResponse({
    required int page,
    required List<MovieModel> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieListResponse;
  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);
}