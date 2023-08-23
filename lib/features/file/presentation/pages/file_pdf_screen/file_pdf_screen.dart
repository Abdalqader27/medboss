import 'package:go_router/go_router.dart';
import 'package:design/design.dart';

class FilePdfScreen extends StatelessWidget {
  const FilePdfScreen({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'file-pdf';
  static const name = 'file_pdf_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const FilePdfScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
