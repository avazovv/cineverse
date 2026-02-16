
part of 'movie_detail_model.dart';


_$MovieDetailModelImpl _$$MovieDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieDetailModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      runtime: (json['runtime'] as num).toInt(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String?,
      videos: json['videos'] == null
          ? const VideosResponseModel(results: [])
          : VideosResponseModel.fromJson(
              json['videos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MovieDetailModelImplToJson(
        _$MovieDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'status': instance.status,
      'tagline': instance.tagline,
      'videos': instance.videos,
    };

_$GenreModelImpl _$$GenreModelImplFromJson(Map<String, dynamic> json) =>
    _$GenreModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$GenreModelImplToJson(_$GenreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$VideosResponseModelImpl _$$VideosResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VideosResponseModelImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideosResponseModelImplToJson(
        _$VideosResponseModelImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

_$VideoModelImpl _$$VideoModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoModelImpl(
      key: json['key'] as String,
      site: json['site'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$VideoModelImplToJson(_$VideoModelImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
    };
