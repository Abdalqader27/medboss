import 'package:core/core.dart';
import 'package:medboss/core/services/auth_service.dart';
import 'package:medboss/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../core/injections/service_locator.dart';
import '../../../collage/presentation/pages/select_collage/select_collage_stream.dart';
import '../local/data_sources/auth_locale.dart';
import '../remote/data_sources/auth_remote.dart';
import '../remote/models/app_user_model.dart';

class AuthRepository extends IAuthRepository {
  AuthRepository(this._authRemote, this._authLocale, this._authService);

  final AuthRemote _authRemote;
  final AuthLocale _authLocale;
  final AuthService _authService;

  @override
  Future<AppUserModel> login(Params params) {
    return throwAppException(
      () async {
        final response = await _authRemote.login(params);
        if ((response.success) &&
            (response.result != null) &&
            (response.results?.isNotEmpty ?? false)) {
          final result = response.results!.first as ParseObject;
          final appUser = AppUserModel.fromJson(result.toJson());

          await _authLocale.saveUser(appUser);
          _authService.toAuthorized();

          return appUser;
        }
        throw AppException(
          message: response.error?.message ?? '',
          exception: Exception(response.error?.code.toString()),
        );
      },
    );
  }

  @override
  Future<AppUserModel> signUp(Params params) {
    return throwAppException(
      () async {
        final isExisted = await _authRemote.checkIfUserHasExisted(params);

        if (isExisted) {
          throw AppException(
            message: 'User has existed',
            exception: Exception('User has existed'),
          );
        }
        final response = await _authRemote.signUp(params);

        if (response.success && response.result != null) {
          final result = response.result as ParseObject;
          final appUser = AppUserModel.fromJson(result.toJson());

          await _authLocale.saveUser(appUser);
          _authService.toAuthorized();
          return appUser;
        }
        throw AppException(
          message: response.error?.message ?? '',
          exception: response.error?.exception,
        );
      },
    );
  }

  @override
  Future<void> logout() {
    return throwAppException(
      () async {
        await _authLocale.logout();
        _authService.toUnAuthorized();
        sl<SelectCollageStream>().resetCollageStream();
      },
    );
  }
}
