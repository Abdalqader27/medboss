import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:iconly/iconly.dart';
import 'package:medboss/core/ads/widgets/interstitial.dart';
import 'package:medboss/features/auth/application/auth_facade.dart';

import '../../../../../core/ads/widgets/banner.dart';
import '../../../../../core/injections/service_locator.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../core/storage/storage_service.dart';
import '../../../../../core/storage/storage_service_impl.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'settings-screen';
  static const name = 'settings_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const SettingsScreen(),
    );
  }

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final adaptiveThemeMode = AdaptiveTheme.of(context).mode;
    final theme = Theme.of(context);
    return InterstitialAds(
      child: AppBanner(
        child: Scaffold(
          appBar: AppBar(
            title: Text('الاعدادات'),
          ),
          body: ListView(
            padding: EdgeInsetsConstrains.listView,
            children: [
              SettingsGroup(
                items: [
                  SettingsItem(
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.blueAccent.withOpacity(.7),
                    ),
                    title: 'المظهر ',
                    subtitle: _getTheme(context),
                    trailing: Switch.adaptive(
                      value: adaptiveThemeMode.isDark,
                      onChanged: (value) {
                        setState(() {
                          _changeTheme(context);
                        });
                      },
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    icons: Icons.style_outlined,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.orange.withOpacity(.7),
                    ),
                    title: 'عرض الملف',
                    subtitle: _getOrientation(context),
                    trailing: Switch.adaptive(
                      value: _isPortrait(),
                      onChanged: (value) {
                        setState(() {
                          _changeOrientation(context);
                        });
                      },
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "الحساب",
                items: [
                  SettingsItem(
                    onTap: () async {
                      await _logout();
                    },
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor:
                          Colors.deepOrange.withOpacity(.7).withOpacity(.7),
                    ),
                    icons: IconlyLight.logout,
                    title: "تسجيل الخروج",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logout() async {
    await EasyLoading.show();
    await sl<AuthFacade>().logout();
    await EasyLoading.dismiss();
  }

  _changeTheme(BuildContext context) {
    var themeManager = AdaptiveTheme.of(context);
    if (themeManager.mode.isDark) {
      themeManager.setLight();
    } else {
      themeManager.setDark();
    }
  }

  _getTheme(BuildContext context) {
    var themeManager = AdaptiveTheme.of(context);
    String theme = 'الوضع الحالي : ';
    if (themeManager.mode.isDark) {
      return '$themeالليلي';
    } else {
      return '$themeالنهاري';
    }
  }

  _changeOrientation(BuildContext context) {
    final storage = sl<IStorageService>();
    final isPortrait = storage.getBool('isPortrait-PDF') ?? false;
    storage.setBool('isPortrait-PDF', !isPortrait);
  }

  bool _isPortrait() {
    final storage = sl<IStorageService>();
    final isPortrait = storage.getBool('isPortrait-PDF') ?? false;
    return isPortrait;
  }

  _getOrientation(BuildContext context) {
    String orientation = 'الوضع الحالي : ';
    final storage = sl<IStorageService>();
    final isPortrait = storage.getBool('isPortrait-PDF') ?? false;
    if (isPortrait) {
      return '$orientationالعمودي';
    } else {
      return '$orientationالافقي';
    }
  }
}
