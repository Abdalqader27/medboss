import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:medboss/core/database/database.dart';
import 'package:medboss/core/services/auth_service.dart';
import 'package:medboss/core/storage/storage_service.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/const/const.dart';
import '../../../common/const/const/api_key.dart';
import '../../../router/router.dart';
import '../../services/app_services.dart';
import '../../storage/storage_service_impl.dart';
import '../service_locator.dart';

Future<void> commonDependencies() async {
  sl.registerSingleton<IStorageService>(
    StorageService(
      await SharedPreferences.getInstance(),
    ),
  );

  sl.registerLazySingleton(
    () => AppService(sl()),
  );
  sl.registerLazySingleton(
    () => AuthService(),
  );
  sl.registerLazySingleton(
    () => AppRouter(sl()),
  );

  sl.registerLazySingleton(
    () => AppDatabase(),
  );

  await _regDioClient();
}

Future<void> _regDioClient() async {
  /// Register the dio client.
  final DioClient dioClient = DioClient(APIRoutes.baseUrl);

  /// Added the log interceptor.
  final logInterceptor = LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    request: true,
    requestBody: true,
  );


  // Add the interceptor to the dio[es] client.
  dioClient.interceptors.addAll([
    if (!kReleaseMode && !kTestMode) logInterceptor,
  ]);

  sl.registerSingleton<Dio>(dioClient);
}

/// [LogInterceptor] is used to print logs during network requests.
/// It's better to add [LogInterceptor] to the tail of the interceptor queue,
/// otherwise the changes made in the interceptor behind A will not be printed out.
/// This is because the execution of interceptors is in the order of addition.
class LogInterceptor extends Interceptor {
  LogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
    this.logPrint = print,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  /// Log printer; defaults print log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file, for example:
  ///```dart
  ///  var file=File("./log.txt");
  ///  var sink=file.openWrite();
  ///  dio.interceptors.add(LogInterceptor(logPrint: sink.writeln));
  ///  ...
  ///  await sink.close();
  ///```
  void Function(Object object) logPrint;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint('*** Request ***');
    _printKV('uri', Uri.decodeFull(options.uri.toString()));
    //options.headers;

    if (request) {
      _printKV('method', options.method);
      _printKV('responseType', options.responseType.toString());
      _printKV('followRedirects', options.followRedirects);
      _printKV('connectTimeout', options.connectTimeout);
      _printKV('sendTimeout', options.sendTimeout);
      _printKV('receiveTimeout', options.receiveTimeout);
      _printKV(
          'receiveDataWhenStatusError', options.receiveDataWhenStatusError);
    }
    if (requestHeader) {
      logPrint('headers:');
      options.headers.forEach((key, v) => _printKV(' $key', v));
    }
    if (requestBody) {
      logPrint('data:');
      if (options.data is FormData) {
        for (var element in (options.data as FormData).fields) {
          _printKV(' ${element.key}', element.value);
        }
      } else {
        _printAll(const JsonEncoder.withIndent('  ').convert(options.data));
      }
    }
    logPrint('');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint('*** Response ***');
    _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (error) {
      logPrint('*** DioError ***:');
      logPrint('uri: ${Uri.decodeFull(err.requestOptions.uri.toString())}');
      logPrint('$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
      logPrint('');
    }

    handler.next(err);
  }

  void _printResponse(Response response) {
    _printKV('uri', Uri.decodeFull(response.realUri.toString()));
    if (responseHeader) {
      _printKV('statusCode', response.statusCode);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }

      logPrint('headers:');
      response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));
    }
    if (responseBody) {
      logPrint('Response Text:');
      _printAll(response.toString());
    }
    logPrint('');
  }

  void _printKV(String key, Object? v) {
    logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}
