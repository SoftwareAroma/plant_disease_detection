// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CropModelImpl _$$CropModelImplFromJson(Map<String, dynamic> json) =>
    _$CropModelImpl(
      name: json['name'] as String,
      diseases: (json['diseases'] as List<dynamic>)
          .map((e) => DiseaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CropModelImplToJson(_$CropModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'diseases': instance.diseases,
    };
