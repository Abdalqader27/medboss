import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:design/design.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medboss/core/services/auth_service.dart';
import 'package:medboss/router/router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'core/database/database.dart';
import 'core/injections/service_locator.dart';
import 'core/services/app_services.dart';
import 'features/collage/presentation/pages/select_collage/select_collage_provider.dart';
import 'features/file/presentation/pages/provider/boot_files_provider.dart';
import 'generated/l10n.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.initialThemeMode,
  }) : super(key: key);

  final AdaptiveThemeMode? initialThemeMode;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScopeAuth(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AppService>(
            create: (_) => sl<AppService>(),
          ),
          Provider<AuthService>(
            create: (_) => sl<AuthService>(),
          ),
          Provider<AppRouter>(
            create: (context) => sl<AppRouter>(),
          ),
          ChangeNotifierProvider(
            create: (context) => SelectCollageProvider(sl())..fetchCollages(),
          ),

        ],
        child: Builder(builder: (context) {
          final appRouter = context.read<AppRouter>();
          final goRouter = appRouter.goRouter;
          return KeyboardDismissOnTap(
            child: AdaptiveTheme(
              initial: widget.initialThemeMode ?? AdaptiveThemeMode.light,
              light: lightTheme,
              dark: darkTheme,
              builder: (theme, darkTheme) => MaterialApp.router(
                locale: const Locale('ar'),
                routeInformationProvider: goRouter.routeInformationProvider,
                routeInformationParser: goRouter.routeInformationParser,
                routerDelegate: goRouter.routerDelegate,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                theme: theme,
                darkTheme: darkTheme,
                builder: (context, child) {
                  child = EasyLoading.init()(context, child!);
                  child = ResponsiveWrapper.builder(
                    ClampingScrollWrapper.builder(context, child),
                    mediaQueryData: MediaQuery.of(context),
                    maxWidth: 1200,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    minWidth: 480,
                    defaultScale: true,
                    breakpoints: [
                      const ResponsiveBreakpoint.resize(450, name: MOBILE),
                      const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                      const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                      const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                      const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                    ],
                  );
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: child,
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ScopeAuth extends StatefulWidget {
  const ScopeAuth({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<ScopeAuth> createState() => _ScopeAuthState();
}

class _ScopeAuthState extends State<ScopeAuth> {
  late AppService _appService;
  late AuthService _authService;
  late StreamSubscription<bool> _authSubscription;

  @override
  void initState() {
    _appService = sl<AppService>();
    _authService = sl<AuthService>();
    _authSubscription = _authService.onAuthStateChange.listen(_onAuthStateChange);
    super.initState();
  }

  void _onAuthStateChange(bool login) {
    _appService.loginState = login;
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
