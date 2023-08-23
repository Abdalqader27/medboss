import 'package:design/design.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/services/app_services.dart';
import '../../resources/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'splash-screen';
  static const name = 'splash_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AppService _appService;

  @override
  void initState() {
    _appService = context.read<AppService>();
    onStartUp();
    super.initState();
  }

  void onStartUp() async {
    await _appService.onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: -60,
            child: Opacity(
              opacity: .5,
              child: SvgPicture.asset(
                SvgRes.stethoscope,
                width: 150,
                color: theme.colorScheme.primary,

              ),
            ),
          ),      Positioned(
            bottom: 0,
            left: -90,
            child: Opacity(
              opacity: .5,
              child: SvgPicture.asset(
                SvgRes.stethoscope,
                width: 150,
                color: theme.colorScheme.primary,

              ),
            ),
          ),
          Center(
            child: Builder(builder: (context) {
              if (theme.brightness == Brightness.dark) {
                return SvgPicture.asset(
                  LogoRes.darkLogo,
                  height: 200,
                  width: 200,
                );
              }
              return SvgPicture.asset(
                LogoRes.lightLogo,
                height: 200,
                width: 200,
              );
            }),
          ),
        ],
      ),
    );
  }
}
