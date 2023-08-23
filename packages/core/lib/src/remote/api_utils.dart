import 'dart:async';
import 'dart:developer';

import '../exceptions/exceptions.dart';
import 'result/api_result.dart';

Future<T> throwAppException<T>(FutureOr<T> Function() call) async {
  try {
    return call();
  } on AppException catch (_) {
    rethrow;
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown(exception: e);
  }
}

Future<ApiResult<T>> toApiResult<T>(
  FutureOr<T> Function() call, {
  FutureOr<void> Function(T data)? onSuccess,
  FutureOr<void> Function(AppException e)? onFailure,
}) async {
  late ApiResult<T> result;
  try {
    result = ApiResult.success(data: await call());
  } on AppException catch (e) {
    result = ApiResult.failure(
      exception: e,
    );
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    final exception = AppException.unknown(exception: e);
    result = ApiResult.failure(
      exception: exception,
    );
  }

  try {
    await result.when(
      success: (data) async => await onSuccess?.call(data),
      failure: (exception) async => await onFailure?.call(exception),
    );
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    final exception = AppException.unknown(exception: e);
    result = ApiResult.failure(
      exception: exception,
    );
  }

  return result;
}
