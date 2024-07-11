import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_model.freezed.dart';
part 'recommendation_model.g.dart';

@freezed
class RecommendationModel with _$RecommendationModel {
  const factory RecommendationModel({
    required List<String> organic,
    required List<String> chemical,
  }) = _RecommendationModel;
  factory RecommendationModel.fromJson(Map<String, dynamic> json) => _$RecommendationModelFromJson(json);
}
