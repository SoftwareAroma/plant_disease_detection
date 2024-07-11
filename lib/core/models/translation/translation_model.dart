import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_model.freezed.dart';
part 'translation_model.g.dart';

@freezed
class TranslationModel with _$TranslationModel {
  const factory TranslationModel({
    required String sourceLanguage,
    required String targetLanguage,
    required String recommendation,
    required String translated,
  }) = _TranslationModel;
  factory TranslationModel.fromJson(Map<String, dynamic> json) => _$TranslationModelFromJson(json);
}
