// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiseaseModelImpl _$$DiseaseModelImplFromJson(Map<String, dynamic> json) =>
    _$DiseaseModelImpl(
      disease: json['disease'] as String,
      causes:
          (json['causes'] as List<dynamic>).map((e) => e as String).toList(),
      preventions: (json['preventions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      recommendations: RecommendationModel.fromJson(
          json['recommendations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DiseaseModelImplToJson(_$DiseaseModelImpl instance) =>
    <String, dynamic>{
      'disease': instance.disease,
      'causes': instance.causes,
      'preventions': instance.preventions,
      'recommendations': instance.recommendations,
    };
