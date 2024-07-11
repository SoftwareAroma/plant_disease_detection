// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PredictionModel _$PredictionModelFromJson(Map<String, dynamic> json) {
  return _PredictionModel.fromJson(json);
}

/// @nodoc
mixin _$PredictionModel {
  String get prediction => throw _privateConstructorUsedError;
  String get confidence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictionModelCopyWith<PredictionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionModelCopyWith<$Res> {
  factory $PredictionModelCopyWith(
          PredictionModel value, $Res Function(PredictionModel) then) =
      _$PredictionModelCopyWithImpl<$Res, PredictionModel>;
  @useResult
  $Res call({String prediction, String confidence});
}

/// @nodoc
class _$PredictionModelCopyWithImpl<$Res, $Val extends PredictionModel>
    implements $PredictionModelCopyWith<$Res> {
  _$PredictionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictionModelImplCopyWith<$Res>
    implements $PredictionModelCopyWith<$Res> {
  factory _$$PredictionModelImplCopyWith(_$PredictionModelImpl value,
          $Res Function(_$PredictionModelImpl) then) =
      __$$PredictionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String prediction, String confidence});
}

/// @nodoc
class __$$PredictionModelImplCopyWithImpl<$Res>
    extends _$PredictionModelCopyWithImpl<$Res, _$PredictionModelImpl>
    implements _$$PredictionModelImplCopyWith<$Res> {
  __$$PredictionModelImplCopyWithImpl(
      _$PredictionModelImpl _value, $Res Function(_$PredictionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = null,
    Object? confidence = null,
  }) {
    return _then(_$PredictionModelImpl(
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionModelImpl implements _PredictionModel {
  const _$PredictionModelImpl(
      {required this.prediction, required this.confidence});

  factory _$PredictionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionModelImplFromJson(json);

  @override
  final String prediction;
  @override
  final String confidence;

  @override
  String toString() {
    return 'PredictionModel(prediction: $prediction, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionModelImpl &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, prediction, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionModelImplCopyWith<_$PredictionModelImpl> get copyWith =>
      __$$PredictionModelImplCopyWithImpl<_$PredictionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionModelImplToJson(
      this,
    );
  }
}

abstract class _PredictionModel implements PredictionModel {
  const factory _PredictionModel(
      {required final String prediction,
      required final String confidence}) = _$PredictionModelImpl;

  factory _PredictionModel.fromJson(Map<String, dynamic> json) =
      _$PredictionModelImpl.fromJson;

  @override
  String get prediction;
  @override
  String get confidence;
  @override
  @JsonKey(ignore: true)
  _$$PredictionModelImplCopyWith<_$PredictionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
