// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecommendationModel _$RecommendationModelFromJson(Map<String, dynamic> json) {
  return _RecommendationModel.fromJson(json);
}

/// @nodoc
mixin _$RecommendationModel {
  List<String> get organic => throw _privateConstructorUsedError;
  List<String> get chemical => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendationModelCopyWith<RecommendationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationModelCopyWith<$Res> {
  factory $RecommendationModelCopyWith(
          RecommendationModel value, $Res Function(RecommendationModel) then) =
      _$RecommendationModelCopyWithImpl<$Res, RecommendationModel>;
  @useResult
  $Res call({List<String> organic, List<String> chemical});
}

/// @nodoc
class _$RecommendationModelCopyWithImpl<$Res, $Val extends RecommendationModel>
    implements $RecommendationModelCopyWith<$Res> {
  _$RecommendationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organic = null,
    Object? chemical = null,
  }) {
    return _then(_value.copyWith(
      organic: null == organic
          ? _value.organic
          : organic // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chemical: null == chemical
          ? _value.chemical
          : chemical // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendationModelImplCopyWith<$Res>
    implements $RecommendationModelCopyWith<$Res> {
  factory _$$RecommendationModelImplCopyWith(_$RecommendationModelImpl value,
          $Res Function(_$RecommendationModelImpl) then) =
      __$$RecommendationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> organic, List<String> chemical});
}

/// @nodoc
class __$$RecommendationModelImplCopyWithImpl<$Res>
    extends _$RecommendationModelCopyWithImpl<$Res, _$RecommendationModelImpl>
    implements _$$RecommendationModelImplCopyWith<$Res> {
  __$$RecommendationModelImplCopyWithImpl(_$RecommendationModelImpl _value,
      $Res Function(_$RecommendationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organic = null,
    Object? chemical = null,
  }) {
    return _then(_$RecommendationModelImpl(
      organic: null == organic
          ? _value._organic
          : organic // ignore: cast_nullable_to_non_nullable
              as List<String>,
      chemical: null == chemical
          ? _value._chemical
          : chemical // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationModelImpl implements _RecommendationModel {
  const _$RecommendationModelImpl(
      {required final List<String> organic,
      required final List<String> chemical})
      : _organic = organic,
        _chemical = chemical;

  factory _$RecommendationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationModelImplFromJson(json);

  final List<String> _organic;
  @override
  List<String> get organic {
    if (_organic is EqualUnmodifiableListView) return _organic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organic);
  }

  final List<String> _chemical;
  @override
  List<String> get chemical {
    if (_chemical is EqualUnmodifiableListView) return _chemical;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chemical);
  }

  @override
  String toString() {
    return 'RecommendationModel(organic: $organic, chemical: $chemical)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationModelImpl &&
            const DeepCollectionEquality().equals(other._organic, _organic) &&
            const DeepCollectionEquality().equals(other._chemical, _chemical));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_organic),
      const DeepCollectionEquality().hash(_chemical));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationModelImplCopyWith<_$RecommendationModelImpl> get copyWith =>
      __$$RecommendationModelImplCopyWithImpl<_$RecommendationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationModelImplToJson(
      this,
    );
  }
}

abstract class _RecommendationModel implements RecommendationModel {
  const factory _RecommendationModel(
      {required final List<String> organic,
      required final List<String> chemical}) = _$RecommendationModelImpl;

  factory _RecommendationModel.fromJson(Map<String, dynamic> json) =
      _$RecommendationModelImpl.fromJson;

  @override
  List<String> get organic;
  @override
  List<String> get chemical;
  @override
  @JsonKey(ignore: true)
  _$$RecommendationModelImplCopyWith<_$RecommendationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
