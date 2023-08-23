import 'package:go_router/go_router.dart';
import 'package:design/design.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'favourite-screen';
  static const name = 'favourite_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const FavouriteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
