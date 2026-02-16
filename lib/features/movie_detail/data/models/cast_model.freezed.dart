
part of 'cast_model.dart';


T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CastResponse _$CastResponseFromJson(Map<String, dynamic> json) {
  return _CastResponse.fromJson(json);
}

mixin _$CastResponse {
  int get id => throw _privateConstructorUsedError;
  List<CastModel> get cast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CastResponseCopyWith<CastResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $CastResponseCopyWith<$Res> {
  factory $CastResponseCopyWith(
          CastResponse value, $Res Function(CastResponse) then) =
      _$CastResponseCopyWithImpl<$Res, CastResponse>;
  @useResult
  $Res call({int id, List<CastModel> cast});
}

class _$CastResponseCopyWithImpl<$Res, $Val extends CastResponse>
    implements $CastResponseCopyWith<$Res> {
  _$CastResponseCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cast = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id
              as int,
      cast: null == cast
          ? _value.cast
          : cast
              as List<CastModel>,
    ) as $Val);
  }
}

abstract class _$$CastResponseImplCopyWith<$Res>
    implements $CastResponseCopyWith<$Res> {
  factory _$$CastResponseImplCopyWith(
          _$CastResponseImpl value, $Res Function(_$CastResponseImpl) then) =
      __$$CastResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<CastModel> cast});
}

class __$$CastResponseImplCopyWithImpl<$Res>
    extends _$CastResponseCopyWithImpl<$Res, _$CastResponseImpl>
    implements _$$CastResponseImplCopyWith<$Res> {
  __$$CastResponseImplCopyWithImpl(
      _$CastResponseImpl _value, $Res Function(_$CastResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cast = null,
  }) {
    return _then(_$CastResponseImpl(
      id: null == id
          ? _value.id
          : id
              as int,
      cast: null == cast
          ? _value._cast
          : cast
              as List<CastModel>,
    ));
  }
}

@JsonSerializable()
class _$CastResponseImpl implements _CastResponse {
  const _$CastResponseImpl(
      {required this.id, required final List<CastModel> cast})
      : _cast = cast;

  factory _$CastResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastResponseImplFromJson(json);

  @override
  final int id;
  final List<CastModel> _cast;
  @override
  List<CastModel> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    return EqualUnmodifiableListView(_cast);
  }

  @override
  String toString() {
    return 'CastResponse(id: $id, cast: $cast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._cast, _cast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_cast));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CastResponseImplCopyWith<_$CastResponseImpl> get copyWith =>
      __$$CastResponseImplCopyWithImpl<_$CastResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastResponseImplToJson(
      this,
    );
  }
}

abstract class _CastResponse implements CastResponse {
  const factory _CastResponse(
      {required final int id,
      required final List<CastModel> cast}) = _$CastResponseImpl;

  factory _CastResponse.fromJson(Map<String, dynamic> json) =
      _$CastResponseImpl.fromJson;

  @override
  int get id;
  @override
  List<CastModel> get cast;
  @override
  @JsonKey(ignore: true)
  _$$CastResponseImplCopyWith<_$CastResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CastModel _$CastModelFromJson(Map<String, dynamic> json) {
  return _CastModel.fromJson(json);
}

mixin _$CastModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get character => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CastModelCopyWith<CastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $CastModelCopyWith<$Res> {
  factory $CastModelCopyWith(CastModel value, $Res Function(CastModel) then) =
      _$CastModelCopyWithImpl<$Res, CastModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String character,
      @JsonKey(name: 'profile_path') String? profilePath});
}

class _$CastModelCopyWithImpl<$Res, $Val extends CastModel>
    implements $CastModelCopyWith<$Res> {
  _$CastModelCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = null,
    Object? profilePath = freezed,
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
      character: null == character
          ? _value.character
          : character
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath
              as String?,
    ) as $Val);
  }
}

abstract class _$$CastModelImplCopyWith<$Res>
    implements $CastModelCopyWith<$Res> {
  factory _$$CastModelImplCopyWith(
          _$CastModelImpl value, $Res Function(_$CastModelImpl) then) =
      __$$CastModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String character,
      @JsonKey(name: 'profile_path') String? profilePath});
}

class __$$CastModelImplCopyWithImpl<$Res>
    extends _$CastModelCopyWithImpl<$Res, _$CastModelImpl>
    implements _$$CastModelImplCopyWith<$Res> {
  __$$CastModelImplCopyWithImpl(
      _$CastModelImpl _value, $Res Function(_$CastModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = null,
    Object? profilePath = freezed,
  }) {
    return _then(_$CastModelImpl(
      id: null == id
          ? _value.id
          : id
              as int,
      name: null == name
          ? _value.name
          : name
              as String,
      character: null == character
          ? _value.character
          : character
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath
              as String?,
    ));
  }
}

@JsonSerializable()
class _$CastModelImpl implements _CastModel {
  const _$CastModelImpl(
      {required this.id,
      required this.name,
      required this.character,
      @JsonKey(name: 'profile_path') this.profilePath});

  factory _$CastModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String character;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @override
  String toString() {
    return 'CastModel(id: $id, name: $name, character: $character, profilePath: $profilePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, character, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CastModelImplCopyWith<_$CastModelImpl> get copyWith =>
      __$$CastModelImplCopyWithImpl<_$CastModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastModelImplToJson(
      this,
    );
  }
}

abstract class _CastModel implements CastModel {
  const factory _CastModel(
          {required final int id,
          required final String name,
          required final String character,
          @JsonKey(name: 'profile_path') final String? profilePath}) =
      _$CastModelImpl;

  factory _CastModel.fromJson(Map<String, dynamic> json) =
      _$CastModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get character;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$CastModelImplCopyWith<_$CastModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
