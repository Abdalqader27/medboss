import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:medboss/core/ads/widgets/rewarded.dart';
import 'package:medboss/resources/resources.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'about-screen';
  static const name = 'about_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const AboutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('عن التطبيق'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsConstrains.listView,
        child: Column(
          children: [
            SvgPicture.asset(
              theme.brightness == Brightness.light
                  ? LogoRes.lightLogo
                  : LogoRes.darkLogo,
              height: 200,
              width: 200,
            ),
            Space.vl,
            const YouText.bodyMedium(
              "فريق مكون من مجموعة من الخريجين الاوائل على مستوى القطر بهدف تأمين مصادر دراسية كافية وموثوقة للامتحان الوطني",
              textAlign: TextAlign.center,
            ),
            const YouText.bodyMedium(
              "التطبيق يتيح إمكانية الدراسة الكترونياً PDF بسلاسة وسهولة لجميع أعمال وإصدارات الفريق نتمنى لكم تجربة ممتعة ودراسة موفقة ❤️❤️",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
