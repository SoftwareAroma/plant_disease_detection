// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TranslationModel _$TranslationModelFromJson(Map<String, dynamic> json) {
  return _TranslationModel.fromJson(json);
}

/// @nodoc
mixin _$TranslationModel {
  String get sourceLanguage => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  String get translated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TranslationModelCopyWith<TranslationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationModelCopyWith<$Res> {
  factory $TranslationModelCopyWith(
          TranslationModel value, $Res Function(TranslationModel) then) =
      _$TranslationModelCopyWithImpl<$Res, TranslationModel>;
  @useResult
  $Res call(
      {String sourceLanguage,
      String targetLanguage,
      String recommendation,
      String translated});
}

/// @nodoc
class _$TranslationModelCopyWithImpl<$Res, $Val extends TranslationModel>
    implements $TranslationModelCopyWith<$Res> {
  _$TranslationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? recommendation = null,
    Object? translated = null,
  }) {
    return _then(_value.copyWith(
      sourceLanguage: null == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      translated: null == translated
          ? _value.translated
          : translated // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranslationModelImplCopyWith<$Res>
    implements $TranslationModelCopyWith<$Res> {
  factory _$$TranslationModelImplCopyWith(_$TranslationModelImpl value,
          $Res Function(_$TranslationModelImpl) then) =
      __$$TranslationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sourceLanguage,
      String targetLanguage,
      String recommendation,
      String translated});
}

/// @nodoc
class __$$TranslationModelImplCopyWithImpl<$Res>
    extends _$TranslationModelCopyWithImpl<$Res, _$TranslationModelImpl>
    implements _$$TranslationModelImplCopyWith<$Res> {
  __$$TranslationModelImplCopyWithImpl(_$TranslationModelImpl _value,
      $Res Function(_$TranslationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? recommendation = null,
    Object? translated = null,
  }) {
    return _then(_$TranslationModelImpl(
      sourceLanguage: null == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      targetLanguage: null == targetLanguage
          ? _value.targetLanguage
          : targetLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      translated: null == translated
          ? _value.translated
          : translated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationModelImpl implements _TranslationModel {
  const _$TranslationModelImpl(
      {required this.sourceLanguage,
      required this.targetLanguage,
      required this.recommendation,
      required this.translated});

  factory _$TranslationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationModelImplFromJson(json);

  @override
  final String sourceLanguage;
  @override
  final String targetLanguage;
  @override
  final String recommendation;
  @override
  final String translated;

  @override
  String toString() {
    return 'TranslationModel(sourceLanguage: $sourceLanguage, targetLanguage: $targetLanguage, recommendation: $recommendation, translated: $translated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationModelImpl &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.translated, translated) ||
                other.translated == translated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, sourceLanguage, targetLanguage, recommendation, translated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationModelImplCopyWith<_$TranslationModelImpl> get copyWith =>
      __$$TranslationModelImplCopyWithImpl<_$TranslationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationModelImplToJson(
      this,
    );
  }
}

abstract class _TranslationModel implements TranslationModel {
  const factory _TranslationModel(
      {required final String sourceLanguage,
      required final String targetLanguage,
      required final String recommendation,
      required final String translated}) = _$TranslationModelImpl;

  factory _TranslationModel.fromJson(Map<String, dynamic> json) =
      _$TranslationModelImpl.fromJson;

  @override
  String get sourceLanguage;
  @override
  String get targetLanguage;
  @override
  String get recommendation;
  @override
  String get translated;
  @override
  @JsonKey(ignore: true)
  _$$TranslationModelImplCopyWith<_$TranslationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
