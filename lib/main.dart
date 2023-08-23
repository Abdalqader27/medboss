import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';

import 'app.dart';
import 'common/config.dart';
import 'core/bootstrap/bootstrap.dart';

void main() async {
  await bootstrap(
    () async {
      await setUpApp();
      final savedThemeMode = await AdaptiveTheme.getThemeMode();
      return App(
        initialThemeMode: savedThemeMode,
      );
    },
  );
}
