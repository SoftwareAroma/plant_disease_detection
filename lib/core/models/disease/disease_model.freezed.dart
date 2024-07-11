// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disease_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiseaseModel _$DiseaseModelFromJson(Map<String, dynamic> json) {
  return _DiseaseModel.fromJson(json);
}

/// @nodoc
mixin _$DiseaseModel {
  String get disease => throw _privateConstructorUsedError;
  List<String> get causes => throw _privateConstructorUsedError;
  List<String> get preventions => throw _privateConstructorUsedError;
  RecommendationModel get recommendations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiseaseModelCopyWith<DiseaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseModelCopyWith<$Res> {
  factory $DiseaseModelCopyWith(
          DiseaseModel value, $Res Function(DiseaseModel) then) =
      _$DiseaseModelCopyWithImpl<$Res, DiseaseModel>;
  @useResult
  $Res call(
      {String disease,
      List<String> causes,
      List<String> preventions,
      RecommendationModel recommendations});

  $RecommendationModelCopyWith<$Res> get recommendations;
}

/// @nodoc
class _$DiseaseModelCopyWithImpl<$Res, $Val extends DiseaseModel>
    implements $DiseaseModelCopyWith<$Res> {
  _$DiseaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disease = null,
    Object? causes = null,
    Object? preventions = null,
    Object? recommendations = null,
  }) {
    return _then(_value.copyWith(
      disease: null == disease
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      causes: null == causes
          ? _value.causes
          : causes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preventions: null == preventions
          ? _value.preventions
          : preventions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as RecommendationModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecommendationModelCopyWith<$Res> get recommendations {
    return $RecommendationModelCopyWith<$Res>(_value.recommendations, (value) {
      return _then(_value.copyWith(recommendations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiseaseModelImplCopyWith<$Res>
    implements $DiseaseModelCopyWith<$Res> {
  factory _$$DiseaseModelImplCopyWith(
          _$DiseaseModelImpl value, $Res Function(_$DiseaseModelImpl) then) =
      __$$DiseaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String disease,
      List<String> causes,
      List<String> preventions,
      RecommendationModel recommendations});

  @override
  $RecommendationModelCopyWith<$Res> get recommendations;
}

/// @nodoc
class __$$DiseaseModelImplCopyWithImpl<$Res>
    extends _$DiseaseModelCopyWithImpl<$Res, _$DiseaseModelImpl>
    implements _$$DiseaseModelImplCopyWith<$Res> {
  __$$DiseaseModelImplCopyWithImpl(
      _$DiseaseModelImpl _value, $Res Function(_$DiseaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disease = null,
    Object? causes = null,
    Object? preventions = null,
    Object? recommendations = null,
  }) {
    return _then(_$DiseaseModelImpl(
      disease: null == disease
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      causes: null == causes
          ? _value._causes
          : causes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preventions: null == preventions
          ? _value._preventions
          : preventions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as RecommendationModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiseaseModelImpl implements _DiseaseModel {
  const _$DiseaseModelImpl(
      {required this.disease,
      required final List<String> causes,
      required final List<String> preventions,
      required this.recommendations})
      : _causes = causes,
        _preventions = preventions;

  factory _$DiseaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiseaseModelImplFromJson(json);

  @override
  final String disease;
  final List<String> _causes;
  @override
  List<String> get causes {
    if (_causes is EqualUnmodifiableListView) return _causes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_causes);
  }

  final List<String> _preventions;
  @override
  List<String> get preventions {
    if (_preventions is EqualUnmodifiableListView) return _preventions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preventions);
  }

  @override
  final RecommendationModel recommendations;

  @override
  String toString() {
    return 'DiseaseModel(disease: $disease, causes: $causes, preventions: $preventions, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiseaseModelImpl &&
            (identical(other.disease, disease) || other.disease == disease) &&
            const DeepCollectionEquality().equals(other._causes, _causes) &&
            const DeepCollectionEquality()
                .equals(other._preventions, _preventions) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      disease,
      const DeepCollectionEquality().hash(_causes),
      const DeepCollectionEquality().hash(_preventions),
      recommendations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiseaseModelImplCopyWith<_$DiseaseModelImpl> get copyWith =>
      __$$DiseaseModelImplCopyWithImpl<_$DiseaseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiseaseModelImplToJson(
      this,
    );
  }
}

abstract class _DiseaseModel implements DiseaseModel {
  const factory _DiseaseModel(
      {required final String disease,
      required final List<String> causes,
      required final List<String> preventions,
      required final RecommendationModel recommendations}) = _$DiseaseModelImpl;

  factory _DiseaseModel.fromJson(Map<String, dynamic> json) =
      _$DiseaseModelImpl.fromJson;

  @override
  String get disease;
  @override
  List<String> get causes;
  @override
  List<String> get preventions;
  @override
  RecommendationModel get recommendations;
  @override
  @JsonKey(ignore: true)
  _$$DiseaseModelImplCopyWith<_$DiseaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
