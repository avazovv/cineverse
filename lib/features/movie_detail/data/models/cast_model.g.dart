
part of 'cast_model.dart';


_$CastResponseImpl _$$CastResponseImplFromJson(Map<String, dynamic> json) =>
    _$CastResponseImpl(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CastResponseImplToJson(_$CastResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };

_$CastModelImpl _$$CastModelImplFromJson(Map<String, dynamic> json) =>
    _$CastModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      character: json['character'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$CastModelImplToJson(_$CastModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'character': instance.character,
      'profile_path': instance.profilePath,
    };
