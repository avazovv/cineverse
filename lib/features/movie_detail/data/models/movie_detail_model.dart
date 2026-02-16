import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cineverse/features/movie_detail/domain/entities/movie_detail.dart';
part 'movie_detail_model.freezed.dart';
part 'movie_detail_model.g.dart';

@freezed
class MovieDetailModel with _$MovieDetailModel {
  const factory MovieDetailModel({
    required int id,
    required String title,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    required String overview,
    @JsonKey(name: 'release_date') required String releaseDate,
    required int runtime,
    required List<GenreModel> genres,
    required String status,
    String? tagline,
    @Default(VideosResponseModel(results: [])) VideosResponseModel videos,
  }) = _MovieDetailModel;
  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);
}

@freezed
class GenreModel with _$GenreModel {
  const factory GenreModel({required int id, required String name}) =
      _GenreModel;
  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);
}

@freezed
class VideosResponseModel with _$VideosResponseModel {
  const factory VideosResponseModel({required List<VideoModel> results}) =
      _VideosResponseModel;
  factory VideosResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VideosResponseModelFromJson(json);
}

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String key,
    required String site,
    required String type,
  }) = _VideoModel;
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}

extension MovieDetailModelX on MovieDetailModel {
  MovieDetail toEntity() {
    final trailer = videos.results.firstWhere(
      (video) => video.site == 'YouTube' && video.type == 'Trailer',
      orElse: () => videos.results.firstWhere(
        (video) => video.site == 'YouTube',
        orElse: () => const VideoModel(key: '', site: '', type: ''),
      ),
    );
    return MovieDetail(
      id: id,
      title: title,
      posterPath: posterPath,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      overview: overview,
      releaseDate: releaseDate,
      runtime: runtime,
      genres: genres.map((g) => Genre(id: g.id, name: g.name)).toList(),
      status: status,
      tagline: tagline,
      youtubeVideoId: trailer.key.isNotEmpty ? trailer.key : null,
    );
  }
}
