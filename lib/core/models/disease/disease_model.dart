import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plant_disease_detection/index.dart';

part 'disease_model.freezed.dart';
part 'disease_model.g.dart';

@freezed
class DiseaseModel with _$DiseaseModel {
  const factory DiseaseModel({
    required String disease,
    required List<String> causes,
    required List<String> preventions,
    required RecommendationModel recommendations,
  }) = _DiseaseModel;
  factory DiseaseModel.fromJson(Map<String, dynamic> json) => _$DiseaseModelFromJson(json);
}
