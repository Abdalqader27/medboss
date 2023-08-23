import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser({
    required String objectId,
    required String phoneNumber,
    required String password,
    required String fullName,
    required String email,
    required String city,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);


}
