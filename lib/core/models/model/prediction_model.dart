import 'package:freezed_annotation/freezed_annotation.dart';

part 'prediction_model.freezed.dart';
part 'prediction_model.g.dart';

@freezed
class PredictionModel with _$PredictionModel {
  const factory PredictionModel({
    required String prediction,
    required String confidence,
  }) = _PredictionModel;
  factory PredictionModel.fromJson(Map<String, dynamic> json) => _$PredictionModelFromJson(json);
}
