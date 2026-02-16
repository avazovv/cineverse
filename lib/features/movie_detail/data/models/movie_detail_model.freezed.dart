
part of 'movie_detail_model.dart';


T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) {
  return _MovieDetailModel.fromJson(json);
}

mixin _$MovieDetailModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  int get runtime => throw _privateConstructorUsedError;
  List<GenreModel> get genres => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;
  VideosResponseModel get videos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieDetailModelCopyWith<MovieDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $MovieDetailModelCopyWith<$Res> {
  factory $MovieDetailModelCopyWith(
          MovieDetailModel value, $Res Function(MovieDetailModel) then) =
      _$MovieDetailModelCopyWithImpl<$Res, MovieDetailModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      String overview,
      @JsonKey(name: 'release_date') String releaseDate,
      int runtime,
      List<GenreModel> genres,
      String status,
      String? tagline,
      VideosResponseModel videos});

  $VideosResponseModelCopyWith<$Res> get videos;
}

class _$MovieDetailModelCopyWithImpl<$Res, $Val extends MovieDetailModel>
    implements $MovieDetailModelCopyWith<$Res> {
  _$MovieDetailModelCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? runtime = null,
    Object? genres = null,
    Object? status = null,
    Object? tagline = freezed,
    Object? videos = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id
              as int,
      title: null == title
          ? _value.title
          : title
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath
              as String?,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage
              as double,
      overview: null == overview
          ? _value.overview
          : overview
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime
              as int,
      genres: null == genres
          ? _value.genres
          : genres
              as List<GenreModel>,
      status: null == status
          ? _value.status
          : status
              as String,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline
              as String?,
      videos: null == videos
          ? _value.videos
          : videos
              as VideosResponseModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VideosResponseModelCopyWith<$Res> get videos {
    return $VideosResponseModelCopyWith<$Res>(_value.videos, (value) {
      return _then(_value.copyWith(videos: value) as $Val);
    });
  }
}

abstract class _$$MovieDetailModelImplCopyWith<$Res>
    implements $MovieDetailModelCopyWith<$Res> {
  factory _$$MovieDetailModelImplCopyWith(_$MovieDetailModelImpl value,
          $Res Function(_$MovieDetailModelImpl) then) =
      __$$MovieDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'vote_average') double voteAverage,
      String overview,
      @JsonKey(name: 'release_date') String releaseDate,
      int runtime,
      List<GenreModel> genres,
      String status,
      String? tagline,
      VideosResponseModel videos});

  @override
  $VideosResponseModelCopyWith<$Res> get videos;
}

class __$$MovieDetailModelImplCopyWithImpl<$Res>
    extends _$MovieDetailModelCopyWithImpl<$Res, _$MovieDetailModelImpl>
    implements _$$MovieDetailModelImplCopyWith<$Res> {
  __$$MovieDetailModelImplCopyWithImpl(_$MovieDetailModelImpl _value,
      $Res Function(_$MovieDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? runtime = null,
    Object? genres = null,
    Object? status = null,
    Object? tagline = freezed,
    Object? videos = null,
  }) {
    return _then(_$MovieDetailModelImpl(
      id: null == id
          ? _value.id
          : id
              as int,
      title: null == title
          ? _value.title
          : title
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath
              as String?,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage
              as double,
      overview: null == overview
          ? _value.overview
          : overview
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime
              as int,
      genres: null == genres
          ? _value._genres
          : genres
              as List<GenreModel>,
      status: null == status
          ? _value.status
          : status
              as String,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline
              as String?,
      videos: null == videos
          ? _value.videos
          : videos
              as VideosResponseModel,
    ));
  }
}

@JsonSerializable()
class _$MovieDetailModelImpl implements _MovieDetailModel {
  const _$MovieDetailModelImpl(
      {required this.id,
      required this.title,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'vote_average') required this.voteAverage,
      required this.overview,
      @JsonKey(name: 'release_date') required this.releaseDate,
      required this.runtime,
      required final List<GenreModel> genres,
      required this.status,
      this.tagline,
      this.videos = const VideosResponseModel(results: [])})
      : _genres = genres;

  factory _$MovieDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  final String overview;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  final int runtime;
  final List<GenreModel> _genres;
  @override
  List<GenreModel> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final String status;
  @override
  final String? tagline;
  @override
  @JsonKey()
  final VideosResponseModel videos;

  @override
  String toString() {
    return 'MovieDetailModel(id: $id, title: $title, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, overview: $overview, releaseDate: $releaseDate, runtime: $runtime, genres: $genres, status: $status, tagline: $tagline, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.videos, videos) || other.videos == videos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      posterPath,
      backdropPath,
      voteAverage,
      overview,
      releaseDate,
      runtime,
      const DeepCollectionEquality().hash(_genres),
      status,
      tagline,
      videos);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailModelImplCopyWith<_$MovieDetailModelImpl> get copyWith =>
      __$$MovieDetailModelImplCopyWithImpl<_$MovieDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieDetailModelImplToJson(
      this,
    );
  }
}

