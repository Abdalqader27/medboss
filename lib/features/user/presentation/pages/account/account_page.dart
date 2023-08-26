import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:medboss/core/ads/widgets/banner.dart';

import '../../../../collage/presentation/pages/select_collage/select_collage_screen.dart';
import '../profile/profile_screen.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'account-page';
  static const name = 'account_page';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return NoTransitionPage<void>(
      key: state.pageKey,
      child: const AccountPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ProfileScreen(),
        Expanded(child: SelectCollageScreen()),
      ],
    );
  }
}
