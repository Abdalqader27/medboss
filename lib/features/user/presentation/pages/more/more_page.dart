import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:iconly/iconly.dart';
import 'package:medboss/features/collage/presentation/pages/select_collage/select_collage_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/ads/widgets/banner.dart';
import '../about/about_screen.dart';
import '../settings/settings_screen.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'more-page';
  static const name = 'More';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return NoTransitionPage<void>(
      key: state.pageKey,
      child: const MorePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBanner(
      child: SingleChildScrollView(
        padding: EdgeInsetsConstrains.listView,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(IconlyLight.scan),
                trailing: const Icon(IconlyLight.arrow_left_2),
                title: const Text('تحديد الكلية'),
                onTap: () {
                  context.push(SelectCollageScreen.path);
                },
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(IconlyLight.setting),
                    trailing: const Icon(IconlyLight.arrow_left_2),
                    title: const Text('الاعدادات'),
                    onTap: () {
                      context.push(SettingsScreen.path);
                    },
                  ),
                  ListTile(
                    leading: const Icon(IconlyLight.send),
                    trailing: const Icon(IconlyLight.arrow_left_2),
                    title: const Text('مشاركة التطبيق'),
                    onTap: () async {
                      Share.share(
                          'Try to download the app from => https://play.google.com/store/apps/details?id=com.abdalqader27.medboss');
                    },
                  ),
                  ListTile(
                    leading: const Icon(IconlyLight.paper_plus),
                    trailing: const Icon(IconlyLight.arrow_left_2),
                    title: const Text('نقاط البيع'),
                    onTap: () {
                      _showStorePlace(context);
                    },
                  ),
                ],
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(IconlyLight.info_square),
                trailing: const Icon(IconlyLight.arrow_left_2),
                title: const Text('عن التطبيق'),
                onTap: () {
                  context.push(AboutScreen.path);
                },
              ),
            ),
          ].addSpacing(Space.vm),
        ),
      ),
    );
  }

  _generateCode(int i) async {
    var dietPlan = ParseObject('Codes')..set('isActivated', false);
    var response = await dietPlan.save();
    if (response.success) {
      print("Code-$i is : ${response.result['objectId']}");
    }
  }

  Future<void> _showStorePlace(context) {
    return showGeneralDialog(
        context: context,
        transitionDuration: const Duration(milliseconds: 340),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        // DURATION FOR ANIMATION
        barrierLabel: 'showFavChoice',
        barrierColor: Colors.black.withOpacity(0.1),

        //SHADOW EFFECT
        barrierDismissible: true,
        pageBuilder: (context, a1, a2) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)), //this right here
            child: SizedBox(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right: 10, top: 0, left: 10, bottom: 15),
                            child: Text(
                              "مراكز الشراء ",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 10, top: 0, left: 10, bottom: 10),
                            child: Text(
                              "للحصول على الأكواد التواصل على حساب الدعم التقني أو بوت الفريق والدفع الكتروني من خلال سيرتيل كاش لتسهيل آلية الاشتراك",
                              style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500,
                                //                  color: Colors.black54,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 10, top: 0, left: 10, bottom: 10),
                            child: Text(
                              "أما مراكز توافر أعمال الفريق ورقيا",
                              style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500,
                                //                  color: Colors.black54,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "#دمشق بمكتبة #أوكسجين",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    //                  color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "#تشرين: مكتبة اليسار  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    //                  color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "#حلب: مكتبة الكشاف + مركز التصوي",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    //                  color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "#حمص: طريف + الطب + أسامة",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    //                  color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),           ListTile(
                            title: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "#حماة: مكتبة"" Friends",

                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    //                  color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "#طرطوس  مكتبة الجامعة",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    //                  color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
