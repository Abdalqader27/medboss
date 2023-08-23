import 'package:core/core.dart';
import 'package:medboss/features/auth/data/remote/models/app_user_model.dart';

abstract class IAuthRepository {
  Future<AppUserModel> login(Params params);
  Future<AppUserModel> signUp(Params params);

  Future<void> logout();
}
