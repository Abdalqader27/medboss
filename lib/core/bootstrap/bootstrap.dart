import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate(${bloc.runtimeType})');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose(${bloc.runtimeType})');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent(${event.runtimeType}, $event)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      MobileAds.instance.initialize();
      if (kDebugMode) {
        MobileAds.instance.updateRequestConfiguration(
          RequestConfiguration(
            testDeviceIds: [
              'TE1A.220922.021',
              '1D2642081AF955C014AD3CCEA75B4FB3',
            ],
          ),
        );
      }
      runApp(await builder());
    },
    (error, stackTrace) async {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
