import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:iconly/iconly.dart';
import 'package:medboss/features/user/presentation/pages/account/account_page.dart';
import 'package:medboss/features/user/presentation/pages/more/more_page.dart';
import '../../../../file/presentation/pages/bot_folder_page/bot_folder_page.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({
    Key? key,
    required this.child,
    required this.location,
  }) : super(key: key);

  static const name = 'root_screen';

  static const ValueKey pageKey = ValueKey(name);
  final Widget child;
  final String location;

  static Page pageBuilder(context, state, child) {
    return NoTransitionPage<void>(
      key: state.pageKey,
      child: RootScreen(
        location: state.location,
        child: child,
      ),
    );
  }

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: const <NavigationDestination>[
          // NavigationDestination(
          //   selectedIcon: Icon(IconlyBold.home),
          //   icon: Icon(IconlyLight.home),
          //   label: 'الرئيسية',
          // ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.folder),
            icon: Icon(IconlyLight.folder),
            label: 'الملفات',
          ),
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.more_square),
            icon: Icon(IconlyLight.more_square),
            label: 'المزيد',
          ),
        ],
      ),
    );
  }

  _onDestinationSelected(int index) {
    if (index == selectedPageIndex) return;
    setState(
      () => selectedPageIndex = index,
    );

    String location = _getLocation(index);
    context.go(location);
  }

  String _getLocation(int index) {
    switch (index) {
      // case 0:
      //   return HomePage.path;
      case 0:
        return BotFolderPage.path;

      case 1:
        return MorePage.path;
    }
    return '';
  }
}
