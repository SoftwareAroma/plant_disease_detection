import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plant_disease_detection/index.dart';

part 'crop_model.freezed.dart';
part 'crop_model.g.dart';

@freezed
class CropModel with _$CropModel {
  const factory CropModel({
    required String name,
    required List<DiseaseModel> diseases,
  }) = _CropModel;
  factory CropModel.fromJson(Map<String, dynamic> json) => _$CropModelFromJson(json);
}
