import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cineverse/features/movie_detail/domain/entities/cast.dart';
part 'cast_model.freezed.dart';
part 'cast_model.g.dart';
@freezed
class CastResponse with _$CastResponse {
  const factory CastResponse({required int id, required List<CastModel> cast}) =
      _CastResponse;
  factory CastResponse.fromJson(Map<String, dynamic> json) =>
      _$CastResponseFromJson(json);
}
@freezed
class CastModel with _$CastModel {
  const factory CastModel({
    required int id,
    required String name,
    required String character,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _CastModel;
  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);
}
extension CastModelX on CastModel {
  Cast toEntity() =>
      Cast(id: id, name: name, character: character, profilePath: profilePath);
}