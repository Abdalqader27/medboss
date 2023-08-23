// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollageModel _$CollageModelFromJson(Map<String, dynamic> json) {
  return _CollageModel.fromJson(json);
}

/// @nodoc
mixin _$CollageModel {
  String get className => throw _privateConstructorUsedError;
  String get objectId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'collage_id')
  String get collageId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollageModelCopyWith<CollageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollageModelCopyWith<$Res> {
  factory $CollageModelCopyWith(
          CollageModel value, $Res Function(CollageModel) then) =
      _$CollageModelCopyWithImpl<$Res, CollageModel>;
  @useResult
  $Res call(
      {String className,
      String objectId,
      DateTime createdAt,
      DateTime updatedAt,
      String name,
      @JsonKey(name: 'collage_id') String collageId});
}

/// @nodoc
class _$CollageModelCopyWithImpl<$Res, $Val extends CollageModel>
    implements $CollageModelCopyWith<$Res> {
  _$CollageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? className = null,
    Object? objectId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? collageId = null,
  }) {
    return _then(_value.copyWith(
      className: null == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      collageId: null == collageId
          ? _value.collageId
          : collageId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CollageModelCopyWith<$Res>
    implements $CollageModelCopyWith<$Res> {
  factory _$$_CollageModelCopyWith(
          _$_CollageModel value, $Res Function(_$_CollageModel) then) =
      __$$_CollageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String className,
      String objectId,
      DateTime createdAt,
      DateTime updatedAt,
      String name,
      @JsonKey(name: 'collage_id') String collageId});
}

/// @nodoc
class __$$_CollageModelCopyWithImpl<$Res>
    extends _$CollageModelCopyWithImpl<$Res, _$_CollageModel>
    implements _$$_CollageModelCopyWith<$Res> {
  __$$_CollageModelCopyWithImpl(
      _$_CollageModel _value, $Res Function(_$_CollageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? className = null,
    Object? objectId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? collageId = null,
  }) {
    return _then(_$_CollageModel(
      className: null == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      collageId: null == collageId
          ? _value.collageId
          : collageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CollageModel extends _CollageModel with DiagnosticableTreeMixin {
  const _$_CollageModel(
      {required this.className,
      required this.objectId,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      @JsonKey(name: 'collage_id') required this.collageId})
      : super._();

  factory _$_CollageModel.fromJson(Map<String, dynamic> json) =>
      _$$_CollageModelFromJson(json);

  @override
  final String className;
  @override
  final String objectId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String name;
  @override
  @JsonKey(name: 'collage_id')
  final String collageId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CollageModel(className: $className, objectId: $objectId, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, collageId: $collageId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CollageModel'))
      ..add(DiagnosticsProperty('className', className))
      ..add(DiagnosticsProperty('objectId', objectId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('collageId', collageId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollageModel &&
            (identical(other.className, className) ||
                other.className == className) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.collageId, collageId) ||
                other.collageId == collageId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, className, objectId, createdAt, updatedAt, name, collageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollageModelCopyWith<_$_CollageModel> get copyWith =>
      __$$_CollageModelCopyWithImpl<_$_CollageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollageModelToJson(
      this,
    );
  }
}

abstract class _CollageModel extends CollageModel {
  const factory _CollageModel(
          {required final String className,
          required final String objectId,
          required final DateTime createdAt,
          required final DateTime updatedAt,
          required final String name,
          @JsonKey(name: 'collage_id') required final String collageId}) =
      _$_CollageModel;
  const _CollageModel._() : super._();

  factory _CollageModel.fromJson(Map<String, dynamic> json) =
      _$_CollageModel.fromJson;

  @override
  String get className;
  @override
  String get objectId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get name;
  @override
  @JsonKey(name: 'collage_id')
  String get collageId;
  @override
  @JsonKey(ignore: true)
  _$$_CollageModelCopyWith<_$_CollageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
