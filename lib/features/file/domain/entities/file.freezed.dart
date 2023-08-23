// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

File _$FileFromJson(Map<String, dynamic> json) {
  return _File.fromJson(json);
}

/// @nodoc
mixin _$File {
  String get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MyFile')
  UrlFile get urlFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'FolderId')
  String get folderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UniversityId')
  String get universityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActivated')
  bool get isActivated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileCopyWith<File> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileCopyWith<$Res> {
  factory $FileCopyWith(File value, $Res Function(File) then) =
      _$FileCopyWithImpl<$Res, File>;
  @useResult
  $Res call(
      {String objectId,
      @JsonKey(name: 'MyFile') UrlFile urlFile,
      @JsonKey(name: 'FolderId') String folderId,
      @JsonKey(name: 'UniversityId') String universityId,
      @JsonKey(name: 'FileName') String fileName,
      @JsonKey(name: 'IsActivated') bool isActivated});

  $UrlFileCopyWith<$Res> get urlFile;
}

/// @nodoc
class _$FileCopyWithImpl<$Res, $Val extends File>
    implements $FileCopyWith<$Res> {
  _$FileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? urlFile = null,
    Object? folderId = null,
    Object? universityId = null,
    Object? fileName = null,
    Object? isActivated = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      urlFile: null == urlFile
          ? _value.urlFile
          : urlFile // ignore: cast_nullable_to_non_nullable
              as UrlFile,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      universityId: null == universityId
          ? _value.universityId
          : universityId // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      isActivated: null == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UrlFileCopyWith<$Res> get urlFile {
    return $UrlFileCopyWith<$Res>(_value.urlFile, (value) {
      return _then(_value.copyWith(urlFile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FileCopyWith<$Res> implements $FileCopyWith<$Res> {
  factory _$$_FileCopyWith(_$_File value, $Res Function(_$_File) then) =
      __$$_FileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String objectId,
      @JsonKey(name: 'MyFile') UrlFile urlFile,
      @JsonKey(name: 'FolderId') String folderId,
      @JsonKey(name: 'UniversityId') String universityId,
      @JsonKey(name: 'FileName') String fileName,
      @JsonKey(name: 'IsActivated') bool isActivated});

  @override
  $UrlFileCopyWith<$Res> get urlFile;
}

/// @nodoc
class __$$_FileCopyWithImpl<$Res> extends _$FileCopyWithImpl<$Res, _$_File>
    implements _$$_FileCopyWith<$Res> {
  __$$_FileCopyWithImpl(_$_File _value, $Res Function(_$_File) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? urlFile = null,
    Object? folderId = null,
    Object? universityId = null,
    Object? fileName = null,
    Object? isActivated = null,
  }) {
    return _then(_$_File(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      urlFile: null == urlFile
          ? _value.urlFile
          : urlFile // ignore: cast_nullable_to_non_nullable
              as UrlFile,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      universityId: null == universityId
          ? _value.universityId
          : universityId // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      isActivated: null == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_File extends _File with DiagnosticableTreeMixin {
  const _$_File(
      {required this.objectId,
      @JsonKey(name: 'MyFile') required this.urlFile,
      @JsonKey(name: 'FolderId') required this.folderId,
      @JsonKey(name: 'UniversityId') required this.universityId,
      @JsonKey(name: 'FileName') required this.fileName,
      @JsonKey(name: 'IsActivated') required this.isActivated})
      : super._();

  factory _$_File.fromJson(Map<String, dynamic> json) => _$$_FileFromJson(json);

  @override
  final String objectId;
  @override
  @JsonKey(name: 'MyFile')
  final UrlFile urlFile;
  @override
  @JsonKey(name: 'FolderId')
  final String folderId;
  @override
  @JsonKey(name: 'UniversityId')
  final String universityId;
  @override
  @JsonKey(name: 'FileName')
  final String fileName;
  @override
  @JsonKey(name: 'IsActivated')
  final bool isActivated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'File(objectId: $objectId, urlFile: $urlFile, folderId: $folderId, universityId: $universityId, fileName: $fileName, isActivated: $isActivated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'File'))
      ..add(DiagnosticsProperty('objectId', objectId))
      ..add(DiagnosticsProperty('urlFile', urlFile))
      ..add(DiagnosticsProperty('folderId', folderId))
      ..add(DiagnosticsProperty('universityId', universityId))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('isActivated', isActivated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_File &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.urlFile, urlFile) || other.urlFile == urlFile) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.universityId, universityId) ||
                other.universityId == universityId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.isActivated, isActivated) ||
                other.isActivated == isActivated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, objectId, urlFile, folderId,
      universityId, fileName, isActivated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileCopyWith<_$_File> get copyWith =>
      __$$_FileCopyWithImpl<_$_File>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileToJson(
      this,
    );
  }
}

abstract class _File extends File {
  const factory _File(
      {required final String objectId,
      @JsonKey(name: 'MyFile') required final UrlFile urlFile,
      @JsonKey(name: 'FolderId') required final String folderId,
      @JsonKey(name: 'UniversityId') required final String universityId,
      @JsonKey(name: 'FileName') required final String fileName,
      @JsonKey(name: 'IsActivated') required final bool isActivated}) = _$_File;
  const _File._() : super._();

  factory _File.fromJson(Map<String, dynamic> json) = _$_File.fromJson;

  @override
  String get objectId;
  @override
  @JsonKey(name: 'MyFile')
  UrlFile get urlFile;
  @override
  @JsonKey(name: 'FolderId')
  String get folderId;
  @override
  @JsonKey(name: 'UniversityId')
  String get universityId;
  @override
  @JsonKey(name: 'FileName')
  String get fileName;
  @override
  @JsonKey(name: 'IsActivated')
  bool get isActivated;
  @override
  @JsonKey(ignore: true)
  _$$_FileCopyWith<_$_File> get copyWith => throw _privateConstructorUsedError;
}

UrlFile _$UrlFileFromJson(Map<String, dynamic> json) {
  return _UrlFile.fromJson(json);
}

/// @nodoc
mixin _$UrlFile {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UrlFileCopyWith<UrlFile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlFileCopyWith<$Res> {
  factory $UrlFileCopyWith(UrlFile value, $Res Function(UrlFile) then) =
      _$UrlFileCopyWithImpl<$Res, UrlFile>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$UrlFileCopyWithImpl<$Res, $Val extends UrlFile>
    implements $UrlFileCopyWith<$Res> {
  _$UrlFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UrlFileCopyWith<$Res> implements $UrlFileCopyWith<$Res> {
  factory _$$_UrlFileCopyWith(
          _$_UrlFile value, $Res Function(_$_UrlFile) then) =
      __$$_UrlFileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_UrlFileCopyWithImpl<$Res>
    extends _$UrlFileCopyWithImpl<$Res, _$_UrlFile>
    implements _$$_UrlFileCopyWith<$Res> {
  __$$_UrlFileCopyWithImpl(_$_UrlFile _value, $Res Function(_$_UrlFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_UrlFile(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UrlFile extends _UrlFile with DiagnosticableTreeMixin {
  const _$_UrlFile({required this.name, required this.url}) : super._();

  factory _$_UrlFile.fromJson(Map<String, dynamic> json) =>
      _$$_UrlFileFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UrlFile(name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UrlFile'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UrlFile &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UrlFileCopyWith<_$_UrlFile> get copyWith =>
      __$$_UrlFileCopyWithImpl<_$_UrlFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UrlFileToJson(
      this,
    );
  }
}

abstract class _UrlFile extends UrlFile {
  const factory _UrlFile(
      {required final String name, required final String url}) = _$_UrlFile;
  const _UrlFile._() : super._();

  factory _UrlFile.fromJson(Map<String, dynamic> json) = _$_UrlFile.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_UrlFileCopyWith<_$_UrlFile> get copyWith =>
      throw _privateConstructorUsedError;
}
