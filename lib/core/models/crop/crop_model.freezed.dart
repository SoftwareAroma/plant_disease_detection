// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CropModel _$CropModelFromJson(Map<String, dynamic> json) {
  return _CropModel.fromJson(json);
}

/// @nodoc
mixin _$CropModel {
  String get name => throw _privateConstructorUsedError;
  List<DiseaseModel> get diseases => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CropModelCopyWith<CropModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropModelCopyWith<$Res> {
  factory $CropModelCopyWith(CropModel value, $Res Function(CropModel) then) =
      _$CropModelCopyWithImpl<$Res, CropModel>;
  @useResult
  $Res call({String name, List<DiseaseModel> diseases});
}

/// @nodoc
class _$CropModelCopyWithImpl<$Res, $Val extends CropModel>
    implements $CropModelCopyWith<$Res> {
  _$CropModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? diseases = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      diseases: null == diseases
          ? _value.diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<DiseaseModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CropModelImplCopyWith<$Res>
    implements $CropModelCopyWith<$Res> {
  factory _$$CropModelImplCopyWith(
          _$CropModelImpl value, $Res Function(_$CropModelImpl) then) =
      __$$CropModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<DiseaseModel> diseases});
}

/// @nodoc
class __$$CropModelImplCopyWithImpl<$Res>
    extends _$CropModelCopyWithImpl<$Res, _$CropModelImpl>
    implements _$$CropModelImplCopyWith<$Res> {
  __$$CropModelImplCopyWithImpl(
      _$CropModelImpl _value, $Res Function(_$CropModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? diseases = null,
  }) {
    return _then(_$CropModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      diseases: null == diseases
          ? _value._diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<DiseaseModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CropModelImpl implements _CropModel {
  const _$CropModelImpl(
      {required this.name, required final List<DiseaseModel> diseases})
      : _diseases = diseases;

  factory _$CropModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropModelImplFromJson(json);

  @override
  final String name;
  final List<DiseaseModel> _diseases;
  @override
  List<DiseaseModel> get diseases {
    if (_diseases is EqualUnmodifiableListView) return _diseases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diseases);
  }

  @override
  String toString() {
    return 'CropModel(name: $name, diseases: $diseases)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._diseases, _diseases));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_diseases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CropModelImplCopyWith<_$CropModelImpl> get copyWith =>
      __$$CropModelImplCopyWithImpl<_$CropModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropModelImplToJson(
      this,
    );
  }
}

abstract class _CropModel implements CropModel {
  const factory _CropModel(
      {required final String name,
      required final List<DiseaseModel> diseases}) = _$CropModelImpl;

  factory _CropModel.fromJson(Map<String, dynamic> json) =
      _$CropModelImpl.fromJson;

  @override
  String get name;
  @override
  List<DiseaseModel> get diseases;
  @override
  @JsonKey(ignore: true)
  _$$CropModelImplCopyWith<_$CropModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
