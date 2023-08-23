// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      objectId: json['objectId'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'fullName': instance.fullName,
      'email': instance.email,
      'city': instance.city,
    };
