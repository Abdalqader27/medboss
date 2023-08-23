// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) {
  return _AppUserModel.fromJson(json);
}

/// @nodoc
mixin _$AppUserModel {
  String get className => throw _privateConstructorUsedError;
  String get objectId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserModelCopyWith<AppUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserModelCopyWith<$Res> {
  factory $AppUserModelCopyWith(
          AppUserModel value, $Res Function(AppUserModel) then) =
      _$AppUserModelCopyWithImpl<$Res, AppUserModel>;
  @useResult
  $Res call(
      {String className,
      String objectId,
      DateTime createdAt,
      String phoneNumber,
      String password,
      String fullName,
      String email,
      String city});
}

/// @nodoc
class _$AppUserModelCopyWithImpl<$Res, $Val extends AppUserModel>
    implements $AppUserModelCopyWith<$Res> {
  _$AppUserModelCopyWithImpl(this._value, this._then);

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
    Object? phoneNumber = null,
    Object? password = null,
    Object? fullName = null,
    Object? email = null,
    Object? city = null,
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
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserModelCopyWith<$Res>
    implements $AppUserModelCopyWith<$Res> {
  factory _$$_AppUserModelCopyWith(
          _$_AppUserModel value, $Res Function(_$_AppUserModel) then) =
      __$$_AppUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String className,
      String objectId,
      DateTime createdAt,
      String phoneNumber,
      String password,
      String fullName,
      String email,
      String city});
}

/// @nodoc
class __$$_AppUserModelCopyWithImpl<$Res>
    extends _$AppUserModelCopyWithImpl<$Res, _$_AppUserModel>
    implements _$$_AppUserModelCopyWith<$Res> {
  __$$_AppUserModelCopyWithImpl(
      _$_AppUserModel _value, $Res Function(_$_AppUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? className = null,
    Object? objectId = null,
    Object? createdAt = null,
    Object? phoneNumber = null,
    Object? password = null,
    Object? fullName = null,
    Object? email = null,
    Object? city = null,
  }) {
    return _then(_$_AppUserModel(
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
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUserModel extends _AppUserModel {
  const _$_AppUserModel(
      {required this.className,
      required this.objectId,
      required this.createdAt,
      required this.phoneNumber,
      required this.password,
      required this.fullName,
      required this.email,
      required this.city})
      : super._();

  factory _$_AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserModelFromJson(json);

  @override
  final String className;
  @override
  final String objectId;
  @override
  final DateTime createdAt;
  @override
  final String phoneNumber;
  @override
  final String password;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String city;

  @override
  String toString() {
    return 'AppUserModel(className: $className, objectId: $objectId, createdAt: $createdAt, phoneNumber: $phoneNumber, password: $password, fullName: $fullName, email: $email, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUserModel &&
            (identical(other.className, className) ||
                other.className == className) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, className, objectId, createdAt,
      phoneNumber, password, fullName, email, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserModelCopyWith<_$_AppUserModel> get copyWith =>
      __$$_AppUserModelCopyWithImpl<_$_AppUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserModelToJson(
      this,
    );
  }
}

abstract class _AppUserModel extends AppUserModel {
  const factory _AppUserModel(
      {required final String className,
      required final String objectId,
      required final DateTime createdAt,
      required final String phoneNumber,
      required final String password,
      required final String fullName,
      required final String email,
      required final String city}) = _$_AppUserModel;
  const _AppUserModel._() : super._();

  factory _AppUserModel.fromJson(Map<String, dynamic> json) =
      _$_AppUserModel.fromJson;

  @override
  String get className;
  @override
  String get objectId;
  @override
  DateTime get createdAt;
  @override
  String get phoneNumber;
  @override
  String get password;
  @override
  String get fullName;
  @override
  String get email;
  @override
  String get city;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserModelCopyWith<_$_AppUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
