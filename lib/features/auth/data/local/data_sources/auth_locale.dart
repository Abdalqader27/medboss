import 'dart:convert';

import 'package:core/core.dart';
import 'package:medboss/core/storage/storage_service.dart';
import 'package:medboss/features/auth/data/remote/models/app_user_model.dart';

const String user_key = '--user--';

class AuthLocale {
  AuthLocale(this._storageService);

  final IStorageService _storageService;

  Future<void> saveUser(AppUserModel model) async {
    String user = jsonEncode(model.toJson());
    await _storageService.setString(user_key, user);
  }

  Future<AppUserModel> getUser() async {
    final user = jsonDecode(_storageService.getString(user_key)!);
    return AppUserModel.fromJson(user);
  }

  Future<void> logout() async {
    await _storageService.clearAll();
  }
}
