// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Folder _$FolderFromJson(Map<String, dynamic> json) {
  return _Folder.fromJson(json);
}

/// @nodoc
mixin _$Folder {
  String get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UniversityId')
  String get universityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentId')
  String get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'HasFiles')
  bool get hasFiles => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderCopyWith<Folder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderCopyWith<$Res> {
  factory $FolderCopyWith(Folder value, $Res Function(Folder) then) =
      _$FolderCopyWithImpl<$Res, Folder>;
  @useResult
  $Res call(
      {String objectId,
      @JsonKey(name: 'UniversityId') String universityId,
      @JsonKey(name: 'ParentId') String parentId,
      @JsonKey(name: 'HasFiles') bool hasFiles,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'ID') String id});
}

/// @nodoc
class _$FolderCopyWithImpl<$Res, $Val extends Folder>
    implements $FolderCopyWith<$Res> {
  _$FolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? universityId = null,
    Object? parentId = null,
    Object? hasFiles = null,
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      universityId: null == universityId
          ? _value.universityId
          : universityId // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      hasFiles: null == hasFiles
          ? _value.hasFiles
          : hasFiles // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FolderCopyWith<$Res> implements $FolderCopyWith<$Res> {
  factory _$$_FolderCopyWith(_$_Folder value, $Res Function(_$_Folder) then) =
      __$$_FolderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String objectId,
      @JsonKey(name: 'UniversityId') String universityId,
      @JsonKey(name: 'ParentId') String parentId,
      @JsonKey(name: 'HasFiles') bool hasFiles,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'ID') String id});
}

/// @nodoc
class __$$_FolderCopyWithImpl<$Res>
    extends _$FolderCopyWithImpl<$Res, _$_Folder>
    implements _$$_FolderCopyWith<$Res> {
  __$$_FolderCopyWithImpl(_$_Folder _value, $Res Function(_$_Folder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? universityId = null,
    Object? parentId = null,
    Object? hasFiles = null,
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$_Folder(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      universityId: null == universityId
          ? _value.universityId
          : universityId // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      hasFiles: null == hasFiles
          ? _value.hasFiles
          : hasFiles // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Folder extends _Folder with DiagnosticableTreeMixin {
  const _$_Folder(
      {required this.objectId,
      @JsonKey(name: 'UniversityId') required this.universityId,
      @JsonKey(name: 'ParentId') required this.parentId,
      @JsonKey(name: 'HasFiles') required this.hasFiles,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'ID') required this.id})
      : super._();

  factory _$_Folder.fromJson(Map<String, dynamic> json) =>
      _$$_FolderFromJson(json);

  @override
  final String objectId;
  @override
  @JsonKey(name: 'UniversityId')
  final String universityId;
  @override
  @JsonKey(name: 'ParentId')
  final String parentId;
  @override
  @JsonKey(name: 'HasFiles')
  final bool hasFiles;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'ID')
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Folder(objectId: $objectId, universityId: $universityId, parentId: $parentId, hasFiles: $hasFiles, name: $name, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Folder'))
      ..add(DiagnosticsProperty('objectId', objectId))
      ..add(DiagnosticsProperty('universityId', universityId))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('hasFiles', hasFiles))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Folder &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.universityId, universityId) ||
                other.universityId == universityId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.hasFiles, hasFiles) ||
                other.hasFiles == hasFiles) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, objectId, universityId, parentId, hasFiles, name, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FolderCopyWith<_$_Folder> get copyWith =>
      __$$_FolderCopyWithImpl<_$_Folder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FolderToJson(
      this,
    );
  }
}

abstract class _Folder extends Folder {
  const factory _Folder(
      {required final String objectId,
      @JsonKey(name: 'UniversityId') required final String universityId,
      @JsonKey(name: 'ParentId') required final String parentId,
      @JsonKey(name: 'HasFiles') required final bool hasFiles,
      @JsonKey(name: 'Name') required final String name,
      @JsonKey(name: 'ID') required final String id}) = _$_Folder;
  const _Folder._() : super._();

  factory _Folder.fromJson(Map<String, dynamic> json) = _$_Folder.fromJson;

  @override
  String get objectId;
  @override
  @JsonKey(name: 'UniversityId')
  String get universityId;
  @override
  @JsonKey(name: 'ParentId')
  String get parentId;
  @override
  @JsonKey(name: 'HasFiles')
  bool get hasFiles;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'ID')
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_FolderCopyWith<_$_Folder> get copyWith =>
      throw _privateConstructorUsedError;
}
