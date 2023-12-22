import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exceptions/exceptions.dart';
import '../../page_state/page_state.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({
    required AppException exception,
  }) = Failure<T>;
}

extension ApiResultX<T> on ApiResult<T> {
  bool get isSuccess => this is Success;

  bool get isFailure => this is Failure;

  Failure get failure => this as Failure;

  Failure? get maybeFailure => this is Failure ? this as Failure : null;

  T get data => (this as Success).data;

  AppException get exception => (this as Failure).exception;

  PageState<T> toPageState({
    T Function(T data)? successMapper,
    ValueChanged<AppException>? failureMapper,
  }) =>
      when(
        success: (data) {
          return PageState.success(
            data: successMapper != null ? successMapper(data) : data,
          );
        },
        failure: (e) {
          failureMapper?.call(e);
          return PageState<T>.failure(exception: e);
        },
      );

  Future<ApiResult<T>> on({
    Future Function(T)? success,
    Function(AppException<dynamic>)? failure,
  }) =>
      when(
        success: (data) async {
          await success?.call(data);
          BotToast.closeAllLoading();
          return ApiResult.success(data: data);
        },
        failure: (e) async {
          BotToast.closeAllLoading();
          failure?.call(e);
          return ApiResult<T>.failure(exception: e);
        },
      );
}

extension ApiResultEx on Iterable<ApiResult> {
  ApiResult<T>? mayBeOnFailure<T>() {
    for (final r in this) {
      var maybeFailure = r.maybeWhen(
          orElse: () => false,
          failure: (exception) {
            return true;
          });
      if (maybeFailure) {
        return ApiResult.failure(
          exception: r.exception,
        );
      }
    }
    return null;
  }
}