abstract class _MovieDetailModel implements MovieDetailModel {
  const factory _MovieDetailModel(
      {required final int id,
      required final String title,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'vote_average') required final double voteAverage,
      required final String overview,
      @JsonKey(name: 'release_date') required final String releaseDate,
      required final int runtime,
      required final List<GenreModel> genres,
      required final String status,
      final String? tagline,
      final VideosResponseModel videos}) = _$MovieDetailModelImpl;

  factory _MovieDetailModel.fromJson(Map<String, dynamic> json) =
      _$MovieDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  String get overview;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  int get runtime;
  @override
  List<GenreModel> get genres;
  @override
  String get status;
  @override
  String? get tagline;
  @override
  VideosResponseModel get videos;
  @override
  @JsonKey(ignore: true)
  _$$MovieDetailModelImplCopyWith<_$MovieDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) {
  return _GenreModel.fromJson(json);
}

mixin _$GenreModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreModelCopyWith<GenreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $GenreModelCopyWith<$Res> {
  factory $GenreModelCopyWith(
          GenreModel value, $Res Function(GenreModel) then) =
      _$GenreModelCopyWithImpl<$Res, GenreModel>;
  @useResult
  $Res call({int id, String name});
}

class _$GenreModelCopyWithImpl<$Res, $Val extends GenreModel>
    implements $GenreModelCopyWith<$Res> {
  _$GenreModelCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id
              as int,
      name: null == name
          ? _value.name
          : name
              as String,
    ) as $Val);
  }
}

abstract class _$$GenreModelImplCopyWith<$Res>
    implements $GenreModelCopyWith<$Res> {
  factory _$$GenreModelImplCopyWith(
          _$GenreModelImpl value, $Res Function(_$GenreModelImpl) then) =
      __$$GenreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

class __$$GenreModelImplCopyWithImpl<$Res>
    extends _$GenreModelCopyWithImpl<$Res, _$GenreModelImpl>
    implements _$$GenreModelImplCopyWith<$Res> {
  __$$GenreModelImplCopyWithImpl(
      _$GenreModelImpl _value, $Res Function(_$GenreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$GenreModelImpl(
      id: null == id
          ? _value.id
          : id
              as int,
      name: null == name
          ? _value.name
          : name
              as String,
    ));
  }
}

@JsonSerializable()
class _$GenreModelImpl implements _GenreModel {
  const _$GenreModelImpl({required this.id, required this.name});

  factory _$GenreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'GenreModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreModelImplCopyWith<_$GenreModelImpl> get copyWith =>
      __$$GenreModelImplCopyWithImpl<_$GenreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreModelImplToJson(
      this,
    );
  }
}

abstract class _GenreModel implements GenreModel {
  const factory _GenreModel(
      {required final int id, required final String name}) = _$GenreModelImpl;

  factory _GenreModel.fromJson(Map<String, dynamic> json) =
      _$GenreModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$GenreModelImplCopyWith<_$GenreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideosResponseModel _$VideosResponseModelFromJson(Map<String, dynamic> json) {
  return _VideosResponseModel.fromJson(json);
}

mixin _$VideosResponseModel {
  List<VideoModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideosResponseModelCopyWith<VideosResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $VideosResponseModelCopyWith<$Res> {
  factory $VideosResponseModelCopyWith(
          VideosResponseModel value, $Res Function(VideosResponseModel) then) =
      _$VideosResponseModelCopyWithImpl<$Res, VideosResponseModel>;
  @useResult
  $Res call({List<VideoModel> results});
}

class _$VideosResponseModelCopyWithImpl<$Res, $Val extends VideosResponseModel>
    implements $VideosResponseModelCopyWith<$Res> {
  _$VideosResponseModelCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results
              as List<VideoModel>,
    ) as $Val);
  }
}

