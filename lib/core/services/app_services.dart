import 'dart:async';

import 'package:design/design.dart';
import 'package:medboss/core/storage/storage_service.dart';

// ignore: non_constant_identifier_names
String LOGIN_KEY = "--LOGIN--";

class AppService with ChangeNotifier {
  late final IStorageService storageService;
  bool _loginState = false;
  bool _initialized = false;

  AppService(this.storageService);

  bool get loginState => _loginState;

  bool get initialized => _initialized;


  set loginState(bool state) {
    storageService.setBool(LOGIN_KEY, state);
    _loginState = state;
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }


  Future<void> onAppStart() async {
    _loginState = storageService.getBool(LOGIN_KEY) ?? false;
    await Future.delayed(const Duration(seconds: 3));

    _initialized = true;
    notifyListeners();
  }
}
