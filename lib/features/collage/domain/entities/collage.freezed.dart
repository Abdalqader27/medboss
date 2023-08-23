// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Collage _$CollageFromJson(Map<String, dynamic> json) {
  return _Collage.fromJson(json);
}

/// @nodoc
mixin _$Collage {
  String get objectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'collage_id')
  String get collageId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollageCopyWith<Collage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollageCopyWith<$Res> {
  factory $CollageCopyWith(Collage value, $Res Function(Collage) then) =
      _$CollageCopyWithImpl<$Res, Collage>;
  @useResult
  $Res call(
      {String objectId,
      String name,
      @JsonKey(name: 'collage_id') String collageId});
}

/// @nodoc
class _$CollageCopyWithImpl<$Res, $Val extends Collage>
    implements $CollageCopyWith<$Res> {
  _$CollageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? name = null,
    Object? collageId = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_CollageCopyWith<$Res> implements $CollageCopyWith<$Res> {
  factory _$$_CollageCopyWith(
          _$_Collage value, $Res Function(_$_Collage) then) =
      __$$_CollageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String objectId,
      String name,
      @JsonKey(name: 'collage_id') String collageId});
}

/// @nodoc
class __$$_CollageCopyWithImpl<$Res>
    extends _$CollageCopyWithImpl<$Res, _$_Collage>
    implements _$$_CollageCopyWith<$Res> {
  __$$_CollageCopyWithImpl(_$_Collage _value, $Res Function(_$_Collage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? name = null,
    Object? collageId = null,
  }) {
    return _then(_$_Collage(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_Collage extends _Collage with DiagnosticableTreeMixin {
  const _$_Collage(
      {required this.objectId,
      required this.name,
      @JsonKey(name: 'collage_id') required this.collageId})
      : super._();

  factory _$_Collage.fromJson(Map<String, dynamic> json) =>
      _$$_CollageFromJson(json);

  @override
  final String objectId;
  @override
  final String name;
  @override
  @JsonKey(name: 'collage_id')
  final String collageId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Collage(objectId: $objectId, name: $name, collageId: $collageId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Collage'))
      ..add(DiagnosticsProperty('objectId', objectId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('collageId', collageId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Collage &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.collageId, collageId) ||
                other.collageId == collageId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, objectId, name, collageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollageCopyWith<_$_Collage> get copyWith =>
      __$$_CollageCopyWithImpl<_$_Collage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollageToJson(
      this,
    );
  }
}

abstract class _Collage extends Collage {
  const factory _Collage(
          {required final String objectId,
          required final String name,
          @JsonKey(name: 'collage_id') required final String collageId}) =
      _$_Collage;
  const _Collage._() : super._();

  factory _Collage.fromJson(Map<String, dynamic> json) = _$_Collage.fromJson;

  @override
  String get objectId;
  @override
  String get name;
  @override
  @JsonKey(name: 'collage_id')
  String get collageId;
  @override
  @JsonKey(ignore: true)
  _$$_CollageCopyWith<_$_Collage> get copyWith =>
      throw _privateConstructorUsedError;
}
