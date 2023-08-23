import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:design/design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:medboss/common/widgets/app_loading.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../core/injections/service_locator.dart';
import '../resources/resources.dart';
import 'const/const/api_key.dart';

Future<void> setUpApp() async {
  await inject();
  await _initBack4Apps();
  _configLoading();
}

Future<void> _initBack4Apps() async {
  await Parse().initialize(
    appID,
    serverUrl,
    clientKey: clientKey,
  );
}

void _configLoading() {
  EasyLoading.instance
    ..indicatorWidget = ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      child: Lottie.asset(
        width: 200,
        height: 200,
        JsonRes.smileLoadingBlack,
      ),
    )
    ..indicatorSize = 45.0
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..userInteractions = false
    ..dismissOnTap = false;
}
