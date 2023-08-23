import 'package:design/design.dart';
import 'package:go_router/go_router.dart';
import 'package:medboss/common/widgets/splash_widget.dart';
import 'package:medboss/features/user/presentation/pages/about/about_screen.dart';
import 'package:medboss/features/user/presentation/pages/settings/settings_screen.dart';
import 'package:medboss/router/routes.dart';

import '../core/services/app_services.dart';
import '../features/auth/presentation/pages/sign_up/sign_up.dart';
import '../features/collage/presentation/pages/select_collage/select_collage_screen.dart';
import '../features/file/presentation/widgets/beta_pdf_view_screen.dart';
import '../features/file/presentation/widgets/pdf_view_screen.dart';

class AppRouter {
  AppRouter(this.appService);

  final AppService appService;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: _routes,
    debugLogDiagnostics: true,
    initialLocation: BotFolderPage.path,
    refreshListenable: appService,
    redirect: (_, state) => _rootRedirect(state),
  );

  BuildContext get context =>
      goRouter.routerDelegate.navigatorKey.currentState!.context;

  List<RouteBase> get _routes => [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SplashScreen.path,
          name: SplashScreen.name,
          pageBuilder: SplashScreen.pageBuilder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: LoginPage.path,
          name: LoginPage.name,
          pageBuilder: LoginPage.pageBuilder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SignUpScreen.path,
          name: SignUpScreen.name,
          pageBuilder: SignUpScreen.pageBuilder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SettingsScreen.path,
          name: SettingsScreen.name,
          pageBuilder: SettingsScreen.pageBuilder,
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: RootScreen.pageBuilder,
          routes: [
            // GoRoute(
            //   path: HomePage.path,
            //   parentNavigatorKey: _shellNavigatorKey,
            //   pageBuilder: HomePage.pageBuilder,
            // ),
            GoRoute(
              path: BotFolderPage.path,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: BotFolderPage.pageBuilder,
            ),
            GoRoute(
              path: AccountPage.path,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: AccountPage.pageBuilder,
            ),
            GoRoute(
              path: MorePage.path,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: MorePage.pageBuilder,
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: SelectCollageScreen.path,
          name: SelectCollageScreen.name,
          pageBuilder: SelectCollageScreen.pageBuilder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: PdfViewScreen.path,
          name: PdfViewScreen.name,
          pageBuilder: PdfViewScreen.pageBuilder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: BetaPdfViewScreen.path,
          name: BetaPdfViewScreen.name,
          pageBuilder: BetaPdfViewScreen.pageBuilder,
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AboutScreen.path,
          name: AboutScreen.name,
          pageBuilder: AboutScreen.pageBuilder,
        ),
      ];

  Future<String?> _rootRedirect(
    GoRouterState state,
  ) async {
    final isLoggedIn = appService.loginState;
    final isInitialized = appService.initialized;

    final isGoingToLogin = state.matchedLocation == LoginPage.path;
    final isGoingToInit = state.matchedLocation == SplashScreen.path;
    final isGoingToSignUp = state.matchedLocation == SignUpScreen.path;

    final isAuthenticated =
        (isLoggedIn && isGoingToLogin) || (isInitialized && isGoingToInit);

    return _redirectToPathIfNotIn(
      state: state,
      onRedirect: () async {
        if (!isInitialized && !isGoingToInit) {
          return SplashScreen.path;
        }
        if (isInitialized &&
            !isLoggedIn &&
            !isGoingToLogin &&
            !isGoingToSignUp) {
          return LoginPage.path;
        }
        if (isAuthenticated) {
          return BotFolderPage.path;
        }

        return null;
      },
    );
  }

  Future<String?> _redirectToPathIfNotIn({
    required GoRouterState state,
    required Future<String?> Function() onRedirect,
  }) async {
    final path = await onRedirect();
    if (path == null) {
      return null;
    }
    final inPath = state.location.contains(path);
    return !inPath ? path : null;
  }
}
