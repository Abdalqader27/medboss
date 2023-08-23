import 'package:go_router/go_router.dart';
import 'package:design/design.dart';

import '../../../../collage/presentation/pages/select_collage/select_collage_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'profile-screen';
  static const name = 'profile_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('الملف الشخصي'),
          onTap: () {
            context.go(ProfileScreen.path);
          },
        ),
      ],
    );
  }
}
