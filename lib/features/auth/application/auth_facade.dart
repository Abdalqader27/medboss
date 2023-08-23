import 'package:core/core.dart';
import 'package:medboss/core/database/database.dart';
import 'package:medboss/features/auth/domain/entities/app_user.dart';
import 'package:medboss/features/auth/domain/repositories/i_auth_repository.dart';

import '../../../core/injections/service_locator.dart';
import '../../user/data/local/data_sources/user_remote.dart';
import '../data/remote/models/app_user_model.dart';

class AuthFacade {
  AuthFacade(this._authRepository);

  final IAuthRepository _authRepository;

  Future<ApiResult<AppUser>> signUp(Params params) async {
    return toApiResult(
      () async => (await _authRepository.signUp(params)).toAppUser(),
    );
  }

  Future<ApiResult<AppUser>> login(Params params) async {
    return toApiResult(
      () async {
        final user = await _authRepository.login(params);
         _fetchUserCode(user);
        return user.toAppUser();
      },
    );
  }

  Future<ApiResult<void>> logout() async {
    return toApiResult(
      () => _authRepository.logout(),
      onSuccess: (user) {},
    );
  }

  Future<void> _fetchUserCode(AppUserModel user) async {
    final response = await UserRemote().getUserCodes(
      ParamsWrapper(
        {'userId': user.objectId},
      ),
    );
    if ((response.success) &&
        (response.result != null) &&
        (response.results?.isNotEmpty ?? false)) {
      await sl<AppDatabase>().purchasesDao.addPurchases(
            response.results!
                .map((e) => PurchaseData(
                      objectId: e['objectId'],
                      fileObjectId: e['purchaseId'],
                    ))
                .toList(),
          );
    }
  }
}
