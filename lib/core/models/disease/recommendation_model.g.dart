// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendationModelImpl _$$RecommendationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendationModelImpl(
      organic:
          (json['organic'] as List<dynamic>).map((e) => e as String).toList(),
      chemical:
          (json['chemical'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RecommendationModelImplToJson(
        _$RecommendationModelImpl instance) =>
    <String, dynamic>{
      'organic': instance.organic,
      'chemical': instance.chemical,
    };
