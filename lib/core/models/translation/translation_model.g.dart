// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslationModelImpl _$$TranslationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TranslationModelImpl(
      sourceLanguage: json['sourceLanguage'] as String,
      targetLanguage: json['targetLanguage'] as String,
      recommendation: json['recommendation'] as String,
      translated: json['translated'] as String,
    );

Map<String, dynamic> _$$TranslationModelImplToJson(
        _$TranslationModelImpl instance) =>
    <String, dynamic>{
      'sourceLanguage': instance.sourceLanguage,
      'targetLanguage': instance.targetLanguage,
      'recommendation': instance.recommendation,
      'translated': instance.translated,
    };
