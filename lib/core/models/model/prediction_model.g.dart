// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionModelImpl _$$PredictionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictionModelImpl(
      prediction: json['prediction'] as String,
      confidence: json['confidence'] as String,
    );

Map<String, dynamic> _$$PredictionModelImplToJson(
        _$PredictionModelImpl instance) =>
    <String, dynamic>{
      'prediction': instance.prediction,
      'confidence': instance.confidence,
    };
