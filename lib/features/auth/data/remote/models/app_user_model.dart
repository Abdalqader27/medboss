import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/app_user.dart';

part 'app_user_model.freezed.dart';

part 'app_user_model.g.dart';

@freezed
class AppUserModel with _$AppUserModel {
  const AppUserModel._();

  const factory AppUserModel({
    required String className,
    required String objectId,
    required DateTime createdAt,
    required String phoneNumber,
    required String password,
    required String fullName,
    required String email,
    required String city,
  }) = _AppUserModel;

  factory AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$AppUserModelFromJson(json);

  AppUser toAppUser() {
    return AppUser(
      objectId: objectId,
      phoneNumber: phoneNumber,
      password: password,
      fullName: fullName,
      email: email,
      city: city,
    );
  }
}
