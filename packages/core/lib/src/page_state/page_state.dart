import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions/exceptions.dart';

part 'page_state.freezed.dart';

@freezed
class PageState<T> with _$PageState<T> {
  const factory PageState.init() = _init<T>;

  const factory PageState.loading() = _Lodaing<T>;

  const factory PageState.success({required T data}) = _Success<T>;

  const factory PageState.empty() = _Empty<T>;

  const factory PageState.failure({required AppException exception}) = _Failure<T>;
}

extension PageStateEx<T> on PageState<T> {
  bool get isLoading => this is _Lodaing;

  bool get isSuccess => this is _Success;

  bool get isEmpty => this is _Empty;

  bool get isFailure => this is _Failure;

  bool get isInit => this is _init;

  bool get isNotFailure => !isFailure;

  _Lodaing<T> get loading => this as _Lodaing<T>;

  _Success<T> get loaded => this as _Success<T>;

  T get data => (this as _Success<T>).data;

  T? get dataOrNull => (this is _Success<T>) ? data : null;

  String get error => (this as _Failure<T>).error;

  AppException get exception => (this as _Failure<T>).exception;

  AppException? get exceptionOrNull => (this is _Failure<T>) ? exception : null;
}