abstract class _$$VideosResponseModelImplCopyWith<$Res>
    implements $VideosResponseModelCopyWith<$Res> {
  factory _$$VideosResponseModelImplCopyWith(_$VideosResponseModelImpl value,
          $Res Function(_$VideosResponseModelImpl) then) =
      __$$VideosResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VideoModel> results});
}

class __$$VideosResponseModelImplCopyWithImpl<$Res>
    extends _$VideosResponseModelCopyWithImpl<$Res, _$VideosResponseModelImpl>
    implements _$$VideosResponseModelImplCopyWith<$Res> {
  __$$VideosResponseModelImplCopyWithImpl(_$VideosResponseModelImpl _value,
      $Res Function(_$VideosResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$VideosResponseModelImpl(
      results: null == results
          ? _value._results
          : results
              as List<VideoModel>,
    ));
  }
}

@JsonSerializable()
class _$VideosResponseModelImpl implements _VideosResponseModel {
  const _$VideosResponseModelImpl({required final List<VideoModel> results})
      : _results = results;

  factory _$VideosResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideosResponseModelImplFromJson(json);

  final List<VideoModel> _results;
  @override
  List<VideoModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'VideosResponseModel(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideosResponseModelImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideosResponseModelImplCopyWith<_$VideosResponseModelImpl> get copyWith =>
      __$$VideosResponseModelImplCopyWithImpl<_$VideosResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideosResponseModelImplToJson(
      this,
    );
  }
}

abstract class _VideosResponseModel implements VideosResponseModel {
  const factory _VideosResponseModel(
      {required final List<VideoModel> results}) = _$VideosResponseModelImpl;

  factory _VideosResponseModel.fromJson(Map<String, dynamic> json) =
      _$VideosResponseModelImpl.fromJson;

  @override
  List<VideoModel> get results;
  @override
  @JsonKey(ignore: true)
  _$$VideosResponseModelImplCopyWith<_$VideosResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) {
  return _VideoModel.fromJson(json);
}

mixin _$VideoModel {
  String get key => throw _privateConstructorUsedError;
  String get site => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoModelCopyWith<VideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $VideoModelCopyWith<$Res> {
  factory $VideoModelCopyWith(
          VideoModel value, $Res Function(VideoModel) then) =
      _$VideoModelCopyWithImpl<$Res, VideoModel>;
  @useResult
  $Res call({String key, String site, String type});
}

class _$VideoModelCopyWithImpl<$Res, $Val extends VideoModel>
    implements $VideoModelCopyWith<$Res> {
  _$VideoModelCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? site = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key
              as String,
      site: null == site
          ? _value.site
          : site
              as String,
      type: null == type
          ? _value.type
          : type
              as String,
    ) as $Val);
  }
}

abstract class _$$VideoModelImplCopyWith<$Res>
    implements $VideoModelCopyWith<$Res> {
  factory _$$VideoModelImplCopyWith(
          _$VideoModelImpl value, $Res Function(_$VideoModelImpl) then) =
      __$$VideoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String site, String type});
}

class __$$VideoModelImplCopyWithImpl<$Res>
    extends _$VideoModelCopyWithImpl<$Res, _$VideoModelImpl>
    implements _$$VideoModelImplCopyWith<$Res> {
  __$$VideoModelImplCopyWithImpl(
      _$VideoModelImpl _value, $Res Function(_$VideoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? site = null,
    Object? type = null,
  }) {
    return _then(_$VideoModelImpl(
      key: null == key
          ? _value.key
          : key
              as String,
      site: null == site
          ? _value.site
          : site
              as String,
      type: null == type
          ? _value.type
          : type
              as String,
    ));
  }
}

@JsonSerializable()
class _$VideoModelImpl implements _VideoModel {
  const _$VideoModelImpl(
      {required this.key, required this.site, required this.type});

  factory _$VideoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoModelImplFromJson(json);

  @override
  final String key;
  @override
  final String site;
  @override
  final String type;

  @override
  String toString() {
    return 'VideoModel(key: $key, site: $site, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoModelImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, site, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoModelImplCopyWith<_$VideoModelImpl> get copyWith =>
      __$$VideoModelImplCopyWithImpl<_$VideoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoModelImplToJson(
      this,
    );
  }
}

abstract class _VideoModel implements VideoModel {
  const factory _VideoModel(
      {required final String key,
      required final String site,
      required final String type}) = _$VideoModelImpl;

  factory _VideoModel.fromJson(Map<String, dynamic> json) =
      _$VideoModelImpl.fromJson;

  @override
  String get key;
  @override
  String get site;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$VideoModelImplCopyWith<_$VideoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
