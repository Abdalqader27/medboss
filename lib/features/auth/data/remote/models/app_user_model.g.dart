// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUserModel _$$_AppUserModelFromJson(Map<String, dynamic> json) =>
    _$_AppUserModel(
      className: json['className'] as String,
      objectId: json['objectId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$_AppUserModelToJson(_$_AppUserModel instance) =>
    <String, dynamic>{
      'className': instance.className,
      'objectId': instance.objectId,
      'createdAt': instance.createdAt.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'fullName': instance.fullName,
      'email': instance.email,
      'city': instance.city,
    };
